Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE957B21D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E63611353C;
	Wed, 20 Jul 2022 07:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68A10EFC6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:52:25 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 g8-20020a92cda8000000b002dcbd57f808so9475312ild.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 00:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=sYkFyBLYhmhNCbMiRWEkfaFY9DCVXXS/8A4CQbM3X2M=;
 b=XfCal32LyUMKOoHw3q0v5RhpW5bCPLxiMCLSjYtA3HKDTcpPwBOscMljdDRQNWSC86
 qFdUt93Vf+5lOwYnjPeKfw3LLhg/Tn0XVms8zErMWASlyj41ki0DdRdyJieLsRy0Cnfl
 skAbACgc7EwyfJY+fdUrYzPySiFaL3PWAx0jFSlprUs6y5sjPwgBGljB5UByJV0duwMK
 xj2TtolzVNssZjd1oLhbFjjaYy5qw40nPfa5RjIXgyBG4dkuYdFffv3cItOpnZZmQPoq
 AU0tixZKlq9C0AcZoi+aUjT8SEfuv/2i88eH7V70mezYqXVk12Q50F4QOqtwNVAVxceW
 LSbQ==
X-Gm-Message-State: AJIora98IRynJlp8QKQzbcOjCfedLSkmSTdkjE98PipqhwOfLeL/HyfR
 34ncNUt82r0A8vZyFHjhF18iwIMfD9Be3yp9SEiJu9tysAo2
X-Google-Smtp-Source: AGRyM1vOFwIYIb7VOcWmcYd6eI7sGekib07WVhokWvXayuw/+N+I9o0nkBqyOuO2jucv3wwZPbQ8hYahegBuFz8WbLd89l+Vsb1o
MIME-Version: 1.0
X-Received: by 2002:a6b:3115:0:b0:660:d5f1:e3b6 with SMTP id
 j21-20020a6b3115000000b00660d5f1e3b6mr16548932ioa.99.1658303544828; Wed, 20
 Jul 2022 00:52:24 -0700 (PDT)
Date: Wed, 20 Jul 2022 00:52:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b8273405e437e1a2@google.com>
Subject: [syzbot] KASAN: invalid-free in free_prealloced_shrinker
From: syzbot <syzbot+8b481578352d4637f510@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, agk@redhat.com, agruenba@redhat.com, 
 airlied@linux.ie, akpm@linux-foundation.org, alyssa.rosenzweig@collabora.com, 
 andrii@kernel.org, anna@kernel.org, anton@enomsg.org, arnd@arndb.de, 
 arve@android.com, ast@kernel.org, boris.ostrovsky@oracle.com, bp@alien8.de, 
 bpf@vger.kernel.org, brauner@kernel.org, ccross@android.com, chao@kernel.org, 
 christian.koenig@amd.com, chuck.lever@oracle.com, 
 ckoenig.leichtzumerken@gmail.com, clm@fb.com, cluster-devel@redhat.com, 
 colyli@suse.de, daniel@ffwll.ch, daniel@iogearbox.net, 
 dave.hansen@linux.intel.com, davem@davemloft.net, david@redhat.com, 
 djwong@kernel.org, dm-devel@redhat.com, dri-devel@lists.freedesktop.org, 
 dsterba@suse.com, edumazet@google.com, frederic@kernel.org, 
 freedreno@lists.freedesktop.org, gregkh@linuxfoundation.org, hpa@zytor.com, 
 hridya@google.com, intel-gfx@lists.freedesktop.org, jack@suse.com, 
 jaegeuk@kernel.org, jani.nikula@linux.intel.com, jasowang@redhat.com, 
 jgross@suse.com, jiangshanlai@gmail.com, jmattson@google.com, 
 joel@joelfernandes.org, john.fastabend@gmail.com, 
 joonas.lahtinen@linux.intel.com
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

HEAD commit:    cb71b93c2dc3 Add linux-next specific files for 20220628
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13621152080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=badbc1adb2d582eb
dashboard link: https://syzkaller.appspot.com/bug?extid=8b481578352d4637f510
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=150c25fc080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13089562080000

The issue was bisected to:

commit bec0918551a79c3c6b63a493a80e35e8b402804f
Author: Roman Gushchin <roman.gushchin@linux.dev>
Date:   Wed Jun 1 03:22:24 2022 +0000

    mm: shrinkers: provide shrinkers with names

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17451fd0080000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c51fd0080000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c51fd0080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8b481578352d4637f510@syzkaller.appspotmail.com
Fixes: bec0918551a7 ("mm: shrinkers: provide shrinkers with names")

==================================================================
BUG: KASAN: double-free in slab_free mm/slub.c:3534 [inline]
BUG: KASAN: double-free in kfree+0xe2/0x4d0 mm/slub.c:4562

