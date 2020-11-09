Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA32AB47C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6785896E4;
	Mon,  9 Nov 2020 10:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6625896E4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:10:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E80D8B2B;
 Mon,  9 Nov 2020 11:10:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604916607;
 bh=bcxhbUl7xJ29c99d46nDPlo+iGUN+Vk8hc6WZAa7ul8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gWI9jVywhzyKwYVuWGTgvgCdQdStLK73FkqVTsrkYsc0+A08UKgFg/iHAF0PHE2DQ
 itnafTQj54TJusQFPceMONfV9uMspCkK5LEqaJXufPFXuNUb4RqvesStSzuQzD8c5m
 rqBIF+5gHnONOTP3/miNcyTot9UaN9qX7oxoX2cs=
Date: Mon, 9 Nov 2020 12:10:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 30/56] drm/omap: dsi: move panel refresh function to
 host
Message-ID: <20201109101003.GA6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-31-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-31-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:03:07PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This moves the panel refresh/update function from the panel
> driver into the DSI host driver to prepare for common drm_panel
> support.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  68 ------------
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 101 ++++++++++++++++--
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  13 +--
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |  11 +-
>  4 files changed, 97 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 030a8fa140db..1582960f9e90 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -177,27 +177,6 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>  	return 0;
>  }
>  
> -static int dsicm_set_update_window(struct panel_drv_data *ddata,
> -		u16 x, u16 y, u16 w, u16 h)
> -{
> -	struct mipi_dsi_device *dsi = ddata->dsi;
> -	int r;
> -	u16 x1 = x;
> -	u16 x2 = x + w - 1;
> -	u16 y1 = y;
> -	u16 y2 = y + h - 1;
> -
> -	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
> -	if (r < 0)
> -		return r;
> -
> -	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
> -	if (r < 0)
> -		return r;
> -
> -	return 0;
> -}
> -

I can't tell whether this is common to all command-mode panels, or if
there could be a need for panel-specific update procedures, so I can't
really ack this patch.

