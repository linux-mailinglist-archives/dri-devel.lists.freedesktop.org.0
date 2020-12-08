Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E992D2E6B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E75F89F4F;
	Tue,  8 Dec 2020 15:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEB889F4F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:39:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1A2CDD;
 Tue,  8 Dec 2020 16:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607441942;
 bh=oxGBl0qhCfC31wLvbdjXbKKJza8/O/Fx9cyBg+xs/C4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q4ltSuZ7mm9JBTACqp2fPmf/JaDt7MEnq1Z2d09B7RkGdJoLfigrj6Q/8I+20mRYB
 e+GrZ5WwvnGnoCGA7CNIIg9COa6s6W2KnRSegTjMoZ4tn8QHK2WFzFgEWuhvmzInlR
 V7INE7F1/NZsH3n0fGuKgPnYnDXYF1q2sckZw5W0=
Date: Tue, 8 Dec 2020 17:38:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 11/29] drm/omap: dsi: pass vc to various functions
Message-ID: <X8+eEwNnvSolerN3@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-12-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-12-tomi.valkeinen@ti.com>
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
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 02:28:37PM +0200, Tomi Valkeinen wrote:
> To start fixing the issues related to channels and vcs described in the
> previous commit, pass vc to various functions which will need it do
> properly handle different DSI channels and VCs.

