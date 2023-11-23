Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8177F5C70
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 11:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D4510E713;
	Thu, 23 Nov 2023 10:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9A010E713
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 10:35:35 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 74D926607377;
 Thu, 23 Nov 2023 10:35:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700735734;
 bh=+t30T3QtALyz1/B237Ax/0/6hwdI/ETu4RDxxNAVAH8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eb5aYUCIDXD5PwKf1s9gDgB8i00wxhd79v4P/wD7S+kbi7wCO7wlfKTw2yirCofPY
 C2ItZTM2rpV/LIrPwfc7cSmIvC4Dh8WZcbx6nmoK6PL52MEIIkt99skKiNuOo0VWWX
 nj/0kWN8o6y00I6ThBDiEBgpSxe5B1sTxWJv0HZcGatyFWaE6JGOygTBORFFOWxb5d
 oOSnoZKx2zJjtUIVxxerSG81QMKWEiIGCB2Zyk17L4wMGY9oz2j9pao/bLppOc3rZQ
 OeyA74V9lo5kxMhLsPUcBVc0uyJV0Ix0V+luOocQFqaobn55RKBIzbnSXYdYIXMtuz
 GVxDFmPSsd3/Q==
Date: Thu, 23 Nov 2023 11:35:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Message-ID: <20231123113530.46191ded@collabora.com>
In-Reply-To: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
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
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Nov 2023 10:53:20 +0100
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
> transition only on the first core group, leaving the second one
> unchanged, or because ISR execution was pending before entering
> the panfrost_gpu_power_off() function and executed after powering
> off the GPU cores, or all of the above.
> 
> Finally, solve this by changing the power off flow to
>  1. Mask and clear all interrupts: we don't need nor want any, as
>     we are polling PWRTRANS anyway;
>  2. Call synchronize_irq() after that to make sure that any pending
>     ISR is executed before powering off the GPU Shaders/Tilers/L2
>     hence avoiding unpowered registers R/W; and
>  3. Ignore the core_mask and ask the GPU to poweroff both core groups

Could we split that in two patches? 1+2 in one patch, and 3 in another.
These are two orthogonal fixes IMO.

> 
> Of course it was also necessary to add a `irq` variable to `struct
> panfrost_device` as we need to get that in panfrost_gpu_power_off()
> for calling synchronize_irq() on it.
> 
> Fixes: 123b431f8a5c ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
> [Regression detected on Odroid HC1, Exynos 5422, Mali-T628 MP6]
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 26 +++++++++++++++-------
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 0fc558db6bfd..b4feaa99e34f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -94,6 +94,7 @@ struct panfrost_device {
>  	struct device *dev;
>  	struct drm_device *ddev;
>  	struct platform_device *pdev;
> +	int irq;

I know it's the only irq being stored at the panfrost_device level, but
I think it's clearer if we explicitly prefix it with gpu_.

>  
>  	void __iomem *iomem;
>  	struct clk *clock;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 1cc55fb9c45b..30b395125155 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -425,11 +425,21 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  
>  void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  {
> -	u64 core_mask = panfrost_get_core_mask(pfdev);
>  	int ret;
>  	u32 val;
>  
> -	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
> +	/* We are polling PWRTRANS and we don't need nor want interrupts */

I kinda agree with that, but that's not exactly why we're
masking+syncing IRQs here. If that was the only reason, the right fix
would be to modify GPU_IRQ_MASK_ALL so it doesn't include the PWRTRANS
bits.

This fix should cover more than just the power transition IRQ use case:
we want all IRQs to be disabled before the device is suspended.

> +	gpu_write(pfdev, GPU_INT_MASK, 0);
> +	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
> +
> +	/*
> +	 * Make sure that we don't have pending ISRs, otherwise we'll be
> +	 * reading and/or writing registers while the GPU is powered off
> +	 */
> +	synchronize_irq(pfdev->irq);

Could we move that to a panfrost_gpu_suspend_irq() helper? I'm also not
sure making it part of panfrost_gpu_power_off() is a good idea. I'd
rather have this panfrost_gpu_suspend_irq() helper called from
panfrost_device_[runtime_]suspend(), along with
panfrost_{mmu,job}_suspend_irq().

> +
> +	/* Now it's safe to request poweroff for Shaders, Tilers and L2 */

It was safe before too, it's just that we probably don't want to be
interrupted, if all we do is ignore the interrupts we receive, hence
the suggestion to not use GPU_IRQ_MASK_ALL, and only enable the
IRQs we care about instead.

> +	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>  					 val, !val, 1, 1000);
>  	if (ret)
> @@ -441,7 +451,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  	if (ret)
>  		dev_err(pfdev->dev, "tiler power transition timeout");
>  
> -	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
> +	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);

I really think we should have a helper doing the 'write(PWROFF_{LO,HI} +
poll(PWRTRANS_{LO,HI})' sequence, similar to what's done here [1][2],
such that, once we got it right for one block, we have it working for
all of them. And if there's a fix to apply, it automatically applies
to all blocks without having to fix the same bug in each copy.

Note that these panthor_gpu_block_power_{on,off}() helpers also handle
the case where power transitions are already in progress when you ask a
new power transition, which I don't think is checked in
panfrost_gpu_power_{off,on}().

>  	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>  					 val, !val, 0, 1000);

Not introduced by the patch, but I noticed args passed on the second
line are no longer aligned on the open parens.

>  	if (ret)
> @@ -451,7 +461,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  
>  int panfrost_gpu_init(struct panfrost_device *pfdev)
>  {
> -	int err, irq;
> +	int err;
>  
>  	err = panfrost_gpu_soft_reset(pfdev);
>  	if (err)
> @@ -466,11 +476,11 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  
>  	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
>  
> -	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> -	if (irq < 0)
> -		return irq;
> +	pfdev->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> +	if (pfdev->irq < 0)
> +		return pfdev->irq;
>  
> -	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
> +	err = devm_request_irq(pfdev->dev, pfdev->irq, panfrost_gpu_irq_handler,
>  			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
>  	if (err) {
>  		dev_err(pfdev->dev, "failed to request gpu irq");

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/panthor/drivers/gpu/drm/panthor/panthor_gpu.h#L22
[2]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/panthor/drivers/gpu/drm/panthor/panthor_gpu.c#L193
