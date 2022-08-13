Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AD591A7F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 15:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD5712A9B9;
	Sat, 13 Aug 2022 13:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99319B9FBB
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 13:12:25 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 o5-20020a056e02102500b002ddcc65029cso2258269ilj.8
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 06:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc;
 bh=VIlo//r0LJftEwzdeLRuWCYomg8j7vgvKsC6IKHpAPs=;
 b=54ciYfNhYUDO+ynsRt2FPPinERMuMm6oMIUxw0T63tdscSj7gWJfBAX7yJeN7NRbAt
 yhc2LyeIPqPLSEMzqmUVGtwMtjd5WEBqypTHWg3zCwHpQuQU/8D+IAcVGgtPNZexLF7h
 fJWb0utqqShBUzf9ulbN0lgJsNuy9bIlMJ5Uh2wjzQGhMG4kUVqtSZcA/puLYZ/4ZNnM
 46ybkNdkduHMo6P59wSpY2W/N9Fq6SKFjEPCtb9QGqzCZ5TXa1k+TxFTUHS7Wci27Ml+
 ISvTjVq4Hzwk6Gw5H6xbKev1xeGloZxjbuP9MFQdS1CBVLURL8SwD6+o5cNPqHNEFvnj
 Tvxw==
X-Gm-Message-State: ACgBeo2D4lKC6QGxT0lzHm9mc+lQUH3+/8L26zsujz2pH61ie9lyH8gx
 QtBY4Bw4Lm7H2oabY7rbnqOSlXDhjc7D5nfuU76Hq+RLJiD2
X-Google-Smtp-Source: AA6agR6GtsT0p+RwHDKPWmadUL9DyCtPMX2vz5jGfIJxRCI8OcAOWnrErc+Bq1037n79jugGpsig7UHwubgUmXa9oHCw5dopUhhw
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1843:b0:67d:d75:e503 with SMTP id
 d3-20020a056602184300b0067d0d75e503mr3510203ioi.36.1660396345016; Sat, 13 Aug
 2022 06:12:25 -0700 (PDT)
Date: Sat, 13 Aug 2022 06:12:25 -0700
In-Reply-To: <00000000000063154a05e382eae9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054c88505e61f265b@google.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 bitfill_aligned (3)
From: syzbot <syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 javierm@redhat.com, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    7ebfc85e2cd7 Merge tag 'net-6.0-rc1' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=179c3aa5080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=20bc0b329895d963
dashboard link: https://syzkaller.appspot.com/bug?extid=a168dbeaaa7778273c1b
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e0ef4b080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a1183d080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffc900043a1000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 12000067 P4D 12000067 PUD 121c9067 PMD 14733a067 PTE 0
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 3633 Comm: syz-executor339 Not tainted 5.19.0-syzkaller-13930-g7ebfc85e2cd7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:49 [inline]
RIP: 0010:memset_l include/linux/string.h:128 [inline]
RIP: 0010:bitfill_aligned+0x1ad/0x270 drivers/video/fbdev/core/sysfillrect.c:53
Code: 08 49 31 ef eb 66 e8 52 38 03 fd 45 89 e6 4c 8b 64 24 10 44 89 f0 31 d2 f7 f3 89 c3 48 8b 6c 24 08 48 89 e8 4c 89 e7 48 89 d9 <f3> 48 ab 31 ff 44 89 ee e8 46 3c 03 fd 4d 85 ed 74 5f 4d 8d 24 dc
RSP: 0018:ffffc90003a6f7e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000ffc RCX: 00000000000001fc
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900043a1000
RBP: 0000000000000000 R08: ffffffff848659ae R09: 0000000000000040
R10: 0000000000000002 R11: ffff888021ffd880 R12: ffffc9000439a000
R13: 0000000000000000 R14: 000000000003ff00 R15: ffffffffffffffff
FS:  0000555556df7300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc900043a1000 CR3: 0000000072ba0000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 sys_fillrect+0x5ce/0x7f0 drivers/video/fbdev/core/sysfillrect.c:281
 drm_fb_helper_sys_fillrect drivers/gpu/drm/drm_fb_helper.c:807 [inline]
 drm_fbdev_fb_fillrect+0x163/0x300 drivers/gpu/drm/drm_fb_helper.c:2322
 bit_clear_margins+0x3f1/0x6e0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins drivers/video/fbdev/core/fbcon.c:1306 [inline]
 fbcon_do_set_font+0xd7c/0x1330 drivers/video/fbdev/core/fbcon.c:2431
 fbcon_set_font+0xc29/0xf70 drivers/video/fbdev/core/fbcon.c:2519
 con_font_set drivers/tty/vt/vt.c:4666 [inline]
 con_font_op+0xbe8/0x1070 drivers/tty/vt/vt.c:4710
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x172e/0x1d00 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0x874/0xc60 drivers/tty/tty_io.c:2778
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7efe5924e239
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffba970648 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007efe5924e239
RDX: 0000000020000000 RSI: 0000000000004b72 RDI: 0000000000000004
RBP: 00007fffba970660 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000005
R13: 00007fffba97065c R14: 00007fffba970680 R15: 00007fffba970670
 </TASK>
Modules linked in:
CR2: ffffc900043a1000
---[ end trace 0000000000000000 ]---
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:49 [inline]
RIP: 0010:memset_l include/linux/string.h:128 [inline]
RIP: 0010:bitfill_aligned+0x1ad/0x270 drivers/video/fbdev/core/sysfillrect.c:53
Code: 08 49 31 ef eb 66 e8 52 38 03 fd 45 89 e6 4c 8b 64 24 10 44 89 f0 31 d2 f7 f3 89 c3 48 8b 6c 24 08 48 89 e8 4c 89 e7 48 89 d9 <f3> 48 ab 31 ff 44 89 ee e8 46 3c 03 fd 4d 85 ed 74 5f 4d 8d 24 dc
RSP: 0018:ffffc90003a6f7e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000ffc RCX: 00000000000001fc
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900043a1000
RBP: 0000000000000000 R08: ffffffff848659ae R09: 0000000000000040
R10: 0000000000000002 R11: ffff888021ffd880 R12: ffffc9000439a000
R13: 0000000000000000 R14: 000000000003ff00 R15: ffffffffffffffff
FS:  0000555556df7300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc900043a1000 CR3: 0000000072ba0000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	08 49 31             	or     %cl,0x31(%rcx)
   3:	ef                   	out    %eax,(%dx)
   4:	eb 66                	jmp    0x6c
   6:	e8 52 38 03 fd       	callq  0xfd03385d
   b:	45 89 e6             	mov    %r12d,%r14d
   e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  13:	44 89 f0             	mov    %r14d,%eax
  16:	31 d2                	xor    %edx,%edx
  18:	f7 f3                	div    %ebx
  1a:	89 c3                	mov    %eax,%ebx
  1c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  21:	48 89 e8             	mov    %rbp,%rax
  24:	4c 89 e7             	mov    %r12,%rdi
  27:	48 89 d9             	mov    %rbx,%rcx
* 2a:	f3 48 ab             	rep stos %rax,%es:(%rdi) <-- trapping instruction
  2d:	31 ff                	xor    %edi,%edi
  2f:	44 89 ee             	mov    %r13d,%esi
  32:	e8 46 3c 03 fd       	callq  0xfd033c7d
  37:	4d 85 ed             	test   %r13,%r13
  3a:	74 5f                	je     0x9b
  3c:	4d 8d 24 dc          	lea    (%r12,%rbx,8),%r12

