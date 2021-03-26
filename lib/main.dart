import 'package:flutter/material.dart';
import 'dart:async';

// Package from my git repo
import 'package:tcp_scanner/tcp_scanner.dart';
// LINK :- https://github.com/xanf-code/tcp_scanner.git

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // Calls Method scanPorts from package https://github.com/xanf-code/tcp_scanner.git [imported in pubspec.yaml]
          scanPorts();
        },
      ),
    );
  }
}

scanPorts() {
  //HAI RAGHAV, YOUR PORT GOES HERE USE CONTROLLER TO GET DYNAMIC PORTS FROM USERS

  // -- PORT DESC -- //
  //8080 - OnePlus Port - Must be open
  //80 - HTTP - Must be opened
  // 4437 - Appa Mobile - Must be closed
  // -- PORT DESC -- //

  TCPScanner("localhost", [80, 8080, 4437]).scan().then((result) {
    print('''
        HTTP ports scan result
        Host:          ${result.host}
        Scanned ports: ${result.ports}
        Open ports:    ${result.open}
        Closed ports:  ${result.closed}
    ''');
  });
}
