Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A914F6A2D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EB110E206;
	Wed,  6 Apr 2022 19:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546D10E168
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:42:38 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBY5-0003VH-97; Wed, 06 Apr 2022 21:42:37 +0200
Message-ID: <887fd2ce405ec816627ae298e57f79403c825cc7.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/7] drm: mxsfb: Wrap FIFO reset and comments into
 mxsfb_reset_block()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:42:36 +0200
In-Reply-To: <20220311170601.50995-3-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-3-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> Wrap FIFO reset and comments into mxsfb_reset_block(), this is a clean up.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 36 +++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 657b6afbbf1f9..015b289d93a3c 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -183,6 +183,12 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
>  {
>  	int ret;
>  
> +	/*
> +	 * It seems, you can't re-program the controller if it is still
> +	 * running. This may lead to shifted pictures (FIFO issue?), so
> +	 * first stop the controller and drain its FIFOs.
> +	 */
> +
>  	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_SFTRST);
>  	if (ret)
>  		return ret;
> @@ -193,7 +199,20 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
>  	if (ret)
>  		return ret;
>  
> -	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
> +	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
> +	if (ret)
> +		return ret;
> +
> +	/* Clear the FIFOs */
> +	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
> +	readl(mxsfb->base + LCDC_CTRL1);
> +	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> +	readl(mxsfb->base + LCDC_CTRL1);
> +
> +	if (mxsfb->devdata->has_overlay)
> +		writel(0, mxsfb->base + LCDC_AS_CTRL);
> +
> +	return 0;
>  }
>  
>  static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
> @@ -220,26 +239,11 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
>  	int err;
>  
> -	/*
> -	 * It seems, you can't re-program the controller if it is still
> -	 * running. This may lead to shifted pictures (FIFO issue?), so
> -	 * first stop the controller and drain its FIFOs.
> -	 */
> -
>  	/* Mandatory eLCDIF reset as per the Reference Manual */
>  	err = mxsfb_reset_block(mxsfb);
>  	if (err)
>  		return;
>  
> -	/* Clear the FIFOs */
> -	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
> -	readl(mxsfb->base + LCDC_CTRL1);
> -	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> -	readl(mxsfb->base + LCDC_CTRL1);
> -
> -	if (mxsfb->devdata->has_overlay)
> -		writel(0, mxsfb->base + LCDC_AS_CTRL);
> -
>  	mxsfb_set_formats(mxsfb, bus_format);
>  
>  	if (mxsfb->bridge && mxsfb->bridge->timings)


