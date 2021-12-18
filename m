Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F947A0FF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 15:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6FF12B4B1;
	Sun, 19 Dec 2021 14:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F172D10F1DF
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 20:09:30 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 z16-20020a92bf10000000b002b246c69148so2527033ilh.12
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 12:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=uzuy0eiWp28yimwzI9sBHKHVRNTrHm7IO9laQGPL454=;
 b=WuDK1KALE/O/HD0AU1qM6z9mLmjS4X6RRBQsDm+RUlzDXe9HtD/15/INPVJ7bV3hs1
 aM0w78QceymJKntt+Hk60/DF4paxVLzd35A12m/p1RSUO78wApA2QrWezfqqaUaSD3TN
 E4C2jeNQaEHJbgUeFeoxmmsQncfgB2gIcgIuVNkW9ydHjTfKVeLxE9eOXF86RelcKNpO
 bu+n/MRKvz88iVVL22GwE7iufEdBUxk5t7lMXO49Rd88t7TOGB5A01KD1E7DSCH4SrYm
 z4e5V77JuFh02IbJZIO4zAH5EEv0+n4bSkiPb9bg3AbNIhMdmxfKdS2RbTgE5W8IxIux
 SbNQ==
X-Gm-Message-State: AOAM533Ng7VCxDLPELr4+lcVhVRCOPZfaDq/WkilqhyB/UHDFnCyFV13
 Np+UlHcwESnCkAtI+dYIPTl0ujmbBMmlzcesmP3pmMsuVRwY
X-Google-Smtp-Source: ABdhPJxJM3ZKxlBqQLVNhxPHvuPVqahgeBv66CegUKUKU8ImD/DziCkcZxc+VaG5AUrnJAAdG0jpkcXJ9GFyTMVbJQURgsw6RiOj
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2f04:: with SMTP id
 q4mr4800568iow.94.1639858170267; 
 Sat, 18 Dec 2021 12:09:30 -0800 (PST)
Date: Sat, 18 Dec 2021 12:09:30 -0800
In-Reply-To: <000000000000685c4605d0e47dad@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b88d6f05d3713b3d@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in
 drm_gem_object_release_handle
From: syzbot <syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig-owner@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 19 Dec 2021 14:38:10 +0000
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    fbf252e09678 Add linux-next specific files for 20211216
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=168bf493b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7fcbb9aa19a433c8
dashboard link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144be7cbb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136e3193b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com

RBP: 00007ffe623d1b90 R08: 0000000000000003 R09: 0000000100000000
R10: 0000000000000012 R11: 0000000000000246 R12: 0000000000000004
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
==================================================================
BUG: KASAN: use-after-free in drm_gem_object_release_handle+0xf2/0x110 drivers/gpu/drm/drm_gem.c:252 drivers/gpu/drm/drm_gem.c:252
Read of size 8 at addr ffff8881473d3228 by task syz-executor513/3605

CPU: 1 PID: 3605 Comm: syz-executor513 Not tainted 5.16.0-rc5-next-20211216-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 __dump_stack lib/dump_stack.c:88 [inline] lib/dump_stack.c:106
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xa5/0x3ed mm/kasan/report.c:255 mm/kasan/report.c:255
 __kasan_report mm/kasan/report.c:442 [inline]
 __kasan_report mm/kasan/report.c:442 [inline] mm/kasan/report.c:459
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459 mm/kasan/report.c:459
 drm_gem_object_release_handle+0xf2/0x110 drivers/gpu/drm/drm_gem.c:252 drivers/gpu/drm/drm_gem.c:252
 idr_for_each+0x113/0x220 lib/idr.c:208 lib/idr.c:208
 drm_gem_release+0x22/0x30 drivers/gpu/drm/drm_gem.c:930 drivers/gpu/drm/drm_gem.c:930
 drm_file_free.part.0+0x805/0xb80 drivers/gpu/drm/drm_file.c:281 drivers/gpu/drm/drm_file.c:281
 drm_file_free drivers/gpu/drm/drm_file.c:248 [inline]
 drm_file_free drivers/gpu/drm/drm_file.c:248 [inline] drivers/gpu/drm/drm_file.c:308
 drm_close_helper.isra.0+0x17d/0x1f0 drivers/gpu/drm/drm_file.c:308 drivers/gpu/drm/drm_file.c:308
 drm_release+0x1e6/0x530 drivers/gpu/drm/drm_file.c:495 drivers/gpu/drm/drm_file.c:495
 __fput+0x286/0x9f0 fs/file_table.c:311 fs/file_table.c:311
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164 kernel/task_work.c:164
 exit_task_work include/linux/task_work.h:32 [inline]
 exit_task_work include/linux/task_work.h:32 [inline] kernel/exit.c:832
 do_exit+0xc14/0x2c20 kernel/exit.c:832 kernel/exit.c:832
 do_group_exit+0x125/0x310 kernel/exit.c:929 kernel/exit.c:929
 __do_sys_exit_group kernel/exit.c:940 [inline]
 __se_sys_exit_group kernel/exit.c:938 [inline]
 __do_sys_exit_group kernel/exit.c:940 [inline] kernel/exit.c:938
 __se_sys_exit_group kernel/exit.c:938 [inline] kernel/exit.c:938
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:938 kernel/exit.c:938
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_x64 arch/x86/entry/common.c:50 [inline] arch/x86/entry/common.c:80
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7ff6a71909f9
Code: Unable to access opcode bytes at RIP 0x7ff6a71909cf.
RSP: 002b:00007ffe623d1b68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff6a72043f0 RCX: 00007ff6a71909f9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffffffffffc0 R09: 0000000100000000
R10: 0000000000000012 R11: 0000000000000246 R12: 00007ff6a72043f0
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>

