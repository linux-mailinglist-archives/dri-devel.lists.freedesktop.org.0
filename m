Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7BB3AE8CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7566389F3C;
	Mon, 21 Jun 2021 12:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282AF89F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:10:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lvIlN-0004Jv-Ob; Mon, 21 Jun 2021 14:10:49 +0200
Message-ID: <fda3b035b68f67736278b13a253448253d14fa48.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Disable overlay plane support for
 i.MX8MM/i.MX8MN
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 21 Jun 2021 14:10:48 +0200
In-Reply-To: <20210620224834.189411-1-marex@denx.de>
References: <20210620224834.189411-1-marex@denx.de>
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

Am Montag, dem 21.06.2021 um 00:48 +0200 schrieb Marek Vasut:
> The iMX8MM and iMX8MN do not support the overlay plane, so they
> are MXSFB V4. Add the compatible strings to reflect this. Note
> that iMX8MQ does support the overlay plane, so it is MXSFB V6.

Do we need this compatible in the driver? If there are no other changes
known at this time, shouldn't we be able to just specify "fsl,imx28-
lcdif" as the fallback compatible in the DT, besides the imx8m*
specific ones?

Regards,
Lucas

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index c277d3f61a5e..0ae4a3553304 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -308,6 +308,8 @@ static const struct of_device_id mxsfb_dt_ids[] = {
>  	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devdata[MXSFB_V3], },
>  	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
>  	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
> +	{ .compatible = "fsl,imx8mm-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
> +	{ .compatible = "fsl,imx8mn-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);


