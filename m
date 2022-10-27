Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733760F1F6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3507410E359;
	Thu, 27 Oct 2022 08:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA7610E57D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:13:26 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ony0y-00066n-Tq; Thu, 27 Oct 2022 10:13:24 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ony0x-0006mL-Qu; Thu, 27 Oct 2022 10:13:23 +0200
Date: Thu, 27 Oct 2022 10:13:23 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Message-ID: <20221027081323.luobufjh3n4isiy7@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026212002.542375-1-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 22-10-26, Marek Vasut wrote:
> In case the LCDIFv3 is used to drive a 4k panel via i.MX8MP HDMI bridge,
> the LCDIFv3 becomes susceptible to FIFO underflows, which lead to nasty
> flicker of the image on the panel, or image being shifted by half frame
> horizontally every second frame. The flicker can be easily triggered by
> running 3D application on top of weston compositor, like neverball or
> chromium. Surprisingly glmark2-es2-wayland or glmark2-es2-drm does not
> trigger this effect so easily.
> 
> Configure the FIFO Panic threshold register and enable the FIFO Panic
> mode, which internally boosts the NoC interconnect priority for LCDIFv3
> transactions in case of possible underflow. This mitigates the flicker
> effect on 4k panels as well.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 15 +++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index a5302006c02cd..aee7babb5fa5c 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
>  	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>  	reg |= CTRLDESCL0_5_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE / 3) |
> +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_RANGE / 3),
> +	       lcdif->base + LCDC_V8_PANIC0_THRES);
> +
> +	/*
> +	 * Enable FIFO Panic, this does not generate interrupt, but
> +	 * boosts NoC priority based on FIFO Panic watermarks.
> +	 */
> +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
> +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);

Out of curiosity since we have a patch doing the exact same thing but
didn't saw any improvements. Is there a reason why you enabled it here?
We did this during lcdif_rpm_resume(). But as I said with a 1080P
display we still saw the flickering, it disappeared first after rising
the burst-size.

Regards,
  Marco

>  }
>  
>  static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
> @@ -348,6 +360,9 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
>  	u32 reg;
>  	int ret;
>  
> +	/* Disable FIFO Panic NoC priority booster. */
> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);
> +
>  	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>  	reg &= ~CTRLDESCL0_5_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> index fb74eb5ccbf1d..3d2f81d6f995e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -255,6 +255,7 @@
>  
>  #define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
>  #define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> +#define PANIC0_THRES_RANGE		512
>  
>  #define LCDIF_MIN_XRES			120
>  #define LCDIF_MIN_YRES			120
> -- 
> 2.35.1
> 
> 
