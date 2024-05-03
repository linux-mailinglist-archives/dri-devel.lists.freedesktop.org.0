Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4B8BA9C5
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F2810FA27;
	Fri,  3 May 2024 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A012210FA27
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:22:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DC0E2F4;
 Fri,  3 May 2024 02:22:30 -0700 (PDT)
Received: from [10.1.39.22] (e122027.cambridge.arm.com [10.1.39.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 249193F73F;
 Fri,  3 May 2024 02:22:04 -0700 (PDT)
Message-ID: <fd2be068-e3a6-4fa9-8bd7-492cf2080691@arm.com>
Date: Fri, 3 May 2024 10:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panthor: Keep a ref to the VM at the
 panthor_kernel_bo level
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
 <20240502183813.1612017-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502183813.1612017-3-boris.brezillon@collabora.com>
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

On 02/05/2024 19:38, Boris Brezillon wrote:
> Avoids use-after-free situations when panthor_fw_unplug() is called
> and the kernel BO was mapped to the FW VM.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

It makes the code more readable too - I like it.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    |  4 ++--
>  drivers/gpu/drm/panthor/panthor_gem.c   |  8 +++++---
>  drivers/gpu/drm/panthor/panthor_gem.h   |  8 ++++++--
>  drivers/gpu/drm/panthor/panthor_heap.c  |  8 ++++----
>  drivers/gpu/drm/panthor/panthor_sched.c | 11 +++++------
>  5 files changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 181395e2859a..b41685304a83 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -453,7 +453,7 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
>  
>  	ret = panthor_kernel_bo_vmap(mem);
>  	if (ret) {
> -		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), mem);
> +		panthor_kernel_bo_destroy(mem);
>  		return ERR_PTR(ret);
>  	}
>  
> @@ -1133,7 +1133,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  	panthor_fw_stop(ptdev);
>  
>  	list_for_each_entry(section, &ptdev->fw->sections, node)
> -		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), section->mem);
> +		panthor_kernel_bo_destroy(section->mem);
>  
>  	/* We intentionally don't call panthor_vm_idle() and let
>  	 * panthor_mmu_unplug() release the AS we acquired with
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index d6483266d0c2..38f560864879 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -26,18 +26,18 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  
>  /**
>   * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
> - * @vm: The VM this BO was mapped to.
>   * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
>   * is skipped.
>   */
> -void panthor_kernel_bo_destroy(struct panthor_vm *vm,
> -			       struct panthor_kernel_bo *bo)
> +void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  {
> +	struct panthor_vm *vm;
>  	int ret;
>  
>  	if (IS_ERR_OR_NULL(bo))
>  		return;
>  
> +	vm = bo->vm;
>  	panthor_kernel_bo_vunmap(bo);
>  
>  	if (drm_WARN_ON(bo->obj->dev,
> @@ -53,6 +53,7 @@ void panthor_kernel_bo_destroy(struct panthor_vm *vm,
>  	drm_gem_object_put(bo->obj);
>  
>  out_free_bo:
> +	panthor_vm_put(vm);
>  	kfree(bo);
>  }
>  
> @@ -106,6 +107,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	if (ret)
>  		goto err_free_va;
>  
> +	kbo->vm = panthor_vm_get(vm);
>  	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
>  	drm_gem_object_get(bo->exclusive_vm_root_gem);
>  	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 3bccba394d00..e43021cf6d45 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -61,6 +61,11 @@ struct panthor_kernel_bo {
>  	 */
>  	struct drm_gem_object *obj;
>  
> +	/**
> +	 * @vm: VM this private buffer is attached to.
> +	 */
> +	struct panthor_vm *vm;
> +
>  	/**
>  	 * @va_node: VA space allocated to this GEM.
>  	 */
> @@ -136,7 +141,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
>  			 u64 gpu_va);
>  
> -void panthor_kernel_bo_destroy(struct panthor_vm *vm,
> -			       struct panthor_kernel_bo *bo);
> +void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>  
>  #endif /* __PANTHOR_GEM_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 143fa35f2e74..65921296a18c 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -127,7 +127,7 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
>  	heap->chunk_count--;
>  	mutex_unlock(&heap->lock);
>  
> -	panthor_kernel_bo_destroy(vm, chunk->bo);
> +	panthor_kernel_bo_destroy(chunk->bo);
>  	kfree(chunk);
>  }
>  
> @@ -183,7 +183,7 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
>  	return 0;
>  
>  err_destroy_bo:
> -	panthor_kernel_bo_destroy(vm, chunk->bo);
> +	panthor_kernel_bo_destroy(chunk->bo);
>  
>  err_free_chunk:
>  	kfree(chunk);
> @@ -391,7 +391,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
>  	mutex_unlock(&heap->lock);
>  
>  	if (removed) {
> -		panthor_kernel_bo_destroy(pool->vm, chunk->bo);
> +		panthor_kernel_bo_destroy(chunk->bo);
>  		kfree(chunk);
>  		ret = 0;
>  	} else {
> @@ -587,7 +587,7 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
>  		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
>  
>  	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
> -		panthor_kernel_bo_destroy(pool->vm, pool->gpu_contexts);
> +		panthor_kernel_bo_destroy(pool->gpu_contexts);
>  
>  	/* Reflects the fact the pool has been destroyed. */
>  	pool->vm = NULL;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 1d2708c3ab0a..6ea094b00cf9 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -826,8 +826,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  
>  	panthor_queue_put_syncwait_obj(queue);
>  
> -	panthor_kernel_bo_destroy(group->vm, queue->ringbuf);
> -	panthor_kernel_bo_destroy(panthor_fw_vm(group->ptdev), queue->iface.mem);
> +	panthor_kernel_bo_destroy(queue->ringbuf);
> +	panthor_kernel_bo_destroy(queue->iface.mem);
>  
>  	kfree(queue);
>  }
> @@ -837,15 +837,14 @@ static void group_release_work(struct work_struct *work)
>  	struct panthor_group *group = container_of(work,
>  						   struct panthor_group,
>  						   release_work);
> -	struct panthor_device *ptdev = group->ptdev;
>  	u32 i;
>  
>  	for (i = 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
>  
> -	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->suspend_buf);
> -	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->protm_suspend_buf);
> -	panthor_kernel_bo_destroy(group->vm, group->syncobjs);
> +	panthor_kernel_bo_destroy(group->suspend_buf);
> +	panthor_kernel_bo_destroy(group->protm_suspend_buf);
> +	panthor_kernel_bo_destroy(group->syncobjs);
>  
>  	panthor_vm_put(group->vm);
>  	kfree(group);

