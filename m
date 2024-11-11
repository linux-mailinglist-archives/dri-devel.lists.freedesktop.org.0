Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213479C3B00
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 10:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A31610E455;
	Mon, 11 Nov 2024 09:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1810E455
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 09:38:25 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-83abe8804a5so473811639f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 01:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731317904; x=1731922704;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2fMry5KBVwMZe9quyl6EG8F0EZX5XU7mvooyI6GyqY=;
 b=E24TIejg3I4GG31okkif/p/hy6RFcuaLV/xkBOwSJ4uDuchb/+bwW1TSxd8CEuKEVR
 LCHvotk9oXDwfITGYrSJMI51lrpDn7kffD+XiWfDQAiT6qZx/QWhcQOiiYyrB9fHmRbU
 kO31C1iC+ATvdxfKVqqLQ0ef/s6hAjY+JRDorTo5Xo74HXRPoA4hbT9zIkST1zRPTDuz
 2BpVLUAMk371WhDNeZdL0sEhrNEzR9GB+2h4x0rPfWTxnJxinIz096nXHI4dU1VX4+Fi
 wcKYR41N2MMA+uETjK3lA8KSVeyGXVmFbBz3lzFrNoNFhOUfEDf6GpHNDhrwDAA0zdIO
 7olQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVeFhBzuA/z2svlCs0yIyYfl0I8U2GQBTQ/g3aNaN3PBXwOF4nlXvrKPf4UqQwAqbg4A835pVV174=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw1JdPci80PJzknPygvZMbaJ14iGiPY7KDTuy4v5B9/0/fZQZz
 +LNT9sj3wTOqC60c+2x7U19B5am81bhcFKaUyesVdUs6RAp8jCAk3mN/VNePkdKYDwidDahAbCj
 eTPhpJ7MGBCWnuHPkJe8TYR7iAshmv2aIGmkQ5u8zrlT9ZYh37XmYcss=
X-Google-Smtp-Source: AGHT+IFAJAHxoHS3qWPCQlE6LiNAwKKcDTO/MZl5LjxmHPa5vGBpjE0yu8BWhSE6SIeabucv6QcpsXFqdN/iFqyo/YW3ysVPJsmV
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18c7:b0:3a0:49da:8f6d with SMTP id
 e9e14a558f8ab-3a6f1a44f1amr128696695ab.22.1731317904492; Mon, 11 Nov 2024
 01:38:24 -0800 (PST)
Date: Mon, 11 Nov 2024 01:38:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6731d090.050a0220.138bd5.0061.GAE@google.com>
Subject: [syzbot] [fbdev?] KASAN: slab-out-of-bounds Read in
 fb_pad_unaligned_buffer (2)
From: syzbot <syzbot+6649e4a17d8ebca21a28@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, simona@ffwll.ch, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    6efbea77b390 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=144e8c5f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c9b3fd66df7ebb7
dashboard link: https://syzkaller.appspot.com/bug?extid=6649e4a17d8ebca21a28
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-6efbea77.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fe29ba490b2c/vmlinux-6efbea77.xz
kernel image: https://storage.googleapis.com/syzbot-assets/08bf31ef1152/bzImage-6efbea77.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6649e4a17d8ebca21a28@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in fb_pad_unaligned_buffer+0x43c/0x470 drivers/video/fbdev/core/fbmem.c:116
Read of size 1 at addr ffff888041c73758 by task syz.3.3711/20535

CPU: 2 UID: 0 PID: 20535 Comm: syz.3.3711 Not tainted 6.12.0-rc3-syzkaller-00183-g6efbea77b390 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 fb_pad_unaligned_buffer+0x43c/0x470 drivers/video/fbdev/core/fbmem.c:116
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:130 [inline]
 bit_putcs+0x86a/0xdf0 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x364/0x480 drivers/video/fbdev/core/fbcon.c:1308
 do_update_region+0x1f8/0x3f0 drivers/tty/vt/vt.c:609
 update_region+0xc1/0x160 drivers/tty/vt/vt.c:633
 vcs_write+0x7cd/0xdb0 drivers/tty/vt/vc_screen.c:698
 do_loop_readv_writev fs/read_write.c:857 [inline]
 do_loop_readv_writev fs/read_write.c:842 [inline]
 vfs_writev+0x6da/0xdd0 fs/read_write.c:1066
 do_writev+0x137/0x370 fs/read_write.c:1111
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f20a6d7dff9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f20a7aa2038 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007f20a6f36058 RCX: 00007f20a6d7dff9
RDX: 0000000000000004 RSI: 0000000020000a40 RDI: 0000000000000007
RBP: 00007f20a6df0296 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f20a6f36058 R15: 00007ffc5a9e3328
 </TASK>

