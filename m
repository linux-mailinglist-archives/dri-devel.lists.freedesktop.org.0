Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6F3AE8A2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9175789F43;
	Mon, 21 Jun 2021 12:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51089F43
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:03:22 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lvIe8-0003TQ-JP; Mon, 21 Jun 2021 14:03:20 +0200
Message-ID: <233fa81bb6a8f03a0391700eedb83c3d18a489d2.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Enable recovery on underflow
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 21 Jun 2021 14:03:18 +0200
In-Reply-To: <20210620224701.189289-1-marex@denx.de>
References: <20210620224701.189289-1-marex@denx.de>
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

Am Montag, dem 21.06.2021 um 00:47 +0200 schrieb Marek Vasut:
> There is some sort of corner case behavior of the controller,
> which could rarely be triggered at least on i.MX6SX connected
> to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
> bridged 1920x1080 panel (and likely on other setups too), where
> the image on the panel shifts to the right and wraps around.
> This happens either when the controller is enabled on boot or
> even later during run time. The condition does not correct
> itself automatically, i.e. the display image remains shifted.
> 
> It seems this problem is known and is due to sporadic underflows
> of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
> IRQs, neither of the IRQs trigger and neither IRQ status bit is
> asserted when this condition occurs.
> 
> All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
> bit, which is described in the reference manual since i.MX23 as
> "
>   Set this bit to enable the LCDIF block to recover in the next
>   field/frame if there was an underflow in the current field/frame.
> "
> Enable this bit to mitigate the sporadic underflows.
> 
> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 300e7bab0f43..01e0f525360f 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -115,6 +115,35 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
>  	reg |= VDCTRL4_SYNC_SIGNALS_ON;
>  	writel(reg, mxsfb->base + LCDC_VDCTRL4);
>  
> +	/*
> +	 * Enable recovery on underflow.
> +	 *
> +	 * There is some sort of corner case behavior of the controller,
> +	 * which could rarely be triggered at least on i.MX6SX connected
> +	 * to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
> +	 * bridged 1920x1080 panel (and likely on other setups too), where
> +	 * the image on the panel shifts to the right and wraps around.
> +	 * This happens either when the controller is enabled on boot or
> +	 * even later during run time. The condition does not correct
> +	 * itself automatically, i.e. the display image remains shifted.
> +	 *
> +	 * It seems this problem is known and is due to sporadic underflows
> +	 * of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
> +	 * IRQs, neither of the IRQs trigger and neither IRQ status bit is
> +	 * asserted when this condition occurs.
> +	 *
> +	 * All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
> +	 * bit, which is described in the reference manual since i.MX23 as
> +	 * "
> +	 *   Set this bit to enable the LCDIF block to recover in the next
> +	 *   field/frame if there was an underflow in the current field/frame.
> +	 * "
> +	 * Enable this bit to mitigate the sporadic underflows.
> +	 */
> +	reg = readl(mxsfb->base + LCDC_CTRL1);
> +	reg |= CTRL1_RECOVER_ON_UNDERFLOW;
> +	writel(reg, mxsfb->base + LCDC_CTRL1);
> +
>  	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
>  }
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 55d28a27f912..df90e960f495 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -54,6 +54,7 @@
>  #define CTRL_DF24			BIT(1)
>  #define CTRL_RUN			BIT(0)
>  
> +#define CTRL1_RECOVER_ON_UNDERFLOW	BIT(24)
>  #define CTRL1_FIFO_CLEAR		BIT(21)
>  #define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
>  #define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)


