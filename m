Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E94814E8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 17:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DE310E170;
	Wed, 29 Dec 2021 16:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E87710E170
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 16:10:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88CCD464;
 Wed, 29 Dec 2021 17:10:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640794251;
 bh=mr5lojsiIf1Co6+QVE9S6GTMc09dB0QzYOh+9i5UyV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tVNRdI3BI7czljQ1G8W3D6xXxKUwqPjFSyTN3IFYcTxNeNWXH0tHBjpmVJmmFgajR
 6Mah88GMpU0obH9/dh6gW6LD0JjyjnWq/8UUaZcsxMOd4n1p6daYdPUnEg1DmkMBmb
 vSAU2tYExE+xajXCQM6y4Ai/EvZQLC4iFx/SNqmY=
Date: Wed, 29 Dec 2021 18:10:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] drm/bridge: sn65dsi83: Fix an error handling path in
 sn65dsi83_probe()
Message-ID: <YcyIidlnW4Sh6CGm@pendragon.ideasonboard.com>
References: <4bc21aed4b60d3d5ac4b28d8b07a6fdd8da6a536.1640768126.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bc21aed4b60d3d5ac4b28d8b07a6fdd8da6a536.1640768126.git.christophe.jaillet@wanadoo.fr>
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
Cc: marex@denx.de, dri-devel@lists.freedesktop.org, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 frieder.schrempf@kontron.de, robert.foss@linaro.org, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

Thank you for the patch.

On Wed, Dec 29, 2021 at 09:58:44AM +0100, Christophe JAILLET wrote:
> sn65dsi83_parse_dt() takes a reference on 'ctx->host_node' that must be
> released in the error handling path of this function and of the probe.
> This is only done in the remove function up to now.
> 
> Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2: add error handling in sn65dsi83_parse_dt() [Laurent Pinchart]
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 32 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 945f08de45f1..314a84ffcea3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -560,10 +560,14 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  	ctx->host_node = of_graph_get_remote_port_parent(endpoint);
>  	of_node_put(endpoint);
>  
> -	if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4)
> -		return -EINVAL;
> -	if (!ctx->host_node)
> -		return -ENODEV;
> +	if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4) {
> +		ret = -EINVAL;
> +		goto err_put_node;
> +	}
> +	if (!ctx->host_node) {
> +		ret = -ENODEV;
> +		goto err_put_node;
> +	}
>  
>  	ctx->lvds_dual_link = false;
>  	ctx->lvds_dual_link_even_odd_swap = false;
> @@ -590,16 +594,22 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, &panel_bridge);
>  	if (ret < 0)
> -		return ret;
> +		goto err_put_node;
>  	if (panel) {
>  		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -		if (IS_ERR(panel_bridge))
> -			return PTR_ERR(panel_bridge);
> +		if (IS_ERR(panel_bridge)) {
> +			ret = PTR_ERR(panel_bridge);
> +			goto err_put_node;
> +		}
>  	}
>  
>  	ctx->panel_bridge = panel_bridge;
>  
>  	return 0;
> +
> +err_put_node:
> +	of_node_put(ctx->host_node);
> +	return ret;
>  }
>  
>  static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
> @@ -673,8 +683,10 @@ static int sn65dsi83_probe(struct i2c_client *client,
>  		return ret;
>  
>  	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
> -	if (IS_ERR(ctx->regmap))
> -		return PTR_ERR(ctx->regmap);
> +	if (IS_ERR(ctx->regmap)) {
> +		ret = PTR_ERR(ctx->regmap);
> +		goto err_put_node;
> +	}
>  
>  	dev_set_drvdata(dev, ctx);
>  	i2c_set_clientdata(client, ctx);
> @@ -691,6 +703,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
>  
>  err_remove_bridge:
>  	drm_bridge_remove(&ctx->bridge);
> +err_put_node:
> +	of_node_put(ctx->host_node);
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart
