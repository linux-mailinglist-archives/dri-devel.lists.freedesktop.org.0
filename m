Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D332D4B40
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 21:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23026E193;
	Wed,  9 Dec 2020 20:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898DA6E193
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 20:08:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d3so2635961wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9frRg6C+UL3e++A1H/UkUKrZlUqaPgwHHpP33lf7dZU=;
 b=CNoGRIQl2VWX3cI6Sh/71vE1vELRdszSPwwo9dXj2XcwvChfz6AuVqKENrFz2A9FOO
 WOMM4fk2zgGj5cs6OFGoxjG8/M4i6ceIfqpBjTy3yjFBJVOPNA4jziW9HB7oW1nvjZfd
 hRuinktrzxIhlMe48Y7GhZqhZaC+puLrNDZSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9frRg6C+UL3e++A1H/UkUKrZlUqaPgwHHpP33lf7dZU=;
 b=jV0MUtFDJQAky6s7cEfO9VhWnV8rTskRZBQDKpnbgXgyjGimv0QVZMLP8wSxrRFYRw
 L5t8YQgW9VyLHklu0JT2KvbzLeNPRZqzjoJajbQ2ZNYEmLNFGF0zgqjPy2MEJADjgcwb
 FMUZJT+6XQxsA/FeduoBRa/QoAUn/8EayF+4FVn5iuY0ilnBV4Xni4A5dGlx4REId4Xn
 V+QuBCZGAuX2HUpPk8Q3dZpCl7NLf4ef+XYts6y3z6R1LjPbn2Qp78m9TamwNrIjRoW3
 J779HR8YvfRxPOMWdKKPGOryDTbQba/Ro3T1vT2OiXjY0hGHm6Upap7G3Aoy/9QhY3hj
 nHUg==
X-Gm-Message-State: AOAM531LwFsLIKzObO6QEP+zbgqsOMf5MVcBpTKBZVzTayON+kS3A4t1
 s0u1/7Hc+tcewemyBZkNfPrc6Q==
X-Google-Smtp-Source: ABdhPJxBomML3zHjUb4J3TdCcIlLSpSR00Rz2gP3kHrZYvY1s1Xq3rHdSR/+242M5oaaZz1Z5SjDaA==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr4599115wmg.136.1607544516036; 
 Wed, 09 Dec 2020 12:08:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s1sm6150506wrv.97.2020.12.09.12.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:08:35 -0800 (PST)
Date: Wed, 9 Dec 2020 21:08:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 04/19] drm/plane: add drmm_universal_plane_alloc()
Message-ID: <20201209200833.GY401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-5-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208155451.8421-5-p.zabel@pengutronix.de>
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

