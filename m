Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6E1900A4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7F89DFB;
	Mon, 23 Mar 2020 21:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BDA89DFB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:48:31 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id C69025C0BDA;
 Mon, 23 Mar 2020 22:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585000109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzjjaJfxuC5Z92eyQDHinovJ6jh9cpCUmSDYHoXp8OQ=;
 b=QXwueG9yvnkyP+Qr2IFXhWdT+tc5WeARZil+6O0NaudfSCvqsibiiu/gaEraUF2QKxlZIz
 J8ymvfwRCK/U9n/Mm0IMRtStlbU9rBQbTBRUlu7wQDkyHajlbu9CrXFiV/am9/EmexiFKQ
 KuXaJyUbClMT1ZD2HsnWiHwhnyROmSY=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:48:29 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 07/21] drm: mxsfb: Use LCDC_CTRL register name explicitly
In-Reply-To: <20200309195216.31042-8-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-8-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <5256321c0cd91274682b43567d1d8e7e@agner.ch>
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
> The LCDC_CTRL register is located at address 0x0000. Some of the
> accesses to the register simply use the mxsfb->base address. Reference
> the LCDC_CTRL register explicitly instead to clarify the code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index be60c4021e2f..722bd9b4f5f9 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -170,17 +170,17 @@ static int mxsfb_reset_block(struct
> mxsfb_drm_private *mxsfb)
>  {
>  	int ret;
>  
> -	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
> +	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
>  	if (ret)
>  		return ret;
>  
> -	writel(MODULE_CLKGATE, mxsfb->base + MXS_CLR_ADDR);
> +	writel(MODULE_CLKGATE, mxsfb->base + LCDC_CTRL + MXS_CLR_ADDR);
>  
> -	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
> +	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
>  	if (ret)
>  		return ret;
>  
> -	return clear_poll_bit(mxsfb->base, MODULE_CLKGATE);
> +	return clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_CLKGATE);
>  }
>  
>  static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
