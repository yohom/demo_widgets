import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';

class FunctionGroup extends StatefulWidget {
  const FunctionGroup({
    Key key,
    @required this.headLabel,
    this.opened = false,
    this.children = const [],
  }) : super(key: key);

  final String headLabel;
  final bool opened;
  final List<Widget> children;

  @override
  _FunctionGroupState createState() => _FunctionGroupState();
}

class _FunctionGroupState extends State<FunctionGroup> {
  bool _opened;

  @override
  void initState() {
    super.initState();
    _opened = widget.opened;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DecoratedColumn(
            onPressed: _handleToggle,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DecoratedRow(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  Text(
                    widget.headLabel,
                    style: Theme.of(context).textTheme.headline,
                  ),
                  Spacer(),
                  Icon(
                    _opened
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                  SPACE_8_HORIZONTAL,
                ],
              ),
              Divider(height: 1, indent: 16),
            ],
          ),
          if (_opened) ...widget.children,
        ],
      ),
    );
  }

  void _handleToggle(BuildContext context) {
    setState(() {
      _opened = !_opened;
    });
  }
}