Allocated by task 3605:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 kasan_set_track mm/kasan/common.c:45 [inline] mm/kasan/common.c:524
 set_alloc_info mm/kasan/common.c:436 [inline] mm/kasan/common.c:524
 ____kasan_kmalloc mm/kasan/common.c:515 [inline] mm/kasan/common.c:524
 ____kasan_kmalloc mm/kasan/common.c:474 [inline] mm/kasan/common.c:524
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524 mm/kasan/common.c:524
 kmalloc include/linux/slab.h:581 [inline]
 kzalloc include/linux/slab.h:715 [inline]
 kmalloc include/linux/slab.h:581 [inline] drivers/gpu/drm/vgem/vgem_drv.c:98
 kzalloc include/linux/slab.h:715 [inline] drivers/gpu/drm/vgem/vgem_drv.c:98
 vgem_gem_create_object+0x38/0xb0 drivers/gpu/drm/vgem/vgem_drv.c:98 drivers/gpu/drm/vgem/vgem_drv.c:98
 __drm_gem_shmem_create+0x80/0x480 drivers/gpu/drm/drm_gem_shmem_helper.c:61 drivers/gpu/drm/drm_gem_shmem_helper.c:61
 drm_gem_shmem_create drivers/gpu/drm/drm_gem_shmem_helper.c:126 [inline]
 drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:419 [inline]
 drm_gem_shmem_create drivers/gpu/drm/drm_gem_shmem_helper.c:126 [inline] drivers/gpu/drm/drm_gem_shmem_helper.c:529
 drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:419 [inline] drivers/gpu/drm/drm_gem_shmem_helper.c:529
 drm_gem_shmem_dumb_create+0x13c/0x380 drivers/gpu/drm/drm_gem_shmem_helper.c:529 drivers/gpu/drm/drm_gem_shmem_helper.c:529
 drm_mode_create_dumb+0x26c/0x2f0 drivers/gpu/drm/drm_dumb_buffers.c:96 drivers/gpu/drm/drm_dumb_buffers.c:96
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:782 drivers/gpu/drm/drm_ioctl.c:782
 drm_ioctl+0x51e/0x9d0 drivers/gpu/drm/drm_ioctl.c:885 drivers/gpu/drm/drm_ioctl.c:885
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 vfs_ioctl fs/ioctl.c:51 [inline] fs/ioctl.c:860
 __do_sys_ioctl fs/ioctl.c:874 [inline] fs/ioctl.c:860
 __se_sys_ioctl fs/ioctl.c:860 [inline] fs/ioctl.c:860
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_x64 arch/x86/entry/common.c:50 [inline] arch/x86/entry/common.c:80
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Freed by task 3605:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free mm/kasan/common.c:366 [inline] mm/kasan/common.c:328
 ____kasan_slab_free+0x166/0x1a0 mm/kasan/common.c:328 mm/kasan/common.c:328
 kasan_slab_free include/linux/kasan.h:236 [inline]
 slab_free_hook mm/slub.c:1728 [inline]
 kasan_slab_free include/linux/kasan.h:236 [inline] mm/slub.c:1754
 slab_free_hook mm/slub.c:1728 [inline] mm/slub.c:1754
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1754 mm/slub.c:1754
 slab_free mm/slub.c:3510 [inline]
 slab_free mm/slub.c:3510 [inline] mm/slub.c:4561
 kfree+0xd0/0x4b0 mm/slub.c:4561 mm/slub.c:4561
 drm_gem_object_free+0x58/0x80 drivers/gpu/drm/drm_gem.c:972 drivers/gpu/drm/drm_gem.c:972
 kref_put include/linux/kref.h:65 [inline]
 __drm_gem_object_put include/drm/drm_gem.h:371 [inline]
 drm_gem_object_put include/drm/drm_gem.h:384 [inline]
 kref_put include/linux/kref.h:65 [inline] drivers/gpu/drm/drm_gem.c:1132
 __drm_gem_object_put include/drm/drm_gem.h:371 [inline] drivers/gpu/drm/drm_gem.c:1132
 drm_gem_object_put include/drm/drm_gem.h:384 [inline] drivers/gpu/drm/drm_gem.c:1132
 drm_gem_mmap+0x4aa/0x680 drivers/gpu/drm/drm_gem.c:1132 drivers/gpu/drm/drm_gem.c:1132
 call_mmap include/linux/fs.h:2084 [inline]
 call_mmap include/linux/fs.h:2084 [inline] mm/mmap.c:1793
 mmap_region+0xd8e/0x1660 mm/mmap.c:1793 mm/mmap.c:1793
 do_mmap+0x869/0xfb0 mm/mmap.c:1582 mm/mmap.c:1582
 vm_mmap_pgoff+0x1b7/0x290 mm/util.c:519 mm/util.c:519
 ksys_mmap_pgoff+0x40d/0x5a0 mm/mmap.c:1630 mm/mmap.c:1630
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_x64 arch/x86/entry/common.c:50 [inline] arch/x86/entry/common.c:80
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The buggy address belongs to the object at ffff8881473d3000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 552 bytes inside of
 1024-byte region [ffff8881473d3000, ffff8881473d3400)
