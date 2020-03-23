Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F23018F6B4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3C989DF9;
	Mon, 23 Mar 2020 14:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BCD89DF9;
 Mon, 23 Mar 2020 14:21:51 +0000 (UTC)
IronPort-SDR: 2uHal2LKyNYLzZcQwy+6YfhF3t3tmYHru6MNwPkgaPohs0JFlWxKwoaz+pXyl2e3tHPYosXI8h
 FT4nktYwMDzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 07:21:50 -0700
IronPort-SDR: cxaiZIsASh3d41Mbo32N23pzZUBvOwC98oshvev4fEL7obECvXlZ69TNOR/RkAYfDW04Mi0D7O
 mdy64MY3GNHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; d="scan'208";a="237919366"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 23 Mar 2020 07:21:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Mar 2020 16:21:46 +0200
Date: Mon, 23 Mar 2020 16:21:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v2 1/5] drm: Introduce plane and CRTC scaling filter
 properties
Message-ID: <20200323142146.GS13686@intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200319102103.28895-2-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319102103.28895-2-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: sameer.lattannavar@intel.com, daniels@collabora.com,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 03:50:59PM +0530, Pankaj Bharadiya wrote:
> Introduce new plane and CRTC scaling filter properties to allow
> userspace to select the driver's default scaling filter or
> Nearest-neighbor(NN) filter for upscaling operations on CRTC and
> plane.
> =

> Drivers can set up this property for a plane by calling
> drm_plane_enable_scaling_filter() and for a CRTC by calling
> drm_crtc_enable_scaling_filter().
> =

> NN filter works by filling in the missing color values in the upscaled
> image with that of the coordinate-mapped nearest source pixel value.
> =

> NN filter for integer multiple scaling can be particularly useful for
> for pixel art games that rely on sharp, blocky images to deliver their
> distinctive look.
> =

> changes since v1:
> * None
> changes since RFC:
> * Add separate properties for plane and CRTC (Ville)

I actually meant the prop should be per-object, not just separate
prop for planes and crtcs.

> =

> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++++++
>  drivers/gpu/drm/drm_crtc.c        | 33 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c | 26 ++++++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c       | 33 +++++++++++++++++++++++++++++++
>  include/drm/drm_crtc.h            | 13 ++++++++++++
>  include/drm/drm_mode_config.h     | 12 +++++++++++
>  include/drm/drm_plane.h           | 13 ++++++++++++
>  7 files changed, 138 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a1e5e262bae2..3c72ab52ff62 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -435,6 +435,8 @@ static int drm_atomic_crtc_set_property(struct drm_cr=
tc *crtc,
>  		return ret;
>  	} else if (property =3D=3D config->prop_vrr_enabled) {
>  		state->vrr_enabled =3D val;
> +	} else if (property =3D=3D config->crtc_scaling_filter_property) {
> +		state->scaling_filter =3D val;
>  	} else if (property =3D=3D config->degamma_lut_property) {
>  		ret =3D drm_atomic_replace_property_blob_from_id(dev,
>  					&state->degamma_lut,
> @@ -503,6 +505,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val =3D (state->gamma_lut) ? state->gamma_lut->base.id : 0;
>  	else if (property =3D=3D config->prop_out_fence_ptr)
>  		*val =3D 0;
> +	else if (property =3D=3D config->crtc_scaling_filter_property)
> +		*val =3D state->scaling_filter;
>  	else if (crtc->funcs->atomic_get_property)
>  		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>  	else
> @@ -583,6 +587,8 @@ static int drm_atomic_plane_set_property(struct drm_p=
lane *plane,
>  					sizeof(struct drm_rect),
>  					&replaced);
>  		return ret;
> +	} else if (property =3D=3D config->plane_scaling_filter_property) {
> +		state->scaling_filter =3D val;
>  	} else if (plane->funcs->atomic_set_property) {
>  		return plane->funcs->atomic_set_property(plane, state,
>  				property, val);
> @@ -641,6 +647,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  	} else if (property =3D=3D config->prop_fb_damage_clips) {
>  		*val =3D (state->fb_damage_clips) ?
>  			state->fb_damage_clips->base.id : 0;
> +	} else if (property =3D=3D config->plane_scaling_filter_property) {
> +		*val =3D state->scaling_filter;
>  	} else if (plane->funcs->atomic_get_property) {
>  		return plane->funcs->atomic_get_property(plane, state, property, val);
>  	} else {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 4936e1080e41..c8d387891dd5 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -748,3 +748,36 @@ int drm_mode_crtc_set_obj_prop(struct drm_mode_objec=
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
> + * drm_crtc_enable_scaling_filter()
> + */
> +
> +/**
> + * drm_crtc_enable_scaling_filter - Enables CRTC scaling filter property.
> + * @crtc: CRTC on which to enable scaling filter property.
> + *
> + * This function lets driver to enable the scaling filter property on a =
CRTC.
> + */
> +void drm_crtc_enable_scaling_filter(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +
> +	drm_object_attach_property(&crtc->base,
> +				   dev->mode_config.crtc_scaling_filter_property,
> +				   0);
> +}
> +EXPORT_SYMBOL(drm_crtc_enable_scaling_filter);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index e1ec1bb7068d..483705581930 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -214,6 +214,16 @@ static const struct drm_prop_enum_list drm_plane_typ=
e_enum_list[] =3D {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>  =

> +static const struct drm_prop_enum_list drm_crtc_scaling_filter_enum_list=
[] =3D {
> +	{ DRM_CRTC_SCALING_FILTER_DEFAULT, "Default" },
> +	{ DRM_CRTC_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +};
> +
> +static const struct drm_prop_enum_list drm_plane_scaling_filter_enum_lis=
t[] =3D {
> +	{ DRM_PLANE_SCALING_FILTER_DEFAULT, "Default" },
> +	{ DRM_PLANE_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +};
> +
>  static int drm_mode_create_standard_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> @@ -370,6 +380,22 @@ static int drm_mode_create_standard_properties(struc=
t drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.modifiers_property =3D prop;
>  =

> +	prop =3D drm_property_create_enum(dev, 0,
> +				"SCALING_FILTER",
> +				drm_crtc_scaling_filter_enum_list,
> +				ARRAY_SIZE(drm_crtc_scaling_filter_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.crtc_scaling_filter_property =3D prop;
> +
> +	prop =3D drm_property_create_enum(dev, 0,
> +				"SCALING_FILTER",
> +				drm_plane_scaling_filter_enum_list,
> +				ARRAY_SIZE(drm_plane_scaling_filter_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.plane_scaling_filter_property =3D prop;
> +
>  	return 0;
>  }
>  =

> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index d6ad60ab0d38..f71cf50a4ef9 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1221,3 +1221,36 @@ int drm_mode_page_flip_ioctl(struct drm_device *de=
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
> + * drm_plane_enable_scaling_filter()
> + */
> +
> +/**
> + * drm_plane_enable_scaling_filter - Enables plane scaling filter proper=
ty.
> + * @plane: Plane on which to enable scaling filter property.
> + *
> + * This function lets driver to enable the scaling filter property on a =
plane.
> + */
> +void drm_plane_enable_scaling_filter(struct drm_plane *plane)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +
> +	drm_object_attach_property(&plane->base,
> +				   dev->mode_config.plane_scaling_filter_property,
> +				   0);
> +}
> +EXPORT_SYMBOL(drm_plane_enable_scaling_filter);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 59b51a09cae6..3187df6874d4 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -76,6 +76,10 @@ struct drm_atomic_state;
>  struct drm_crtc_helper_funcs;
>  struct drm_plane_helper_funcs;
>  =

> +enum drm_crtc_scaling_filter {
> +	DRM_CRTC_SCALING_FILTER_DEFAULT,
> +	DRM_CRTC_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};
>  /**
>   * struct drm_crtc_state - mutable CRTC state
>   *
> @@ -296,6 +300,13 @@ struct drm_crtc_state {
>  	 */
>  	u32 target_vblank;
>  =

> +	/**
> +	 * @scaling_filter:
> +	 *
> +	 * Scaling filter mode to be applied
> +	 */
> +	enum drm_crtc_scaling_filter scaling_filter;
> +
>  	/**
>  	 * @async_flip:
>  	 *
> @@ -1266,4 +1277,6 @@ static inline struct drm_crtc *drm_crtc_find(struct=
 drm_device *dev,
>  #define drm_for_each_crtc(crtc, dev) \
>  	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
>  =

> +void drm_crtc_enable_scaling_filter(struct drm_crtc *crtc);
> +
>  #endif /* __DRM_CRTC_H__ */
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 3bcbe30339f0..2b394561359b 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -914,6 +914,18 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *modifiers_property;
>  =

> +	/**
> +	 * @crtc_scaling_filter_property: CRTC property to apply a particular
> +	 * filter while scaling.
> +	 */
> +	struct drm_property *crtc_scaling_filter_property;
> +
> +	/**
> +	 * @plane_scaling_filter_property: Plane property to apply a particular
> +	 * filter while scaling.
> +	 */
> +	struct drm_property *plane_scaling_filter_property;
> +
>  	/* cursor size */
>  	uint32_t cursor_width, cursor_height;
>  =

> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 3f396d94afe4..f75cee8c4ffa 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -35,6 +35,10 @@ struct drm_crtc;
>  struct drm_printer;
>  struct drm_modeset_acquire_ctx;
>  =

> +enum drm_plane_scaling_filter {
> +	DRM_PLANE_SCALING_FILTER_DEFAULT,
> +	DRM_PLANE_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -214,6 +218,13 @@ struct drm_plane_state {
>  	 */
>  	bool visible;
>  =

> +	/**
> +	 * @scaling_filter:
> +	 *
> +	 * Scaling filter mode to be applied
> +	 */
> +	enum drm_plane_scaling_filter scaling_filter;
> +
>  	/**
>  	 * @commit: Tracks the pending commit to prevent use-after-free conditi=
ons,
>  	 * and for async plane updates.
> @@ -862,4 +873,6 @@ drm_plane_get_damage_clips(const struct drm_plane_sta=
te *state)
>  					state->fb_damage_clips->data : NULL);
>  }
>  =

> +void drm_plane_enable_scaling_filter(struct drm_plane *plane);
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
