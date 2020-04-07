Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9FE1A12B5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 19:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410E6E135;
	Tue,  7 Apr 2020 17:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5DC6E135;
 Tue,  7 Apr 2020 17:28:06 +0000 (UTC)
IronPort-SDR: d47S7bYMJGV6R+X6AdRYLwG1wwLvheOCDB7Kw4IxNgTM8MSTQtgYLpeBjgeioBEC76wUFtbms4
 Su8yBtdla9pw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 10:28:06 -0700
IronPort-SDR: EKxqNTzNf6jFD/9s8wi5KITUMKkiXFaaAzIPMLQ3e/3l2kEYkQxyfQaGpZUHFTe/T6KMCuAn6U
 yqY7dbevYgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; d="scan'208";a="297003911"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 07 Apr 2020 10:28:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Apr 2020 20:28:02 +0300
Date: Tue, 7 Apr 2020 20:28:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v3 1/5] drm: Introduce plane and CRTC scaling filter
 properties
Message-ID: <20200407172802.GJ6112@intel.com>
References: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200330183857.13270-2-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330183857.13270-2-pankaj.laxminarayan.bharadiya@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniels@collabora.com, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 12:08:53AM +0530, Pankaj Bharadiya wrote:
> Introduce per-plane and per-CRTC scaling filter properties to allow
> userspace to select the driver's default scaling filter or
> Nearest-neighbor(NN) filter for upscaling operations on CRTC and
> plane.
> =

> Drivers can set up this property for a plane by calling
> drm_plane_create_scaling_filter() and for a CRTC by calling
> drm_crtc_create_scaling_filter().
> =

> NN filter works by filling in the missing color values in the upscaled
> image with that of the coordinate-mapped nearest source pixel value.
> =

> NN filter for integer multiple scaling can be particularly useful for
> for pixel art games that rely on sharp, blocky images to deliver their
> distinctive look.
> =

> changes since v2:
> * Create per-plane and per-CRTC scaling filter property (Ville)
> changes since v1:
> * None
> changes since RFC:
> * Add separate properties for plane and CRTC (Ville)
> =

> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++
>  drivers/gpu/drm/drm_crtc.c        | 78 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c       | 78 +++++++++++++++++++++++++++++++
>  include/drm/drm_crtc.h            | 16 +++++++
>  include/drm/drm_plane.h           | 21 +++++++++
>  5 files changed, 201 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a1e5e262bae2..ac7dabbf0bcf 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -469,6 +469,8 @@ static int drm_atomic_crtc_set_property(struct drm_cr=
tc *crtc,
>  			return -EFAULT;
>  =

>  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
> +	} else if (property =3D=3D crtc->scaling_filter_property) {
> +		state->scaling_filter =3D val;
>  	} else if (crtc->funcs->atomic_set_property) {
>  		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>  	} else {
> @@ -503,6 +505,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val =3D (state->gamma_lut) ? state->gamma_lut->base.id : 0;
>  	else if (property =3D=3D config->prop_out_fence_ptr)
>  		*val =3D 0;
> +	else if (property =3D=3D crtc->scaling_filter_property)

Random side observation: Why do we have two different styles to naming
these things (prop_foo vs. foo_property)? Would be nice to unify this
one way or the other.

> +		*val =3D state->scaling_filter;
>  	else if (crtc->funcs->atomic_get_property)
>  		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>  	else
> @@ -583,6 +587,8 @@ static int drm_atomic_plane_set_property(struct drm_p=
lane *plane,
>  					sizeof(struct drm_rect),
>  					&replaced);
>  		return ret;
> +	} else if (property =3D=3D plane->scaling_filter_property) {
> +		state->scaling_filter =3D val;
>  	} else if (plane->funcs->atomic_set_property) {
>  		return plane->funcs->atomic_set_property(plane, state,
>  				property, val);
> @@ -641,6 +647,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  	} else if (property =3D=3D config->prop_fb_damage_clips) {
>  		*val =3D (state->fb_damage_clips) ?
>  			state->fb_damage_clips->base.id : 0;
> +	} else if (property =3D=3D plane->scaling_filter_property) {
> +		*val =3D state->scaling_filter;
>  	} else if (plane->funcs->atomic_get_property) {
>  		return plane->funcs->atomic_get_property(plane, state, property, val);
>  	} else {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 4936e1080e41..95502c88966b 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -748,3 +748,81 @@ int drm_mode_crtc_set_obj_prop(struct drm_mode_objec=
t *obj,
>  =

>  	return ret;
>  }
> +
> +/**
> + * DOC: CRTC scaling filter property
> + *
> + * SCALING_FILTER:
> + *
> + *	Indicates scaling filter to be used for CRTC scaler
> + *
> + *	The value of this property can be one of the following:
> + *	Default:
> + *		Driver's default scaling filter
> + *	Nearest Neighbor:
> + *		Nearest Neighbor scaling filter
> + *
> + * Drivers can set up this property for a CRTC by calling
> + * drm_crtc_create_scaling_filter_property
> + */
> +
> +/**
> + * drm_crtc_create_scaling_filter_property - create a new scaling filter
> + * property
> + *
> + * @crtc: drm CRTC
> + * @supported_filters: bitmask of supported scaling filters, must include
> + *		       BIT(DRM_SCALING_FILTER_DEFAULT).
> + *
> + * This function lets driver to enable the scaling filter property on a =
given
> + * CRTC.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
> +					    unsigned int supported_filters)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +	static const struct drm_prop_enum_list props[] =3D {
> +		{ DRM_SCALING_FILTER_DEFAULT, "Default" },
> +		{ DRM_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +	};
> +	unsigned int valid_mode_mask =3D BIT(DRM_SCALING_FILTER_DEFAULT) |
> +				       BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR);
> +	int i;
> +
> +	if (WARN_ON((supported_filters & ~valid_mode_mask) ||
> +		    ((supported_filters & BIT(DRM_SCALING_FILTER_DEFAULT)) =3D=3D 0)))
> +		return -EINVAL;
> +
> +	prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +				   "SCALING_FILTER",
> +				   hweight32(supported_filters));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(props); i++) {
> +		int ret;
> +
> +		if (!(BIT(props[i].type) & supported_filters))
> +			continue;
> +
> +		ret =3D drm_property_add_enum(prop, props[i].type,
> +					    props[i].name);
> +
> +		if (ret) {
> +			drm_property_destroy(dev, prop);
> +
> +			return ret;
> +		}
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop,
> +				   DRM_SCALING_FILTER_DEFAULT);

Everything up to here is identical between the crtc and plane. Needs a
refactoring. In fact this whole thing seems pretty generic. Should
probably think about just adding that bitmask to
drm_property_create_enum(). I suppose we could try to avoid having to
change all the existing callers by keeping the current thing without the
bitmask (though it could probably internally just call the version which
takes the bitmask, assuming our enum values aren't too big for that.

Otherwise the patch seems reasonable.

> +	crtc->scaling_filter_property =3D prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index d6ad60ab0d38..a6fc95942851 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1221,3 +1221,81 @@ int drm_mode_page_flip_ioctl(struct drm_device *de=
v,
>  =

>  	return ret;
>  }
> +
> +/**
> + * DOC: Plane scaling filter property
> + *
> + * SCALING_FILTER:
> + *
> + *	Indicates scaling filter to be used for plane scaler
> + *
> + *	The value of this property can be one of the following:
> + *	Default:
> + *		Driver's default scaling filter
> + *	Nearest Neighbor:
> + *		Nearest Neighbor scaling filter
> + *
> + * Drivers can set up this property for a plane by calling
> + * drm_plane_create_scaling_filter_property
> + */
> +
> +/**
> + * drm_plane_create_scaling_filter_property - create a new scaling filter
> + * property
> + *
> + * @plane: drm plane
> + * @supported_filters: bitmask of supported scaling filters, must include
> + *		       BIT(DRM_SCALING_FILTER_DEFAULT).
> + *
> + * This function lets driver to enable the scaling filter property on a =
given
> + * plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> +					     unsigned int supported_filters)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_property *prop;
> +	static const struct drm_prop_enum_list props[] =3D {
> +		{ DRM_SCALING_FILTER_DEFAULT, "Default" },
> +		{ DRM_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +	};
> +	unsigned int valid_mode_mask =3D BIT(DRM_SCALING_FILTER_DEFAULT) |
> +				       BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR);
> +	int i;
> +
> +	if (WARN_ON((supported_filters & ~valid_mode_mask) ||
> +		    ((supported_filters & BIT(DRM_SCALING_FILTER_DEFAULT)) =3D=3D 0)))
> +		return -EINVAL;
> +
> +	prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +				   "SCALING_FILTER",
> +				   hweight32(supported_filters));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(props); i++) {
> +		int ret;
> +
> +		if (!(BIT(props[i].type) & supported_filters))
> +			continue;
> +
> +		ret =3D drm_property_add_enum(prop, props[i].type,
> +					    props[i].name);
> +
> +		if (ret) {
> +			drm_property_destroy(dev, prop);
> +
> +			return ret;
> +		}
> +	}
> +
> +	drm_object_attach_property(&plane->base, prop,
> +				   DRM_SCALING_FILTER_DEFAULT);
> +	plane->scaling_filter_property =3D prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 59b51a09cae6..ba839e5e357d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -324,6 +324,13 @@ struct drm_crtc_state {
>  	 */
>  	bool self_refresh_active;
>  =

> +	/**
> +	 * @scaling_filter:
> +	 *
> +	 * Scaling filter to be applied
> +	 */
> +	enum drm_scaling_filter scaling_filter;
> +
>  	/**
>  	 * @event:
>  	 *
> @@ -1083,6 +1090,12 @@ struct drm_crtc {
>  	/** @properties: property tracking for this CRTC */
>  	struct drm_object_properties properties;
>  =

> +	/**
> +	 * @scaling_filter_property: property to apply a particular filter while
> +	 * scaling.
> +	 */
> +	struct drm_property *scaling_filter_property;
> +
>  	/**
>  	 * @state:
>  	 *
> @@ -1266,4 +1279,7 @@ static inline struct drm_crtc *drm_crtc_find(struct=
 drm_device *dev,
>  #define drm_for_each_crtc(crtc, dev) \
>  	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
>  =

> +int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
> +					    unsigned int supported_filters);
> +
>  #endif /* __DRM_CRTC_H__ */
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 3f396d94afe4..1d82b264e5e4 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -35,6 +35,11 @@ struct drm_crtc;
>  struct drm_printer;
>  struct drm_modeset_acquire_ctx;
>  =

> +enum drm_scaling_filter {
> +	DRM_SCALING_FILTER_DEFAULT,
> +	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -214,6 +219,13 @@ struct drm_plane_state {
>  	 */
>  	bool visible;
>  =

> +	/**
> +	 * @scaling_filter:
> +	 *
> +	 * Scaling filter to be applied
> +	 */
> +	enum drm_scaling_filter scaling_filter;
> +
>  	/**
>  	 * @commit: Tracks the pending commit to prevent use-after-free conditi=
ons,
>  	 * and for async plane updates.
> @@ -724,6 +736,12 @@ struct drm_plane {
>  	 * See drm_plane_create_color_properties().
>  	 */
>  	struct drm_property *color_range_property;
> +
> +	/**
> +	 * @scaling_filter_property: property to apply a particular filter while
> +	 * scaling.
> +	 */
> +	struct drm_property *scaling_filter_property;
>  };
>  =

>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)
> @@ -862,4 +880,7 @@ drm_plane_get_damage_clips(const struct drm_plane_sta=
te *state)
>  					state->fb_damage_clips->data : NULL);
>  }
>  =

> +int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> +					     unsigned int supported_filters);
> +
>  #endif
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
