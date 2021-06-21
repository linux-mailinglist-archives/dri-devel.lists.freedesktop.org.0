Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFC3AE8C4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA55A89D87;
	Mon, 21 Jun 2021 12:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB77B89D87
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:08:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lvIjE-00043O-GS; Mon, 21 Jun 2021 14:08:36 +0200
Message-ID: <71e8d748b8dff1ecbf9e8905213a5b15e1019c4c.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Increase number of outstanding requests on
 V4 and newer HW
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 21 Jun 2021 14:08:35 +0200
In-Reply-To: <20210620224759.189351-1-marex@denx.de>
References: <20210620224759.189351-1-marex@denx.de>
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
> In case the DRAM is under high load, the MXSFB FIFO might underflow
> and that causes visible artifacts. This could be triggered on i.MX8MM
> using e.g. "$ memtester 128M" on a device with 1920x1080 panel. The
> first "Stuck Address" test of the memtester will completely corrupt
> the image on the panel and leave the MXSFB FIFO in odd state.
> 
> To avoid this underflow, increase number of outstanding requests to
> DRAM from 2 to 16, which is the maximum. This mitigates the issue
> and it can no longer be triggered.
> 
I see the obvious benefit of this change, but I'm not sure if enabling
this on older SoCs is without any drawbacks. The newer SoCs have a good
transaction scheduling on the NOC (i.MX8M) or at least a somewhat okay
one in the DRAM controller (i.MX6). I'm not so sure about the older
SoCs, where I could imagine too many outstanding transactions to delay
memory traffic for other masters on the SoC.

You don't happen to have any experience with this on the older SoCs, do
you?

Regards,
Lucas

> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 3 +++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h  | 1 +
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 8 ++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 8 ++++++++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 6da93551e2e5..c277d3f61a5e 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -51,6 +51,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_mask	= 0xff,
>  		.hs_wdth_shift	= 24,
>  		.has_overlay	= false,
> +		.has_ctrl2	= false,
>  	},
>  	[MXSFB_V4] = {
>  		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
> @@ -59,6 +60,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_mask	= 0x3fff,
>  		.hs_wdth_shift	= 18,
>  		.has_overlay	= false,
> +		.has_ctrl2	= true,
>  	},
>  	[MXSFB_V6] = {
>  		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
> @@ -67,6 +69,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_mask	= 0x3fff,
>  		.hs_wdth_shift	= 18,
>  		.has_overlay	= true,
> +		.has_ctrl2	= true,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index 399d23e91ed1..7c720e226fdf 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -22,6 +22,7 @@ struct mxsfb_devdata {
>  	unsigned int	hs_wdth_mask;
>  	unsigned int	hs_wdth_shift;
>  	bool		has_overlay;
> +	bool		has_ctrl2;
>  };
>  
>  struct mxsfb_drm_private {
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 01e0f525360f..5bcc06c1ac0b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -107,6 +107,14 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
>  		clk_prepare_enable(mxsfb->clk_disp_axi);
>  	clk_prepare_enable(mxsfb->clk);
>  
> +	/* Increase number of outstanding requests on all supported IPs */
> +	if (mxsfb->devdata->has_ctrl2) {
> +		reg = readl(mxsfb->base + LCDC_V4_CTRL2);
> +		reg &= ~CTRL2_SET_OUTSTANDING_REQS_MASK;
> +		reg |= CTRL2_SET_OUTSTANDING_REQS_16;
> +		writel(reg, mxsfb->base + LCDC_V4_CTRL2);
> +	}
> +
>  	/* If it was disabled, re-enable the mode again */
>  	writel(CTRL_DOTCLK_MODE, mxsfb->base + LCDC_CTRL + REG_SET);
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index df90e960f495..694fea13e893 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -15,6 +15,7 @@
>  #define LCDC_CTRL			0x00
>  #define LCDC_CTRL1			0x10
>  #define LCDC_V3_TRANSFER_COUNT		0x20
> +#define LCDC_V4_CTRL2			0x20
>  #define LCDC_V4_TRANSFER_COUNT		0x30
>  #define LCDC_V4_CUR_BUF			0x40
>  #define LCDC_V4_NEXT_BUF		0x50
> @@ -61,6 +62,13 @@
>  #define CTRL1_CUR_FRAME_DONE_IRQ_EN	BIT(13)
>  #define CTRL1_CUR_FRAME_DONE_IRQ	BIT(9)
>  
> +#define CTRL2_SET_OUTSTANDING_REQS_1	0
> +#define CTRL2_SET_OUTSTANDING_REQS_2	(0x1 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_4	(0x2 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_8	(0x3 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_16	(0x4 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_MASK	(0x7 << 21)
> +
>  #define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
>  #define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
>  #define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)