This is a bit hard to review as you add the OMAP DSI VC as a parameter
(named vc) to some functions , and the MIPI DSI virtual channel as a
parameter (named channel) to other functions. Only the former matches
the commit message. Splitting this in two would make the changes
clearer. Still, I believe the patch is correct, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> No functional changes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 54 ++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 273159e8f992..8d8412199693 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -214,9 +214,9 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
>  static int dsi_display_init_dispc(struct dsi_data *dsi);
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi);
>  
> -static int dsi_vc_send_null(struct dsi_data *dsi, int vc);
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
>  
> -static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg);
>  
>  static void dsi_display_disable(struct omap_dss_device *dssdev);
> @@ -2455,7 +2455,7 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
> -		dsi_vc_send_null(dsi, vc);
> +		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
>  
>  	dsi->in_lp_mode = !enable;
>  }
> @@ -2605,7 +2605,8 @@ static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int vc)
>  }
>  
>  static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
> -					    u8 data_type, u16 len, u8 ecc)
> +					    int channel, u8 data_type, u16 len,
> +					    u8 ecc)
>  {
>  	u32 val;
>  	u8 data_id;
> @@ -2633,7 +2634,7 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int vc,
>  	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(vc), val);
>  }
>  
> -static int dsi_vc_send_long(struct dsi_data *dsi,
> +static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
>  			    const struct mipi_dsi_msg *msg)
>  {
>  	/*u32 val; */
> @@ -2653,7 +2654,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
>  
>  	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
>  
> -	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len, 0);
> +	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len, 0);
>  
>  	p = msg->tx_buf;
>  	for (i = 0; i < msg->tx_len >> 2; i++) {
> @@ -2696,7 +2697,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
>  	return r;
>  }
>  
> -static int dsi_vc_send_short(struct dsi_data *dsi,
> +static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
>  			     const struct mipi_dsi_msg *msg)
>  {
>  	struct mipi_dsi_packet pkt;
> @@ -2727,26 +2728,26 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
>  	return 0;
>  }
>  
> -static int dsi_vc_send_null(struct dsi_data *dsi, int vc)
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel)
>  {
>  	const struct mipi_dsi_msg msg = {
>  		.channel = vc,
>  		.type = MIPI_DSI_NULL_PACKET,
>  	};
>  
> -	return dsi_vc_send_long(dsi, &msg);
> +	return dsi_vc_send_long(dsi, vc, &msg);
>  }
>  
> -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> +static int dsi_vc_write_common(struct omap_dss_device *dssdev, int vc,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
>  	if (mipi_dsi_packet_format_is_short(msg->type))
> -		r = dsi_vc_send_short(dsi, msg);
> +		r = dsi_vc_send_short(dsi, vc, msg);
>  	else
> -		r = dsi_vc_send_long(dsi, msg);
> +		r = dsi_vc_send_long(dsi, vc, msg);
>  
>  	if (r < 0)
>  		return r;
> @@ -2882,7 +2883,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int vc, u8 *buf,
>  	return r;
>  }
>  
> -static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
> +static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int vc,
>  			   const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> @@ -2893,7 +2894,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
>  	if (dsi->debug_read)
>  		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
>  
> -	r = dsi_vc_send_short(dsi, msg);
> +	r = dsi_vc_send_short(dsi, vc, msg);
>  	if (r)
>  		goto err;
>  
> @@ -2917,13 +2918,13 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
>  	return r;
>  }
>  
> -static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
> +static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
> -	r = dsi_vc_send_short(dsi, msg);
> +	r = dsi_vc_send_short(dsi, vc, msg);
>  	if (r)
>  		goto err;
>  
> @@ -3672,7 +3673,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
>  
>  		word_count = DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
>  
> -		dsi_vc_write_long_header(dsi, vc, data_type,
> +		dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
>  				word_count, 0);
>  
>  		dsi_vc_enable(dsi, vc, true);
> @@ -3770,7 +3771,7 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  	l = FLD_VAL(total_len, 23, 0); /* TE_SIZE */
>  	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
>  
> -	dsi_vc_write_long_header(dsi, vc, MIPI_DSI_DCS_LONG_WRITE,
> +	dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, MIPI_DSI_DCS_LONG_WRITE,
>  		packet_len, 0);
>  
>  	if (dsi->te_enabled)
> @@ -3882,7 +3883,7 @@ static int _dsi_update(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static int _dsi_send_nop(struct dsi_data *dsi, int channel)
> +static int _dsi_send_nop(struct dsi_data *dsi, int vc, int channel)
>  {
>  	const u8 payload[] = { MIPI_DCS_NOP };
>  	const struct mipi_dsi_msg msg = {
> @@ -3894,7 +3895,7 @@ static int _dsi_send_nop(struct dsi_data *dsi, int channel)
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	return _omap_dsi_host_transfer(dsi, &msg);
> +	return _omap_dsi_host_transfer(dsi, vc, &msg);
>  }
>  
>  static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
> @@ -3923,7 +3924,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  	 * updates stop working. This is probably related to DSI spec stating
>  	 * that the DSI host should transition to LP at least once per frame.
>  	 */
> -	r = _dsi_send_nop(dsi, vc);
> +	r = _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
> @@ -4885,7 +4886,7 @@ static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
>  	}
>  }
>  
> -static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg)
>  {
>  	struct omap_dss_device *dssdev = &dsi->output;
> @@ -4905,15 +4906,15 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
>  	case MIPI_DSI_DCS_LONG_WRITE:
>  	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
>  	case MIPI_DSI_NULL_PACKET:
> -		r = dsi_vc_write_common(dssdev, msg);
> +		r = dsi_vc_write_common(dssdev, vc, msg);
>  		break;
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> -		r = dsi_vc_generic_read(dssdev, msg);
> +		r = dsi_vc_generic_read(dssdev, vc, msg);
>  		break;
>  	case MIPI_DSI_DCS_READ:
> -		r = dsi_vc_dcs_read(dssdev, msg);
> +		r = dsi_vc_dcs_read(dssdev, vc, msg);
>  		break;
>  	default:
>  		r = -EINVAL;
> @@ -4941,12 +4942,13 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
>  	int r;
> +	int vc = VC_DEFAULT;
>  
>  	dsi_bus_lock(dsi);
>  
>  	if (dsi->video_enabled) {
>  		dsi_set_ulps_auto(dsi, false);
> -		r = _omap_dsi_host_transfer(dsi, msg);
> +		r = _omap_dsi_host_transfer(dsi, vc, msg);
>  		dsi_set_ulps_auto(dsi, true);
>  	} else {
>  		r = -EIO;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
