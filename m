Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B6963DB1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 09:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B1F10E609;
	Thu, 29 Aug 2024 07:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="PfplbuS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972210E609
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 07:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724917938;
 bh=uHHrwlh6NO4lynRgJVRj9JGGKp1nBxW91DGb8LwoweY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfplbuS/TCLHs5K4HQfGnN+bULazNiEN4fI3JE88060sP7dncLfG0MC5QQwOrsSC4
 rny6mvF2RrSyukXrleJG+n7A0igxz0OsmmawYSZ7UujDipNjDT3btT/HDEgGEMnn4i
 fF7PIFYSDVrE7FOYmp0ecQbklhrGLjYmng3ImcgM=
Date: Thu, 29 Aug 2024 09:52:17 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: Peter Jones <pjones@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] fbdev/efifb: Use stack memory for screeninfo structs
Message-ID: <b50388e8-fa5a-40aa-98f8-2759045cbfaa@t-8ch.de>
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
 <20240827-efifb-sysfs-v1-1-c9cc3e052180@weissschuh.net>
 <fef5bc70-3921-4562-b9d4-beccc76440a6@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fef5bc70-3921-4562-b9d4-beccc76440a6@gmx.de>
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

On 2024-08-28 19:42:51+0000, Helge Deller wrote:
> On 8/27/24 17:25, Thomas Weißschuh wrote:
> > These variables are only used inside efifb_probe().
> > Afterwards they are using memory unnecessarily.
> 
> Did you check if this change really saves some memory?

Nope...

> With your change, the compiler will either create a hidden
> structure which it uses then, or it generates assembly
> instructions to fill the struct at runtime.
> Both options may not actually reduce the memory footprint...

Thanks for the explanation, it makes sense.

On advantage of the on-stack data would be future-proofing.
Efi efifb_probe() overrides some fields in these structs only in certain
codepaths then the globally shared data could become inconsistent.
But that's not the case today.

> Another option might be to mark the static struct __initdata
> if you expect another card to take over before the memory is
> freed at runtime. But I'm not sure if it's worth possible
> implications.

Agreed.

> Helge
> 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   drivers/video/fbdev/efifb.c | 36 ++++++++++++++++++------------------
> >   1 file changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index 8dd82afb3452..8bfe0ccbc67a 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -52,24 +52,6 @@ struct efifb_par {
> >   	resource_size_t size;
> >   };
> > 
> > -static struct fb_var_screeninfo efifb_defined = {
> > -	.activate		= FB_ACTIVATE_NOW,
> > -	.height			= -1,
> > -	.width			= -1,
> > -	.right_margin		= 32,
> > -	.upper_margin		= 16,
> > -	.lower_margin		= 4,
> > -	.vsync_len		= 4,
> > -	.vmode			= FB_VMODE_NONINTERLACED,
> > -};
> > -
> > -static struct fb_fix_screeninfo efifb_fix = {
> > -	.id			= "EFI VGA",
> > -	.type			= FB_TYPE_PACKED_PIXELS,
> > -	.accel			= FB_ACCEL_NONE,
> > -	.visual			= FB_VISUAL_TRUECOLOR,
> > -};
> > -
> >   static int efifb_setcolreg(unsigned regno, unsigned red, unsigned green,
> >   			   unsigned blue, unsigned transp,
> >   			   struct fb_info *info)
> > @@ -357,6 +339,24 @@ static int efifb_probe(struct platform_device *dev)
> >   	char *option = NULL;
> >   	efi_memory_desc_t md;
> > 
> > +	struct fb_var_screeninfo efifb_defined = {
> > +		.activate		= FB_ACTIVATE_NOW,
> > +		.height			= -1,
> > +		.width			= -1,
> > +		.right_margin		= 32,
> > +		.upper_margin		= 16,
> > +		.lower_margin		= 4,
> > +		.vsync_len		= 4,
> > +		.vmode			= FB_VMODE_NONINTERLACED,
> > +	};
> > +
> > +	struct fb_fix_screeninfo efifb_fix = {
> > +		.id			= "EFI VGA",
> > +		.type			= FB_TYPE_PACKED_PIXELS,
> > +		.accel			= FB_ACCEL_NONE,
> > +		.visual			= FB_VISUAL_TRUECOLOR,
> > +	};
> > +
> >   	/*
> >   	 * If we fail probing the device, the kernel might try a different
> >   	 * driver. We get a copy of the attached screen_info, so that we can
> > 
> 
