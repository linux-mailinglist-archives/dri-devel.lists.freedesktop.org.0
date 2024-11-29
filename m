Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5C9DE945
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF03E10E4F5;
	Fri, 29 Nov 2024 15:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED21A10E4F5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:22:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCEE612FC;
 Fri, 29 Nov 2024 07:22:36 -0800 (PST)
Received: from [10.57.92.242] (unknown [10.57.92.242])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66C533F66E;
 Fri, 29 Nov 2024 07:22:00 -0800 (PST)
Message-ID: <349942ec-aab0-4b6a-bddc-246d549d6d66@arm.com>
Date: Fri, 29 Nov 2024 15:21:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241128110255.3182366-3-boris.brezillon@collabora.com>
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

On 28/11/2024 11:02, Boris Brezillon wrote:
> The runtime PM resume operation is not guaranteed to succeed, but if it
> fails, the device should be in a suspended state. Make sure we're robust
> to resume failures in the unplug path.
> 
> v2:
> - Move the bit that belonged in the next commit
> - Drop the panthor_device_unplug() changes
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

With the comment fix:

Reviewed-by: Steven Price <steven.price@arm.com>

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

