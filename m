Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD21CEDC6
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2506E85C;
	Tue, 12 May 2020 07:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F156E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:55:17 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id w16so6008872ilm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=0utPJhl8u3dQnuupDpTMqPJeqZpeiR+EaJx9ihO75P0=;
 b=RKySpBbtRM7lmMQ/aAEEQTtcANoeNpM8W/a6/vhT5iSEShYBo1FWeeimCEGxx53RFI
 Wzk4vLMPO6GOMFw2/ORGY0u1ZGjzKL0sJRbt7KYbRNm2GvJFmRvknEq0Lr5jxStzcgS+
 SwmYFu0sxyJ7De2GCxXoFnDdusuvxT+f/VF607x+Kdcs6fcoyqI7S5qjEl5BKt5jJOh9
 QGBHLj9xePVWQpvcNI0LdMjjluTvcWvfN/vnm7/WFO6kA5GQsOR5ggQUoTUCrPP7xEUI
 gz3OtdQvwQPOT0XZdY5SS7ZhTC/orMTY74mr5E3YmE4oh/vA3aI8Z+MaauNBXU8Yfr1F
 kCFA==
X-Gm-Message-State: AGi0PuYuB6LLS3yplTnb9jsp8xCG3SRPU6DD8qhcGSGTmjqTjqoScg0J
 TIVyXd5QAi8tV+HGO5UJgbbF8lLjid4wRJaIPFBZB/qUVFKQ
X-Google-Smtp-Source: APiQypKwCw/HVeBYlAIDKGK08rZj9zUSvpqZc6seXE0qHdOTdwDsdt0UCVGhbx/CgOyu5OpFdCQa9NkmKlPwkNqeQrBa6WUcwCoT
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:dc3:: with SMTP id
 l3mr19189526ilj.149.1589266516388; 
 Mon, 11 May 2020 23:55:16 -0700 (PDT)
Date: Mon, 11 May 2020 23:55:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000029b38c05a56df2b0@google.com>
Subject: BUG: unable to handle kernel paging request in bitfill_aligned
From: syzbot <syzbot+00ed1cf405874e141432@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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

syzbot found the following crash on:

HEAD commit:    1d3962ae Merge tag 'io_uring-5.7-2020-05-08' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14874258100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0212dbee046bc1f
dashboard link: https://syzkaller.appspot.com/bug?extid=00ed1cf405874e141432
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+00ed1cf405874e141432@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffff888000cf5080
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD d401067 P4D d401067 PUD d402067 PMD cf4063 PTE 0
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 30473 Comm: syz-executor.4 Not tainted 5.7.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__writeq arch/x86/include/asm/io.h:98 [inline]
RIP: 0010:bitfill_aligned drivers/video/fbdev/core/cfbfillrect.c:64 [inline]
RIP: 0010:bitfill_aligned+0xfc/0x200 drivers/video/fbdev/core/cfbfillrect.c:35
Code: fd 44 89 e0 31 d2 bf 07 00 00 00 f7 f5 41 89 c4 89 c6 89 c5 e8 c5 ab b3 fd 41 83 fc 07 76 62 45 89 e7 4c 89 ed e8 44 aa b3 fd <48> 89 5d 00 48 89 5d 08 48 89 5d 10 48 89 5d 18 48 89 5d 20 48 89
RSP: 0018:ffffc90001c474e0 EFLAGS: 00010246
RAX: 0000000000040000 RBX: 0000000000000000 RCX: ffffc90012324000
RDX: 0000000000040000 RSI: ffffffff83bf846c RDI: 0000000000000005
RBP: ffff888000cf5080 R08: ffff888056a6a340 R09: 0000000000000040
R10: ffff888218d3331f R11: ffffed10431a6663 R12: 0000000000000030
R13: ffff888000cf5080 R14: 0000000000000000 R15: 0000000000000030
FS:  00007fe0d9986700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff888000cf5080 CR3: 000000008ea77000 CR4: 00000000001426f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 cfb_fillrect+0x418/0x7a0 drivers/video/fbdev/core/cfbfillrect.c:327
 vga16fb_fillrect+0x68f/0x1960 drivers/video/fbdev/vga16fb.c:951
 bit_clear_margins+0x2d5/0x4a0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins+0x1de/0x240 drivers/video/fbdev/core/fbcon.c:1381
 fbcon_switch+0xcde/0x16f0 drivers/video/fbdev/core/fbcon.c:2363
 redraw_screen+0x2ae/0x770 drivers/tty/vt/vt.c:1015
 fbcon_modechanged+0x581/0x720 drivers/video/fbdev/core/fbcon.c:3000
 fbcon_update_vcs+0x3a/0x50 drivers/video/fbdev/core/fbcon.c:3047
 fb_set_var+0xad0/0xd40 drivers/video/fbdev/core/fbmem.c:1056
 do_fb_ioctl+0x390/0x6e0 drivers/video/fbdev/core/fbmem.c:1109
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:771
 __do_sys_ioctl fs/ioctl.c:780 [inline]
 __se_sys_ioctl fs/ioctl.c:778 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:778
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x45c829
Code: 0d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fe0d9985c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004e4860 RCX: 000000000045c829
RDX: 0000000020000000 RSI: 0000000000004601 RDI: 0000000000000003
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 00000000000002f2 R14: 00000000004c54c8 R15: 00007fe0d99866d4
Modules linked in:
CR2: ffff888000cf5080

======================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
