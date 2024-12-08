Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5178F9E837B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 05:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D22510E074;
	Sun,  8 Dec 2024 04:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com
 [209.85.166.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6323610E074
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 04:00:33 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3a7cf41b54eso68121835ab.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 20:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733630432; x=1734235232;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqj5FgiA419awiy6wOZrg0NF4TVNBwvb8uFfrKyQaDo=;
 b=hFAIVeT+QeFS39mjVHUE9+zhqMlaNczlWza+1ixpAPTFctWmdlFEYJ8HCQJxWurmDf
 ZDX+Sf6QHqAivdn66Mcp0YYqtTRr6/1TALcAKGIHpPJVcd98eYgTA14ISTiA+vlTpzl1
 gDcxdv2dJzVLA9ZCNDHgGYN5nGH6od9NhcjAEgVnQdc/EqYxJANbTqjnUsoFER8oEpYK
 +LRJxg9xXv90pEhT+j306aE5cpqGcqKRtyxTjx8p5YZIloEw4xWwc8ZRF7BhnUoyP5jx
 6tirl2a6qha0DnysfkLCOiKjktnD4yYxI7pbCt8fb0UFwRhL6OG2nHd2KD1uBO5C9tLl
 lvZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBDDqPczTdmfgZJz72AK3MdZl13bGqh4GTxr4u/g0FLqRoA1sHEwyWVi1DBmaCUlfLvi3jKTXMVOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEd4VVjsM20YIAySXpxa1APVV2LDTulTPvuPqztRQsxBSZArrB
 EXpqyxOOH2iiyL3o15RHnLcjE32Hh8dRCt9aXX6PJSpYeBpuCDFfiFgBgrv1RIVXxy37E+jTE8c
 AGAHqq0hOzT9r4Bm0ob0QmPscX5XmOhib7nuPv+D/U/lmXoXWNKLKB08=
X-Google-Smtp-Source: AGHT+IFHf0Dkug3m0UW0KCjUANAMGQCatuzzJZiMruXjBtT5AZvcYpQL756SPfTAyHlXlmdqoG1FF4Lef5QO82oUysMWkbIoNzch
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1487:b0:3a7:21ad:72a9 with SMTP id
 e9e14a558f8ab-3a811e073afmr90744025ab.17.1733630432571; Sat, 07 Dec 2024
 20:00:32 -0800 (PST)
Date: Sat, 07 Dec 2024 20:00:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675519e0.050a0220.2477f.0025.GAE@google.com>
Subject: [syzbot] [fbdev?] BUG: unable to handle kernel paging request in
 bitfill_aligned (4)
From: syzbot <syzbot+66bde8e1e4161d4b2cca@syzkaller.appspotmail.com>
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

HEAD commit:    4a5df3796467 Merge tag 'mm-hotfixes-stable-2024-11-16-15-3..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149b5378580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4fca5d6b7cd3e6f
dashboard link: https://syzkaller.appspot.com/bug?extid=66bde8e1e4161d4b2cca
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-4a5df379.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/06ed0d86cf9b/vmlinux-4a5df379.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ffbf9a25c303/bzImage-4a5df379.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+66bde8e1e4161d4b2cca@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffc90004f81000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 1b000067 P4D 1b000067 PUD 1c281067 PMD 2508d067 PTE 0
Oops: Oops: 0002 [#1] PREEMPT SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 7998 Comm: syz.4.504 Not tainted 6.12.0-rc7-syzkaller-00212-g4a5df3796467 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:60 [inline]
RIP: 0010:memset_l include/linux/string.h:240 [inline]
RIP: 0010:bitfill_aligned drivers/video/fbdev/core/sysfillrect.c:53 [inline]
RIP: 0010:bitfill_aligned+0x183/0x210 drivers/video/fbdev/core/sysfillrect.c:25
Code: 44 24 08 48 31 d0 49 89 45 f8 44 89 e0 29 e8 29 c3 e8 31 51 b4 fc 89 d8 31 d2 4c 89 ef 41 f7 f4 48 89 c3 48 89 c1 48 8b 04 24 <f3> 48 ab 31 ff 4c 89 f6 e8 80 53 b4 fc 4d 85 f6 0f 84 6a ff ff ff
RSP: 0018:ffffc90003a7f6b8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000208 RCX: 0000000000000008
RDX: 0000000000000000 RSI: ffffffff84d92a2f RDI: ffffc90004f81000
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000040
R13: ffffc90004f80000 R14: 0000000000000000 R15: 0000000000008200
FS:  00007fc3433a96c0(0000) GS:ffff88806a800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90004f81000 CR3: 000000004c6ac000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 sys_fillrect+0x47b/0x900 drivers/video/fbdev/core/sysfillrect.c:284
 drm_fbdev_shmem_defio_fillrect+0x22/0x140 drivers/gpu/drm/drm_fbdev_shmem.c:39
 bit_clear_margins+0x302/0x4f0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins.constprop.0+0x1d0/0x290 drivers/video/fbdev/core/fbcon.c:1319
 fbcon_switch+0xa30/0x14f0 drivers/video/fbdev/core/fbcon.c:2190
 redraw_screen+0x2bf/0x760 drivers/tty/vt/vt.c:957
 fbcon_set_disp+0x7cc/0xe00 drivers/video/fbdev/core/fbcon.c:1412
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:812 [inline]
 set_con2fb_map+0x6fd/0x1060 drivers/video/fbdev/core/fbcon.c:885
 fbcon_set_con2fb_map_ioctl+0x16d/0x220 drivers/video/fbdev/core/fbcon.c:3112
 do_fb_ioctl+0x32a/0x7d0 drivers/video/fbdev/core/fb_chrdev.c:138
 fb_ioctl+0xe5/0x150 drivers/video/fbdev/core/fb_chrdev.c:169
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18f/0x220 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc34257e719
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc3433a9038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc342736130 RCX: 00007fc34257e719
RDX: 00000000200005c0 RSI: 0000000000004610 RDI: 0000000000000004
RBP: 00007fc3425f175e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fc342736130 R15: 00007ffee2ee6ad8
 </TASK>
Modules linked in:
CR2: ffffc90004f81000
---[ end trace 0000000000000000 ]---
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:60 [inline]
RIP: 0010:memset_l include/linux/string.h:240 [inline]
RIP: 0010:bitfill_aligned drivers/video/fbdev/core/sysfillrect.c:53 [inline]
RIP: 0010:bitfill_aligned+0x183/0x210 drivers/video/fbdev/core/sysfillrect.c:25
Code: 44 24 08 48 31 d0 49 89 45 f8 44 89 e0 29 e8 29 c3 e8 31 51 b4 fc 89 d8 31 d2 4c 89 ef 41 f7 f4 48 89 c3 48 89 c1 48 8b 04 24 <f3> 48 ab 31 ff 4c 89 f6 e8 80 53 b4 fc 4d 85 f6 0f 84 6a ff ff ff
RSP: 0018:ffffc90003a7f6b8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000208 RCX: 0000000000000008
RDX: 0000000000000000 RSI: ffffffff84d92a2f RDI: ffffc90004f81000
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000040
R13: ffffc90004f80000 R14: 0000000000000000 R15: 0000000000008200
FS:  00007fc3433a96c0(0000) GS:ffff88806a800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90004f81000 CR3: 000000004c6ac000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	44 24 08             	rex.R and $0x8,%al
   3:	48 31 d0             	xor    %rdx,%rax
   6:	49 89 45 f8          	mov    %rax,-0x8(%r13)
   a:	44 89 e0             	mov    %r12d,%eax
   d:	29 e8                	sub    %ebp,%eax
   f:	29 c3                	sub    %eax,%ebx
  11:	e8 31 51 b4 fc       	call   0xfcb45147
  16:	89 d8                	mov    %ebx,%eax
  18:	31 d2                	xor    %edx,%edx
  1a:	4c 89 ef             	mov    %r13,%rdi
  1d:	41 f7 f4             	div    %r12d
  20:	48 89 c3             	mov    %rax,%rbx
  23:	48 89 c1             	mov    %rax,%rcx
  26:	48 8b 04 24          	mov    (%rsp),%rax
* 2a:	f3 48 ab             	rep stos %rax,%es:(%rdi) <-- trapping instruction
  2d:	31 ff                	xor    %edi,%edi
  2f:	4c 89 f6             	mov    %r14,%rsi
  32:	e8 80 53 b4 fc       	call   0xfcb453b7
  37:	4d 85 f6             	test   %r14,%r14
  3a:	0f 84 6a ff ff ff    	je     0xffffffaa


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
