Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBC2C93F9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C2889E03;
	Tue,  1 Dec 2020 00:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7117889DFC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:33:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C16F31D;
 Tue,  1 Dec 2020 01:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782826;
 bh=PNlJMlKMDZLvPTxNTkvuBa+89L37a2Wh9uDw7vvIt6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=foUlpfLtrX/JXdO+L/1pfH7wufKqIuiv/0TvNQsZWqSkLOpRgm9TFWLLxiLsjElJm
 L1IJ8TNJNH6nUAQXd1ymLHo9sel4NrmFDCzryFGTwNtaAAawHlwf+PLznXyl1QcxmC
 QM0VuHOwdaYaEaE22iQQ40iiTKRYKnpWSZEzyiC0=
Date: Tue, 1 Dec 2020 02:33:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 74/80] drm/omap: dsi: display_disable cleanup
Message-ID: <20201201003336.GS25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-75-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-75-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:32PM +0200, Tomi Valkeinen wrote:
> We can drop dsi_display_disable() which just calls
> _dsi_display_disable(), and rename _dsi_display_disable() to
> dsi_display_disable().

Same comment as for the previous patch. I'd actually squash the two.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index e50418db71ef..d23fc43f1d1e 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -63,8 +63,6 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
>  static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg);
>  
> -static void dsi_display_disable(struct omap_dss_device *dssdev);
> -
>  #ifdef DSI_PERF_MEASURE
>  static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
> @@ -3767,7 +3765,7 @@ static void dsi_display_enable(struct dsi_data *dsi)
>  	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
>  
> -static void _dsi_display_disable(struct dsi_data *dsi,
> +static void dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> @@ -3786,17 +3784,6 @@ static void _dsi_display_disable(struct dsi_data *dsi,
>  	mutex_unlock(&dsi->lock);
>  }
>  
> -static void dsi_display_disable(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	DSSDBG("dsi_display_disable\n");
> -
> -	_dsi_display_disable(dsi, true, false);
> -}
> -
>  static int dsi_enable_te(struct dsi_data *dsi, bool enable)
>  {
>  	dsi->te_enabled = enable;
> @@ -3820,7 +3807,7 @@ static void omap_dsi_ulps_work_callback(struct work_struct *work)
>  
>  	dsi_enable_te(dsi, false);
>  
> -	_dsi_display_disable(dsi, false, true);
> +	dsi_display_disable(dsi, false, true);
>  
>  	dsi_bus_unlock(dsi);
>  }
> @@ -4954,7 +4941,7 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
>  
>  	dsi_disable_video_output(dssdev, VC_VIDEO);
>  
> -	dsi_display_disable(dssdev);
> +	dsi_display_disable(dsi, true, false);
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
