Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A0600C86
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D382610ED32;
	Mon, 17 Oct 2022 10:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0B010ED32;
 Mon, 17 Oct 2022 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RkOJF9SpLP2Tuwb8m8kmcMI162AWfyYlgbz9az1Vuyg=; b=mM2e036ArpX5LtuzgXKAvMNDlk
 6DGgU3LshBPTEFSa9tI8jWUWySY6YQ0jBs2fq4agCSx4PN9IPb2W8fkb25USXDMqRzIta/Vv5QA2c
 ad90/Bd2qXUSYG3e2ZDyZQJ7PB8UnHTRk6pztxuHJ9s86hPBG38K7H/quevtVAoaTQAQAa8DuEGpz
 ytpFmtrJ/egdGt2gFRvxsCbKH4oHhqJzZRc8qY/Rlw813hJ1lijHYZSbPQQ5G0RNU697g8dxuzeG/
 EHfRGHiXRF2Rie2/f0VFBpFbXvsiW51BGhv0uN4Jw9jfdy4AA5N3VCNMBO4T/O5EqKm43FOz+olKp
 qFHzmoeQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61475
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okNTl-0005Wj-Mh; Mon, 17 Oct 2022 12:36:17 +0200
Message-ID: <87702f79-36f4-278e-ef98-279543d71318@tronnes.org>
Date: Mon, 17 Oct 2022 12:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 16/22] drm/atomic-helper: Add a TV properties reset
 helper
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
 <20220728-rpi-analog-tv-properties-v5-16-d841cc64fe4b@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-16-d841cc64fe4b@cerno.tech>
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
> The drm_tv_create_properties() function will create a bunch of properties,
> but it's up to each and every driver using that function to properly reset
> the state of these properties leading to inconsistent behaviours.
> 
> Let's create a helper that will take care of it.
> 
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 75 +++++++++++++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h     |  1 +
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index dfb57217253b..0373c3dc824b 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -481,6 +481,81 @@ void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connecto
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);
>  
> +/**
> + * drm_atomic_helper_connector_tv_reset - Resets Analog TV connector properties
> + * @connector: DRM connector
> + *
> + * Resets the analog TV properties attached to a connector
> + */
> +void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
> +	struct drm_connector_state *state = connector->state;
> +	struct drm_property *prop;
> +	uint64_t val;
> +
> +	prop = dev->mode_config.tv_mode_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.mode = val;
> +
> +	if (cmdline->tv_mode)
> +		state->tv.mode = cmdline->tv_mode;

This can't set ntsc now that the none value is gone.
But we need a tv_mode_specified flag as mentioned in the other patch.

Noralf.

> +
> +	prop = dev->mode_config.tv_select_subconnector_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.select_subconnector = val;
> +
> +	prop = dev->mode_config.tv_subconnector_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.subconnector = val;
> +
> +	prop = dev->mode_config.tv_brightness_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.brightness = val;
> +
> +	prop = dev->mode_config.tv_contrast_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.contrast = val;
> +
> +	prop = dev->mode_config.tv_flicker_reduction_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.flicker_reduction = val;
> +
> +	prop = dev->mode_config.tv_overscan_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.overscan = val;
> +
> +	prop = dev->mode_config.tv_saturation_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.saturation = val;
> +
> +	prop = dev->mode_config.tv_hue_property;
> +	if (prop)
> +		if (!drm_object_property_get_default_value(&connector->base,
> +							   prop, &val))
> +			state->tv.hue = val;
> +
> +	drm_atomic_helper_connector_tv_margins_reset(connector);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
> +
>  /**
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>   * @connector: connector object
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index 192766656b88..c8fbce795ee7 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -70,6 +70,7 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
>  void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>  					 struct drm_connector_state *conn_state);
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
> +void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
>  void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
>  void
>  __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
> 
