Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E437B4ACCD6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A16310E39C;
	Tue,  8 Feb 2022 00:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AC410E39C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 00:52:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C365F340;
 Tue,  8 Feb 2022 01:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644281537;
 bh=gYemUAQjk+OFRCfD5d6vbgkt64gj1mEA/uEBpTU/9Us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kej+7wesn8WulKJAzXboikGwkMBopLKUjcTmAU695STZM6LydY4HGwTHiZ83McA6d
 +rw+fzcToSQcm1v7/9pCckU10Crdf9La0SQnq2VO3mJrM+r3a1MDmPm4gwy4e5lgbV
 XDwsFhioYHE/3Db5GkGpvnsfp2ZsH9TkUm7E8hSg=
Date: Tue, 8 Feb 2022 02:52:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 9/9] drm/bridge: Drop unused drm_bridge_chain functions
Message-ID: <YgG+vqzYIK0smDXw@pendragon.ideasonboard.com>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-10-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220206154405.1243333-10-sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Feb 06, 2022 at 04:44:05PM +0100, Sam Ravnborg wrote:
> The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
> users left and we have atomic variants that should be used.
> Drop them so they do not gain new users.
> 
> Adjust a few comments to avoid references to the dropped functions.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_bridge.c | 110 -----------------------------------
>  include/drm/drm_bridge.h     |  28 ---------
>  2 files changed, 138 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..7a57d6816105 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -485,61 +485,6 @@ drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
>  
> -/**
> - * drm_bridge_chain_disable - disables all bridges in the encoder chain
> - * @bridge: bridge control structure
> - *
> - * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
> - * chain, starting from the last bridge to the first. These are called before
> - * calling the encoder's prepare op.
> - *
> - * Note: the bridge passed should be the one closest to the encoder
> - */
> -void drm_bridge_chain_disable(struct drm_bridge *bridge)
> -{
> -	struct drm_encoder *encoder;
> -	struct drm_bridge *iter;
> -
> -	if (!bridge)
> -		return;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -		if (iter->funcs->disable)
> -			iter->funcs->disable(iter);
> -
> -		if (iter == bridge)
> -			break;
> -	}
> -}
> -EXPORT_SYMBOL(drm_bridge_chain_disable);
> -
> -/**
> - * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
> - *				   encoder chain
> - * @bridge: bridge control structure
> - *
> - * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
> - * encoder chain, starting from the first bridge to the last. These are called
> - * after completing the encoder's prepare op.
> - *
> - * Note: the bridge passed should be the one closest to the encoder
> - */
> -void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
> -{
> -	struct drm_encoder *encoder;
> -
> -	if (!bridge)
> -		return;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (bridge->funcs->post_disable)
> -			bridge->funcs->post_disable(bridge);
> -	}
> -}
> -EXPORT_SYMBOL(drm_bridge_chain_post_disable);
> -
>  /**
>   * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
>   *			       encoder chain
> @@ -569,61 +514,6 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>  
> -/**
> - * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
> - *				 encoder chain
> - * @bridge: bridge control structure
> - *
> - * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
> - * chain, starting from the last bridge to the first. These are called
> - * before calling the encoder's commit op.
> - *
> - * Note: the bridge passed should be the one closest to the encoder
> - */
> -void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> -{
> -	struct drm_encoder *encoder;
> -	struct drm_bridge *iter;
> -
> -	if (!bridge)
> -		return;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -		if (iter->funcs->pre_enable)
> -			iter->funcs->pre_enable(iter);
> -
> -		if (iter == bridge)
> -			break;
> -	}
> -}
> -EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
> -
> -/**
> - * drm_bridge_chain_enable - enables all bridges in the encoder chain
> - * @bridge: bridge control structure
> - *
> - * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
> - * chain, starting from the first bridge to the last. These are called
> - * after completing the encoder's commit op.
> - *
> - * Note that the bridge passed should be the one closest to the encoder
> - */
> -void drm_bridge_chain_enable(struct drm_bridge *bridge)
> -{
> -	struct drm_encoder *encoder;
> -
> -	if (!bridge)
> -		return;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (bridge->funcs->enable)
> -			bridge->funcs->enable(bridge);
> -	}
> -}
> -EXPORT_SYMBOL(drm_bridge_chain_enable);
> -
>  /**
>   * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
>   * @bridge: bridge control structure
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index fc00304be643..ed2e4a8fe510 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -297,12 +297,6 @@ struct drm_bridge_funcs {
>  	 * not enable the display link feeding the next bridge in the chain (if
>  	 * there is one) when this callback is called.
>  	 *
> -	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from
> -	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
> -	 * implementation of @pre_enable if you are expecting driver calls into
> -	 * &drm_bridge_chain_pre_enable.
> -	 *
>  	 * The @atomic_pre_enable callback is optional.
>  	 */
>  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> @@ -323,11 +317,6 @@ struct drm_bridge_funcs {
>  	 * callback must enable the display link feeding the next bridge in the
>  	 * chain if there is one.
>  	 *
> -	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
> -	 * It would be prudent to also provide an implementation of @enable if
> -	 * you are expecting driver calls into &drm_bridge_chain_enable.
> -	 *
>  	 * The @atomic_enable callback is optional.
>  	 */
>  	void (*atomic_enable)(struct drm_bridge *bridge,
> @@ -345,12 +334,6 @@ struct drm_bridge_funcs {
>  	 * The bridge can assume that the display pipe (i.e. clocks and timing
>  	 * signals) feeding it is still running when this callback is called.
>  	 *
> -	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from
> -	 * &drm_bridge_chain_disable. It would be prudent to also provide an
> -	 * implementation of @disable if you are expecting driver calls into
> -	 * &drm_bridge_chain_disable.
> -	 *
>  	 * The @atomic_disable callback is optional.
>  	 */
>  	void (*atomic_disable)(struct drm_bridge *bridge,
> @@ -370,13 +353,6 @@ struct drm_bridge_funcs {
>  	 * signals) feeding it is no longer running when this callback is
>  	 * called.
>  	 *
> -	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from
> -	 * &drm_bridge_chain_post_disable.
> -	 * It would be prudent to also provide an implementation of
> -	 * @post_disable if you are expecting driver calls into
> -	 * &drm_bridge_chain_post_disable.
> -	 *
>  	 * The @atomic_post_disable callback is optional.
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> @@ -868,13 +844,9 @@ enum drm_mode_status
>  drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>  			    const struct drm_display_info *info,
>  			    const struct drm_display_mode *mode);
> -void drm_bridge_chain_disable(struct drm_bridge *bridge);
> -void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
>  void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
>  			       const struct drm_display_mode *mode,
>  			       const struct drm_display_mode *adjusted_mode);
> -void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
> -void drm_bridge_chain_enable(struct drm_bridge *bridge);
>  
>  int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
>  				  struct drm_crtc_state *crtc_state,

-- 
Regards,

Laurent Pinchart
