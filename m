Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910769B6801
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C16610E7C1;
	Wed, 30 Oct 2024 15:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D4h/OftE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8D10E7C1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730302728;
 bh=I4WRryyA53P66UVqqdrHVpD54p+jYBYlHegT4Gv4Kn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D4h/OftEY+cOA3P2C7RxGxHXVVSs6oEVG74HNR18jPYXNoD7vILfs3dzRj+0Tk3QQ
 Lq5HW6+EKkwpkdksOsoPMWLDdt31fKgeCr7EsMaG3KlBkE959DRAywaAGCLZ2S16MJ
 /P2F6e2pusRZ96VL1LC8HuHbABkOzAjI4MeUNdXNzXPnbVIoYvcrSMXCzdasYdeMvl
 GyDy5tlZmPNYWlhoce6LM2Pc4JCIr4jvKxpnuwmSeQ+1SIsHX7cBl5KPSRzhBEyLa9
 x8JguldLr9R8OsxyXTJ3zizEVdVgiU3Ka+yp4qbVGKNVX0h37kLEcvmHBIfo4OsxSD
 eVo8o7o69tQMQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 91D6417E3664;
 Wed, 30 Oct 2024 16:38:48 +0100 (CET)
Date: Wed, 30 Oct 2024 16:38:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3] drm/panthor: Fix firmware initialization on systems
 with a page size > 4k
Message-ID: <20241030163845.1c8fc1e4@collabora.com>
In-Reply-To: <20241030150231.768949-1-boris.brezillon@collabora.com>
References: <20241030150231.768949-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 30 Oct 2024 16:02:31 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> The system and GPU MMU page size might differ, which becomes a
> problem for FW sections that need to be mapped at explicit addresses
> since our PAGE_SIZE alignment might cover a VA range that's
> expected to be used for another section.
> 
> Make sure we never map more than we need.
> 
> Changes in v3:
> - Add R-bs
> 
> Changes in v2:
> - Plan for per-VM page sizes so the MCU VM and user VM can
>   have different pages sizes
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Queued to drm-misc-fixes.

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c  |  4 ++--
>  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
>  4 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 631f639b8b86..ecca5565ce41 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -500,6 +500,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  					 struct panthor_fw_binary_iter *iter,
>  					 u32 ehdr)
>  {
> +	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
>  	struct panthor_fw_binary_section_entry_hdr hdr;
>  	struct panthor_fw_section *section;
>  	u32 section_size;
> @@ -528,8 +529,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
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
> index aa12ed2acfcf..8ca85526491e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -826,6 +826,14 @@ void panthor_vm_idle(struct panthor_vm *vm)
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
>  }
>  
> +u32 panthor_vm_page_size(struct panthor_vm *vm)
> +{
> +	const struct io_pgtable *pgt = io_pgtable_ops_to_pgtable(vm->pgtbl_ops);
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

