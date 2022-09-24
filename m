Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6AA5E8ECC
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 19:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6E10E048;
	Sat, 24 Sep 2022 17:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676CE10E048;
 Sat, 24 Sep 2022 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOB6MwHOfyWCi+cu38KKhSosRnAkCN6sMsuwprDs24k=; b=HsQ+kT3oVj+jM7eDGZtLmCo7bT
 r2GeeL0FTdQD0qUUnaYJrIqKOf5iXaC3FFiRGxhhpshDUboona72Sb+jHHKbqRwO+9112LQFI1yTe
 TAaKsFkK9NjG/Xemna+Uc2ETM9IWfpA80xw87fAdyCll+eOrsTXJ4ufuZ1WqzwgMvVzowyYqfAC54
 C9spGfpAYiEjzBgAHZXHU/Zx0a4DDn1GgPuGPqzXL9JCdbiOm0Olbft7RuR3ulNjMyjtVb6QEpoEO
 6E1W1rtsjojGD1gL1moDhWHdqOval9s9rKNodQFEHmiH3xPGAp02D+L7mDC05B2U8ivepSrUPRlUD
 E8vGAWqQ==;
Received: from [2a01:799:961:d200:8cf6:761:40ec:1ff7] (port=57871)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oc8ev-0002GN-DM; Sat, 24 Sep 2022 19:09:45 +0200
Message-ID: <3625b8e7-9ab5-7a9e-0c06-69fd3cbd555f@tronnes.org>
Date: Sat, 24 Sep 2022 19:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 31/33] drm/vc4: vec: Convert to the new TV mode property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-31-f733a0ed9f90@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-31-f733a0ed9f90@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 22.09.2022 16.25, skrev Maxime Ripard:
> Now that the core can deal fine with analog TV modes, let's convert the vc4
> VEC driver to leverage those new features.
> 
> We've added some backward compatibility to support the old TV mode property
> and translate it into the new TV norm property.
> 

