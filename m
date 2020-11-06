Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4C2A8E8D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 06:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721946EE08;
	Fri,  6 Nov 2020 05:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915FA6EE08
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 05:08:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF45BB16;
 Fri,  6 Nov 2020 06:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604639292;
 bh=EvGcaW0gKHQgA1E5M/q/O1AdjNDbdASwjkVEuH4XRA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PBkohtGDV0mwqYG4ksxp/HPMOO/6A0gw5OlnhUCKJMqkKH1V7s81n2985T4Le9KmT
 MJXZEmCgzeffJAadPnSIpEHMeZ4ZoB9e52AQRF8NvOCKD0saKrJXaNDAGSTUp79O29
 RSvbK27Q3tMoh0FyquSre2rZfSVt+la6mfqQ5pUs=
Date: Fri, 6 Nov 2020 07:08:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 07/56] drm/omap: panel-dsi-cm: convert to transfer API
Message-ID: <20201106050810.GB25769@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-8-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-8-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:44PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This converts the panel-dsi-cm driver to use the transfer
> API instead of specific functions, so that the specific
> functions can be unexported and squashed into the generic
> transfer function.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

There are a few very minor comments I would have made below, but as this
file is going away later in this series, it doesn't matter.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 132 +++++++++++++-----
>  1 file changed, 95 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index b8f3a7aacbf4..8b2e80129bd8 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -140,45 +140,61 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
>  static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
>  {
>  	struct omap_dss_device *src = ddata->src;
> -	int r;
> -	u8 buf[1];
> -
> -	r = src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd, buf, 1);
> -
> -	if (r < 0)
> -		return r;
> -
> -	*data = buf[0];
> +	const struct mipi_dsi_msg msg = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_DCS_READ,
> +		.tx_len = 1,
> +		.tx_buf = &dcs_cmd,
> +		.rx_len = 1,
> +		.rx_buf = data
> +	};
>  
> -	return 0;
> +	return src->ops->dsi.transfer(src, &msg);
>  }
>  
>  static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
>  {
>  	struct omap_dss_device *src = ddata->src;
> +	const struct mipi_dsi_msg msg = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_DCS_SHORT_WRITE,
> +		.tx_buf = &dcs_cmd,
> +		.tx_len = 1,
> +	};
>  
> -	return src->ops->dsi.dcs_write(src, ddata->channel, &dcs_cmd, 1);
> +	return src->ops->dsi.transfer(src, &msg);
>  }
>  
>  static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
>  {
>  	struct omap_dss_device *src = ddata->src;
> -	u8 buf[2] = { dcs_cmd, param };
> +	const u8 buf[] = { dcs_cmd, param };
> +	const struct mipi_dsi_msg msg = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_DCS_SHORT_WRITE_PARAM,
> +		.tx_buf = &buf,
> +		.tx_len = 2,
> +	};
>  
> -	return src->ops->dsi.dcs_write(src, ddata->channel, buf, 2);
> +	return src->ops->dsi.transfer(src, &msg);
>  }
>  
>  static int dsicm_sleep_in(struct panel_drv_data *ddata)
>  
>  {
>  	struct omap_dss_device *src = ddata->src;
> -	u8 cmd;
>  	int r;
> +	const u8 cmd = MIPI_DCS_ENTER_SLEEP_MODE;
> +	const struct mipi_dsi_msg msg = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_DCS_SHORT_WRITE,
> +		.tx_buf = &cmd,
> +		.tx_len = 1,
> +	};
>  
>  	hw_guard_wait(ddata);
>  
> -	cmd = MIPI_DCS_ENTER_SLEEP_MODE;
> -	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, &cmd, 1);
> +	r = src->ops->dsi.transfer(src, &msg);
>  	if (r)
>  		return r;
>  
> @@ -233,28 +249,43 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
>  	u16 y1 = y;
>  	u16 y2 = y + h - 1;
>  
> -	u8 buf[5];
> -	buf[0] = MIPI_DCS_SET_COLUMN_ADDRESS;
> -	buf[1] = (x1 >> 8) & 0xff;
> -	buf[2] = (x1 >> 0) & 0xff;
> -	buf[3] = (x2 >> 8) & 0xff;
> -	buf[4] = (x2 >> 0) & 0xff;
> +	const u8 paramX[] = {
> +		MIPI_DCS_SET_COLUMN_ADDRESS,
> +		(x1 >> 8) & 0xff,
> +		(x1 >> 0) & 0xff,
> +		(x2 >> 8) & 0xff,
> +		(x2 >> 0) & 0xff,
> +	};
>  
> -	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
> -	if (r)
> -		return r;
> +	const struct mipi_dsi_msg msgX = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_GENERIC_LONG_WRITE,
> +		.tx_buf = paramX,
> +		.tx_len = 5,
> +	};
> +
> +	const u8 paramY[] = {
> +		MIPI_DCS_SET_PAGE_ADDRESS,
> +		(y1 >> 8) & 0xff,
> +		(y1 >> 0) & 0xff,
> +		(y2 >> 8) & 0xff,
> +		(y2 >> 0) & 0xff,
> +	};
>  
> -	buf[0] = MIPI_DCS_SET_PAGE_ADDRESS;
> -	buf[1] = (y1 >> 8) & 0xff;
> -	buf[2] = (y1 >> 0) & 0xff;
> -	buf[3] = (y2 >> 8) & 0xff;
> -	buf[4] = (y2 >> 0) & 0xff;
> +	const struct mipi_dsi_msg msgY = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_GENERIC_LONG_WRITE,
> +		.tx_buf = paramY,
> +		.tx_len = 5,
> +	};
>  
> -	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
> +	r = src->ops->dsi.transfer(src, &msgX);
>  	if (r)
>  		return r;
>  
> -	src->ops->dsi.bta_sync(src, ddata->channel);
> +	r = src->ops->dsi.transfer(src, &msgY);
> +	if (r)
> +		return r;
>  
>  	return r;
>  }
> @@ -991,6 +1022,27 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
>  	return r;
>  }
>  
> +static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
> +					u16 size)
> +{
> +	struct panel_drv_data *ddata = to_panel_data(dssdev);
> +	struct omap_dss_device *src = ddata->src;
> +
> +	const u8 buf[] = {
> +		size & 0xff,
> +		size >> 8 & 0xff,
> +	};
> +
> +	const struct mipi_dsi_msg msg = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
> +		.tx_buf = buf,
> +		.tx_len = 2,
> +	};
> +
> +	return src->ops->dsi.transfer(src, &msg);
> +}
> +
>  static int dsicm_memory_read(struct omap_dss_device *dssdev,
>  		void *buf, size_t size,
>  		u16 x, u16 y, u16 w, u16 h)
> @@ -1031,17 +1083,23 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
>  
>  	dsicm_set_update_window(ddata, x, y, w, h);
>  
> -	r = src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, plen);
> +	r = dsicm_set_max_rx_packet_size(dssdev, plen);
>  	if (r)
>  		goto err2;
>  
>  	while (buf_used < size) {
>  		u8 dcs_cmd = first ? 0x2e : 0x3e;
> +		const struct mipi_dsi_msg msg = {
> +			.channel = ddata->channel,
> +			.type = MIPI_DSI_DCS_READ,
> +			.tx_buf = &dcs_cmd,
> +			.tx_len = 1,
> +			.rx_buf = buf + buf_used,
> +			.rx_len = size - buf_used,
> +		};
>  		first = 0;
>  
> -		r = src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd,
> -				buf + buf_used, size - buf_used);
> -
> +		r = src->ops->dsi.transfer(src, &msg);
>  		if (r < 0) {
>  			dev_err(dssdev->dev, "read error\n");
>  			goto err3;
> @@ -1065,7 +1123,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
>  	r = buf_used;
>  
>  err3:
> -	src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, 1);
> +	dsicm_set_max_rx_packet_size(dssdev, 1);
>  err2:
>  	src->ops->dsi.bus_unlock(src);
>  err1:

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
