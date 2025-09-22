Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E5B91370
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025210E46A;
	Mon, 22 Sep 2025 12:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com
 [209.85.166.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE3D10E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 12:50:34 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-42571841b59so38592775ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 05:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758545433; x=1759150233;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7FJVEO2JSEInNaIAVfqXuJ582DXJMN71NIxbYU3RqcA=;
 b=pjth8L2TwenBeRkFARmVf16ljLddaEMjUByWNeyZqg0ub8oB59G3YXPobJe3ObJ5+6
 2OHpGxMo+yNcLXdU16ZV8/qh/JtDwIQ/D9HJikh+YwZRgp+gdVuosjGNYzx7IX3zxrxc
 nZECOfzCP3DL8fDHUf82lB0cszXmVWYLpVKAo5GGRqNImGN3jMOtpZNuL+xLfNKnUAI9
 R2uGqwSclLQmpcQWVxEX8JMwJye1pu5OpngCCvLsLoNbfBDLPgv5dpcv7SZDqF0SEhUx
 9JTF5Mzw4EYzSqHcMYvSUkS+7qAQzR5XUZ0mONsSZ8kvH3XwZRX9t0Xs5wnXDjZiDS4m
 EqmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsGZntxt3xrxjoOcLxkVwoGhoiGeWjwUPgBjyHWjLRNTBZyA+NGQduhmE9kexUOLyxw8MtR4E4x74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUighJwLV46yAnrdtbi1nNZd5gZCFMDJGlVurb+97P9AXbZ8NH
 Qapa3dLVx9HsSsLWWv5ZgCCVyMUTdm7cUCifDQGxbEgEiSIafV3IARrMOd9MxdgnMbSi9YOpdxx
 bhzr7rRfTw5GFRFsVTdse6siw0p8//vdmWcB9Wk9Gh00ZFnDxibbqBWI4Q7Y=
X-Google-Smtp-Source: AGHT+IHYpBtAyVXLokHcOTao6pfLrHb+XMXkLtI9C6fT1fK39oMs+hOhy4hVdkZNjyscp1qCAvz8YoVixCrJdLEG3gOum3gFSBE4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1489:b0:421:7d1:7af8 with SMTP id
 e9e14a558f8ab-424819a21a9mr188902185ab.26.1758545433518; Mon, 22 Sep 2025
 05:50:33 -0700 (PDT)
Date: Mon, 22 Sep 2025 05:50:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d14619.a00a0220.37dadf.0049.GAE@google.com>
Subject: [syzbot] [fbdev?] KASAN: slab-out-of-bounds Read in soft_cursor (2)
From: syzbot <syzbot+ae44b38396335bd847cd@syzkaller.appspotmail.com>
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

HEAD commit:    f83ec76bf285 Linux 6.17-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17147b12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f01d8629880e620
dashboard link: https://syzkaller.appspot.com/bug?extid=ae44b38396335bd847cd
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f83ec76b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bdedf70f8797/vmlinux-f83ec76b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5bf9318d9242/bzImage-f83ec76b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ae44b38396335bd847cd@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in soft_cursor+0x458/0xa10 drivers/video/fbdev/core/softcursor.c:70
Read of size 3 at addr ffff888054a70d7d by task kworker/2:2/3582

CPU: 2 UID: 0 PID: 3582 Comm: kworker/2:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_power_efficient fb_flashcursor
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 soft_cursor+0x458/0xa10 drivers/video/fbdev/core/softcursor.c:70
 bit_cursor+0xe8c/0x17e0 drivers/video/fbdev/core/bitblit.c:370
 fb_flashcursor drivers/video/fbdev/core/fbcon.c:408 [inline]
 fb_flashcursor+0x30d/0x400 drivers/video/fbdev/core/fbcon.c:377
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:463
 ret_from_fork+0x56a/0x730 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 10710:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:388 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:405
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4376 [inline]
 __kmalloc_noprof+0x223/0x510 mm/slub.c:4388
 kmalloc_noprof include/linux/slab.h:909 [inline]
 fbcon_set_font+0x434/0xb80 drivers/video/fbdev/core/fbcon.c:2536
 con_font_set drivers/tty/vt/vt.c:4887 [inline]
 con_font_op+0x7fb/0xf50 drivers/tty/vt/vt.c:4934
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x48f/0x30a0 drivers/tty/vt/vt_ioctl.c:751
 tty_ioctl+0x661/0x1680 drivers/tty/tty_io.c:2792
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888054a70800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 621 bytes to the right of
 allocated 784-byte region [ffff888054a70800, ffff888054a70b10)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x54a70
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b842dc0 ffffea0000d94e00 dead000000000002
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b842dc0 ffffea0000d94e00 dead000000000002
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001529c01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 12, tgid 12 (kworker/u32:0), ts 114834271157, free_ts 113350555070
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x132b/0x38e0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:5148
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2492 [inline]
 allocate_slab mm/slub.c:2660 [inline]
 new_slab+0x247/0x330 mm/slub.c:2714
 ___slab_alloc+0xcf2/0x1750 mm/slub.c:3901
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3992
 __slab_alloc_node mm/slub.c:4067 [inline]
 slab_alloc_node mm/slub.c:4228 [inline]
 __do_kmalloc_node mm/slub.c:4375 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4388
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 neigh_alloc net/core/neighbour.c:522 [inline]
 ___neigh_create+0x14e6/0x28c0 net/core/neighbour.c:656
 ip6_finish_output2+0x1299/0x2020 net/ipv6/ip6_output.c:132
 __ip6_finish_output+0x3cd/0x1010 net/ipv6/ip6_output.c:215
 ip6_finish_output net/ipv6/ip6_output.c:226 [inline]
 NF_HOOK_COND include/linux/netfilter.h:307 [inline]
 ip6_output+0x1ca/0x3e0 net/ipv6/ip6_output.c:248
 dst_output include/net/dst.h:461 [inline]
 NF_HOOK include/linux/netfilter.h:318 [inline]
 ndisc_send_skb+0xa66/0x1e30 net/ipv6/ndisc.c:512
 ndisc_send_rs+0x129/0x670 net/ipv6/ndisc.c:722
 addrconf_dad_completed+0x49d/0x10d0 net/ipv6/addrconf.c:4360
 addrconf_dad_work+0x855/0x14e0 net/ipv6/addrconf.c:4268
page last free pid 60 tgid 60 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0x7d5/0x10f0 mm/page_alloc.c:2895
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_kmalloc+0x8a/0xb0 mm/kasan/common.c:396
 kmalloc_noprof include/linux/slab.h:905 [inline]
 netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:664 [inline]
 netdevice_event+0x365/0x9d0 drivers/infiniband/core/roce_gid_mgmt.c:823
 notifier_call_chain+0xb9/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2229
 call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
 call_netdevice_notifiers net/core/dev.c:2281 [inline]
 unregister_netdevice_many_notify+0xf76/0x24c0 net/core/dev.c:12166
 unregister_netdevice_many net/core/dev.c:12229 [inline]
 default_device_exit_batch+0x853/0xaf0 net/core/dev.c:12733
 ops_exit_list net/core/net_namespace.c:204 [inline]
 ops_undo_list+0x360/0xab0 net/core/net_namespace.c:251
 cleanup_net+0x408/0x890 net/core/net_namespace.c:682
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:463
 ret_from_fork+0x56a/0x730 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888054a70c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888054a70c80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888054a70d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                                ^
 ffff888054a70d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888054a70e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
