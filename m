Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7F7B7A7B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD61A10E123;
	Wed,  4 Oct 2023 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com
 [209.85.167.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B7610E123
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 08:45:47 +0000 (UTC)
Received: by mail-oi1-f207.google.com with SMTP id
 5614622812f47-3af609cb0afso2685544b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 01:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696409147; x=1697013947;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2LXOqdL09PdEzf2Z1P9MseJKNWEnjUR6MgaW5Ba4b4k=;
 b=A7LeewKpkRMAzK0+ZSLMpIRnBrubZh+f26X8JLmYK1IST6Uf1wnPkzfKPEQFVqpHkt
 Eh8YjKXXXLkR8adQulZSARTj2DMe3apW2z9AU8GJL808fuvVJb3O5PAZOm2epZ69/ag7
 h0IFA2lDoP71GtoYi9JimwTfCKRYtkyKB5FC+orJHfNv3xYjT/bfOsRDZ1gppEM3OlPx
 tCTUB7p7HOZ1070d2YDDr7v3SFJR6t1+C5eU8Lj3d4h70vBHxH1WbOA3ydAMQEKQWb4y
 cKmMHugrWl7YEOOsaYgtonIwoCLbwdDRwDZK2sg/Ijhl/A19y2lEA62E7mMMGCS9X/GT
 cwEw==
X-Gm-Message-State: AOJu0YxLjObgdEmo4NhjpoWEGJrmoVoH0+bkL2s9vFtfsEjZCAx9xFrT
 gQyZcNKa71TmS5ZlILoG3VQdusgaq3NT11ej22z4uUwlCue7
X-Google-Smtp-Source: AGHT+IEWHp6cZMFHBw7kmkOx2YxIFrzIHl4HLYaXzfrBPgZGJg8qTVWaj9fO4RD6PsRAIDixFw9mWzpyJokD1Sg8QvuLcge10uZY
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23d0:b0:3a8:74ff:6c01 with SMTP id
 bq16-20020a05680823d000b003a874ff6c01mr1053711oib.5.1696409147021; Wed, 04
 Oct 2023 01:45:47 -0700 (PDT)
Date: Wed, 04 Oct 2023 01:45:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009a1d4a0606e008dc@google.com>
Subject: [syzbot] [fbdev?] general protection fault in bit_putcs
From: syzbot <syzbot+524697c54d6e7ec67cf2@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

HEAD commit:    2e530aeb342b Merge branch 'for-next/core', remote-tracking..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=121c1fe6680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5cc95add722fb0c1
dashboard link: https://syzkaller.appspot.com/bug?extid=524697c54d6e7ec67cf2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b93281680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1076e749680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2468ab4c933e/disk-2e530aeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bd3708bf8a20/vmlinux-2e530aeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/86bc7d3468f9/Image-2e530aeb.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+524697c54d6e7ec67cf2@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address dfff800000000040
KASAN: null-ptr-deref in range [0x0000000000000200-0x0000000000000207]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[dfff800000000040] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 6015 Comm: syz-executor865 Not tainted 6.6.0-rc3-syzkaller-g2e530aeb342b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __fb_pad_aligned_buffer include/linux/fb.h:629 [inline]
pc : bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
pc : bit_putcs+0x958/0xe30 drivers/video/fbdev/core/bitblit.c:185
lr : __fb_pad_aligned_buffer include/linux/fb.h:626 [inline]
lr : bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
lr : bit_putcs+0x93c/0xe30 drivers/video/fbdev/core/bitblit.c:185
sp : ffff800096a974a0
x29: ffff800096a976b0 x28: 0000000000000200 x27: ffff0000c8fb9010
x26: ffff0000c8fb9010 x25: 000000000000000f x24: dfff800000000000
x23: 0000000000000080 x22: 0000000000000000 x21: 0000000000000000
x20: ffff0000c0032440 x19: 0000000000000200 x18: ffff800096a96dc0
x17: ffff80008e19d000 x16: ffff80008a576f00 x15: 0000000000000009
x14: 1ffff00012d52ec1 x13: 0000000000000000 x12: 00000000ffffffff
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : 0000000000000040 x7 : 0000000000000000 x6 : 0000000000000007
x5 : 0000000000000000 x4 : 0000000000000008 x3 : ffff8000831e57e8
x2 : 0000000000000800 x1 : 0000000000000010 x0 : 0000000000000000
Call trace:
 __fb_pad_aligned_buffer include/linux/fb.h:629 [inline]
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
 bit_putcs+0x958/0xe30 drivers/video/fbdev/core/bitblit.c:185
 fbcon_putcs+0x318/0x4e8 drivers/video/fbdev/core/fbcon.c:1282
 do_update_region+0x42c/0x5f8 drivers/tty/vt/vt.c:623
 redraw_screen+0x82c/0xd54 drivers/tty/vt/vt.c:983
 fbcon_modechanged+0x9f4/0x1090 drivers/video/fbdev/core/fbcon.c:2703
 fbcon_update_vcs+0x3c/0x4c drivers/video/fbdev/core/fbcon.c:2748
 do_fb_ioctl+0xa68/0xd24 drivers/video/fbdev/core/fb_chrdev.c:92
 fb_ioctl+0xec/0x134 drivers/video/fbdev/core/fb_chrdev.c:169
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
 el0_svc+0x58/0x16c arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595
Code: 51000679 aa1c03f3 d343fe68 12000a69 (38f86908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	51000679 	sub	w25, w19, #0x1
   4:	aa1c03f3 	mov	x19, x28
   8:	d343fe68 	lsr	x8, x19, #3
   c:	12000a69 	and	w9, w19, #0x7
* 10:	38f86908 	ldrsb	w8, [x8, x24] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
