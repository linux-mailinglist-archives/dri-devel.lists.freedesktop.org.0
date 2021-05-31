Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0858395821
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 11:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00C66E8C8;
	Mon, 31 May 2021 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Mon, 31 May 2021 09:34:37 UTC
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B76E8C8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 09:34:37 +0000 (UTC)
Received: from zn.tnic (p200300ec2f080f0029ca4f7a5f3cda43.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:f00:29ca:4f7a:5f3c:da43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 70C4F1EC0532;
 Mon, 31 May 2021 11:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1622453287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=7PenAKHDdLWOjeesd4KyjeK3ihp5+SXpQ6FYI+hgFp0=;
 b=Nfo2HPJZ/jYVQzSD5VeV47PvfovWml86nJFhrAPkd3PWhzq3zeptxDmJuzGJUBhA1keycr
 6gcc1Kv2z+cYrsZMbbguGlqvvPx0idhvK/E459YvLrkun1CvPOUaMBE77A9bqh7KJv+DTS
 geiDFemr2F7wczWGNdyM9Mxyy8jSsuU=
Date: Mon, 31 May 2021 11:28:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: syzbot <syzbot+545dc60af42828d1e70b@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 drm_fb_helper_damage_work (2)
Message-ID: <YLSsJTgCOHjrsiQg@zn.tnic>
References: <000000000000f7b23005c39af5c1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <000000000000f7b23005c39af5c1@google.com>
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
Cc: x86@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
 tglx@linutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks DRM to me. CCed...

On Mon, May 31, 2021 at 12:13:22AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    7ac3a1c1 Merge tag 'mtd/fixes-for-5.13-rc4' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1619b4b5d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=266cda122a0b56c
> dashboard link: https://syzkaller.appspot.com/bug?extid=545dc60af42828d1e70b
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+545dc60af42828d1e70b@syzkaller.appspotmail.com
> 
> BUG: unable to handle page fault for address: ffffc9000dc68008
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0002) - not-present page
> PGD 11000067 P4D 11000067 PUD 111b3067 PMD 1ba2c067 PTE 0
> Oops: 0002 [#1] PREEMPT SMP KASAN
> CPU: 2 PID: 16890 Comm: kworker/2:36 Not tainted 5.13.0-rc3-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> RIP: 0010:rep_movs arch/x86/lib/iomem.c:12 [inline]
> RIP: 0010:memcpy_toio+0x83/0xe0 arch/x86/lib/iomem.c:57
> Code: 8c fd 49 89 dd 31 ff 41 83 e5 02 4c 89 ee e8 c4 c2 8c fd 4d 85 ed 75 2e e8 9a ba 8c fd 48 89 e9 48 89 df 4c 89 e6 48 c1 e9 02 <f3> a5 40 f6 c5 02 74 02 66 a5 40 f6 c5 01 74 01 a4 5b 5d 41 5c 41
> RSP: 0018:ffffc9000e73fbc8 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: ffffc9000dc68008 RCX: 00000000000000fe
> RDX: ffff888015340000 RSI: ffffc9000bdd9008 RDI: ffffc9000dc68008
> RBP: 00000000000003f8 R08: 0000000000000000 R09: 0000000000000001
> R10: ffffffff83e81e1c R11: 0000000000000000 R12: ffffc9000bdd9008
> R13: 0000000000000000 R14: ffffc9000bdd9008 R15: 0000000000000001
> FS:  0000000000000000(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffc9000dc68008 CR3: 000000006c062000 CR4: 0000000000152ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  dma_buf_map_memcpy_to include/linux/dma-buf-map.h:245 [inline]
>  drm_fb_helper_damage_blit_real drivers/gpu/drm/drm_fb_helper.c:388 [inline]
>  drm_fb_helper_damage_blit drivers/gpu/drm/drm_fb_helper.c:419 [inline]
>  drm_fb_helper_damage_work+0x733/0xac0 drivers/gpu/drm/drm_fb_helper.c:450
>  process_one_work+0x98d/0x1600 kernel/workqueue.c:2276
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2422
>  kthread+0x3b1/0x4a0 kernel/kthread.c:313
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> Modules linked in:
> CR2: ffffc9000dc68008
> ---[ end trace 7f8625a9b15be223 ]---
> RIP: 0010:rep_movs arch/x86/lib/iomem.c:12 [inline]
> RIP: 0010:memcpy_toio+0x83/0xe0 arch/x86/lib/iomem.c:57
> Code: 8c fd 49 89 dd 31 ff 41 83 e5 02 4c 89 ee e8 c4 c2 8c fd 4d 85 ed 75 2e e8 9a ba 8c fd 48 89 e9 48 89 df 4c 89 e6 48 c1 e9 02 <f3> a5 40 f6 c5 02 74 02 66 a5 40 f6 c5 01 74 01 a4 5b 5d 41 5c 41
> RSP: 0018:ffffc9000e73fbc8 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: ffffc9000dc68008 RCX: 00000000000000fe
> RDX: ffff888015340000 RSI: ffffc9000bdd9008 RDI: ffffc9000dc68008
> RBP: 00000000000003f8 R08: 0000000000000000 R09: 0000000000000001
> R10: ffffffff83e81e1c R11: 0000000000000000 R12: ffffc9000bdd9008
> R13: 0000000000000000 R14: ffffc9000bdd9008 R15: 0000000000000001
> FS:  0000000000000000(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffc9000dc68008 CR3: 000000006c062000 CR4: 0000000000152ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
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
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
