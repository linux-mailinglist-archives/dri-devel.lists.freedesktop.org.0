Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30491E66C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6750210E494;
	Mon,  1 Jul 2024 17:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V2lklDO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE1310E494
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:19:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 57FAECE0AD5;
 Mon,  1 Jul 2024 17:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C7DC116B1;
 Mon,  1 Jul 2024 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719854343;
 bh=jfPimOmSjEMqU8jUtPaSvvnKNg03jPMcCI32o609gz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2lklDO2di+BTzo5RvvBTWW2HzjtEO2JXbKTQZ6flHJIZMzGoX9izGaF4Kg+faIPI
 BUrU8rpEzrOucWUAS6IhS9d8jEHUQOsza+XVOiQVqROY8981IkJNkPOp/w9kyWRyMw
 x7E/OVKPsBHYLV81PRfHkDlqqvu9FxhzGabowjWbXLeMj+IzyhMS5ycoyiGWkbZ+T1
 s0igyDVSlwcbvC0LNYplySjHPI90O/T993pFkNr+w/b9ppIZtZOEfQ1se578+shlGV
 VQo1g2UPi0SR5+nHuhir+2AwRJKeekKmwx+pYEJQc1G/AbJnQikpj3aFYyLhaArcNv
 J62xyT9qlmwPQ==
Date: Mon, 1 Jul 2024 10:19:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20240701171901.GA882812@thelio-3990X>
References: <20240701191319.087b227e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701191319.087b227e@canb.auug.org.au>
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

On Mon, Jul 01, 2024 at 07:13:19PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/mmu.h:144,
>                  from arch/powerpc/include/asm/paca.h:18,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/dma-mapping.h:8,
>                  from drivers/gpu/drm/omapdrm/omap_gem.c:7:
> drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
>    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macro 'PAGE_SIZE'
>   758 |                                          PAGE_SIZE);
>       |                                          ^~~~~~~~~
> drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
>    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of macro 'PAGE_SIZE'
>  1504 |                         block = tiler_reserve_2d(fmts[i], w, h, PAGE_SIZE);
>       |                                                                 ^~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Exposed by commit
> 
>   dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=y")
> 
> PowerPC 64 bit uses 64k pages.
> 
> I have reverted that commit for today.

FWIW, I sent a patch to address this in a bit of a more targeted manner
over a week ago:

https://lore.kernel.org/20240620-omapdrm-restrict-compile-test-to-sub-64kb-page-size-v1-1-5e56de71ffca@kernel.org/

Although somehow, I left off Ville from that patch :/

Cheers,
Nathan
