Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BBBDF62A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606CD10E84C;
	Wed, 15 Oct 2025 15:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7BF810E84C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:31:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA731655;
 Wed, 15 Oct 2025 08:31:13 -0700 (PDT)
Received: from [10.1.31.33] (e122027.cambridge.arm.com [10.1.31.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF8683F738;
 Wed, 15 Oct 2025 08:31:18 -0700 (PDT)
Message-ID: <9dc6560e-42ea-4dd9-8893-81308bacf5fc@arm.com>
Date: Wed, 15 Oct 2025 16:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drm/panthor: Add flag to map GEM object
 Write-Back Cacheable
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 kernel@collabora.com
References: <20251015130103.3634560-1-boris.brezillon@collabora.com>
 <20251015130103.3634560-9-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251015130103.3634560-9-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 15/10/2025 14:00, Boris Brezillon wrote:
> From: Loïc Molinari <loic.molinari@collabora.com>
> 
> Will be used by the UMD to optimize CPU accesses to buffers
> that are frequently read by the CPU, or on which the access
> pattern makes non-cacheable mappings inefficient.
> 
> Mapping buffers CPU-cached implies taking care of the CPU
> cache maintenance in the UMD, unless the GPU is IO coherent.
> 
> v2:
> - Add more to the commit message
> - Tweak the doc
> - Make sure we sync the section of the BO pointing to the CS
>   syncobj before we read its seqno
> 
> v3:
> - Fix formatting/spelling issues
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   |  7 ++++++-
>  drivers/gpu/drm/panthor/panthor_gem.c   |  3 +++
>  drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++++++++--
>  include/uapi/drm/panthor_drm.h          |  9 +++++++++
>  4 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 9004d0ba0e45..d2c321404a75 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -900,7 +900,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device *ddev, void *data,
>  	return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
>  }
>  
> -#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
> +#define PANTHOR_BO_FLAGS		(DRM_PANTHOR_BO_NO_MMAP | \
> +					 DRM_PANTHOR_BO_WB_MMAP)
>  
>  static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
>  				   struct drm_file *file)
> @@ -919,6 +920,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
>  		goto out_dev_exit;
>  	}
>  
> +	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> +	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> +		return -EINVAL;
> +
>  	if (args->exclusive_vm_id) {
>  		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
>  		if (!vm) {
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 617e04134d30..a0ccc316e375 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -280,6 +280,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	bo = to_panthor_bo(&shmem->base);
>  	bo->flags = flags;
>  
> +	if (flags & DRM_PANTHOR_BO_WB_MMAP)
> +		shmem->map_wc = false;
> +
>  	if (exclusive_vm) {
>  		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
>  		drm_gem_object_get(bo->exclusive_vm_root_gem);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index f5e01cb16cfc..a17427cabf2a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -868,8 +868,11 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
>  	struct iosys_map map;
>  	int ret;
>  
> -	if (queue->syncwait.kmap)
> -		return queue->syncwait.kmap + queue->syncwait.offset;
> +	if (queue->syncwait.kmap) {
> +		bo = container_of(queue->syncwait.obj,
> +				  struct panthor_gem_object, base.base);
> +		goto out_sync;
> +	}
>  
>  	bo = panthor_vm_get_bo_for_va(group->vm,
>  				      queue->syncwait.gpu_va,
> @@ -886,6 +889,17 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
>  	if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
>  		goto err_put_syncwait_obj;
>  
> +out_sync:
> +	/* Make sure the CPU caches are invalidated before the seqno is read.
> +	 * drm_gem_shmem_sync() is a NOP if map_wc=false, so no need to check
> +	 * it here.
> +	 */
> +	drm_gem_shmem_sync(&bo->base, queue->syncwait.offset,
> +			   queue->syncwait.sync64 ?
> +				   sizeof(struct panthor_syncobj_64b) :
> +				   sizeof(struct panthor_syncobj_32b),
> +			   DRM_GEM_OBJECT_CPU_ACCESS | DRM_GEM_OBJECT_READ_ACCESS);
> +
>  	return queue->syncwait.kmap + queue->syncwait.offset;
>  
>  err_put_syncwait_obj:
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 63ea44ab961d..dca162781bb2 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -681,6 +681,15 @@ struct drm_panthor_vm_get_state {
>  enum drm_panthor_bo_flags {
>  	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
>  	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapping.
> +	 *
> +	 * CPU map the buffer object in userspace by forcing the "Write-Back
> +	 * Cacheable" cacheability attribute. The mapping otherwise uses the
> +	 * "Non-Cacheable" attribute if the GPU is not IO coherent.
> +	 */
> +	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
>  };
>  
>  /**

