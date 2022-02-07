Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFF4ACBC4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4310E168;
	Mon,  7 Feb 2022 22:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49610E168
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:04:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 535E4499;
 Mon,  7 Feb 2022 23:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644271444;
 bh=aYOSd4uk8eFHEQDh8Mak6xLLznN2eECkn0tIbMXKtPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTVwrPV+n6fZcElxY+rg5wV2kBV9P07lh7z11NjEMLFTTyZPMIGkN0mlaqu98YfOJ
 kARYPJUIXnQ5FzB/c2G9bLIgNT39+GekIiUOPA8orgd3a1KdcXqU7qdgHFh9aqqLaZ
 qGj0nmG5QXoMHWusNENZlTMCSRcb7Y9eAjKNsb40=
Date: Tue, 8 Feb 2022 00:04:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 06/23] drm/object: Add
 drm_object_property_get_default_value() function
Message-ID: <YgGXUr/jAx5WJpXN@pendragon.ideasonboard.com>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-7-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207163515.1038648-7-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime and Dave,

Thank you for the patch.

On Mon, Feb 07, 2022 at 05:34:58PM +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Some functions to create properties (drm_plane_create_zpos_property or
> drm_plane_create_color_properties for example) will ask for a range of
> acceptable value and an initial one.
> 
> This initial value is then stored in the values array for that property.
> 
> Let's provide an helper to access this property.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_mode_object.c | 53 +++++++++++++++++++++++++------
>  include/drm/drm_mode_object.h     |  7 ++++
>  2 files changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index 86d9e907c0b2..ba1608effc0f 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -297,11 +297,26 @@ int drm_object_property_set_value(struct drm_mode_object *obj,
>  }
>  EXPORT_SYMBOL(drm_object_property_set_value);
>  
> +static int __drm_object_property_get_prop_value(struct drm_mode_object *obj,
> +						struct drm_property *property,
> +						uint64_t *val)
> +{
> +	int i;
> +
> +	for (i = 0; i < obj->properties->count; i++) {
> +		if (obj->properties->properties[i] == property) {
> +			*val = obj->properties->values[i];
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int __drm_object_property_get_value(struct drm_mode_object *obj,
>  					   struct drm_property *property,
>  					   uint64_t *val)
>  {
> -	int i;
>  
>  	/* read-only properties bypass atomic mechanism and still store
>  	 * their value in obj->properties->values[].. mostly to avoid
> @@ -311,15 +326,7 @@ static int __drm_object_property_get_value(struct drm_mode_object *obj,
>  			!(property->flags & DRM_MODE_PROP_IMMUTABLE))
>  		return drm_atomic_get_property(obj, property, val);
>  
> -	for (i = 0; i < obj->properties->count; i++) {
> -		if (obj->properties->properties[i] == property) {
> -			*val = obj->properties->values[i];
> -			return 0;
> -		}
> -
> -	}
> -
> -	return -EINVAL;
> +	return __drm_object_property_get_prop_value(obj, property, val);
>  }
>  
>  /**
> @@ -348,6 +355,32 @@ int drm_object_property_get_value(struct drm_mode_object *obj,
>  }
>  EXPORT_SYMBOL(drm_object_property_get_value);
>  
> +/**
> + * drm_object_property_get_default_value - retrieve the default value of a
> + * property when in atomic mode.
> + * @obj: drm mode object to get property value from
> + * @property: property to retrieve
> + * @val: storage for the property value
> + *
> + * This function retrieves the default state of the given property as passed in
> + * to drm_object_attach_property
> + *
> + * Only atomic drivers should call this function directly, as for non-atomic
> + * drivers it will return the current value.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_object_property_get_default_value(struct drm_mode_object *obj,
> +					  struct drm_property *property,
> +					  uint64_t *val)
> +{
> +	WARN_ON(!drm_drv_uses_atomic_modeset(property->dev));
> +
> +	return __drm_object_property_get_prop_value(obj, property, val);
> +}
> +EXPORT_SYMBOL(drm_object_property_get_default_value);
> +
>  /* helper for getconnector and getproperties ioctls */
>  int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>  				   uint32_t __user *prop_ptr,
> diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
> index c34a3e8030e1..912f1e415685 100644
> --- a/include/drm/drm_mode_object.h
> +++ b/include/drm/drm_mode_object.h
> @@ -98,6 +98,10 @@ struct drm_object_properties {
>  	 * Hence atomic drivers should not use drm_object_property_set_value()
>  	 * and drm_object_property_get_value() on mutable objects, i.e. those
>  	 * without the DRM_MODE_PROP_IMMUTABLE flag set.
> +	 *
> +	 * For atomic drivers the default value of properties is stored in this
> +	 * array, so drm_object_property_get_default_value can be used to
> +	 * retrieve it.
>  	 */
>  	uint64_t values[DRM_OBJECT_MAX_PROPERTY];
>  };
> @@ -126,6 +130,9 @@ int drm_object_property_set_value(struct drm_mode_object *obj,
>  int drm_object_property_get_value(struct drm_mode_object *obj,
>  				  struct drm_property *property,
>  				  uint64_t *value);
> +int drm_object_property_get_default_value(struct drm_mode_object *obj,
> +					  struct drm_property *property,
> +					  uint64_t *val);
>  
>  void drm_object_attach_property(struct drm_mode_object *obj,
>  				struct drm_property *property,
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart
