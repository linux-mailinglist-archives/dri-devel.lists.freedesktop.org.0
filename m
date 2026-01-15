Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E611BD24C65
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E1B10E75D;
	Thu, 15 Jan 2026 13:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3635D10E75D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:42:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36D091515
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 05:42:13 -0800 (PST)
Received: from e142607.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 A83EB3F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 05:42:19 -0800 (PST)
Date: Thu, 15 Jan 2026 13:41:24 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: Re: [PATCH v1 4/9] drm/panthor: Group panthor_kernel_bo_xxx() helpers
Message-ID: <aWjuhPwho0VMUqxN@e142607>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-5-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109130801.1239558-5-boris.brezillon@collabora.com>
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

On Fri, Jan 09, 2026 at 02:07:56PM +0100, Boris Brezillon wrote:
> Move all panthor_kernel_bo_xxx() helpers at the end of the file, just
> before the debugfs init logic. This will make further panthor_gem.c
> refactoring more readable.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 212 +++++++++++++-------------
>  1 file changed, 106 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 13e9dd3764fa..4b3d82f001d8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -132,112 +132,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  	drm_gem_object_put(vm_root_gem);
>  }
>  
> -/**
> - * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
> - * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
> - * is skipped.
> - */
> -void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
> -{
> -	struct panthor_vm *vm;
> -
> -	if (IS_ERR_OR_NULL(bo))
> -		return;
> -
> -	vm = bo->vm;
> -	panthor_kernel_bo_vunmap(bo);
> -
> -	drm_WARN_ON(bo->obj->dev,
> -		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
> -	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
> -	panthor_vm_free_va(vm, &bo->va_node);
> -	drm_gem_object_put(bo->obj);
> -	panthor_vm_put(vm);
> -	kfree(bo);
> -}
> -
> -/**
> - * panthor_kernel_bo_create() - Create and map a GEM object to a VM
> - * @ptdev: Device.
> - * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
> - * @size: Size of the buffer object.
> - * @bo_flags: Combination of drm_panthor_bo_flags flags.
> - * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
> - * that are related to map operations).
> - * @gpu_va: GPU address assigned when mapping to the VM.
> - * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
> - * automatically allocated.
> - * @name: Descriptive label of the BO's contents
> - *
> - * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
> - */
> -struct panthor_kernel_bo *
> -panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> -			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va, const char *name)
> -{
> -	struct drm_gem_shmem_object *obj;
> -	struct panthor_kernel_bo *kbo;
> -	struct panthor_gem_object *bo;
> -	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
> -	int ret;
> -
> -	if (drm_WARN_ON(&ptdev->base, !vm))
> -		return ERR_PTR(-EINVAL);
> -
> -	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
> -	if (!kbo)
> -		return ERR_PTR(-ENOMEM);
> -
> -	obj = drm_gem_shmem_create(&ptdev->base, size);
> -	if (IS_ERR(obj)) {
> -		ret = PTR_ERR(obj);
> -		goto err_free_bo;
> -	}
> -
> -	bo = to_panthor_bo(&obj->base);
> -	kbo->obj = &obj->base;
> -	bo->flags = bo_flags;
> -	bo->base.map_wc = should_map_wc(bo, vm);
> -	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
> -	drm_gem_object_get(bo->exclusive_vm_root_gem);
> -	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
> -
> -	if (vm == panthor_fw_vm(ptdev))
> -		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
> -
> -	panthor_gem_kernel_bo_set_label(kbo, name);
> -	panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debug_flags);
> -
> -	/* The system and GPU MMU page size might differ, which becomes a
> -	 * problem for FW sections that need to be mapped at explicit address
> -	 * since our PAGE_SIZE alignment might cover a VA range that's
> -	 * expected to be used for another section.
> -	 * Make sure we never map more than we need.
> -	 */
> -	size = ALIGN(size, panthor_vm_page_size(vm));
> -	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
> -	if (ret)
> -		goto err_put_obj;
> -
> -	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
> -	if (ret)
> -		goto err_free_va;
> -
> -	kbo->vm = panthor_vm_get(vm);
> -	return kbo;
> -
> -err_free_va:
> -	panthor_vm_free_va(vm, &kbo->va_node);
> -
> -err_put_obj:
> -	drm_gem_object_put(&obj->base);
> -
> -err_free_bo:
> -	kfree(kbo);
> -	return ERR_PTR(ret);
> -}
> -
>  static struct sg_table *
>  panthor_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
>  			      enum dma_data_direction dir)
> @@ -603,6 +497,112 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
>  	return 0;
>  }
>  
> +/**
> + * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
> + * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
> + * is skipped.
> + */
> +void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
> +{
> +	struct panthor_vm *vm;
> +
> +	if (IS_ERR_OR_NULL(bo))
> +		return;
> +
> +	vm = bo->vm;
> +	panthor_kernel_bo_vunmap(bo);
> +
> +	drm_WARN_ON(bo->obj->dev,
> +		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
> +	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
> +	panthor_vm_free_va(vm, &bo->va_node);
> +	drm_gem_object_put(bo->obj);
> +	panthor_vm_put(vm);
> +	kfree(bo);
> +}
> +
> +/**
> + * panthor_kernel_bo_create() - Create and map a GEM object to a VM
> + * @ptdev: Device.
> + * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
> + * @size: Size of the buffer object.
> + * @bo_flags: Combination of drm_panthor_bo_flags flags.
> + * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
> + * that are related to map operations).
> + * @gpu_va: GPU address assigned when mapping to the VM.
> + * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
> + * automatically allocated.
> + * @name: Descriptive label of the BO's contents
> + *
> + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
> + */
> +struct panthor_kernel_bo *
> +panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> +			 size_t size, u32 bo_flags, u32 vm_map_flags,
> +			 u64 gpu_va, const char *name)
> +{
> +	struct drm_gem_shmem_object *obj;
> +	struct panthor_kernel_bo *kbo;
> +	struct panthor_gem_object *bo;
> +	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
> +	int ret;
> +
> +	if (drm_WARN_ON(&ptdev->base, !vm))
> +		return ERR_PTR(-EINVAL);
> +
> +	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
> +	if (!kbo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj = drm_gem_shmem_create(&ptdev->base, size);
> +	if (IS_ERR(obj)) {
> +		ret = PTR_ERR(obj);
> +		goto err_free_bo;
> +	}
> +
> +	bo = to_panthor_bo(&obj->base);
> +	kbo->obj = &obj->base;
> +	bo->flags = bo_flags;
> +	bo->base.map_wc = should_map_wc(bo, vm);
> +	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
> +	drm_gem_object_get(bo->exclusive_vm_root_gem);
> +	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
> +
> +	if (vm == panthor_fw_vm(ptdev))
> +		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
> +
> +	panthor_gem_kernel_bo_set_label(kbo, name);
> +	panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debug_flags);
> +
> +	/* The system and GPU MMU page size might differ, which becomes a
> +	 * problem for FW sections that need to be mapped at explicit address
> +	 * since our PAGE_SIZE alignment might cover a VA range that's
> +	 * expected to be used for another section.
> +	 * Make sure we never map more than we need.
> +	 */
> +	size = ALIGN(size, panthor_vm_page_size(vm));
> +	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
> +	if (ret)
> +		goto err_put_obj;
> +
> +	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
> +	if (ret)
> +		goto err_free_va;
> +
> +	kbo->vm = panthor_vm_get(vm);
> +	return kbo;
> +
> +err_free_va:
> +	panthor_vm_free_va(vm, &kbo->va_node);
> +
> +err_put_obj:
> +	drm_gem_object_put(&obj->base);
> +
> +err_free_bo:
> +	kfree(kbo);
> +	return ERR_PTR(ret);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  struct gem_size_totals {
>  	size_t size;
> -- 
> 2.52.0
> 
