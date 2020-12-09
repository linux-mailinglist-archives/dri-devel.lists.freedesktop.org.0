Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BE42D4B95
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 21:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32D76E193;
	Wed,  9 Dec 2020 20:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8FF6E193
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 20:21:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t16so3145710wra.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 12:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aifzYBZXovp61ut0U7X0OMITjMKgpRZrJ3kQIz0pLtY=;
 b=LQqF4L2OJ960S3TLt44sdpuRLKcQqExcgf5uDPnM1IcfhsVr2PK6EevEj0IUGAq37g
 dBpdCmG0PaBcZSHwlmEBCxThmkD6mHx6YAmZetrJPpbN+qDQAIXq2zFCOoBjXhXIOHtm
 U1AQYZ3f13spz2z25qqVIVrObZHX1WD+q65es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aifzYBZXovp61ut0U7X0OMITjMKgpRZrJ3kQIz0pLtY=;
 b=nfqNbIBLXhoJsBs6N7DjQCjd7X9k0F+fGSM3OY+StlfNbubHHuHECba8WQg+k+MZOy
 ytZhmJrxrAtEM1c80ZvFX+GFviCXb9AlCZZQ95/vIxwLEI6PL5pZPNhdTvJMYQ3z9JfN
 Cv3yYI9pQ8BwxwfrfYd0tI6aLvImn6AfMSwHfOx+l/12iAlMp0MBv9letycoun3Fk5lV
 gC2uzhqZ4M3K0FIelC+yGpYmJ7WRl+c0NBpMiicboSsgXPVaKU1g32ga81E2Nya05XRH
 6PhOi5nKB2iLGqCEv/QrTgh9BCGMMqyHc7l17PVM5uKDQrEDdtd7KNzLdGO0qQ/f6Cly
 Ejyg==
X-Gm-Message-State: AOAM530guwSy0iH+5Bwzv5tL6mRMwJCKlP5kACssQ9GyQXvsnaz4NgfJ
 ZuNqpZpvezmyp6rSDud9jE1U2A0weSH/vg==
X-Google-Smtp-Source: ABdhPJxXLaqoUhevjLvU0E0Hq4wR/NUAMdz+vCU9eewT/08Oh4hm9PslCZ8h1C9TpHecrlwB3L0xgQ==
X-Received: by 2002:a5d:4c8d:: with SMTP id z13mr4711311wrs.248.1607545298227; 
 Wed, 09 Dec 2020 12:21:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a65sm4863088wmc.35.2020.12.09.12.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:21:37 -0800 (PST)
Date: Wed, 9 Dec 2020 21:21:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 05/19] drm/crtc: add drmm_crtc_alloc_with_planes()
Message-ID: <20201209202135.GZ401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-6-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208155451.8421-6-p.zabel@pengutronix.de>
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

