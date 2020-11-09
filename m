Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC832AB2B3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC369895E7;
	Mon,  9 Nov 2020 08:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7AA895E7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:46:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 249C72FE;
 Mon,  9 Nov 2020 09:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911611;
 bh=dvN2vwjEk0CcEKWuvwsGCxa5Wucy0oymFDVo2T9XQv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGqVrjImkmaQHhmCAehQx9pdEP+HYf60Lp0lY2OYMggVb2U8DOCImi0z18WK0EJ6Z
 7Mmb6mWSeu4jRBtDTU934x4wirjS7FeP9EYI78+ap4pHPuQ6BElgE7hQgE15y1fQ33
 Q56/PWn9DW0vEQkKrLdHldvlYyh0N4FXc0XVdnVA=
Date: Mon, 9 Nov 2020 10:46:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 21/56] drm/omap: dsi: drop useless sync()
Message-ID: <20201109084648.GR6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-22-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-22-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:58PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The DSI sync() function only locks the bus and then releases
> it again. Currently the only invocation is directly before
> update(), which locks the bus anyways.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h          |  1 -
>  drivers/gpu/drm/omapdrm/omap_crtc.c            |  3 ---
>  3 files changed, 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index f59775cabe2d..a9609eed6bfa 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -845,23 +845,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>  	return r;
>  }
>  
> -static int dsicm_sync(struct omap_dss_device *dssdev)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct omap_dss_device *src = ddata->src;
> -
> -	dev_dbg(&ddata->dsi->dev, "sync\n");
> -
> -	mutex_lock(&ddata->lock);
> -	src->ops->dsi.bus_lock(src);
> -	src->ops->dsi.bus_unlock(src);
> -	mutex_unlock(&ddata->lock);
> -
> -	dev_dbg(&ddata->dsi->dev, "sync done\n");
> -
> -	return 0;
> -}
> -
>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct omap_dss_device *src = ddata->src;
> @@ -950,7 +933,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
>  
>  static const struct omap_dss_driver dsicm_dss_driver = {
>  	.update		= dsicm_update,
> -	.sync		= dsicm_sync,
>  };
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 55d5bca59f81..9bbd2c0f3187 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -385,7 +385,6 @@ struct omap_dss_device {
>  struct omap_dss_driver {
>  	int (*update)(struct omap_dss_device *dssdev,
>  			       u16 x, u16 y, u16 w, u16 h);
> -	int (*sync)(struct omap_dss_device *dssdev);
>  };
>  
>  struct dss_device *omapdss_get_dss(void);
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 328a4a74f534..dac9ccda98df 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -379,9 +379,6 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
>  		return;
>  	}
>  
> -	if (dssdrv->sync)
> -		dssdrv->sync(dssdev);
> -
>  	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
>  	if (ret < 0) {
>  		spin_lock_irq(&dev->event_lock);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
