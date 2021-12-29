Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F178481048
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 07:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30D810E3A9;
	Wed, 29 Dec 2021 06:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B510E3A9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 06:23:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 168B5464;
 Wed, 29 Dec 2021 07:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640759008;
 bh=yuTsMkMOJBK1rnaIA7xI8px/7g87HJbdYgwt4YL7wi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ex6vX+XqONsZEXU/yL2xyXSVYKeRxgFYm9Gm7bQmSHFb2aXOXmsN2ie09XjbwrnkM
 stIfCXdE+khltDRqSOU+yIXwuLvT4AdY/31Vt5cIEeieR89nHcswOolGE3h3h+7bWl
 A7JRYVJZP3uHKwc7hSeSQK4qMyonqEvImDSv6m94=
Date: Wed, 29 Dec 2021 08:23:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drm/bridge: sn65dsi83: Fix an error handling path in
 sn65dsi83_probe()
Message-ID: <Ycv+3pWote4yeBtF@pendragon.ideasonboard.com>
References: <16e7c6e94a61e6fc2d65db61620955c388798dbb.1640730512.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16e7c6e94a61e6fc2d65db61620955c388798dbb.1640730512.git.christophe.jaillet@wanadoo.fr>
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

On Tue, Dec 28, 2021 at 11:37:25PM +0100, Christophe JAILLET wrote:
> sn65dsi83_parse_dt() takes a reference on 'ctx->host_node' that must be
> released in the error handling path of the probe.
> This is only done in the remove function up to now.
> 
> Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 945f08de45f1..6edea9f8f8c4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -673,8 +673,10 @@ static int sn65dsi83_probe(struct i2c_client *client,
>  		return ret;
>  
>  	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
> -	if (IS_ERR(ctx->regmap))
> -		return PTR_ERR(ctx->regmap);
> +	if (IS_ERR(ctx->regmap)) {
> +		ret = PTR_ERR(ctx->regmap);
> +		goto err_put_node;
> +	}

There's another similar issue if sn65dsi83_parse_dt() fails. Would you
mind fixing them all in the same patch ?

>  
>  	dev_set_drvdata(dev, ctx);
>  	i2c_set_clientdata(client, ctx);
> @@ -691,6 +693,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
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