The buggy address belongs to the page:
page:ffffea00051cf400 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1473d0
head:ffffea00051cf400 order:3 compound_mapcount:0 compound_pincount:0
flags: 0x57ff00000010200(slab|head|node=1|zone=2|lastcpupid=0x7ff)
raw: 057ff00000010200 0000000000000000 dead000000000001 ffff888010c41dc0
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, ts 7979660614, free_ts 0
 prep_new_page mm/page_alloc.c:2433 [inline]
 prep_new_page mm/page_alloc.c:2433 [inline] mm/page_alloc.c:4164
 get_page_from_freelist+0xa72/0x2f40 mm/page_alloc.c:4164 mm/page_alloc.c:4164
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5376 mm/page_alloc.c:5376
 alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2116 mm/mempolicy.c:2116
 alloc_pages+0x2b1/0x310 mm/mempolicy.c:2266 mm/mempolicy.c:2266
 alloc_slab_page mm/slub.c:1799 [inline]
 allocate_slab mm/slub.c:1944 [inline]
 alloc_slab_page mm/slub.c:1799 [inline] mm/slub.c:2004
 allocate_slab mm/slub.c:1944 [inline] mm/slub.c:2004
 new_slab+0x28d/0x3a0 mm/slub.c:2004 mm/slub.c:2004
 ___slab_alloc+0x6be/0xd60 mm/slub.c:3019 mm/slub.c:3019
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3106 mm/slub.c:3106
 slab_alloc_node mm/slub.c:3197 [inline]
 slab_alloc_node mm/slub.c:3197 [inline] mm/slub.c:3281
 kmem_cache_alloc_node_trace+0x116/0x300 mm/slub.c:3281 mm/slub.c:3281
 kmalloc_node include/linux/slab.h:599 [inline]
 kzalloc_node include/linux/slab.h:726 [inline]
 kmalloc_node include/linux/slab.h:599 [inline] block/genhd.c:1289
 kzalloc_node include/linux/slab.h:726 [inline] block/genhd.c:1289
 __alloc_disk_node+0x77/0x5c0 block/genhd.c:1289 block/genhd.c:1289
 __blk_mq_alloc_disk+0x12d/0x1c0 block/blk-mq.c:3857 block/blk-mq.c:3857
 nbd_dev_add+0x3b2/0xcd0 drivers/block/nbd.c:1765 drivers/block/nbd.c:1765
 nbd_init+0x297/0x2a7 drivers/block/nbd.c:2511 drivers/block/nbd.c:2511
 do_one_initcall+0x103/0x650 init/main.c:1303 init/main.c:1303
 do_initcall_level init/main.c:1378 [inline]
 do_initcalls init/main.c:1394 [inline]
 do_basic_setup init/main.c:1413 [inline]
 do_initcall_level init/main.c:1378 [inline] init/main.c:1618
 do_initcalls init/main.c:1394 [inline] init/main.c:1618
 do_basic_setup init/main.c:1413 [inline] init/main.c:1618
 kernel_init_freeable+0x6b1/0x73a init/main.c:1618 init/main.c:1618
 kernel_init+0x1a/0x1d0 init/main.c:1507 init/main.c:1507
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295 arch/x86/entry/entry_64.S:295
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8881473d3100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881473d3180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8881473d3200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff8881473d3280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881473d3300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

