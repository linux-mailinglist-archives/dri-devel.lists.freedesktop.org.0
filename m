Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFF20CFF6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 18:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C02897E9;
	Mon, 29 Jun 2020 16:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81356897E9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:04:30 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C782D25583;
 Mon, 29 Jun 2020 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593446670;
 bh=sgSQOtY/x/74MV4rGtAVyonSi8bOlHw3rAK7Fd0sqTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKjZCRSMW0PtJe08qG7smt91VirWRGw1e5fB76o1MqZEs86KbwyIJFx5pvauh6632
 Q/8dc3FQEyV1M9GzF9eSpDL7tv3uTq3lw2L8XG+OQyLAGS8dhqt0d+EoJe5+S/nm01
 p6u+DD7zXejjd0cfNm71KFFG4HurNc611sP/22do=
Date: Mon, 29 Jun 2020 18:04:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 9/9] drm/simplekms: Acquire memory aperture for framebuffer
Message-ID: <20200629160421.GA627453@kroah.com>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-10-tzimmermann@suse.de>
 <20200629092230.GQ3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629092230.GQ3278063@phenom.ffwll.local>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 11:22:30AM +0200, Daniel Vetter wrote:
> On Thu, Jun 25, 2020 at 02:00:11PM +0200, Thomas Zimmermann wrote:
> > We register the simplekms device with the DRM platform helpers. A
> > native driver for the graphics hardware will kickout the simplekms
> > driver before taking over the device.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/tiny/Kconfig     |  1 +
> >  drivers/gpu/drm/tiny/simplekms.c | 94 +++++++++++++++++++++++++++++++-
> >  2 files changed, 92 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> > index 50dbde8bdcb2..a47ed337a7fe 100644
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -33,6 +33,7 @@ config DRM_SIMPLEKMS
> >  	depends on DRM
> >  	select DRM_GEM_SHMEM_HELPER
> >  	select DRM_KMS_HELPER
> > +	select DRM_PLATFORM_HELPER
> >  	help
> >  	  DRM driver for simple platform-provided framebuffers.
> >  
> > diff --git a/drivers/gpu/drm/tiny/simplekms.c b/drivers/gpu/drm/tiny/simplekms.c
> > index ae5d3cbadbe8..a903a4e0100a 100644
> > --- a/drivers/gpu/drm/tiny/simplekms.c
> > +++ b/drivers/gpu/drm/tiny/simplekms.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/platform_data/simplefb.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/spinlock.h>
> >  
> >  #include <drm/drm_atomic_state_helper.h>
> >  #include <drm/drm_connector.h>
> > @@ -17,6 +18,7 @@
> >  #include <drm/drm_gem_shmem_helper.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_platform.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_simple_kms_helper.h>
> >  
> > @@ -36,6 +38,12 @@
> >  #define SIMPLEKMS_MODE(hd, vd)	\
> >  	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
> >  
> > +/*
> > + * Protects the platform device's drvdata against
> > + * concurrent manipulation.
> > + */
> > +static DEFINE_SPINLOCK(simplekms_drvdata_lock);
> > +
> >  /*
> >   * Helpers for simplefb
> >   */
> > @@ -211,6 +219,7 @@ struct simplekms_device {
> >  	unsigned int pitch;
> >  
> >  	/* memory management */
> > +	struct drm_aperture *aperture;
> >  	struct resource *mem;
> >  	void __iomem *screen_base;
> >  
> > @@ -224,6 +233,8 @@ static struct simplekms_device *simplekms_device_of_dev(struct drm_device *dev)
> >  	return container_of(dev, struct simplekms_device, dev);
> >  }
> >  
> > +static void simplekms_device_cleanup(struct simplekms_device *sdev);
> > +
> >  /*
> >   * Hardware
> >   */
> > @@ -514,22 +525,72 @@ static int simplekms_device_init_fb(struct simplekms_device *sdev)
> >   * Memory management
> >   */
> >  
> > +static void simplekms_aperture_kickout(struct drm_aperture *ap)
> > +{
> > +	struct drm_device *dev = ap->dev;
> > +	struct simplekms_device *sdev = simplekms_device_of_dev(dev);
> > +	struct platform_device *pdev = sdev->pdev;
> > +
> > +	if (WARN_ON(!sdev->aperture))
> > +		return; /* BUG: driver already got kicked out */
> > +
> > +	drm_dev_unregister(dev);
> 
> >From a semantic pov I think the platform driver getting kicked out is more
> like a hotunplug, so drm_dev_unplug(dev); here is imo better.
> 
> That then also gives you a nice drm_dev_enter/exit to sprinkle over the
> various driver callbacks, instead of the racy ->aperture check reinvented
> wheel here.
> 
> I also wonder whether we couldn't go full driver model for these platform
> devices, and instead of this here call a core driver model function to
> force the unbding of the driver. Only change we'd need it that our
> ->remove hook uses drm_dev_unplug().

Yes, please do that.  Or, use the "virtual bus/device" code that some
people at Intel are still trying to get into mergable shape.  See the
posts on the netdev list for those details.

Don't use platform devices for anything that is not actually a platform
device (i.e. something described by hardware resources).

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
