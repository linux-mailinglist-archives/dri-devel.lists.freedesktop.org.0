Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1085116F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8A110EC53;
	Mon, 12 Feb 2024 10:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DDA10EC53
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:50:18 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-363b68b9af3so25021785ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707735018; x=1708339818;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VCZB2mVu30dr1aBo+64MSQeINmrCNIHAyvRluyebi4=;
 b=FepuHZwjh/qedgWMtAqm2U5Q7cBnbuBvaNqw1yvx0So2vZno8kh1QbTQFiG3k5qotd
 rXLnA5/CenKFmnVysKv+6ANxui+uwxzGsw5AyZQEF+NmIsuKmOZewDgx/Gmo+PsFqZs2
 vA6WLli4fmsH8E+W89sFsbBVjqfSKyhRgAZ4UTyuI5GKv4K4lNbM0GFUo5HXNzg+OuFE
 vIBwFs9AU+SsLOhvplKsgArtbeBW5c5d+wF/PonE+CI44ZjFfg302mybOb5l3XPHxReY
 qYq1Besejj1jS7ddv9tTMHz5qCmnTudwxZvOYVh6jErPOFXrTJOiIgE5Pz70fGlb1sPn
 17NA==
X-Gm-Message-State: AOJu0YwVgN8CgSkx7AIdOl9dt1LKOeTHvYmJBSA2oAnOYm1m3CB2WO0k
 M7LXhX2jvVpqwwi7TpxCYXuKXRlqD5zaQdzcG4RE8vOiUE9rmxKQGxvNLqYAmfDCxIDJlxIIGGo
 FgGfi0jDB/NfzjDlM2BHlllhuJHYKo01X1Yxw/aDLZnXJUws02ir4RFk=
X-Google-Smtp-Source: AGHT+IHJXnxxGChdKBRrRf5hWipSCUqyHOaLERMhW7VbimE+uIkji+HTBTPq0f1SdtJkUQQ+27i1n27wmFTG72yoNiAkNTu3wcUK
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180e:b0:363:9343:cbfb with SMTP id
 a14-20020a056e02180e00b003639343cbfbmr469220ilv.2.1707735017912; Mon, 12 Feb
 2024 02:50:17 -0800 (PST)
Date: Mon, 12 Feb 2024 02:50:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001d010d06112d0bf2@google.com>
Subject: [syzbot] [dri?] KASAN: slab-use-after-free Read in
 drm_atomic_helper_wait_for_vblanks (2)
From: syzbot <syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    a5b6244cf87c Merge tag 'block-6.8-2024-02-10' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e9ad50180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=53985487b59d9442
dashboard link: https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-a5b6244c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/08ca7654741a/vmlinux-a5b6244c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0396d079aa1e/bzImage-a5b6244c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in drm_atomic_helper_wait_for_vblanks.part.0+0x84f/0x930 drivers/gpu/drm/drm_atomic_helper.c:1661
Read of size 1 at addr ffff888026066009 by task kworker/u16:8/1094

CPU: 2 PID: 1094 Comm: kworker/u16:8 Not tainted 6.8.0-rc3-syzkaller-00293-ga5b6244cf87c #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: events_unbound commit_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc4/0x620 mm/kasan/report.c:488
 kasan_report+0xda/0x110 mm/kasan/report.c:601
 drm_atomic_helper_wait_for_vblanks.part.0+0x84f/0x930 drivers/gpu/drm/drm_atomic_helper.c:1661
 drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1657 [inline]
 drm_atomic_helper_commit_tail+0xcb/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1757
 commit_tail+0x356/0x410 drivers/gpu/drm/drm_atomic_helper.c:1834
 process_one_work+0x889/0x15e0 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x8b9/0x12a0 kernel/workqueue.c:2787
 kthread+0x2c6/0x3b0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:242
 </TASK>

Allocated by task 16480:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:372 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:389
 kmalloc include/linux/slab.h:590 [inline]
 drm_atomic_helper_crtc_duplicate_state+0x70/0xd0 drivers/gpu/drm/drm_atomic_state_helper.c:177
 drm_atomic_get_crtc_state+0x162/0x440 drivers/gpu/drm/drm_atomic.c:362
 page_flip_common+0x57/0x320 drivers/gpu/drm/drm_atomic_helper.c:3629
 drm_atomic_helper_page_flip+0xb6/0x190 drivers/gpu/drm/drm_atomic_helper.c:3690
 drm_mode_page_flip_ioctl+0x103f/0x1470 drivers/gpu/drm/drm_plane.c:1489
 drm_ioctl_kernel+0x1ec/0x3e0 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x5d8/0xc00 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x193/0x220 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77

