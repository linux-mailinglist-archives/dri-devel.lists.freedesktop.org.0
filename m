Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB711FFC3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8C96E43B;
	Mon, 16 Dec 2019 08:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2DA89CF9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 20:35:10 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id e15so4325233ioh.15
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 12:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=vCeIGudgCVzVtDClTVtamE+2MjDf0OYRK93EKlgnM94=;
 b=FtwQsm/2P0z7Ux0MuBrF6rcSWAFZGyzGZ5lVwekikhEqNiHLRWYYy8FIorDj/4sTYy
 GqPeOD3Gba2XfRlrN4MypO/BTCSA25yc2Rnxbsid+3rMCl5ipoFVNgsNAiJa3NaJdFz2
 Nq1CGr2hDAHDMhPeatGYAPrG8ryIW7cuzOLbLU4JgyeqZunoDrdZ4VYOO4gGsk8C+cwC
 ZPvgRqEXKOyWEOKrkpt9iKbzf07oRFt6ObZG20zctvEG7FGJPkQ68b2Yde4MGoCo330k
 Msiruw3QLtnbMIZQy/OqskTp+vSWjOWd065WZmJ55a7RTlT9sEBCrHeIg0WwtfC+9TxA
 bPSA==
X-Gm-Message-State: APjAAAWI9+ED2B4+cmdmDFqreKoNwIVAqSu3fd+TRi/1cBZLNz2EDV7g
 OTJCwoM1QYuTwC97KcNfHgN6IilZJaqRWYzOnBWOOGKtAZs3
X-Google-Smtp-Source: APXvYqw1jqxCI+YeO8FJYnKqamQPTdtR1NMgf7Skx87R1i9IkpSLJ9b9vSY6iYXyhKSP3smM0FNtnXdQfOExQ/IE9SyJYl1upS+r
MIME-Version: 1.0
X-Received: by 2002:a5d:8498:: with SMTP id t24mr15986136iom.164.1576442109907; 
 Sun, 15 Dec 2019 12:35:09 -0800 (PST)
Date: Sun, 15 Dec 2019 12:35:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f85c120599c407e4@google.com>
Subject: KASAN: use-after-free Read in fbcon_cursor
From: syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following crash on:

HEAD commit:    07c4b9e9 Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b61f41e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79f79de2a27d3e3d
dashboard link: https://syzkaller.appspot.com/bug?extid=9116ecc1978ca3a12f43
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119fa6b6e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in fbcon_cursor+0x4ef/0x660  
drivers/video/fbdev/core/fbcon.c:1380
Read of size 2 at addr ffff8880959ff0cc by task syz-executor.0/10203

CPU: 1 PID: 10203 Comm: syz-executor.0 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  __asan_report_load2_noabort+0x14/0x20 mm/kasan/generic_report.c:133
  fbcon_cursor+0x4ef/0x660 drivers/video/fbdev/core/fbcon.c:1380
  fbcon_scrolldelta+0x679/0x1220 drivers/video/fbdev/core/fbcon.c:2877
  fbcon_set_origin+0x43/0x50 drivers/video/fbdev/core/fbcon.c:2928
  set_origin+0xf3/0x400 drivers/tty/vt/vt.c:919
  vc_do_resize+0xacc/0x1460 drivers/tty/vt/vt.c:1264
  vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
  vt_ioctl+0x14bb/0x26d0 drivers/tty/vt/vt_ioctl.c:840
  tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a909
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f1a84ca0c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a909
RDX: 0000000020000000 RSI: 0000000000005609 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f1a84ca16d4
R13: 00000000004c7009 R14: 00000000004dd670 R15: 00000000ffffffff

Allocated by task 9734:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  __kasan_kmalloc mm/kasan/common.c:513 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
  __do_kmalloc mm/slab.c:3656 [inline]
  __kmalloc+0x163/0x770 mm/slab.c:3665
  kmalloc include/linux/slab.h:561 [inline]
  kzalloc include/linux/slab.h:670 [inline]
  vc_do_resize+0x262/0x1460 drivers/tty/vt/vt.c:1187
  vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
  vt_ioctl+0x14bb/0x26d0 drivers/tty/vt/vt_ioctl.c:840
  tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 10203:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  kasan_set_free_info mm/kasan/common.c:335 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
  __cache_free mm/slab.c:3426 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3757
  vc_do_resize+0xa69/0x1460 drivers/tty/vt/vt.c:1261
  vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
  vt_ioctl+0x14bb/0x26d0 drivers/tty/vt/vt_ioctl.c:840
  tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8880959ff0c0
  which belongs to the cache kmalloc-32 of size 32
The buggy address is located 12 bytes inside of
  32-byte region [ffff8880959ff0c0, ffff8880959ff0e0)
The buggy address belongs to the page:
page:ffffea0002567fc0 refcount:1 mapcount:0 mapping:ffff8880aa4001c0  
index:0xffff8880959fffc1
raw: 00fffe0000000200 ffffea00027c7748 ffffea000276ee08 ffff8880aa4001c0
raw: ffff8880959fffc1 ffff8880959ff000 000000010000003f 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880959fef80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8880959ff000: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
> ffff8880959ff080: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
                                               ^
  ffff8880959ff100: 00 01 fc fc fc fc fc fc fb fb fb fb fc fc fc fc
  ffff8880959ff180: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
