Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A93FEAFA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 11:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813EB6E492;
	Thu,  2 Sep 2021 09:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACDA86E492
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 09:11:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4C91063;
 Thu,  2 Sep 2021 02:11:14 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 160483F766;
 Thu,  2 Sep 2021 02:11:11 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20210831075327.653-1-caihuoqing@baidu.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <c650dd12-76c6-ab90-68e2-04dc0f16b36c@arm.com>
Date: Thu, 2 Sep 2021 10:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831075327.653-1-caihuoqing@baidu.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2021 08:53, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index bd9b7be63b0f..1c692428b0d4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -198,7 +198,6 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
>  int panfrost_device_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> -	struct resource *res;
>  
>  	mutex_init(&pfdev->sched_lock);
>  	INIT_LIST_HEAD(&pfdev->scheduled_jobs);
> @@ -236,8 +235,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>  	if (err)
>  		goto out_reset;
>  
> -	res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
> -	pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
> +	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
>  	if (IS_ERR(pfdev->iomem)) {
>  		err = PTR_ERR(pfdev->iomem);
>  		goto out_pm_domain;
> 

