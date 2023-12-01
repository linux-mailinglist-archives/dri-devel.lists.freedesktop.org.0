Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F5800AF7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 13:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A089710E0FC;
	Fri,  1 Dec 2023 12:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6199D10E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 12:34:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 881D51042;
 Fri,  1 Dec 2023 04:35:28 -0800 (PST)
Received: from [10.1.28.20] (e122027.cambridge.arm.com [10.1.28.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDE3B3F8A4;
 Fri,  1 Dec 2023 04:34:39 -0800 (PST)
Message-ID: <0220b97f-04fa-4811-b16b-ffdafc91648b@arm.com>
Date: Fri, 1 Dec 2023 12:34:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/panfrost: Add gpu_irq, mmu_irq to struct
 panfrost_device
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231201104027.35273-1-angelogioacchino.delregno@collabora.com>
 <20231201104027.35273-3-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231201104027.35273-3-angelogioacchino.delregno@collabora.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2023 10:40, AngeloGioacchino Del Regno wrote:
> In preparation for adding a IRQ synchronization mechanism for PM suspend
> add gpu_irq and mmu_irq variables to struct panfrost_device and change
> functions panfrost_gpu_init() and panfrost_mmu_init() to use those.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Although this now makes the job IRQ look out of place - I'm not sure why
we have the struct panfrost_job_slot as a separately allocated structure
either. Anyway - that's irrelevant to this patch!

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 10 +++++-----
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 10 +++++-----
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 0fc558db6bfd..54a8aad54259 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -94,6 +94,8 @@ struct panfrost_device {
>  	struct device *dev;
>  	struct drm_device *ddev;
>  	struct platform_device *pdev;
> +	int gpu_irq;
> +	int mmu_irq;
>  
>  	void __iomem *iomem;
>  	struct clk *clock;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index bd41617c5e4b..7adc4441fa14 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -454,7 +454,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  
>  int panfrost_gpu_init(struct panfrost_device *pfdev)
>  {
> -	int err, irq;
> +	int err;
>  
>  	err = panfrost_gpu_soft_reset(pfdev);
>  	if (err)
> @@ -469,11 +469,11 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  
>  	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
>  
> -	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> -	if (irq < 0)
> -		return irq;
> +	pfdev->gpu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> +	if (pfdev->gpu_irq < 0)
> +		return pfdev->gpu_irq;
>  
> -	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
> +	err = devm_request_irq(pfdev->dev, pfdev->gpu_irq, panfrost_gpu_irq_handler,
>  			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
>  	if (err) {
>  		dev_err(pfdev->dev, "failed to request gpu irq");
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 846dd697c410..ac4296c1e54b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -753,13 +753,13 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  
>  int panfrost_mmu_init(struct panfrost_device *pfdev)
>  {
> -	int err, irq;
> +	int err;
>  
> -	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
> -	if (irq < 0)
> -		return irq;
> +	pfdev->mmu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
> +	if (pfdev->mmu_irq < 0)
> +		return pfdev->mmu_irq;
>  
> -	err = devm_request_threaded_irq(pfdev->dev, irq,
> +	err = devm_request_threaded_irq(pfdev->dev, pfdev->mmu_irq,
>  					panfrost_mmu_irq_handler,
>  					panfrost_mmu_irq_handler_thread,
>  					IRQF_SHARED, KBUILD_MODNAME "-mmu",

