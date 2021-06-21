Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68413AE8D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0421389F6B;
	Mon, 21 Jun 2021 12:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6589F6B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:13:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lvInV-0004mV-Fn; Mon, 21 Jun 2021 14:13:01 +0200
Message-ID: <4a9b6000cf9f1eb980c560da4d8ed3eb7b3723c7.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Use bus_format from the nearest bridge if
 present
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 21 Jun 2021 14:13:00 +0200
In-Reply-To: <20210620224918.189469-1-marex@denx.de>
References: <20210620224918.189469-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 21.06.2021 um 00:49 +0200 schrieb Marek Vasut:
> In case there is a bridge connected to the LCDIF, use bus_format
> from the bridge, otherwise behave as before and use bus_format
> from the connector. This way, even if there are multiple bridges
> in the display pipeline, the LCDIF will use the correct format.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 33 +++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 5bcc06c1ac0b..98d8ba0bae84 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -47,16 +47,13 @@ static u32 set_hsync_pulse_width(struct mxsfb_drm_private *mxsfb, u32 val)
>   * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
>   * outputting them on the bus.
>   */
> -static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
> +static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
> +			      const u32 bus_format)
>  {
>  	struct drm_device *drm = mxsfb->drm;
>  	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
> -	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  	u32 ctrl, ctrl1;
>  
> -	if (mxsfb->connector->display_info.num_bus_formats)
> -		bus_format = mxsfb->connector->display_info.bus_formats[0];
> -
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
>  			     bus_format);
>  
> @@ -222,7 +219,8 @@ static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
>  	return gem->paddr;
>  }
>  
> -static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
> +static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
> +				     const u32 bus_format)
>  {
>  	struct drm_device *drm = mxsfb->crtc.dev;
>  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
> @@ -247,7 +245,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
>  	if (mxsfb->devdata->has_overlay)
>  		writel(0, mxsfb->base + LCDC_AS_CTRL);
>  
> -	mxsfb_set_formats(mxsfb);
> +	mxsfb_set_formats(mxsfb, bus_format);
>  
>  	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
>  
> @@ -345,7 +343,9 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  				     struct drm_atomic_state *state)
>  {
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
> +	struct drm_bridge_state *bridge_state;
>  	struct drm_device *drm = mxsfb->drm;
> +	u32 bus_format = 0;
>  	dma_addr_t paddr;
>  
>  	pm_runtime_get_sync(drm->dev);
> @@ -353,7 +353,24 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	drm_crtc_vblank_on(crtc);
>  
> -	mxsfb_crtc_mode_set_nofb(mxsfb);
> +	/* If there is a bridge attached to the LCDIF, use its bus format */
> +	if (mxsfb->bridge && state) {
> +		bridge_state =
> +			drm_atomic_get_new_bridge_state(state,
> +							mxsfb->bridge);
> +		if (bridge_state)
> +			bus_format = bridge_state->input_bus_cfg.format;
> +	}
> +
> +	/* If there is no bridge, use bus format from connector */
> +	if (!bus_format && mxsfb->connector->display_info.num_bus_formats)
> +		bus_format = mxsfb->connector->display_info.bus_formats[0];
> +
> +	/* If all else fails, default to RGB888_1X24 */
> +	if (!bus_format)
> +		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
>  	paddr = mxsfb_get_fb_paddr(crtc->primary);


