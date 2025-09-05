Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0123B46151
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 19:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C412710EC21;
	Fri,  5 Sep 2025 17:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F/plYyHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A3510EC1B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 17:56:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 299E31A0DEB;
 Fri,  5 Sep 2025 17:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F35D46060B;
 Fri,  5 Sep 2025 17:56:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 309E4102F27C6; 
 Fri,  5 Sep 2025 19:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757095012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=B9Q0OHH8Ugc9QWKRPmSc2V8ZO22hDgkD6wGGPri9PJ8=;
 b=F/plYyHf3fhs2d3Ertfl6a7JIkIlR1VAvYHMnvyySfH7k/sxYG3Xvb9mYYUobcs+HkW7KE
 eE8jMWW/edBWzZcG0ITvYlUdMVUhRou2mzDZbnWSC8Bw6Q3E4gKS4TBmVKDM6ALkW5MvuY
 omBLZvTACML6X3yadL9LnGWU1E12iHjkHDgqNbnrkVP9cDQm81od4ArDgco1LJUZkfGBAJ
 UHMi/7cYhSSjnywhI7DNZVLA+YyCP5OoVdMf8NydAnKyAPreaxcOmdnojGavLCbPyELrgh
 xzZQt9wX7JdPVIk79DS02O6tc9Si0kS7DQV17YQJm5XPXMnlOn8YtgotpyVgdQ==
Message-ID: <4d63e90a-794f-4108-9219-19b0c0dab267@bootlin.com>
Date: Fri, 5 Sep 2025 19:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 22/08/2025 à 20:36, Nícolas F. R. A. Prado a écrit :
> Introduce support for a post-blend color pipeline API analogous to the
> pre-blend color pipeline API. While the pre-blend color pipeline was
> configured through a COLOR_PIPELINE property attached to a drm_plane,
> the post-blend color pipeline is configured through a COLOR_PIPELINE
> property on the drm_crtc.
> 
> Since colorops can now be attached to either a drm_plane or a drm_crtc,
> rework the helpers to account for both cases.
> 
> Also introduce a new cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, to
> enable support for post-blend color pipelines, and prevent the now
> legacy GAMMA_LUT, DEGAMMA_LUT, GAMMA_LUT_SIZE and CTM properties from
> being exposed.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        |  32 ++++++--
>   drivers/gpu/drm/drm_atomic_uapi.c   |  50 ++++++++++++-
>   drivers/gpu/drm/drm_colorop.c       | 144 +++++++++++++++++++++++++++++-------
>   drivers/gpu/drm/drm_connector.c     |   1 +
>   drivers/gpu/drm/drm_crtc.c          |  77 +++++++++++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h |   6 ++
>   drivers/gpu/drm/drm_ioctl.c         |   7 ++
>   drivers/gpu/drm/drm_mode_object.c   |  20 +++++
>   drivers/gpu/drm/drm_plane.c         |  36 ++-------
>   include/drm/drm_atomic.h            |  20 +++++
>   include/drm/drm_atomic_uapi.h       |   2 +
>   include/drm/drm_colorop.h           |  16 +++-
>   include/drm/drm_crtc.h              |  19 +++++
>   include/drm/drm_file.h              |   7 ++
>   include/uapi/drm/drm.h              |  16 ++++
>   15 files changed, 383 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3ab32fe7fe1cbf9057c3763d979638dce013d82b..558d389d59d9a44d3cd1048ed365848f62b4d62d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -472,6 +472,8 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>   	drm_printf(p, "\tplane_mask=%x\n", state->plane_mask);
>   	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
>   	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
> +	drm_printf(p, "\tcolor-pipeline=%d\n",
> +		   state->color_pipeline ? state->color_pipeline->base.id : 0);

This could be in a separate patch / suggested to the initial series.

