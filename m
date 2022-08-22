Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1E59BC51
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 11:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5559C113E65;
	Mon, 22 Aug 2022 09:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8664C113E65
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 09:09:32 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 c7-20020a056e020bc700b002e59be6ce85so7907864ilu.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 02:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5fuT+q3jRQhVdVUK3P+aRK+U06XdPv6lq28/ejdp4ic=;
 b=7DmjcGpUeedp9ibuYKypWnqoCdM3DDdE7Zv5ft4RF3Gu4nDl5o827bTuY8wSdqSch8
 HR7JKrWR4vjGFAVjuPosTd82MhW/5nF6ipjhSlb0T4kCc22Ol11geLDXewJQpYcRzkqJ
 CMQpkLPBLoFgbljZtyZNJwOpEFNGXNMiXl6G+iFWkq1o1yo/LyUzT6v003tYRZfhUZrS
 zlaHt7inGIgaBU/Ekoile2snbwLOA/d7KtXCCDaDQMrzC2kbjd/RgmZsjzIcJlk1VPe0
 r5PfGERpJB1pB+BcVdOmtyE+X36FKnPavZ6bpxvlcmaKCu5tA7BcxFiKIHYa9s3nNQnI
 Ymng==
X-Gm-Message-State: ACgBeo1E1lKp63Vesvfffj1Oo4B5gH94AKpFvpw15F3vMT8s43wuQXug
 4sSGQoIAKMmy3QlxY/TYKNYOjWmz6UB8NE1Xwsh852qGvudv
X-Google-Smtp-Source: AA6agR4qPccZHg4Tc6VzGZ5lP7p6VRwR3C1UfOnXnsSjFdvc8KHkCQrkyBJdv2x/JWNPmD4S3m1tVQucfLGzHYbqfv9iFIwMXkU/
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1a9:b0:349:cef1:168f with SMTP id
 b9-20020a05663801a900b00349cef1168fmr3035961jaq.238.1661159371656; Mon, 22
 Aug 2022 02:09:31 -0700 (PDT)
Date: Mon, 22 Aug 2022 02:09:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043579605e6d0ce41@google.com>
Subject: [syzbot] KASAN: use-after-free Read in udl_get_urb_timeout
From: syzbot <syzbot+f24934fe125a19d77eae@syzkaller.appspotmail.com>
To: airlied@linux.ie, airlied@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sean@poorly.run, syzkaller-bugs@googlegroups.com, tiwai@suse.de, 
 tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

HEAD commit:    5b6a4bf680d6 Add linux-next specific files for 20220818
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D12341a3d080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dead6107a3bbe3c6=
2
dashboard link: https://syzkaller.appspot.com/bug?extid=3Df24934fe125a19d77=
eae
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils=
 for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1273186708000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D165b64f3080000

The issue was bisected to:

commit e25d5954264d1871ab2792c7ca2298b811462500
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Aug 4 07:58:25 2022 +0000

    drm/udl: Kill pending URBs at suspend and disconnect

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1393a8eb0800=
00
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1053a8eb0800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1793a8eb080000

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+f24934fe125a19d77eae@syzkaller.appspotmail.com
Fixes: e25d5954264d ("drm/udl: Kill pending URBs at suspend and disconnect"=
)

[drm:udl_init.cold] *ERROR* Unrecognized vendor firmware descriptor
[drm:udl_init] *ERROR* Selecting channel failed
[drm] Initialized udl 0.0.1 20120220 for 1-1:0.0 on minor 2
[drm] Initialized udl on minor 2
[drm:udl_get_edid_block] *ERROR* Read EDID byte 0 failed err ffffffb9
udl 1-1:0.0: [drm] Cannot find any crtc or sizes
usb 1-1: USB disconnect, device number 2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in __list_add_valid+0x93/0xb0 lib/list_debug.c:2=
7
Read of size 8 at addr ffff8880756fce88 by task kworker/0:2/146

