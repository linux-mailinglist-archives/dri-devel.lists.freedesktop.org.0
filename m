Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE959A396E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 11:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC70510E8C9;
	Fri, 18 Oct 2024 09:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYOhulYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5D10E239;
 Fri, 18 Oct 2024 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729242490; x=1760778490;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k+IhueTNJ8q54vxwwE3zAyASSl9NHswA5Wpmm/McQ+E=;
 b=bYOhulYJ1KtCfMTm8qKPz88rhNoYDUxdJawBk02+KThuUAF/oV43Wknt
 rTbEWgYsS4kmK2OMAIi4TsOxXSoOUeqbSXWKe8pEcq0xdmseX5XYuUYWu
 eMYGcDI7M8KQaqMan8QykahUmogEZF7oEAe7WnfVKDRfrfqvFyQd0ZM6u
 lzaaW6KeAwF+UK5N2KDpomKqkAyszay//j60IIacNCNjMdMmXjurjSxQD
 n3vBT5a08r16Tk8+ygFYaT0fTR7FgJ7XMcQgGItn5uWUOdLEUOkd4ZjWY
 V6C93jmFhpl1wR8IMMa2mnwmFwZQdewFmO+5Pu89FNAwUNQCa+63nlsKj A==;
X-CSE-ConnectionGUID: rjqAzHC0QcCB0Eb8lXh/DA==
X-CSE-MsgGUID: nXQWdiXqRoer9HK1SYsm1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28230350"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="28230350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 02:08:09 -0700
X-CSE-ConnectionGUID: PP2cwpS3TPqeAc55MjdWag==
X-CSE-MsgGUID: 13cfIx05TUmpJB2UvggHXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83395566"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.226])
 ([10.245.244.226])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 02:08:08 -0700
Message-ID: <ebc06f32-6ed2-41a3-bc84-820bda1e7116@intel.com>
Date: Fri, 18 Oct 2024 10:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] drm/ttm, drm/xe: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20241017233941.1047522-1-matthew.brost@intel.com>
 <20241017233941.1047522-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241017233941.1047522-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 18/10/2024 00:39, Matthew Brost wrote:
> Non-contiguous VRAM cannot be mapped in Xe nor can non-visible VRAM
> easily be accessed. Add ttm_bo_access, which is similar to
> ttm_bo_vm_access, to access such memory.

Is the plan to roll this out also to object error capture and clear 
color access? Those places seem to be using ttm vmap/kmap which only 
seems to work with contiguous VRAM, but in those cases we are mapping 
userspace objects which are potentially not contiguous so I assume that 
stuff is also quite broken atm?

> 
> Visible VRAM access is only supported at the momement but a follow up
> can add GPU access to non-visible VRAM.
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
>   drivers/gpu/drm/xe/xe_bo.c      | 48 +++++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_bo.h        |  2 ++
>   3 files changed, 64 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 2c699ed1963a..b53cc064da44 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -405,13 +405,9 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>   	return len;
>   }
>   
> -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> -		     void *buf, int len, int write)
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write)
>   {
> -	struct ttm_buffer_object *bo = vma->vm_private_data;
> -	unsigned long offset = (addr) - vma->vm_start +
> -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> -		 << PAGE_SHIFT);
>   	int ret;
>   
>   	if (len < 1 || (offset + len) > bo->base.size)
> @@ -439,6 +435,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL(ttm_bo_access);
> +
> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> +		     void *buf, int len, int write)
> +{
> +	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	unsigned long offset = (addr) - vma->vm_start +
> +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> +		 << PAGE_SHIFT);
> +
> +	return ttm_bo_access(bo, offset, buf, len, write);
> +}
>   EXPORT_SYMBOL(ttm_bo_vm_access);
>   
>   static const struct vm_operations_struct ttm_bo_vm_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5b232f2951b1..267f3b03a6d0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1111,6 +1111,53 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>   	}
>   }
>   
> +static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> +				unsigned long offset, void *buf, int len,
> +				int write)
> +{
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct iosys_map vmap;
> +	struct xe_res_cursor cursor;
> +	struct xe_mem_region *vram;
> +	void __iomem *virtual;
> +	int bytes_left = len;
> +
> +	xe_bo_assert_held(bo);

I think we need rpm somewhere? Although bo lock might make this tricky.

> +
> +	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> +		return -EIO;
> +
> +	/* FIXME: Use GPU for non-visible VRAM */
> +	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
> +		return -EINVAL;
> +
> +	vram = res_to_mem_region(ttm_bo->resource);
> +	xe_res_first(ttm_bo->resource, offset & ~PAGE_MASK, 0, &cursor);
> +
> +	do {
> +		int wcount = PAGE_SIZE - (offset & PAGE_MASK) > bytes_left ?
> +			bytes_left : PAGE_SIZE - (offset & PAGE_MASK);
> +
> +		virtual = (u8 __force *)vram->mapping + cursor.start;
> +
> +		iosys_map_set_vaddr_iomem(&vmap, (void __iomem *)virtual);
> +		if (write)
> +			xe_map_memcpy_to(xe, &vmap, offset & PAGE_MASK, buf,
> +					 wcount);
> +		else
> +			xe_map_memcpy_from(xe, buf, &vmap, offset & PAGE_MASK,
> +					   wcount);
> +
> +		offset += wcount;
> +		buf += wcount;
> +		bytes_left -= wcount;
> +		xe_res_next(&cursor, PAGE_SIZE);
> +	} while (bytes_left);
> +
> +	return len;
> +}
> +
>   const struct ttm_device_funcs xe_ttm_funcs = {
>   	.ttm_tt_create = xe_ttm_tt_create,
>   	.ttm_tt_populate = xe_ttm_tt_populate,
> @@ -1120,6 +1167,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
>   	.move = xe_bo_move,
>   	.io_mem_reserve = xe_ttm_io_mem_reserve,
>   	.io_mem_pfn = xe_ttm_io_mem_pfn,
> +	.access_memory = xe_ttm_access_memory,
>   	.release_notify = xe_ttm_bo_release_notify,
>   	.eviction_valuable = ttm_bo_eviction_valuable,
>   	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..8ea11cd8df39 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>   int ttm_bo_evict_first(struct ttm_device *bdev,
>   		       struct ttm_resource_manager *man,
>   		       struct ttm_operation_ctx *ctx);
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write);
>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   			     struct vm_fault *vmf);
>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