You can mention here that atomic_check is added in order to trigger a
modeset should tv.mode change.

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 6828b79a1001..a9463364015b 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -172,6 +172,8 @@ struct vc4_vec {
>  
>  	struct clk *clock;
>  
> +	struct drm_property *legacy_tv_mode_property;
> +
>  	struct debugfs_regset32 regset;
>  };
>  
> @@ -184,6 +186,12 @@ encoder_to_vc4_vec(struct drm_encoder *encoder)
>  	return container_of(encoder, struct vc4_vec, encoder.base);
>  }
>  
> +static inline struct vc4_vec *
> +connector_to_vc4_vec(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct vc4_vec, connector);
> +}
> +
>  enum vc4_vec_tv_mode_id {
>  	VC4_VEC_TV_MODE_NTSC,
>  	VC4_VEC_TV_MODE_NTSC_J,
> @@ -192,7 +200,7 @@ enum vc4_vec_tv_mode_id {
>  };
>  
>  struct vc4_vec_tv_mode {
> -	const struct drm_display_mode *mode;
> +	unsigned int mode;
>  	u32 config0;
>  	u32 config1;
>  	u32 custom_freq;
> @@ -225,43 +233,51 @@ static const struct debugfs_reg32 vec_regs[] = {
>  	VC4_REG32(VEC_DAC_MISC),
>  };
>  
> -static const struct drm_display_mode ntsc_mode = {
> -	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
> -		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
> -		 480, 480 + 7, 480 + 7 + 6, 525, 0,
> -		 DRM_MODE_FLAG_INTERLACE)
> -};
> -
> -static const struct drm_display_mode pal_mode = {
> -	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
> -		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
> -		 576, 576 + 4, 576 + 4 + 6, 625, 0,
> -		 DRM_MODE_FLAG_INTERLACE)
> -};
> -
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
> -	[VC4_VEC_TV_MODE_NTSC] = {
> -		.mode = &ntsc_mode,
> +	{
> +		.mode = DRM_MODE_TV_MODE_NTSC,
>  		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> -	[VC4_VEC_TV_MODE_NTSC_J] = {
> -		.mode = &ntsc_mode,
> +	{
> +		.mode = DRM_MODE_TV_MODE_NTSC_J,
>  		.config0 = VEC_CONFIG0_NTSC_STD,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> -	[VC4_VEC_TV_MODE_PAL] = {
> -		.mode = &pal_mode,
> +	{
> +		.mode = DRM_MODE_TV_MODE_PAL,
>  		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> -	[VC4_VEC_TV_MODE_PAL_M] = {
> -		.mode = &ntsc_mode,
> +	{
> +		.mode = DRM_MODE_TV_MODE_PAL_M,
>  		.config0 = VEC_CONFIG0_PAL_M_STD,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
>  };
>  
> +static inline const struct vc4_vec_tv_mode *
> +vc4_vec_tv_mode_lookup(unsigned int mode)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
> +		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
> +
> +		if (tv_mode->mode == mode)
> +			return tv_mode;
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct drm_prop_enum_list tv_mode_names[] = {
> +	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> +	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
> +	{ VC4_VEC_TV_MODE_PAL, "PAL", },
> +	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> +};
> +
>  static enum drm_connector_status
>  vc4_vec_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -276,19 +292,99 @@ static void vc4_vec_connector_reset(struct drm_connector *connector)
>  
>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct drm_connector_state *state = connector->state;
>  	struct drm_display_mode *mode;
> +	int count = 0;
>  
> -	mode = drm_mode_duplicate(connector->dev,
> -				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
> +	mode = drm_mode_analog_ntsc_480i(connector->dev);
>  	if (!mode) {
>  		DRM_ERROR("Failed to create a new display mode\n");
>  		return -ENOMEM;
>  	}
>  
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
>  	drm_mode_probed_add(connector, mode);
> +	count += 1;
>  
> -	return 1;
> +	mode = drm_mode_analog_pal_576i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_probed_add(connector, mode);
> +	count += 1;
> +
> +	return count;

Why not just return 2 here since that's the only value count can be.

Acked-by: Noralf Trønnes <noralf@tronnes.org>

> +}
> +
> +static int
> +vc4_vec_connector_set_property(struct drm_connector *connector,
> +			       struct drm_connector_state *state,
> +			       struct drm_property *property,
> +			       uint64_t val)
> +{
> +	struct vc4_vec *vec = connector_to_vc4_vec(connector);
> +
> +	if (property != vec->legacy_tv_mode_property)
> +		return -EINVAL;
> +
> +	switch (val) {
> +	case VC4_VEC_TV_MODE_NTSC:
> +		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
> +		break;
> +
> +	case VC4_VEC_TV_MODE_NTSC_J:
> +		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
> +		break;
> +
> +	case VC4_VEC_TV_MODE_PAL:
> +		state->tv.mode = DRM_MODE_TV_MODE_PAL;
> +		break;
> +
> +	case VC4_VEC_TV_MODE_PAL_M:
> +		state->tv.mode = DRM_MODE_TV_MODE_PAL_M;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +vc4_vec_connector_get_property(struct drm_connector *connector,
> +			       const struct drm_connector_state *state,
> +			       struct drm_property *property,
> +			       uint64_t *val)
> +{
> +	struct vc4_vec *vec = connector_to_vc4_vec(connector);
> +
> +	if (property != vec->legacy_tv_mode_property)
> +		return -EINVAL;
> +
> +	switch (state->tv.mode) {
> +	case DRM_MODE_TV_MODE_NTSC:
> +		*val = VC4_VEC_TV_MODE_NTSC;
> +		break;
> +
> +	case DRM_MODE_TV_MODE_NTSC_J:
> +		*val = VC4_VEC_TV_MODE_NTSC_J;
> +		break;
> +
> +	case DRM_MODE_TV_MODE_PAL:
> +		*val = VC4_VEC_TV_MODE_PAL;
> +		break;
> +
> +	case DRM_MODE_TV_MODE_PAL_M:
> +		*val = VC4_VEC_TV_MODE_PAL_M;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct drm_connector_funcs vc4_vec_connector_funcs = {
> @@ -297,15 +393,19 @@ static const struct drm_connector_funcs vc4_vec_connector_funcs = {
>  	.reset = vc4_vec_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.atomic_get_property = vc4_vec_connector_get_property,
> +	.atomic_set_property = vc4_vec_connector_set_property,
>  };
>  
>  static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs = {
> +	.atomic_check = drm_atomic_helper_connector_tv_check,
>  	.get_modes = vc4_vec_connector_get_modes,
>  };
>  
>  static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
>  {
>  	struct drm_connector *connector = &vec->connector;
> +	struct drm_property *prop;
>  	int ret;
>  
>  	connector->interlace_allowed = true;
> @@ -318,8 +418,16 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
>  	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
>  
>  	drm_object_attach_property(&connector->base,
> -				   dev->mode_config.legacy_tv_mode_property,
> -				   VC4_VEC_TV_MODE_NTSC);
> +				   dev->mode_config.tv_mode_property,
> +				   DRM_MODE_TV_MODE_NTSC);
> +
> +	prop = drm_property_create_enum(dev, 0, "mode",
> +					tv_mode_names, ARRAY_SIZE(tv_mode_names));
> +	if (!prop)
> +		return -ENOMEM;
> +	vec->legacy_tv_mode_property = prop;
> +
> +	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
>  
>  	drm_connector_attach_encoder(connector, &vec->encoder.base);
>  
> @@ -366,13 +474,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>  	struct drm_connector *connector = &vec->connector;
>  	struct drm_connector_state *conn_state =
>  		drm_atomic_get_new_connector_state(state, connector);
> -	const struct vc4_vec_tv_mode *tv_mode =
> -		&vc4_vec_tv_modes[conn_state->tv.mode];
> +	const struct vc4_vec_tv_mode *tv_mode;
>  	int idx, ret;
>  
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
>  
> +	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
> +	if (!tv_mode)
> +		goto err_dev_exit;
> +
>  	ret = pm_runtime_get_sync(&vec->pdev->dev);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to retain power domain: %d\n", ret);
> @@ -454,13 +565,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
>  					struct drm_connector_state *conn_state)
>  {
>  	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> -	const struct vc4_vec_tv_mode *vec_mode;
> -
> -	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
> -
> -	if (conn_state->crtc &&
> -	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
> -		return -EINVAL;
>  
>  	if (mode->crtc_hdisplay % 4)
>  		return -EINVAL;
> @@ -554,13 +658,6 @@ static const struct of_device_id vc4_vec_dt_match[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static const char * const tv_mode_names[] = {
> -	[VC4_VEC_TV_MODE_NTSC] = "NTSC",
> -	[VC4_VEC_TV_MODE_NTSC_J] = "NTSC-J",
> -	[VC4_VEC_TV_MODE_PAL] = "PAL",
> -	[VC4_VEC_TV_MODE_PAL_M] = "PAL-M",
> -};
> -
>  static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -568,9 +665,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>  	struct vc4_vec *vec;
>  	int ret;
>  
> -	ret = drm_mode_create_tv_properties_legacy(drm,
> -						   ARRAY_SIZE(tv_mode_names),
> -						   tv_mode_names);
> +	ret = drm_mode_create_tv_properties(drm,
> +					    BIT(DRM_MODE_TV_MODE_NTSC) |
> +					    BIT(DRM_MODE_TV_MODE_NTSC_J) |
> +					    BIT(DRM_MODE_TV_MODE_PAL) |
> +					    BIT(DRM_MODE_TV_MODE_PAL_M));
>  	if (ret)
>  		return ret;
>  
> 
