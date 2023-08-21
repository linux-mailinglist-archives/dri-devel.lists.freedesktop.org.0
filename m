Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB5782B33
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0310E0D2;
	Mon, 21 Aug 2023 14:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5406710E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:11:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886412F4;
 Mon, 21 Aug 2023 07:11:56 -0700 (PDT)
Received: from [10.57.34.4] (unknown [10.57.34.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E125C3F740;
 Mon, 21 Aug 2023 07:11:13 -0700 (PDT)
Message-ID: <562371e2-ef8f-0bc0-835b-23975e5e7a6d@arm.com>
Date: Mon, 21 Aug 2023 15:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2 1/2] drm/panfrost: Do not check for 0 return
 after calling platform_get_irq_byname()
Content-Language: en-GB
To: Ruan Jinjie <ruanjinjie@huawei.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230803040401.3067484-1-ruanjinjie@huawei.com>
 <20230803040401.3067484-2-ruanjinjie@huawei.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230803040401.3067484-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
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

On 03/08/2023 05:03, Ruan Jinjie wrote:
> It is not possible for platform_get_irq_byname() to return 0.
> Use the return value from platform_get_irq_byname().
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
>  drivers/gpu/drm/panfrost/panfrost_job.c | 4 ++--
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index d28b99732dde..2faa344d89ee 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -390,8 +390,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
>  
>  	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> -	if (irq <= 0)
> -		return -ENODEV;
> +	if (irq < 0)
> +		return irq;
>  
>  	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
>  			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..3322b3024937 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -794,8 +794,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	spin_lock_init(&js->job_lock);
>  
>  	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
> -	if (js->irq <= 0)
> -		return -ENODEV;
> +	if (js->irq < 0)
> +		return js->irq;
>  
>  	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
>  					panfrost_job_irq_handler,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index c0123d09f699..d54d4e7b2195 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -755,8 +755,8 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  	int err, irq;
>  
>  	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
> -	if (irq <= 0)
> -		return -ENODEV;
> +	if (irq < 0)
> +		return irq;
>  
>  	err = devm_request_threaded_irq(pfdev->dev, irq,
>  					panfrost_mmu_irq_handler,

