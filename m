Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB102D3783
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CB76E201;
	Wed,  9 Dec 2020 00:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792766E201
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:22:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r14so146793wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9AbzWMVF0TQe43o+4JA3HBhzZyrZ4Zx10fqPAAZZby4=;
 b=ivlqg5cSAm9CsQ11qbBwxnXNgQyC8KyQyIMyLJDd2STly3mw/6GG+IknjWY5fOjsfI
 HLTUACeXAyxqJ8snhKtFvs3s5arMZk+oLiWBvL3aKJgh/BuutwGu4OZfA+wtExuPOhDQ
 CmVSXEvvNLI+kV26YeQL/gIcjHGM01vD4S9zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9AbzWMVF0TQe43o+4JA3HBhzZyrZ4Zx10fqPAAZZby4=;
 b=uBBHslwAc422O0+CS+ibIyQJ+QG45+HsSp1ejbRHzc+fxmaLI5M0wTbRvsp43fC/PY
 xlMdk50cs0qwdt/Vj9ecCu1zZbgHLGobEoI5IRZw4fo6Bv3KTvQ5vvaNmYwomwi7HFzQ
 V++D8n+0LE61eB6lTCIswNqVLQEeMEef9EJMNSRzCBYlHOe1F7V4w4jbd9mvA/mbMW89
 sQTduS7aC9oVaqpj6MR4nNY+3ZVPA8Ye74HYAeVaS16vsoaWaMAFyTEc6PmKoFZv1pSR
 t86K2lqxahG9HeyEx6mkX1FXko1uMGVYp2z6canrV8ncle3qP599E3DfmQDqy1V3Secg
 RHRw==
X-Gm-Message-State: AOAM5336hREGYqBOtR5LF3rGfSDmMkc6R0e0QdnCJma4bkVU5R3x2/3o
 383/qJDSZc/edIfo/B8RPbIEH2xsLr+C+w==
X-Google-Smtp-Source: ABdhPJw2aAt5HnF+1aTO3iz/FBOcn1Sd93OK1RKqHxVl4qI3PGSlnhPA9Vw9kTxFNp1NkCuNR++9LA==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr608734wrn.107.1607473329088;
 Tue, 08 Dec 2020 16:22:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q15sm870300wrw.75.2020.12.08.16.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:22:08 -0800 (PST)
Date: Wed, 9 Dec 2020 01:22:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/7] drm: add drmm_encoder_alloc()
Message-ID: <20201209002206.GH401619@phenom.ffwll.local>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20201204091732.GD4109@pendragon.ideasonboard.com>
 <ad437c826a6c4c578c99858da8dc64bfcce7410f.camel@pengutronix.de>
 <X8vYIvgcyuMSC+7y@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X8vYIvgcyuMSC+7y@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 05, 2020 at 08:57:38PM +0200, Laurent Pinchart wrote:
