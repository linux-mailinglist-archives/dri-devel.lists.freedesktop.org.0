Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20E2C8187
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80716E43B;
	Mon, 30 Nov 2020 09:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0C26E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:58:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F19097E;
 Mon, 30 Nov 2020 10:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606730325;
 bh=29rCaewU6H90h0jxG4NaznIUmWb2VGw7zyBBFZeo/v0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uy2xkJsXaiCbNjJU6W8ZXHRH1PSkctNX6z/ZIqCTMXu0z4Fzwp0C10raetJ77B8Nq
 mh1hjZcaTLczlZAsgpTI/ZwkyVKuhFDkvCG7vjlEQ7qQ8hpDxBe8iFuzeqOqQmglOQ
 S+i0v+k7fyaORNzs2jb/183yLamRGyPd5lA3PBLI=
Date: Mon, 30 Nov 2020 11:58:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 61/80] drm/omap: dsi: send nop instead of page & column
Message-ID: <20201130095837.GM4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-62-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-62-tomi.valkeinen@ti.com>
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
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:19PM +0200, Tomi Valkeinen wrote:
> The OMAP DSI command mode panel driver used to send page & column
> address before each frame update, and this code was moved into the DSI
> host driver when converting it to the DRM bridge model.
> 
> However, it's not really required to send the page & column address
> before each frame. It's also something that doesn't really belong to the
> DSI host driver, so we should drop the code.
> 
> That said, frame updates break if we don't send _something_ between the
> frames. A NOP command does the trick.
> 
> It is not clear if this behavior is as expected from a DSI command mode
> frame transfer, or is it a feature/issue with OMAP DSI driver, or a
> feature/issue in the command mode panel used. So this probably needs to
> be revisited later.

This is important information, could you capture it in a comment in the
code ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 41 +++++++++----------------------
>  1 file changed, 12 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 7fee9cf8782d..746c2149fbbd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3884,35 +3884,19 @@ static int _dsi_update(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static int _dsi_update_window(struct dsi_data *dsi, int channel,
> -			      int x, int y, int w, int h)
> -{
> -	int x1 = x, x2 = (x + w - 1);
> -	int y1 = y, y2 = (y + h - 1);
> -	u8 payloadX[5] = { MIPI_DCS_SET_COLUMN_ADDRESS,
> -			   x1 >> 8, x1 & 0xff, x2 >> 8, x2 & 0xff };
> -	u8 payloadY[5] = { MIPI_DCS_SET_PAGE_ADDRESS,
> -			   y1 >> 8, y1 & 0xff, y2 >> 8, y2 & 0xff };
> -	struct mipi_dsi_msg msgX = { 0 }, msgY = { 0 };
> -	int ret;
> +static int _dsi_send_nop(struct dsi_data *dsi, int channel)
> +{
> +	const u8 payload[] = { MIPI_DCS_NOP };
> +	const struct mipi_dsi_msg msg = {
> +		.channel = channel,
> +		.type = MIPI_DSI_DCS_SHORT_WRITE,
> +		.tx_len = 1,
> +		.tx_buf = payload,
> +	};
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	msgX.type = MIPI_DSI_DCS_LONG_WRITE;
> -	msgX.channel = channel;
> -	msgX.tx_buf = payloadX;
> -	msgX.tx_len = sizeof(payloadX);
> -
> -	msgY.type = MIPI_DSI_DCS_LONG_WRITE;
> -	msgY.channel = channel;
> -	msgY.tx_buf = payloadY;
> -	msgY.tx_len = sizeof(payloadY);
> -
> -	ret = _omap_dsi_host_transfer(dsi, &msgX);
> -	if (ret != 0)
> -		return ret;
> -
> -	return _omap_dsi_host_transfer(dsi, &msgY);
> +	return _omap_dsi_host_transfer(dsi, &msg);
>  }
>  
>  static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
> @@ -3944,10 +3928,9 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  
>  	dsi_set_ulps_auto(dsi, false);
>  
> -	r = _dsi_update_window(dsi, channel, 0, 0, dsi->vm.hactive,
> -			       dsi->vm.vactive);
> +	r = _dsi_send_nop(dsi, channel);
>  	if (r < 0) {
> -		DSSWARN("window update error: %d\n", r);
> +		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
>  	}
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
