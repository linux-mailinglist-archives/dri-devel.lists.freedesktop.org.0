Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899A5A6C8E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 20:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAC110E385;
	Tue, 30 Aug 2022 18:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33F810E384;
 Tue, 30 Aug 2022 18:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2pwojP1tPkDYaoISIKgj4exxHoYsuGnV+Y70Sbw7xyw=; b=MepGmqDbrKqS3Vjv1YsrsBBHZV
 KJHxBmAXJQ9D/ijMDSL2ctRCXrAnVjcR9nEFJntOQin3vrIvBs32NvAhP8O0FLTAaAD9TuiXcZh3Z
 Q7769KUIiJ7De4ReuK+tYNuXRehe5bXiuC9eWvJm+qfT7OInvySrf8ks6kIfoBY6kp93x9zS8Bgug
 cWCkcU/0Z1b2ibodxcSikeh4rtd4XXjfkUMlQqY3nztWMsVwfGqGxzt7tsGz947sXalDdNvx/+/zp
 +nojSH7CA45+Fr44hj9Lrl71Ks061LTlA7p5KLgOnl/GS2uLiJ5Fgx1rFsC0ExKdIs/hsS0XhxX87
 gpMWSCLw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=63164)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oT6Ig-0005yu-Kf; Tue, 30 Aug 2022 20:49:26 +0200
Message-ID: <575e58c3-a32f-54a6-6203-7a7e5a289a66@tronnes.org>
Date: Tue, 30 Aug 2022 20:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 23/41] drm/atomic-helper: Add an analog TV atomic_check
 implementation
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-23-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-23-459522d653a7@cerno.tech>
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



Den 29.08.2022 15.11, skrev Maxime Ripard:
> The analog TV connector drivers share some atomic_check logic, and the new
> 
> TV standard property have created a bunch of new constraints that needs to
> 
> be shared across drivers too.
> 
> 
> 
> Let's create an atomic_check helper for those use cases.
> 
> 
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> 
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> 
> index 0373c3dc824b..d64733c6aae3 100644
> 
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> 
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> 
> @@ -556,6 +556,42 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
> 
>  }
> 
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
> 
>  
> 
> +/**
> 
> + * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector state
> 
> + * @connector: DRM Connector
> 
> + * @state: the DRM State object
> 
> + *
> 
> + * Checks the state object to see if the requested state is valid for an
> 
> + * analog TV connector.
> 
> + *
> 
> + * Returns:
> 
> + * Zero for success, a negative error code on error.
> 
> + */
> 
> +int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
> 
> +					 struct drm_atomic_state *state)
> 
> +{
> 
> +	struct drm_connector_state *old_conn_state =
> 
> +		drm_atomic_get_old_connector_state(state, connector);
> 
> +	struct drm_connector_state *new_conn_state =
> 
> +		drm_atomic_get_new_connector_state(state, connector);
> 
> +	struct drm_crtc_state *crtc_state;
> 
> +	struct drm_crtc *crtc;
> 
> +
> 
> +	crtc = new_conn_state->crtc;
> 
> +	if (!crtc)
> 
> +		return 0;
> 
> +
> 
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> 
> +	if (!crtc_state)
> 
> +		return -EINVAL;
> 
> +
> 
> +	if (old_conn_state->tv.mode != new_conn_state->tv.mode)
> 
> +		crtc_state->mode_changed = true;
> 

If you can expand this check then I can use it in gud:

	if (old_conn_state->tv.margins.left != new_conn_state->tv.margins.left ||
	    old_conn_state->tv.margins.right != new_conn_state->tv.margins.right ||
	    old_conn_state->tv.margins.top != new_conn_state->tv.margins.top ||
	    old_conn_state->tv.margins.bottom !=
new_conn_state->tv.margins.bottom ||
	    old_conn_state->tv.mode != new_conn_state->tv.mode ||
	    old_conn_state->tv.brightness != new_conn_state->tv.brightness ||
	    old_conn_state->tv.contrast != new_conn_state->tv.contrast ||
	    old_conn_state->tv.flicker_reduction !=
new_conn_state->tv.flicker_reduction ||
	    old_conn_state->tv.overscan != new_conn_state->tv.overscan ||
	    old_conn_state->tv.saturation != new_conn_state->tv.saturation ||
	    old_conn_state->tv.hue != new_conn_state->tv.hue)
		crtc_state->connectors_changed = true;

With that considered:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

> +
> 
> +	return 0;
> 
> +}
> 
> +EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
> 
> +
> 
>  /**
> 
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
> 
>   * @connector: connector object
> 
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> 
> index c8fbce795ee7..b9740edb2658 100644
> 
> --- a/include/drm/drm_atomic_state_helper.h
> 
> +++ b/include/drm/drm_atomic_state_helper.h
> 
> @@ -26,6 +26,7 @@
> 
>  
> 
>  #include <linux/types.h>
> 
>  
> 
> +struct drm_atomic_state;
> 
>  struct drm_bridge;
> 
>  struct drm_bridge_state;
> 
>  struct drm_crtc;
> 
> @@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
> 
>  					 struct drm_connector_state *conn_state);
> 
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
> 
>  void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
> 
> +int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
> 
> +					 struct drm_atomic_state *state);
> 
>  void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
> 
>  void
> 
>  __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
> 
> 
> 