Allocated by task 18704:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:257 [inline]
 __do_kmalloc_node mm/slub.c:4264 [inline]
 __kmalloc_noprof+0x1e8/0x400 mm/slub.c:4276
 kmalloc_noprof include/linux/slab.h:882 [inline]
 fbcon_set_font+0x434/0xb60 drivers/video/fbdev/core/fbcon.c:2516
 con_font_set drivers/tty/vt/vt.c:4804 [inline]
 con_font_op+0x7fd/0xf50 drivers/tty/vt/vt.c:4851
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x4ca/0x2f80 drivers/tty/vt/vt_ioctl.c:751
 tty_ioctl+0x651/0x15d0 drivers/tty/tty_io.c:2803
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18f/0x220 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888041c70000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 6728 bytes to the right of
 allocated 7440-byte region [ffff888041c70000, ffff888041c71d10)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888041c74000 pfn:0x41c70
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801b043180 ffffea0001265810 ffffea000151d410
raw: ffff888041c74000 0000000000020001 00000001f5000000 0000000000000000
head: 00fff00000000240 ffff88801b043180 ffffea0001265810 ffffea000151d410
head: ffff888041c74000 0000000000020001 00000001f5000000 0000000000000000
head: 00fff00000000003 ffffea0001071c01 ffffffffffffffff 0000000000000000
head: ffff888000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd28c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5055, tgid 5055 (dhcpcd), ts 868171753255, free_ts 868153154119
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1537
 prep_new_page mm/page_alloc.c:1545 [inline]
 get_page_from_freelist+0x101e/0x3070 mm/page_alloc.c:3457
 __alloc_pages_noprof+0x223/0x25a0 mm/page_alloc.c:4733
 alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:2412 [inline]
 allocate_slab mm/slub.c:2578 [inline]
 new_slab+0x2ba/0x3f0 mm/slub.c:2631
 ___slab_alloc+0xdac/0x1880 mm/slub.c:3818
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3908
 __slab_alloc_node mm/slub.c:3961 [inline]
 slab_alloc_node mm/slub.c:4122 [inline]
 __do_kmalloc_node mm/slub.c:4263 [inline]
 __kmalloc_node_track_caller_noprof+0x355/0x430 mm/slub.c:4283
 kmalloc_reserve+0xef/0x2c0 net/core/skbuff.c:609
 __alloc_skb+0x164/0x380 net/core/skbuff.c:678
 alloc_skb include/linux/skbuff.h:1322 [inline]
 netlink_dump+0x2c1/0xcc0 net/netlink/af_netlink.c:2292
 netlink_recvmsg+0xa0d/0xf30 net/netlink/af_netlink.c:1983
 sock_recvmsg_nosec net/socket.c:1051 [inline]
 sock_recvmsg+0x1f6/0x250 net/socket.c:1073
 ____sys_recvmsg+0x219/0x6b0 net/socket.c:2826
 ___sys_recvmsg+0x115/0x1a0 net/socket.c:2868
 __sys_recvmsg+0x114/0x1e0 net/socket.c:2898
page last free pid 18495 tgid 18495 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1108 [inline]
 free_unref_page+0x5f4/0xdc0 mm/page_alloc.c:2638
 __put_partials+0x14c/0x170 mm/slub.c:3145
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:247 [inline]
 slab_post_alloc_hook mm/slub.c:4085 [inline]
 slab_alloc_node mm/slub.c:4134 [inline]
 __kmalloc_cache_noprof+0x11e/0x300 mm/slub.c:4290
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 ref_tracker_alloc+0x17c/0x5b0 lib/ref_tracker.c:203
 __netdev_tracker_alloc include/linux/netdevice.h:4050 [inline]
 netdev_hold include/linux/netdevice.h:4079 [inline]
 netdev_hold include/linux/netdevice.h:4074 [inline]
 register_netdevice+0x164b/0x1e90 net/core/dev.c:10511
 veth_newlink+0x366/0x9e0 drivers/net/veth.c:1830
 rtnl_newlink_create net/core/rtnetlink.c:3539 [inline]
 __rtnl_newlink+0x1197/0x1920 net/core/rtnetlink.c:3759
 rtnl_newlink+0x67/0xa0 net/core/rtnetlink.c:3772
 rtnetlink_rcv_msg+0x3c7/0xea0 net/core/rtnetlink.c:6675
 netlink_rcv_skb+0x16b/0x440 net/netlink/af_netlink.c:2551
 netlink_unicast_kernel net/netlink/af_netlink.c:1331 [inline]
 netlink_unicast+0x53c/0x7f0 net/netlink/af_netlink.c:1357
 netlink_sendmsg+0x8b8/0xd70 net/netlink/af_netlink.c:1901
 sock_sendmsg_nosec net/socket.c:729 [inline]
 __sock_sendmsg net/socket.c:744 [inline]
 __sys_sendto+0x479/0x4d0 net/socket.c:2214

Memory state around the buggy address:
 ffff888041c73600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888041c73680: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888041c73700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                    ^
 ffff888041c73780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888041c73800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
