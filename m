Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920D279A89
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 17:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262BC6E038;
	Sat, 26 Sep 2020 15:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FCA6E038
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 15:55:47 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id k13so1515904oor.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Yr/lJ6INo+GSizfX73ntp7C9B3Ucb54qJR65v8Nt24=;
 b=EcDJTX6xM4u/n/vl62aion5FfYc2CnNy5nhm4La6wNTHhy3T3S7tR3Vhki29HdGHR2
 2dgU0tk5pHKkZD8HcWuKhYWW7wdSuSsOKE19d6flUQ9RF2JD5BY9cGGUHAuaDCxq7/ih
 eYYWwS3WigVPwb+Hcq4tr2oJce3SjBjme8F/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Yr/lJ6INo+GSizfX73ntp7C9B3Ucb54qJR65v8Nt24=;
 b=OzE9FCnniOOOYKb1mycw1v475BYtD+uZwX2DCTovKYmeziNbXSEjuCgX0pwmgJwgs+
 RkCIcgmWpnZU3cCCfrRurVCc7Rud26W5R8baZ5MdiIiW80lATW7702LfoWndtmjeVO8p
 Bx0bJeY/4+7G5oyzEWebTjtNyCBjwl5QrW+h9xCsdmcKLlI1M4po4H7L46MYIjLUXRVG
 ASHFKFfXuUZ0gBEXqR/coExklXDcb8ZtQUtzFsgSdp3g30L/ADZ2+cmP0ahggvIfd+em
 ubzFduzR5kqVewsTuQYmNirbgFgDDcivjsrME9gW81X/MIRMPR5DSmR/BTs43pHSvt64
 xNCg==
X-Gm-Message-State: AOAM533jXfqfKLk0Q+Dc4s2N+CAnIOap8uw+Zw7TpokX3gekZ64hYXXG
 atxmQlp3cqXYaG3DGjpSxyeG6FUBSBlXksoqLFFDnw==
X-Google-Smtp-Source: ABdhPJy3e3VPHJqY/6IOF3yCkA7vof5E5Mmdfb6nINvQcHMvxbm0SpYIbvPX70H3yZ82xpSLd/cX7zjYwt9BXURpR9w=
X-Received: by 2002:a4a:3b44:: with SMTP id s65mr4356478oos.85.1601135746873; 
 Sat, 26 Sep 2020 08:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000056a39205b0324001@google.com>
In-Reply-To: <00000000000056a39205b0324001@google.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 26 Sep 2020 17:55:36 +0200
Message-ID: <CAKMK7uHBpqXpO7BQWewxbsUMUpmm20WysjLiiYxzvwfq7mDEsw@mail.gmail.com>
Subject: Re: KASAN: global-out-of-bounds Read in bit_putcs (2)
To: syzbot <syzbot+a889d70ef11d6e0f6f22@syzkaller.appspotmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 26, 2020 at 9:19 AM syzbot
<syzbot+a889d70ef11d6e0f6f22@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=126e918d900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=240e2ebab67245c7
> dashboard link: https://syzkaller.appspot.com/bug?extid=a889d70ef11d6e0f6f22
> compiler:       gcc (GCC) 10.1.0-syz 20200507
>
> Unfortunately, I don't have any reproducer for this issue yet.

Looking at the backtrace, this could be fixed by the font size checks
I just pushed:

commit 5af08640795b2b9a940c9266c0260455377ae262 (HEAD ->
drm-misc-fixes, drm-misc/for-linux-next-fixes,
drm-misc/drm-misc-fixes)
Author: Peilin Ye <yepeilin.cs@gmail.com>
Date:   Thu Sep 24 09:43:48 2020 -0400

    fbcon: Fix global-out-of-bounds read in fbcon_get_font()

But just an educated guess, no more.
-Daniel

>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a889d70ef11d6e0f6f22@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: global-out-of-bounds in __fb_pad_aligned_buffer include/linux/fb.h:654 [inline]
> BUG: KASAN: global-out-of-bounds in bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
> BUG: KASAN: global-out-of-bounds in bit_putcs+0xbb6/0xd20 drivers/video/fbdev/core/bitblit.c:185
> Read of size 1 at addr ffffffff88db78e9 by task syz-executor.4/16465
>
> CPU: 0 PID: 16465 Comm: syz-executor.4 Not tainted 5.9.0-rc6-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x198/0x1fd lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:383
>  __kasan_report mm/kasan/report.c:513 [inline]
>  kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
>  __fb_pad_aligned_buffer include/linux/fb.h:654 [inline]
>  bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
>  bit_putcs+0xbb6/0xd20 drivers/video/fbdev/core/bitblit.c:185
>  fbcon_putcs+0x35a/0x450 drivers/video/fbdev/core/fbcon.c:1308
>  do_update_region+0x399/0x630 drivers/tty/vt/vt.c:675
>  redraw_screen+0x658/0x790 drivers/tty/vt/vt.c:1034
>  fbcon_do_set_font+0x718/0x880 drivers/video/fbdev/core/fbcon.c:2438
>  fbcon_copy_font+0x12f/0x1a0 drivers/video/fbdev/core/fbcon.c:2453
>  con_font_copy drivers/tty/vt/vt.c:4719 [inline]
>  con_font_op+0x65b/0x1140 drivers/tty/vt/vt.c:4734
>  vt_k_ioctl drivers/tty/vt/vt_ioctl.c:473 [inline]
>  vt_ioctl+0x21c9/0x2e90 drivers/tty/vt/vt_ioctl.c:852
>  tty_ioctl+0x1019/0x15f0 drivers/tty/tty_io.c:2656
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x45e179
> Code: 3d b2 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 0b b2 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007fe2e03e5c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000010840 RCX: 000000000045e179
> RDX: 0000000020000400 RSI: 0000000000004b72 RDI: 0000000000000003
> RBP: 000000000118cf80 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118cf4c
> R13: 00007ffff7397e9f R14: 00007fe2e03e69c0 R15: 000000000118cf4c
>
> The buggy address belongs to the variable:
>  oid_index+0x109/0xae0
>
> Memory state around the buggy address:
>  ffffffff88db7780: 00 00 00 00 01 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
>  ffffffff88db7800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06 f9
> >ffffffff88db7880: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 00 01 f9 f9
>                                                           ^
>  ffffffff88db7900: f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9 00 00 02 f9
>  ffffffff88db7980: f9 f9 f9 f9 00 03 f9 f9 f9 f9 f9 f9 07 f9 f9 f9
> ==================================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
