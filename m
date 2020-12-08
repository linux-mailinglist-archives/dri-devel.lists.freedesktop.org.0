Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC62D2EE6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9E56E982;
	Tue,  8 Dec 2020 15:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381A6E962
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:59:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B582335;
 Tue,  8 Dec 2020 16:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607443169;
 bh=aG34NVCbNXj+YJDHsUdj7sbbUwXvPoGQjpNO3xmCokk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcMSoYMPddHo3M5USU3kqpyTot71aQ616+6J1JsAD3nPiYvPsqGtYqkK1GgMM0RRX
 UQ2yFkuNHkcdVbzcmxU3JQTnAV8RieZPaTA43vm8HCOI20Oi6AB3Qkh9hiQSlcVg9V
 NclJ16uQDgEKOOt07TY+b9CmOSsgr7IylGNFWODI=
Date: Tue, 8 Dec 2020 17:59:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 2/2] drm: automatic legacy gamma support
Message-ID: <X8+i3lyTGI4Rb62B@pendragon.ideasonboard.com>
References: <20201208135759.451772-1-tomi.valkeinen@ti.com>
 <20201208135759.451772-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208135759.451772-3-tomi.valkeinen@ti.com>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 03:57:59PM +0200, Tomi Valkeinen wrote:
> To support legacy gamma ioctls the drivers need to set
> drm_crtc_funcs.gamma_set either to a custom implementation or to
> drm_atomic_helper_legacy_gamma_set. Most of the atomic drivers do the
> latter.
> 
> We can simplify this by making the core handle it automatically.
> 
> Add two functions: drm_crtc_supports_legacy_gamma() which tells if the
> legacy gamma table can be set, and drm_crtc_legacy_gamma_set() which
> does the work by either calling the drm_crtc_funcs.gamma_set or using
> GAMMA_LUT or DEGAMMA_LUT.
> 
> We can then drop drm_atomic_helper_legacy_gamma_set() and remove all its
> uses.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   1 -
>  drivers/gpu/drm/arm/malidp_crtc.c             |   1 -
>  drivers/gpu/drm/armada/armada_crtc.c          |   1 -
>  drivers/gpu/drm/ast/ast_mode.c                |   1 -
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   1 -
>  drivers/gpu/drm/drm_atomic_helper.c           |  79 ------------
>  drivers/gpu/drm/drm_color_mgmt.c              | 118 ++++++++++++++++--
>  drivers/gpu/drm/drm_crtc_internal.h           |   6 +
>  drivers/gpu/drm/drm_fb_helper.c               |  13 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 -
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   1 -
>  drivers/gpu/drm/nouveau/dispnv50/head.c       |   2 -
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |   1 -
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   1 -
>  drivers/gpu/drm/stm/ltdc.c                    |   1 -
>  drivers/gpu/drm/vc4/vc4_crtc.c                |   1 -
>  drivers/gpu/drm/vc4/vc4_txp.c                 |   1 -
>  include/drm/drm_atomic_helper.h               |   4 -
>  21 files changed, 122 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2855bb918535..848b06c51b0e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5396,7 +5396,6 @@ static void dm_disable_vblank(struct drm_crtc *crtc)
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.reset = dm_crtc_reset_state,
>  	.destroy = amdgpu_dm_crtc_destroy,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.atomic_duplicate_state = dm_crtc_duplicate_state,
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 4b485eb512e2..59172acb9738 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -550,7 +550,6 @@ static void komeda_crtc_vblank_disable(struct drm_crtc *crtc)
>  }
>  
>  static const struct drm_crtc_funcs komeda_crtc_funcs = {
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  	.destroy		= drm_crtc_cleanup,
>  	.set_config		= drm_atomic_helper_set_config,
>  	.page_flip		= drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
> index 108e7a31bd26..494075ddbef6 100644
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -510,7 +510,6 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
>  }
>  
>  static const struct drm_crtc_funcs malidp_crtc_funcs = {
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
> index 3ebcf5a52c8b..b7bb90ae787f 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -820,7 +820,6 @@ static const struct drm_crtc_funcs armada_crtc_funcs = {
>  	.cursor_set	= armada_drm_crtc_cursor_set,
>  	.cursor_move	= armada_drm_crtc_cursor_move,
>  	.destroy	= armada_drm_crtc_destroy,
> -	.gamma_set	= drm_atomic_helper_legacy_gamma_set,
>  	.set_config	= drm_atomic_helper_set_config,
>  	.page_flip	= drm_atomic_helper_page_flip,
>  	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 9db371f4054f..5b0ec785c516 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -903,7 +903,6 @@ static void ast_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>  
>  static const struct drm_crtc_funcs ast_crtc_funcs = {
>  	.reset = ast_crtc_reset,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index c58fa00b4848..05ad75d155e8 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -473,7 +473,6 @@ static const struct drm_crtc_funcs atmel_hlcdc_crtc_funcs = {
>  	.atomic_destroy_state = atmel_hlcdc_crtc_destroy_state,
>  	.enable_vblank = atmel_hlcdc_crtc_enable_vblank,
>  	.disable_vblank = atmel_hlcdc_crtc_disable_vblank,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  int atmel_hlcdc_crtc_create(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 117b186fe646..b114658100b3 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3499,85 +3499,6 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
>  
> -/**
> - * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction table
> - * @crtc: CRTC object
> - * @red: red correction table
> - * @green: green correction table
> - * @blue: green correction table
> - * @size: size of the tables
> - * @ctx: lock acquire context
> - *
> - * Implements support for legacy gamma correction table for drivers
> - * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> - * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
> - * how the atomic color management and gamma tables work.
> - *
> - * This function uses the GAMMA_LUT or DEGAMMA_LUT property for the gamma table.
> - * GAMMA_LUT property is used if it exists, and DEGAMMA_LUT property is used as
> - * a fallback.
> - */
> -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> -				       u16 *red, u16 *green, u16 *blue,
> -				       uint32_t size,
> -				       struct drm_modeset_acquire_ctx *ctx)
> -{
> -	struct drm_device *dev = crtc->dev;
> -	struct drm_atomic_state *state;
> -	struct drm_crtc_state *crtc_state;
> -	struct drm_property_blob *blob = NULL;
> -	struct drm_color_lut *blob_data;
> -	int i, ret = 0;
> -	bool replaced;
> -
> -	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
> -		return -ENODEV;
> -
> -	state = drm_atomic_state_alloc(crtc->dev);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	blob = drm_property_create_blob(dev,
> -					sizeof(struct drm_color_lut) * size,
> -					NULL);
> -	if (IS_ERR(blob)) {
> -		ret = PTR_ERR(blob);
> -		blob = NULL;
> -		goto fail;
> -	}
> -
> -	/* Prepare GAMMA_LUT with the legacy values. */
> -	blob_data = blob->data;
> -	for (i = 0; i < size; i++) {
> -		blob_data[i].red = red[i];
> -		blob_data[i].green = green[i];
> -		blob_data[i].blue = blue[i];
> -	}
> -
> -	state->acquire_ctx = ctx;
> -	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> -	if (IS_ERR(crtc_state)) {
> -		ret = PTR_ERR(crtc_state);
> -		goto fail;
> -	}
> -
> -	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
> -	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> -					      crtc->has_gamma_prop ? NULL : blob);
> -	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> -	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> -					      crtc->has_gamma_prop ? blob : NULL);
> -	crtc_state->color_mgmt_changed |= replaced;
> -
> -	ret = drm_atomic_commit(state);
> -
> -fail:
> -	drm_atomic_state_put(state);
> -	drm_property_blob_put(blob);
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_atomic_helper_legacy_gamma_set);
> -
>  /**
>   * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format to
>   *						  the input end of a bridge
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 956e59d5f6a7..78b3a9325f7a 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -22,6 +22,7 @@
>  
>  #include <linux/uaccess.h>
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> @@ -89,9 +90,8 @@
>   *	modes) appropriately.
>   *
>   * There is also support for a legacy gamma table, which is set up by calling
> - * drm_mode_crtc_set_gamma_size(). Drivers which support both should use
> - * drm_atomic_helper_legacy_gamma_set() to alias the legacy gamma ramp with the
> - * "GAMMA_LUT" property above.
> + * drm_mode_crtc_set_gamma_size(). The DRM core will then alias the legacy gamma
> + * ramp with "GAMMA_LUT", or if that is unavailable "DEGAMMA_LUT".
>   *
>   * Support for different non RGB color encodings is controlled through
>   * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
> @@ -156,9 +156,6 @@ EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
>   * optional. The gamma and degamma properties are only attached if
>   * their size is not 0 and ctm_property is only attached if has_ctm is
>   * true.
> - *
> - * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
> - * legacy &drm_crtc_funcs.gamma_set callback.
>   */
>  void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  				uint degamma_lut_size,
> @@ -235,6 +232,109 @@ int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
>  
> +/**
> + * drm_crtc_supports_legacy_gamma - does the crtc support legacy gamma correction table
> + * @crtc: CRTC object
> + *
> + * Returns true/false if the given crtc supports setting the legacy gamma
> + * correction table.
> + */
> +bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
> +{
> +	if (!crtc->gamma_size)
> +		return false;
> +
> +	if (crtc->funcs->gamma_set)
> +		return true;
> +
> +	return crtc->has_gamma_prop || crtc->has_degamma_prop;
> +}
> +EXPORT_SYMBOL(drm_crtc_supports_legacy_gamma);
> +
> +/**
> + * drm_crtc_legacy_gamma_set - set the legacy gamma correction table
> + * @crtc: CRTC object
> + * @red: red correction table
> + * @green: green correction table
> + * @blue: green correction table
> + * @size: size of the tables
> + * @ctx: lock acquire context
> + *
> + * Implements support for legacy gamma correction table for drivers
> + * that have set drm_crtc_funcs.gamma_set or that support color management
> + * through the DEGAMMA_LUT/GAMMA_LUT properties. See
> + * drm_crtc_enable_color_mgmt() and the containing chapter for
> + * how the atomic color management and gamma tables work.
> + *
> + * This function sets the gamma using the first one available:
> + * - drm_crtc_funcs.gamma_set()
> + * - GAMMA_LUT
> + * - DEGAMMA_LUT
> + */
> +int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
> +			      u16 *red, u16 *green, u16 *blue,
> +			      uint32_t size,
> +			      struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_atomic_state *state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_property_blob *blob = NULL;

No need to assign NULL to this variable.

> +	struct drm_color_lut *blob_data;
> +	int i, ret = 0;
> +	bool replaced;
> +
> +	if (crtc->funcs->gamma_set)
> +		return crtc->funcs->gamma_set(crtc, red, green, blue, size, ctx);
> +
> +	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
> +		return -ENODEV;
> +
> +	state = drm_atomic_state_alloc(crtc->dev);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	blob = drm_property_create_blob(dev,
> +					sizeof(struct drm_color_lut) * size,
> +					NULL);
> +	if (IS_ERR(blob)) {
> +		ret = PTR_ERR(blob);
> +		blob = NULL;
> +		goto fail;
> +	}
> +
> +	/* Prepare GAMMA_LUT with the legacy values. */
> +	blob_data = blob->data;
> +	for (i = 0; i < size; i++) {
> +		blob_data[i].red = red[i];
> +		blob_data[i].green = green[i];
> +		blob_data[i].blue = blue[i];
> +	}
> +
> +	state->acquire_ctx = ctx;
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state)) {
> +		ret = PTR_ERR(crtc_state);
> +		goto fail;
> +	}
> +
> +	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
> +	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> +					      crtc->has_gamma_prop ? NULL : blob);
> +	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> +	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> +					      crtc->has_gamma_prop ? blob : NULL);
> +	crtc_state->color_mgmt_changed |= replaced;
> +
> +	ret = drm_atomic_commit(state);
> +
> +fail:
> +	drm_atomic_state_put(state);
> +	drm_property_blob_put(blob);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_crtc_legacy_gamma_set);
> +
>  /**
>   * drm_mode_gamma_set_ioctl - set the gamma table
>   * @dev: DRM device
> @@ -266,7 +366,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
>  	if (!crtc)
>  		return -ENOENT;
>  
> -	if (crtc->funcs->gamma_set == NULL)
> +	if (!drm_crtc_supports_legacy_gamma(crtc))
>  		return -ENOSYS;
>  
>  	/* memcpy into gamma store */
> @@ -294,8 +394,8 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
>  		goto out;
>  	}
>  
> -	ret = crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> -				     crtc->gamma_size, &ctx);
> +	ret = drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> +					crtc->gamma_size, &ctx);
>  
>  out:
>  	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 54d4cf1233e9..dd1cca024b16 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -114,6 +114,12 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>  const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
>  const char *drm_get_color_range_name(enum drm_color_range range);
>  
> +bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc);
> +int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
> +			      u16 *red, u16 *green, u16 *blue,
> +			      uint32_t size,
> +			      struct drm_modeset_acquire_ctx *ctx);
> +
>  /* IOCTLs */
>  int drm_mode_gamma_get_ioctl(struct drm_device *dev,
>  			     void *data, struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index b0906ef97617..0fb29b1a1f98 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -46,6 +46,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  
> +#include "drm_crtc_internal.h"
>  #include "drm_crtc_helper_internal.h"

i goes after h.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #include "drm_internal.h"
>  
> @@ -136,15 +137,15 @@ static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
>  {
>  	uint16_t *r_base, *g_base, *b_base;
>  
> -	if (crtc->funcs->gamma_set == NULL)
> +	if (!drm_crtc_supports_legacy_gamma(crtc))
>  		return;
>  
>  	r_base = crtc->gamma_store;
>  	g_base = r_base + crtc->gamma_size;
>  	b_base = g_base + crtc->gamma_size;
>  
> -	crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> -			       crtc->gamma_size, NULL);
> +	drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> +				  crtc->gamma_size, NULL);
>  }
>  
>  /**
> @@ -907,7 +908,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  	drm_modeset_lock_all(fb_helper->dev);
>  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
>  		crtc = modeset->crtc;
> -		if (!crtc->funcs->gamma_set || !crtc->gamma_size)
> +		if (!drm_crtc_supports_legacy_gamma(crtc))
>  			return -EINVAL;
>  
>  		if (cmap->start + cmap->len > crtc->gamma_size)
> @@ -921,8 +922,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  		memcpy(g + cmap->start, cmap->green, cmap->len * sizeof(*g));
>  		memcpy(b + cmap->start, cmap->blue, cmap->len * sizeof(*b));
>  
> -		ret = crtc->funcs->gamma_set(crtc, r, g, b,
> -					     crtc->gamma_size, NULL);
> +		ret = drm_crtc_legacy_gamma_set(crtc, r, g, b, crtc->gamma_size,
> +						NULL);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index cddbda5303ff..1e90b8c3b1c7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -16879,7 +16879,6 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
>  }
>  
>  #define INTEL_CRTC_FUNCS \
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set, \
>  	.set_config = drm_atomic_helper_set_config, \
>  	.destroy = intel_crtc_destroy, \
>  	.page_flip = drm_atomic_helper_page_flip, \
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 368bfef8b340..75f948d41b0a 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -755,8 +755,6 @@ static const struct drm_crtc_funcs ingenic_drm_crtc_funcs = {
>  
>  	.enable_vblank		= ingenic_drm_enable_vblank,
>  	.disable_vblank		= ingenic_drm_disable_vblank,
> -
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index bfe994230543..b665bd498a4a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -619,7 +619,6 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
>  	.reset			= mtk_drm_crtc_reset,
>  	.atomic_duplicate_state	= mtk_drm_crtc_duplicate_state,
>  	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  	.enable_vblank		= mtk_drm_crtc_enable_vblank,
>  	.disable_vblank		= mtk_drm_crtc_disable_vblank,
>  };
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 537c1ef2e464..ec361d17e900 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -503,7 +503,6 @@ nv50_head_destroy(struct drm_crtc *crtc)
>  static const struct drm_crtc_funcs
>  nv50_head_func = {
>  	.reset = nv50_head_reset,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = nv50_head_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> @@ -518,7 +517,6 @@ nv50_head_func = {
>  static const struct drm_crtc_funcs
>  nvd9_head_func = {
>  	.reset = nv50_head_reset,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = nv50_head_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 7d66269ad998..b97f21cf4a91 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -741,7 +741,6 @@ static const struct drm_crtc_funcs omap_crtc_funcs = {
>  	.set_config = drm_atomic_helper_set_config,
>  	.destroy = omap_crtc_destroy,
>  	.page_flip = drm_atomic_helper_page_flip,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.atomic_duplicate_state = omap_crtc_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>  	.atomic_set_property = omap_crtc_atomic_set_property,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index b5fb941e0f53..f93e0750431d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1144,7 +1144,6 @@ static const struct drm_crtc_funcs crtc_funcs_gen3 = {
>  	.set_crc_source = rcar_du_crtc_set_crc_source,
>  	.verify_crc_source = rcar_du_crtc_verify_crc_source,
>  	.get_crc_sources = rcar_du_crtc_get_crc_sources,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index d1e05482641b..8d15cabdcb02 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1643,7 +1643,6 @@ static const struct drm_crtc_funcs vop_crtc_funcs = {
>  	.disable_vblank = vop_crtc_disable_vblank,
>  	.set_crc_source = vop_crtc_set_crc_source,
>  	.verify_crc_source = vop_crtc_verify_crc_source,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  static void vop_fb_unref_worker(struct drm_flip_work *work, void *val)
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 3980677435cb..7812094f93d6 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -713,7 +713,6 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
>  	.enable_vblank = ltdc_crtc_enable_vblank,
>  	.disable_vblank = ltdc_crtc_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index ea710beb8e00..7495d70d6a32 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -884,7 +884,6 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
>  	.reset = vc4_crtc_reset,
>  	.atomic_duplicate_state = vc4_crtc_duplicate_state,
>  	.atomic_destroy_state = vc4_crtc_destroy_state,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.enable_vblank = vc4_enable_vblank,
>  	.disable_vblank = vc4_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 8aa5220885f4..e4b782e42f69 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -382,7 +382,6 @@ static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
>  	.reset			= vc4_crtc_reset,
>  	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
>  	.atomic_destroy_state	= vc4_crtc_destroy_state,
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  	.enable_vblank		= vc4_txp_enable_vblank,
>  	.disable_vblank		= vc4_txp_disable_vblank,
>  };
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 5f47720440fa..4045e2507e11 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -147,10 +147,6 @@ int drm_atomic_helper_page_flip_target(
>  				uint32_t flags,
>  				uint32_t target,
>  				struct drm_modeset_acquire_ctx *ctx);
> -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> -				       u16 *red, u16 *green, u16 *blue,
> -				       uint32_t size,
> -				       struct drm_modeset_acquire_ctx *ctx);
>  
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently attached to CRTC

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
