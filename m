Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABE2AB29B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17FF8957D;
	Mon,  9 Nov 2020 08:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5040D8957D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:42:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B75712FE;
 Mon,  9 Nov 2020 09:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911331;
 bh=2jK+lAa6M6cSImOB81//tS4HoZm8M0OyaOoXwYoXUzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/SFY5GJYvrz/kcrQMiI5n5Z7dNm2Jf11TqNoEH3SNsxuWyfwgYEbmEs6h838XJ16
 //V89AG8DxYEtN1QNIClbxHLWs54Am5r/S9ZJ6CUXyzdFlDP9E8q9Ark4Nx4RcQ72E
 dhzOw8NGHG3OLNtOsNUJen57NISibzUqJHolcNzg=
Date: Mon, 9 Nov 2020 10:42:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 15/56] drm/omap: dsi: request VC via mipi_dsi_attach
Message-ID: <20201109084208.GL6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-16-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-16-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:52PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Drop custom request_vc/release_vc callbacks by using the
> generic mipi_dsi_attach/mipi_dsi_detach functions.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 24 +++++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 61 ++++++++-----------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  3 -
>  3 files changed, 41 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index ec36e62ddc3a..b1ca9b34ce17 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -693,14 +693,6 @@ static int dsicm_connect(struct omap_dss_device *src,
>  			 struct omap_dss_device *dst)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dst);
> -	struct device *dev = &ddata->dsi->dev;
> -	int r;
> -
> -	r = src->ops->dsi.request_vc(src, ddata->channel);
> -	if (r) {
> -		dev_err(dev, "failed to get virtual channel\n");
> -		return r;
> -	}
>  
>  	ddata->src = src;
>  	return 0;
> @@ -711,7 +703,6 @@ static void dsicm_disconnect(struct omap_dss_device *src,
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dst);
>  
> -	src->ops->dsi.release_vc(src, ddata->channel);
>  	ddata->src = NULL;
>  }
>  
> @@ -1276,8 +1267,21 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  		goto err_bl;
>  	}
>  
> +	dsi->lanes = 3;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			  MIPI_DSI_MODE_EOT_PACKET;
> +	dsi->hs_rate = 300000000;
> +	dsi->lp_rate = 10000000;

Should this change be explained in the commit message ?

> +
> +	r = mipi_dsi_attach(dsi);
> +	if (r < 0)
> +		goto err_dsi_attach;
> +
>  	return 0;
>  
> +err_dsi_attach:
> +	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>  err_bl:
>  	destroy_workqueue(ddata->workqueue);
>  err_reg:
> @@ -1294,6 +1298,8 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
>  
>  	dev_dbg(&dsi->dev, "remove\n");
>  
> +	mipi_dsi_detach(dsi);
> +
>  	omapdss_device_unregister(dssdev);
>  
>  	if (omapdss_device_is_enabled(dssdev))
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index d1187a8af37f..a16427f3bc23 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -349,7 +349,7 @@ struct dsi_data {
>  
>  	struct {
>  		enum dsi_vc_source source;
> -		struct omap_dss_device *dssdev;
> +		struct mipi_dsi_device *dest;

How about naming this dsidev ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		enum fifo_size tx_fifo_size;
>  		enum fifo_size rx_fifo_size;
>  	} vc[4];
> @@ -4692,32 +4692,6 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
>  	}
>  }
>  
> -static int dsi_request_vc(struct omap_dss_device *dssdev, int channel)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	if (channel < 0 || channel > 3)
> -		return -EINVAL;
> -
> -	if (dsi->vc[channel].dssdev) {
> -		DSSERR("cannot get VC for display %s", dssdev->name);
> -		return -EBUSY;
> -	}
> -
> -	dsi->vc[channel].dssdev = dssdev;
> -	return 0;
> -}
> -
> -static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	if ((channel >= 0 && channel <= 3) &&
> -		dsi->vc[channel].dssdev == dssdev) {
> -		dsi->vc[channel].dssdev = NULL;
> -	}
> -}
> -
>  static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  				      const struct mipi_dsi_msg *msg)
>  {
> @@ -4794,23 +4768,40 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.update = dsi_update,
>  
>  		.enable_te = dsi_enable_te,
> -
> -		.request_vc = dsi_request_vc,
> -		.release_vc = dsi_release_vc,
>  	},
>  };
>  
>  static int omap_dsi_host_attach(struct mipi_dsi_host *host,
> -			 struct mipi_dsi_device *dsi)
> +				struct mipi_dsi_device *client)
>  {
> -	/* TODO: convert driver from custom binding method to this one */
> +	struct dsi_data *dsi = host_to_omap(host);
> +	unsigned int channel = client->channel;
> +
> +	if (channel > 3)
> +		return -EINVAL;
> +
> +	if (dsi->vc[channel].dest) {
> +		DSSERR("cannot get VC for display %s", dev_name(&client->dev));
> +		return -EBUSY;
> +	}
> +
> +	dsi->vc[channel].dest = client;
>  	return 0;
>  }
>  
>  static int omap_dsi_host_detach(struct mipi_dsi_host *host,
> -			 struct mipi_dsi_device *dsi)
> +				struct mipi_dsi_device *client)
>  {
> -	/* TODO: convert driver from custom binding method to this one */
> +	struct dsi_data *dsi = host_to_omap(host);
> +	unsigned int channel = client->channel;
> +
> +	if (channel > 3)
> +		return -EINVAL;
> +
> +	if (dsi->vc[channel].dest != client)
> +		return -EINVAL;
> +
> +	dsi->vc[channel].dest = NULL;
>  	return 0;
>  }
>  
> @@ -5269,7 +5260,7 @@ static int dsi_probe(struct platform_device *pdev)
>  	/* DSI VCs initialization */
>  	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
>  		dsi->vc[i].source = DSI_VC_SOURCE_L4;
> -		dsi->vc[i].dssdev = NULL;
> +		dsi->vc[i].dest = NULL;
>  	}
>  
>  	r = dsi_get_clocks(dsi);
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 8cd2c800922e..78041ef922cc 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -301,9 +301,6 @@ struct omapdss_dsi_ops {
>  	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
>  	void (*disable_video_output)(struct omap_dss_device *dssdev,
>  			int channel);
> -
> -	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
> -	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
>  };
>  
>  struct omap_dss_device_ops {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
