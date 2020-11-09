Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F92AB2C3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8537F8961D;
	Mon,  9 Nov 2020 08:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806C38961D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:51:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40F86B2B;
 Mon,  9 Nov 2020 09:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911898;
 bh=M/Bwi1CWDtR6Xz7/QLn3BjsCh2VYoAj6QhSGdQGg//0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IXRYx4rhMC9xEIeL47Yzrz9pNPBZxNq7l5HUG6mwz9Y6rmlFgUcff+kp2lyHaCYLx
 TsXMC+cvqVsBBOYJYq2ZBdsW8ZoCc7iWSr+B9z0fJToKkgfbax+GGs/rxJmA01kK2R
 qVdfA7XVidHs0XwbbHyK14mWUV+Gue4Sq4QadF1M=
Date: Mon, 9 Nov 2020 10:51:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 23/56] drm/omap: panel-dsi-cm: use bulk regulator API
Message-ID: <20201109085133.GT6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-24-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-24-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:00PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use bulk regulator API to simplify the code. This also switches
> from _optional variant to normal variant, which will provide a
> dummy regulator (i.e. if some always-enabled regulator is not
> described in DT).
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 65 ++++++-------------
>  1 file changed, 21 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 2e9de33fc8d4..1e742cf798b6 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -32,6 +32,8 @@
>  #define DCS_GET_ID2		0xdb
>  #define DCS_GET_ID3		0xdc
>  
> +#define DCS_REGULATOR_SUPPLY_NUM 2
> +
>  struct panel_drv_data {
>  	struct mipi_dsi_device *dsi;
>  
> @@ -54,8 +56,7 @@ struct panel_drv_data {
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *ext_te_gpio;
>  
> -	struct regulator *vpnl;
> -	struct regulator *vddi;
> +	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
>  
>  	bool use_dsi_backlight;
>  
> @@ -557,28 +558,16 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  		.lp_clk_max = 10000000,
>  	};
>  
> -	if (ddata->vpnl) {
> -		r = regulator_enable(ddata->vpnl);
> -		if (r) {
> -			dev_err(&ddata->dsi->dev,
> -				"failed to enable VPNL: %d\n", r);
> -			return r;
> -		}
> -	}
> -
> -	if (ddata->vddi) {
> -		r = regulator_enable(ddata->vddi);
> -		if (r) {
> -			dev_err(&ddata->dsi->dev,
> -				"failed to enable VDDI: %d\n", r);
> -			goto err_vpnl;
> -		}
> +	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);

I'd use ARRAY_SIZE(data->supplies) to replace DCS_REGULATOR_SUPPLY_NUM,
and drop the DCS_REGULATOR_SUPPLY_NUM macro.

> +	if (r) {
> +		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
> +		return r;
>  	}
>  
>  	r = src->ops->dsi.set_config(src, &dsi_config);
>  	if (r) {
>  		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
> -		goto err_vddi;
> +		goto err_regulators;
>  	}
>  
>  	src->ops->enable(src);
> @@ -637,12 +626,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	dsicm_hw_reset(ddata);
>  
>  	src->ops->dsi.disable(src, true, false);
> -err_vddi:
> -	if (ddata->vddi)
> -		regulator_disable(ddata->vddi);
> -err_vpnl:
> -	if (ddata->vpnl)
> -		regulator_disable(ddata->vpnl);
> +err_regulators:
> +	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
> +	if (r)
> +		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);

Not sure if the error message is needed, but I suppose it doesn't hurt.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	return r;
>  }
> @@ -666,10 +653,9 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>  
>  	src->ops->dsi.disable(src, true, false);
>  
> -	if (ddata->vddi)
> -		regulator_disable(ddata->vddi);
> -	if (ddata->vpnl)
> -		regulator_disable(ddata->vpnl);
> +	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
> +	if (r)
> +		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
>  
>  	ddata->enabled = false;
>  }
> @@ -973,21 +959,12 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  	ddata->height_mm = 0;
>  	of_property_read_u32(node, "height-mm", &ddata->height_mm);
>  
> -	ddata->vpnl = devm_regulator_get_optional(&dsi->dev, "vpnl");
> -	if (IS_ERR(ddata->vpnl)) {
> -		err = PTR_ERR(ddata->vpnl);
> -		if (err == -EPROBE_DEFER)
> -			return err;
> -		ddata->vpnl = NULL;
> -	}
> -
> -	ddata->vddi = devm_regulator_get_optional(&dsi->dev, "vddi");
> -	if (IS_ERR(ddata->vddi)) {
> -		err = PTR_ERR(ddata->vddi);
> -		if (err == -EPROBE_DEFER)
> -			return err;
> -		ddata->vddi = NULL;
> -	}
> +	ddata->supplies[0].supply = "vpnl";
> +	ddata->supplies[1].supply = "vddi";
> +	err = devm_regulator_bulk_get(&dsi->dev, DCS_REGULATOR_SUPPLY_NUM,
> +				      ddata->supplies);
> +	if (err)
> +		return err;
>  
>  	backlight = devm_of_find_backlight(&dsi->dev);
>  	if (IS_ERR(backlight))

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
