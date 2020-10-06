Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841F28596F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDFC6E8AB;
	Wed,  7 Oct 2020 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com
 [209.85.166.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3E789DFC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 08:18:17 +0000 (UTC)
Received: by mail-io1-f79.google.com with SMTP id f6so6639593ion.21
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 01:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=3iXoyWE9QpsbIxGQb53Oatf3hkqGhfMvj71wpaSp11w=;
 b=SgECWDnMhDgdeVYjimU1resek77avXpmxq+6dIDfnP8ylVeZGXJCOKCp2V4w4V2Q6z
 aRfBmP68Yd7v7gzPLAbxOeHKVUDkjTYwHlXsCNr9fOyRGTJlY+Vnvw2D54U4Sez6J9Ne
 AGMWDSI/om7U3Zwhonli4yTWhF93deGYq/mYuJOe5BHFJ9XJBkFHhpw3uuncBYta/sjZ
 zvnr/YtR2vpdQM/sXmU+42CCC4YXi7oBmIzC/5Vmyai0/22QE6p7LhYz8eqSyuGTEGbq
 j3Yj3Tj87jD+gpcEJopBEufwIIL7elsfIcj5iMi7YQfzIfXyA49+9IKF6EeEzq0f/Qfn
 Euxw==
X-Gm-Message-State: AOAM531VxUuXxu5yrVd+6mijpSo+spbEznmZMHBC2ewDh6l4n7Aseq5N
 2QB7TC8Ka0xY9Vo7MG0UNgs2n84Ld6Jo7BpglEEVQBak1OtG
X-Google-Smtp-Source: ABdhPJzx3VVCj7+BNkqwCC9s9XMKSakAVVf31P8/nULMOx5e5X4ZqrZuVaX1f/VOXNaX/5rfI7bi62mKjUgbQCXIaIKRlHu9M6WL
MIME-Version: 1.0
X-Received: by 2002:a92:c5af:: with SMTP id r15mr2736276ilt.88.1601972296942; 
 Tue, 06 Oct 2020 01:18:16 -0700 (PDT)
Date: Tue, 06 Oct 2020 01:18:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b30cad05b0fc3d74@google.com>
Subject: BUG: unable to handle kernel paging request in cfb_imageblit
From: syzbot <syzbot+dfd0b1c6705301cc4847@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    22fbc037 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133731eb900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e672827d2ffab1f
dashboard link: https://syzkaller.appspot.com/bug?extid=dfd0b1c6705301cc4847
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ba9a5d900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17cfd4af900000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1536a750500000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1736a750500000
console output: https://syzkaller.appspot.com/x/log.txt?x=1336a750500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dfd0b1c6705301cc4847@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffff888001000018
#PF: supervisor write access in kernel mode
#PF: error_code(0x0003) - permissions violation
PGD c801067 P4D c801067 PUD c802067 PMD 80000000010001e1 
Oops: 0003 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 8241 Comm: syz-executor265 Not tainted 5.9.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__writel arch/x86/include/asm/io.h:71 [inline]
RIP: 0010:slow_imageblit drivers/video/fbdev/core/cfbimgblt.c:178 [inline]
RIP: 0010:cfb_imageblit+0xb15/0x11e0 drivers/video/fbdev/core/cfbimgblt.c:302
Code: 89 e6 89 e9 41 d3 e6 41 09 de 89 ef 8b 5c 24 28 89 de e8 0e db 81 fd 39 dd 73 0a e8 65 d9 81 fd eb 42 0f 1f 00 48 8b 44 24 30 <44> 89 30 48 83 c0 04 48 89 44 24 30 89 ef 89 de e8 e6 da 81 fd 39
RSP: 0018:ffffc9000a037558 EFLAGS: 00010246
RAX: ffff888001000018 RBX: 000000000000001c RCX: 000000000000001c
RDX: ffff8880a79880c0 RSI: 000000000000001c RDI: 000000000000001c
RBP: 000000000000001c R08: ffffffff83f32412 R09: ffffffff83f31b7c
R10: 0000000000000002 R11: ffff8880a79880c0 R12: 0000000000000000
R13: ffff888218a81f72 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f8534532700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff888001000018 CR3: 00000000a80b4000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 soft_cursor+0xb44/0xdb0 drivers/video/fbdev/core/softcursor.c:74
 bit_cursor+0x1753/0x2110 drivers/video/fbdev/core/bitblit.c:377
 set_cursor drivers/tty/vt/vt.c:919 [inline]
 con_flush_chars+0x4e1/0x640 drivers/tty/vt/vt.c:3330
 con_write+0x2a/0x40 drivers/tty/vt/vt.c:3251
 do_output_char+0x63b/0x940 drivers/tty/n_tty.c:447
 __process_echoes+0x2a3/0x930 drivers/tty/n_tty.c:739
 flush_echoes drivers/tty/n_tty.c:829 [inline]
 __receive_buf drivers/tty/n_tty.c:1648 [inline]
 n_tty_receive_buf_common+0x29fa/0x3100 drivers/tty/n_tty.c:1742
 paste_selection+0x32c/0x450 drivers/tty/vt/selection.c:408
 vt_ioctl+0x105a/0x3d70 drivers/tty/vt/vt_ioctl.c:862
 tty_ioctl+0xee4/0x15c0 drivers/tty/tty_io.c:2656
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:739
 do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x449809
Code: e8 8c e7 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 5b 05 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f8534531db8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000006dec68 RCX: 0000000000449809
RDX: 0000000020000080 RSI: 000000000000541c RDI: 0000000000000007
RBP: 00000000006dec60 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dec6c
R13: 00007ffe8074321f R14: 00007f85345329c0 R15: 0000000000000064
Modules linked in:
CR2: ffff888001000018
---[ end trace 4ec628432d38a26a ]---
RIP: 0010:__writel arch/x86/include/asm/io.h:71 [inline]
RIP: 0010:slow_imageblit drivers/video/fbdev/core/cfbimgblt.c:178 [inline]
RIP: 0010:cfb_imageblit+0xb15/0x11e0 drivers/video/fbdev/core/cfbimgblt.c:302
Code: 89 e6 89 e9 41 d3 e6 41 09 de 89 ef 8b 5c 24 28 89 de e8 0e db 81 fd 39 dd 73 0a e8 65 d9 81 fd eb 42 0f 1f 00 48 8b 44 24 30 <44> 89 30 48 83 c0 04 48 89 44 24 30 89 ef 89 de e8 e6 da 81 fd 39
RSP: 0018:ffffc9000a037558 EFLAGS: 00010246
RAX: ffff888001000018 RBX: 000000000000001c RCX: 000000000000001c
RDX: ffff8880a79880c0 RSI: 000000000000001c RDI: 000000000000001c
RBP: 000000000000001c R08: ffffffff83f32412 R09: ffffffff83f31b7c
R10: 0000000000000002 R11: ffff8880a79880c0 R12: 0000000000000000
R13: ffff888218a81f72 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f8534532700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff888001000018 CR3: 00000000a80b4000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
