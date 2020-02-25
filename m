Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F016EA27
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E6A6E215;
	Tue, 25 Feb 2020 15:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573556E8CA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 15:31:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C571F43F;
 Tue, 25 Feb 2020 16:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582644686;
 bh=DXws84g5R7l7Ckt2THuDUXcJfGXo51oh9rhXzaZ9M7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y1I9Qr/HNF5Eq52R6bDFTR8GFmWwKM78ff1t3z/TxldMeDi1DdEjnYrTFJaPoff0M
 URGEMMiFaA+FvH2PsBgTD/aHuZaE/FYE1sEDi0hCpGDtV5JEY5i+uymZvjFO1UV8y2
 +DvsxyClejhPNg+2C6jYUvagcj6iFMiw9npVtdRs=
Date: Tue, 25 Feb 2020 17:31:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 11/56] drm/omap: dsi: simplify write function
Message-ID: <20200225153105.GJ4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-12-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-12-sebastian.reichel@collabora.com>
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

On Tue, Feb 25, 2020 at 12:20:41AM +0100, Sebastian Reichel wrote:
> Simplify the write related messages handling by using the functionality
> provided by CONFIG_DRM_MIPI_DSI.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/Kconfig |   1 +
>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 144 +++++++---------------------
>  2 files changed, 33 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
> index 72ae79c0c9b4..90e2dd522896 100644
> --- a/drivers/gpu/drm/omapdrm/dss/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
> @@ -95,6 +95,7 @@ config OMAP2_DSS_SDI
>  config OMAP2_DSS_DSI
>  	bool "DSI support"
>  	default n
> +	select DRM_MIPI_DSI
>  	help
>  	  MIPI DSI (Display Serial Interface) support.
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 8c223b808740..e5589e615808 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2696,97 +2696,49 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
>  	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
>  }
>  
> -static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
> -				      const u8 *data, int len,
> -				      enum dss_dsi_content_type type)
> +static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> +			       const struct mipi_dsi_msg *msg)
>  {
> +	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	struct mipi_dsi_packet packet;
>  	int r;
>  
> -	if (len == 0) {
> -		BUG_ON(type == DSS_DSI_CONTENT_DCS);
> -		r = dsi_vc_send_short(dsi, channel,
> -				MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM, 0, 0);
> -	} else if (len == 1) {
> -		r = dsi_vc_send_short(dsi, channel,
> -				type == DSS_DSI_CONTENT_GENERIC ?
> -				MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM :
> -				MIPI_DSI_DCS_SHORT_WRITE, data[0], 0);
> -	} else if (len == 2) {
> -		r = dsi_vc_send_short(dsi, channel,
> -				type == DSS_DSI_CONTENT_GENERIC ?
> -				MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM :
> -				MIPI_DSI_DCS_SHORT_WRITE_PARAM,
> -				data[0] | (data[1] << 8), 0);
> +	r = mipi_dsi_create_packet(&packet, msg);
> +	if (r < 0)
> +		return r;
> +
> +	if (mipi_dsi_packet_format_is_short(msg->type)) {
> +		u16 data = packet.header[1] | (packet.header[2] << 8);
> +		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);

You use the packet for this case only, I think you could simply write

		u16 data = ((msg->tx_len > 0) ? tx[0] : 0)
			 | (((msg->tx_len > 1) ? tx[1] : 0) << 8);
		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);

>  	} else {
> -		r = dsi_vc_send_long(dsi, channel,
> -				type == DSS_DSI_CONTENT_GENERIC ?
> -				MIPI_DSI_GENERIC_LONG_WRITE :
> -				MIPI_DSI_DCS_LONG_WRITE, data, len, 0);
> +		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
> +						   msg->tx_buf, msg->tx_len, 0);

Indentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
> -	return r;
> -}
> -
> -static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> -			DSS_DSI_CONTENT_DCS);
> -}
> -
> -static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> -			DSS_DSI_CONTENT_GENERIC);
> -}
> -
> -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> -			       int channel, const u8 *data, int len,
> -			       enum dss_dsi_content_type type)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	int r;
> +	if (r < 0)
> +		return r;
>  
> -	r = dsi_vc_write_nosync_common(dsi, channel, data, len, type);
> -	if (r)
> -		goto err;
> +	/*
> +	 * we do not always have to do the BTA sync, for example we can
> +	 * improve performance by setting the update window information
> +	 * without sending BTA sync between the commands. In that case
> +	 * we can return earily.

s/earily/early/

Do I understand correctly that this isn't implemented yet ? You should
make it clear in the comment that it's a candidate for a future
optimization.

> +	 */
>  
> -	r = dsi_vc_send_bta_sync(dssdev, channel);
> -	if (r)
> -		goto err;
> +	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
> +	if (r) {
> +		DSSERR("bta sync failed\n");
> +		return r;
> +	}
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(msg->channel), 20, 20)) {
>  		DSSERR("rx fifo not empty after write, dumping data:\n");
> -		dsi_vc_flush_receive_data(dsi, channel);
> -		r = -EIO;
> -		goto err;
> +		dsi_vc_flush_receive_data(dsi, msg->channel);
> +		return -EIO;
>  	}
>  
>  	return 0;
> -err:
> -	DSSERR("dsi_vc_write_common(ch %d, cmd 0x%02x, len %d) failed\n",
> -			channel, data[0], len);
> -	return r;
> -}
> -
> -static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	return dsi_vc_write_common(dssdev, channel, data, len,
> -			DSS_DSI_CONTENT_DCS);
> -}
> -
> -static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	return dsi_vc_write_common(dssdev, channel, data, len,
> -			DSS_DSI_CONTENT_GENERIC);
>  }
>  
>  static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
> @@ -3008,15 +2960,6 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
>  	return 0;
>  }
>  
> -static int dsi_vc_set_max_rx_packet_size(struct omap_dss_device *dssdev, int channel,
> -		u16 len)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	return dsi_vc_send_short(dsi, channel,
> -			MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE, len, 0);
> -}
> -
>  static int dsi_enter_ulps(struct dsi_data *dsi)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
> @@ -4811,35 +4754,17 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
>  static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
>  				 const struct mipi_dsi_msg *msg)
>  {
> -	/*
> -	 * no_sync can be used to optimize performance by sending
> -	 * e.g. column and page information without syncing in
> -	 * between. It's not absolutley required, so postpone this
> -	 * feature for now.
> -	 */
> -	bool no_sync = false;
> -	u16 val;
> -
>  	switch (msg->type) {
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
>  	case MIPI_DSI_GENERIC_LONG_WRITE:
> -		if (no_sync)
> -			return dsi_vc_generic_write_nosync(dssdev, msg->channel,
> -				                      msg->tx_buf, msg->tx_len);
> -		else
> -			return dsi_vc_generic_write(dssdev, msg->channel,
> -						    msg->tx_buf, msg->tx_len);
>  	case MIPI_DSI_DCS_SHORT_WRITE:
>  	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
>  	case MIPI_DSI_DCS_LONG_WRITE:
> -		if (no_sync)
> -			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
> -						      msg->tx_buf, msg->tx_len);
> -		else
> -			return dsi_vc_dcs_write(dssdev, msg->channel,
> -						msg->tx_buf, msg->tx_len);
> +	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
> +	case MIPI_DSI_NULL_PACKET:
> +		return dsi_vc_write_common(dssdev, msg);
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> @@ -4849,11 +4774,6 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
>  		return dsi_vc_dcs_read(dssdev, msg->channel,
>  				((u8*) msg->tx_buf)[0],
>  				msg->rx_buf, msg->rx_len);
> -	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
> -		val = le16_to_cpu(*((__le16*) msg->tx_buf));
> -		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
> -	case MIPI_DSI_NULL_PACKET:
> -		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
>  	}
>  
>  	return -EINVAL;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
