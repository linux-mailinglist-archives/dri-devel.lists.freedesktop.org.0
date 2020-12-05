Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4A2CFDF9
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 19:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A256E44B;
	Sat,  5 Dec 2020 18:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B366E44B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 18:58:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC4FD2F;
 Sat,  5 Dec 2020 19:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607194710;
 bh=iI204Yol8efVqyM0w1KfOu2Z2ac0KMEpwhwN5f8RMk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rurls78jF6YnAsZHf2HG1WwWSBY2x8ka/1xcLWlsxoEHHQoGtVSsXg+9wo9o+Brwb
 WwLT5e0ivtzwZAnVp+YXPPGMBIqTQ3jW3Aj9Kn6QmMMp+F2U+UxO4bg8Xh0UZYVt+v
 trpp7faN2K7OZVJLt31XfQqe9M+ftTHelOHuu9sE=
Date: Sat, 5 Dec 2020 20:58:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/7] drm/simple_kms_helper: add
 drmm_simple_encoder_alloc()
Message-ID: <X8vYVeD/1j7oAyph@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20200911135724.25833-2-p.zabel@pengutronix.de>
 <20201204091943.GE4109@pendragon.ideasonboard.com>
 <e1fa81a821ee6e5c296cc0e89d9d90a28534b79a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1fa81a821ee6e5c296cc0e89d9d90a28534b79a.camel@pengutronix.de>
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

On Fri, Dec 04, 2020 at 11:13:33AM +0100, Philipp Zabel wrote:
> On Fri, 2020-12-04 at 11:19 +0200, Laurent Pinchart wrote:
> > On Fri, Sep 11, 2020 at 03:57:19PM +0200, Philipp Zabel wrote:
> > > Add an alternative to drm_simple_encoder_init() that allocates and
> > > initializes a simple encoder and registers drm_encoder_cleanup() with
> > > drmm_add_action_or_reset().
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++++
> > >  include/drm/drm_simple_kms_helper.h     | 24 ++++++++++++++++++++++++
> > >  2 files changed, 36 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > index 74946690aba4..3cbbfb0f9b51 100644
> > > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > @@ -9,6 +9,7 @@
> > >  #include <drm/drm_atomic.h>
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > > +#include <drm/drm_managed.h>
> > >  #include <drm/drm_plane_helper.h>
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/drm_simple_kms_helper.h>
> > > @@ -71,6 +72,17 @@ int drm_simple_encoder_init(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(drm_simple_encoder_init);
> > >  
> > > +static const struct drm_encoder_funcs drmm_simple_encoder_funcs_empty = { };
> > > +
> > > +void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
> > > +				  size_t offset, int encoder_type)
> > > +{
> > > +	return __drmm_encoder_alloc(dev, size, offset,
> > > +				    &drmm_simple_encoder_funcs_empty,
> > > +				    encoder_type, NULL);
> > > +}
> > > +EXPORT_SYMBOL(__drmm_simple_encoder_alloc);
> > 
> > Do we need this ? Wouldn't it be better support a NULL drm_encoder_funcs
> > in the core (if we don't already) and use drmm_encoder_alloc() directly
> > in drivers ?
> 
> I could change it to remove the empty drm_encoder_funcs, and prepend
> something like this:
> 
> ----------8<----------
> From 12147d90a8ae48dabc16ca8750fa0f629cc46570 Mon Sep 17 00:00:00 2001
> From: Philipp Zabel <p.zabel@pengutronix.de>
> Date: Fri, 4 Dec 2020 10:49:41 +0100
> Subject: [PATCH] drm/encoder: make encoder control functions optional
> 
> Simple managed encoders do not require the .destroy callback,
> make the whole funcs structure optional.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

That's perfect.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_encoder.c     | 4 ++--
>  drivers/gpu/drm/drm_mode_config.c | 5 +++--
>  include/drm/drm_encoder.h         | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index e555281f43d4..b0b86a3c08f5 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -72,7 +72,7 @@ int drm_encoder_register_all(struct drm_device *dev)
>  	int ret = 0;
>  
>  	drm_for_each_encoder(encoder, dev) {
> -		if (encoder->funcs->late_register)
> +		if (encoder->funcs && encoder->funcs->late_register)
>  			ret = encoder->funcs->late_register(encoder);
>  		if (ret)
>  			return ret;
> @@ -86,7 +86,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>  	struct drm_encoder *encoder;
>  
>  	drm_for_each_encoder(encoder, dev) {
> -		if (encoder->funcs->early_unregister)
> +		if (encoder->funcs && encoder->funcs->early_unregister)
>  			encoder->funcs->early_unregister(encoder);
>  	}
>  }
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index f1affc1bb679..87e144155456 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -195,7 +195,7 @@ void drm_mode_config_reset(struct drm_device *dev)
>  			crtc->funcs->reset(crtc);
>  
>  	drm_for_each_encoder(encoder, dev)
> -		if (encoder->funcs->reset)
> +		if (encoder->funcs && encoder->funcs->reset)
>  			encoder->funcs->reset(encoder);
>  
>  	drm_connector_list_iter_begin(dev, &conn_iter);
> @@ -487,7 +487,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  
>  	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
>  				 head) {
> -		encoder->funcs->destroy(encoder);
> +		if (encoder->funcs)
> +			encoder->funcs->destroy(encoder);
>  	}
>  
>  	drm_connector_list_iter_begin(dev, &conn_iter);
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 5dfa5f7a80a7..833123637fbf 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -89,7 +89,7 @@ struct drm_encoder_funcs {
>   * @head: list management
>   * @base: base KMS object
>   * @name: human readable name, can be overwritten by the driver
> - * @funcs: control functions
> + * @funcs: control functions, can be NULL for simple managed encoders
>   * @helper_private: mid-layer private data
>   *
>   * CRTCs drive pixels to encoders, which convert them into signals

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
