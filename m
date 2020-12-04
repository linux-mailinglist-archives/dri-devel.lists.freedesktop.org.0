Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41C2CEAC2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9D86E141;
	Fri,  4 Dec 2020 09:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B6B6E141
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:22:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E510799A;
 Fri,  4 Dec 2020 10:22:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607073748;
 bh=WC46M/0+XV5rRoZJK7U/Sm0px9ver6ABB2f+byZvfyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJ4oGXD4W2G83CQ4loaCkYtyR4/25shcERjt27gXSmMEypd3OcdjVaCk3YDB5JtoW
 jTvLf9G8qIrMfvb/0kf5jLyaaOCo1yvLnsUydQ6/El6MB6ofhVoqbY9QEQz34fpnvC
 S02Phnfp6ekkvO/tdTaYPGuRWbbETnEjEfilFurc=
Date: Fri, 4 Dec 2020 11:22:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 3/7] drm/plane: add drmm_universal_plane_alloc()
Message-ID: <20201204092226.GF4109@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20200911135724.25833-3-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135724.25833-3-p.zabel@pengutronix.de>
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

On Fri, Sep 11, 2020 at 03:57:20PM +0200, Philipp Zabel wrote:
> Add an alternative to drm_universal_plane_init() that allocates
> and initializes a plane and registers drm_plane_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2:
>  - call va_start() / va_end() unconditionally
> ---
>  drivers/gpu/drm/drm_plane.c | 126 +++++++++++++++++++++++++++---------
>  include/drm/drm_plane.h     |  42 ++++++++++++
>  2 files changed, 139 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index affe1cfed009..0081f6bb76b2 100644
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

Similarly as in 1/9, how about using kzalloc() with a kfree() in
drmm_universal_plane_alloc_release() ? With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> index 3f396d94afe4..82bd63710a39 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -746,6 +746,48 @@ int drm_plane_init(struct drm_device *dev,
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
> + *
> + * Returns:
> + * Pointer to new plane, or ERR_PTR on failure.
> + */
> +#define drmm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
> +				   format_count, format_modifiers, plane_type, name, ...) \
> +	((type *)__drmm_universal_plane_alloc(dev, sizeof(type), \
> +					      offsetof(type, member), \
> +					      possible_crtcs, funcs, formats, \
> +					      format_count, format_modifiers, \
> +					      plane_type, name, ##__VA_ARGS__))
> +
>  /**
>   * drm_plane_index - find the index of a registered plane
>   * @plane: plane to find index for

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
