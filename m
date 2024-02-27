Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22CC868CA4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A00B10E2AE;
	Tue, 27 Feb 2024 09:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="SUUjPR5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD86510E2AE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:47:18 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id E17CC60432;
 Tue, 27 Feb 2024 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1709027236;
 bh=MNowpMoLCLWMpjmmw3bZKPZ9u50KzyxiNPpNpawZ8+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SUUjPR5vjxe2udjm9tU5K1+r7QcCdRwl+bwI0dmAa0z3IMs1pmiwTBDWLVdL1ODkt
 2r9k3Ab+BvzfE4hYHoH4riHPYgTpYb4RDx3yVzhILpt2s4SBvmeyVdToO8+EcexL6A
 VxvTIEVaEp8taXlri0axQ9tHHavHXN3YXhNUaw5NEMsyiMwd/vBvz7Nj02CBL3xpXg
 lAV7TRKoXAASK7t8MkoLlmRi3+SMOOshoRYu8O7u5OB1/t1zObthNmkoOk2x9QRmhm
 DuaDFyKqaHuOiuVGStwX6xaDCzRKmN60RPAd799TXJbVHE9sAVN5s6V6hl8wvLED6D
 Yydm53i6O+zFA==
Date: Tue, 27 Feb 2024 11:46:51 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/2] Fixes for omapdrm console
Message-ID: <20240227094651.GX5299@atomide.com>
References: <20240225064700.48035-1-tony@atomide.com>
 <43fc93f1-d602-47ae-98e5-ee6be4ea5192@ideasonboard.com>
 <42255362-4720-414e-b442-f98355e92968@ideasonboard.com>
 <ab0b8471-97a6-479a-88aa-9bb25e91fb8a@suse.de>
 <20240226112549.GU5299@atomide.com>
 <20240227070624.GB52537@atomide.com>
 <7d98a0cd-e6d5-460d-8b91-35fa340736dd@suse.de>
 <20240227080146.GW5299@atomide.com>
 <587d60ae-221b-4c02-9891-17dc608009d3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587d60ae-221b-4c02-9891-17dc608009d3@suse.de>
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

* Thomas Zimmermann <tzimmermann@suse.de> [240227 09:16]:
> I just realized the fb_deferred_io_mmap() is already exported. So please use
> it instead of duplicating the code in omapdrm.
> 
> [1] https://elixir.bootlin.com/linux/v6.7/source/drivers/video/fbdev/core/fb_defio.c#L237

Yeah I have now:

static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
{
	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));

	return fb_deferred_io_mmap(info, vma);
}

> I also noticed that omapdrm does not yet select the correct Kconfig symbols.
> That can be fixed by
> 
>  1) creating Kconfig FB_DMAMEM_HELPERS_DEFERRED that are similar to their
> SYSMEM equivalent at [2]. The tokens should look like this
> 
> configFB_DMAMEM_HELPERS_DEFERRED  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS_DEFERRED>
> bool
> depends onFB_CORE  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_CORE>
> selectFB_DEFERRED_IO  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_DEFERRED_IO>
> selectFB_DMAMEM_HELPERS  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS>

OK

>   2) and selecting it instead of FB_DMAMEM_HELPERS under omapdrm's Kconfig
> symbol.

OK

Regards,

Tony

> [2] https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/Kconfig#L147
