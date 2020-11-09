Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443502AB625
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D499892C6;
	Mon,  9 Nov 2020 11:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E854892C6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:09:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAE98B2B;
 Mon,  9 Nov 2020 12:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604920176;
 bh=n8NTjNWVp3k6RpDjFsErQGCYu4i1iNrF4nNkXW7BEQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tqbTpbiFcVuu2YWQ9tr9fpbRKGXHnqPicCiPTeEu7s14Bdf7dTgf3AClnJFgz8QMA
 SDufgQI49SRmVP+qTIz3tLBXwcUt0uMOPovwCQt2FD6lTxq6ufhOFjs6xrMXIDpH8U
 HpvH2xL4EQCwkhB9nNj8idU23p1v+Xwb9gLq1aA8=
Date: Mon, 9 Nov 2020 13:09:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 50/56] drm/omap: dsi: simplify pin config
Message-ID: <20201109110932.GU6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-51-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-51-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:03:27PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Simplify DSI pin config, which always originates from DT
> nowadays. With the code being fully contained in the DSI
> encoder, we can drop the public structure.
> 
> Since the function is no longer exposed, it now directly
> takes the private DSI data pointer. This drop a pointless

s/drop/drops/

> conversion and means the pins can be configured earlier.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 33 +++++++++------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 15 ------------
>  2 files changed, 11 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index f47d7e3bb631..76e4f607d8cf 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3568,12 +3568,9 @@ static void dsi_proto_timings(struct dsi_data *dsi)
>  	}
>  }
>  
> -static int dsi_configure_pins(struct omap_dss_device *dssdev,
> -		const struct omap_dsi_pin_config *pin_cfg)
> +static int dsi_configure_pins(struct dsi_data *dsi,
> +		int num_pins, const u32 *pins)
>  {
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	int num_pins;
> -	const int *pins;
>  	struct dsi_lane_config lanes[DSI_MAX_NR_LANES];
>  	int num_lanes;
>  	int i;
> @@ -3586,9 +3583,6 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
>  		DSI_LANE_DATA4,
>  	};
>  
> -	num_pins = pin_cfg->num_pins;
> -	pins = pin_cfg->pins;
> -
>  	if (num_pins < 4 || num_pins > dsi->num_lanes_supported * 2
>  			|| num_pins % 2 != 0)
>  		return -EINVAL;
> @@ -3600,7 +3594,7 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
>  
>  	for (i = 0; i < num_pins; i += 2) {
>  		u8 lane, pol;
> -		int dx, dy;
> +		u32 dx, dy;

Is this change needed ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  		dx = pins[i];
>  		dy = pins[i + 1];
> @@ -5481,9 +5475,8 @@ static int dsi_probe_of(struct dsi_data *dsi)
>  	struct property *prop;
>  	u32 lane_arr[10];
>  	int len, num_pins;
> -	int r, i;
> +	int r;
>  	struct device_node *ep;
> -	struct omap_dsi_pin_config pin_cfg;
>  
>  	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
>  	if (!ep)
> @@ -5511,11 +5504,7 @@ static int dsi_probe_of(struct dsi_data *dsi)
>  		goto err;
>  	}
>  
> -	pin_cfg.num_pins = num_pins;
> -	for (i = 0; i < num_pins; ++i)
> -		pin_cfg.pins[i] = (int)lane_arr[i];
> -
> -	r = dsi_configure_pins(&dsi->output, &pin_cfg);
> +	r = dsi_configure_pins(dsi, num_pins, lane_arr);
>  	if (r) {
>  		dev_err(dsi->dev, "failed to configure pins");
>  		goto err;
> @@ -5728,6 +5717,12 @@ static int dsi_probe(struct platform_device *pdev)
>  	dsi->host.ops = &omap_dsi_host_ops;
>  	dsi->host.dev = &pdev->dev;
>  
> +	r = dsi_probe_of(dsi);
> +	if (r) {
> +		DSSERR("Invalid DSI DT data\n");
> +		goto err_pm_disable;
> +	}
> +
>  	r = mipi_dsi_host_register(&dsi->host);
>  	if (r < 0) {
>  		dev_err(&pdev->dev, "failed to register DSI host: %d\n", r);
> @@ -5738,12 +5733,6 @@ static int dsi_probe(struct platform_device *pdev)
>  	if (r)
>  		goto err_dsi_host_unregister;
>  
> -	r = dsi_probe_of(dsi);
> -	if (r) {
> -		DSSERR("Invalid DSI DT data\n");
> -		goto err_uninit_output;
> -	}
> -
>  	r = component_add(&pdev->dev, &dsi_component_ops);
>  	if (r)
>  		goto err_uninit_output;
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index a1236b8ef7ea..4a0826c8fed5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -243,21 +243,6 @@ struct omap_overlay_manager_info {
>  	struct omap_dss_cpr_coefs cpr_coefs;
>  };
>  
> -/* 22 pins means 1 clk lane and 10 data lanes */
> -#define OMAP_DSS_MAX_DSI_PINS 22
> -
> -struct omap_dsi_pin_config {
> -	int num_pins;
> -	/*
> -	 * pin numbers in the following order:
> -	 * clk+, clk-
> -	 * data1+, data1-
> -	 * data2+, data2-
> -	 * ...
> -	 */
> -	int pins[OMAP_DSS_MAX_DSI_PINS];
> -};
> -
>  struct omap_dss_writeback_info {
>  	u32 paddr;
>  	u32 p_uv_addr;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
