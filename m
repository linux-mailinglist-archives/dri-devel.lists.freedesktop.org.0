Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE3A1901F4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD36E42B;
	Mon, 23 Mar 2020 23:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DD06E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:34:30 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 022C65C0BDA;
 Tue, 24 Mar 2020 00:34:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585006469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAhggKbDEqpIMXdIERMoPqlW2CtZCLw6b2+EJ7q4tG4=;
 b=iAIp50GD5eTvkITbz6RqGvvjLHKK72vs3m4eOcBbyQl8V4b+t+HqVbnV4SirnL5ncsopPx
 heRMCnHQckn/ViIqw/LdpExc5aUWmuztgzip163lqkPni9tXvUHHIMbvWgvB6ESW87vuKL
 KIkyg2aphiI8bIy9EdDVR+E7u+ypW0I=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:34:28 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 20/21] drm: mxsfb: Merge mxsfb_set_pixel_fmt() and
 mxsfb_set_bus_fmt()
In-Reply-To: <20200309195216.31042-21-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-21-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <ac95b58bf0574cf14840997466c8c9dd@agner.ch>
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
> The mxsfb_set_pixel_fmt() and mxsfb_set_bus_fmt() functions both deal
> with format configuration, are always called in a row from
> mxsfb_crtc_mode_set_nofb(), and set fields from the LCDC_CTRL register.
> This requires a read-modify-update cycle in mxsfb_set_bus_fmt(). Make
> this more efficient by merging them together.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 47 +++++++++++++------------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 19b937b383cf..f81f8c222c13 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -42,13 +42,23 @@ static u32 set_hsync_pulse_width(struct
> mxsfb_drm_private *mxsfb, u32 val)
>  		mxsfb->devdata->hs_wdth_shift;
>  }
>  
> -/* Setup the MXSFB registers for decoding the pixels out of the framebuffer */
> -static void mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
> +/*
> + * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
> + * outputting them on the bus.
> + */
> +static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
>  {
>  	struct drm_device *drm = mxsfb->drm;
>  	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
> +	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  	u32 ctrl, ctrl1;
>  
> +	if (mxsfb->connector->display_info.num_bus_formats)
> +		bus_format = mxsfb->connector->display_info.bus_formats[0];
> +
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
> +			     bus_format);
> +
>  	ctrl = CTRL_BYPASS_COUNT | CTRL_MASTER;
>  
>  	/* CTRL1 contains IRQ config and status bits, preserve those. */
> @@ -69,40 +79,23 @@ static void mxsfb_set_pixel_fmt(struct
> mxsfb_drm_private *mxsfb)
>  		break;
>  	}
>  
> -	writel(ctrl1, mxsfb->base + LCDC_CTRL1);
> -	writel(ctrl, mxsfb->base + LCDC_CTRL);
> -}
> -
> -static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
> -{
> -	struct drm_device *drm = mxsfb->drm;
> -	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> -	u32 reg;
> -
> -	reg = readl(mxsfb->base + LCDC_CTRL);
> -
> -	if (mxsfb->connector->display_info.num_bus_formats)
> -		bus_format = mxsfb->connector->display_info.bus_formats[0];
> -
> -	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
> -			     bus_format);
> -
> -	reg &= ~CTRL_BUS_WIDTH_MASK;
>  	switch (bus_format) {
>  	case MEDIA_BUS_FMT_RGB565_1X16:
> -		reg |= CTRL_BUS_WIDTH_16;
> +		ctrl |= CTRL_BUS_WIDTH_16;
>  		break;
>  	case MEDIA_BUS_FMT_RGB666_1X18:
> -		reg |= CTRL_BUS_WIDTH_18;
> +		ctrl |= CTRL_BUS_WIDTH_18;
>  		break;
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> -		reg |= CTRL_BUS_WIDTH_24;
> +		ctrl |= CTRL_BUS_WIDTH_24;
>  		break;
>  	default:
>  		dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
>  		break;
>  	}
> -	writel(reg, mxsfb->base + LCDC_CTRL);
> +
> +	writel(ctrl1, mxsfb->base + LCDC_CTRL1);
> +	writel(ctrl, mxsfb->base + LCDC_CTRL);
>  }
>  
>  static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
> @@ -213,7 +206,7 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb)
>  	/* Clear the FIFOs */
>  	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
>  
> -	mxsfb_set_pixel_fmt(mxsfb);
> +	mxsfb_set_formats(mxsfb);
>  
>  	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
>  
> @@ -255,8 +248,6 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb)
>  
>  	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
>  
> -	mxsfb_set_bus_fmt(mxsfb);
> -
>  	/* Frame length in lines. */
>  	writel(m->crtc_vtotal, mxsfb->base + LCDC_VDCTRL1);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
