Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C477D8672FD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E92710E509;
	Mon, 26 Feb 2024 11:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="f+7WAYdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7353C10E509
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:26:16 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id C7593604E8;
 Mon, 26 Feb 2024 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708946774;
 bh=BsWoozpMNbEWYb7vRh+DT11XY9AOmootzk2UX1PtNfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+7WAYdxVzD5tI/crTSu2B3NTaAdrUDRqBlvda/8MyKMNPorUglfaj63cp4bfXDSN
 D09Wfi4kJCj4jsvYbHX0lvL74iVzbQzhyM6Kqxcma6vBBVx1Swcm5zzDQTOWV/XSaJ
 HPACncr4tTTFqsgIhg0e823wD5vvk8gbtxGYlpuyvB74J1kd60qHMXLLcGDcWJDGI1
 2g6GAVrlUPZ9gCwC/SaYsxOfs1JxBMtPAKgKYrnK/JMG92NJ/DBVf4yc6RPei6BW/m
 VSNUqR8z34YWNZMi/BqlB81popmlx/CuSBNHDqbHAn6IcMiLojbqwzoRMSsHp3dYk4
 8hw44/309ofHg==
Date: Mon, 26 Feb 2024 13:25:49 +0200
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
Message-ID: <20240226112549.GU5299@atomide.com>
References: <20240225064700.48035-1-tony@atomide.com>
 <43fc93f1-d602-47ae-98e5-ee6be4ea5192@ideasonboard.com>
 <42255362-4720-414e-b442-f98355e92968@ideasonboard.com>
 <ab0b8471-97a6-479a-88aa-9bb25e91fb8a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0b8471-97a6-479a-88aa-9bb25e91fb8a@suse.de>
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

* Thomas Zimmermann <tzimmermann@suse.de> [240226 09:10]:
> Hi
> 
> Am 26.02.24 um 10:01 schrieb Tomi Valkeinen:
> > On 26/02/2024 10:26, Tomi Valkeinen wrote:
> > > Hi Tony,
> > > 
> > > On 25/02/2024 08:46, Tony Lindgren wrote:
> > > > Here are two fixes for omapdrm console.
> > > 
> > > How is it broken? I don't usually use the console (or fbdev) but
> > > enabling it now, it seems to work fine for me, on DRA76 EVM with
> > > HDMI output.
> 
> Omapdrm implements drm_framebuffer_funcs.dirty withomap_framebuffer_dirty().
> AFAIK DRM semantics requires to run the dirty helper after writing to the
> framebuffer's memory. Userspace does this via the DIRTYFB ioctl. [1] But (at
> least) for correctness the console needs to do the same.
> 
> [1] https://elixir.bootlin.com/linux/v6.7.6/source/drivers/gpu/drm/drm_ioctl.c#L679

Yes I noticed console not updating and bisected it down to the two
commits listed. I did the bisect on a droid4 though with command mode
LCD. I did not test with HDMI, will give that a try too.

> > After applying your patches, I see a lot of cache-related artifacts on
> > the screen when updating the fb.
> 
> I guess we might need a dma-specific mmap helper to make this work
> correctly.

I can easily test this if you have some suggested patch to try.

Hmm so I wonder if we now have double updates happening on HDMI?

Regards,

Tony
