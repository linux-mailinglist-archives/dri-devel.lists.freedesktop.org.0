Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8D69DE711
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770D710EE15;
	Fri, 29 Nov 2024 13:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VcU6qFYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29110EE15
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732886102; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EPYX9ePTkigu82lf27tAuOHFRkSrmK4uSaYdYGK1p2JfquNYjTISe7ty6HYDqswLdjAVaT0RajEL3wiJB6gGF3tPmwnXs26DvakdxLVpg28eiTUiw1j7n4t3h6pAiHVkxILEtO+oz7aP2QcmOBItTBpcY9f2cOrbdPQ/AapYnuc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732886102;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tL3qklCA2ufBqhMoSINKqRQnp77HyDUBoB5Q+9T4wWs=; 
 b=NK7p6ACPkkXULS2k8ILs+aZhcN5CB6YR4FRWv/Ilq8P697XsiqWitqYJyLFYAdEHfFB8mdLuczH1dBjAtfmk54y2OgJSwrRkHRmDIrA0cfaGpYo/sJiiW5JMis8t+/YxgzpgTsakmW1L32PrtrlvjyefKEZMwu4xzAm7WVoxkWs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732886102; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=tL3qklCA2ufBqhMoSINKqRQnp77HyDUBoB5Q+9T4wWs=;
 b=VcU6qFYhrUEmDdlGeXjqIUW9invuBvFMoXkvTsRlCNLjYb1qqWf4t45Fs8TjnB3s
 ZqPPwlLb/xL5G23aehcVcVz4B6OjWXLx3zF32lmarAllmrwh+F1M7sKBK6KLmGjrZsd
 nWqqtQjJjgIqBpKjJ2Pvdh8LdONV5CuPUiComylI=
Received: by mx.zohomail.com with SMTPS id 173288610067344.00738005853407;
 Fri, 29 Nov 2024 05:15:00 -0800 (PST)
Date: Fri, 29 Nov 2024 13:14:58 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
Message-ID: <dyvywyidxz5scfg4fl4oqgcpg6qvh27wvekfovoomreriqqnim@3osvn3joyfeu>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128110255.3182366-3-boris.brezillon@collabora.com>
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

Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>

On 28.11.2024 12:02, Boris Brezillon wrote:
> The runtime PM resume operation is not guaranteed to succeed, but if it
> fails, the device should be in a suspended state. Make sure we're robust
> to resume failures in the unplug path.
> 
> v2:
> - Move the bit that belonged in the next commit
> - Drop the panthor_device_unplug() changes
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c  | 14 +++++++++-----
>  drivers/gpu/drm/panthor/panthor_gpu.c |  3 ++-
>  drivers/gpu/drm/panthor/panthor_mmu.c |  3 ++-
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index ebf8980ca9a3..f3d3d8fbe13d 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -12,6 +12,7 @@
>  #include <linux/iosys-map.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
> @@ -1190,11 +1191,13 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  
>  	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
>  
> -	/* Make sure the IRQ handler can be called after that point. */
> -	if (ptdev->fw->irq.irq)
> -		panthor_job_irq_suspend(&ptdev->fw->irq);
> +	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev)) {
> +		/* Make sure the IRQ handler can be called after that point. */

Did you mean 'cannot be called' ?

> +		if (ptdev->fw->irq.irq)
> +			panthor_job_irq_suspend(&ptdev->fw->irq);
>  
> -	panthor_fw_stop(ptdev);
> +		panthor_fw_stop(ptdev);
> +	}
>  
>  	list_for_each_entry(section, &ptdev->fw->sections, node)
>  		panthor_kernel_bo_destroy(section->mem);
> @@ -1207,7 +1210,8 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  	panthor_vm_put(ptdev->fw->vm);
>  	ptdev->fw->vm = NULL;
>  
> -	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> +	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
> +		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 0f3cac6ec88e..ee85a371bc38 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -180,7 +180,8 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
>  	unsigned long flags;
>  
>  	/* Make sure the IRQ handler is not running after that point. */
> -	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
> +	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
> +		panthor_gpu_irq_suspend(&ptdev->gpu->irq);
>  
>  	/* Wake-up all waiters. */
>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 9478ee2093d1..6716463903bc 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2681,7 +2681,8 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
>   */
>  void panthor_mmu_unplug(struct panthor_device *ptdev)
>  {
> -	panthor_mmu_irq_suspend(&ptdev->mmu->irq);
> +	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
> +		panthor_mmu_irq_suspend(&ptdev->mmu->irq);
>  
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
> -- 
> 2.46.2