>   	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
>   
>   	if (crtc->funcs->atomic_print_state)
> @@ -617,9 +619,15 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>   	if (colorop_state)
>   		return colorop_state;
>   
> -	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
> -	if (ret)
> -		return ERR_PTR(ret);
> +	if (colorop->plane) {
> +		ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		ret = drm_modeset_lock(&colorop->crtc->mutex, state->acquire_ctx);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

Two suggestions here:

Maybe you can create `colorop_modeset_lock/unlock` helpers to avoid code 
repetition.

Can you also change it to

	if (colorop->plane)
		...
	else if (colorop->crtc)
		...
	else
		drm_err("Dangling colorop, it must be attached to a plane or a CRTC")
		return ERR_PTR

?

This way it will avoid issues if someone add support to attach colorop 
to other drm parts and forgot to update locking in some places.

>   
>   	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
>   	if (!colorop_state)
> @@ -2003,11 +2011,21 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
>   		return;
>   
>   	list_for_each_entry(colorop, &config->colorop_list, head) {
> -		if (take_locks)
> -			drm_modeset_lock(&colorop->plane->mutex, NULL);
> +		if (take_locks) {
> +			if (colorop->plane)
> +				drm_modeset_lock(&colorop->plane->mutex, NULL);
> +			else
> +				drm_modeset_lock(&colorop->crtc->mutex, NULL);> +
> +		}
>   		drm_atomic_colorop_print_state(p, colorop->state);
> -		if (take_locks)
> -			drm_modeset_unlock(&colorop->plane->mutex);
> +		if (take_locks) {
> +			if (colorop->plane)
> +				drm_modeset_unlock(&colorop->plane->mutex);
> +			else
> +				drm_modeset_unlock(&colorop->crtc->mutex);
> +
> +		}
>   	}
>   
>   	list_for_each_entry(plane, &config->plane_list, head) {
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index b7cc6945864274bedd21dd5b73494f9aae216888..a826758cf0b6205e2ba49734070bc83ffb7c08df 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -287,6 +287,33 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   }
>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>   
> +/**
> + * drm_atomic_set_colorop_for_crtc - set colorop for crtc
> + * @crtc_state: atomic state object for the crtc
> + * @colorop: colorop to use for the crtc
> + *
> + * Helper function to select the color pipeline on a crtc by setting
> + * it to the first drm_colorop element of the pipeline.
> + */
> +void
> +drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
> +				 struct drm_colorop *colorop)
> +{
> +	struct drm_crtc *crtc = crtc_state->crtc;
> +
> +	if (colorop)
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [COLOROP:%d] for [CRTC:%d:%s] state %p\n",
> +			       colorop->base.id, crtc->base.id, crtc->name,
> +			       crtc_state);
> +	else
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [NOCOLOROP] for [CRTC:%d:%s] state %p\n",
> +			       crtc->base.id, crtc->name, crtc_state);
> +
> +	crtc_state->color_pipeline = colorop;
> +}
> +EXPORT_SYMBOL(drm_atomic_set_colorop_for_crtc);
>   
>   /**
>    * drm_atomic_set_crtc_for_connector - set CRTC for connector
> @@ -396,8 +423,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
>   }
>   
>   static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
> -		struct drm_crtc_state *state, struct drm_property *property,
> -		uint64_t val)
> +		struct drm_crtc_state *state, struct drm_file *file_priv,
> +		struct drm_property *property, uint64_t val)
>   {
>   	struct drm_device *dev = crtc->dev;
>   	struct drm_mode_config *config = &dev->mode_config;
> @@ -406,7 +433,17 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   
>   	if (property == config->prop_active)
>   		state->active = val;
> -	else if (property == config->prop_mode_id) {
> +	else if (property == crtc->color_pipeline_property) {
> +		/* find DRM colorop object */
> +		struct drm_colorop *colorop = NULL;
> +
> +		colorop = drm_colorop_find(dev, file_priv, val);
> +
> +		if (val && !colorop)
> +			return -EACCES;
> +
> +		drm_atomic_set_colorop_for_crtc(state, colorop);
> +	} else if (property == config->prop_mode_id) {
>   		struct drm_property_blob *mode =
>   			drm_property_lookup_blob(dev, val);
>   		ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
> @@ -487,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>   		*val = 0;
>   	else if (property == crtc->scaling_filter_property)
>   		*val = state->scaling_filter;
> +	else if (property == crtc->color_pipeline_property)
> +		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
>   	else if (crtc->funcs->atomic_get_property)
>   		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>   	else {
> @@ -1047,6 +1086,8 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>   
>   		if (colorop->plane)
>   			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
> +		else
> +			WARN_ON(!drm_modeset_is_locked(&colorop->crtc->mutex));
>   
>   		ret = drm_atomic_colorop_get_property(colorop,
>   				colorop->state, property, val);
> @@ -1204,7 +1245,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		}
>   
>   		ret = drm_atomic_crtc_set_property(crtc,
> -				crtc_state, prop, prop_value);
> +				crtc_state, file_priv, prop, prop_value);
>   		break;
>   	}
>   	case DRM_MODE_OBJECT_PLANE: {
> @@ -1604,6 +1645,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	state->acquire_ctx = &ctx;
>   	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>   	state->plane_color_pipeline = file_priv->plane_color_pipeline;
> +	state->post_blend_color_pipeline = file_priv->post_blend_color_pipeline;
>   
>   retry:
>   	copied_objs = 0;
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index a1b36cd488f0a014425a9192ffe5fcc4d2c1afaa..d53de1438d23def74a77730cacd3651131e82cbe 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -90,8 +90,9 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
>   
>   /* Init Helpers */
>   
> -static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> -			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)
> +static int drm_common_colorop_init(struct drm_device *dev,
> +				   struct drm_colorop *colorop,
> +				   enum drm_colorop_type type, uint32_t flags)
>   {
>   	struct drm_mode_config *config = &dev->mode_config;
>   	struct drm_property *prop;
> @@ -104,7 +105,6 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
>   	colorop->base.properties = &colorop->properties;
>   	colorop->dev = dev;
>   	colorop->type = type;
> -	colorop->plane = plane;
>   	colorop->next = NULL;
>   
>   	list_add_tail(&colorop->head, &config->colorop_list);
> @@ -153,6 +153,34 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
>   	return ret;
>   }
>   
> +static int drm_crtc_colorop_init(struct drm_device *dev,
> +				 struct drm_colorop *colorop,
> +				 struct drm_crtc *crtc,
> +				 enum drm_colorop_type type, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_common_colorop_init(dev, colorop, type, flags);
> +
> +	colorop->crtc = crtc;
> +
> +	return ret;
> +}
> +
> +static int drm_plane_colorop_init(struct drm_device *dev,
> +				  struct drm_colorop *colorop,
> +				  struct drm_plane *plane,
> +				  enum drm_colorop_type type, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_common_colorop_init(dev, colorop, type, flags);
> +
> +	colorop->plane = plane;
> +
> +	return ret;
> +}
> +
>   /**
>    * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
>    *
> @@ -279,29 +307,16 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
>   	return 0;
>   }
>   
> -/**
> - * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> - *
> - * @dev: DRM device
> - * @colorop: The drm_colorop object to initialize
> - * @plane: The associated drm_plane
> - * @lut_size: LUT size supported by driver
> - * @lut1d_interpolation: 1D LUT interpolation type
> - * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> - * @return zero on success, -E value on failure
> - */
> -int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t lut_size,
> -					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> -					uint32_t flags)
> +static int
> +drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
> +				     struct drm_colorop *colorop,
> +				     uint32_t lut_size,
> +				     enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				     uint32_t flags)
>   {
>   	struct drm_property *prop;
>   	int ret;
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
> -	if (ret)
> -		return ret;
> -
>   	/* initialize 1D LUT only attribute */
>   	/* LUT size */
>   	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
> @@ -333,17 +348,69 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>   
> -int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags)
> +/**
> + * drm_crtc_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @crtc: The associated drm_crtc
> + * @lut_size: LUT size supported by driver
> + * @lut1d_interpolation: 1D LUT interpolation type
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> + * @return zero on success, -E value on failure
> + */
> +int
> +drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev,
> +				   struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, uint32_t lut_size,
> +				   enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				   uint32_t flags)
>   {
>   	int ret;
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
> +	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_LUT, flags);
>   	if (ret)
>   		return ret;
>   
> +	return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
> +						    lut1d_interpolation, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_lut_init);
> +
> +/**
> + * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @lut_size: LUT size supported by driver
> + * @lut1d_interpolation: 1D LUT interpolation type
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> + * @return zero on success, -E value on failure
> + */
> +int
> +drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				    struct drm_plane *plane, uint32_t lut_size,
> +				    enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				    uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
> +	if (ret)
> +		return ret;
> +
> +	return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
> +						    lut1d_interpolation, flags);
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
> +
> +static int drm_common_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +					   uint32_t flags)
> +{
> +	int ret;
> +
>   	ret = drm_colorop_create_data_prop(dev, colorop);
>   	if (ret)
>   		return ret;
> @@ -352,6 +419,31 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
>   
>   	return 0;
>   }
> +
> +int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_CTM_3X4, flags);
> +	if (ret)
> +		return ret;
> +
> +	return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_ctm_3x4_init);
> +
> +int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_plane *plane, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
> +	if (ret)
> +		return ret;
> +
> +	return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
> +}
>   EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>   
>   /**
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 4d6dc9ebfdb5bc730b1aff7a184448af7b93f078..f58cfd2131139ff3e613adc4dbb9ddbedf724dc7 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>   	 */
>   	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
>   			file_priv->plane_color_pipeline,
> +			file_priv->post_blend_color_pipeline,
>   			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
>   			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
>   			&out_resp->count_props);
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003db2a1b43441434839e26f61d79b4e..94238163ff1254c721df39c030bc99a31d3bb92a 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -959,3 +959,80 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
>   	return hweight32(crtc_state->encoder_mask) > 1;
>   }
>   EXPORT_SYMBOL(drm_crtc_in_clone_mode);
> +
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
> +					  const struct drm_prop_enum_list *pipelines,
> +					  int num_pipelines)
> +{
> +	struct drm_prop_enum_list *all_pipelines;
> +	struct drm_property *prop;
> +	int len = 0;
> +	int i;
> +
> +	all_pipelines = kcalloc(num_pipelines + 1,
> +				sizeof(*all_pipelines),
> +				GFP_KERNEL);
> +
> +	if (!all_pipelines) {
> +		drm_err(dev, "failed to allocate color pipeline\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* Create default Bypass color pipeline */
> +	all_pipelines[len].type = 0;
> +	all_pipelines[len].name = "Bypass";
> +	len++;
> +
> +	/* Add all other color pipelines */
> +	for (i = 0; i < num_pipelines; i++, len++) {
> +		all_pipelines[len].type = pipelines[i].type;
> +		all_pipelines[len].name = pipelines[i].name;
> +	}
> +
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					all_pipelines, len);
> +	if (IS_ERR(prop)) {
> +		kfree(all_pipelines);
> +		return prop;
> +	}
> +
> +	drm_object_attach_property(obj, prop, 0);
> +
> +	kfree(all_pipelines);
> +	return prop;
> +}
> +
> +/**
> + * drm_crtc_create_color_pipeline_property - create a new color pipeline
> + * property
> + *
> + * @crtc: drm CRTC
> + * @pipelines: list of pipelines
> + * @num_pipelines: number of pipelines
> + *
> + * Create the COLOR_PIPELINE CRTC property to specify color pipelines on
> + * the CRTC.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
> +					    const struct drm_prop_enum_list *pipelines,
> +					    int num_pipelines)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_common_create_color_pipeline_property(crtc->dev,
> +							 &crtc->base,
> +							 pipelines,
> +							 num_pipelines);
> +	if (IS_ERR(prop))
> +		return PTR_ERR(prop);
> +
> +	crtc->color_pipeline_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_color_pipeline_property);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index c094092296448093c5cd192ecdc8ea9a50769c90..c53f154e5392a10c326c844b7321666275f9ac02 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -35,6 +35,7 @@
>   #ifndef __DRM_CRTC_INTERNAL_H__
>   #define __DRM_CRTC_INTERNAL_H__
>   
> +#include <drm/drm_property.h>
>   #include <linux/err.h>
>   #include <linux/types.h>
>   
> @@ -79,6 +80,10 @@ int drm_crtc_check_viewport(const struct drm_crtc *crtc,
>   int drm_crtc_register_all(struct drm_device *dev);
>   void drm_crtc_unregister_all(struct drm_device *dev);
>   int drm_crtc_force_disable(struct drm_crtc *crtc);
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
> +					  const struct drm_prop_enum_list *pipelines,
> +					  int num_pipelines);
>   
>   struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
>   
> @@ -164,6 +169,7 @@ void drm_mode_object_unregister(struct drm_device *dev,
>   				struct drm_mode_object *object);
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> +				   bool post_blend_color_pipeline,
>   				   uint32_t __user *prop_ptr,
>   				   uint64_t __user *prop_values,
>   				   uint32_t *arg_count_props);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ff193155129e7e863888d8958458978566b144f8..2c81f63fee428ca85f3c626d892ea6097b964e88 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -380,6 +380,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   			return -EINVAL;
>   		file_priv->plane_color_pipeline = req->value;
>   		break;
> +	case DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE:
> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value > 1)
> +			return -EINVAL;
> +		file_priv->post_blend_color_pipeline = req->value;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index b45d501b10c868c6d9b7a5a8760eadbd7b372a6a..c9e20d12e8fd311f71b9d6bc8d575624751d33ad 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
>   /* helper for getconnector and getproperties ioctls */
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> +				   bool post_blend_color_pipeline,
>   				   uint32_t __user *prop_ptr,
>   				   uint64_t __user *prop_values,
>   				   uint32_t *arg_count_props)
> @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				continue;
>   		}
>   
> +		if (post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> +			struct drm_crtc *crtc = obj_to_crtc(obj);
> +			struct drm_mode_config mode_config = crtc->dev->mode_config;
> +
> +			if (prop == mode_config.gamma_lut_property ||
> +			    prop == mode_config.degamma_lut_property ||
> +			    prop == mode_config.gamma_lut_size_property ||
> +			    prop == mode_config.ctm_property)
> +				continue;
> +		}
> +
> +		if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> +			struct drm_crtc *crtc = obj_to_crtc(obj);
> +
> +			if (prop == crtc->color_pipeline_property)
> +				continue;
> +		}
> +
>   		if (*arg_count_props > count) {
>   			ret = __drm_object_property_get_value(obj, prop, &val);
>   			if (ret)
> @@ -475,6 +494,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = drm_mode_object_get_properties(obj, file_priv->atomic,
>   			file_priv->plane_color_pipeline,
> +			file_priv->post_blend_color_pipeline,
>   			(uint32_t __user *)(unsigned long)(arg->props_ptr),
>   			(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
>   			&arg->count_props);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index f6cfa8ac090c7bc49c7f276993bba7e9800da140..60dbfcab495600dd44c15260a1fa6135db59c6e2 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1839,43 +1839,17 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
>   					     const struct drm_prop_enum_list *pipelines,
>   					     int num_pipelines)
>   {
> -	struct drm_prop_enum_list *all_pipelines;
>   	struct drm_property *prop;
> -	int len = 0;
> -	int i;
> -
> -	all_pipelines = kcalloc(num_pipelines + 1,
> -				sizeof(*all_pipelines),
> -				GFP_KERNEL);
> -
> -	if (!all_pipelines) {
> -		drm_err(plane->dev, "failed to allocate color pipeline\n");
> -		return -ENOMEM;
> -	}
>   
> -	/* Create default Bypass color pipeline */
> -	all_pipelines[len].type = 0;
> -	all_pipelines[len].name = "Bypass";
> -	len++;
> -
> -	/* Add all other color pipelines */
> -	for (i = 0; i < num_pipelines; i++, len++) {
> -		all_pipelines[len].type = pipelines[i].type;
> -		all_pipelines[len].name = pipelines[i].name;
> -	}
> -
> -	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
> -					"COLOR_PIPELINE",
> -					all_pipelines, len);
> -	if (IS_ERR(prop)) {
> -		kfree(all_pipelines);
> +	prop = drm_common_create_color_pipeline_property(plane->dev,
> +							 &plane->base,
> +							 pipelines,
> +							 num_pipelines);
> +	if (IS_ERR(prop))
>   		return PTR_ERR(prop);
> -	}
>   
> -	drm_object_attach_property(&plane->base, prop, 0);
>   	plane->color_pipeline_property = prop;
>   
> -	kfree(all_pipelines);
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 678708df9cdb90b4266127193a92183069f18688..8c42c584aefbf0034b2163d90538e80099b0dadb 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -482,6 +482,26 @@ struct drm_atomic_state {
>   	 */
>   	bool plane_color_pipeline : 1;
>   
> +	/**
> +	 * @post_blend_color_pipeline:
> +	 *
> +	 * Indicates whether this atomic state originated with a client that
> +	 * set the DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE.
> +	 *
> +	 * Drivers and helper functions should use this to ignore legacy
> +	 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
> +	 * behavior, such as:
> +	 *
> +	 *  - GAMMA_LUT
> +	 *  - DEGAMMA_LUT
> +	 *  - GAMMA_LUT_SIZE
> +	 *  - CTM
> +	 *
> +	 * or any other driver-specific properties that might affect pixel
> +	 * values.
> +	 */
> +	bool post_blend_color_pipeline : 1;
> +
>   	/**
>   	 * @colorops:
>   	 *
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 4363155233267b93767c895fa6085544e2277442..4dc191f6f929d73deee9812025c48275a33cf770 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -52,6 +52,8 @@ void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>   				 struct drm_framebuffer *fb);
>   void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   				      struct drm_colorop *colorop);
> +void drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
> +				     struct drm_colorop *colorop);
>   int __must_check
>   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>   				  struct drm_crtc *crtc);
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index d61c6c40e47162cb8b1e7db58b6746c43ac5d202..710a6199ebc5498a3f664de39ea07dbc95944eb7 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -206,10 +206,16 @@ struct drm_colorop {
>   	/**
>   	 * @plane:
>   	 *
> -	 * The plane on which the colorop sits. A drm_colorop is always unique
> -	 * to a plane.
> +	 * The plane on which the colorop sits if it is a pre-blend colorop.
> +	 * In this case it is unique to the plane.
> +	 *
> +	 * @crtc:
> +	 *
> +	 * The CRTC on which the colorop sits if it is a post-blend colorop.
> +	 * In this case it is unique to the CRTC.
>   	 */
>   	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
>   
>   	/**
>   	 * @state:
> @@ -370,6 +376,10 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
>   
>   void drm_colorop_pipeline_destroy(struct drm_device *dev);
>   
> +int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				       struct drm_crtc *crtc, uint32_t lut_size,
> +				       enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				       uint32_t flags);
>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> @@ -378,6 +388,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
>   					uint32_t flags);
>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				   struct drm_plane *plane, uint32_t flags);
> +int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, uint32_t flags);
>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				struct drm_plane *plane, uint32_t flags);
>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a748cf40ebf45b37158acda439d9..df03637ca25abd45e96b5944229297f776fd046d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,14 @@ struct drm_crtc_state {
>   	 */
>   	struct drm_property_blob *gamma_lut;
>   
> +	/**
> +	 * @color_pipeline:
> +	 *
> +	 * The first colorop of the active color pipeline, or NULL, if no
> +	 * color pipeline is active.
> +	 */
> +	struct drm_colorop *color_pipeline;
> +
>   	/**
>   	 * @target_vblank:
>   	 *
> @@ -1088,6 +1096,14 @@ struct drm_crtc {
>   	 */
>   	struct drm_property *scaling_filter_property;
>   
> +	/**
> +	 * @color_pipeline_property:
> +	 *
> +	 * Optional "COLOR_PIPELINE" enum property for specifying
> +	 * a color pipeline to use on the CRTC.
> +	 */
> +	struct drm_property *color_pipeline_property;
> +
>   	/**
>   	 * @state:
>   	 *
> @@ -1323,5 +1339,8 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>   
>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>   					    unsigned int supported_filters);
> +int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
> +					     const struct drm_prop_enum_list *pipelines,
> +					     int num_pipelines);
>   bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
>   #endif /* __DRM_CRTC_H__ */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 1a3018e4a537b3341acb50187d47371f6b781b9d..42b9a43baa18079af8ec2ea5b1484b23c497beb0 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -213,6 +213,13 @@ struct drm_file {
>   	 */
>   	bool plane_color_pipeline;
>   
> +	/**
> +	 * @post_blend_color_pipeline:
> +	 *
> +	 * True if client understands post-blend color pipelines
> +	 */
> +	bool post_blend_color_pipeline;
> +
>   	/**
>   	 * @was_master:
>   	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 27cc159c1d275c7a7fe057840ef792f30a582bb7..1191b142ebaa5478376308f169f9ce8591580d9d 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -921,6 +921,22 @@ struct drm_get_cap {
>    */
>   #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
>   
> +/**
> + * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
> + *
> + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
> + * property on a &drm_crtc, as well as drm_colorop properties.
> + *
> + * Setting of these crtc properties will be rejected when this client
> + * cap is set:

I don't know enough the uAPI of DRM, but if I understand your patch 
correctly, it will not reject GAMMA_LUT/DEGAMMA_LUT/CTM, only unlist 
them from the get_properties syscall. Did I overlooked something?

> + * - GAMMA_LUT
> + * - DEGAMMA_LUT
> + * - CTM
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + */
> +#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE	8
> +
>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>   struct drm_set_client_cap {
>   	__u64 capability;
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

