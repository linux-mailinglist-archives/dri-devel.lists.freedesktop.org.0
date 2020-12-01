Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26C2C9416
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EFC89EA9;
	Tue,  1 Dec 2020 00:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EEB89EA9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:38:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 079FD31D;
 Tue,  1 Dec 2020 01:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606783127;
 bh=YHjBVOsAVP/nmsNHfNEYuatSanrGtqhl4RIz9mFHwlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtSiEBPhb743Zum2XD2SzgV21+Z/BwPFCb8B0QUh9TcHPkBOwfQwXAU9mmm0iOUyK
 I9hIxY99Gx9GcRsZ/kndB4BLzEvF1eFGrzWyWuBPinbuGJBo7uttkzOZLGAInfBr5Q
 L+5R7TfTR3wp7LMOHDA2YRoTCCXBODyHwyMhGF1k=
Date: Tue, 1 Dec 2020 02:38:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 78/80] drm/omap: dsi: fix and cleanup ddr_clk_always_on
Message-ID: <20201201003838.GB4315@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-79-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-79-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:36PM +0200, Tomi Valkeinen wrote:
> The driver ignores MIPI_DSI_CLOCK_NON_CONTINUOUS, and always uses
> non-continuous clock.
> 
> Fix this by using MIPI_DSI_CLOCK_NON_CONTINUOUS and at the same time,
> drop ddr_clk_always_on field which seems pretty useless.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++-------
>  drivers/gpu/drm/omapdrm/dss/dsi.h |  2 --
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 6d20245495ac..6e9c99402540 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -1734,11 +1734,10 @@ static int dsi_cio_init(struct dsi_data *dsi)
>  
>  	dsi_cio_timings(dsi);
>  
> -	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
> -		/* DDR_CLK_ALWAYS_ON */
> -		REG_FLD_MOD(dsi, DSI_CLK_CTRL,
> -			dsi->vm_timings.ddr_clk_always_on, 13, 13);
> -	}
> +	/* DDR_CLK_ALWAYS_ON */
> +	REG_FLD_MOD(dsi, DSI_CLK_CTRL,
> +		    !(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS),
> +		    13, 13);
>  
>  	dsi->ulps_enabled = false;
>  
> @@ -3641,7 +3640,7 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
>  	dsi_force_tx_stop_mode_io(dsi);
>  
>  	/* start the DDR clock by sending a NULL packet */
> -	if (dsi->vm_timings.ddr_clk_always_on)
> +	if (!(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>  		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
>  }
>  
> @@ -4150,7 +4149,6 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_calc_ctx *ctx)
>  	dsi_vm->hfp_blanking_mode = 1;
>  	dsi_vm->hbp_blanking_mode = 1;
>  
> -	dsi_vm->ddr_clk_always_on = cfg->ddr_clk_always_on;
>  	dsi_vm->window_sync = 4;
>  
>  	/* setup DISPC videomode */
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
> index 7cc2cc748ed9..3543828e30eb 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
> @@ -209,7 +209,6 @@ struct omap_dss_dsi_videomode_timings {
>  
>  	enum omap_dss_dsi_trans_mode trans_mode;
>  
> -	bool ddr_clk_always_on;
>  	int window_sync;
>  };
>  
> @@ -221,7 +220,6 @@ struct omap_dss_dsi_config {
>  	unsigned long hs_clk_min, hs_clk_max;
>  	unsigned long lp_clk_min, lp_clk_max;
>  
> -	bool ddr_clk_always_on;
>  	enum omap_dss_dsi_trans_mode trans_mode;
>  };
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
