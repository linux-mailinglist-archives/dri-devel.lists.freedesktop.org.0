Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EE4153CA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 01:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE966E071;
	Wed, 22 Sep 2021 23:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C94B6E071
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 23:15:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A4BEE52;
 Thu, 23 Sep 2021 01:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632352552;
 bh=EhjsdaAZ3wq2Jvv0W+AfcSrgjMlFF23xTtV5z31k1lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0iHLCYId8tx/iYo120SxHKpzEbVJLBot1ZbdTQq9lvBiy4cIluk5ejuocw67chgI
 AIARYNucPMFzsZmjBlnevYHqZ/zkbdYm5laaaomOsf0hTIGc+wOwa6CGg8K3fwBDyc
 zWtLPB6DqGO1Sb7d42cZivttjLTk/SG4gX2sinAQ=
Date: Thu, 23 Sep 2021 02:15:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/shmobile: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YUu5Jgem26uQFP7o@pendragon.ideasonboard.com>
References: <20210831135731.4776-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831135731.4776-1-caihuoqing@baidu.com>
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

On Tue, Aug 31, 2021 at 09:57:30PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