On Tue, Dec 08, 2020 at 04:54:36PM +0100, Philipp Zabel wrote:
> Add an alternative to drm_universal_plane_init() that allocates
> and initializes a plane and registers drm_plane_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 126 +++++++++++++++++++++++++++---------
>  include/drm/drm_plane.h     |  42 ++++++++++++
>  2 files changed, 139 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index e6231947f987..6b1261fe09fb 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "drm_crtc_internal.h"
> @@ -152,31 +153,16 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  	return 0;
>  }
>  
> -/**
> - * drm_universal_plane_init - Initialize a new universal plane object
> - * @dev: DRM device
> - * @plane: plane object to init
> - * @possible_crtcs: bitmask of possible CRTCs
> - * @funcs: callbacks for the new plane
> - * @formats: array of supported formats (DRM_FORMAT\_\*)
> - * @format_count: number of elements in @formats
> - * @format_modifiers: array of struct drm_format modifiers terminated by
> - *                    DRM_FORMAT_MOD_INVALID
> - * @type: type of plane (overlay, primary, cursor)
> - * @name: printf style format string for the plane name, or NULL for default name
> - *
> - * Initializes a plane object of type @type.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
> -			     uint32_t possible_crtcs,
> -			     const struct drm_plane_funcs *funcs,
> -			     const uint32_t *formats, unsigned int format_count,
> -			     const uint64_t *format_modifiers,
> -			     enum drm_plane_type type,
> -			     const char *name, ...)
> +__printf(9, 0)
> +static int __drm_universal_plane_init(struct drm_device *dev,
> +				      struct drm_plane *plane,
> +				      uint32_t possible_crtcs,
> +				      const struct drm_plane_funcs *funcs,
> +				      const uint32_t *formats,
> +				      unsigned int format_count,
> +				      const uint64_t *format_modifiers,
> +				      enum drm_plane_type type,
> +				      const char *name, va_list ap)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  	unsigned int format_modifier_count = 0;
> @@ -237,11 +223,7 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  	}
>  
>  	if (name) {
> -		va_list ap;
> -
> -		va_start(ap, name);
>  		plane->name = kvasprintf(GFP_KERNEL, name, ap);
> -		va_end(ap);
>  	} else {
>  		plane->name = kasprintf(GFP_KERNEL, "plane-%d",
>  					drm_num_planes(dev));
> @@ -286,8 +268,94 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  
>  	return 0;
>  }
> +
> +/**
> + * drm_universal_plane_init - Initialize a new universal plane object
> + * @dev: DRM device
> + * @plane: plane object to init
> + * @possible_crtcs: bitmask of possible CRTCs
> + * @funcs: callbacks for the new plane
> + * @formats: array of supported formats (DRM_FORMAT\_\*)
> + * @format_count: number of elements in @formats
> + * @format_modifiers: array of struct drm_format modifiers terminated by
> + *                    DRM_FORMAT_MOD_INVALID
> + * @type: type of plane (overlay, primary, cursor)
> + * @name: printf style format string for the plane name, or NULL for default name
> + *
> + * Initializes a plane object of type @type.
> + *

Same as with the others, please include a note that funcs->destroy must
clean stuff up and call kfree(), and that drivers should consider the new
drmm_ version instead.

> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
> +			     uint32_t possible_crtcs,
> +			     const struct drm_plane_funcs *funcs,
> +			     const uint32_t *formats, unsigned int format_count,
> +			     const uint64_t *format_modifiers,
> +			     enum drm_plane_type type,
> +			     const char *name, ...)
> +{
> +	va_list ap;
> +	int ret;

I think WARN_ON(!funcs.destroy); maybe.

> +
> +	va_start(ap, name);
> +	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
> +					 formats, format_count, format_modifiers,
> +					 type, name, ap);
> +	va_end(ap);
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_universal_plane_init);
>  
> +static void drmm_universal_plane_alloc_release(struct drm_device *dev, void *ptr)
> +{
> +	struct drm_plane *plane = ptr;
> +
> +	if (WARN_ON(!plane->dev))
> +		return;
> +
> +	drm_plane_cleanup(plane);
> +}
> +
> +void *__drmm_universal_plane_alloc(struct drm_device *dev, size_t size,
> +				   size_t offset, uint32_t possible_crtcs,
> +				   const struct drm_plane_funcs *funcs,
> +				   const uint32_t *formats, unsigned int format_count,
> +				   const uint64_t *format_modifiers,
> +				   enum drm_plane_type type,
> +				   const char *name, ...)
> +{
> +	void *container;
> +	struct drm_plane *plane;
> +	va_list ap;
> +	int ret;
> +
> +	if (!funcs || funcs->destroy)
> +		return ERR_PTR(-EINVAL);
> +
> +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-ENOMEM);
> +
> +	plane = container + offset;
> +
> +	va_start(ap, name);
> +	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
> +					 formats, format_count, format_modifiers,
> +					 type, name, ap);
> +	va_end(ap);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drmm_add_action_or_reset(dev, drmm_universal_plane_alloc_release,
> +				       plane);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__drmm_universal_plane_alloc);
> +
>  int drm_plane_register_all(struct drm_device *dev)
>  {
>  	unsigned int num_planes = 0;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 1d82b264e5e4..8ef06ee1c8eb 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -764,6 +764,48 @@ int drm_plane_init(struct drm_device *dev,
>  		   bool is_primary);
>  void drm_plane_cleanup(struct drm_plane *plane);
>  
> +__printf(10, 11)
> +void *__drmm_universal_plane_alloc(struct drm_device *dev,
> +				   size_t size, size_t offset,
> +				   uint32_t possible_crtcs,
> +				   const struct drm_plane_funcs *funcs,
> +				   const uint32_t *formats,
> +				   unsigned int format_count,
> +				   const uint64_t *format_modifiers,
> +				   enum drm_plane_type plane_type,
> +				   const char *name, ...);
> +
> +/**
> + * drmm_universal_plane_alloc - Allocate and initialize an universal plane object
> + * @dev: DRM device
> + * @type: the type of the struct which contains struct &drm_plane
> + * @member: the name of the &drm_plane within @type
> + * @possible_crtcs: bitmask of possible CRTCs
> + * @funcs: callbacks for the new plane
> + * @formats: array of supported formats (DRM_FORMAT\_\*)
> + * @format_count: number of elements in @formats
> + * @format_modifiers: array of struct drm_format modifiers terminated by
> + *                    DRM_FORMAT_MOD_INVALID
> + * @plane_type: type of plane (overlay, primary, cursor)
> + * @name: printf style format string for the plane name, or NULL for default name
> + *
> + * Allocates and initializes a plane object of type @type. Cleanup is
> + * automatically handled through registering drm_plane_cleanup() with
> + * drmm_add_action().
> + *
> + * The @drm_plane_funcs.destroy hook must be NULL.

I wonder whether we should warn about this somewhere ...

> + *
> + * Returns:
> + * Pointer to new plane, or ERR_PTR on failure.
> + */
> +#define drmm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
> +				   format_count, format_modifiers, plane_type, name, ...) \
> +	((type *)__drmm_universal_plane_alloc(dev, sizeof(type), \

Type upcast with container_of

With the nits addressed somehow:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +					      offsetof(type, member), \
> +					      possible_crtcs, funcs, formats, \
> +					      format_count, format_modifiers, \
> +					      plane_type, name, ##__VA_ARGS__))
> +
>  /**
>   * drm_plane_index - find the index of a registered plane
>   * @plane: plane to find index for
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
