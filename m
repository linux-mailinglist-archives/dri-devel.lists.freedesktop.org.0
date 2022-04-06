Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467624F6A50
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6F10E21C;
	Wed,  6 Apr 2022 19:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6276D10E21C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:47:27 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBcj-0003wG-SP; Wed, 06 Apr 2022 21:47:25 +0200
Message-ID: <840ceb028f4cb6b0a22f9fb5409bd674a849ed3c.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/7] drm: mxsfb: Factor out mxsfb_set_mode()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:47:24 +0200
In-Reply-To: <20220311170601.50995-5-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-5-marex@denx.de>
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
> Pull mode registers programming from mxsfb_enable_controller() into
> dedicated function mxsfb_set_mode(). This is a clean up. No functional
> change.

This one however looks like over-factorization to me. Why pull out a
mode_set function out of a mode_set function?

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 96 +++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 7b0abd0472aae..14f5cc590a51b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -111,6 +111,57 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
>  	writel(ctrl, mxsfb->base + LCDC_CTRL);
>  }
>  
> +static void mxsfb_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
> +{
> +	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
> +	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
> +
> +	writel(TRANSFER_COUNT_SET_VCOUNT(m->crtc_vdisplay) |
> +	       TRANSFER_COUNT_SET_HCOUNT(m->crtc_hdisplay),
> +	       mxsfb->base + mxsfb->devdata->transfer_count);
> +
> +	vsync_pulse_len = m->crtc_vsync_end - m->crtc_vsync_start;
> +
> +	vdctrl0 = VDCTRL0_ENABLE_PRESENT |	/* Always in DOTCLOCK mode */
> +		  VDCTRL0_VSYNC_PERIOD_UNIT |
> +		  VDCTRL0_VSYNC_PULSE_WIDTH_UNIT |
> +		  VDCTRL0_SET_VSYNC_PULSE_WIDTH(vsync_pulse_len);
> +	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> +		vdctrl0 |= VDCTRL0_HSYNC_ACT_HIGH;
> +	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> +		vdctrl0 |= VDCTRL0_VSYNC_ACT_HIGH;
> +	/* Make sure Data Enable is high active by default */
> +	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
> +		vdctrl0 |= VDCTRL0_ENABLE_ACT_HIGH;
> +	/*
> +	 * DRM_BUS_FLAG_PIXDATA_DRIVE_ defines are controller centric,
> +	 * controllers VDCTRL0_DOTCLK is display centric.
> +	 * Drive on positive edge       -> display samples on falling edge
> +	 * DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE -> VDCTRL0_DOTCLK_ACT_FALLING
> +	 */
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> +		vdctrl0 |= VDCTRL0_DOTCLK_ACT_FALLING;
> +
> +	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
> +
> +	/* Frame length in lines. */
> +	writel(m->crtc_vtotal, mxsfb->base + LCDC_VDCTRL1);
> +
> +	/* Line length in units of clocks or pixels. */
> +	hsync_pulse_len = m->crtc_hsync_end - m->crtc_hsync_start;
> +	writel(set_hsync_pulse_width(mxsfb, hsync_pulse_len) |
> +	       VDCTRL2_SET_HSYNC_PERIOD(m->crtc_htotal),
> +	       mxsfb->base + LCDC_VDCTRL2);
> +
> +	writel(SET_HOR_WAIT_CNT(m->crtc_htotal - m->crtc_hsync_start) |
> +	       SET_VERT_WAIT_CNT(m->crtc_vtotal - m->crtc_vsync_start),
> +	       mxsfb->base + LCDC_VDCTRL3);
> +
> +	writel(SET_DOTCLK_H_VALID_DATA_CNT(m->hdisplay),
> +	       mxsfb->base + LCDC_VDCTRL4);
> +
> +}
> +
>  static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
>  {
>  	u32 reg;
> @@ -236,7 +287,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  	struct drm_device *drm = mxsfb->crtc.dev;
>  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
>  	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
> -	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
>  	int err;
>  
>  	/* Mandatory eLCDIF reset as per the Reference Manual */
> @@ -256,49 +306,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  			     bus_flags);
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
>  
> -	writel(TRANSFER_COUNT_SET_VCOUNT(m->crtc_vdisplay) |
> -	       TRANSFER_COUNT_SET_HCOUNT(m->crtc_hdisplay),
> -	       mxsfb->base + mxsfb->devdata->transfer_count);
> -
> -	vsync_pulse_len = m->crtc_vsync_end - m->crtc_vsync_start;
> -
> -	vdctrl0 = VDCTRL0_ENABLE_PRESENT |	/* Always in DOTCLOCK mode */
> -		  VDCTRL0_VSYNC_PERIOD_UNIT |
> -		  VDCTRL0_VSYNC_PULSE_WIDTH_UNIT |
> -		  VDCTRL0_SET_VSYNC_PULSE_WIDTH(vsync_pulse_len);
> -	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> -		vdctrl0 |= VDCTRL0_HSYNC_ACT_HIGH;
> -	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> -		vdctrl0 |= VDCTRL0_VSYNC_ACT_HIGH;
> -	/* Make sure Data Enable is high active by default */
> -	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
> -		vdctrl0 |= VDCTRL0_ENABLE_ACT_HIGH;
> -	/*
> -	 * DRM_BUS_FLAG_PIXDATA_DRIVE_ defines are controller centric,
> -	 * controllers VDCTRL0_DOTCLK is display centric.
> -	 * Drive on positive edge       -> display samples on falling edge
> -	 * DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE -> VDCTRL0_DOTCLK_ACT_FALLING
> -	 */
> -	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> -		vdctrl0 |= VDCTRL0_DOTCLK_ACT_FALLING;
> -
> -	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
> -
> -	/* Frame length in lines. */
> -	writel(m->crtc_vtotal, mxsfb->base + LCDC_VDCTRL1);
> -
> -	/* Line length in units of clocks or pixels. */
> -	hsync_pulse_len = m->crtc_hsync_end - m->crtc_hsync_start;
> -	writel(set_hsync_pulse_width(mxsfb, hsync_pulse_len) |
> -	       VDCTRL2_SET_HSYNC_PERIOD(m->crtc_htotal),
> -	       mxsfb->base + LCDC_VDCTRL2);
> -
> -	writel(SET_HOR_WAIT_CNT(m->crtc_htotal - m->crtc_hsync_start) |
> -	       SET_VERT_WAIT_CNT(m->crtc_vtotal - m->crtc_vsync_start),
> -	       mxsfb->base + LCDC_VDCTRL3);
> -
> -	writel(SET_DOTCLK_H_VALID_DATA_CNT(m->hdisplay),
> -	       mxsfb->base + LCDC_VDCTRL4);
> +	mxsfb_set_mode(mxsfb, bus_flags);
>  }
>  
>  static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,


