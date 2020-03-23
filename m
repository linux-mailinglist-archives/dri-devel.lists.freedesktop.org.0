Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B2D1901C9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCE26E41D;
	Mon, 23 Mar 2020 23:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127766E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:20:51 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 9B20F5C061C;
 Tue, 24 Mar 2020 00:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585005649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ME2uFteKgH9PYBPF9Oi8ehn0DrL/JqFaIdGOvjepkbU=;
 b=QCIdhTeHdf8YUEA6S93r49BL5mBN5OJVczuVRarJyolXF2TWN8foI+nZdtXk6VGOE3SRNT
 cTsaR5vgt0PtoehmPtNxD8AOYz26oColyhBRDKH6DRUBXuCN2AWtYUSK9RNjxHIJGJqmgm
 dF1RaQWbDsxOyuMb33d8yzie12k1MUM=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:20:49 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 17/21] drm: mxsfb: Update internal IP version number for
 i.MX6SX
In-Reply-To: <20200309195216.31042-18-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-18-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <c18556835add2f976601612219006d61@agner.ch>
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
> The LCDIF present in the i.MX6SX has extra features compared to
> the i.MX28. It has however lost its IP version register, so no official
> version number is known. Bump the version to MXSFB_V6 following the i.MX
> version, in preparation for support for the additional features.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 7c9a041f5f6d..2316c12c5c42 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -35,6 +35,11 @@
>  enum mxsfb_devtype {
>  	MXSFB_V3,
>  	MXSFB_V4,
> +	/*
> +	 * Starting at i.MX6 the hardware version register is gone, use the
> +	 * i.MX family number as the version.
> +	 */
> +	MXSFB_V6,
>  };
>  
>  static const struct mxsfb_devdata mxsfb_devdata[] = {
> @@ -52,6 +57,13 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_mask	= 0x3fff,
>  		.hs_wdth_shift	= 18,
>  	},
> +	[MXSFB_V6] = {
> +		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
> +		.cur_buf	= LCDC_V4_CUR_BUF,
> +		.next_buf	= LCDC_V4_NEXT_BUF,
> +		.hs_wdth_mask	= 0x3fff,
> +		.hs_wdth_shift	= 18,
> +	},
>  };
>  
>  void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
> @@ -279,7 +291,7 @@ static struct drm_driver mxsfb_driver = {
>  static const struct platform_device_id mxsfb_devtype[] = {
>  	{ .name = "imx23-fb", .driver_data = MXSFB_V3, },
>  	{ .name = "imx28-fb", .driver_data = MXSFB_V4, },
> -	{ .name = "imx6sx-fb", .driver_data = MXSFB_V4, },
> +	{ .name = "imx6sx-fb", .driver_data = MXSFB_V6, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, mxsfb_devtype);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
