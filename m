Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD0D4ACCD4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3B510E2C0;
	Tue,  8 Feb 2022 00:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3B010E2C0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 00:47:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC01B340;
 Tue,  8 Feb 2022 01:47:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644281221;
 bh=dN10DBYwnaSWEHHYo1miwVRgdar3gMw8RFkCgGemwJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yl41Jrj2UmayqIsw3bsyyvZt0/rExGE5Orldi2srszT8KdvnFO+1ue5qz5JqEtCLT
 v6StBJEUvFskJU6WOkCRWs7F9iSus2tlfIZnMgywKdFa5XlPAmFG4Tc/BaqQ27k6DJ
 96jIeSKXpVZS6R7wYoctXAiE8gYrSK42mfWHHHLM=
Date: Tue, 8 Feb 2022 02:46:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/9] drm/bridge: ti-sn65dsi86: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YgG9glOSISOj0a0b@pendragon.ideasonboard.com>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220206154405.1243333-5-sam@ravnborg.org>
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
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Feb 06, 2022 at 04:44:00PM +0100, Sam Ravnborg wrote:
> Move away from the deprecated enable/diable operations in

s/diable/disable/

> drm_bridge_funcs and enable atomic use.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ba136a188be7..d681ab68205c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -796,7 +796,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1055,7 +1056,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>  	return ret;
>  }
>  
> -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	const char *last_err_str = "No supported DP rate";
> @@ -1124,7 +1126,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   VSTREAM_ENABLE);
>  }
>  
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1137,7 +1140,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  	usleep_range(100, 110);
>  }
>  
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1158,10 +1162,11 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
>  	.mode_valid = ti_sn_bridge_mode_valid,
> -	.pre_enable = ti_sn_bridge_pre_enable,
> -	.enable = ti_sn_bridge_enable,
> -	.disable = ti_sn_bridge_disable,
> -	.post_disable = ti_sn_bridge_post_disable,
> +	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> +	.atomic_enable = ti_sn_atomic_bridge_enable,
> +	.atomic_disable = ti_sn_atomic_bridge_disable,
> +	.atomic_post_disable = ti_sn_bridge_post_disable,
> +	DRM_BRIDGE_STATE_OPS,

With the compilation fix,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,

-- 
Regards,

Laurent Pinchart
