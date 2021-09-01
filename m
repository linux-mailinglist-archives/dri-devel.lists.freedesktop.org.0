Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA563FD886
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 13:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF7D6E188;
	Wed,  1 Sep 2021 11:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4265C6E188
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 11:15:13 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 795C73D7;
 Wed,  1 Sep 2021 13:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630494911;
 bh=I6bL/jrUa40v6FHSPM1ROH3qD0JJHGoBLKOMhps3j3A=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=iVmGWFZhAvp+iPjYceqaqkaCTXLF8y9/dgw/nZhONHEnvL7d0fE0I2TfH6n/QrE4s
 CYd1ESv1u/zNeBKjlNY9XvVlEZkinznyad93BDr8K3UUo9fvAbwFR7yBsFw+uFCF/u
 6ANUr6OAYlI9rPMxgTwWplyo9mZBfCnP5auTU4Sg=
Subject: Re: [PATCH] drm: rcar-du: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20210831075442.698-1-caihuoqing@baidu.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ed03b733-74f4-f291-9780-d98e293b64a0@ideasonboard.com>
Date: Wed, 1 Sep 2021 12:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831075442.698-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2021 08:54, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> 

