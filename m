Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6392AB2B8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB34892CD;
	Mon,  9 Nov 2020 08:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D5E892CD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:49:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADB902FE;
 Mon,  9 Nov 2020 09:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911764;
 bh=7esOE86lh6VNU6+Dmt9NNDLKtswT7FtPqnqUMYm5fGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNtXnhJko1nEv67p03XlH7DHuOWZSbvSBxzWexzcgcQzIaIXpPy+/ZlhQB5vlV9rJ
 zvCRKR/GeWX2XaOczNSE5Hs3M9sItaXjYwBqtE8d5k+HrS6khc4vyEbSHnJopodcTs
 OYclxBhmBphluRs2QKhHRRkwmJBzqePv/UuZX9E0=
Date: Mon, 9 Nov 2020 10:49:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 22/56] drm/omap: dsi: use pixel-format and mode from
 attach
Message-ID: <20201109084921.GS6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-23-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-23-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:59PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In order to reduce the amount of custom functionality, this moves
> handling of pixel format and DSI mode from set_config() to dsi
> attach.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 --
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 31 ++++++++++++-------
>  2 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index a9609eed6bfa..2e9de33fc8d4 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -550,8 +550,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	u8 id1, id2, id3;
>  	int r;
>  	struct omap_dss_dsi_config dsi_config = {
> -		.mode = OMAP_DSS_DSI_CMD_MODE,
> -		.pixel_format = MIPI_DSI_FMT_RGB888,
>  		.vm = &ddata->vm,
>  		.hs_clk_min = 150000000,
>  		.hs_clk_max = 300000000,
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index a16427f3bc23..e341aca92462 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4579,24 +4579,19 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	struct dsi_clk_calc_ctx ctx;
> +	struct omap_dss_dsi_config cfg = *config;
>  	bool ok;
>  	int r;
>  
>  	mutex_lock(&dsi->lock);
>  
> -	dsi->pix_fmt = config->pixel_format;
> -	dsi->mode = config->mode;
> +	cfg.mode = dsi->mode;
> +	cfg.pixel_format = dsi->pix_fmt;
>  
> -	if (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) < 0) {
> -		DSSERR("invalid pixel format\n");
> -		r = -EINVAL;
> -		goto err;
> -	}
> -
> -	if (config->mode == OMAP_DSS_DSI_VIDEO_MODE)
> -		ok = dsi_vm_calc(dsi, config, &ctx);
> +	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
> +		ok = dsi_vm_calc(dsi, &cfg, &ctx);
>  	else
> -		ok = dsi_cm_calc(dsi, config, &ctx);
> +		ok = dsi_cm_calc(dsi, &cfg, &ctx);
>  
>  	if (!ok) {
>  		DSSERR("failed to find suitable DSI clock settings\n");
> @@ -4607,7 +4602,7 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>  	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
>  
>  	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
> -		config->lp_clk_min, config->lp_clk_max, &dsi->user_lp_cinfo);
> +		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
>  	if (r) {
>  		DSSERR("failed to find suitable DSI LP clock settings\n");
>  		goto err;
> @@ -4785,7 +4780,19 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  		return -EBUSY;
>  	}
>  
> +	if (mipi_dsi_pixel_format_to_bpp(client->format) < 0) {
> +		DSSERR("invalid pixel format\n");
> +		return -EINVAL;
> +	}
> +
>  	dsi->vc[channel].dest = client;
> +
> +	dsi->pix_fmt = client->format;

Does this mean that all clients must use the same pixel format ? Do we
even support multiple clients ? If no the VC allocation could be
simplified.

> +	if (client->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
> +	else
> +		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
