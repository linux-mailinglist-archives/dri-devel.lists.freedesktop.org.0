Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E83FD87F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 13:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B686E190;
	Wed,  1 Sep 2021 11:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2467E6E188
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 11:13:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E04B1042;
 Wed,  1 Sep 2021 04:13:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DB533F766;
 Wed,  1 Sep 2021 04:13:18 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id D1D53683E19; Wed,  1 Sep 2021 12:13:16 +0100 (BST)
Date: Wed, 1 Sep 2021 12:13:16 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: brian.starkey@arm.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/arm/hdlcd: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YS9gTBDhxK5kq+dD@e110455-lin.cambridge.arm.com>
References: <20210831074319.518-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210831074319.518-1-caihuoqing@baidu.com>
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

On Tue, Aug 31, 2021 at 03:43:19PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Many thanks,
Liviu

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 479c2422a2e0..72e63c8fad4e 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -129,7 +129,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  {
>  	struct hdlcd_drm_private *hdlcd = drm->dev_private;
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> -	struct resource *res;
>  	u32 version;
>  	int ret;
>  
> @@ -144,8 +143,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  	atomic_set(&hdlcd->dma_end_count, 0);
>  #endif
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hdlcd->mmio = devm_ioremap_resource(drm->dev, res);
> +	hdlcd->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(hdlcd->mmio)) {
>  		DRM_ERROR("failed to map control registers area\n");
>  		ret = PTR_ERR(hdlcd->mmio);
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
