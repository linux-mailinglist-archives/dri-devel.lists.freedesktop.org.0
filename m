Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE319C888A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 12:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22B010E7E6;
	Thu, 14 Nov 2024 11:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C47C10E7E6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 11:13:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF741480
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 03:14:03 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3AEB3F6A8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 03:13:33 -0800 (PST)
Date: Thu, 14 Nov 2024 11:13:29 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
Message-ID: <ZzXbWUtF_oxWXl9G@e110455-lin.cambridge.arm.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241113154257.1971284-3-boris.brezillon@collabora.com>
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

On Wed, Nov 13, 2024 at 04:42:54PM +0100, Boris Brezillon wrote:
> The runtime PM resume operation is not guaranteed to succeed, but if it
> fails, the device should be in a suspended state. Make sure we're robust
> to resume failures in the unplug path.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 23 ++++++++---------------
>  drivers/gpu/drm/panthor/panthor_fw.c     | 14 +++++++++-----
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  3 ++-
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  3 ++-
>  4 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index db7ba40f771d..8b5d54b2bbb4 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -48,6 +48,8 @@ static int panthor_clk_init(struct panthor_device *ptdev)
>  
>  void panthor_device_unplug(struct panthor_device *ptdev)
>  {
> +	int ret;
> +
>  	/* This function can be called from two different path: the reset work
>  	 * and the platform device remove callback. drm_dev_unplug() doesn't
>  	 * deal with concurrent callers, so we have to protect drm_dev_unplug()
> @@ -74,7 +76,8 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	 */
>  	mutex_unlock(&ptdev->unplug.lock);
>  
> -	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> +	ret = pm_runtime_get_sync(ptdev->base.dev);
> +	drm_WARN_ON(&ptdev->base, ret < 0);
>  
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
> @@ -85,7 +88,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	panthor_gpu_unplug(ptdev);
>  
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> -	pm_runtime_put_sync_suspend(ptdev->base.dev);
> +
> +	/* If the resume failed, we don't need to suspend here. */
> +	if (!ret)
> +		pm_runtime_put_sync_suspend(ptdev->base.dev);
>  
>  	/* If PM is disabled, we need to call the suspend handler manually. */
>  	if (!IS_ENABLED(CONFIG_PM))
> @@ -541,17 +547,4 @@ int panthor_device_suspend(struct device *dev)
>  	clk_disable_unprepare(ptdev->clks.core);
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>  	return 0;
> -
> -err_set_active:

Label is being deleted here, but I don't see where the `goto err_set_active` is being removed.

Best regards,
Liviu

> -	/* If something failed and we have to revert back to an
> -	 * active state, we also need to clear the MMIO userspace
> -	 * mappings, so any dumb pages that were mapped while we
> -	 * were trying to suspend gets invalidated.
> -	 */
> -	mutex_lock(&ptdev->pm.mmio_lock);
> -	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
> -	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
> -			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> -	mutex_unlock(&ptdev->pm.mmio_lock);
> -	return ret;
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 2060085cc9f3..df74750cf1b7 100644
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
> @@ -1188,11 +1189,13 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
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
> @@ -1205,7 +1208,8 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
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
> index 2d3529a0b156..27702bc62dd6 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -174,7 +174,8 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
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
> index c2262c72e8e2..fee6c7d9fe0a 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2674,7 +2674,8 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
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
