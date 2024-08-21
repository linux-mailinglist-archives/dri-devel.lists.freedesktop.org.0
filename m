Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682C959965
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 13:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE8A10E8DA;
	Wed, 21 Aug 2024 11:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BED4510E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 11:18:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 334E1DA7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 04:18:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E41BB3F73B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 04:18:06 -0700 (PDT)
Date: Wed, 21 Aug 2024 12:17:53 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: flush FW AS caches in slow reset path
Message-ID: <ZsXM4asd99z98HYb@e110455-lin.cambridge.arm.com>
References: <20240816185250.344080-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816185250.344080-1-adrian.larumbe@collabora.com>
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

On Fri, Aug 16, 2024 at 07:52:49PM +0100, Adrián Larumbe wrote:
> In the off-chance that waiting for the firmware to signal its booted status
> timed out in the fast reset path, one must flush the cache lines for the
> entire FW VM address space before reloading the regions, otherwise stale
> values eventually lead to a scheduler job timeout.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Looks good to me!

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c  |  8 +++++++-
>  drivers/gpu/drm/panthor/panthor_mmu.c | 19 ++++++++++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
>  3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 857f3f11258a..ef232c0c2049 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1089,6 +1089,12 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  		panthor_fw_stop(ptdev);
>  		ptdev->fw->fast_reset = false;
>  		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
> +
> +		ret = panthor_vm_flush_all(ptdev->fw->vm);
> +		if (ret) {
> +			drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS l2cache)");
> +			return ret;
> +		}
>  	}
>  
>  	/* Reload all sections, including RO ones. We're not supposed
> @@ -1099,7 +1105,7 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  
>  	ret = panthor_fw_start(ptdev);
>  	if (ret) {
> -		drm_err(&ptdev->base, "FW slow reset failed");
> +		drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )");
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d47972806d50..a77ee5ce691d 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -874,14 +874,27 @@ static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return 0;
>  
> -	/* Flush the PTs only if we're already awake */
> -	if (pm_runtime_active(ptdev->base.dev))
> -		ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
> +	/*
> +	 * If we made it this far, that means the device is awake, because
> +	 * upon device suspension, all active VMs are given an AS id of -1
> +	 */
> +	ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
>  
>  	drm_dev_exit(cookie);
>  	return ret;
>  }
>  
> +/**
> + * panthor_vm_flush_all() - Flush L2 caches for the entirety of a VM's AS
> + * @vm: VM whose cache to flush
> + *
> + * Return: 0 on success, a negative error code if flush failed.
> + */
> +int panthor_vm_flush_all(struct panthor_vm *vm)
> +{
> +	return panthor_vm_flush_range(vm, vm->base.mm_start, vm->base.mm_range);
> +}
> +
>  static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  {
>  	struct panthor_device *ptdev = vm->ptdev;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index f3c1ed19f973..6788771071e3 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -31,6 +31,7 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset);
>  int panthor_vm_active(struct panthor_vm *vm);
>  void panthor_vm_idle(struct panthor_vm *vm);
>  int panthor_vm_as(struct panthor_vm *vm);
> +int panthor_vm_flush_all(struct panthor_vm *vm);
>  
>  struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
> -- 
> 2.46.0
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
