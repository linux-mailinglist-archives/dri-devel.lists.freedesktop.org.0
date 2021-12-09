Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63AD46F6C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7438110E12B;
	Thu,  9 Dec 2021 22:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EB210E212
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 18:25:19 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 k6-20020a0566022d8600b005e6ff1b6bbaso7845220iow.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 10:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=edrf3WGb+loDWPUhjhXV6BiUS2ZF3RBRAHKPa1IeGs0=;
 b=FV83vj1PxdLpzaOujEzZfwMCxFAw9FpCji/Fl9cHghzFNVCEGhRmEfHHu5fHb/FyAI
 N2lX6xudIa0AyEhn+E0UxwzvYfwqI5mqexqCUbVSdkKEGPLD6SIaKlReSkaTvw4VMZ0r
 eRp8oaY0VP1oUNy8H1qIdB4T3ad6PyNtKGfHjUDifwTTjHvF0YOqL2oSGXDRkvPz7NlI
 vofbDXaUBo3bO6rEni+wMUYZ3vgzuBhslyRLwr1AXEkio4my3wB/tP4hcq569D3mAWgP
 +1HaHQpcxhcDIn3k9gcfSrCgqRp2tcUuXfPxiQkVNq1yNMn0BnieEmV4x3kphjr+eMj+
 JR7w==
X-Gm-Message-State: AOAM530T/oorAfHief4T8YGmV3uyVjba934x1Wk5OkTwLaMopbAGa88H
 EnZQ5lwoq6K8rsMAOaRZUIuqSEDtLinbQBLOViE+xOUbPkF3
X-Google-Smtp-Source: ABdhPJznpQq6seoFNCr/7hO0cr5JyZeF0yLYtuJVhwAKd/jeo9++7bupaH5QCSmMHTOI5aYEuIXxw0lDy9Qpb4BMKB8c7987f09v
MIME-Version: 1.0
X-Received: by 2002:a92:c541:: with SMTP id a1mr17129451ilj.243.1639074319304; 
 Thu, 09 Dec 2021 10:25:19 -0800 (PST)
Date: Thu, 09 Dec 2021 10:25:19 -0800
In-Reply-To: <000000000000ab6df705b453993a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000900f3505d2baba20@google.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 bitfill_aligned (2)
From: syzbot <syzbot+a4edd73d589b0b7efbeb@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ngraniel@cocobongo.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Dec 2021 22:26:50 +0000
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

