Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C667FC9BC1C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 15:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243C510E67D;
	Tue,  2 Dec 2025 14:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC2B710E674
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 14:21:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347E2153B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:21:52 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 58A293F73B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:21:59 -0800 (PST)
Date: Tue, 2 Dec 2025 14:21:40 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 2/3] drm/panthor: Make sure caches are
 flushed/invalidated when an AS is recycled
Message-ID: <aS719IXbHLkD2gsj@e142607>
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
 <20251202133538.83078-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202133538.83078-3-boris.brezillon@collabora.com>
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

On Tue, Dec 02, 2025 at 02:35:37PM +0100, Boris Brezillon wrote:
> When we re-assign a slot to a different VM, we need to make sure the
> old VM caches are flushed before doing the switch. Specialize
> panthor_mmu_as_disable() so we can skip the slot programmation while
> still getting the cache flushing, and call this helper from
> panthor_vm_active() when an idle slot is recycled.
> 
> Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 8ba5259e3d28..3644af1a8e56 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -585,7 +585,8 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
>  
> -static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
> +static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
> +				  bool recycle_slot)
>  {
>  	int ret;
>  
> @@ -595,6 +596,12 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	if (ret)
>  		return ret;
>  
> +	/* If the slot is going to be used immediately, don't bother changing
> +	 * the config.
> +	 */
> +	if (recycle_slot)
> +		return 0;
> +
>  	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
>  	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
>  	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
> @@ -714,6 +721,11 @@ int panthor_vm_active(struct panthor_vm *vm)
>  
>  		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
>  		as = lru_vm->as.id;
> +
> +		ret = panthor_mmu_as_disable(ptdev, as, true);
> +		if (ret)
> +			goto out_unlock;
> +
>  		panthor_vm_release_as_locked(lru_vm);
>  	}
>  
> @@ -853,7 +865,7 @@ static void panthor_vm_declare_unusable(struct panthor_vm *vm)
>  	vm->unusable = true;
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  	if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
> -		panthor_mmu_as_disable(ptdev, vm->as.id);
> +		panthor_mmu_as_disable(ptdev, vm->as.id, false);
>  		drm_dev_exit(cookie);
>  	}
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> @@ -1780,7 +1792,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
>  
>  		/* Disable the MMU to kill jobs on this AS. */
> -		panthor_mmu_as_disable(ptdev, as);
> +		panthor_mmu_as_disable(ptdev, as, false);
>  		mutex_unlock(&ptdev->mmu->as.slots_lock);
>  
>  		status &= ~mask;
> @@ -1809,7 +1821,8 @@ void panthor_mmu_suspend(struct panthor_device *ptdev)
>  		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
>  
>  		if (vm) {
> -			drm_WARN_ON(&ptdev->base, panthor_mmu_as_disable(ptdev, i));
> +			drm_WARN_ON(&ptdev->base,
> +				    panthor_mmu_as_disable(ptdev, i, false));
>  			panthor_vm_release_as_locked(vm);
>  		}
>  	}
> @@ -1930,7 +1943,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
>  		int cookie;
>  
>  		if (drm_dev_enter(&ptdev->base, &cookie)) {
> -			panthor_mmu_as_disable(ptdev, vm->as.id);
> +			panthor_mmu_as_disable(ptdev, vm->as.id, false);
>  			drm_dev_exit(cookie);
>  		}
>  
> @@ -2790,7 +2803,8 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
>  		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
>  
>  		if (vm) {
> -			drm_WARN_ON(&ptdev->base, panthor_mmu_as_disable(ptdev, i));
> +			drm_WARN_ON(&ptdev->base,
> +				    panthor_mmu_as_disable(ptdev, i, false));
>  			panthor_vm_release_as_locked(vm);
>  		}
>  	}
> -- 
> 2.51.1
> 
