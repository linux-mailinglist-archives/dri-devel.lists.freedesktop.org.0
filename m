Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B80B1901DA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9815C6E057;
	Mon, 23 Mar 2020 23:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39FD6E057
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:28:36 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 4DE975C061C;
 Tue, 24 Mar 2020 00:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585006115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/y2/8EA3VGtvgzGCZB6RODIMiFh+K+MZ0GILVVTv614=;
 b=oXmZmzHUBcJvT4p3chb4/SIYLINopWYa3oVYJpCT9sSMFvgL2PIzsWS/4Ul9tpk3ybCepH
 GX7VUZb3zUREAZ3z+nJd8922+Zq0odD9vczj1+headubJcCOWfFL9fxS0KrCssNSKTvjyt
 4oVGJ8phrTitn+fLcqn6BIxS7NfUHJ0=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:28:35 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 19/21] drm: mxsfb: Turn mxsfb_set_pixel_fmt() into a void
 function
In-Reply-To: <20200309195216.31042-20-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-20-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <374de23136555cedf3180b988f4ecc1b@agner.ch>
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
> The mxsfb_set_pixel_fmt() function returns an error when the selected
> pixel format is unsupported. This can never happen, as such errors are
> caught by the DRM core. Remove the error check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I see, we specify the supported plane formats when initializing the
primary/overlay plane.

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 640305fb1068..19b937b383cf 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -43,7 +43,7 @@ static u32 set_hsync_pulse_width(struct
> mxsfb_drm_private *mxsfb, u32 val)
>  }
>  
>  /* Setup the MXSFB registers for decoding the pixels out of the framebuffer */
> -static int mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
> +static void mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
>  {
>  	struct drm_device *drm = mxsfb->drm;
>  	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
> @@ -67,15 +67,10 @@ static int mxsfb_set_pixel_fmt(struct
> mxsfb_drm_private *mxsfb)
>  		/* Do not use packed pixels = one pixel per word instead. */
>  		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0x7);
>  		break;
> -	default:
> -		dev_err(drm->dev, "Unhandled pixel format %08x\n", format);
> -		return -EINVAL;
>  	}
>  
>  	writel(ctrl1, mxsfb->base + LCDC_CTRL1);
>  	writel(ctrl, mxsfb->base + LCDC_CTRL);
> -
> -	return 0;
>  }
>  
>  static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
> @@ -218,9 +213,7 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb)
>  	/* Clear the FIFOs */
>  	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
>  
> -	err = mxsfb_set_pixel_fmt(mxsfb);
> -	if (err)
> -		return;
> +	mxsfb_set_pixel_fmt(mxsfb);
>  
>  	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