On Tue, Dec 08, 2020 at 04:54:37PM +0100, Philipp Zabel wrote:
> Add an alternative to drm_crtc_init_with_planes() that allocates
> and initializes a crtc and registers drm_crtc_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Same bikesheds as with the others, imo important one is to point at the
new drmm_ version from the old kerneldoc. The others just make sure you
roll them out consistently (or not, if you don't like my suggestions).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_crtc.c | 116 ++++++++++++++++++++++++++++---------
>  include/drm/drm_crtc.h     |  33 +++++++++++
>  2 files changed, 121 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index f927976eca50..668c31332230 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_lock.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_auth.h>
> @@ -240,30 +241,12 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>   *
>   */
>  
> -/**
> - * drm_crtc_init_with_planes - Initialise a new CRTC object with
> - *    specified primary and cursor planes.
> - * @dev: DRM device
> - * @crtc: CRTC object to init
> - * @primary: Primary plane for CRTC
> - * @cursor: Cursor plane for CRTC
> - * @funcs: callbacks for the new CRTC
> - * @name: printf style format string for the CRTC name, or NULL for default name
> - *
> - * Inits a new object created as base part of a driver crtc object. Drivers
> - * should use this function instead of drm_crtc_init(), which is only provided
> - * for backwards compatibility with drivers which do not yet support universal
> - * planes). For really simple hardware which has only 1 plane look at
> - * drm_simple_display_pipe_init() instead.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
> -			      struct drm_plane *primary,
> -			      struct drm_plane *cursor,
> -			      const struct drm_crtc_funcs *funcs,
> -			      const char *name, ...)
> +__printf(6, 0)
> +static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
> +				       struct drm_plane *primary,
> +				       struct drm_plane *cursor,
> +				       const struct drm_crtc_funcs *funcs,
> +				       const char *name, va_list ap)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int ret;
> @@ -291,11 +274,7 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
>  		return ret;
>  
>  	if (name) {
> -		va_list ap;
> -
> -		va_start(ap, name);
>  		crtc->name = kvasprintf(GFP_KERNEL, name, ap);
> -		va_end(ap);
>  	} else {
>  		crtc->name = kasprintf(GFP_KERNEL, "crtc-%d",
>  				       drm_num_crtcs(dev));
> @@ -339,8 +318,89 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  	return 0;
>  }
> +
> +/**
> + * drm_crtc_init_with_planes - Initialise a new CRTC object with
> + *    specified primary and cursor planes.
> + * @dev: DRM device
> + * @crtc: CRTC object to init
> + * @primary: Primary plane for CRTC
> + * @cursor: Cursor plane for CRTC
> + * @funcs: callbacks for the new CRTC
> + * @name: printf style format string for the CRTC name, or NULL for default name
> + *
> + * Inits a new object created as base part of a driver crtc object. Drivers
> + * should use this function instead of drm_crtc_init(), which is only provided
> + * for backwards compatibility with drivers which do not yet support universal
> + * planes). For really simple hardware which has only 1 plane look at
> + * drm_simple_display_pipe_init() instead.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
> +			      struct drm_plane *primary,
> +			      struct drm_plane *cursor,
> +			      const struct drm_crtc_funcs *funcs,
> +			      const char *name, ...)
> +{
> +	va_list ap;
> +	int ret;
> +
> +	va_start(ap, name);
> +	ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
> +					  name, ap);
> +	va_end(ap);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_crtc_init_with_planes);
>  
> +static void drmm_crtc_alloc_with_planes_cleanup(struct drm_device *dev,
> +						void *ptr)
> +{
> +	struct drm_crtc *crtc = ptr;
> +
> +	drm_crtc_cleanup(crtc);
> +}
> +
> +void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
> +				    size_t size, size_t offset,
> +				    struct drm_plane *primary,
> +				    struct drm_plane *cursor,
> +				    const struct drm_crtc_funcs *funcs,
> +				    const char *name, ...)
> +{
> +	void *container;
> +	struct drm_crtc *crtc;
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
> +	crtc = container + offset;
> +
> +	va_start(ap, name);
> +	ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
> +					  name, ap);
> +	va_end(ap);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drmm_add_action_or_reset(dev, drmm_crtc_alloc_with_planes_cleanup,
> +				       crtc);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__drmm_crtc_alloc_with_planes);
> +
>  /**
>   * drm_crtc_cleanup - Clean up the core crtc usage
>   * @crtc: CRTC to cleanup
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index ba839e5e357d..9053f80b613f 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1223,6 +1223,39 @@ int drm_crtc_init_with_planes(struct drm_device *dev,
>  			      const char *name, ...);
>  void drm_crtc_cleanup(struct drm_crtc *crtc);
>  
> +__printf(7, 8)
> +void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
> +				    size_t size, size_t offset,
> +				    struct drm_plane *primary,
> +				    struct drm_plane *cursor,
> +				    const struct drm_crtc_funcs *funcs,
> +				    const char *name, ...);
> +
> +/**
> + * drm_crtc_alloc_with_planes - Allocate and initialize a new CRTC object with
> + *    specified primary and cursor planes.
> + * @dev: DRM device
> + * @type: the type of the struct which contains struct &drm_crtc
> + * @member: the name of the &drm_crtc within @type.
> + * @primary: Primary plane for CRTC
> + * @cursor: Cursor plane for CRTC
> + * @funcs: callbacks for the new CRTC
> + * @name: printf style format string for the CRTC name, or NULL for default name
> + *
> + * Allocates and initializes a new crtc object. Cleanup is automatically
> + * handled through registering drmm_crtc_cleanup() with drmm_add_action().
> + *
> + * The @drm_crtc_funcs.destroy hook must be NULL.
> + *
> + * Returns:
> + * Pointer to new crtc, or ERR_PTR on failure.
> + */
> +#define drmm_crtc_alloc_with_planes(dev, type, member, primary, cursor, funcs, name, ...) \
> +	((type *)__drmm_crtc_alloc_with_planes(dev, sizeof(type), \
> +					       offsetof(type, member), \
> +					       primary, cursor, funcs, \
> +					       name, ##__VA_ARGS__))
> +
>  /**
>   * drm_crtc_index - find the index of a registered CRTC
>   * @crtc: CRTC to find index for
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