Freed by task 16474:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3f/0x60 mm/kasan/generic.c:640
 poison_slab_object mm/kasan/common.c:241 [inline]
 __kasan_slab_free+0x121/0x1c0 mm/kasan/common.c:257
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2121 [inline]
 slab_free mm/slub.c:4299 [inline]
 kfree+0x124/0x370 mm/slub.c:4409
 drm_atomic_state_default_clear+0x3aa/0xde0 drivers/gpu/drm/drm_atomic.c:225
 drm_atomic_state_clear drivers/gpu/drm/drm_atomic.c:294 [inline]
 __drm_atomic_state_free+0x185/0x2b0 drivers/gpu/drm/drm_atomic.c:311
 kref_put include/linux/kref.h:65 [inline]
 drm_atomic_state_put include/drm/drm_atomic.h:490 [inline]
 drm_client_modeset_commit_atomic+0x6db/0x810 drivers/gpu/drm/drm_client_modeset.c:1057
 drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1154
 drm_client_modeset_commit+0x4f/0x80 drivers/gpu/drm/drm_client_modeset.c:1180
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:251 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:230 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:278 [inline]
 drm_fb_helper_lastclose+0xc7/0x160 drivers/gpu/drm/drm_fb_helper.c:2005
 drm_fbdev_generic_client_restore+0x2c/0x40 drivers/gpu/drm/drm_fbdev_generic.c:258
 drm_client_dev_restore+0x188/0x2a0 drivers/gpu/drm/drm_client.c:247
 drm_release+0x32f/0x3e0 drivers/gpu/drm/drm_file.c:437
 __fput+0x270/0xb80 fs/file_table.c:376
 __fput_sync+0x47/0x50 fs/file_table.c:461
 __do_sys_close fs/open.c:1554 [inline]
 __se_sys_close fs/open.c:1539 [inline]
 __x64_sys_close+0x87/0x100 fs/open.c:1539
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77

The buggy address belongs to the object at ffff888026066000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 9 bytes inside of
 freed 512-byte region [ffff888026066000, ffff888026066200)

The buggy address belongs to the physical page:
page:ffffea0000981900 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x26064
head:ffffea0000981900 order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000840(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000840 ffff888014c42c80 0000000000000000 dead000000000001
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 28, tgid 28 (kworker/1:0), ts 50737339083, free_ts 50338469746
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x2d4/0x350 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0xa28/0x3780 mm/page_alloc.c:3311
 __alloc_pages+0x22f/0x2440 mm/page_alloc.c:4567
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page mm/slub.c:2190 [inline]
 allocate_slab mm/slub.c:2354 [inline]
 new_slab+0xcc/0x3a0 mm/slub.c:2407
 ___slab_alloc+0x4af/0x19a0 mm/slub.c:3540
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3625
 __slab_alloc_node mm/slub.c:3678 [inline]
 slab_alloc_node mm/slub.c:3850 [inline]
 kmalloc_trace+0x30b/0x340 mm/slub.c:4007
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 mca_alloc net/ipv6/mcast.c:880 [inline]
 __ipv6_dev_mc_inc+0x2b7/0xc50 net/ipv6/mcast.c:936
 addrconf_join_solict net/ipv6/addrconf.c:2192 [inline]
 addrconf_dad_begin net/ipv6/addrconf.c:4037 [inline]
 addrconf_dad_work+0x232/0x14c0 net/ipv6/addrconf.c:4162
 process_one_work+0x889/0x15e0 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x8b9/0x12a0 kernel/workqueue.c:2787
 kthread+0x2c6/0x3b0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:242
page last free pid 5180 tgid 5180 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x527/0xb10 mm/page_alloc.c:2346
 free_unref_page+0x33/0x3c0 mm/page_alloc.c:2486
 qlink_free mm/kasan/quarantine.c:160 [inline]
 qlist_free_all+0x58/0x150 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:324
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3813 [inline]
 slab_alloc_node mm/slub.c:3860 [inline]
 kmalloc_trace+0x148/0x340 mm/slub.c:4007
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 ref_tracker_alloc+0x17c/0x5b0 lib/ref_tracker.c:203
 __netdev_tracker_alloc include/linux/netdevice.h:4147 [inline]
 netdev_hold include/linux/netdevice.h:4176 [inline]
 netdev_hold include/linux/netdevice.h:4171 [inline]
 netdev_queue_add_kobject net/core/net-sysfs.c:1703 [inline]
 netdev_queue_update_kobjects+0x1b3/0x520 net/core/net-sysfs.c:1758
 register_queue_kobjects net/core/net-sysfs.c:1819 [inline]
 netdev_register_kobject+0x290/0x3f0 net/core/net-sysfs.c:2059
 register_netdevice+0x1392/0x1db0 net/core/dev.c:10261
 geneve_configure+0x6a7/0xa10 drivers/net/geneve.c:1366
 geneve_newlink+0x12f/0x2b0 drivers/net/geneve.c:1617
 rtnl_newlink_create net/core/rtnetlink.c:3515 [inline]
 __rtnl_newlink+0x1197/0x1960 net/core/rtnetlink.c:3735
 rtnl_newlink+0x67/0xa0 net/core/rtnetlink.c:3748
 rtnetlink_rcv_msg+0x3c7/0xe10 net/core/rtnetlink.c:6615
 netlink_rcv_skb+0x16b/0x440 net/netlink/af_netlink.c:2543

Memory state around the buggy address:
 ffff888026065f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888026065f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888026066000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff888026066080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888026066100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