HEAD commit:    2a987e65025e Merge tag 'perf-tools-fixes-for-v5.16-2021-12..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f8fdc5b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d5e878e3399b6cc
dashboard link: https://syzkaller.appspot.com/bug?extid=a4edd73d589b0b7efbeb
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16671badb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122beabdb00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4edd73d589b0b7efbeb@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffff888001000030
#PF: supervisor write access in kernel mode
#PF: error_code(0x0003) - permissions violation
PGD 11201067 P4D 11201067 PUD 11202067 PMD 80000000010001e1 
Oops: 0003 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 6524 Comm: syz-executor260 Not tainted 5.16.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__writeq arch/x86/include/asm/io.h:98 [inline]
RIP: 0010:bitfill_aligned+0x1d2/0x270 drivers/video/fbdev/core/cfbfillrect.c:75
Code: 39 1b fd eb 09 e8 3e 39 1b fd 48 83 c3 40 31 ff 89 ee e8 41 3d 1b fd 85 ed 74 2c 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 ff cd <4c> 89 33 85 ed 74 0b 48 83 c3 08 e8 0e 39 1b fd eb ec e8 07 39 1b
RSP: 0018:ffffc90002b4ee38 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffff888001000030 RCX: ffff888020209d00
RDX: ffff888020209d00 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffffff84695e4f R09: 0000000000000040
R10: 0000000000000002 R11: ffff888020209d00 R12: ffffffffffffffff
R13: 0000000000000080 R14: 0000000000000000 R15: 0000000000000000
FS:  0000555555c14300(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff888001000030 CR3: 00000000708fb000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 cfb_fillrect+0x5d8/0x800 drivers/video/fbdev/core/cfbfillrect.c:327
 bit_clear_margins+0x2d7/0x6e0 drivers/video/fbdev/core/bitblit.c:209
 fbcon_clear_margins drivers/video/fbdev/core/fbcon.c:1296 [inline]
 fbcon_switch+0x1569/0x21f0 drivers/video/fbdev/core/fbcon.c:1677
 redraw_screen+0x53d/0x1280 drivers/tty/vt/vt.c:1021
 vc_do_resize+0x1361/0x1930 drivers/tty/vt/vt.c:1342
 fbcon_do_set_font+0x9ef/0x10d0 drivers/video/fbdev/core/fbcon.c:1928
 fbcon_set_font+0x9f9/0xc80 drivers/video/fbdev/core/fbcon.c:2014
 con_font_set drivers/tty/vt/vt.c:4666 [inline]
 con_font_op+0xbcd/0x1080 drivers/tty/vt/vt.c:4710
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x1838/0x3860 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0xfb2/0x17d0 drivers/tty/tty_io.c:2805
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f44f1232229
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffb8c823a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f44f1232229
RDX: 0000000020000400 RSI: 0000000000004b72 RDI: 0000000000000004
RBP: 0000000000000000 R08: 000000000000000d R09: 00007fffb8c82548
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f44f11f5820
R13: 431bde82d7b634db R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
CR2: ffff888001000030
---[ end trace 3cf2fa8eab0f5f7d ]---
RIP: 0010:__writeq arch/x86/include/asm/io.h:98 [inline]
RIP: 0010:bitfill_aligned+0x1d2/0x270 drivers/video/fbdev/core/cfbfillrect.c:75
Code: 39 1b fd eb 09 e8 3e 39 1b fd 48 83 c3 40 31 ff 89 ee e8 41 3d 1b fd 85 ed 74 2c 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 ff cd <4c> 89 33 85 ed 74 0b 48 83 c3 08 e8 0e 39 1b fd eb ec e8 07 39 1b
RSP: 0018:ffffc90002b4ee38 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffff888001000030 RCX: ffff888020209d00
RDX: ffff888020209d00 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffffff84695e4f R09: 0000000000000040
R10: 0000000000000002 R11: ffff888020209d00 R12: ffffffffffffffff
R13: 0000000000000080 R14: 0000000000000000 R15: 0000000000000000
FS:  0000555555c14300(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff888001000030 CR3: 00000000708fb000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	39 1b                	cmp    %ebx,(%rbx)
   2:	fd                   	std
   3:	eb 09                	jmp    0xe
   5:	e8 3e 39 1b fd       	callq  0xfd1b3948
   a:	48 83 c3 40          	add    $0x40,%rbx
   e:	31 ff                	xor    %edi,%edi
  10:	89 ee                	mov    %ebp,%esi
  12:	e8 41 3d 1b fd       	callq  0xfd1b3d58
  17:	85 ed                	test   %ebp,%ebp
  19:	74 2c                	je     0x47
  1b:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  22:	00 00 00
  25:	0f 1f 00             	nopl   (%rax)
  28:	ff cd                	dec    %ebp
* 2a:	4c 89 33             	mov    %r14,(%rbx) <-- trapping instruction
  2d:	85 ed                	test   %ebp,%ebp
  2f:	74 0b                	je     0x3c
  31:	48 83 c3 08          	add    $0x8,%rbx
  35:	e8 0e 39 1b fd       	callq  0xfd1b3948
  3a:	eb ec                	jmp    0x28
  3c:	e8                   	.byte 0xe8
  3d:	07                   	(bad)
  3e:	39 1b                	cmp    %ebx,(%rbx)

