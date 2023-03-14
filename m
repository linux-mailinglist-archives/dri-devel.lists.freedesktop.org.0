Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB26B968A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 14:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EF210E7F4;
	Tue, 14 Mar 2023 13:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F7CB10E7F0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 13:41:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA9F61042
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 06:42:05 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5B493F67D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 06:41:21 -0700 (PDT)
Date: Tue, 14 Mar 2023 13:41:18 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next 2/2] drm/arm/hdlcd: Use
 devm_platform_ioremap_resource()
Message-ID: <ZBB5fnTQM/QDvgxu@e110455-lin.cambridge.arm.com>
References: <20230314080231.20212-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314080231.20212-1-yang.lee@linux.alibaba.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 04:02:30PM +0800, Yang Li wrote:
> According to commit 7945f929f1a7 ("drivers: provide
> devm_platform_ioremap_resource()"), convert platform_get_resource(),
> devm_ioremap_resource() to a single call to Use
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Since 'struct platform_device *pdev = to_platform_device(drm->dev)',
> 'drm->dev' is equivalent to 'pdev->deva'.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for cleaning this up!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index e3507dd6f82a..a86b317c1312 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -100,7 +100,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  {
>  	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> -	struct resource *res;
>  	u32 version;
>  	int ret;
>  
> @@ -115,8 +114,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
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
> 2.20.1.7.g153144c
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
