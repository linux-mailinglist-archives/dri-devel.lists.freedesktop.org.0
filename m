Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EC5BD0E0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1217110E676;
	Mon, 19 Sep 2022 15:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0210E675
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:27:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 859C6415;
 Mon, 19 Sep 2022 17:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663601242;
 bh=NykL4ORXb7mlG5Er0sYqetabdT1DHT9QrJrGrvlu+D4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rmp8G9vxTP6yVvqGm3ljCjRuTcwj7n60drXxXkYinvqAvkZa7J50YiM8yFfZI4BWI
 7h4emeppP9If2KDiie7hnRYs3ZsSTyWPdh+Oy9zwqsdBtKve/7/HGeVDHY2ibdFlfR
 ujFqQVyvZuE8AVgBBeKeECRUDJebj/gqlMRyVL84=
Date: Mon, 19 Sep 2022 18:27:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 05/12] drm/bridge: sii8620: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiKTe4qVUuQ/Zj1@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-6-sam@ravnborg.org>
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
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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

Thank you for the patch.

On Sun, Jul 17, 2022 at 07:44:47PM +0200, Sam Ravnborg wrote:
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> 
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index ab0bce4a988c..b6e5c285c8ea 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -8,6 +8,7 @@
>  
>  #include <asm/unaligned.h>
>  
> +#include <drm/drm_atomic_state_helper.h>

I'd move this one line down, in alphabetical order.

>  #include <drm/bridge/mhl.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> @@ -2262,26 +2263,30 @@ static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
>  	}
>  }
>  
> -static bool sii8620_mode_fixup(struct drm_bridge *bridge,
> -			       const struct drm_display_mode *mode,
> -			       struct drm_display_mode *adjusted_mode)
> +static int sii8620_atomic_check(struct drm_bridge *bridge,
> +				struct drm_bridge_state *bridge_state,
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_connector_state *conn_state)
>  {
>  	struct sii8620 *ctx = bridge_to_sii8620(bridge);
>  
>  	mutex_lock(&ctx->lock);
>  
> -	ctx->use_packed_pixel = sii8620_is_packing_required(ctx, adjusted_mode);
> +	ctx->use_packed_pixel = sii8620_is_packing_required(ctx, &crtc_state->adjusted_mode);

Shouldn't this be moved to atomic_enable ? A test commit should change
the device state.

As this code was initially in mode_fixup I suppose this patch could be
merged as-is, with the problem fixed on top, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	mutex_unlock(&ctx->lock);
>  
> -	return true;
> +	return 0;
>  }
>  
>  static const struct drm_bridge_funcs sii8620_bridge_funcs = {
>  	.attach = sii8620_attach,
>  	.detach = sii8620_detach,
> -	.mode_fixup = sii8620_mode_fixup,
> +	.atomic_check = sii8620_atomic_check,
>  	.mode_valid = sii8620_mode_valid,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static int sii8620_probe(struct i2c_client *client,

-- 
Regards,

Laurent Pinchart
