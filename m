Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02946A84468
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B7610E9B2;
	Thu, 10 Apr 2025 13:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4041B10E9B2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:16:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7A751063
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:16:49 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FDBA3F6A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:16:49 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:16:35 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 3/4] drm/panthor: Label all kernel BO's
Message-ID: <Z_fEs1hMv0Dc4qYE@e110455-lin.cambridge.arm.com>
References: <20250409212233.2036154-1-adrian.larumbe@collabora.com>
 <20250409212233.2036154-4-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409212233.2036154-4-adrian.larumbe@collabora.com>
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

On Wed, Apr 09, 2025 at 10:22:21PM +0100, Adrián Larumbe wrote:
> Kernel BO's aren't exposed to UM, so labelling them is the responsibility
> of the driver itself. This kind of tagging will prove useful in further
> commits when want to expose these objects through DebugFS.
> 
> Expand panthor_kernel_bo_create() interface to take a NULL-terminated
> string. No bounds checking is done because all label strings are given
> as statically-allocated literals, but if a more complex kernel BO naming
> scheme with explicit memory allocation and formatting was desired in the
> future, this would have to change.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
>  drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
>  drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
>  drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
>  drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
>  5 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0f52766a3120..a7fdc4d8020d 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -449,7 +449,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
>  				       DRM_PANTHOR_BO_NO_MMAP,
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -				       PANTHOR_VM_KERNEL_AUTO_VA);
> +				       PANTHOR_VM_KERNEL_AUTO_VA,
> +				       "Queue FW interface");
>  	if (IS_ERR(mem))
>  		return mem;
>  
> @@ -481,7 +482,8 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
>  	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
>  					DRM_PANTHOR_BO_NO_MMAP,
>  					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -					PANTHOR_VM_KERNEL_AUTO_VA);
> +					PANTHOR_VM_KERNEL_AUTO_VA,
> +					"FW suspend buffer");
>  }
>  
>  static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> @@ -601,7 +603,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
>  							section_size,
>  							DRM_PANTHOR_BO_NO_MMAP,
> -							vm_map_flags, va);
> +							vm_map_flags, va, "FW section");

Nit: we could add the section->name if available and if we want a more detailed label, but
it is not critical.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  		if (IS_ERR(section->mem))
>  			return PTR_ERR(section->mem);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index af0ac17f357f..3c5fc854356e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -82,7 +82,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va)
> +			 u64 gpu_va, const char *name)
>  {
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
> @@ -106,6 +106,8 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	kbo->obj = &obj->base;
>  	bo->flags = bo_flags;
>  
> +	panthor_gem_kernel_bo_set_label(kbo, name);
> +
>  	/* The system and GPU MMU page size might differ, which becomes a
>  	 * problem for FW sections that need to be mapped at explicit address
>  	 * since our PAGE_SIZE alignment might cover a VA range that's
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index beba066b4974..62aea06dbc6d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -153,7 +153,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va);
> +			 u64 gpu_va, const char *name);
>  
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3bdf61c14264..d236e9ceade4 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -151,7 +151,8 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
>  	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
>  					     DRM_PANTHOR_BO_NO_MMAP,
>  					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -					     PANTHOR_VM_KERNEL_AUTO_VA);
> +					     PANTHOR_VM_KERNEL_AUTO_VA,
> +					     "Tiler heap chunk");
>  	if (IS_ERR(chunk->bo)) {
>  		ret = PTR_ERR(chunk->bo);
>  		goto err_free_chunk;
> @@ -555,7 +556,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
>  	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
>  						      DRM_PANTHOR_BO_NO_MMAP,
>  						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -						      PANTHOR_VM_KERNEL_AUTO_VA);
> +						      PANTHOR_VM_KERNEL_AUTO_VA,
> +						      "Heap pool");
>  	if (IS_ERR(pool->gpu_contexts)) {
>  		ret = PTR_ERR(pool->gpu_contexts);
>  		goto err_destroy_pool;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 446ec780eb4a..43ee57728de5 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3332,7 +3332,8 @@ group_create_queue(struct panthor_group *group,
>  						  DRM_PANTHOR_BO_NO_MMAP,
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						  PANTHOR_VM_KERNEL_AUTO_VA);
> +						  PANTHOR_VM_KERNEL_AUTO_VA,
> +						  "CS ring buffer");
>  	if (IS_ERR(queue->ringbuf)) {
>  		ret = PTR_ERR(queue->ringbuf);
>  		goto err_free_queue;
> @@ -3362,7 +3363,8 @@ group_create_queue(struct panthor_group *group,
>  					 DRM_PANTHOR_BO_NO_MMAP,
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -					 PANTHOR_VM_KERNEL_AUTO_VA);
> +					 PANTHOR_VM_KERNEL_AUTO_VA,
> +					 "Group job stats");
>  
>  	if (IS_ERR(queue->profiling.slots)) {
>  		ret = PTR_ERR(queue->profiling.slots);
> @@ -3493,7 +3495,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  						   DRM_PANTHOR_BO_NO_MMAP,
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						   PANTHOR_VM_KERNEL_AUTO_VA);
> +						   PANTHOR_VM_KERNEL_AUTO_VA,
> +						   "Group sync objects");
>  	if (IS_ERR(group->syncobjs)) {
>  		ret = PTR_ERR(group->syncobjs);
>  		goto err_put_group;
> -- 
> 2.48.1
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
