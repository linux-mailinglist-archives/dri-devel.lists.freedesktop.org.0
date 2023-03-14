Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EC6B96A3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 14:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5303110E7EB;
	Tue, 14 Mar 2023 13:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0899110E7EB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 13:45:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B1484B3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 06:45:59 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5632B3F67D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 06:45:15 -0700 (PDT)
Date: Tue, 14 Mar 2023 13:45:06 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next 1/2] drm/arm/malidp: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZBB6YmrrNnufgpIh@e110455-lin.cambridge.arm.com>
References: <20230314080231.20212-1-yang.lee@linux.alibaba.com>
 <20230314080231.20212-2-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314080231.20212-2-yang.lee@linux.alibaba.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 04:02:31PM +0800, Yang Li wrote:
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Since 'struct platform_device *pdev = to_platform_device(dev)',
> 'pdev->dev' is equivalent to 'dev'.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the cleanup! I will pull this patch and the hdlcd one into
drm-misc-next by the end of the week.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index cf040e2e9efe..e220bfc85b2e 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -724,8 +724,7 @@ static int malidp_bind(struct device *dev)
>  	hwdev->hw = (struct malidp_hw *)of_device_get_match_data(dev);
>  	malidp->dev = hwdev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hwdev->regs = devm_ioremap_resource(dev, res);
> +	hwdev->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(hwdev->regs))
>  		return PTR_ERR(hwdev->regs);
>  
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
