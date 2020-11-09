Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE72AB54F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED93898AF;
	Mon,  9 Nov 2020 10:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F096F898AF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:48:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4493CB2B;
 Mon,  9 Nov 2020 11:48:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604918880;
 bh=3bhdV444Bv6HXmy5+0AVRS1C0QODE+hICZBwghchDag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uaoQJlNPUt1FVDFHdPMASPOnU+4TnK4rd6SlO7faChk+UIri2zTvQ3oo72oGlOxYI
 vpvJn514GqgwCRnKuDhCnM3DQlyUoi+qOSleWwFWiHweOplaZjDaFiLYlF7YRAZY5Q
 GAhDykx/zMph3qAy+mLzTOyAmsdWplovDGKpJ1dQ=
Date: Mon, 9 Nov 2020 12:47:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 35/56] drm/omap: dsi: implement check timings
Message-ID: <20201109104756.GF6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-36-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-36-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:03:12PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Implement check timings, which will check if its possible to

s/its/it's/

> configure the clocks for the provided mode using the same code
> as the set_config() hook.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 70 +++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index a1a867a7d91d..f643321434e9 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -280,6 +280,11 @@ struct dsi_isr_tables {
>  	struct dsi_isr_data isr_table_cio[DSI_MAX_NR_ISRS];
>  };
>  
> +struct dsi_lp_clock_info {
> +	unsigned long lp_clk;
> +	u16 lp_clk_div;
> +};
> +
>  struct dsi_clk_calc_ctx {
>  	struct dsi_data *dsi;
>  	struct dss_pll *pll;
> @@ -294,16 +299,12 @@ struct dsi_clk_calc_ctx {
>  
>  	struct dss_pll_clock_info dsi_cinfo;
>  	struct dispc_clock_info dispc_cinfo;
> +	struct dsi_lp_clock_info user_lp_cinfo;

Any reason for the user_ prefix here ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	struct videomode vm;
>  	struct omap_dss_dsi_videomode_timings dsi_vm;
>  };
>  
> -struct dsi_lp_clock_info {
> -	unsigned long lp_clk;
> -	u16 lp_clk_div;
> -};
> -
>  struct dsi_module_id_data {
>  	u32 address;
>  	int id;
> @@ -4789,44 +4790,55 @@ static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
>  	return (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE);
>  }
>  
> -static int dsi_set_config(struct omap_dss_device *dssdev,
> -		const struct drm_display_mode *mode)
> +static int __dsi_calc_config(struct dsi_data *dsi,
> +		const struct drm_display_mode *mode,
> +		struct dsi_clk_calc_ctx *ctx)
>  {
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	struct dsi_clk_calc_ctx ctx;
> -	struct videomode vm;
>  	struct omap_dss_dsi_config cfg = dsi->config;
> +	struct videomode vm;
>  	bool ok;
>  	int r;
>  
>  	drm_display_mode_to_videomode(mode, &vm);
> -	cfg.vm = &vm;
> -
> -	mutex_lock(&dsi->lock);
>  
> +	cfg.vm = &vm;
>  	cfg.mode = dsi->mode;
>  	cfg.pixel_format = dsi->pix_fmt;
>  
>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
> -		ok = dsi_vm_calc(dsi, &cfg, &ctx);
> +		ok = dsi_vm_calc(dsi, &cfg, ctx);
>  	else
> -		ok = dsi_cm_calc(dsi, &cfg, &ctx);
> +		ok = dsi_cm_calc(dsi, &cfg, ctx);
>  
> -	if (!ok) {
> -		DSSERR("failed to find suitable DSI clock settings\n");
> -		r = -EINVAL;
> -		goto err;
> -	}
> +	if (!ok)
> +		return -EINVAL;
> +
> +	dsi_pll_calc_dsi_fck(dsi, &ctx->dsi_cinfo);
>  
> -	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
> +	r = dsi_lp_clock_calc(ctx->dsi_cinfo.clkout[HSDIV_DSI],
> +		cfg.lp_clk_min, cfg.lp_clk_max, &ctx->user_lp_cinfo);
> +	if (r)
> +		return r;
> +
> +	return 0;
> +}
>  
> -	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
> -		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
> +static int dsi_set_config(struct omap_dss_device *dssdev,
> +		const struct drm_display_mode *mode)
> +{
> +	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	struct dsi_clk_calc_ctx ctx;
> +	int r;
> +
> +	mutex_lock(&dsi->lock);
> +
> +	r = __dsi_calc_config(dsi, mode, &ctx);
>  	if (r) {
> -		DSSERR("failed to find suitable DSI LP clock settings\n");
> +		DSSERR("failed to find suitable DSI clock settings\n");
>  		goto err;
>  	}
>  
> +	dsi->user_lp_cinfo = ctx.user_lp_cinfo;
>  	dsi->user_dsi_cinfo = ctx.dsi_cinfo;
>  	dsi->user_dispc_cinfo = ctx.dispc_cinfo;
>  
> @@ -5004,11 +5016,17 @@ static void dsi_set_timings(struct omap_dss_device *dssdev,
>  static int dsi_check_timings(struct omap_dss_device *dssdev,
>  			     struct drm_display_mode *mode)
>  {
> +	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	struct dsi_clk_calc_ctx ctx;
> +	int r;
> +
>  	DSSDBG("dsi_check_timings\n");
>  
> -	/* TODO */
> +	mutex_lock(&dsi->lock);
> +	r = __dsi_calc_config(dsi, mode, &ctx);
> +	mutex_unlock(&dsi->lock);
>  
> -	return 0;
> +	return r;
>  }
>  
>  static int dsi_connect(struct omap_dss_device *src,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
