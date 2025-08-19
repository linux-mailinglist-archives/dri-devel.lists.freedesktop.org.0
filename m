Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81F2B2C8A8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 17:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8710E63C;
	Tue, 19 Aug 2025 15:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234CC10E630
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 15:42:33 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3e56ffea78fso72406735ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 08:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755618152; x=1756222952;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TK/EKS4eetX6yWIzFURmsvpvay0L/jjfJICuasx8m/w=;
 b=vQoBlR0oVurhicDxBXVmRPf5Wj8HkqTd08d4l2IyI4GikdTNWtksxFhcqEPTXZ+8Er
 54PNssFiK6b3THUbNVZED2uGmrWi3DEGeZExp+Bz5l3jLNXFvMr7Rc/V0aGk+4cIJP0t
 7X37SnY6IqrJLRXpjtiitrpE7+o6e9zvqCz+kysB2GAvC43StvCMlP/la3JhadWULThD
 uOXGZfOgHGjcIW43nCzlN3LnkNnFQtqQFam0uJVXd63b5FGMsfpPN9tPMbINcrs1BPfj
 EjMh125ad/QL3bZHhYALxZzQ59XEm87ZCqWWJZrVl+9BiCljDQyPLngqZw22uF4xshIt
 L8sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYRv4cD/j2gnQlsJmbo9BB3JQbF9eGIn+P4M/QP0YZLGW8tOhTmuVbulXskCKqErDjo3mIH7YqLrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVuxUzPe4CuAhg/p7djlT46H2A/YLiEEezTRNbAWZI9yrUiC7z
 /kDFiEI5qAU7PLv+zpFoofp+4rgjdm06F7fuhMXz0wRoYVwrCYLZ6mp9hkhSVoqO4gXd1YNRgNe
 dfuzR+yByGhhhtIDRVP6MFfBvfilHZmTCw1A3eUltjhk5QqPuuv4Kc3NBbwU=
X-Google-Smtp-Source: AGHT+IG+tROFW0E1dZyO6C+QKpjUNes+pj0QDAa/psex7DDHuBGxS4hRm8Ylrb+BrYUcIoIO8WOTSFjT6ruU99cVNGd+04dB9D/X
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a63:b0:3e5:7dac:d696 with SMTP id
 e9e14a558f8ab-3e676668a28mr55937245ab.19.1755618152193; Tue, 19 Aug 2025
 08:42:32 -0700 (PDT)
Date: Tue, 19 Aug 2025 08:42:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68a49b68.050a0220.e29e5.00c9.GAE@google.com>
Subject: [syzbot] [fbdev?] KASAN: slab-out-of-bounds Read in
 fb_pad_aligned_buffer (2)
From: syzbot <syzbot+ef4f385c7132a39eabb2@syzkaller.appspotmail.com>
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

HEAD commit:    2674d1eadaa2 Add linux-next specific files for 20250812
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10c12af0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=712e4169f26d539a
dashboard link: https://syzkaller.appspot.com/bug?extid=ef4f385c7132a39eabb2
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d6fec408ef67/disk-2674d1ea.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/27b3f312fa12/vmlinux-2674d1ea.xz
kernel image: https://storage.googleapis.com/syzbot-assets/56e7b0c45a7e/bzImage-2674d1ea.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ef4f385c7132a39eabb2@syzkaller.appspotmail.com

overlayfs: conflicting options: nfs_export=on,metacopy=on
==================================================================
BUG: KASAN: slab-out-of-bounds in __fb_pad_aligned_buffer include/linux/fb.h:641 [inline]
BUG: KASAN: slab-out-of-bounds in fb_pad_aligned_buffer+0x57e/0x5f0 drivers/video/fbdev/core/fbmem.c:96
Read of size 1 at addr ffff8880593d7a10 by task syz.6.4465/21843

CPU: 1 UID: 0 PID: 21843 Comm: syz.6.4465 Not tainted 6.17.0-rc1-next-20250812-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 __fb_pad_aligned_buffer include/linux/fb.h:641 [inline]
 fb_pad_aligned_buffer+0x57e/0x5f0 drivers/video/fbdev/core/fbmem.c:96
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:98 [inline]
 bit_putcs+0x1648/0x1a50 drivers/video/fbdev/core/bitblit.c:184
 fbcon_putcs+0x3e5/0x5f0 drivers/video/fbdev/core/fbcon.c:1327
 do_update_region+0x21c/0x440 drivers/tty/vt/vt.c:617
 update_region+0x1ce/0x490 drivers/tty/vt/vt.c:641
 vcs_write+0xd65/0x1260 drivers/tty/vt/vc_screen.c:698
 do_loop_readv_writev fs/read_write.c:850 [inline]
 vfs_writev+0x4b6/0x960 fs/read_write.c:1059
 do_writev+0x14d/0x2d0 fs/read_write.c:1103
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f68db78ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f68dc5ed038 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007f68db9b5fa0 RCX: 00007f68db78ebe9
RDX: 000000000000000e RSI: 0000200000000c40 RDI: 0000000000000004
RBP: 00007f68db811e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f68db9b6038 R14: 00007f68db9b5fa0 R15: 00007fff61c4c208
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880593d7a80 pfn:0x593d4
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f8(unknown)
raw: 00fff00000000040 0000000000000000 dead000000000122 0000000000000000
raw: ffff8880593d7a80 0000000000000000 00000000f8000000 0000000000000000
head: 00fff00000000040 0000000000000000 dead000000000122 0000000000000000
head: ffff8880593d7a80 0000000000000000 00000000f8000000 0000000000000000
head: 00fff00000000002 ffffea000164f501 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x140cc0(GFP_USER|__GFP_COMP), pid 19098, tgid 19083 (syz.1.3690), ts 809460860721, free_ts 809191260089
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5148
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 ___kmalloc_large_node+0x5f/0x1b0 mm/slub.c:4306
 __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:4337
 __do_kmalloc_node mm/slub.c:4353 [inline]
 __kmalloc_noprof+0x36f/0x4f0 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 fbcon_set_font+0x519/0xe90 drivers/video/fbdev/core/fbcon.c:2536
 con_font_set drivers/tty/vt/vt.c:4887 [inline]
 con_font_op+0xcac/0x1070 drivers/tty/vt/vt.c:4934
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x1a8a/0x1f00 drivers/tty/vt/vt_ioctl.c:751
 tty_ioctl+0x926/0xde0 drivers/tty/tty_io.c:2792
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 19061 tgid 19060 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2895
 discard_slab mm/slub.c:2753 [inline]
 __put_partials+0x156/0x1a0 mm/slub.c:3218
 put_cpu_partial+0x17c/0x250 mm/slub.c:3293
 __slab_free+0x2d5/0x3c0 mm/slub.c:4550
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:340
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4180 [inline]
 slab_alloc_node mm/slub.c:4229 [inline]
 __do_kmalloc_node mm/slub.c:4364 [inline]
 __kmalloc_noprof+0x224/0x4f0 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 tomoyo_realpath_from_path+0xe3/0x5d0 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x1e8/0x5a0 security/tomoyo/file.c:723
 security_file_ioctl+0xcb/0x2d0 security/security.c:2982
 __do_sys_ioctl fs/ioctl.c:592 [inline]
 __se_sys_ioctl+0x47/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880593d7900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8880593d7980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8880593d7a00: 00 00 fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                         ^
 ffff8880593d7a80: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
 ffff8880593d7b00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
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
