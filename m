Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00045600DEB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246F110E3F0;
	Mon, 17 Oct 2022 11:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC0010E3FA;
 Mon, 17 Oct 2022 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NqoPivWXTQc91lM55scp1TsWM7KYAkZKCYYjTFjLwwA=; b=eP3AtQH8Ft3/1aQU3b50ikl2kh
 uvnK5IAtJPeRye3apH7rCXI3m1SN4WPI63uFXBNEjPmv4cDphteZ42pnT7TPGmxW5RXz81CHXczTh
 OzjCvLGsT/gN3QlrIDNHh69a4JM45LViFEJP3NkC5h1OqLxWYzzfv8mI8BJ7DgsVBoXipFtEYGf5K
 PrXWqugX074d4EkbM0Wpd7NTVwt7SU2Hi6//t2gsOHwfgWzeLcdO6IpR8ghDmzqVbEE6rGt4Z/Sr1
 3nf0XARAeZo8X02Q+ULbLP+mjGvrtH4rU4sL9cUAPzXI6gMHmgrwhoIS87WDVJ3AVZDPsTxWdT/bE
 mCVLwX2g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53192
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okOSo-0007Ky-Cl; Mon, 17 Oct 2022 13:39:22 +0200
Message-ID: <a2720899-e93b-6b84-f30b-8d3d28986259@tronnes.org>
Date: Mon, 17 Oct 2022 13:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode property
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 13.10.2022 15.19, skrev Maxime Ripard:
> Now that the core can deal fine with analog TV modes, let's convert the vc4
> VEC driver to leverage those new features.
> 
> We've added some backward compatibility to support the old TV mode property
> and translate it into the new TV norm property. We're also making use of
> the new analog TV atomic_check helper to make sure we trigger a modeset
> whenever the TV mode is updated.
> 
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---

> @@ -276,19 +292,96 @@ static void vc4_vec_connector_reset(struct drm_connector *connector)
>  
>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct drm_connector_state *state = connector->state;
>  	struct drm_display_mode *mode;
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
>  
> -	return 1;
> +	mode = drm_mode_analog_pal_576i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;

I just remembered that you can't return an error from .get_modes, it
should only return the number of modes added. From doc:

	 * RETURNS:
	 *
	 * The number of modes added by calling drm_mode_probed_add().

See also the use of count in drm_helper_probe_single_connector_modes().

Patch 14 and 22 has the same issue.

Noralf.

> +	}
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 2;
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
> @@ -297,15 +390,19 @@ static const struct drm_connector_funcs vc4_vec_connector_funcs = {
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
> @@ -318,8 +415,17 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
>  	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
>  
>  	drm_object_attach_property(&connector->base,
> -				   dev->mode_config.legacy_tv_mode_property,
> -				   VC4_VEC_TV_MODE_NTSC);
> +				   dev->mode_config.tv_mode_property,
> +				   DRM_MODE_TV_MODE_NTSC);
> +
> +	prop = drm_property_create_enum(dev, 0, "mode",
> +					legacy_tv_mode_names,
> +					ARRAY_SIZE(legacy_tv_mode_names));
> +	if (!prop)
> +		return -ENOMEM;
> +	vec->legacy_tv_mode_property = prop;
> +
> +	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
>  
>  	drm_connector_attach_encoder(connector, &vec->encoder.base);
>  
> @@ -366,13 +472,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>  	struct drm_connector *connector = &vec->connector;
>  	struct drm_connector_state *conn_state =
>  		drm_atomic_get_new_connector_state(state, connector);
> -	const struct vc4_vec_tv_mode *tv_mode =
> -		&vc4_vec_tv_modes[conn_state->tv.legacy_mode];
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
> @@ -454,13 +563,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
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
> @@ -554,13 +656,6 @@ static const struct of_device_id vc4_vec_dt_match[] = {
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
> @@ -568,9 +663,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
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
