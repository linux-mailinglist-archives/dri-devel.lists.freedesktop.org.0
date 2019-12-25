Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0B12A742
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102B289E0E;
	Wed, 25 Dec 2019 10:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA3D89DDD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 08:17:10 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id d10so14885248iod.19
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 00:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=/9Bw7qmprJ0SOROl3Qu+Xe+XfMs8eXq753PbnDBLuKA=;
 b=s9VJ2r6Y50P8wzyzA2ots5ujDY5WR6qLv2BfB4XCuHXIo/tm0BDNCxLedWRgAor0vm
 vKY7X1ZSNu06KBXewt3+41qcWsxgcXT1lx6eZKlqjGolKLtj15vdfGaQvax7+U9aY+xq
 zAYEzlHpFK6iyf93jkOjhaY0WQysGBwEmPIbzOx+8LHYXLCaPrNBitcl/aTpzReMNBUB
 kOfLbrp9CHtHZ+QsWJSyQrC6fTzLUHpufNetosvclkEAiZ8F/q9KvOu1TbUvOQQdqzJ+
 PQYb3pOjE/HMgj5eQGrMmdx/0RVfdTtMQgCq3OXnwunkxSFru9RN3KatXT7wdcUZ2eJo
 AOLQ==
X-Gm-Message-State: APjAAAWjYTLx9dY5QJFfh0GN6Ky916PVpOEola0jLkncIM/7NU25r7uH
 Dtj1lHZQLKzourQj3I5slcF+dLNU6zVJWQxZxb6uLdL4gKvk
X-Google-Smtp-Source: APXvYqzIB8zOK+zR3revW5PFbqLD6T3fdiBkXdDLTBDlHwquDuD//F3froIF3R3qco/QYwemrlPmy5ZS3xhD60kOjIl3lfFAAag+
MIME-Version: 1.0
X-Received: by 2002:a92:d809:: with SMTP id y9mr35425076ilm.261.1577261830210; 
 Wed, 25 Dec 2019 00:17:10 -0800 (PST)
Date: Wed, 25 Dec 2019 00:17:10 -0800
In-Reply-To: <0000000000001b2f4605991a4cc0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b8ab1059a82e37d@google.com>
Subject: Re: KASAN: use-after-free Read in fb_mode_is_equal
From: syzbot <syzbot+f11cda116c57db68c227@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, hdanton@sina.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mojha@codeaurora.org, shile.zhang@linux.alibaba.com, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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

syzbot has found a reproducer for the following crash on:

HEAD commit:    46cf053e Linux 5.5-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15cf54e1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed9d672709340e35
dashboard link: https://syzkaller.appspot.com/bug?extid=f11cda116c57db68c227
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10563ec1e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f11cda116c57db68c227@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in fb_mode_is_equal+0x297/0x300  
drivers/video/fbdev/core/modedb.c:924
Read of size 4 at addr ffff8880946fcf9c by task syz-executor.3/9638

CPU: 0 PID: 9638 Comm: syz-executor.3 Not tainted 5.5.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  __asan_report_load4_noabort+0x14/0x20 mm/kasan/generic_report.c:134
  fb_mode_is_equal+0x297/0x300 drivers/video/fbdev/core/modedb.c:924
  fbcon_mode_deleted+0x12c/0x190 drivers/video/fbdev/core/fbcon.c:3060
  fb_set_var+0xab9/0xdd0 drivers/video/fbdev/core/fbmem.c:971
  do_fb_ioctl+0x390/0x7d0 drivers/video/fbdev/core/fbmem.c:1104
  fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a919
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ff6d156bc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a919
RDX: 0000000020000000 RSI: 0000000000004601 RDI: 0000000000000013
RBP: 000000000075bfc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff6d156c6d4
R13: 00000000004c310d R14: 00000000004d8498 R15: 00000000ffffffff

Allocated by task 9451:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  __kasan_kmalloc mm/kasan/common.c:513 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
  kmalloc include/linux/slab.h:556 [inline]
  fb_add_videomode drivers/video/fbdev/core/modedb.c:1073 [inline]
  fb_add_videomode+0x2fb/0x610 drivers/video/fbdev/core/modedb.c:1057
  fb_set_var+0x5ef/0xdd0 drivers/video/fbdev/core/fbmem.c:1041
  do_fb_ioctl+0x390/0x7d0 drivers/video/fbdev/core/fbmem.c:1104
  fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 9620:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  kasan_set_free_info mm/kasan/common.c:335 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
  __cache_free mm/slab.c:3426 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3757
  fb_delete_videomode+0x3fa/0x540 drivers/video/fbdev/core/modedb.c:1104
  fb_set_var+0xac8/0xdd0 drivers/video/fbdev/core/fbmem.c:974
  do_fb_ioctl+0x390/0x7d0 drivers/video/fbdev/core/fbmem.c:1104
  fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8880946fcf80
  which belongs to the cache kmalloc-96 of size 96
The buggy address is located 28 bytes inside of
  96-byte region [ffff8880946fcf80, ffff8880946fcfe0)
The buggy address belongs to the page:
page:ffffea000251bf00 refcount:1 mapcount:0 mapping:ffff8880aa400540  
index:0x0
raw: 00fffe0000000200 ffffea00023b2ac8 ffffea000203fc08 ffff8880aa400540
raw: 0000000000000000 ffff8880946fc000 0000000100000020 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880946fce80: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
  ffff8880946fcf00: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
> ffff8880946fcf80: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                             ^
  ffff8880946fd000: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
  ffff8880946fd080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
