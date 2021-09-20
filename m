Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5642411919
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 18:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF1E6E54C;
	Mon, 20 Sep 2021 16:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DEF6E54C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:12:39 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0a2a00274102d8249bfe43.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:2a00:2741:2d8:249b:fe43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8787B1EC046C;
 Mon, 20 Sep 2021 18:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632154353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=499cmMesQ66SuOqK3OAibBQwJpFfgrPccmrpjjv7fMM=;
 b=IrcQuZuNhMC8QorBvrj0UE0ngqhUlkROH5PPYZK/Ve5dAoauyfiIVYvv7unbtORHls4wBC
 jitzf6JX5a5BijInUeOJvqDm9/DI6p3252CFlCl9wSCzXmPyL5+jBGMbHfVfIl/YiDjINY
 SxI1qHBKpREhpjK/wep2XAvRQssxS0U=
Date: Mon, 20 Sep 2021 18:12:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: Hao Sun <sunhao.th@gmail.com>
Cc: hpa@zytor.com, mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: BUG: unable to handle kernel paging request in
 drm_fb_helper_damage_work
Message-ID: <YUiy6zyQ/7uccnV3@zn.tnic>
References: <CACkBjsYVWiSa9KYETi4aT2-0C=xheWjYA9bgoMgqa3y0XzNLMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACkBjsYVWiSa9KYETi4aT2-0C=xheWjYA9bgoMgqa3y0XzNLMw@mail.gmail.com>
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

On Mon, Sep 20, 2021 at 08:55:28PM +0800, Hao Sun wrote:
> Hello,
> 
> When using Healer to fuzz the latest Linux kernel, the following crash

Your Healer thing - or whatever that next automated thing is which is
trying to be smart - is not CCing the proper people:

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/drm_fb_helper.c --no-rolestats
Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Maxime Ripard <mripard@kernel.org>
Thomas Zimmermann <tzimmermann@suse.de>
David Airlie <airlied@linux.ie>
Daniel Vetter <daniel@ffwll.ch>
dri-devel@lists.freedesktop.org
linux-kernel@vger.kernel.org

I'll Cc them now but you should fix it.

The syzcaller mails at least Cc more people and I'm sure you can figure
out how to do that when you have the stack trace and get_maintainer.pl.

