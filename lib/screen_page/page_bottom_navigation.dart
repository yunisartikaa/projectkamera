import 'package:flutter/material.dart';
import 'package:projectkamera/screen_page/page_akses_kamera.dart';
import 'package:projectkamera/screen_page/page_maps.dart';

class PageBottomNavigationBar extends StatefulWidget {
  const PageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<PageBottomNavigationBar> createState() =>
      _PageBottomNavigationBarState();
}

class _PageBottomNavigationBarState extends State<PageBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // handle tap
        },
        child: TabBarView(
          controller: tabController,
          children: [
            AksesKamera(),
            MapsFlutter(), // Tambahkan MapsFlutter ke dalam daftar anak TabBarView
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabController.index,
        onTap: (index) {
          tabController.animateTo(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt), // Menggunakan ikon kamera
            label: 'Kamera',
            activeIcon: Icon(Icons.camera_alt, color: Colors.blueAccent),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map), // Menggunakan ikon peta
            label: 'Peta',
            activeIcon: Icon(Icons.map, color: Colors.blueAccent),
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}