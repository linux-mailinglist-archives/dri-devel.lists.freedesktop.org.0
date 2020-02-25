Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84516E939
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778046EB0E;
	Tue, 25 Feb 2020 15:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C206EB0E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 15:01:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27E5643F;
 Tue, 25 Feb 2020 16:01:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582642898;
 bh=PMJgoPyjy/9KDHQG7VkKjCuQReRufaZfhkVUXGj6P6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUYdV2WfwqFoPlhEHsVqlykLk4hqEySd8VeF4SnDZ7suyiaFxV3jJL6kKP5W2o7bH
 sOA0LIHYopMjnYbwMRPPzEgZHrC9BZU4qxOlEzCxtvfcr1Nnyd+4YirTWOm7xtHuZM
 ANrTrJhd9IG6z70YgfKKqbx1QeIJCV31BaQig3J4=
Date: Tue, 25 Feb 2020 17:01:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 10/56] drm/omap: dsi: drop virtual channel logic
Message-ID: <20200225150117.GI4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-11-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-11-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:40AM +0100, Sebastian Reichel wrote:
> This drops the virtual channel logic. Afterwards DSI clients
> request their channel number and get the virtual channel with
> the same number or -EBUSY if already in use.

I wonder why this level of indirection was used, allocating "virtual
VCs". A single virtual indirection should be enough :-) I may be missing
some context though, I'll defer that to Tomi, but for me,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
>  3 files changed, 12 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 92f510a771fe..ba046a596044 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -769,19 +769,12 @@ static int dsicm_connect(struct omap_dss_device *src,
>  	struct device *dev = &ddata->pdev->dev;
>  	int r;
>  
> -	r = src->ops->dsi.request_vc(src, &ddata->channel);
> +	r = src->ops->dsi.request_vc(src, ddata->channel);
>  	if (r) {
>  		dev_err(dev, "failed to get virtual channel\n");
>  		return r;
>  	}
>  
> -	r = src->ops->dsi.set_vc_id(src, ddata->channel, TCH);
> -	if (r) {
> -		dev_err(dev, "failed to set VC_ID\n");
> -		src->ops->dsi.release_vc(src, ddata->channel);
> -		return r;
> -	}
> -
>  	ddata->src = src;
>  	return 0;
>  }
> @@ -1216,6 +1209,8 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  	struct display_timing timing;
>  	int err;
>  
> +	ddata->channel = TCH;
> +
>  	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ddata->reset_gpio)) {
>  		err = PTR_ERR(ddata->reset_gpio);
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 0990777a42f7..8c223b808740 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -350,7 +350,6 @@ struct dsi_data {
>  		struct omap_dss_device *dssdev;
>  		enum fifo_size tx_fifo_size;
>  		enum fifo_size rx_fifo_size;
> -		int vc_id;
>  	} vc[4];
>  
>  	struct mutex lock;
> @@ -2579,7 +2578,7 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	data_id = data_type | dsi->vc[channel].vc_id << 6;
> +	data_id = data_type | channel << 6;
>  
>  	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
>  		FLD_VAL(ecc, 31, 24);
> @@ -2683,7 +2682,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
>  		return -EINVAL;
>  	}
>  
> -	data_id = data_type | dsi->vc[channel].vc_id << 6;
> +	data_id = data_type | channel << 6;
>  
>  	r = (data_id << 0) | (data << 8) | (ecc << 24);
>  
> @@ -4783,45 +4782,19 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
>  	}
>  }
>  
> -static int dsi_request_vc(struct omap_dss_device *dssdev, int *channel)
> +static int dsi_request_vc(struct omap_dss_device *dssdev, int channel)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
> -		if (!dsi->vc[i].dssdev) {
> -			dsi->vc[i].dssdev = dssdev;
> -			*channel = i;
> -			return 0;
> -		}
> -	}
>  
> -	DSSERR("cannot get VC for display %s", dssdev->name);
> -	return -ENOSPC;
> -}
> -
> -static int dsi_set_vc_id(struct omap_dss_device *dssdev, int channel, int vc_id)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	if (vc_id < 0 || vc_id > 3) {
> -		DSSERR("VC ID out of range\n");
> -		return -EINVAL;
> -	}
> -
> -	if (channel < 0 || channel > 3) {
> -		DSSERR("Virtual Channel out of range\n");
> +	if (channel < 0 || channel > 3)
>  		return -EINVAL;
> -	}
>  
> -	if (dsi->vc[channel].dssdev != dssdev) {
> -		DSSERR("Virtual Channel not allocated to display %s\n",
> -			dssdev->name);
> -		return -EINVAL;
> +	if (dsi->vc[channel].dssdev) {
> +		DSSERR("cannot get VC for display %s", dssdev->name);
> +		return -EBUSY;
>  	}
>  
> -	dsi->vc[channel].vc_id = vc_id;
> -
> +	dsi->vc[channel].dssdev = dssdev;
>  	return 0;
>  }
>  
> @@ -4832,7 +4805,6 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
>  	if ((channel >= 0 && channel <= 3) &&
>  		dsi->vc[channel].dssdev == dssdev) {
>  		dsi->vc[channel].dssdev = NULL;
> -		dsi->vc[channel].vc_id = 0;
>  	}
>  }
>  
> @@ -4937,7 +4909,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.enable_te = dsi_enable_te,
>  
>  		.request_vc = dsi_request_vc,
> -		.set_vc_id = dsi_set_vc_id,
>  		.release_vc = dsi_release_vc,
>  
>  		.transfer = omap_dsi_transfer,
> @@ -5393,7 +5364,6 @@ static int dsi_probe(struct platform_device *pdev)
>  	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
>  		dsi->vc[i].source = DSI_VC_SOURCE_L4;
>  		dsi->vc[i].dssdev = NULL;
> -		dsi->vc[i].vc_id = 0;
>  	}
>  
>  	r = dsi_get_clocks(dsi);
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 787e102eb068..587206c984a9 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -301,9 +301,7 @@ struct omapdss_dsi_ops {
>  	void (*disable_video_output)(struct omap_dss_device *dssdev,
>  			int channel);
>  
> -	int (*request_vc)(struct omap_dss_device *dssdev, int *channel);
> -	int (*set_vc_id)(struct omap_dss_device *dssdev, int channel,
> -			int vc_id);
> +	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
>  	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
>  
>  	/* data transfer */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
