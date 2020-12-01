Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E82C9403
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8D7898F5;
	Tue,  1 Dec 2020 00:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C2D898F5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:34:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18F6031D;
 Tue,  1 Dec 2020 01:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782875;
 bh=Aq6VO2P9+ZtDGkIFiJn3gx0NdnB5wG8jOkCm3y9kRBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YogvSyAgBOkObJiF/S4Fezm6mStqdgUrR+B2/RPkUu0EeGAfqE4QlkurBnvxzHmRI
 v/kfy+5xKYZ/Kt12cw6brhr1zNvOitQtbQaMMEyPO+VXSgcCUlWt8REBjvxK+hWfGQ
 gCmjMVZUVmiZum8CnfEOe1Z0jmtW99ydV1Tkdx0Q=
Date: Tue, 1 Dec 2020 02:34:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 75/80] drm/omap: dsi: rename dsi_display_* functions
Message-ID: <20201201003427.GT25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-76-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-76-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:33PM +0200, Tomi Valkeinen wrote:
> The function names have evolved to be very confusing, and bunch of them
> have "display" in them even if the function doesn't deal with display as
> such (e.g. dsi_display_enable which just enables the DSI interface).
> Rename them by dropping the "display".
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 36 +++++++++++++++----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index d23fc43f1d1e..ff8ace957291 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -55,8 +55,8 @@
>  
>  static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
>  
> -static int dsi_display_init_dispc(struct dsi_data *dsi);
> -static void dsi_display_uninit_dispc(struct dsi_data *dsi);
> +static int dsi_init_dispc(struct dsi_data *dsi);
> +static void dsi_uninit_dispc(struct dsi_data *dsi);
>  
>  static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
>  
> @@ -3257,7 +3257,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
>  	u16 word_count;
>  	int r;
>  
> -	r = dsi_display_init_dispc(dsi);
> +	r = dsi_init_dispc(dsi);
>  	if (r) {
>  		dev_err(dsi->dev, "failed to init dispc!\n");
>  		return;
> @@ -3309,7 +3309,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
>  		dsi_vc_enable(dsi, vc, false);
>  	}
>  err_pix_fmt:
> -	dsi_display_uninit_dispc(dsi);
> +	dsi_uninit_dispc(dsi);
>  	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
>  	return;
>  }
> @@ -3331,7 +3331,7 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
>  
>  	dss_mgr_disable(&dsi->output);
>  
> -	dsi_display_uninit_dispc(dsi);
> +	dsi_uninit_dispc(dsi);
>  }
>  
>  static void dsi_update_screen_dispc(struct dsi_data *dsi)
> @@ -3577,7 +3577,7 @@ static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static int dsi_display_init_dispc(struct dsi_data *dsi)
> +static int dsi_init_dispc(struct dsi_data *dsi)
>  {
>  	enum omap_channel dispc_channel = dsi->output.dispc_channel;
>  	int r;
> @@ -3622,7 +3622,7 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
>  	return r;
>  }
>  
> -static void dsi_display_uninit_dispc(struct dsi_data *dsi)
> +static void dsi_uninit_dispc(struct dsi_data *dsi)
>  {
>  	enum omap_channel dispc_channel = dsi->output.dispc_channel;
>  
> @@ -3649,7 +3649,7 @@ static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static int dsi_display_init_dsi(struct dsi_data *dsi)
> +static int dsi_init_dsi(struct dsi_data *dsi)
>  {
>  	int r;
>  
> @@ -3713,7 +3713,7 @@ static int dsi_display_init_dsi(struct dsi_data *dsi)
>  	return r;
>  }
>  
> -static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
> +static void dsi_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>  				   bool enter_ulps)
>  {
>  	if (enter_ulps && !dsi->ulps_enabled)
> @@ -3736,7 +3736,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>  	}
>  }
>  
> -static void dsi_display_enable(struct dsi_data *dsi)
> +static void dsi_enable(struct dsi_data *dsi)
>  {
>  	int r;
>  
> @@ -3750,7 +3750,7 @@ static void dsi_display_enable(struct dsi_data *dsi)
>  
>  	_dsi_initialize_irq(dsi);
>  
> -	r = dsi_display_init_dsi(dsi);
> +	r = dsi_init_dsi(dsi);
>  	if (r)
>  		goto err_init_dsi;
>  
> @@ -3762,10 +3762,10 @@ static void dsi_display_enable(struct dsi_data *dsi)
>  	dsi_runtime_put(dsi);
>  err_get_dsi:
>  	mutex_unlock(&dsi->lock);
> -	DSSDBG("dsi_display_ulps_enable FAILED\n");
> +	DSSDBG("dsi_enable FAILED\n");
>  }
>  
> -static void dsi_display_disable(struct dsi_data *dsi,
> +static void dsi_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> @@ -3777,7 +3777,7 @@ static void dsi_display_disable(struct dsi_data *dsi,
>  	dsi_sync_vc(dsi, 2);
>  	dsi_sync_vc(dsi, 3);
>  
> -	dsi_display_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
> +	dsi_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
>  
>  	dsi_runtime_put(dsi);
>  
> @@ -3807,7 +3807,7 @@ static void omap_dsi_ulps_work_callback(struct work_struct *work)
>  
>  	dsi_enable_te(dsi, false);
>  
> -	dsi_display_disable(dsi, false, true);
> +	dsi_disable(dsi, false, true);
>  
>  	dsi_bus_unlock(dsi);
>  }
> @@ -3828,7 +3828,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
>  			return;
>  
>  		dsi_bus_lock(dsi);
> -		dsi_display_enable(dsi);
> +		dsi_enable(dsi);
>  		dsi_enable_te(dsi, true);
>  		dsi_bus_unlock(dsi);
>  	}
> @@ -4919,7 +4919,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  	dsi_bus_lock(dsi);
>  
> -	dsi_display_enable(dsi);
> +	dsi_enable(dsi);
>  
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
>  
> @@ -4941,7 +4941,7 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
>  
>  	dsi_disable_video_output(dssdev, VC_VIDEO);
>  
> -	dsi_display_disable(dsi, true, false);
> +	dsi_disable(dsi, true, false);
>  
>  	dsi_bus_unlock(dsi);
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
