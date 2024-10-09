Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF439961F0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64B10E680;
	Wed,  9 Oct 2024 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C686410E680
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:10:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E846DFEC;
 Wed,  9 Oct 2024 01:11:15 -0700 (PDT)
Received: from [10.57.78.234] (unknown [10.57.78.234])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A7C93F58B;
 Wed,  9 Oct 2024 01:10:45 -0700 (PDT)
Message-ID: <ff6196b6-f385-4d54-b34b-ce8f6d8d0f0a@arm.com>
Date: Wed, 9 Oct 2024 09:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix firmware initialization on systems with
 a page size > 4k
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241008084744.82688-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241008084744.82688-1-boris.brezillon@collabora.com>
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

On 08/10/2024 09:47, Boris Brezillon wrote:
> The system and GPU MMU page size might differ, which becomes a
> problem for FW sections that need to be mapped at explicit address
> since our PAGE_SIZE alignment might cover a VA range that's
> expected to be used for another section.
> 
> Make sure we never map more than we need.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c  |  3 +--
>  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c |  6 +++---
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index ef232c0c2049..293846400296 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -515,8 +515,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		return -EINVAL;
>  	}
>  
> -	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> -	    (hdr.va.end & ~PAGE_MASK) != 0) {
> +	if (!IS_ALIGNED(hdr.va.start, SZ_4K) || !IS_ALIGNED(hdr.va.end, SZ_4K)) {
>  		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
>  			hdr.va.start, hdr.va.end);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index c60b599665d8..2c8d6e2c7232 100644
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
> +	size = ALIGN(size, SZ_4K);
>  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
>  	if (ret)
>  		goto err_put_obj;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3cd2bce59edc..e53d131c53cc 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1027,10 +1027,10 @@ panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
>  {
>  	int ret;
>  
> -	if (!size || (size & ~PAGE_MASK))
> +	if (!size || !IS_ALIGNED(size, SZ_4K))
>  		return -EINVAL;
>  
> -	if (va != PANTHOR_VM_KERNEL_AUTO_VA && (va & ~PAGE_MASK))
> +	if (va != PANTHOR_VM_KERNEL_AUTO_VA && !IS_ALIGNED(va, SZ_4K))
>  		return -EINVAL;
>  
>  	mutex_lock(&vm->mm_lock);
> @@ -2370,7 +2370,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
>  	int ret;
>  
>  	/* Aligned on page size. */
> -	if ((op->va | op->size) & ~PAGE_MASK)
> +	if (!IS_ALIGNED(op->va | op->size, SZ_4K))
>  		return -EINVAL;
>  
>  	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {

