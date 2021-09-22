Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04B4153CC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 01:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F856E075;
	Wed, 22 Sep 2021 23:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9374D6E075
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 23:16:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1636CE52;
 Thu, 23 Sep 2021 01:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632352580;
 bh=njl27l0XJYpzFgkSv7Y03dBDS1qGBBIxxBHe8LR/EcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zbtr3WL61e66pfmzT/X5IerZaatyQzXp1WwFltBdhjCwmGyzvKoP2iYQfvh/Ug+3H
 gKnD1VWDoenOxAwtR1WH9qVQ7YYQ9mYxJa1cQEjoFlH02RKugcv+ApcQq8cqKnbui0
 zKN7LGIErdfP8L0ItEl67e6mjXHi7OEy6OaQtOl0=
Date: Thu, 23 Sep 2021 02:16:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YUu5Qv0isQU+Dv2+@pendragon.ideasonboard.com>
References: <20210831075442.698-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831075442.698-1-caihuoqing@baidu.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

Thank you for the patch.

On Tue, Aug 31, 2021 at 03:54:42PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 4 +---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c   | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 4ac26d08ebb4..ebec4b7269d1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -570,7 +570,6 @@ static void rcar_du_shutdown(struct platform_device *pdev)
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu;
> -	struct resource *mem;
>  	int ret;
>  
>  	/* Allocate and initialize the R-Car device structure. */
> @@ -585,8 +584,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, rcdu);
>  
>  	/* I/O resources */
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	rcdu->mmio = devm_ioremap_resource(&pdev->dev, mem);
> +	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rcdu->mmio))
>  		return PTR_ERR(rcdu->mmio);
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index d061b8de748f..a64d910b0500 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -802,7 +802,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *attr;
>  	struct rcar_lvds *lvds;
> -	struct resource *mem;
>  	int ret;
>  
>  	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> @@ -825,8 +824,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
>  	lvds->bridge.of_node = pdev->dev.of_node;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	lvds->mmio = devm_ioremap_resource(&pdev->dev, mem);
> +	lvds->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(lvds->mmio))
>  		return PTR_ERR(lvds->mmio);
>  

-- 
Regards,

Laurent Pinchart
