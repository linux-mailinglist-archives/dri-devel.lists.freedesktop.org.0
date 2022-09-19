Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9505BD06D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE71010E664;
	Mon, 19 Sep 2022 15:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D61010E664
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:17:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 432C7D41;
 Mon, 19 Sep 2022 17:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663600653;
 bh=2puiBfBSuvOfOS88b2J3PNyfkl8M51lmUO5IZtT9CSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWixYfOitoFmLXo3HiiDzKGlFGdhUPWziffk09Hwwjm1J3sTCwF2xceFdZvqwWrvl
 AzeZB1q9xbsuNrfAjdnx2g+eV5PEBCkzfra9a5U+vgWkO2vw3P3H2ZC6ZESh0O0j7x
 dCLG7tBJgrFzP0vE1wxqgxZWZvN+KA+gJGEmospE=
Date: Mon, 19 Sep 2022 18:17:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/12] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YyiH/3eeHvPPbuHk@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-2-sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch, and sorry for the review delay. The series only
recently jumped to the top of my inbox.

On Sun, Jul 17, 2022 at 07:44:43PM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
> 
> The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
> drm_bridge_chain_post_disable - convert these to the atomic variants.
> 
> v2:
>   - Init state operations in drm_bridge_funcs (Laurent)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Philip Chen <philipchen@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 31e88cb39f8a..bb8076fb8625 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -15,6 +15,7 @@
>  
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
> @@ -409,7 +410,8 @@ static const struct dev_pm_ops ps8640_pm_ops = {
>  				pm_runtime_force_resume)
>  };
>  
> -static void ps8640_pre_enable(struct drm_bridge *bridge)
> +static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> @@ -443,7 +445,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  	ps_bridge->pre_enabled = true;
>  }
>  
> -static void ps8640_post_disable(struct drm_bridge *bridge)
> +static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  
> @@ -521,7 +524,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * EDID, for this chip, we need to do a full poweron, otherwise it will
>  	 * fail.
>  	 */
> -	drm_bridge_chain_pre_enable(bridge);
> +	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
>  
>  	edid = drm_get_edid(connector,
>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> @@ -531,7 +534,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * before, return the chip to its original power state.
>  	 */
>  	if (poweroff)
> -		drm_bridge_chain_post_disable(bridge);
> +		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>  
>  	return edid;
>  }
> @@ -546,8 +549,11 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>  	.attach = ps8640_bridge_attach,
>  	.detach = ps8640_bridge_detach,
>  	.get_edid = ps8640_bridge_get_edid,
> -	.post_disable = ps8640_post_disable,
> -	.pre_enable = ps8640_pre_enable,
> +	.atomic_post_disable = ps8640_atomic_post_disable,
> +	.atomic_pre_enable = ps8640_atomic_pre_enable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps_bridge)

-- 
Regards,

Laurent Pinchart
