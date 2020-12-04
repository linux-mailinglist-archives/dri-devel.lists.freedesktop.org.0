Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD42CEBE8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 11:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894A46E138;
	Fri,  4 Dec 2020 10:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B966E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:12:23 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kl84b-0008Ou-7o; Fri, 04 Dec 2020 11:12:21 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kl84a-0002AZ-V1; Fri, 04 Dec 2020 11:12:20 +0100
Message-ID: <ad437c826a6c4c578c99858da8dc64bfcce7410f.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/7] drm: add drmm_encoder_alloc()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 04 Dec 2020 11:12:20 +0100
In-Reply-To: <20201204091732.GD4109@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20201204091732.GD4109@pendragon.ideasonboard.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Laurent,

On Fri, 2020-12-04 at 11:17 +0200, Laurent Pinchart wrote:
> Hi Philipp,
> 
> Thank you for the patch.

Thank you for the review.

> On Fri, Sep 11, 2020 at 03:57:18PM +0200, Philipp Zabel wrote:
> > Add an alternative to drm_encoder_init() that allocates and initializes
> > an encoder and registers drm_encoder_cleanup() with
> > drmm_add_action_or_reset().
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Changes since v2:
> >  - call va_start() / va_end() unconditionally
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
> >  include/drm/drm_encoder.h     |  30 ++++++++++
> >  2 files changed, 108 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index e555281f43d4..f5414705f9ad 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_encoder.h>
> > +#include <drm/drm_managed.h>
> >  
> >  #include "drm_crtc_internal.h"
> >  
> > @@ -91,25 +92,11 @@ void drm_encoder_unregister_all(struct drm_device *dev)
> >  	}
> >  }
> >  
> > -/**
> > - * drm_encoder_init - Init a preallocated encoder
> > - * @dev: drm device
> > - * @encoder: the encoder to init
> > - * @funcs: callbacks for this encoder
> > - * @encoder_type: user visible type of the encoder
> > - * @name: printf style format string for the encoder name, or NULL for default name
> > - *
> > - * Initialises a preallocated encoder. Encoder should be subclassed as part of
> > - * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > - * called from the driver's &drm_encoder_funcs.destroy hook.
> > - *
> > - * Returns:
> > - * Zero on success, error code on failure.
> > - */
> > -int drm_encoder_init(struct drm_device *dev,
> > -		     struct drm_encoder *encoder,
> > -		     const struct drm_encoder_funcs *funcs,
> > -		     int encoder_type, const char *name, ...)
> > +__printf(5, 0)
> > +static int __drm_encoder_init(struct drm_device *dev,
> > +			      struct drm_encoder *encoder,
> > +			      const struct drm_encoder_funcs *funcs,
> > +			      int encoder_type, const char *name, va_list ap)
> >  {
> >  	int ret;
> >  
> > @@ -125,11 +112,7 @@ int drm_encoder_init(struct drm_device *dev,
> >  	encoder->encoder_type = encoder_type;
> >  	encoder->funcs = funcs;
> >  	if (name) {
> > -		va_list ap;
> > -
> > -		va_start(ap, name);
> >  		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
> > -		va_end(ap);
> >  	} else {
> >  		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
> >  					  drm_encoder_enum_list[encoder_type].name,
> > @@ -150,6 +133,36 @@ int drm_encoder_init(struct drm_device *dev,
> >  
> >  	return ret;
> >  }
> > +
> > +/**
> > + * drm_encoder_init - Init a preallocated encoder
> > + * @dev: drm device
> > + * @encoder: the encoder to init
> > + * @funcs: callbacks for this encoder
> > + * @encoder_type: user visible type of the encoder
> > + * @name: printf style format string for the encoder name, or NULL for default name
> > + *
> > + * Initializes a preallocated encoder. Encoder should be subclassed as part of
> > + * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > + * called from the driver's &drm_encoder_funcs.destroy hook.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int drm_encoder_init(struct drm_device *dev,
> > +		     struct drm_encoder *encoder,
> > +		     const struct drm_encoder_funcs *funcs,
> > +		     int encoder_type, const char *name, ...)
> > +{
> > +	va_list ap;
> > +	int ret;
> > +
> > +	va_start(ap, name);
> > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > +	va_end(ap);
> > +
> > +	return ret;
> > +}
> >  EXPORT_SYMBOL(drm_encoder_init);
> >  
> >  /**
> > @@ -181,6 +194,48 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  }
> >  EXPORT_SYMBOL(drm_encoder_cleanup);
> >  
> > +static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
> > +{
> > +	struct drm_encoder *encoder = ptr;
> > +
> > +	if (WARN_ON(!encoder->dev))
> > +		return;
> > +
> > +	drm_encoder_cleanup(encoder);
> > +}
> > +
> > +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> > +			   const struct drm_encoder_funcs *funcs,
> > +			   int encoder_type, const char *name, ...)
> > +{
> > +	void *container;
> > +	struct drm_encoder *encoder;
> > +	va_list ap;
> > +	int ret;
> > +
> > +	if (WARN_ON(!funcs || funcs->destroy))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> > +	if (!container)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	encoder = container + offset;
> > +
> > +	va_start(ap, name);
> > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > +	va_end(ap);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> 
> Given that drmm_encoder_alloc_release() will be called right before the
> kfree related to the above drmm_kzalloc(), wouldn't it be more efficient
> to replace drmm_kzalloc() with kzalloc() and add a kfree() in
> drmm_encoder_alloc_release() ? That will save one context allocation.

That is not quite as trivial: drmm_encoder_alloc_release() doesn't know
the container pointer that must be passed to kfree(), nor the offset
between container and encoder.

> With this addressed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
