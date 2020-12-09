Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122492D4649
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 17:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361416EAA4;
	Wed,  9 Dec 2020 16:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3C36EAA4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 16:05:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y23so2233666wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UJCnqOqqdmrMiStfwR6XMqq4UZci2YVNv0pWf7hs+Zg=;
 b=LfGSNSNh7DdXFg9jVApugpI7UoMgUUKjK0rH3YGNjCvFksw4S0mjA1JQVRgYe/8Sfx
 MFv0xRVegCOtDOWNalYFoHAK7Oe2hv2S6fD56F8fICBrPfukpqOoP58N1VyMMO31ilB3
 Cxe1HQE+eQBiZ3ewdpMZVC3TAL8ei1FyizfbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UJCnqOqqdmrMiStfwR6XMqq4UZci2YVNv0pWf7hs+Zg=;
 b=gLNFZgkifeAfIBiZGONvH3YHXa4z+kbAq3ka/xHeY6MrSsfWAFBnAsYfgXjnNFY6m6
 g6N6A0TIcZqlnw67yhKrxo8r2RSHcJdixo+7KPWeERtY3GoWZlspOZV8oQdOFo9YhHMw
 mrJkyxHKmeqy4bdqJN7387vApfnD+5Dqp0DoQSO0URIw3wRVHrbSZFdwWHSN5MWreobd
 K80W1nLU6zwLg2CAf8IejHpj3gjRHUmAguLqIxZfR7mk7ERrmflLWxdyz2i3UGAS/bd2
 zKgUF33NlQzSpODTI/fImGf5oH7YJTLu70qLfQWdA/Lc2XHcU71Q34K+z7JayoDgcpi7
 XZuQ==
X-Gm-Message-State: AOAM533HC9jDv9s+We2LoikbxXWcTeiR3PJZexfknHTz90T911fhMPou
 Ofp5xq7SAeR5LILEsSSe0o8SqQ==
X-Google-Smtp-Source: ABdhPJz5GiABN75Mmza4W9tRwIEXYAnrUuodHQgAGPiuE3d4Hf+YYIAKHjU+pLxhAfkz3pQiKIQWNA==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr3586535wmu.31.1607529911338; 
 Wed, 09 Dec 2020 08:05:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f9sm4645159wrw.81.2020.12.09.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:05:10 -0800 (PST)
Date: Wed, 9 Dec 2020 17:05:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 02/19] drm: add drmm_encoder_alloc()
Message-ID: <20201209160508.GU401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-3-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208155451.8421-3-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 04:54:34PM +0100, Philipp Zabel wrote:
> Add an alternative to drm_encoder_init() that allocates and initializes
> an encoder and registers drm_encoder_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
>  - allow the funcs parameter to __drmm_encoder_alloc() to be NULL
> ---
>  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
>  include/drm/drm_encoder.h     |  30 ++++++++++
>  2 files changed, 108 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index b0b86a3c08f5..cc0edb8361e8 100644
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

I think this should also mention that ->destroy should kfree() the encoder
structure, and it should not be allocated with devm_kzalloc.

Also a hint to use drmm_encoder_alloc instead would be good to point
people in the right direction.

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

WARN_ON(!funcs->destroy);

WARN_ON(!funcs->destroy);


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
> +	if (WARN_ON(funcs && funcs->destroy))
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
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__drmm_encoder_alloc);
> +
>  static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 833123637fbf..fb2f56c006db 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -194,6 +194,36 @@ int drm_encoder_init(struct drm_device *dev,
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

@funcsw are optional in this variant.

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

Need to upcast with container_of or this breaks if the base class is in
the wrong spot.

> +				      offsetof(type, member), funcs, \
> +				      encoder_type, name, ##__VA_ARGS__))
> +
>  /**
>   * drm_encoder_index - find the index of a registered encoder
>   * @encoder: encoder to find index for

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
