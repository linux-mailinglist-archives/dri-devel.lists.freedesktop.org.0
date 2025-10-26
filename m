Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74204C0ADB8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 17:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D522310E2F2;
	Sun, 26 Oct 2025 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="hhh69V4E";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="revnM00z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A943910E108
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 01:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1761442266; bh=EE732K+laFOiOUF7JYzZWpC
 tYOYACOEeKOK6VM0p4DQ=; b=hhh69V4EyJGSon+3+TbIpAs3sAp/RDcTEtb2ZSNlULIVHu864y
 fzar638uPozvV4M40oKLWQMjF1AFgQiJH1QCBtDkuEUyBYkJXZ/32DB/fQMQC7JvqAGb8bBE2bZ
 BEsNlhvzjRG51IaUTcha2a/C4tgS7sWTFUHCLBVgsrgz5qbWpLkV0YTu5SmRQmvkdDQ+3fO7Qqy
 qjSttkGsY3kvgYtcB+v3SFR0cYGwsevqjP/wM83SEyQbok7vPthPoMXECwAz/mTzf1BO6Veq2Ph
 c/Oum6ubagVBaTRbwxAtnwBzs0ORQN4/UUYCObFsyntOZR5n7/Wb3f5+9Ykl6xrf6dA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1761442266; bh=EE732K+laFOiOUF7JYzZWpC
 tYOYACOEeKOK6VM0p4DQ=; b=revnM00zh7sEUCrKuXJwfdEwycRZTlFUGHjiZyjXh3I5pPEd5i
 VPnizSWEnIrJVjUpZRok48efLa9ktNkiDjDg==;
Message-ID: <02356e35-0a3a-4a50-ad38-3032f9f166c9@mainlining.org>
Date: Sun, 26 Oct 2025 02:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Jens Reidel <adrian@mainlining.org>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 26 Oct 2025 16:37:16 +0000
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

