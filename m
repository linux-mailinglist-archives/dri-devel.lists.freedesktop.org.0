Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E88399BAB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BA26F40D;
	Thu,  3 Jun 2021 07:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4E76EB6F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 07:48:17 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 r6-20020a9276060000b02901d941f0ce72so992704ilc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 00:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=I5rj51O1SNVwH1w+ilTJpde2ecRC2Am4PdlKxMwCk/I=;
 b=KvvATzcF+KFO2S4IdFVYbnzwirAB5qPfUtLEp6M6D4n7heHTytS+rdcFxN4ju7r54S
 X7/yd9A91wSQ4GT5Oq5NNbAtg8n1Phi/HsjuAijx3lTKIG57/d9xxbNlHuwaGyk4x+wP
 gzB+9ProDOxkqarXgCuUWsqQHyuG/1TRf8Fg0a9NQOdkjl7JRFBbvrerXfq0+21PsJ7G
 8PfU16esPw4rZ5UdC23lQ46oedGjnl/iUSj2VNgVC/DtXzfi8O2Q2SgzskWIwXOwA5tX
 1O12m9GNtt7qe8e/wDNUl57hOeaWtuxSphWg5zH5oP+rptoigxX35ycamuuF429riRPp
 MISA==
X-Gm-Message-State: AOAM530oIcJ+dBKD/2xVV+j8J2s4urFs77KrzkW656Mc01BB/9h9i9w+
 MBfIDGxf5jorGCCPr8aC/YwzZt+eTmIDN6cugngcmkGUWRdy
X-Google-Smtp-Source: ABdhPJxx3JwtCqCItSN+OaZg/XuNVjKTb6tYMqBi0iqwW7q2cEkOzCaZG+OKYFze7TLef58auBaWVYSCFQC7Kjew5qgUNQKvQv0Q
MIME-Version: 1.0
X-Received: by 2002:a92:cc0d:: with SMTP id s13mr24331672ilp.198.1622620097344; 
 Wed, 02 Jun 2021 00:48:17 -0700 (PDT)
Date: Wed, 02 Jun 2021 00:48:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000081fb1f05c3c3ae30@google.com>
Subject: [syzbot] KASAN: use-after-free Read in drm_getunique
From: syzbot <syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Jun 2021 07:35:20 +0000
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

HEAD commit:    5ff2756a Merge tag 'nfs-for-5.13-2' of git://git.linux-nfs..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11815dabd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=770708ea7cfd4916
dashboard link: https://syzkaller.appspot.com/bug?extid=c3a706cec1ea99e1c693
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b5b4b5d00000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10638a6bd00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12638a6bd00000
console output: https://syzkaller.appspot.com/x/log.txt?x=14638a6bd00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in drm_getunique+0x23b/0x2a0 drivers/gpu/drm/drm_ioctl.c:124
Read of size 4 at addr ffff8880212cb818 by task syz-executor.0/8693

CPU: 1 PID: 8693 Comm: syz-executor.0 Not tainted 5.13.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x141/0x1d7 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:233
 __kasan_report mm/kasan/report.c:419 [inline]
 kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:436
 drm_getunique+0x23b/0x2a0 drivers/gpu/drm/drm_ioctl.c:124
 drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4fd/0x9b0 drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:1069 [inline]
 __se_sys_ioctl fs/ioctl.c:1055 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:1055
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665d9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc47c368188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000056c038 RCX: 00000000004665d9
RDX: 0000000020000180 RSI: 00000000c0145401 RDI: 0000000000000003
RBP: 00000000004bfcb9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000056c038
R13: 00007fff26bf6f4f R14: 00007fc47c368300 R15: 0000000000022000

Allocated by task 8692:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:428 [inline]
 ____kasan_kmalloc mm/kasan/common.c:507 [inline]
 ____kasan_kmalloc mm/kasan/common.c:466 [inline]
 __kasan_kmalloc+0x9b/0xd0 mm/kasan/common.c:516
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:686 [inline]
 drm_master_create+0x40/0x4f0 drivers/gpu/drm/drm_auth.c:107
 drm_new_set_master+0xd2/0x400 drivers/gpu/drm/drm_auth.c:143
 drm_master_open+0x13e/0x1a0 drivers/gpu/drm/drm_auth.c:306
 drm_open_helper drivers/gpu/drm/drm_file.c:355 [inline]
 drm_open+0x6b4/0xb10 drivers/gpu/drm/drm_file.c:430
 drm_stub_open+0x281/0x530 drivers/gpu/drm/drm_drv.c:1015
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4b9/0x11b0 fs/open.c:826
 do_open fs/namei.c:3361 [inline]
 path_openat+0x1c0e/0x27e0 fs/namei.c:3494
 do_filp_open+0x190/0x3d0 fs/namei.c:3521
 do_sys_openat2+0x16d/0x420 fs/open.c:1187
 do_sys_open fs/open.c:1203 [inline]
 __do_sys_openat fs/open.c:1219 [inline]
 __se_sys_openat fs/open.c:1214 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1214
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Freed by task 8692:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:357
 ____kasan_slab_free mm/kasan/common.c:360 [inline]
 ____kasan_slab_free mm/kasan/common.c:325 [inline]
 __kasan_slab_free+0xfb/0x130 mm/kasan/common.c:368
 kasan_slab_free include/linux/kasan.h:212 [inline]
 slab_free_hook mm/slub.c:1582 [inline]
 slab_free_freelist_hook+0xdf/0x240 mm/slub.c:1607
 slab_free mm/slub.c:3167 [inline]
 kfree+0xe5/0x7f0 mm/slub.c:4217
 kref_put include/linux/kref.h:65 [inline]
 drm_master_put drivers/gpu/drm/drm_auth.c:399 [inline]
 drm_new_set_master+0x314/0x400 drivers/gpu/drm/drm_auth.c:155
 drm_setmaster_ioctl+0x3de/0x550 drivers/gpu/drm/drm_auth.c:240
 drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4fd/0x9b0 drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:1069 [inline]
 __se_sys_ioctl fs/ioctl.c:1055 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:1055
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The buggy address belongs to the object at ffff8880212cb800
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 24 bytes inside of
 512-byte region [ffff8880212cb800, ffff8880212cba00)