>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
> @@ -470,48 +449,6 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
>  	mutex_unlock(&ddata->lock);
>  }
>  
> -static void dsicm_framedone_cb(int err, void *data)
> -{
> -	struct panel_drv_data *ddata = data;
> -
> -	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
> -	mutex_unlock(&ddata->lock);
> -}
> -
> -static int dsicm_update(struct omap_dss_device *dssdev,
> -				    u16 x, u16 y, u16 w, u16 h)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct omap_dss_device *src = ddata->src;
> -	int r;
> -
> -	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
> -
> -	mutex_lock(&ddata->lock);
> -
> -	if (!ddata->enabled) {
> -		r = 0;
> -		goto err;
> -	}
> -
> -	/* XXX no need to send this every frame, but dsi break if not done */
> -	r = dsicm_set_update_window(ddata, 0, 0, ddata->vm.hactive,
> -				    ddata->vm.vactive);
> -	if (r)
> -		goto err;
> -
> -	r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
> -			ddata);
> -	if (r)
> -		goto err;
> -
> -	/* note: no unlock here. unlock is src framedone_cb */
> -	return 0;
> -err:
> -	mutex_unlock(&ddata->lock);
> -	return r;
> -}
> -
>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct mipi_dsi_device *dsi = ddata->dsi;
> @@ -572,10 +509,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
>  	.check_timings	= dsicm_check_timings,
>  };
>  
> -static const struct omap_dss_driver dsicm_dss_driver = {
> -	.update		= dsicm_update,
> -};
> -
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  {
>  	struct device_node *node = dsi->dev.of_node;
> @@ -658,7 +591,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	dssdev = &ddata->dssdev;
>  	dssdev->dev = dev;
>  	dssdev->ops = &dsicm_ops;
> -	dssdev->driver = &dsicm_dss_driver;
>  	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
>  	dssdev->display = true;
>  	dssdev->owner = THIS_MODULE;
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 0f264654792d..0aa0d21cf896 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -214,6 +214,9 @@ static void dsi_display_uninit_dispc(struct dsi_data *dsi);
>  
>  static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
>  
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +				       const struct mipi_dsi_msg *msg);
> +
>  /* DSI PLL HSDIV indices */
>  #define HSDIV_DISPC	0
>  #define HSDIV_DSI	1
> @@ -383,9 +386,6 @@ struct dsi_data {
>  
>  	struct delayed_work ulps_work;
>  
> -	void (*framedone_callback)(int, void *);
> -	void *framedone_data;
> -
>  	struct delayed_work framedone_timeout_work;
>  
>  #ifdef DSI_CATCH_MISSING_TE
> @@ -3802,8 +3802,6 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
>  	dsi_set_ulps_auto(dsi, true);
>  	dsi_bus_unlock(dsi);
>  
> -	dsi->framedone_callback(error, dsi->framedone_data);
> -
>  	if (!error)
>  		dsi_perf_show(dsi, "DISPC");
>  }
> @@ -3835,6 +3833,8 @@ static void dsi_framedone_irq_callback(void *data)
>  
>  	cancel_delayed_work(&dsi->framedone_timeout_work);
>  
> +	DSSDBG("Framedone received!\n");
> +
>  	dsi_handle_framedone(dsi, 0);
>  }
>  
> @@ -3856,17 +3856,69 @@ static int _dsi_update(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static int dsi_update(struct omap_dss_device *dssdev, int channel,
> -		void (*callback)(int, void *), void *data)
> +static int _dsi_update_window(struct dsi_data *dsi, int channel,
> +			      int x, int y, int w, int h)
> +{
> +	int x1 = x, x2 = (x + w - 1);
> +	int y1 = y, y2 = (y + h - 1);
> +	u8 payloadX[5] = { MIPI_DCS_SET_COLUMN_ADDRESS,
> +			   x1 >> 8, x1 & 0xff, x2 >> 8, x2 & 0xff };
> +	u8 payloadY[5] = { MIPI_DCS_SET_PAGE_ADDRESS,
> +			   y1 >> 8, y1 & 0xff, y2 >> 8, y2 & 0xff };
> +	struct mipi_dsi_msg msgX = { 0 }, msgY = { 0 };
> +	int ret;
> +
> +	WARN_ON(!dsi_bus_is_locked(dsi));
> +
> +	msgX.type = MIPI_DSI_DCS_LONG_WRITE;
> +	msgX.channel = channel;
> +	msgX.tx_buf = payloadX;
> +	msgX.tx_len = sizeof(payloadX);
> +
> +	msgY.type = MIPI_DSI_DCS_LONG_WRITE;
> +	msgY.channel = channel;
> +	msgY.tx_buf = payloadY;
> +	msgY.tx_len = sizeof(payloadY);
> +
> +	ret = _omap_dsi_host_transfer(dsi, &msgX);
> +	if (ret != 0)
> +		return ret;
> +
> +	return _omap_dsi_host_transfer(dsi, &msgY);
> +}
> +
> +static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	int r;
> +
> +	if (channel > 3)
> +		return -EINVAL;
>  
>  	dsi_bus_lock(dsi);
> +
> +	if (!dsi->vc[channel].dest) {
> +		r = -ENODEV;
> +		goto err;
> +	}
> +
> +	if (dsi->vm.hactive == 0 || dsi->vm.vactive == 0) {
> +		r = -EINVAL;
> +		goto err;
> +	}
> +
> +	DSSDBG("dsi_update_channel: %d", channel);
> +
>  	dsi_set_ulps_auto(dsi, false);
>  
> +	r = _dsi_update_window(dsi, channel, 0, 0, dsi->vm.hactive,
> +			       dsi->vm.vactive);
> +	if (r < 0) {
> +		DSSWARN("window update error: %d\n", r);
> +		goto err;
> +	}
> +
>  	dsi->update_channel = channel;
> -	dsi->framedone_callback = callback;
> -	dsi->framedone_data = data;
>  
>  	if (dsi->te_enabled && dsi->te_gpio) {
>  		schedule_delayed_work(&dsi->te_timeout_work,
> @@ -3877,6 +3929,24 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
>  	}
>  
>  	return 0;
> +
> +err:
> +	dsi_set_ulps_auto(dsi, true);
> +	dsi_bus_unlock(dsi);
> +	return r;
> +}
> +
> +static int dsi_update_all(struct omap_dss_device *dssdev)
> +{
> +	int i, r;

i should be unsigned as it's never negative.

> +
> +	for (i = 0; i < 4; i++) {
> +		r = dsi_update_channel(dssdev, i);
> +		if (r != -ENODEV)
> +			return r;
> +	}
> +
> +	return r;
>  }
>  
>  /* Display funcs */
> @@ -4095,7 +4165,9 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	DSSDBG("dsi_display_enable\n");
> +	dsi_bus_lock(dsi);

Why is the lock needed here now ? Should it be part of a previous patch
? Or, if I'm missing something, should the commit message explain this ?
Same for the other locations below.

>  	dsi_display_ulps_enable(dsi);
> +	dsi_bus_unlock(dsi);
>  }
>  
>  static void dsi_display_ulps_disable(struct dsi_data *dsi,
> @@ -4123,7 +4195,9 @@ static void dsi_display_disable(struct omap_dss_device *dssdev)
>  
>  	DSSDBG("dsi_display_disable\n");
>  
> +	dsi_bus_lock(dsi);
>  	dsi_display_ulps_disable(dsi, true, false);
> +	dsi_bus_unlock(dsi);
>  }
>  
>  static int dsi_enable_te(struct dsi_data *dsi, bool enable)
> @@ -4872,7 +4946,7 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.enable_video_output = dsi_enable_video_output,
>  		.disable_video_output = dsi_disable_video_output,
>  
> -		.update = dsi_update,
> +		.update = dsi_update_all,
>  	},
>  };
>  
> @@ -4973,14 +5047,18 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  		return -EINVAL;
>  	}
>  
> +	dsi_bus_lock(dsi);
> +
>  	atomic_set(&dsi->do_ext_te_update, 0);
>  
>  	if (client->mode_flags & MIPI_DSI_MODE_VIDEO) {
>  		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
>  	} else {
>  		r = omap_dsi_register_te_irq(dsi, client);
> -		if (r)
> +		if (r) {
> +			dsi_bus_unlock(dsi);
>  			return r;
> +		}
>  
>  		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
>  	}
> @@ -4994,6 +5072,7 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->ulps_auto_idle = !!(client->mode_flags & MIPI_DSI_MODE_ULPS_IDLE);
>  	dsi_set_ulps_auto(dsi, true);
>  
> +	dsi_bus_unlock(dsi);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 524cb87cd9ea..de4c779c358a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -281,13 +281,12 @@ struct omap_dss_writeback_info {
>  };
>  
>  struct omapdss_dsi_ops {
> -	/* bus configuration */
> +	int (*update)(struct omap_dss_device *dssdev);
> +
> +	/* legacy API used by omapdss panels */
>  	int (*set_config)(struct omap_dss_device *dssdev,
>  			const struct omap_dss_dsi_config *cfg);
>  
> -	int (*update)(struct omap_dss_device *dssdev, int channel,
> -			void (*callback)(int, void *), void *data);
> -
>  	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
>  	void (*disable_video_output)(struct omap_dss_device *dssdev,
>  			int channel);
> @@ -351,7 +350,6 @@ struct omap_dss_device {
>  
>  	const char *name;
>  
> -	const struct omap_dss_driver *driver;
>  	const struct omap_dss_device_ops *ops;
>  	unsigned long ops_flags;
>  	u32 bus_flags;
> @@ -372,11 +370,6 @@ struct omap_dss_device {
>  	unsigned int of_port;
>  };
>  
> -struct omap_dss_driver {
> -	int (*update)(struct omap_dss_device *dssdev,
> -			       u16 x, u16 y, u16 w, u16 h);
> -};
> -
>  struct dss_device *omapdss_get_dss(void);
>  void omapdss_set_dss(struct dss_device *dss);
>  static inline bool omapdss_is_initialized(void)
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index dac9ccda98df..3068e4fffa16 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -362,10 +362,8 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
>  {
>  	struct omap_crtc *omap_crtc =
>  			container_of(data, struct omap_crtc, update_work.work);
> -	struct drm_display_mode *mode = &omap_crtc->pipe->crtc->mode;
> -	struct omap_dss_device *dssdev = omap_crtc->pipe->output->next;
> +	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
>  	struct drm_device *dev = omap_crtc->base.dev;
> -	const struct omap_dss_driver *dssdrv;
>  	int ret;
>  
>  	if (!dssdev) {
> @@ -373,13 +371,12 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
>  		return;
>  	}
>  
> -	dssdrv = dssdev->driver;
> -	if (!dssdrv || !dssdrv->update) {
> -		dev_err_once(dev->dev, "missing or incorrect dssdrv!");
> +	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI || !dssdev->ops->dsi.update) {
> +		dev_err_once(dev->dev, "no DSI update callback found!");
>  		return;
>  	}
>  
> -	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
> +	ret = dssdev->ops->dsi.update(dssdev);
>  	if (ret < 0) {
>  		spin_lock_irq(&dev->event_lock);
>  		omap_crtc->pending = false;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
