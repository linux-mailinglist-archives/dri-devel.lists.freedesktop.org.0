Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065D2C93F2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DA789DF9;
	Tue,  1 Dec 2020 00:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3873889DF9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:32:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5C0431D;
 Tue,  1 Dec 2020 01:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782729;
 bh=sxuivlcM6pLfxoAXxZswHUZtcsVReODh8LUxOyGUZcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYpJP/UlJMI4Pr0wmNTwQUscO3gKXAtWbQhFV8X66A79fQiRSmbbO4JQ9pE/lqNf/
 1l97PQiXa+PX8D6n7t+5HIvPO/VNlKCR1hrrsqH3XfXQWv/xPdqUmU8Y0D9V3zghDL
 ISjhV5NPxop4Y1bv9f30B1xY/4syiG9pQMqjgWNA=
Date: Tue, 1 Dec 2020 02:32:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 72/80] drm/omap: dsi: move enable/disable to bridge
 enable/disable
Message-ID: <20201201003200.GQ25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-73-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-73-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:30PM +0200, Tomi Valkeinen wrote:
> Clean up the code by inlining dsi_enable_video_outputs and
> dsi_disable_video_outputs functions.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 55 +++++++++++++------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index a01e09c9b477..4f79d6c664ff 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3336,20 +3336,6 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
>  	dsi_display_uninit_dispc(dsi);
>  }
>  
> -static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	dsi_bus_lock(dsi);
> -	dsi->video_enabled = false;
> -
> -	dsi_disable_video_output(dssdev, VC_VIDEO);
> -
> -	dsi_display_disable(dssdev);
> -
> -	dsi_bus_unlock(dsi);
> -}
> -
>  static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  {
>  	unsigned int bytespp;
> @@ -3791,23 +3777,6 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
>  	_dsi_display_enable(dsi);
>  }
>  
> -static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	dsi_bus_lock(dsi);
> -
> -	dsi_display_enable(dssdev);
> -
> -	dsi_enable_video_output(dssdev, VC_VIDEO);
> -
> -	dsi->video_enabled = true;
> -
> -	dsi_set_ulps_auto(dsi, true);
> -
> -	dsi_bus_unlock(dsi);
> -}
> -
>  static void _dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
> @@ -4969,15 +4938,35 @@ static void dsi_bridge_mode_set(struct drm_bridge *bridge,
>  static void dsi_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +	struct omap_dss_device *dssdev = &dsi->output;
>  
> -	dsi_enable_video_outputs(&dsi->output);
> +	dsi_bus_lock(dsi);
> +
> +	dsi_display_enable(dssdev);
> +
> +	dsi_enable_video_output(dssdev, VC_VIDEO);
> +
> +	dsi->video_enabled = true;
> +
> +	dsi_set_ulps_auto(dsi, true);
> +
> +	dsi_bus_unlock(dsi);
>  }
>  
>  static void dsi_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +	struct omap_dss_device *dssdev = &dsi->output;
> +
> +	dsi_bus_lock(dsi);
> +
> +	dsi->video_enabled = false;
> +
> +	dsi_disable_video_output(dssdev, VC_VIDEO);
>  
> -	dsi_disable_video_outputs(&dsi->output);
> +	dsi_display_disable(dssdev);
> +
> +	dsi_bus_unlock(dsi);
>  }
>  
>  static const struct drm_bridge_funcs dsi_bridge_funcs = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