> was triggered.
> 
> HEAD commit: 4357f03d6611 Merge tag 'pm-5.15-rc2
> git tree: upstream
> console output:
> https://drive.google.com/file/d/13NUxvBLIswpoS8NOOAaq9PjOKgTYN19K/view?usp=sharing
> kernel config: https://drive.google.com/file/d/1HKZtF_s3l6PL3OoQbNq_ei9CdBus-Tz0/view?usp=sharing
> 
> Sorry, I don't have a reproducer for this crash, hope the symbolized
> report can help.
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Hao Sun <sunhao.th@gmail.com>
> 
> BUG: unable to handle page fault for address: ffffc90003d79000
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 8c00067 P4D 8c00067 PUD 8d63067 PMD 104409067 PTE 0
> Oops: 0000 [#1] PREEMPT SMP
> CPU: 2 PID: 3032 Comm: kworker/2:2 Not tainted 5.15.0-rc1+ #19
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> RIP: 0010:rep_movs arch/x86/lib/iomem.c:12 [inline]
> RIP: 0010:memcpy_toio+0x48/0xa0 arch/x86/lib/iomem.c:57
> Code: 01 75 41 e8 4a 0d 04 ff 49 83 fc 01 76 0a e8 3f 0d 04 ff f6 c3
> 02 75 44 e8 35 0d 04 ff 4c 89 e1 48 89 df 48 89 ee 48 c1 e9 02 <f3> a5
> 41 f6 c4 02 74 02 66 a5 41 f6 c4 01 74 01 a4 5b 5d 41 5c e9
> RSP: 0018:ffffc9000088fda8 EFLAGS: 00010206
> RAX: 0000000000000000 RBX: ffffc90005aff000 RCX: 0000000000000100
> RDX: ffff88800f132240 RSI: ffffc90003d79000 RDI: ffffc90005b00000
> RBP: ffffc90003d78000 R08: 0000000000000001 R09: 0000000000000000
> R10: ffffc9000088fdc8 R11: 0000000000000004 R12: 0000000000001400
> R13: ffff888101fc7000 R14: 00000000000002ff R15: ffffc90003d78000
> FS:  0000000000000000(0000) GS:ffff88807dd00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffc90003d79000 CR3: 000000010ea77000 CR4: 0000000000750ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  dma_buf_map_memcpy_to include/linux/dma-buf-map.h:245 [inline]
>  drm_fb_helper_damage_blit_real drivers/gpu/drm/drm_fb_helper.c:388 [inline]
>  drm_fb_helper_damage_blit drivers/gpu/drm/drm_fb_helper.c:419 [inline]
>  drm_fb_helper_damage_work+0x30e/0x380 drivers/gpu/drm/drm_fb_helper.c:450
>  process_one_work+0x359/0x850 kernel/workqueue.c:2297
>  worker_thread+0x41/0x4d0 kernel/workqueue.c:2444
>  kthread+0x178/0x1b0 kernel/kthread.c:319
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> Modules linked in:
> Dumping ftrace buffer:
>    (ftrace buffer empty)
> CR2: ffffc90003d79000
> ---[ end trace e1f0ecb0884517c4 ]---
> RIP: 0010:rep_movs arch/x86/lib/iomem.c:12 [inline]
> RIP: 0010:memcpy_toio+0x48/0xa0 arch/x86/lib/iomem.c:57
> Code: 01 75 41 e8 4a 0d 04 ff 49 83 fc 01 76 0a e8 3f 0d 04 ff f6 c3
> 02 75 44 e8 35 0d 04 ff 4c 89 e1 48 89 df 48 89 ee 48 c1 e9 02 <f3> a5
> 41 f6 c4 02 74 02 66 a5 41 f6 c4 01 74 01 a4 5b 5d 41 5c e9
> RSP: 0018:ffffc9000088fda8 EFLAGS: 00010206
> RAX: 0000000000000000 RBX: ffffc90005aff000 RCX: 0000000000000100
> RDX: ffff88800f132240 RSI: ffffc90003d79000 RDI: ffffc90005b00000
> RBP: ffffc90003d78000 R08: 0000000000000001 R09: 0000000000000000
> R10: ffffc9000088fdc8 R11: 0000000000000004 R12: 0000000000001400
> R13: ffff888101fc7000 R14: 00000000000002ff R15: ffffc90003d78000
> FS:  0000000000000000(0000) GS:ffff88807dd00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffc90003d79000 CR3: 000000010ea77000 CR4: 0000000000750ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> ----------------
> Code disassembly (best guess):
>    0:   01 75 41                add    %esi,0x41(%rbp)
>    3:   e8 4a 0d 04 ff          callq  0xff040d52
>    8:   49 83 fc 01             cmp    $0x1,%r12
>    c:   76 0a                   jbe    0x18
>    e:   e8 3f 0d 04 ff          callq  0xff040d52
>   13:   f6 c3 02                test   $0x2,%bl
>   16:   75 44                   jne    0x5c
>   18:   e8 35 0d 04 ff          callq  0xff040d52
>   1d:   4c 89 e1                mov    %r12,%rcx
>   20:   48 89 df                mov    %rbx,%rdi
>   23:   48 89 ee                mov    %rbp,%rsi
>   26:   48 c1 e9 02             shr    $0x2,%rcx
> * 2a:   f3 a5                   rep movsl %ds:(%rsi),%es:(%rdi) <--
> trapping instruction
>   2c:   41 f6 c4 02             test   $0x2,%r12b
>   30:   74 02                   je     0x34
>   32:   66 a5                   movsw  %ds:(%rsi),%es:(%rdi)
>   34:   41 f6 c4 01             test   $0x1,%r12b
>   38:   74 01                   je     0x3b
>   3a:   a4                      movsb  %ds:(%rsi),%es:(%rdi)
>   3b:   5b                      pop    %rbx
>   3c:   5d                      pop    %rbp
>   3d:   41 5c                   pop    %r12
>   3f:   e9                      .byte 0xe9

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