CPU: 0 PID: 3647 Comm: syz-executor232 Not tainted 5.19.0-rc4-next-20220628-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:317 [inline]
 print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
 kasan_report_invalid_free+0x8f/0x1a0 mm/kasan/report.c:462
 ____kasan_slab_free+0x18b/0x1c0 mm/kasan/common.c:355
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1754 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1780
 slab_free mm/slub.c:3534 [inline]
 kfree+0xe2/0x4d0 mm/slub.c:4562
 kfree_const+0x51/0x60 mm/util.c:41
 free_prealloced_shrinker+0x32/0x160 mm/vmscan.c:658
 destroy_unused_super.part.0+0x106/0x170 fs/super.c:185
 destroy_unused_super fs/super.c:278 [inline]
 alloc_super+0x8bd/0xaa0 fs/super.c:277
 sget_fc+0x13e/0x7c0 fs/super.c:530
 vfs_get_super fs/super.c:1134 [inline]
 get_tree_nodev+0x24/0x1d0 fs/super.c:1169
 vfs_get_tree+0x89/0x2f0 fs/super.c:1501
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7f84280f4ef9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc55338338 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f84280f4ef9
RDX: 00000000200000c0 RSI: 0000000020000080 RDI: 0000000000000000
RBP: 00007ffc55338360 R08: 0000000000000000 R09: 00007ffc55338370
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 00007ffc55338380 R14: 00007ffc553383c0 R15: 0000000000000006
 </TASK>

Allocated by task 143:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524
 kmalloc include/linux/slab.h:605 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 rh_call_control drivers/usb/core/hcd.c:514 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:848 [inline]
 usb_hcd_submit_urb+0x661/0x2220 drivers/usb/core/hcd.c:1551
 usb_submit_urb+0x86d/0x1880 drivers/usb/core/urb.c:594
 usb_start_wait_urb+0x101/0x4b0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
 get_port_status drivers/usb/core/hub.c:580 [inline]
 hub_ext_port_status+0x112/0x450 drivers/usb/core/hub.c:597
 usb_hub_port_status drivers/usb/core/hub.c:619 [inline]
 hub_activate+0xa5c/0x1c90 drivers/usb/core/hub.c:1129
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:302

Freed by task 3647:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free+0x166/0x1c0 mm/kasan/common.c:328
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1754 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1780
 slab_free mm/slub.c:3534 [inline]
 kfree+0xe2/0x4d0 mm/slub.c:4562
 kfree_const+0x51/0x60 mm/util.c:41
 prealloc_shrinker+0x179/0x1b0 mm/vmscan.c:644
 alloc_super+0x831/0xaa0 fs/super.c:268
 sget_fc+0x13e/0x7c0 fs/super.c:530
 vfs_get_super fs/super.c:1134 [inline]
 get_tree_nodev+0x24/0x1d0 fs/super.c:1169
 vfs_get_tree+0x89/0x2f0 fs/super.c:1501
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0

The buggy address belongs to the object at ffff888147889b20
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 16-byte region [ffff888147889b20, ffff888147889b30)

The buggy address belongs to the physical page:
page:ffffea00051e2240 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x147889
flags: 0x57ff00000000200(slab|node=1|zone=2|lastcpupid=0x7ff)
raw: 057ff00000000200 ffffea00051e2ac0 dead000000000002 ffff8880118413c0
raw: 0000000000000000 0000000080800080 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 1, tgid 1 (swapper/0), ts 8392902276, free_ts 0
 prep_new_page mm/page_alloc.c:2535 [inline]
 get_page_from_freelist+0x210d/0x3a30 mm/page_alloc.c:4282
 __alloc_pages+0x1c7/0x510 mm/page_alloc.c:5506
 alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2113
 alloc_pages+0x2b1/0x310 mm/mempolicy.c:2275
 alloc_slab_page mm/slub.c:1824 [inline]
 allocate_slab+0x27e/0x3d0 mm/slub.c:1969
 new_slab mm/slub.c:2029 [inline]
 ___slab_alloc+0x89d/0xef0 mm/slub.c:3031
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3118
 slab_alloc_node mm/slub.c:3209 [inline]
 slab_alloc mm/slub.c:3251 [inline]
 __kmalloc_track_caller+0x382/0x430 mm/slub.c:4924
 kstrdup+0x36/0x70 mm/util.c:61
 kstrdup_const+0x53/0x80 mm/util.c:84
 __kernfs_new_node+0x9d/0x8b0 fs/kernfs/dir.c:589
 kernfs_new_node+0x93/0x120 fs/kernfs/dir.c:655
 kernfs_create_link+0xcb/0x230 fs/kernfs/symlink.c:39
 sysfs_do_create_link_sd+0x90/0x140 fs/sysfs/symlink.c:44
 sysfs_do_create_link fs/sysfs/symlink.c:80 [inline]
 sysfs_create_link+0x5f/0xc0 fs/sysfs/symlink.c:92
 driver_sysfs_add+0xf7/0x350 drivers/base/dd.c:412
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888147889a00: fb fb fc fc fb fb fc fc fb fb fc fc fb fb fc fc
 ffff888147889a80: fb fb fc fc fb fb fc fc fb fb fc fc fb fb fc fc
>ffff888147889b00: fb fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
                               ^
 ffff888147889b80: 00 00 fc fc fa fb fc fc fa fb fc fc fa fb fc fc
 ffff888147889c00: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
