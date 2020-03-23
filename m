Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10E1901D1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B901C6E429;
	Mon, 23 Mar 2020 23:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E096E433
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:23:56 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5A2395C061C;
 Tue, 24 Mar 2020 00:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585005835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WxQKrwwh8l83Vwxla5RpuX/YunX28OdLIrbXmMiogo=;
 b=vdMlnr+H+0QNHJR88o829CC+NlAc5bQNSevJTRHN8REuVwmTFia1Npzv6bD3pOpY5+83Ig
 7M3Y8wNEcLiqC7Bc0DGyVJaPgH17UzreJNp6FrRllIJCE2G/zmYdYh95AreHwzKTT0/HmU
 DUG4tFL3w1UvFwhSNHLBQyfRbgPtlIM=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:23:55 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 18/21] drm: mxsfb: Drop non-OF support
In-Reply-To: <20200309195216.31042-19-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-19-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <e4ad021ccc5934a4b451766bc1a1dab4@agner.ch>
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
> The mxsfb driver is only used by OF platforms. Drop non-OF support.

Nice cleanup. Actually only supported of anyways due to the
pdev->dev.of_node check.

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 2316c12c5c42..ed8e3f7bc27c 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -130,7 +130,8 @@ static int mxsfb_attach_bridge(struct
> mxsfb_drm_private *mxsfb)
>  	return 0;
>  }
>  
> -static int mxsfb_load(struct drm_device *drm, unsigned long flags)
> +static int mxsfb_load(struct drm_device *drm,
> +		      const struct mxsfb_devdata *devdata)
>  {
>  	struct platform_device *pdev = to_platform_device(drm->dev);
>  	struct mxsfb_drm_private *mxsfb;
> @@ -143,7 +144,7 @@ static int mxsfb_load(struct drm_device *drm,
> unsigned long flags)
>  
>  	mxsfb->drm = drm;
>  	drm->dev_private = mxsfb;
> -	mxsfb->devdata = &mxsfb_devdata[pdev->id_entry->driver_data];
> +	mxsfb->devdata = devdata;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	mxsfb->base = devm_ioremap_resource(drm->dev, res);
> @@ -288,18 +289,10 @@ static struct drm_driver mxsfb_driver = {
>  	.minor	= 0,
>  };
>  
> -static const struct platform_device_id mxsfb_devtype[] = {
> -	{ .name = "imx23-fb", .driver_data = MXSFB_V3, },
> -	{ .name = "imx28-fb", .driver_data = MXSFB_V4, },
> -	{ .name = "imx6sx-fb", .driver_data = MXSFB_V6, },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(platform, mxsfb_devtype);
> -
>  static const struct of_device_id mxsfb_dt_ids[] = {
> -	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devtype[0], },
> -	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devtype[1], },
> -	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devtype[2], },
> +	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devdata[MXSFB_V3], },
> +	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
> +	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
> @@ -314,14 +307,11 @@ static int mxsfb_probe(struct platform_device *pdev)
>  	if (!pdev->dev.of_node)
>  		return -ENODEV;
>  
> -	if (of_id)
> -		pdev->id_entry = of_id->data;
> -
>  	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
>  
> -	ret = mxsfb_load(drm, 0);
> +	ret = mxsfb_load(drm, of_id->data);
>  	if (ret)
>  		goto err_free;
>  
> @@ -375,7 +365,6 @@ static const struct dev_pm_ops mxsfb_pm_ops = {
>  static struct platform_driver mxsfb_platform_driver = {
>  	.probe		= mxsfb_probe,
>  	.remove		= mxsfb_remove,
> -	.id_table	= mxsfb_devtype,
>  	.driver	= {
>  		.name		= "mxsfb",
>  		.of_match_table	= mxsfb_dt_ids,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
