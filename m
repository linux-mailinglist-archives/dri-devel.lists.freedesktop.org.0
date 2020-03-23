Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D819008A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77AA6E3A6;
	Mon, 23 Mar 2020 21:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525496E3A6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:42:46 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id DD9DD5C0BDA;
 Mon, 23 Mar 2020 22:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1584999764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73ybX4IH8yguKLbN5lDW2NlzSfku1WeYhX6Of9VeBP0=;
 b=ejedYoKwgUGUsT1P7Zpxlg+9y3xInDQ7793ym0flI9+Sk8EjWJ+ySjJXJlETVz9wZel3RZ
 pnHF3o4htiKBtzKYGSmB+3iy7agLrnk44Ja5+gKqDJtQhr+xMSgNgLVNpDjaDLgWj3JRW8
 staxA3Z+oFDZs0Iucs4z+h5pHxLc3IQ=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:42:44 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 05/21] drm: mxsfb: Clarify format and bus width
 configuration
In-Reply-To: <20200309195216.31042-6-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-6-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <49c64da57bd2e9561e36320fdc3881d3@agner.ch>
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
> Replace the convoluted way to set the format and bus width through
> difficult to read macros with more explicit ones. Also remove the
> outdated comment related to the limitations on bus width setting as it

Nice catch.

> doesn't apply anymore (the bus width can be specified through the
> display_info bus format).

Reviewed-by: Stefan Agner <stefan@agner.ch>

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 17 +++++------------
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 17 ++++++++---------
>  2 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index b69ace8bf526..8b6339316929 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -52,13 +52,6 @@ static int mxsfb_set_pixel_fmt(struct
> mxsfb_drm_private *mxsfb)
>  
>  	ctrl = CTRL_BYPASS_COUNT | CTRL_MASTER;
>  
> -	/*
> -	 * WARNING: The bus width, CTRL_SET_BUS_WIDTH(), is configured to
> -	 * match the selected mode here. This differs from the original
> -	 * MXSFB driver, which had the option to configure the bus width
> -	 * to arbitrary value. This limitation should not pose an issue.
> -	 */
> -
>  	/* CTRL1 contains IRQ config and status bits, preserve those. */
>  	ctrl1 = readl(mxsfb->base + LCDC_CTRL1);
>  	ctrl1 &= CTRL1_CUR_FRAME_DONE_IRQ_EN | CTRL1_CUR_FRAME_DONE_IRQ;
> @@ -66,12 +59,12 @@ static int mxsfb_set_pixel_fmt(struct
> mxsfb_drm_private *mxsfb)
>  	switch (format) {
>  	case DRM_FORMAT_RGB565:
>  		dev_dbg(drm->dev, "Setting up RGB565 mode\n");
> -		ctrl |= CTRL_SET_WORD_LENGTH(0);
> +		ctrl |= CTRL_WORD_LENGTH_16;
>  		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0xf);
>  		break;
>  	case DRM_FORMAT_XRGB8888:
>  		dev_dbg(drm->dev, "Setting up XRGB8888 mode\n");
> -		ctrl |= CTRL_SET_WORD_LENGTH(3);
> +		ctrl |= CTRL_WORD_LENGTH_24;
>  		/* Do not use packed pixels = one pixel per word instead. */
>  		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0x7);
>  		break;
> @@ -104,13 +97,13 @@ static void mxsfb_set_bus_fmt(struct
> mxsfb_drm_private *mxsfb)
>  	reg &= ~CTRL_BUS_WIDTH_MASK;
>  	switch (bus_format) {
>  	case MEDIA_BUS_FMT_RGB565_1X16:
> -		reg |= CTRL_SET_BUS_WIDTH(STMLCDIF_16BIT);
> +		reg |= CTRL_BUS_WIDTH_16;
>  		break;
>  	case MEDIA_BUS_FMT_RGB666_1X18:
> -		reg |= CTRL_SET_BUS_WIDTH(STMLCDIF_18BIT);
> +		reg |= CTRL_BUS_WIDTH_18;
>  		break;
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> -		reg |= CTRL_SET_BUS_WIDTH(STMLCDIF_24BIT);
> +		reg |= CTRL_BUS_WIDTH_24;
>  		break;
>  	default:
>  		dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 78e6cb754712..8ebb52bb1b46 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -34,11 +34,15 @@
>  #define CTRL_VSYNC_MODE			BIT(18)
>  #define CTRL_DOTCLK_MODE		BIT(17)
>  #define CTRL_DATA_SELECT		BIT(16)
> -#define CTRL_SET_BUS_WIDTH(x)		(((x) & 0x3) << 10)
> -#define CTRL_GET_BUS_WIDTH(x)		(((x) >> 10) & 0x3)
> +#define CTRL_BUS_WIDTH_16		(0 << 10)
> +#define CTRL_BUS_WIDTH_8		(1 << 10)
> +#define CTRL_BUS_WIDTH_18		(2 << 10)
> +#define CTRL_BUS_WIDTH_24		(3 << 10)
>  #define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
> -#define CTRL_SET_WORD_LENGTH(x)		(((x) & 0x3) << 8)
> -#define CTRL_GET_WORD_LENGTH(x)		(((x) >> 8) & 0x3)
> +#define CTRL_WORD_LENGTH_16		(0 << 8)
> +#define CTRL_WORD_LENGTH_8		(1 << 8)
> +#define CTRL_WORD_LENGTH_18		(2 << 8)
> +#define CTRL_WORD_LENGTH_24		(3 << 8)
>  #define CTRL_MASTER			BIT(5)
>  #define CTRL_DF16			BIT(3)
>  #define CTRL_DF18			BIT(2)
> @@ -91,9 +95,4 @@
>  #define MXSFB_MAX_XRES			0xffff
>  #define MXSFB_MAX_YRES			0xffff
>  
> -#define STMLCDIF_8BIT  1 /* pixel data bus to the display is of 8 bit width */
> -#define STMLCDIF_16BIT 0 /* pixel data bus to the display is of 16 bit width */
> -#define STMLCDIF_18BIT 2 /* pixel data bus to the display is of 18 bit width */
> -#define STMLCDIF_24BIT 3 /* pixel data bus to the display is of 24 bit width */
> -
>  #endif /* __MXSFB_REGS_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
