Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7CC2DBE01
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 10:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6786E0D7;
	Wed, 16 Dec 2020 09:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76C6E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 09:52:18 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id d189so26812943oig.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZogEmcLc5rbdYqJrg42XXZZlCeoansu9PVzcpVj+8x0=;
 b=LbxiJVg9iuMrC04J5FR6G0SeDS1ekceFKjpSysGzpEGfeLx7OhNXUbsX0Chl2bRgav
 vRXI9vDQAgyo3OLjYP52p21xAlavAS2De2+I8hztjG4zXhCmhLscT3nEKm8DCgk5vWMM
 zC74C3pQnryZlVvlZjrJ9fn3zPC+ZW2lrMJc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZogEmcLc5rbdYqJrg42XXZZlCeoansu9PVzcpVj+8x0=;
 b=F8Ppo9i34DuHhXCxt/hLaK835aZnQu1PDW1afdHH+wy9AI8eThcGUeyH5CuLk6GDgW
 vTGqG2OALg5ABSRL2OJjiqP2D2hPOy/W9uxBcDSRu7qHwq2LqQY4SVVsqS2nYen54SOs
 znefAGZqm5ACO7rU43ifodqtxImw3wDguEm2lD8Rp6F7UcNfLO8uJ2rLO5QTpk4h7U4X
 tfKse1TjPyzK35dSZ6h9pSRmaxU9fADedj0M/IIFpjp+EpPJZ3ltHCgHRguAx4a6o9ul
 iT3OP7YlEq2ZMzx6ubTS01H+mn63CKIUZiRTL9LgtIxRxBxZFXfioPuquL6NaBq5wHnK
 s/Vw==
X-Gm-Message-State: AOAM531/lvlFC0pr0E//wuhKyo5FFQko4iLuGoF8yWRpfyBusQz8s+p1
 UKo0rl+HarPDF98Ol8nb8WrrYoMkHJi8FXRyWPBmUQ==
X-Google-Smtp-Source: ABdhPJxHxIMxN8kPWGkF6jhHKzTSWlN3X3jTWHffC5+00rr3o9QVMO/WAiT3F7UFc4CLj+SLlSPm9UpA89hcvmmx2wk=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr1560989oib.101.1608112337753; 
 Wed, 16 Dec 2020 01:52:17 -0800 (PST)
MIME-Version: 1.0
References: <000000000000cb6db205b68a971c@google.com>
In-Reply-To: <000000000000cb6db205b68a971c@google.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 16 Dec 2020 10:52:06 +0100
Message-ID: <CAKMK7uEiS5SrBYv-2w2wWL=9G4ByoHvtiWVsPqekswZzOGmzjg@mail.gmail.com>
Subject: Re: WARNING: suspicious RCU usage in modeset_lock
To: syzbot <syzbot+972b924c988834e868b2@syzkaller.appspotmail.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org
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
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 2:14 AM syzbot
<syzbot+972b924c988834e868b2@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    94801e5c Merge tag 'pinctrl-v5.10-3' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=130558c5500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ee8a1012a5314210
> dashboard link: https://syzkaller.appspot.com/bug?extid=972b924c988834e868b2
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> userspace arch: i386
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+972b924c988834e868b2@syzkaller.appspotmail.com
>
> =============================
> WARNING: suspicious RCU usage
> 5.10.0-rc7-syzkaller #0 Not tainted
> -----------------------------
> kernel/sched/core.c:7270 Illegal context switch in RCU-sched read-side critical section!
>
> other info that might help us debug this:
>
>
> rcu_scheduler_active = 2, debug_locks = 0
> 7 locks held by syz-executor.1/9232:
>  #0: ffffffff8b328c60 (console_lock){+.+.}-{0:0}, at: do_fb_ioctl+0x2e4/0x690 drivers/video/fbdev/core/fbmem.c:1106
>  #1: ffff888041bd4078 (&fb_info->lock){+.+.}-{3:3}, at: lock_fb_info include/linux/fb.h:636 [inline]
>  #1: ffff888041bd4078 (&fb_info->lock){+.+.}-{3:3}, at: do_fb_ioctl+0x2ee/0x690 drivers/video/fbdev/core/fbmem.c:1107
>  #2: ffff888041adca78 (&helper->lock){+.+.}-{3:3}, at: drm_fb_helper_pan_display+0xce/0x970 drivers/gpu/drm/drm_fb_helper.c:1448
>  #3: ffff8880159f01b8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x1d/0x70 drivers/gpu/drm/drm_auth.c:407
>  #4: ffff888041adc898 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x44/0x580 drivers/gpu/drm/drm_client_modeset.c:1143
>  #5: ffffc90001c07730 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0xb7/0x7c0 drivers/gpu/drm/drm_client_modeset.c:981
>  #6: ffff888015986108 (crtc_ww_class_mutex){+.+.}-{3:3}, at: ww_mutex_lock_slow include/linux/ww_mutex.h:287 [inline]
>  #6: ffff888015986108 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x31c/0x650 drivers/gpu/drm/drm_modeset_lock.c:260