CPU: 0 PID: 146 Comm: kworker/0:2 Not tainted 6.0.0-rc1-next-20220818-syzka=
ller #0
kworker/0:2[146] cmdline: =EF=BF=BD=EF=BF=BDa=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=01
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 07/22/2022
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:122 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:140
 print_address_description mm/kasan/report.c:317 [inline]
 print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
 kasan_report+0xb1/0x1e0 mm/kasan/report.c:495
 __list_add_valid+0x93/0xb0 lib/list_debug.c:27
 __list_add include/linux/list.h:69 [inline]
 list_add include/linux/list.h:88 [inline]
 list_move include/linux/list.h:218 [inline]
 udl_get_urb_timeout+0x20e/0x550 drivers/gpu/drm/udl/udl_main.c:250
 udl_free_urb_list+0x15f/0x250 drivers/gpu/drm/udl/udl_main.c:156
 udl_drop_usb+0xd0/0x160 drivers/gpu/drm/udl/udl_main.c:358
 udl_usb_disconnect+0x3f/0x50 drivers/gpu/drm/udl/udl_drv.c:114
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:520 [inline]
 device_remove+0x11f/0x170 drivers/base/dd.c:512
 __device_release_driver drivers/base/dd.c:1209 [inline]
 device_release_driver_internal+0x4a1/0x700 drivers/base/dd.c:1235
 bus_remove_device+0x2e3/0x590 drivers/base/bus.c:529
 device_del+0x4f3/0xc80 drivers/base/core.c:3704
 usb_disable_device+0x356/0x7a0 drivers/usb/core/message.c:1419
 usb_disconnect.cold+0x259/0x6ed drivers/usb/core/hub.c:2235
 hub_port_connect drivers/usb/core/hub.c:5197 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x1f86/0x4610 drivers/usb/core/hub.c:5735
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 process_scheduled_works kernel/workqueue.c:2352 [inline]
 worker_thread+0x854/0x1080 kernel/workqueue.c:2438
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>

Allocated by task 146:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:437 [inline]
 ____kasan_kmalloc mm/kasan/common.c:516 [inline]
 ____kasan_kmalloc mm/kasan/common.c:475 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:525
 kmalloc include/linux/slab.h:606 [inline]
 kzalloc include/linux/slab.h:739 [inline]
 udl_alloc_urb_list drivers/gpu/drm/udl/udl_main.c:190 [inline]
 udl_init+0x736/0xc80 drivers/gpu/drm/udl/udl_main.c:331
 udl_driver_create drivers/gpu/drm/udl/udl_drv.c:79 [inline]
 udl_usb_probe+0x4f/0x100 drivers/gpu/drm/udl/udl_drv.c:94
 usb_probe_interface+0x30b/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:530 [inline]
 really_probe+0x249/0xb90 drivers/base/dd.c:609
 __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:748
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:778
 __device_attach_driver+0x206/0x2e0 drivers/base/dd.c:901
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x1e4/0x530 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xbd5/0x1e90 drivers/base/core.c:3517
 usb_set_configuration+0x1019/0x1900 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd4/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:530 [inline]
 really_probe+0x249/0xb90 drivers/base/dd.c:609
 __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:748
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:778
 __device_attach_driver+0x206/0x2e0 drivers/base/dd.c:901
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x1e4/0x530 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xbd5/0x1e90 drivers/base/core.c:3517
 usb_new_device.cold+0x685/0x10ad drivers/usb/core/hub.c:2573
 hub_port_connect drivers/usb/core/hub.c:5353 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x26c7/0x4610 drivers/usb/core/hub.c:5735
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

Freed by task 146:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:367 [inline]
 ____kasan_slab_free+0x166/0x1c0 mm/kasan/common.c:329
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1754 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1780
 slab_free mm/slub.c:3534 [inline]
 kfree+0xe2/0x580 mm/slub.c:4562
 udl_free_urb_list+0x136/0x250 drivers/gpu/drm/udl/udl_main.c:164
 udl_drop_usb+0xd0/0x160 drivers/gpu/drm/udl/udl_main.c:358
 udl_usb_disconnect+0x3f/0x50 drivers/gpu/drm/udl/udl_drv.c:114
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:520 [inline]
 device_remove+0x11f/0x170 drivers/base/dd.c:512
 __device_release_driver drivers/base/dd.c:1209 [inline]
 device_release_driver_internal+0x4a1/0x700 drivers/base/dd.c:1235
 bus_remove_device+0x2e3/0x590 drivers/base/bus.c:529
 device_del+0x4f3/0xc80 drivers/base/core.c:3704
 usb_disable_device+0x356/0x7a0 drivers/usb/core/message.c:1419
 usb_disconnect.cold+0x259/0x6ed drivers/usb/core/hub.c:2235
 hub_port_connect drivers/usb/core/hub.c:5197 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x1f86/0x4610 drivers/usb/core/hub.c:5735
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 process_scheduled_works kernel/workqueue.c:2352 [inline]
 worker_thread+0x854/0x1080 kernel/workqueue.c:2438
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

