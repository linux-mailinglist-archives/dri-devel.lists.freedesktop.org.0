Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB342CEAC7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2E26E141;
	Fri,  4 Dec 2020 09:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DF76E141
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:23:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB70C99A;
 Fri,  4 Dec 2020 10:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607073799;
 bh=AHsyg2+Rpq4KXaJqGI5tagvfb/gR70AJVLScshMH99E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FnkwAXW4lmTyWqKzBD/zwrMjXOdno0nlIZky6CU2WQnCIpB+KieYUl+NYc5GQHy8y
 KzR3fJrjE1m0IP6M37WtVLeOwFQzuJusrv2snZB4aRSamuPJdWVPkkapNIlIoSVnra
 8rTWpdQsWtKlhBTET2IgGKS4GKlz0kEwVLfFwZio=
Date: Fri, 4 Dec 2020 11:23:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 4/7] drm/crtc: add drmm_crtc_alloc_with_planes()
Message-ID: <20201204092317.GG4109@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20200911135724.25833-4-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135724.25833-4-p.zabel@pengutronix.de>
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

On Fri, Sep 11, 2020 at 03:57:21PM +0200, Philipp Zabel wrote:
> Add an alternative to drm_crtc_init_with_planes() that allocates
> and initializes a crtc and registers drm_crtc_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2:
>  - call va_start() / va_end() unconditionally
> ---
>  drivers/gpu/drm/drm_crtc.c | 116 ++++++++++++++++++++++++++++---------
>  include/drm/drm_crtc.h     |  33 +++++++++++
>  2 files changed, 121 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index aecdd7ea26dc..b9e7c11a76b7 100644
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
> @@ -231,30 +232,12 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>   * 	Setting MODE_ID to 0 will release reserved resources for the CRTC.
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
> @@ -282,11 +265,7 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
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
> @@ -330,8 +309,89 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
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

Similarly as in 1/9, how about using kzalloc() with a kfree() in
drmm_crtc_alloc_with_planes_cleanup() ? With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> index 59b51a09cae6..b71c0a3d4126 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1210,6 +1210,39 @@ int drm_crtc_init_with_planes(struct drm_device *dev,
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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