Given that we managed to take all these locks without upsetting anyone
the rcu section is very deep down. And looking at the backtrace below
I just couldn't find anything.

Best I can think of is that an interrupt of some sort leaked an rcu
section, and we got shot here. But I'd assume the rcu debugging would
catch this? Backtrace of the start of that rcu read side section would
be really useful here, but I'm not seeing that in the logs. There's
more stuff there, but it's just the usual "everything falls apart"
stuff of little value to understanding how we got there.

Adding some rcu people for more insights on what could have gone wrong here.
-Daniel

> stack backtrace:
> CPU: 1 PID: 9232 Comm: syz-executor.1 Not tainted 5.10.0-rc7-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x107/0x163 lib/dump_stack.c:118
>  ___might_sleep+0x25d/0x2b0 kernel/sched/core.c:7270
>  __mutex_lock_common kernel/locking/mutex.c:935 [inline]
>  __ww_mutex_lock.constprop.0+0xa9/0x2cc0 kernel/locking/mutex.c:1111
>  ww_mutex_lock+0x3d/0x170 kernel/locking/mutex.c:1190
>  modeset_lock+0x392/0x650 drivers/gpu/drm/drm_modeset_lock.c:263
>  drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:342 [inline]
>  drm_modeset_lock+0x50/0x90 drivers/gpu/drm/drm_modeset_lock.c:338
>  drm_atomic_get_plane_state+0x19d/0x510 drivers/gpu/drm/drm_atomic.c:481
>  drm_client_modeset_commit_atomic+0x225/0x7c0 drivers/gpu/drm/drm_client_modeset.c:994
>  drm_client_modeset_commit_locked+0x145/0x580 drivers/gpu/drm/drm_client_modeset.c:1145
>  pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1395 [inline]
>  drm_fb_helper_pan_display+0x28b/0x970 drivers/gpu/drm/drm_fb_helper.c:1455
>  fb_pan_display+0x2f7/0x6c0 drivers/video/fbdev/core/fbmem.c:925
>  fb_set_var+0x57f/0xda0 drivers/video/fbdev/core/fbmem.c:1043
>  do_fb_ioctl+0x2f9/0x690 drivers/video/fbdev/core/fbmem.c:1108
>  fb_compat_ioctl+0x17c/0xaf0 drivers/video/fbdev/core/fbmem.c:1315
>  __do_compat_sys_ioctl+0x1d3/0x230 fs/ioctl.c:842
>  do_syscall_32_irqs_on arch/x86/entry/common.c:78 [inline]
>  __do_fast_syscall_32+0x56/0x80 arch/x86/entry/common.c:137
>  do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:160
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> RIP: 0023:0xf7fd8549
> Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000f55d20bc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000004601
> RDX: 0000000020000240 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> detected fb_set_par error, error code: -16
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
