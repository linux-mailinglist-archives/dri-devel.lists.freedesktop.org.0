Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721C2CEAAC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DE16E14D;
	Fri,  4 Dec 2020 09:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934426E14D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:17:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEE4F99A;
 Fri,  4 Dec 2020 10:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607073454;
 bh=fby9DQDXChHHJk1DPRmhXGWQ5laBvb11MQZ/aXUnxrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZoZIHhKDDGfvgIGfZ5Q9m8Hzx8+Jmk3tJblCmmt+VZawyB6gleQfD6gz8RrFM2CdW
 jskvjrE9ZedLW0HzdvhAcKUWumBGyhfF3HD4LXuZ5/HAbGpa7BJcRddmjNwE2UTFk7
 eXV+pOE9V7SLAML8mVO02X7EKMVQ0uC8Agv5H+S8=
Date: Fri, 4 Dec 2020 11:17:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 1/7] drm: add drmm_encoder_alloc()
Message-ID: <20201204091732.GD4109@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135724.25833-1-p.zabel@pengutronix.de>
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

Thank you for the patch.

On Fri, Sep 11, 2020 at 03:57:18PM +0200, Philipp Zabel wrote:
> Add an alternative to drm_encoder_init() that allocates and initializes
> an encoder and registers drm_encoder_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2:
>  - call va_start() / va_end() unconditionally
> ---
>  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
>  include/drm/drm_encoder.h     |  30 ++++++++++
>  2 files changed, 108 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index e555281f43d4..f5414705f9ad 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_managed.h>
>  
>  #include "drm_crtc_internal.h"
>  
> @@ -91,25 +92,11 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>  	}
>  }
>  
> -/**
> - * drm_encoder_init - Init a preallocated encoder
> - * @dev: drm device
> - * @encoder: the encoder to init
> - * @funcs: callbacks for this encoder
> - * @encoder_type: user visible type of the encoder
> - * @name: printf style format string for the encoder name, or NULL for default name
> - *
> - * Initialises a preallocated encoder. Encoder should be subclassed as part of
> - * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> - * called from the driver's &drm_encoder_funcs.destroy hook.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_encoder_init(struct drm_device *dev,
> -		     struct drm_encoder *encoder,
> -		     const struct drm_encoder_funcs *funcs,
> -		     int encoder_type, const char *name, ...)
> +__printf(5, 0)
> +static int __drm_encoder_init(struct drm_device *dev,
> +			      struct drm_encoder *encoder,
> +			      const struct drm_encoder_funcs *funcs,
> +			      int encoder_type, const char *name, va_list ap)
>  {
>  	int ret;
>  
> @@ -125,11 +112,7 @@ int drm_encoder_init(struct drm_device *dev,
>  	encoder->encoder_type = encoder_type;
>  	encoder->funcs = funcs;
>  	if (name) {
> -		va_list ap;
> -
> -		va_start(ap, name);
>  		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
> -		va_end(ap);
>  	} else {
>  		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
>  					  drm_encoder_enum_list[encoder_type].name,
> @@ -150,6 +133,36 @@ int drm_encoder_init(struct drm_device *dev,
>  
>  	return ret;
>  }
> +
> +/**
> + * drm_encoder_init - Init a preallocated encoder
> + * @dev: drm device
> + * @encoder: the encoder to init
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for default name
> + *
> + * Initializes a preallocated encoder. Encoder should be subclassed as part of
> + * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> + * called from the driver's &drm_encoder_funcs.destroy hook.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_encoder_init(struct drm_device *dev,
> +		     struct drm_encoder *encoder,
> +		     const struct drm_encoder_funcs *funcs,
> +		     int encoder_type, const char *name, ...)
> +{
> +	va_list ap;
> +	int ret;
> +
> +	va_start(ap, name);
> +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> +	va_end(ap);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_encoder_init);
>  
>  /**
> @@ -181,6 +194,48 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  }
>  EXPORT_SYMBOL(drm_encoder_cleanup);
>  
> +static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
> +{
> +	struct drm_encoder *encoder = ptr;
> +
> +	if (WARN_ON(!encoder->dev))
> +		return;
> +
> +	drm_encoder_cleanup(encoder);
> +}
> +
> +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> +			   const struct drm_encoder_funcs *funcs,
> +			   int encoder_type, const char *name, ...)
> +{
> +	void *container;
> +	struct drm_encoder *encoder;
> +	va_list ap;
> +	int ret;
> +
> +	if (WARN_ON(!funcs || funcs->destroy))
> +		return ERR_PTR(-EINVAL);
> +
> +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-EINVAL);
> +
> +	encoder = container + offset;
> +
> +	va_start(ap, name);
> +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> +	va_end(ap);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> +	if (ret)
> +		return ERR_PTR(ret);

Given that drmm_encoder_alloc_release() will be called right before the
kfree related to the above drmm_kzalloc(), wouldn't it be more efficient
to replace drmm_kzalloc() with kzalloc() and add a kfree() in
drmm_encoder_alloc_release() ? That will save one context allocation.

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__drmm_encoder_alloc);
> +
>  static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index a60f5f1555ac..4ecad1260ff7 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -195,6 +195,36 @@ int drm_encoder_init(struct drm_device *dev,
>  		     const struct drm_encoder_funcs *funcs,
>  		     int encoder_type, const char *name, ...);
>  
> +__printf(6, 7)
> +void *__drmm_encoder_alloc(struct drm_device *dev,
> +			   size_t size, size_t offset,
> +			   const struct drm_encoder_funcs *funcs,
> +			   int encoder_type,
> +			   const char *name, ...);
> +
> +/**
> + * drmm_encoder_alloc - Allocate and initialize an encoder
> + * @dev: drm device
> + * @type: the type of the struct which contains struct &drm_encoder
> + * @member: the name of the &drm_encoder within @type.
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for default name
> + *
> + * Allocates and initializes an encoder. Encoder should be subclassed as part of
> + * driver encoder objects. Cleanup is automatically handled through registering
> + * drm_encoder_cleanup() with drmm_add_action().
> + *
> + * The @drm_encoder_funcs.destroy hook must be NULL.
> + *
> + * Returns:
> + * Pointer to new encoder, or ERR_PTR on failure.
> + */
> +#define drmm_encoder_alloc(dev, type, member, funcs, encoder_type, name, ...) \
> +	((type *)__drmm_encoder_alloc(dev, sizeof(type), \
> +				      offsetof(type, member), funcs, \
> +				      encoder_type, name, ##__VA_ARGS__))
> +
>  /**
>   * drm_encoder_index - find the index of a registered encoder
>   * @encoder: encoder to find index for

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
