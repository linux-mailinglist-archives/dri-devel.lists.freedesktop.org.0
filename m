Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559A99CB9E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 15:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF5410E2A0;
	Mon, 14 Oct 2024 13:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCB8310E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 13:34:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C64091007;
 Mon, 14 Oct 2024 06:34:58 -0700 (PDT)
Received: from [10.57.21.126] (unknown [10.57.21.126])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B4F53F71E;
 Mon, 14 Oct 2024 06:34:27 -0700 (PDT)
Message-ID: <37126cf9-0468-4e0f-aefe-d4b5edd2d78a@arm.com>
Date: Mon, 14 Oct 2024 14:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix firmware initialization on systems
 with a page size > 4k
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241014093134.464059-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241014093134.464059-1-boris.brezillon@collabora.com>
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

On 14/10/2024 10:31, Boris Brezillon wrote:
> The system and GPU MMU page size might differ, which becomes a
> problem for FW sections that need to be mapped at explicit address
> since our PAGE_SIZE alignment might cover a VA range that's
> expected to be used for another section.
> 
> Make sure we never map more than we need.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Steve, Liviu, Adrian, I intentionally dropped the R-b because of
> the panthor_vm_page_size() change. Feel free to add it back if
> you're happy with the new version.

Personally I think the panthor_vm_page_size() function is overkill, a
#define would seem plenty to me.

One other minor nit (see below), but either way:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c  |  4 ++--
>  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
>  4 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index ef232c0c2049..4e2d3a02ea06 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -487,6 +487,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  					 struct panthor_fw_binary_iter *iter,
>  					 u32 ehdr)
>  {
> +	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
>  	struct panthor_fw_binary_section_entry_hdr hdr;
>  	struct panthor_fw_section *section;
>  	u32 section_size;
> @@ -515,8 +516,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		return -EINVAL;
>  	}
>  
> -	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> -	    (hdr.va.end & ~PAGE_MASK) != 0) {
> +	if (!IS_ALIGNED(hdr.va.start, vm_pgsz) || !IS_ALIGNED(hdr.va.end, vm_pgsz)) {
>  		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
>  			hdr.va.start, hdr.va.end);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index c60b599665d8..8244a4e6c2a2 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -44,8 +44,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
>  		goto out_free_bo;
>  
> -	ret = panthor_vm_unmap_range(vm, bo->va_node.start,
> -				     panthor_kernel_bo_size(bo));
> +	ret = panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
>  	if (ret)
>  		goto out_free_bo;
>  
> @@ -95,10 +94,16 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	}
>  
>  	bo = to_panthor_bo(&obj->base);
> -	size = obj->base.size;
>  	kbo->obj = &obj->base;
>  	bo->flags = bo_flags;
>  
> +	/* The system and GPU MMU page size might differ, which becomes a
> +	 * problem for FW sections that need to be mapped at explicit address
> +	 * since our PAGE_SIZE alignment might cover a VA range that's
> +	 * expected to be used for another section.
> +	 * Make sure we never map more than we need.
> +	 */
> +	size = ALIGN(size, panthor_vm_page_size(vm));
>  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
>  	if (ret)
>  		goto err_put_obj;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3cd2bce59edc..f009501e4c68 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -826,6 +826,14 @@ void panthor_vm_idle(struct panthor_vm *vm)
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
>  }
>  
> +u32 panthor_vm_page_size(struct panthor_vm *vm)
> +{
> +	const struct io_pgtable *pgt = container_of(vm->pgtbl_ops, struct io_pgtable, ops);

NIT: io_pgtable_ops_to_pgtable() does this container_of() for you.

Steve

> +	u32 pg_shift = ffs(pgt->cfg.pgsize_bitmap) - 1;
> +
> +	return 1u << pg_shift;
> +}
> +
>  static void panthor_vm_stop(struct panthor_vm *vm)
>  {
>  	drm_sched_stop(&vm->sched, NULL);
> @@ -1025,12 +1033,13 @@ int
>  panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
>  		    struct drm_mm_node *va_node)
>  {
> +	ssize_t vm_pgsz = panthor_vm_page_size(vm);
>  	int ret;
>  
> -	if (!size || (size & ~PAGE_MASK))
> +	if (!size || !IS_ALIGNED(size, vm_pgsz))
>  		return -EINVAL;
>  
> -	if (va != PANTHOR_VM_KERNEL_AUTO_VA && (va & ~PAGE_MASK))
> +	if (va != PANTHOR_VM_KERNEL_AUTO_VA && !IS_ALIGNED(va, vm_pgsz))
>  		return -EINVAL;
>  
>  	mutex_lock(&vm->mm_lock);
> @@ -2366,11 +2375,12 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
>  			       const struct drm_panthor_vm_bind_op *op,
>  			       struct panthor_vm_op_ctx *op_ctx)
>  {
> +	ssize_t vm_pgsz = panthor_vm_page_size(vm);
>  	struct drm_gem_object *gem;
>  	int ret;
>  
>  	/* Aligned on page size. */
> -	if ((op->va | op->size) & ~PAGE_MASK)
> +	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
>  		return -EINVAL;
>  
>  	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 6788771071e3..8d21e83d8aba 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -30,6 +30,7 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset);
>  
>  int panthor_vm_active(struct panthor_vm *vm);
>  void panthor_vm_idle(struct panthor_vm *vm);
> +u32 panthor_vm_page_size(struct panthor_vm *vm);
>  int panthor_vm_as(struct panthor_vm *vm);
>  int panthor_vm_flush_all(struct panthor_vm *vm);
>  

