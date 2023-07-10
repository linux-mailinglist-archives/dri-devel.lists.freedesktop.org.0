Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2E74CEBB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0F010E201;
	Mon, 10 Jul 2023 07:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f206.google.com (mail-pl1-f206.google.com
 [209.85.214.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DED10E201
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:42:44 +0000 (UTC)
Received: by mail-pl1-f206.google.com with SMTP id
 d9443c01a7336-1b8a4571c1aso48155535ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688974964; x=1691566964;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k7+EFlp6/crX+tP+SKWRZrN6pBD4/Sp/lNKYKOc3g6o=;
 b=cgp82Zu1kWOYrH4uzo0yL8kM6MxUkC6SJB2PWrkL7tLUNoiONNY8cSo/5vBW2Be4rn
 7ON68v2v5+GuIwbIO/XFQfqPHnG3kibcZPihHY47OeJAzjjk3IXk9uTt21RZPswU9FLH
 wW9XVGo4fROrk7KmmLBWHSTBjbpGxON7tf8kjD8PY/MyMX19DfM2+mzfY9Fc4+P88Izs
 iU5kMjGOIX0mKc3Rau5bnsJTk7tAYB9wg2aIUsvKAFNmeLe+n9aUdPBv6s/pDR0bOFmm
 arKFb1u4RybXUD0CXRaoSMBPHopUiPgJkhMAbku6kKnA+ys78gW5lYQm+5yUjOXiTB2P
 /dfA==
X-Gm-Message-State: ABy/qLaLglBtkKOpUUHhFHshOMYBDH1iy3IzBqGBiRL40qEl4sRPF2vN
 vcZm8aXHgMzj2WSjIetpgQ0Hx+VK8Lx9rvmhZBIIkD8iBpeK
X-Google-Smtp-Source: APBJJlFwxwPoCj34cxPmNkrTHxbBmViW8tuBkPYTvAjri1mQMqOT1aTg4e3+0wg4xKnnjBTOUkEd1JTHtchwPJsHJWFUz7Fp7FdN
MIME-Version: 1.0
X-Received: by 2002:a17:902:7c93:b0:1b7:edcd:8dcf with SMTP id
 y19-20020a1709027c9300b001b7edcd8dcfmr10386474pll.4.1688974964248; Mon, 10
 Jul 2023 00:42:44 -0700 (PDT)
Date: Mon, 10 Jul 2023 00:42:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7594f06001d2087@google.com>
Subject: [syzbot] [dri?] KASAN: slab-use-after-free Read in
 drm_atomic_helper_wait_for_vblanks
From: syzbot <syzbot+380dcf72caf0b5ef5537@syzkaller.appspotmail.com>
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

HEAD commit:    03275585cabd afs: Fix accidental truncation when storing d..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16db258ca80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d576750da57ebbb5
dashboard link: https://syzkaller.appspot.com/bug?extid=380dcf72caf0b5ef5537
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-03275585.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6d035553cd50/vmlinux-03275585.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2fd7f855c25e/bzImage-03275585.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+380dcf72caf0b5ef5537@syzkaller.appspotmail.com

BUG: KASAN: slab-use-after-free in drm_atomic_helper_wait_for_vblanks.part.0+0x77a/0x860 drivers/gpu/drm/drm_atomic_helper.c:1650
Read of size 1 at addr ffff888023f61009 by task kworker/u17:6/4248

CPU: 3 PID: 4248 Comm: kworker/u17:6 Not tainted 6.4.0-syzkaller-11472-g03275585cabd #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Workqueue: events_unbound commit_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 print_address_description.constprop.0+0x2c/0x3c0 mm/kasan/report.c:364
 print_report mm/kasan/report.c:475 [inline]
 kasan_report+0x11d/0x130 mm/kasan/report.c:588
 drm_atomic_helper_wait_for_vblanks.part.0+0x77a/0x860 drivers/gpu/drm/drm_atomic_helper.c:1650
 drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1646 [inline]
 drm_atomic_helper_commit_tail+0xc7/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1746
 commit_tail+0x32d/0x420 drivers/gpu/drm/drm_atomic_helper.c:1823
 process_one_work+0xa34/0x16f0 kernel/workqueue.c:2597
 worker_thread+0x67d/0x10c0 kernel/workqueue.c:2748
 kthread+0x344/0x440 kernel/kthread.c:389
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>

Allocated by task 28853:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 ____kasan_kmalloc mm/kasan/common.c:374 [inline]
 ____kasan_kmalloc mm/kasan/common.c:333 [inline]
 __kasan_kmalloc+0xa2/0xb0 mm/kasan/common.c:383
 kmalloc include/linux/slab.h:579 [inline]
 drm_atomic_helper_crtc_duplicate_state+0x6f/0xc0 drivers/gpu/drm/drm_atomic_state_helper.c:177
 drm_simple_kms_crtc_duplicate_state+0x8b/0xb0 drivers/gpu/drm/drm_simple_kms_helper.c:166
 drm_atomic_get_crtc_state+0x179/0x470 drivers/gpu/drm/drm_atomic.c:353
 page_flip_common+0x57/0x310 drivers/gpu/drm/drm_atomic_helper.c:3589
 drm_atomic_helper_page_flip+0xb8/0x190 drivers/gpu/drm/drm_atomic_helper.c:3650
 drm_mode_page_flip_ioctl+0xf20/0x12a0 drivers/gpu/drm/drm_plane.c:1373
 drm_ioctl_kernel+0x281/0x4e0 drivers/gpu/drm/drm_ioctl.c:788
 drm_ioctl+0x577/0xb30 drivers/gpu/drm/drm_ioctl.c:891
 drm_compat_ioctl+0x375/0x4b0 drivers/gpu/drm/drm_ioc32.c:988
 __do_compat_sys_ioctl+0x25b/0x2b0 fs/ioctl.c:968
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x70/0x82

Freed by task 28850:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2b/0x40 mm/kasan/generic.c:521
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free+0x160/0x1c0 mm/kasan/common.c:200
 kasan_slab_free include/linux/kasan.h:162 [inline]
 slab_free_hook mm/slub.c:1792 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1818
 slab_free mm/slub.c:3801 [inline]
 __kmem_cache_free+0xb8/0x2d0 mm/slub.c:3814
 drm_simple_kms_crtc_destroy_state+0x8c/0xb0 drivers/gpu/drm/drm_simple_kms_helper.c:177
 drm_atomic_state_default_clear+0x3a7/0xdd0 drivers/gpu/drm/drm_atomic.c:219
 drm_atomic_state_clear drivers/gpu/drm/drm_atomic.c:288 [inline]
 __drm_atomic_state_free+0x176/0x2b0 drivers/gpu/drm/drm_atomic.c:304
 kref_put include/linux/kref.h:65 [inline]
 drm_atomic_state_put include/drm/drm_atomic.h:490 [inline]
 drm_client_modeset_commit_atomic+0x6b0/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1051
 drm_client_modeset_commit_locked+0x149/0x580 drivers/gpu/drm/drm_client_modeset.c:1148
 drm_client_modeset_commit+0x51/0x80 drivers/gpu/drm/drm_client_modeset.c:1174
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:251 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:230 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:278 [inline]
 drm_fb_helper_lastclose+0xc5/0x170 drivers/gpu/drm/drm_fb_helper.c:2005
 drm_fbdev_generic_client_restore+0x2c/0x40 drivers/gpu/drm/drm_fbdev_generic.c:259
 drm_client_dev_restore+0x188/0x290 drivers/gpu/drm/drm_client.c:236
 drm_release+0x40d/0x4f0 drivers/gpu/drm/drm_file.c:497
 __fput+0x40c/0xad0 fs/file_table.c:384
 task_work_run+0x16f/0x270 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x210/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:286 [inline]
 syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:297
 __do_fast_syscall_32+0x72/0xf0 arch/x86/entry/common.c:181
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x70/0x82

Last potentially related work creation:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xb9/0xd0 mm/kasan/generic.c:491
 insert_work+0x48/0x360 kernel/workqueue.c:1553
 __queue_work+0x625/0x1120 kernel/workqueue.c:1714
 call_timer_fn+0x1a0/0x580 kernel/time/timer.c:1700
 expire_timers+0xbc/0x4b0 kernel/time/timer.c:1746
 __run_timers kernel/time/timer.c:2022 [inline]
 __run_timers kernel/time/timer.c:1995 [inline]
 run_timer_softirq+0x326/0x910 kernel/time/timer.c:2035
 __do_softirq+0x1d4/0x905 kernel/softirq.c:553

Second to last potentially related work creation:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xb9/0xd0 mm/kasan/generic.c:491
 insert_work+0x48/0x360 kernel/workqueue.c:1553
 __queue_work+0x625/0x1120 kernel/workqueue.c:1714
 call_timer_fn+0x1a0/0x580 kernel/time/timer.c:1700
 expire_timers+0xbc/0x4b0 kernel/time/timer.c:1746
 __run_timers kernel/time/timer.c:2022 [inline]
 __run_timers kernel/time/timer.c:1995 [inline]
 run_timer_softirq+0x326/0x910 kernel/time/timer.c:2035
 __do_softirq+0x1d4/0x905 kernel/softirq.c:553

The buggy address belongs to the object at ffff888023f61000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 9 bytes inside of
 freed 512-byte region [ffff888023f61000, ffff888023f61200)

The buggy address belongs to the physical page:
page:ffffea00008fd800 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x23f60
head:ffffea00008fd800 order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000010200 ffff888012842c80 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 2572, tgid 2572 (kworker/u17:0), ts 13571791526, free_ts 0
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x2db/0x350 mm/page_alloc.c:1570
 prep_new_page mm/page_alloc.c:1577 [inline]
 get_page_from_freelist+0xfed/0x2d30 mm/page_alloc.c:3221
 __alloc_pages+0x1cb/0x4a0 mm/page_alloc.c:4477
 alloc_pages+0x1aa/0x270 mm/mempolicy.c:2279
 alloc_slab_page mm/slub.c:1862 [inline]
 allocate_slab+0x25f/0x390 mm/slub.c:2009
 new_slab mm/slub.c:2062 [inline]
 ___slab_alloc+0xbc3/0x15d0 mm/slub.c:3215
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3314
 __slab_alloc_node mm/slub.c:3367 [inline]
 slab_alloc_node mm/slub.c:3460 [inline]
 __kmem_cache_alloc_node+0x143/0x350 mm/slub.c:3509
 kmalloc_trace+0x26/0xe0 mm/slab_common.c:1076
 kmalloc include/linux/slab.h:579 [inline]
 kzalloc include/linux/slab.h:700 [inline]
 alloc_bprm+0x51/0xba0 fs/exec.c:1513
 kernel_execve+0xaf/0x500 fs/exec.c:1988
 call_usermodehelper_exec_async+0x260/0x4e0 kernel/umh.c:110
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888023f60f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888023f60f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888023f61000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff888023f61080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888023f61100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
