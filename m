Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5235E8E3A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 17:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2A010E112;
	Sat, 24 Sep 2022 15:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080710E112;
 Sat, 24 Sep 2022 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QzSZgGF3LSfU+QOgisBUgm00ijRvAXpTYdB3AhiV0zc=; b=YoRneKEg3a/ZhYjpQiTRYAqWnv
 WB4hwUWyn8HFf7H3atGVV/FWfo2zKmA+MtsTzNOrrMofDMJ+iMRS/FBj66BMdipLv1+OjG0nJuXht
 KQYwvEQWXhhVWn/cBGGTShigwJ0JoT63EqCi1vRwv2swEc5UqVEKNcNMXDsleeeXUIo686HqiRQeb
 oLbJGFIjNjOOnraPt4eC8OieR9FDsoENDA5Citx0qnqaHVpDz9GlaQXOsw7OjRytKc6qcfA9m/aEM
 ynxki0Uea45RxClVTkfOoWpJF699awXnrjdjgAiitsHx7msjI7d8wMH5TkGSqow+LMTnDYkboiPQY
 KbwDa2sQ==;
Received: from [2a01:799:961:d200:8cf6:761:40ec:1ff7] (port=53323)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oc7Xl-0001kS-65; Sat, 24 Sep 2022 17:58:17 +0200
Message-ID: <d28d3b7b-2bef-8f07-ca23-420e6e7b9788@tronnes.org>
Date: Sat, 24 Sep 2022 17:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 27/33] drm/atomic-helper: Add an analog TV atomic_check
 implementation
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
 <20220728-rpi-analog-tv-properties-v2-27-f733a0ed9f90@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-27-f733a0ed9f90@cerno.tech>
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
> The analog TV connector drivers share some atomic_check logic, and the new
> TV standard property have created a bunch of new constraints that needs to
> be shared across drivers too.

The constraints part doesn't apply anymore after removing the display
mode check. It's only about detecting changes now.

Noralf.

> 
> Let's create an atomic_check helper for those use cases.
> 
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 0373c3dc824b..e88c57a4f7be 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -556,6 +556,55 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>  
> +/**
> + * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector state
> + * @connector: DRM Connector
> + * @state: the DRM State object
> + *
> + * Checks the state object to see if the requested state is valid for an
> + * analog TV connector.
> + *
> + * Returns:
> + * Zero for success, a negative error code on error.
> + */
> +int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
> +					 struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *old_conn_state =
> +		drm_atomic_get_old_connector_state(state, connector);
> +	struct drm_connector_state *new_conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +
> +	crtc = new_conn_state->crtc;
> +	if (!crtc)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (!crtc_state)
> +		return -EINVAL;
> +
> +	if (old_conn_state->tv.mode != new_conn_state->tv.mode)
> +		crtc_state->mode_changed = true;
> +
> +	if ((old_conn_state->tv.margins.left != new_conn_state->tv.margins.left) ||
> +	    (old_conn_state->tv.margins.right != new_conn_state->tv.margins.right) ||
> +	    (old_conn_state->tv.margins.top != new_conn_state->tv.margins.top) ||
> +	    (old_conn_state->tv.margins.bottom != new_conn_state->tv.margins.bottom) ||
> +	    (old_conn_state->tv.mode != new_conn_state->tv.mode) ||
> +	    (old_conn_state->tv.brightness != new_conn_state->tv.brightness) ||
> +	    (old_conn_state->tv.contrast != new_conn_state->tv.contrast) ||
> +	    (old_conn_state->tv.flicker_reduction != new_conn_state->tv.flicker_reduction) ||
> +	    (old_conn_state->tv.overscan != new_conn_state->tv.overscan) ||
> +	    (old_conn_state->tv.saturation != new_conn_state->tv.saturation) ||
> +	    (old_conn_state->tv.hue != new_conn_state->tv.hue))
> +		crtc_state->connectors_changed = true;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
> +
>  /**
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>   * @connector: connector object
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index c8fbce795ee7..b9740edb2658 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/types.h>
>  
> +struct drm_atomic_state;
>  struct drm_bridge;
>  struct drm_bridge_state;
>  struct drm_crtc;
> @@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>  					 struct drm_connector_state *conn_state);
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
>  void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
> +int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
> +					 struct drm_atomic_state *state);
>  void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
>  void
>  __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
> 
