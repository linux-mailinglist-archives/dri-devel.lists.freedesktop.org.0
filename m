Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F321B15A87
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0A10E428;
	Wed, 30 Jul 2025 08:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZGH6rfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A9610E428
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753864077; x=1785400077;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=k9VUAmiSuQtGPjitlXK/hfUezbF9CE8wg1axYpvjO2E=;
 b=lZGH6rfYS47E4OWtAJAHXh4RDHhnU2T2JNf7l2ujm3yFXJxl2qt8MvHv
 Gfk30QF8AZAjJBuxCshGy020ixl6uN1KjJ8wO90m+HQB/dpD12IyktYp3
 m9hjXAr+8yiCfaVcVttt5YT0RsZ7D1Zbov3Ij4vQIsObCbJBwCqsnqF3g
 vjQGiw/qiaN2VT09QfWUo3cmXCvqn+0XKR9IuRyR8nD04lAJG1DT+a5fv
 u7P6TRlHPBKKJ7ZCXamAnVhzFNsyiE7eGY1d4dIxPnImxOSGS2DqEMs0m
 7mbiJeXB/T2bUsUq94voUnCqRywcYq/Uu7OWzCDV6VN19hPh3rlYd2DpJ w==;
X-CSE-ConnectionGUID: mKrcHRE/S6mv/kVDESskZw==
X-CSE-MsgGUID: XFeQaVjTQtiVY0s43twoqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="78706957"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="78706957"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:27:56 -0700
X-CSE-ConnectionGUID: eCkFfzx6Sa+OWA9Io2PEMA==
X-CSE-MsgGUID: kIC65xZ+TX+Bp2sfYvCq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168225384"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.60])
 ([10.245.245.60])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:27:52 -0700
Message-ID: <8ab72592-7e16-4d79-9e26-f98a1938cb2a@linux.intel.com>
Date: Wed, 30 Jul 2025 10:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] WARNING in __ww_mutex_wound
To: syzbot <syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com>,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, simona@ffwll.ch,
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de,
 Valentin Schneider <valentin.schneider@arm.com>,
 Connor O'Brien <connoro@google.com>, John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

This warning is introduced in linux-next as a4f0b6fef4b0 ("locking/mutex: Add p->blocked_on wrappers for correctness checks")
Adding relevant people from that commit.

Kind regards,
~Maarten

Den 2025-07-29 kl. 23:59, skrev syzbot:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    d086c886ceb9 Add linux-next specific files for 20250718
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=161204a2580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=69896dd7b8c4e81e
> dashboard link: https://syzkaller.appspot.com/bug?extid=602c4720aed62576cd79
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fff4f0580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111204a2580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/54504fbc2437/disk-d086c886.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b427b00abffe/vmlinux-d086c886.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/5a87731b006b/bzImage-d086c886.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: ./include/linux/sched.h:2173 at __clear_task_blocked_on include/linux/sched.h:2173 [inline], CPU#1: syz.1.8698/395
> WARNING: ./include/linux/sched.h:2173 at __ww_mutex_wound+0x21a/0x2b0 kernel/locking/ww_mutex.h:346, CPU#1: syz.1.8698/395
> Modules linked in:
> CPU: 1 UID: 0 PID: 395 Comm: syz.1.8698 Not tainted 6.16.0-rc6-next-20250718-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
> RIP: 0010:__clear_task_blocked_on include/linux/sched.h:2173 [inline]
> RIP: 0010:__ww_mutex_wound+0x21a/0x2b0 kernel/locking/ww_mutex.h:346
> Code: 5f 5d c3 cc cc cc cc cc 90 0f 0b 90 e9 89 fe ff ff 90 0f 0b 90 e9 39 ff ff ff 90 0f 0b 90 4d 85 ff 0f 85 67 ff ff ff eb 95 90 <0f> 0b 90 eb 8f 48 c7 c1 70 00 e4 8f 80 e1 07 80 c1 03 38 c1 0f 8c
> RSP: 0018:ffffc900030e7720 EFLAGS: 00010046
> RAX: ffff888024a1b000 RBX: dffffc0000000000 RCX: 8f1a7ab232ebe500
> RDX: 00000000000003ef RSI: ffffffff8de5b067 RDI: ffffffff8c04d400
> RBP: 0000000000000001 R08: ffff888024a224bf R09: 1ffff11004944497
> R10: dffffc0000000000 R11: ffffed1004944498 R12: ffff88802dee8a78
> R13: ffffc900030e7ae8 R14: ffff88802dee8000 R15: ffff888024a224b8
> FS:  00007fe6e4a7f6c0(0000) GS:ffff8881258ab000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fe6e4a5ed58 CR3: 000000003115e000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  __ww_mutex_add_waiter kernel/locking/ww_mutex.h:574 [inline]
>  __mutex_lock_common kernel/locking/mutex.c:642 [inline]
>  __ww_mutex_lock+0xba3/0x2930 kernel/locking/mutex.c:771
>  ww_mutex_lock_interruptible+0x3f/0x1c0 kernel/locking/mutex.c:904
>  modeset_lock+0x21a/0x650 drivers/gpu/drm/drm_modeset_lock.c:-1
>  drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:398 [inline]
>  drm_modeset_lock_all_ctx+0x62/0x300 drivers/gpu/drm/drm_modeset_lock.c:459
>  setplane_internal drivers/gpu/drm/drm_plane.c:1118 [inline]
>  drm_mode_setplane+0x577/0xba0 drivers/gpu/drm/drm_plane.c:1175
>  drm_ioctl_kernel+0x2cc/0x390 drivers/gpu/drm/drm_ioctl.c:796
>  drm_ioctl+0x67f/0xb10 drivers/gpu/drm/drm_ioctl.c:893
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:598 [inline]
>  __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe6e3b8e9a9
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fe6e4a7f038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007fe6e3db5fa0 RCX: 00007fe6e3b8e9a9
> RDX: 0000200000000080 RSI: 00000000c03064b7 RDI: 0000000000000003
> RBP: 00007fe6e3c10d69 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 00007fe6e3db5fa0 R15: 00007ffdf1fa90a8
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