The buggy address belongs to the object at ffff8880756fce80
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 8 bytes inside of
 32-byte region [ffff8880756fce80, ffff8880756fcea0)

The buggy address belongs to the physical page:
page:ffffea0001d5bf00 refcount:1 mapcount:0 mapping:0000000000000000 index:=
0x0 pfn:0x756fc
flags: 0xfff00000000200(slab|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
raw: 00fff00000000200 0000000000000000 dead000000000122 ffff888011841500
raw: 0000000000000000 0000000000400040 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12c40(GF=
P_NOFS|__GFP_NOWARN|__GFP_NORETRY), pid 3609, tgid 3609 (syz-executor401), =
ts 53404959933, free_ts 53124140132
 prep_new_page mm/page_alloc.c:2532 [inline]
 get_page_from_freelist+0x109b/0x2ce0 mm/page_alloc.c:4283
 __alloc_pages+0x1c7/0x510 mm/page_alloc.c:5507
 alloc_pages+0x1a6/0x270 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1824 [inline]
 allocate_slab+0x27e/0x3d0 mm/slub.c:1969
 new_slab mm/slub.c:2029 [inline]
 ___slab_alloc+0x7f1/0xe10 mm/slub.c:3031
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3118
 slab_alloc_node mm/slub.c:3209 [inline]
 slab_alloc mm/slub.c:3251 [inline]
 __kmalloc+0x32b/0x340 mm/slub.c:4420
 kmalloc include/linux/slab.h:611 [inline]
 kzalloc include/linux/slab.h:739 [inline]
 tomoyo_encode2.part.0+0xe9/0x3a0 security/tomoyo/realpath.c:45
 tomoyo_encode2 security/tomoyo/realpath.c:31 [inline]
 tomoyo_encode+0x28/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x186/0x620 security/tomoyo/realpath.c:288
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x1d5/0x590 security/tomoyo/file.c:723
 security_file_ioctl+0x50/0xb0 security/security.c:1552
 __do_sys_ioctl fs/ioctl.c:864 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0xb3/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1449 [inline]
 free_pcp_prepare+0x5e4/0xd20 mm/page_alloc.c:1499
 free_unref_page_prepare mm/page_alloc.c:3380 [inline]
 free_unref_page+0x19/0x4d0 mm/page_alloc.c:3476
 qlink_free mm/kasan/quarantine.c:168 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:187
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:447
 kasan_slab_alloc include/linux/kasan.h:224 [inline]
 slab_post_alloc_hook mm/slab.h:727 [inline]
 slab_alloc_node mm/slub.c:3243 [inline]
 kmem_cache_alloc_node+0x2b1/0x3f0 mm/slub.c:3293
 __alloc_skb+0x210/0x2f0 net/core/skbuff.c:418
 alloc_skb include/linux/skbuff.h:1257 [inline]
 alloc_skb_with_frags+0x93/0x6c0 net/core/skbuff.c:6018
 sock_alloc_send_pskb+0x7a3/0x930 net/core/sock.c:2663
 sock_alloc_send_skb include/net/sock.h:1841 [inline]
 mld_newpack.isra.0+0x1b9/0x770 net/ipv6/mcast.c:1748
 add_grhead+0x295/0x340 net/ipv6/mcast.c:1851
 add_grec+0x1082/0x1560 net/ipv6/mcast.c:1989
 mld_send_cr net/ipv6/mcast.c:2115 [inline]
 mld_ifc_work+0x452/0xdc0 net/ipv6/mcast.c:2653
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376

Memory state around the buggy address:
 ffff8880756fcd80: 00 00 00 00 fc fc fc fc 00 00 00 00 fc fc fc fc
 ffff8880756fce00: 00 00 00 00 fc fc fc fc 00 00 00 00 fc fc fc fc
>ffff8880756fce80: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
                      ^
 ffff8880756fcf00: 00 00 00 00 fc fc fc fc 00 00 00 00 fc fc fc fc
 ffff8880756fcf80: 00 00 00 00 fc fc fc fc 00 00 00 fc fc fc fc fc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
