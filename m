Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054743D7C1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 01:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75A86E8D9;
	Wed, 27 Oct 2021 23:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF316E8D9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:51:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C3CEE7;
 Thu, 28 Oct 2021 01:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635378696;
 bh=xL3/gQ/IHX5dVwZj6xLgYvM1ulKwHjOb5SRLsO1nARE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tnH6dWww3Ym+yHRZHpGq94XH3EvqG0tfZqaNskYiIVzL3jEUngXBsr5bXkRMRR9uQ
 MhLN3E9o+HVSyA8SarVkyR7cY5oVE4FJjWKddpX8nPphlamjOZPTRBEIS8ClxzqwKp
 deoL955GvLBN4o0NjiY91PJM9REGw3Q9YC6Z6E2o=
Date: Thu, 28 Oct 2021 02:51:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply
 regulator support
Message-ID: <YXnl8NY0/FBMva4U@pendragon.ideasonboard.com>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
 <20211019065239.969988-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211019065239.969988-5-alexander.stein@ew.tq-group.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Thank you for the patch.

On Tue, Oct 19, 2021 at 08:52:39AM +0200, Alexander Stein wrote:
> VCC needs to be enabled before releasing the enable GPIO.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 9072342566f3..c55c45d5d29a 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -33,6 +33,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -143,6 +144,7 @@ struct sn65dsi83 {
>  	struct mipi_dsi_device		*dsi;
>  	struct drm_bridge		*panel_bridge;
>  	struct gpio_desc		*enable_gpio;
> +	struct regulator		*vcc;
>  	int				dsi_lanes;
>  	bool				lvds_dual_link;
>  	bool				lvds_dual_link_even_odd_swap;
> @@ -292,6 +294,11 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>  					struct drm_bridge_state *old_bridge_state)
>  {
>  	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> +	int ret;
> +
> +	ret = regulator_enable(ctx->vcc);
> +	if (ret)
> +		dev_err(ctx->dev, "Failed to enable vcc: %i\n", ret);
>  
>  	/*
>  	 * Reset the chip, pull EN line low for t_reset=10ms,
> @@ -536,9 +543,14 @@ static void sn65dsi83_atomic_post_disable(struct drm_bridge *bridge,
>  					  struct drm_bridge_state *old_bridge_state)
>  {
>  	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> +	int ret;
>  
>  	/* Put the chip in reset, pull EN line low. */
>  	gpiod_set_value(ctx->enable_gpio, 0);
> +
> +	ret = regulator_disable(ctx->vcc);
> +	if (ret)
> +		dev_err(ctx->dev, "Failed to disable vcc: %i\n", ret);
>  }
>  
>  static enum drm_mode_status
> @@ -647,6 +659,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  
>  	ctx->panel_bridge = panel_bridge;
>  
> +	ctx->vcc = devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(ctx->vcc))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
> +				     "Failed to get supply 'vcc': %pe\n",
> +				     ctx->vcc);
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
