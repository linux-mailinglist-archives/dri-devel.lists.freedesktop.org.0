Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C370FB22D4A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3452010E604;
	Tue, 12 Aug 2025 16:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="cU+ms/2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242AC10E604
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=aHJzgTYNHhUFIaGCwqmyoUgVvhj+lSUoXDtgiSq6xY8=; t=1755015835;
 x=1755447835; b=cU+ms/2B/zOUGas/XTLf22onNuSTnBVmhnvIpAyPC37HF6c4loki2lFBV9Hhe
 UW/VBCgOQt/QldTNxNIEtpISYBofDCuTY+Hm1CjZBCkzlj3wKNvq1NkFl7W/tFlAFiuueOnPeY3zd
 17WfrBpCzAuPoWg7F1nV6FeusfHTbRU6mhddwGff159FZlnz59FAACjpVEaUnyB39zCCgQF7cYGAb
 zgctixevg14w/ZF4DIWQO5obNkhZAvFpBtjx3G/hFm1qJTQTZlQ6YH2Nj4BYrnLQ6h/thorqpQLUm
 D1n0pk2+QF1KI8N/dFcnlmeSaT7CD5GLnv3LwXP1P9WJ4JUQiA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 id 1ulrms-004YLW-1x; Tue, 12 Aug 2025 18:23:46 +0200
Message-ID: <9b9edf2a-b4f3-4024-a91d-0902cfe832dc@leemhuis.info>
Date: Tue, 12 Aug 2025 18:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] kernel panic is not displayed correctly in
 qemu (CONFIG_DRM_BOCHS)
To: Askar Safin <safinaskar@zohomail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 virtualization <virtualization@lists.linux.dev>,
 ryasuoka <ryasuoka@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 qemu-devel <qemu-devel@nongnu.org>, regressions
 <regressions@lists.linux.dev>, Ben Hutchings <benh@debian.org>
References: <197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1755015835;
 8a0d0dc9; 
X-HE-SMSGID: 1ulrms-004YLW-1x
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

Hi! Thanks for your report. Given that Thomas' commits that broke things
and then partially made them working again are from 2019 there is no
real benefit in tracking this with regzbot, as it can't be solved with a
revert or such; sure, ideally the involved developers or someone else
will look at it, but often they have much more important things to fix –
and often they moved on to new endeavors and sometimes even retired in
between. Sorry, that's just how it is.

But well, with a bit of luck this mail or something else motivates
someone to look into the issue. :-D Wish you luck!

Ciao, Thorsten

#regzbot introduced: a6c3464f69cf5a8a31e
#regzbot resolve: tracking unpromising

On 10.07.25 06:21, Askar Safin wrote:
> Steps to reproduce:
> 
> - Build Linux v6.16-rc5 so:
> 
> $ cat mini
> CONFIG_64BIT=y
> 
> CONFIG_EXPERT=y
> CONFIG_EMBEDDED=y
> 
> CONFIG_PRINTK=y
> CONFIG_PRINTK_TIME=y
> 
> CONFIG_PCI=y
> 
> CONFIG_TTY=y
> CONFIG_VT=y
> CONFIG_VT_CONSOLE=y
> CONFIG_DRM=y
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_BOCHS=y
> CONFIG_FRAMEBUFFER_CONSOLE=y
> CONFIG_PROC_FS=y
> $ make KCONFIG_ALLCONFIG=mini allnoconfig
> $ make
> 
> - Then boot this Linux image in Qemu so:
> 
> $ qemu-system-x86_64 -enable-kvm -m 1024 -daemonize -kernel arch/x86_64/boot/bzImage
> 
> Kernel will (predictably) panic (because it has no initramfs, nor real disk), but actual panic message will not be shown!
> 
> Last shown line is "Run /bin/sh as init process"
> 
> My host OS is Debian Trixie. "uname -a":
> 
> Linux receipt 6.12.33+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.33-1 (2025-06-19) x86_64 GNU/Linux
> 
> Qemu version is:
> 
> QEMU emulator version 10.0.2 (Debian 1:10.0.2+ds-1)
> 
> Guest kernel is v6.16-rc5 x86_64.
> 
> The problem doesn't reproduce on old guest kernels. I. e. old guest kernels actually show panic message.
> 
> I did bisect, and bisect showed the following two commits:
> 
> ===
> 
> commit a6c3464f69cf5a8a31eb31cc436e7dbd325b8ff9
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Thu Jun 13 09:30:33 2019 +0200
> 
>     drm/gem-vram: Support pinning buffers to current location
>     
>     Pinning a buffer prevents it from being moved to a different memory
>     location. For some operations, such as buffer updates, it is not
>     important where the buffer is located. Setting the pin function's
>     pl_flag argument to 0 will pin the buffer to whereever it is stored.
>     
>     v2:
>             * document pin flags in PRIME pin helper
>     
>     Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>     Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20190613073041.29350-2-tzimmermann@suse.de
> 
> commit 58540594570778fd149cd8c9b2bff61f2cefa8c9
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Wed Jul 3 09:58:34 2019 +0200
> 
>     drm/bochs: Use shadow buffer for bochs framebuffer console
>     
>     The bochs driver (and virtual hardware) requires buffer objects to
>     reside in video ram to display them to the screen. So it can not
>     display the framebuffer console because the respective buffer object
>     is permanently pinned in system memory.
>     
>     Using a shadow buffer for the console solves this problem. The console
>     emulation will pin the buffer object only during updates from the shadow
>     buffer. Otherwise, the bochs driver can freely relocated the buffer
>     between system memory and video ram.
>     
>     v2:
>             * select shadow FB via struct drm_mode_config.prefer_shadow_fbdev
>     
>     Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>     Acked-by: Noralf Trønnes <noralf@tronnes.org>
>     Link: https://patchwork.freedesktop.org/patch/315833/
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> ===
> 
> Commit a6c3464f69cf5a8a31e changed good behavior to absolutely wrong: after a6c3464f69cf5a8a31e I see just black screen.
> Then (after many commits) 58540594570778fd149 made screen working again, but now panics are not shown.
> 
> So, result: all commits in range a6c3464f69cf5a8a31e .. 58540594570778fd149 are not testable (black screen), all commits before a6c3464f69cf5a8a31e
> are "good" (panic is shown) and all commits after 58540594570778fd149 (inclusive) (including v6.16-rc5) are "bad" (panic is not shown).
> 
> The next commit after 58540594570778fd149 is 5fd5d2b7c53de5a1290d82, thus correct regzbot instruction is:
> 
> #regzbot introduced: a6c3464f69cf5a8a31e..5fd5d2b7c53de5a1290d82
> 
> Config above is not special. It is result of minimizing standard Debian config.
> 
> The bug is reproducible with standard Debian kernels (if we use them as guests).
> 
> Reproduction steps are so:
> - Install Debian Trixie to Qemu VM
> - Boot it with "init=/bin/true" added (to cause kernel panic)
> 
> You will not see panic message.
> 
> I minimized this Debian bug to small config shown in the beginning of this letter.
> 
> --
> Askar Safin
> https://types.pl/@safinaskar
> 
> 
> 

