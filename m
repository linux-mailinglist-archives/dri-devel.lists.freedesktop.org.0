Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B43FD87A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 13:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4439F89762;
	Wed,  1 Sep 2021 11:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13289762
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 11:11:26 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB6563D7;
 Wed,  1 Sep 2021 13:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630494684;
 bh=HInr+c+TDIZIVFqwjq0Hfi0Gm4yXp7wNGXxxBqGvUY4=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=U5+byBP8kaMpurkoq+nDNAT2q9W0dnNRxyj/aqLH9mlZnacLfpoE2alrpBCuWw5MH
 HcIh6UuBejXMrFfy/nKuNbdkCb9QkNzCppFuZIQ/bYUcAaS3VFC4y6GKh3LLlxsnLG
 +bVXkEKLgNxfcWwBpZmGtXMJEcvW3pX4xCwI5dsM=
Subject: Re: [PATCH] drm/shmobile: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210831135731.4776-1-caihuoqing@baidu.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <be72627d-e6be-2032-8d2e-d4ca136b0621@ideasonboard.com>
Date: Wed, 1 Sep 2021 12:11:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831135731.4776-1-caihuoqing@baidu.com>
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

On 31/08/2021 14:57, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 7db01904d18d..80078a9fd7f6 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -192,7 +192,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
>  	struct shmob_drm_device *sdev;
>  	struct drm_device *ddev;
> -	struct resource *res;
>  	unsigned int i;
>  	int ret;
>  
> @@ -215,8 +214,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sdev);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
> +	sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(sdev->mmio))
>  		return PTR_ERR(sdev->mmio);
>  
> 

