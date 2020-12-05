Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C347C2CFDF8
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 19:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155696E444;
	Sat,  5 Dec 2020 18:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FF86E444
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 18:57:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7CDBD2F;
 Sat,  5 Dec 2020 19:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607194661;
 bh=iS269bbfYLp92PTNIyeM9gLH85gTe/Q/HC24LDmd6p8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LsDg6B2l1FkpVuX9YYxCU72f5ZrgkPRFiYHpg7IxeTimK8DMLLkY9NI2cM8whfG7p
 +XGuWGB/ubNLoypDjIrvD5oiBHSitw/Bks9QJwexGw4Gsnuv0+9ONzOb/e+I/OqrjD
 OPqly2/bqlexPyTaDB/fIf8S8RVwJpsE4sqLKW3g=
Date: Sat, 5 Dec 2020 20:57:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 1/7] drm: add drmm_encoder_alloc()
Message-ID: <X8vYIvgcyuMSC+7y@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20201204091732.GD4109@pendragon.ideasonboard.com>
 <ad437c826a6c4c578c99858da8dc64bfcce7410f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad437c826a6c4c578c99858da8dc64bfcce7410f.camel@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Fri, Dec 04, 2020 at 11:12:20AM +0100, Philipp Zabel wrote:
> On Fri, 2020-12-04 at 11:17 +0200, Laurent Pinchart wrote:
> > On Fri, Sep 11, 2020 at 03:57:18PM +0200, Philipp Zabel wrote:
> > > Add an alternative to drm_encoder_init() that allocates and initializes
> > > an encoder and registers drm_encoder_cleanup() with
> > > drmm_add_action_or_reset().
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > > Changes since v2:
> > >  - call va_start() / va_end() unconditionally
> > > ---
> > >  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
> > >  include/drm/drm_encoder.h     |  30 ++++++++++
> > >  2 files changed, 108 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > > index e555281f43d4..f5414705f9ad 100644
> > > --- a/drivers/gpu/drm/drm_encoder.c
> > > +++ b/drivers/gpu/drm/drm_encoder.c
> > > @@ -26,6 +26,7 @@
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_drv.h>
> > >  #include <drm/drm_encoder.h>
> > > +#include <drm/drm_managed.h>
> > >  
> > >  #include "drm_crtc_internal.h"
> > >  
> > > @@ -91,25 +92,11 @@ void drm_encoder_unregister_all(struct drm_device *dev)
> > >  	}
> > >  }
> > >  
> > > -/**
> > > - * drm_encoder_init - Init a preallocated encoder
> > > - * @dev: drm device
> > > - * @encoder: the encoder to init
> > > - * @funcs: callbacks for this encoder
> > > - * @encoder_type: user visible type of the encoder
> > > - * @name: printf style format string for the encoder name, or NULL for default name
> > > - *
> > > - * Initialises a preallocated encoder. Encoder should be subclassed as part of
> > > - * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > > - * called from the driver's &drm_encoder_funcs.destroy hook.
> > > - *
> > > - * Returns:
> > > - * Zero on success, error code on failure.
> > > - */
> > > -int drm_encoder_init(struct drm_device *dev,
> > > -		     struct drm_encoder *encoder,
> > > -		     const struct drm_encoder_funcs *funcs,
> > > -		     int encoder_type, const char *name, ...)
> > > +__printf(5, 0)
> > > +static int __drm_encoder_init(struct drm_device *dev,
> > > +			      struct drm_encoder *encoder,
> > > +			      const struct drm_encoder_funcs *funcs,
> > > +			      int encoder_type, const char *name, va_list ap)
> > >  {
> > >  	int ret;
> > >  
> > > @@ -125,11 +112,7 @@ int drm_encoder_init(struct drm_device *dev,
> > >  	encoder->encoder_type = encoder_type;
> > >  	encoder->funcs = funcs;
> > >  	if (name) {
> > > -		va_list ap;
> > > -
> > > -		va_start(ap, name);
> > >  		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
> > > -		va_end(ap);
> > >  	} else {
> > >  		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
> > >  					  drm_encoder_enum_list[encoder_type].name,
> > > @@ -150,6 +133,36 @@ int drm_encoder_init(struct drm_device *dev,
> > >  
> > >  	return ret;
> > >  }
> > > +
> > > +/**
> > > + * drm_encoder_init - Init a preallocated encoder
> > > + * @dev: drm device
> > > + * @encoder: the encoder to init
> > > + * @funcs: callbacks for this encoder
> > > + * @encoder_type: user visible type of the encoder
> > > + * @name: printf style format string for the encoder name, or NULL for default name
> > > + *
> > > + * Initializes a preallocated encoder. Encoder should be subclassed as part of
> > > + * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > > + * called from the driver's &drm_encoder_funcs.destroy hook.
> > > + *
> > > + * Returns:
> > > + * Zero on success, error code on failure.
> > > + */
> > > +int drm_encoder_init(struct drm_device *dev,
> > > +		     struct drm_encoder *encoder,
> > > +		     const struct drm_encoder_funcs *funcs,
> > > +		     int encoder_type, const char *name, ...)
> > > +{
> > > +	va_list ap;
> > > +	int ret;
> > > +
> > > +	va_start(ap, name);
> > > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > > +	va_end(ap);
> > > +
> > > +	return ret;
> > > +}
> > >  EXPORT_SYMBOL(drm_encoder_init);
> > >  
> > >  /**
> > > @@ -181,6 +194,48 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> > >  }
> > >  EXPORT_SYMBOL(drm_encoder_cleanup);
> > >  
> > > +static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
> > > +{
> > > +	struct drm_encoder *encoder = ptr;
> > > +
> > > +	if (WARN_ON(!encoder->dev))
> > > +		return;
> > > +
> > > +	drm_encoder_cleanup(encoder);
> > > +}
> > > +
> > > +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> > > +			   const struct drm_encoder_funcs *funcs,
> > > +			   int encoder_type, const char *name, ...)
> > > +{
> > > +	void *container;
> > > +	struct drm_encoder *encoder;
> > > +	va_list ap;
> > > +	int ret;
> > > +
> > > +	if (WARN_ON(!funcs || funcs->destroy))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> > > +	if (!container)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	encoder = container + offset;
> > > +
> > > +	va_start(ap, name);
> > > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > > +	va_end(ap);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > 
> > Given that drmm_encoder_alloc_release() will be called right before the
> > kfree related to the above drmm_kzalloc(), wouldn't it be more efficient
> > to replace drmm_kzalloc() with kzalloc() and add a kfree() in
> > drmm_encoder_alloc_release() ? That will save one context allocation.
> 
> That is not quite as trivial: drmm_encoder_alloc_release() doesn't know
> the container pointer that must be passed to kfree(), nor the offset
> between container and encoder.

Indeed :-S Adding more context to the drmres when creating it with
drmm_add_action_or_reset() would solve this, but it's probably overkill
(although I think this would definitely be useful if/when we turn the
DRM resource manager to a more generic component usable by other
subsystems).

> > With this addressed,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

You can add my tag to this patch and the other ones in the series where
I've made the same comment.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
