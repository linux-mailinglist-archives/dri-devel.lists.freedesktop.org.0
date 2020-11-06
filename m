Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A92A8E8A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 06:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E296EE05;
	Fri,  6 Nov 2020 05:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91206EE05
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 05:05:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25383B16;
 Fri,  6 Nov 2020 06:05:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604639132;
 bh=iL8lBi1i9Uav/IZw5nJecy2vntnUbCXGe3EFaOEHte4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sOv5SwBEm5fRlCn6jXhvWM02yVbczyQaArWUphvbq8WQXccb46w8Jj/mkDZQaZ7Ih
 0e28Hp7nfrxZRY2sF0XJxJDpLzJ0hbwCaxD4CSn2mqPn9eNULF0f+4xfYR+DsAvZpx
 OexqgYAX5vN2Caqmp76+rbk3KsS7QpZRAafiNQ84=
Date: Fri, 6 Nov 2020 07:05:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 06/56] drm/omap: dsi: add generic transfer function
Message-ID: <20201106050530.GA25769@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-7-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-7-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:43PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This prepares the driver for becoming a mipi_dsi_host implementation,
> which provides a generic transfer function instead of all kind of
> different read/write functions. The implementation will become more
> elegant after unexporting the specific functions in the following
> patches.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 54 +++++++++++++++++++++++++++
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 ++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 22d74d762a10..59a62d1d41cb 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4842,6 +4842,58 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
>  	}
>  }
>  
> +static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
> +				 const struct mipi_dsi_msg *msg)
> +{
> +	/*
> +	 * no_sync can be used to optimize performance by sending e.g. column

Can we start this with "TODO: no_sync can ..." to make it standout as
something to be addressed ?

> +	 * and page information without syncing in between. It's not absolutley

s/absolutley/absolutely/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 * required, so postpone this feature for now.
> +	 */
> +	bool no_sync = false;
> +	u16 val;
> +
> +	switch (msg->type) {
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> +	case MIPI_DSI_GENERIC_LONG_WRITE:
> +		if (no_sync)
> +			return dsi_vc_generic_write_nosync(dssdev, msg->channel,
> +							   msg->tx_buf,
> +							   msg->tx_len);
> +		else
> +			return dsi_vc_generic_write(dssdev, msg->channel,
> +						    msg->tx_buf, msg->tx_len);
> +	case MIPI_DSI_DCS_SHORT_WRITE:
> +	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> +	case MIPI_DSI_DCS_LONG_WRITE:
> +		if (no_sync)
> +			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
> +						       msg->tx_buf,
> +						       msg->tx_len);
> +		else
> +			return dsi_vc_dcs_write(dssdev, msg->channel,
> +						msg->tx_buf, msg->tx_len);
> +	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> +		return dsi_vc_generic_read(dssdev, msg->channel,
> +					   msg->tx_buf, msg->tx_len,
> +					   msg->rx_buf, msg->rx_len);
> +	case MIPI_DSI_DCS_READ:
> +		return dsi_vc_dcs_read(dssdev, msg->channel,
> +				       ((u8 *)msg->tx_buf)[0],
> +				       msg->rx_buf, msg->rx_len);
> +	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
> +		val = le16_to_cpu(*((__le16 *)msg->tx_buf));
> +		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
> +	case MIPI_DSI_NULL_PACKET:
> +		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
> +	}
> +
> +	return -EINVAL;
> +}
>  
>  static int dsi_get_clocks(struct dsi_data *dsi)
>  {
> @@ -4896,6 +4948,8 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.set_vc_id = dsi_set_vc_id,
>  		.release_vc = dsi_release_vc,
>  
> +		.transfer = omap_dsi_transfer,
> +
>  		.dcs_write = dsi_vc_dcs_write,
>  		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
>  		.dcs_read = dsi_vc_dcs_read,
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 8e96ab2f20b6..654618e5a4e5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -308,6 +308,9 @@ struct omapdss_dsi_ops {
>  	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
>  
>  	/* data transfer */
> +	ssize_t (*transfer)(struct omap_dss_device *dssdev,
> +			    const struct mipi_dsi_msg *msg);
> +
>  	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
>  			const u8 *data, int len);
>  	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
