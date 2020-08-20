Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C324AFAB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDB16E8DE;
	Thu, 20 Aug 2020 07:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E66E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 05:35:16 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id m12so587305iov.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=yD7MI1JGQtczkbJQBV7QYmOBcKMlevUe8LY67kKIiqI=;
 b=gqLOYI3GevBGepCXe7bvhPAKy3JCcPb0RvkmTO5R73Thb0kB78G25zpqI38kagwFHp
 +9rnLON79XGANI62uMCNxXPAVFwze9o/HmJVh7JecqvIYkBU2CC54yKTdbaPcRS5IFz7
 hlIAXjmmyTvEr/NSEbQWczrNaS4uU4l+kE31aB2ivCep36JBg8qmUUXJQMRMvXSSkDIO
 rrrvZmF5TsLG16aJhD6IwO6GgQ0S5LruzSf5HGwRoeGhSBQtN8Vkaq+wioweGkBHg517
 CTVte8GiIARFXaSJDIDzaqbJIDms8oifw/3+LgvTCJGSdHU7pLKBPqfLh2oJC/pW1qkX
 12uA==
X-Gm-Message-State: AOAM533JcaQdOdyCEqjTpjK7AK63bgWhIJNFM7sCc9QDOF0W1NjNhXYI
 ZHhhFgmxOnC8zqDBoUyJuGdFVkBQnDHe2l8aPV36/NB352aJ
X-Google-Smtp-Source: ABdhPJzp2vXqVfB03OO5G2QrOVXEaldP2QyG/UjOVc4fKagkcLYqKaxfs21p25Aa8JixLOOebRHmONstJxAl4aqiygDvupgHLpY9
MIME-Version: 1.0
X-Received: by 2002:a92:9996:: with SMTP id t22mr1295081ilk.216.1597901715584; 
 Wed, 19 Aug 2020 22:35:15 -0700 (PDT)
Date: Wed, 19 Aug 2020 22:35:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000024be1505ad487cbb@google.com>
Subject: KASAN: global-out-of-bounds Read in fbcon_resize
From: syzbot <syzbot+b38b1ef6edf0c74a8d97@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, natechancellor@gmail.com, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

HEAD commit:    8eb858df Add linux-next specific files for 20200819
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1158a00e900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd187ef624ef7f02
dashboard link: https://syzkaller.appspot.com/bug?extid=b38b1ef6edf0c74a8d97
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146a5589900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=165aa636900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b38b1ef6edf0c74a8d97@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in fbcon_resize+0x781/0x810 drivers/video/fbdev/core/fbcon.c:2206
Read of size 4 at addr ffffffff8896d418 by task syz-executor732/6868

CPU: 0 PID: 6868 Comm: syz-executor732 Not tainted 5.9.0-rc1-next-20200819-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 fbcon_resize+0x781/0x810 drivers/video/fbdev/core/fbcon.c:2206
 resize_screen drivers/tty/vt/vt.c:1175 [inline]
 vc_do_resize+0x535/0x1150 drivers/tty/vt/vt.c:1246
 vt_ioctl+0x11d2/0x2cc0 drivers/tty/vt/vt_ioctl.c:1025
 tty_ioctl+0x1019/0x15f0 drivers/tty/tty_io.c:2656
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x440329
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 13 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc8ff997d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000440329
RDX: 0000000020000040 RSI: 0000000000005609 RDI: 0000000000000004
RBP: 00000000006ca018 R08: 000000000000000d R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401b90
R13: 0000000000401c20 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the variable:
 font_vga_8x16+0x58/0x60

Memory state around the buggy address:
 ffffffff8896d300: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
 ffffffff8896d380: 00 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 00 f9 f9 f9
>ffffffff8896d400: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
                            ^
 ffffffff8896d480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffffff8896d500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
