Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646622AB2D8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9339C896FA;
	Mon,  9 Nov 2020 08:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3C9896FA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:53:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 575C9B2B;
 Mon,  9 Nov 2020 09:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911990;
 bh=VhIPCpIiEb3oXQI0cs50JDCAZZKyZbERROs1cNgeWEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UztF3XxZavlGADFHECBuS1sRIUmghtQZQkQXnlLA/cvVazdI4AI2AVPzCGvnSXGSw
 TttsyPdqJh/EKAGpxqnLKdn5TskEbDc6eVd7B7wCQHBUvET9JQccsXksr966/k2F2T
 My6stYOsAIyOYxGzyTeUXzN5JN7a45Q5qEV/7L34=
Date: Mon, 9 Nov 2020 10:53:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 24/56] drm/omap: dsi: lp/hs switching support for
 transfer()
Message-ID: <20201109085307.GU6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-25-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-25-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:03:01PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Integrate low-power / high-speed bus switching into transfer
> function and drop the omapdrm specific enable_hs() callback.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  6 +++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c               | 10 ++++++++--
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 1e742cf798b6..8890ee2ba830 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -269,7 +269,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>  		return 0;
>  
>  	src->ops->enable(src);
> -	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
> +	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
>  	r = _dsicm_enable_te(ddata, true);
>  	if (r) {
> @@ -574,7 +574,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  
>  	dsicm_hw_reset(ddata);
>  
> -	src->ops->dsi.enable_hs(src, ddata->dsi->channel, false);
> +	ddata->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
>  	r = dsicm_sleep_out(ddata);
>  	if (r)
> @@ -617,7 +617,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  		ddata->intro_printed = true;
>  	}
>  
> -	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
> +	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
>  	return 0;
>  err:
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index e341aca92462..003d26cead5a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -329,6 +329,7 @@ struct dsi_data {
>  	int irq;
>  
>  	bool is_enabled;
> +	bool in_lp_mode;
>  
>  	struct clk *dss_clk;
>  	struct regmap *syscon;
> @@ -2431,6 +2432,8 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int channel,
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
>  		dsi_vc_send_null(dsi, channel);
> +
> +	dsi->in_lp_mode = !enable;
>  }
>  
>  static void dsi_vc_flush_long_data(struct dsi_data *dsi, int channel)
> @@ -4693,6 +4696,11 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  	struct dsi_data *dsi = host_to_omap(host);
>  	struct omap_dss_device *dssdev = &dsi->output;
>  
> +	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode) {
> +		dsi_vc_enable_hs(dssdev, msg->channel,
> +				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
> +	}

No need for curly brackets.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	switch (msg->type) {
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> @@ -4753,8 +4761,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  
>  		.disable = dsi_display_disable,
>  
> -		.enable_hs = dsi_vc_enable_hs,
> -
>  		.set_config = dsi_set_config,
>  
>  		.enable_video_output = dsi_enable_video_output,
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 9bbd2c0f3187..2d44a8e32fcc 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -288,8 +288,6 @@ struct omapdss_dsi_ops {
>  	int (*set_config)(struct omap_dss_device *dssdev,
>  			const struct omap_dss_dsi_config *cfg);
>  
> -	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
> -			bool enable);
>  	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
>  
>  	int (*update)(struct omap_dss_device *dssdev, int channel,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