On 10/22/25 14:44, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>   6 files changed, 192 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed8..6e7c3e627509 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1859,11 +1859,14 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
>   	pm_runtime_put(&gpu->pdev->dev);
>   }
>   
> -void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> +static void a6xx_gmu_unbind(struct device *dev, struct device *master, void *data)
>   {
> -	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_drm_private *priv = dev_get_drvdata(master);
> +	struct msm_gpu *gpu = priv->gpu;
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> -	struct platform_device *pdev = to_platform_device(gmu->dev);
>   
>   	mutex_lock(&gmu->lock);
>   	if (!gmu->initialized) {
> @@ -1903,9 +1906,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>   		free_irq(gmu->gmu_irq, gmu);
>   		free_irq(gmu->hfi_irq, gmu);
>   	}
> -
> -	/* Drop reference taken in of_find_device_by_node */
> -	put_device(gmu->dev);
>   }
>   
>   static int cxpd_notifier_cb(struct notifier_block *nb,
> @@ -1919,169 +1919,130 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>   	return 0;
>   }
>   
> -int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> +static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
>   {
> -	struct platform_device *pdev = of_find_device_by_node(node);
> -	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> -	int ret;
> -
> -	if (!pdev)
> -		return -ENODEV;
> -
> -	gmu->dev = &pdev->dev;
> -
> -	ret = of_dma_configure(gmu->dev, node, true);
> -	if (ret)
> -		return ret;
> -
> -	pm_runtime_enable(gmu->dev);
> -
> -	/* Mark legacy for manual SPTPRAC control */
> -	gmu->legacy = true;
> -
> -	/* Map the GMU registers */
> -	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
> -	if (IS_ERR(gmu->mmio)) {
> -		ret = PTR_ERR(gmu->mmio);
> -		goto err_mmio;
> -	}
> -
> -	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
> -	if (IS_ERR(gmu->cxpd)) {
> -		ret = PTR_ERR(gmu->cxpd);
> -		goto err_mmio;
> -	}
> -
> -	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> -		ret = -ENODEV;
> -		goto detach_cxpd;
> -	}
> -
> -	init_completion(&gmu->pd_gate);
> -	complete_all(&gmu->pd_gate);
> -	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
> -
> -	/* Get a link to the GX power domain to reset the GPU */
> -	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
> -	if (IS_ERR(gmu->gxpd)) {
> -		ret = PTR_ERR(gmu->gxpd);
> -		goto err_mmio;
> -	}
> -
> -	gmu->initialized = true;
> -
> -	return 0;
> -
> -detach_cxpd:
> -	dev_pm_domain_detach(gmu->cxpd, false);
> -
> -err_mmio:
> -	iounmap(gmu->mmio);
> -
> -	/* Drop reference taken in of_find_device_by_node */
> -	put_device(gmu->dev);
> -
> -	return ret;
> -}
> -
> -int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> -{
> -	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_drm_private *priv = dev_get_drvdata(master);
> +	struct msm_gpu *gpu = dev_to_gpu(&priv->gpu_pdev->dev);
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> -	struct platform_device *pdev = of_find_device_by_node(node);
>   	struct device_link *link;
>   	int ret;
>   
> -	if (!pdev)
> -		return -ENODEV;
> -
> -	gmu->dev = &pdev->dev;
> +	gmu->dev = dev;
>   
> -	ret = of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, dev->of_node, true);
>   	if (ret)
>   		return ret;
>   
> -	/* Set GMU idle level */
> -	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
> -		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		/* Mark legacy for manual SPTPRAC control */
> +		gmu->legacy = true;
> +
> +	if (!gmu->legacy)
> +		/* Set GMU idle level */
> +		gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
> +			GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
>   
>   	pm_runtime_enable(gmu->dev);
>   
> -	/* Get the list of clocks */
> -	ret = a6xx_gmu_clocks_probe(gmu);
> -	if (ret)
> -		goto err_put_device;
> +	if (!gmu->legacy) {
> +		/* Get the list of clocks */
> +		ret = a6xx_gmu_clocks_probe(gmu);
> +		if (ret)
> +			return ret;
>   
> -	ret = a6xx_gmu_memory_probe(adreno_gpu->base.dev, gmu);
> -	if (ret)
> -		goto err_put_device;
> +		ret = a6xx_gmu_memory_probe(adreno_gpu->base.dev, gmu);
> +		if (ret)
> +			return ret;
>   
> +		/* A660 now requires handling "prealloc requests" in GMU firmware
> +		 * For now just hardcode allocations based on the known firmware.
> +		 * note: there is no indication that these correspond to "dummy" or
> +		 * "debug" regions, but this "guess" allows reusing these BOs which
> +		 * are otherwise unused by a660.
> +		 */
> +		gmu->dummy.size = SZ_4K;
> +		if (adreno_is_a660_family(adreno_gpu) ||
> +		    adreno_is_a7xx(adreno_gpu)) {
> +			ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7,
> +						    0x60400000, "debug");
> +			if (ret)
> +				goto err_memory;
> +
> +			gmu->dummy.size = SZ_8K;
> +		}
>   
> -	/* A660 now requires handling "prealloc requests" in GMU firmware
> -	 * For now just hardcode allocations based on the known firmware.
> -	 * note: there is no indication that these correspond to "dummy" or
> -	 * "debug" regions, but this "guess" allows reusing these BOs which
> -	 * are otherwise unused by a660.
> -	 */
> -	gmu->dummy.size = SZ_4K;
> -	if (adreno_is_a660_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu)) {
> -		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7,
> -					    0x60400000, "debug");
> +		/* Allocate memory for the GMU dummy page */
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, gmu->dummy.size,
> +					    0x60000000, "dummy");
>   		if (ret)
>   			goto err_memory;
>   
> -		gmu->dummy.size = SZ_8K;
> -	}
> -
> -	/* Allocate memory for the GMU dummy page */
> -	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, gmu->dummy.size,
> -				    0x60000000, "dummy");
> -	if (ret)
> -		goto err_memory;
> +		/* Note that a650 family also includes a660 family: */
> +		if (adreno_is_a650_family(adreno_gpu) ||
> +		    adreno_is_a7xx(adreno_gpu)) {
> +			ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> +				SZ_16M - SZ_16K, 0x04000, "icache");
> +			if (ret)
> +				goto err_memory;
> +		/*
> +		 * NOTE: when porting legacy ("pre-650-family") GPUs you may be tempted to add a condition
> +		 * to allocate icache/dcache here, as per downstream code flow, but it may not actually be
> +		 * necessary. If you omit this step and you don't get random pagefaults, you are likely
> +		 * good to go without this!
> +		 */
> +		} else if (adreno_is_a640_family(adreno_gpu)) {
> +			ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> +				SZ_256K - SZ_16K, 0x04000, "icache");
> +			if (ret)
> +				goto err_memory;
> +
> +			ret = a6xx_gmu_memory_alloc(gmu, &gmu->dcache,
> +				SZ_256K - SZ_16K, 0x44000, "dcache");
> +			if (ret)
> +				goto err_memory;
> +		} else if (adreno_is_a630_family(adreno_gpu)) {
> +			/* HFI v1, has sptprac */
> +			gmu->legacy = true;
> +
> +			/* Allocate memory for the GMU debug region */
> +			ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_16K, 0, "debug");
> +			if (ret)
> +				goto err_memory;
> +		}
>   
> -	/* Note that a650 family also includes a660 family: */
> -	if (adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu)) {
> -		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> -			SZ_16M - SZ_16K, 0x04000, "icache");
> -		if (ret)
> -			goto err_memory;
> -	/*
> -	 * NOTE: when porting legacy ("pre-650-family") GPUs you may be tempted to add a condition
> -	 * to allocate icache/dcache here, as per downstream code flow, but it may not actually be
> -	 * necessary. If you omit this step and you don't get random pagefaults, you are likely
> -	 * good to go without this!
> -	 */
> -	} else if (adreno_is_a640_family(adreno_gpu)) {
> -		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> -			SZ_256K - SZ_16K, 0x04000, "icache");
> +		/* Allocate memory for the GMU log region */
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_16K, 0, "log");
>   		if (ret)
>   			goto err_memory;
>   
> -		ret = a6xx_gmu_memory_alloc(gmu, &gmu->dcache,
> -			SZ_256K - SZ_16K, 0x44000, "dcache");
> +		/* Allocate memory for for the HFI queues */
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
>   		if (ret)
>   			goto err_memory;
> -	} else if (adreno_is_a630_family(adreno_gpu)) {
> -		/* HFI v1, has sptprac */
> -		gmu->legacy = true;
>   
> -		/* Allocate memory for the GMU debug region */
> -		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_16K, 0, "debug");
> -		if (ret)
> -			goto err_memory;
> -	}
> +		if (adreno_is_a650_family(adreno_gpu) ||
> +		    adreno_is_a7xx(adreno_gpu)) {
> +			gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
> +			if (IS_ERR(gmu->rscc)) {
> +				ret = -ENODEV;
> +				goto err_mmio;
> +			}
> +		} else {
> +			gmu->rscc = gmu->mmio + 0x23000;
> +		}
>   
> -	/* Allocate memory for the GMU log region */
> -	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_16K, 0, "log");
> -	if (ret)
> -		goto err_memory;
> +		/* Get the HFI and GMU interrupts */
> +		gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
> +		gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
>   
> -	/* Allocate memory for for the HFI queues */
> -	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
> -	if (ret)
> -		goto err_memory;
> +		if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> +			ret = -ENODEV;
> +			goto err_mmio;
> +		}
> +	}
>   
>   	/* Map the GMU registers */
>   	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
> @@ -2090,26 +2051,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   		goto err_memory;
>   	}
>   
> -	if (adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu)) {
> -		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
> -		if (IS_ERR(gmu->rscc)) {
> -			ret = -ENODEV;
> -			goto err_mmio;
> -		}
> -	} else {
> -		gmu->rscc = gmu->mmio + 0x23000;
> -	}
> -
> -	/* Get the HFI and GMU interrupts */
> -	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
> -	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
> -
> -	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> -		ret = -ENODEV;
> -		goto err_mmio;
> -	}
> -
>   	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
>   	if (IS_ERR(gmu->cxpd)) {
>   		ret = PTR_ERR(gmu->cxpd);
> @@ -2122,11 +2063,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   		goto detach_cxpd;
>   	}
>   
> -	/* Other errors are handled during GPU ACD probe */
> -	gmu->qmp = qmp_get(gmu->dev);
> -	if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
> -		ret = -EPROBE_DEFER;
> -		goto detach_gxpd;
> +	if (!gmu->legacy) {
> +		/* Other errors are handled during GPU ACD probe */
> +		gmu->qmp = qmp_get(gmu->dev);
> +		if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
> +			ret = -EPROBE_DEFER;
> +			goto detach_gxpd;
> +		}
>   	}
>   
>   	init_completion(&gmu->pd_gate);
> @@ -2139,18 +2082,20 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   	 */
>   	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
>   
> -	/* Get the power levels for the GMU and GPU */
> -	a6xx_gmu_pwrlevels_probe(gmu);
> +	if (!gmu->legacy) {
> +		/* Get the power levels for the GMU and GPU */
> +		a6xx_gmu_pwrlevels_probe(gmu);
>   
> -	ret = a6xx_gmu_acd_probe(gmu);
> -	if (ret)
> -		goto detach_gxpd;
> +		ret = a6xx_gmu_acd_probe(gmu);
> +		if (ret)
> +			goto detach_gxpd;
>   
> -	/* Set up the HFI queues */
> -	a6xx_hfi_init(gmu);
> +		/* Set up the HFI queues */
> +		a6xx_hfi_init(gmu);
>   
> -	/* Initialize RPMh */
> -	a6xx_gmu_rpmh_init(gmu);
> +		/* Initialize RPMh */
> +		a6xx_gmu_rpmh_init(gmu);
> +	}
>   
>   	gmu->initialized = true;
>   
> @@ -2170,16 +2115,57 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   
>   err_mmio:
>   	iounmap(gmu->mmio);
> -	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -		iounmap(gmu->rscc);
> -	free_irq(gmu->gmu_irq, gmu);
> -	free_irq(gmu->hfi_irq, gmu);
> +	if (!gmu->legacy) {
> +		if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> +			iounmap(gmu->rscc);
> +		free_irq(gmu->gmu_irq, gmu);
> +		free_irq(gmu->hfi_irq, gmu);
> +	}
>   
>   err_memory:
> -	a6xx_gmu_memory_free(gmu);
> -err_put_device:
> -	/* Drop reference taken in of_find_device_by_node */
> -	put_device(gmu->dev);
> +	if (!gmu->legacy)
> +		a6xx_gmu_memory_free(gmu);
>   
>   	return ret;
>   }
> +
> +static const struct component_ops a6xx_gmu_ops = {
> +	.bind   = a6xx_gmu_bind,
> +	.unbind = a6xx_gmu_unbind,
> +};
> +
> +static int a6xx_gmu_probe(struct platform_device *pdev)
> +{
> +	return component_add(&pdev->dev, &a6xx_gmu_ops);
> +}
> +
> +static void a6xx_gmu_remove(struct platform_device *pdev)
> +{
> +
> +	component_del(&pdev->dev, &a6xx_gmu_ops);
> +}
> +
> +static const struct of_device_id dt_match[] = {
> +	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,adreno-gmu-wrapper" },
> +	{}
> +};
> +
> +static struct platform_driver a6xx_gmu_drv = {
> +	.probe = a6xx_gmu_probe,
> +	.remove = a6xx_gmu_remove,
> +	.driver = {
> +		.name = "a6xx_gmu",
> +		.of_match_table = dt_match,
> +	},
> +};
> +
> +void __init a6xx_gmu_register(void)
> +{
> +	platform_driver_register(&a6xx_gmu_drv);
> +}
> +
> +void __exit a6xx_gmu_unregister(void)
> +{
> +	platform_driver_unregister(&a6xx_gmu_drv);
> +}
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b8f8ae940b55..d418f49f47a1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2352,8 +2352,6 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>   
>   	a6xx_llc_slices_destroy(a6xx_gpu);
>   
> -	a6xx_gmu_remove(a6xx_gpu);
> -
>   	adreno_gpu_cleanup(adreno_gpu);
>   
>   	kfree(a6xx_gpu);
> @@ -2689,10 +2687,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>   		priv->gpu_clamp_to_idle = true;
>   
> -	if (adreno_has_gmu_wrapper(adreno_gpu))
> -		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
> -	else
> -		ret = a6xx_gmu_init(a6xx_gpu, node);
>   	of_node_put(node);
>   	if (ret) {
>   		a6xx_destroy(&(a6xx_gpu->base.base));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 0b17d36c36a9..070af413e5ad 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -252,9 +252,6 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu);
>   int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>   void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>   
> -int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> -int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> -void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>   void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
>   
>   void a6xx_preempt_init(struct msm_gpu *gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 28f744f3caf7..9f9b5863a8de 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -415,6 +415,8 @@ void __init adreno_register(void)
>   		return;
>   
>   	platform_driver_register(&adreno_driver);
> +
> +	a6xx_gmu_register();
>   }
>   
>   void __exit adreno_unregister(void)
> @@ -422,5 +424,7 @@ void __exit adreno_unregister(void)
>   	if (skip_gpu)
>   		return;
>   
> +	a6xx_gmu_unregister();
> +
>   	platform_driver_unregister(&adreno_driver);
>   }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 390fa6720d9b..d3a653adbc72 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -678,6 +678,10 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev);
>   struct msm_gpu *a4xx_gpu_init(struct drm_device *dev);
>   struct msm_gpu *a5xx_gpu_init(struct drm_device *dev);
>   struct msm_gpu *a6xx_gpu_init(struct drm_device *dev);
> +struct msm_gpu *a6xx_gpu_init(struct drm_device *dev);
> +
> +void __init a6xx_gmu_register(void);
> +void __exit a6xx_gmu_unregister(void);
>   
>   static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>   {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7e977fec4100..0618da7e8b40 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -998,18 +998,30 @@ static const struct of_device_id msm_gpu_match[] = {
>   	{ },
>   };
>   
> +static const struct of_device_id msm_gmu_match[] = {
> +	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,adreno-gmu-wrapper" },
> +	{ },
> +};
> +
>   static int add_gpu_components(struct device *dev,
>   			      struct component_match **matchptr)
>   {
> -	struct device_node *np;
> +	struct device_node *np, *gmu;
>   
>   	np = of_find_matching_node(NULL, msm_gpu_match);
>   	if (!np)
>   		return 0;
>   
> -	if (of_device_is_available(np) && adreno_has_gpu(np))
> +	if (of_device_is_available(np) && adreno_has_gpu(np)) {
>   		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>   
> +		gmu = of_find_matching_node(NULL, msm_gmu_match);
> +		if (of_device_is_available(gmu))
> +			drm_of_component_match_add(dev, matchptr, component_compare_of, gmu);
> +		of_node_put(gmu);
> +	}
> +
>   	of_node_put(np);
>   
>   	return 0;
> 
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
> 
> Best regards,

Hi Neil,

thanks for the patch. With it applied, my GPU fails to initialize.
Here's the related dmesg section:

[    1.733062] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x50020000
[    1.735229] [drm] Initialized msm 1.13.0 for 
ae01000.display-controller on minor 0
[    1.735403] msm_dpu ae01000.display-controller: 
[drm:adreno_request_fw] loaded qcom/a630_sqe.fw from new location
[    1.735513] msm_dpu ae01000.display-controller: 
[drm:adreno_request_fw] loaded qcom/a630_gmu.bin from new location
[    1.746710] a6xx_gmu 506a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* 
Timeout waiting for GMU OOB set BOOT_SLUMBER: 0x800000
[    1.746766] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] 
*ERROR* Couldn't power up the GPU: -110

This could be because I have an Adreno 630-family GPU, which is marked 
as legacy in a6xx_gmu_init / a6xx_gmu_bind. Previously, the rest of the 
init code would just always run, while now, some parts are conditionally 
disabled for legacy GPUs - that may be unintentional? However, 
unconditionally enabling those parts seems to fail to initialize the GPU 
followed by a reset shortly after, so there's probably more to this.

Please let me know if there's anything I can do to help debug this.

Best regards,
Jens