> Hi Philipp,
> 
> On Fri, Dec 04, 2020 at 11:12:20AM +0100, Philipp Zabel wrote:
> > On Fri, 2020-12-04 at 11:17 +0200, Laurent Pinchart wrote:
> > > On Fri, Sep 11, 2020 at 03:57:18PM +0200, Philipp Zabel wrote:
> > > > Add an alternative to drm_encoder_init() that allocates and initializes
> > > > an encoder and registers drm_encoder_cleanup() with
> > > > drmm_add_action_or_reset().
> > > > 
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > ---
> > > > Changes since v2:
> > > >  - call va_start() / va_end() unconditionally
> > > > ---
> > > >  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
> > > >  include/drm/drm_encoder.h     |  30 ++++++++++
> > > >  2 files changed, 108 insertions(+), 23 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > > > index e555281f43d4..f5414705f9ad 100644
> > > > --- a/drivers/gpu/drm/drm_encoder.c
> > > > +++ b/drivers/gpu/drm/drm_encoder.c
> > > > @@ -26,6 +26,7 @@
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_encoder.h>
> > > > +#include <drm/drm_managed.h>
> > > >  
> > > >  #include "drm_crtc_internal.h"
> > > >  
> > > > @@ -91,25 +92,11 @@ void drm_encoder_unregister_all(struct drm_device *dev)
> > > >  	}
> > > >  }
> > > >  
> > > > -/**
> > > > - * drm_encoder_init - Init a preallocated encoder
> > > > - * @dev: drm device
> > > > - * @encoder: the encoder to init
> > > > - * @funcs: callbacks for this encoder
> > > > - * @encoder_type: user visible type of the encoder
> > > > - * @name: printf style format string for the encoder name, or NULL for default name
> > > > - *
> > > > - * Initialises a preallocated encoder. Encoder should be subclassed as part of
> > > > - * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > > > - * called from the driver's &drm_encoder_funcs.destroy hook.
> > > > - *
> > > > - * Returns:
> > > > - * Zero on success, error code on failure.
> > > > - */
> > > > -int drm_encoder_init(struct drm_device *dev,
> > > > -		     struct drm_encoder *encoder,
> > > > -		     const struct drm_encoder_funcs *funcs,
> > > > -		     int encoder_type, const char *name, ...)
> > > > +__printf(5, 0)
> > > > +static int __drm_encoder_init(struct drm_device *dev,
> > > > +			      struct drm_encoder *encoder,
> > > > +			      const struct drm_encoder_funcs *funcs,
> > > > +			      int encoder_type, const char *name, va_list ap)
> > > >  {
> > > >  	int ret;
> > > >  
> > > > @@ -125,11 +112,7 @@ int drm_encoder_init(struct drm_device *dev,
> > > >  	encoder->encoder_type = encoder_type;
> > > >  	encoder->funcs = funcs;
> > > >  	if (name) {
> > > > -		va_list ap;
> > > > -
> > > > -		va_start(ap, name);
> > > >  		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
> > > > -		va_end(ap);
> > > >  	} else {
> > > >  		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
> > > >  					  drm_encoder_enum_list[encoder_type].name,
> > > > @@ -150,6 +133,36 @@ int drm_encoder_init(struct drm_device *dev,
> > > >  
> > > >  	return ret;
> > > >  }
> > > > +
> > > > +/**
> > > > + * drm_encoder_init - Init a preallocated encoder
> > > > + * @dev: drm device
> > > > + * @encoder: the encoder to init
> > > > + * @funcs: callbacks for this encoder
> > > > + * @encoder_type: user visible type of the encoder
> > > > + * @name: printf style format string for the encoder name, or NULL for default name
> > > > + *
> > > > + * Initializes a preallocated encoder. Encoder should be subclassed as part of
> > > > + * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > > > + * called from the driver's &drm_encoder_funcs.destroy hook.
> > > > + *
> > > > + * Returns:
> > > > + * Zero on success, error code on failure.
> > > > + */
> > > > +int drm_encoder_init(struct drm_device *dev,
> > > > +		     struct drm_encoder *encoder,
> > > > +		     const struct drm_encoder_funcs *funcs,
> > > > +		     int encoder_type, const char *name, ...)
> > > > +{
> > > > +	va_list ap;
> > > > +	int ret;
> > > > +
> > > > +	va_start(ap, name);
> > > > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > > > +	va_end(ap);
> > > > +
> > > > +	return ret;
> > > > +}
> > > >  EXPORT_SYMBOL(drm_encoder_init);
> > > >  
> > > >  /**
> > > > @@ -181,6 +194,48 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> > > >  }
> > > >  EXPORT_SYMBOL(drm_encoder_cleanup);
> > > >  
> > > > +static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
> > > > +{
> > > > +	struct drm_encoder *encoder = ptr;
> > > > +
> > > > +	if (WARN_ON(!encoder->dev))
> > > > +		return;
> > > > +
> > > > +	drm_encoder_cleanup(encoder);
> > > > +}
> > > > +
> > > > +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> > > > +			   const struct drm_encoder_funcs *funcs,
> > > > +			   int encoder_type, const char *name, ...)
> > > > +{
> > > > +	void *container;
> > > > +	struct drm_encoder *encoder;
> > > > +	va_list ap;
> > > > +	int ret;
> > > > +
> > > > +	if (WARN_ON(!funcs || funcs->destroy))
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> > > > +	if (!container)
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	encoder = container + offset;
> > > > +
> > > > +	va_start(ap, name);
> > > > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > > > +	va_end(ap);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > > > +
> > > > +	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > > 
> > > Given that drmm_encoder_alloc_release() will be called right before the
> > > kfree related to the above drmm_kzalloc(), wouldn't it be more efficient
> > > to replace drmm_kzalloc() with kzalloc() and add a kfree() in
> > > drmm_encoder_alloc_release() ? That will save one context allocation.
> > 
> > That is not quite as trivial: drmm_encoder_alloc_release() doesn't know
> > the container pointer that must be passed to kfree(), nor the offset
> > between container and encoder.
> 
> Indeed :-S Adding more context to the drmres when creating it with
> drmm_add_action_or_reset() would solve this, but it's probably overkill
> (although I think this would definitely be useful if/when we turn the
> DRM resource manager to a more generic component usable by other
> subsystems).

Internally it's even funnier, because the drmm_kzalloc doesn't even have a
callback - the allocation is freed as part of the drmm tracking structure.
Which means that drmm_kzalloc has a "free" release callback already.

This irked me to no end, but I couldn't come up with an interface to stuff
the release callback into the allocation which I deemed safe enough for
drmm, which is supposed to make life easy and bugs disappear, not greate
new surprises.

What I just realized is that drmm_add_action_or_reset could look at the
drmm cleanup action stack, and if the topmost one doesn't have a hook set
already, use that one instead of allocating a new tracker structure. This
way ordering is always guaranteed (e.g. if you mix up drmm_kzalloc calls
with add_action for different objects in strange orders) and there's no
problem ever, we just avoid a few small allocations.

Still needs a few special cases, so not sure it's actually a win.
-Daniel

> 
> > > With this addressed,
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> You can add my tag to this patch and the other ones in the series where
> I've made the same comment.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
