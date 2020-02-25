Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF416C466
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EE66EB0A;
	Tue, 25 Feb 2020 14:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0DE6EB0A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 14:52:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8625543F;
 Tue, 25 Feb 2020 15:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582642362;
 bh=gxSLu6CCwTAPAtTQH7f1DWRrjMrGlrhtuN72QoOPgbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOZbpoEdLeV0tlt8Yqmw6UMKZ5qX08sJ0r7U1S2wYGrxUYo1p/R3ATne1TL881qR/
 6/mgLLgqNVpBKrN2+cKeoskTidOCeNSANb7u1LeMF7dPfYW6hH3/Hz26mZUSaR2oRL
 gnYrhWbxqA+TEzzl55W09XjhHuQHLCVX8DcEZl20=
Date: Tue, 25 Feb 2020 16:52:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 08/56] drm/omap: panel-dsi-cm: convert to transfer API
Message-ID: <20200225145221.GG4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-9-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-9-sebastian.reichel@collabora.com>
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

On Tue, Feb 25, 2020 at 12:20:38AM +0100, Sebastian Reichel wrote:
> This converts the panel-dsi-cm driver to use the transfer
> API instead of specific functions, so that the specific
> functions can be unexported and squashed into the generic
> transfer function.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 133 +++++++++++++-----
>  1 file changed, 96 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index e6ebfc35243e..92f510a771fe 100644
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

Should you call dsicm_dcs_write_0(ddata, MIPI_DCS_ENTER_SLEEP_MODE)
instead ? This uses the _nosync variant though, is it an issue ?

>  	if (r)
>  		return r;
>  
> @@ -233,28 +249,44 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
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
>  
> -	buf[0] = MIPI_DCS_SET_PAGE_ADDRESS;
> -	buf[1] = (y1 >> 8) & 0xff;
> -	buf[2] = (y1 >> 0) & 0xff;
> -	buf[3] = (y2 >> 8) & 0xff;
> -	buf[4] = (y2 >> 0) & 0xff;
> +	const u8 paramY[] = {
> +		MIPI_DCS_SET_PAGE_ADDRESS,
> +		(y1 >> 8) & 0xff,
> +		(y1 >> 0) & 0xff,
> +		(y2 >> 8) & 0xff,
> +		(y2 >> 0) & 0xff,
> +	};
>  
> -	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));

Also replacing a _nosync variant here.

> +	const struct mipi_dsi_msg msgY = {
> +		.channel = ddata->channel,
> +		.type = MIPI_DSI_GENERIC_LONG_WRITE,
> +		.tx_buf = paramY,
> +		.tx_len = 5,
> +	};
> +
> +

A single blank line is enough.

> +	r = src->ops->dsi.transfer(src, &msgX);
>  	if (r)
>  		return r;
>  
> -	src->ops->dsi.bta_sync(src, ddata->channel);
> +	r = src->ops->dsi.transfer(src, &msgY);

And here, you're replacing bta_sync. If I understand the code correctly,
you're essentially removing an optimization, as each write will sync,
right ? I'm fine with this change if we add the functionality back later
in this series.

> +	if (r)
> +		return r;
>  
>  	return r;
>  }
> @@ -991,6 +1023,27 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
>  	return r;
>  }
>  
> +static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
> +                                        u16 size)

Please use tabs instead of spaces for indentation.

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
> @@ -1031,17 +1084,23 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
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
> @@ -1065,7 +1124,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
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
