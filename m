Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F131900A7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392B86E1EE;
	Mon, 23 Mar 2020 21:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0389F0A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:49:36 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id C08E15C0BDA;
 Mon, 23 Mar 2020 22:49:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585000174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oE2VYisreWVhZMALr4RDsLEkG7NRFcFgto56W9Q/vDo=;
 b=ubTbR2GndmoVdvTFTixuOMfycb1wi5dFXeLjivBGBTJcPzMx3CqHCv5i72hCYJTz/tjEUL
 gNCpcTx7DBM4qAOc7rKBv0doI9l3KB75AtXzKUVp6erT543FJicRlno2KyeSLM56Q4y31W
 VztFl0h/VqhfMhgw/PM1p+0T2hTYb2g=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:49:34 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 08/21] drm: mxsfb: Remove register definitions from
 mxsfb_crtc.c
In-Reply-To: <20200309195216.31042-9-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-9-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <4395c847cf3986dac6889f7e77e77327@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:52, Laurent Pinchart wrote:
> mxsfb_crtc.c defines several macros related to register addresses and
> bit, which duplicates macros from mxsfb_regs.h. Use the macros from
> mxsfb_regs.h instead and remove them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index 722bd9b4f5f9..aef72adabf41 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -29,10 +29,6 @@
>  #include "mxsfb_drv.h"
>  #include "mxsfb_regs.h"
>  
> -#define MXS_SET_ADDR		0x4
> -#define MXS_CLR_ADDR		0x8
> -#define MODULE_CLKGATE		BIT(30)
> -#define MODULE_SFTRST		BIT(31)
>  /* 1 second delay should be plenty of time for block reset */
>  #define RESET_TIMEOUT		1000000
>  
> @@ -162,7 +158,7 @@ static int clear_poll_bit(void __iomem *addr, u32 mask)
>  {
>  	u32 reg;
>  
> -	writel(mask, addr + MXS_CLR_ADDR);
> +	writel(mask, addr + REG_CLR);
>  	return readl_poll_timeout(addr, reg, !(reg & mask), 0, RESET_TIMEOUT);
>  }
>  
> @@ -170,17 +166,17 @@ static int mxsfb_reset_block(struct
> mxsfb_drm_private *mxsfb)
>  {
>  	int ret;
>  
> -	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
> +	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_SFTRST);
>  	if (ret)
>  		return ret;
>  
> -	writel(MODULE_CLKGATE, mxsfb->base + LCDC_CTRL + MXS_CLR_ADDR);
> +	writel(CTRL_CLKGATE, mxsfb->base + LCDC_CTRL + REG_CLR);
>  
> -	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
> +	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_SFTRST);
>  	if (ret)
>  		return ret;
>  
> -	return clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_CLKGATE);
> +	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
>  }
>  
>  static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
