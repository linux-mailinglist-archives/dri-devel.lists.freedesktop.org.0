Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D83800933
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 11:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251D10E83E;
	Fri,  1 Dec 2023 10:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DDF10E83E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 10:59:41 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 63AEA66073A6;
 Fri,  1 Dec 2023 10:59:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701428380;
 bh=x4Y7dYr3VeCqx4rJVOcJNrX3o5ny+WQ9mP2TBfYRN74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gkgdpUVf87AfqPlRtPoMPrVBNOuatZ+hCpkRJMYOmSH6PQWXsTJ1cSOSB1hNkSJJc
 kTlox7QsWVrK23FdFC9DXpGsRpPiOiFZ3kKymQfedAemnXN9K8d4QboRigqv68WpDV
 vVmC9SGH+fLvjrZOB+/4MB6rj+RlrqJR3rw0alOP+mAV9uStFxuftOoA7iBB2MNcu4
 OrBCeNy/olZd+28vtOGPteCb3kamF+w5QhuaeYm+IR3aI1ORXv1TSa/LqQ9/3PRQEl
 XVpSLQrG9ci5lxhrS1AD1skOI8TRTEOHA/8CEWl9HeCyGzPLOawRLgXizs7Tut2wIt
 qF+9mojOsHwOg==
Date: Fri, 1 Dec 2023 11:59:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/3] drm/panfrost: Ignore core_mask for poweroff and
 disable PWRTRANS irq
Message-ID: <20231201115935.1ac9535a@collabora.com>
In-Reply-To: <20231201104027.35273-2-angelogioacchino.delregno@collabora.com>
References: <20231201104027.35273-1-angelogioacchino.delregno@collabora.com>
 <20231201104027.35273-2-angelogioacchino.delregno@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  1 Dec 2023 11:40:25 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Some SoCs may be equipped with a GPU containing two core groups
> and this is exactly the case of Samsung's Exynos 5422 featuring
> an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
> is partial, as this driver currently supports using only one
> core group and that's reflected on all parts of it, including
> the power on (and power off, previously to this patch) function.
> 
> The issue with this is that even though executing the soft reset
> operation should power off all cores unconditionally, on at least
> one platform we're seeing a crash that seems to be happening due
> to an interrupt firing which may be because we are calling power

                               ^ might be caused by us doing a power
  transition on the first core group only, leaving the second one
  unchanged.

> transition only on the first core group, leaving the second one
> unchanged, or because ISR execution was pending before entering

  unchanged. Our changes to the suspend logic seems to have
  uncovered another issue where the GPU interrupt handler is called
  after the device as entered the suspend state, which leads to invalid
  register accesses because the GPU device is no longer
  powered/clocked. Given the only addition that was done to the suspend
  logic is the power-off requests, and the fact those generate PWRTRANS
  interrupts, we have good reason to think the interrupts we are asked
  to process in that case are the PWRTRANS ones.

> the panfrost_gpu_power_off() function and executed after powering
> off the GPU cores, or all of the above.
> 
> Finally, solve this by:
>  - Avoid to enable the power transition interrupt on reset; and
     ^ 'Avoiding' or maybe 'Not enabling power transition ...'

>  - Ignoring the core_mask and ask the GPU to poweroff both core groups
> 
> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Still

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 09f5e1563ebd..bd41617c5e4b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -78,7 +78,12 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>  	}
>  
>  	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
> -	gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
> +
> +	/* Only enable the interrupts we care about */
> +	gpu_write(pfdev, GPU_INT_MASK,
> +		  GPU_IRQ_MASK_ERROR |
> +		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED |
> +		  GPU_IRQ_CLEAN_CACHES_COMPLETED);
>  
>  	/*
>  	 * All in-flight jobs should have released their cycle
> @@ -425,11 +430,10 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  
>  void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  {
> -	u64 core_mask = panfrost_get_core_mask(pfdev);
>  	int ret;
>  	u32 val;
>  
> -	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
> +	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>  					 val, !val, 1, 1000);
>  	if (ret)
> @@ -441,7 +445,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  	if (ret)
>  		dev_err(pfdev->dev, "tiler power transition timeout");
>  
> -	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
> +	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>  	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>  				 val, !val, 0, 1000);
>  	if (ret)

