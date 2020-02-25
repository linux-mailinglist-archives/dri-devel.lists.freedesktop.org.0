Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861016EB70
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 17:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14B76EB4C;
	Tue, 25 Feb 2020 16:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8986EB45
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:30:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 685DD43F;
 Tue, 25 Feb 2020 17:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582648222;
 bh=+I3ZT3Kz89FpG4OGS2eenHQoquKiz7MB/sCg8zINQKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gv3xZRXbBokNCKddgds1plP6vy1YiTSWe1EH9ikg66Ar6WQtFxZSWP1u458j7SH7f
 IlzkTuDzZk7P0dp9f1pkxKEvEiPF48b52PBW3D9UujA+Qu2o7ojogvtbZfCJhGXf4r
 r9K0TO7LieibcMeTO2Olb1i/8g3uwffbTCAm/wgY=
Date: Tue, 25 Feb 2020 18:30:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 13/56] drm/omap: dsi: switch dsi_vc_send_long/short to
 mipi_dsi_msg
Message-ID: <20200225163001.GN4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-14-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-14-sebastian.reichel@collabora.com>
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

On Tue, Feb 25, 2020 at 12:20:43AM +0100, Sebastian Reichel wrote:
> Simplify the DSI encoder by using mipi_dsi_msg for
> dsi_vc_send_long and dsi_vc_send_short. Further improvements
> require cleaning up the channel allocation code first.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 92 +++++++++++++++----------------
>  1 file changed, 45 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 9b5b078beb6d..4899bfa2d76f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2599,30 +2599,36 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
>  	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
>  }
>  
> -static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
> -			    const u8 *data, u16 len, u8 ecc)
> +static int dsi_vc_send_long(struct dsi_data *dsi,
> +			    const struct mipi_dsi_msg *msg)
>  {
> +	struct mipi_dsi_packet pkg;
>  	/*u32 val; */
>  	int i;
>  	const u8 *p;
>  	int r = 0;
>  	u8 b1, b2, b3, b4;
>  
> +	r = mipi_dsi_create_packet(&pkg, msg);
> +	if (r < 0)
> +		return r;
> +
>  	if (dsi->debug_write)
> -		DSSDBG("dsi_vc_send_long, %d bytes\n", len);
> +		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
>  
>  	/* len + header */
> -	if (dsi->vc[channel].tx_fifo_size * 32 * 4 < len + 4) {
> +	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
>  		DSSERR("unable to send long packet: packet too long.\n");
>  		return -EINVAL;
>  	}
>  
> -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
> +	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
>  
> -	dsi_vc_write_long_header(dsi, channel, data_type, len, ecc);
> +	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len,
> +				 pkg.header[3]);

mipi_dsi_create_packet() never sets header[3]. I suppose that's not an
issue as we were always passing ecc as 0 to this function, but you may
want to drop mipi_dsi_create_packet() above and just hardcode 0 here.

>  
> -	p = data;
> -	for (i = 0; i < len >> 2; i++) {
> +	p = msg->tx_buf;
> +	for (i = 0; i < msg->tx_len >> 2; i++) {
>  		if (dsi->debug_write)
>  			DSSDBG("\tsending full packet %d\n", i);
>  
> @@ -2631,10 +2637,10 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
>  		b3 = *p++;
>  		b4 = *p++;
>  
> -		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, b4);
> +		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
>  	}
>  
> -	i = len % 4;
> +	i = msg->tx_len % 4;
>  	if (i) {
>  		b1 = 0; b2 = 0; b3 = 0;
>  
> @@ -2656,64 +2662,64 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
>  			break;
>  		}
>  
> -		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, 0);
> +		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
>  	}
>  
>  	return r;
>  }
>  
> -static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
> -			     u16 data, u8 ecc)
> +static int dsi_vc_send_short(struct dsi_data *dsi,
> +			     const struct mipi_dsi_msg *msg)
>  {
> +	struct mipi_dsi_packet pkg;

s/pkg/pkt/ (or packet)

>  	u32 r;
> -	u8 data_id;
> +
> +	r = mipi_dsi_create_packet(&pkg, msg);
> +	if (r < 0)
> +		return r;
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	if (dsi->debug_write)
>  		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
> -				channel,
> -				data_type, data & 0xff, (data >> 8) & 0xff);
> +				msg->channel,
> +				msg->type, pkg.header[1], pkg.header[2]);
>  
> -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
> +	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
>  
> -	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(channel)), 16, 16)) {
> +	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
>  		DSSERR("ERROR FIFO FULL, aborting transfer\n");
>  		return -EINVAL;
>  	}
>  
> -	data_id = data_type | channel << 6;
> -
> -	r = (data_id << 0) | (data << 8) | (ecc << 24);
> +	r = pkg.header[3] << 24 | pkg.header[2] << 16 | pkg.header[1] << 8 |
> +	    pkg.header[0];

OK, this justifies using mipi_dsi_create_packet(), so you can skip the
related comments in earlier patches.

> -	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel), r);
> +	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
>  
>  	return 0;
>  }
>  
>  static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
>  {
> -	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
> +	const struct mipi_dsi_msg msg = {
> +		.channel = channel,
> +		.type = MIPI_DSI_NULL_PACKET,
> +	};
> +
> +	return dsi_vc_send_long(dsi, &msg);
>  }
>  
>  static int dsi_vc_write_common(struct omap_dss_device *dssdev,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	struct mipi_dsi_packet packet;
>  	int r;
>  
> -	r = mipi_dsi_create_packet(&packet, msg);
> -	if (r < 0)
> -		return r;
> -
> -	if (mipi_dsi_packet_format_is_short(msg->type)) {
> -		u16 data = packet.header[1] | (packet.header[2] << 8);
> -		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> -	} else {
> -		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
> -						   msg->tx_buf, msg->tx_len, 0);
> -	}
> +	if (mipi_dsi_packet_format_is_short(msg->type))
> +		r = dsi_vc_send_short(dsi, msg);
> +	else
> +		r = dsi_vc_send_long(dsi, msg);
>  
>  	if (r < 0)
>  		return r;
> @@ -2853,10 +2859,10 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
>  			   const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	u8 cmd = ((u8*) msg->tx_buf)[0];
>  	int r;
> -	u8 dcs_cmd = ((u8*) msg->tx_buf)[0];
>  
> -	r = dsi_vc_send_short(dsi, msg->channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
> +	r = dsi_vc_send_short(dsi, msg);
>  	if (r)
>  		goto err;
>  
> @@ -2877,7 +2883,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
>  	return 0;
>  err:
>  	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n",
> -		msg->channel, dcs_cmd);
> +		msg->channel, cmd);
>  	return r;
>  }
>  
> @@ -2885,17 +2891,9 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	struct mipi_dsi_packet packet;
> -	u16 data;
>  	int r;
>  
> -	r = mipi_dsi_create_packet(&packet, msg);
> -	if (r < 0)
> -		goto err;
> -
> -	data = packet.header[1] | (packet.header[2] << 8);
> -
> -	r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> +	r = dsi_vc_send_short(dsi, msg);
>  	if (r)
>  		goto err;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