The buggy address belongs to the page:
page:ffffea000084b200 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x212c8
head:ffffea000084b200 order:2 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 dead000000000100 dead000000000122 ffff888011041c80
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 8440, ts 58973220338, free_ts 58965641961
 prep_new_page mm/page_alloc.c:2358 [inline]
 get_page_from_freelist+0x1033/0x2b60 mm/page_alloc.c:3994
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5200
 alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1645 [inline]
 allocate_slab+0x2c5/0x4c0 mm/slub.c:1785
 new_slab mm/slub.c:1848 [inline]
 new_slab_objects mm/slub.c:2594 [inline]
 ___slab_alloc+0x4a1/0x810 mm/slub.c:2757
 __slab_alloc.constprop.0+0xa7/0xf0 mm/slub.c:2797
 slab_alloc_node mm/slub.c:2879 [inline]
 slab_alloc mm/slub.c:2921 [inline]
 __kmalloc+0x315/0x330 mm/slub.c:4055
 kmalloc include/linux/slab.h:561 [inline]
 kzalloc include/linux/slab.h:686 [inline]
 tomoyo_init_log+0x1376/0x1ee0 security/tomoyo/audit.c:275
 tomoyo_supervisor+0x34d/0xf00 security/tomoyo/common.c:2097
 tomoyo_audit_path_log security/tomoyo/file.c:168 [inline]
 tomoyo_path_permission security/tomoyo/file.c:587 [inline]
 tomoyo_path_permission+0x270/0x3a0 security/tomoyo/file.c:573
 tomoyo_path_perm+0x2f0/0x400 security/tomoyo/file.c:838
 security_inode_getattr+0xcf/0x140 security/security.c:1332
 vfs_getattr fs/stat.c:139 [inline]
 vfs_statx+0x164/0x390 fs/stat.c:207
 vfs_fstatat fs/stat.c:225 [inline]
 vfs_lstat include/linux/fs.h:3384 [inline]
 __do_sys_newlstat+0x91/0x110 fs/stat.c:380
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1298 [inline]
 __free_pages_ok+0x476/0xce0 mm/page_alloc.c:1572
 stack_depot_save+0x162/0x4e0 lib/stackdepot.c:336
 kasan_save_stack+0x32/0x40 mm/kasan/common.c:40
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:428 [inline]
 ____kasan_kmalloc mm/kasan/common.c:507 [inline]
 ____kasan_kmalloc mm/kasan/common.c:466 [inline]
 __kasan_kmalloc+0x9b/0xd0 mm/kasan/common.c:516
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:686 [inline]
 batadv_bla_get_backbone_gw+0xb8/0xb00 net/batman-adv/bridge_loop_avoidance.c:502
 batadv_bla_update_own_backbone_gw net/batman-adv/bridge_loop_avoidance.c:565 [inline]
 batadv_bla_tx+0x15d/0x24d0 net/batman-adv/bridge_loop_avoidance.c:2100
 batadv_interface_tx+0x45b/0x1660 net/batman-adv/soft-interface.c:238
 __netdev_start_xmit include/linux/netdevice.h:4944 [inline]
 netdev_start_xmit include/linux/netdevice.h:4958 [inline]
 xmit_one net/core/dev.c:3654 [inline]
 dev_hard_start_xmit+0x1eb/0x920 net/core/dev.c:3670
 __dev_queue_xmit+0x2133/0x3130 net/core/dev.c:4246
 neigh_resolve_output net/core/neighbour.c:1495 [inline]
 neigh_resolve_output+0x50e/0x820 net/core/neighbour.c:1475
 neigh_output include/net/neighbour.h:510 [inline]
 ip6_finish_output2+0x6ee/0x1700 net/ipv6/ip6_output.c:117
 __ip6_finish_output net/ipv6/ip6_output.c:182 [inline]
 __ip6_finish_output+0x4c1/0xe10 net/ipv6/ip6_output.c:161
 ip6_finish_output+0x35/0x200 net/ipv6/ip6_output.c:192
 NF_HOOK_COND include/linux/netfilter.h:290 [inline]
 ip6_output+0x1e4/0x530 net/ipv6/ip6_output.c:215
 dst_output include/net/dst.h:448 [inline]
 NF_HOOK include/linux/netfilter.h:301 [inline]
 ndisc_send_skb+0xa99/0x1750 net/ipv6/ndisc.c:508
 ndisc_send_ns+0x3a9/0x840 net/ipv6/ndisc.c:650

Memory state around the buggy address:
 ffff8880212cb700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880212cb780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880212cb800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff8880212cb880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880212cb900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
