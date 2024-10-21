Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56A9A624D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 12:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7533210E0C9;
	Mon, 21 Oct 2024 10:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mq655ymO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C85910E0C9;
 Mon, 21 Oct 2024 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729505743; x=1761041743;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0V7Un7oO3zNT1cyKfISt0ae8Kv10i5uji3mp5XkLqQ8=;
 b=mq655ymOKNVn87Sm1Ql85+WK/b10nm1V7CKYn/Y5scpYfzCvKS1FGeuo
 nQDUj/PdO+i/4vbltpSkQXARwug/y1+wB6ogCgrYjLhGH4jBFU2kzoTHd
 3dpK8CAznb2FHb+JZWiLMz5jNClJSNRgNi4Yelsly4nlURP9kOZt9wwyb
 n/8zUw3PjY4ypPIdVqjYbMkE83wSWwsLDDtjTG2hO5ITh545QFXZuayRy
 clyXVJuWJX3/fE+RH6UixQDsCg3RURQrWjNX5IPVu6AgLd6jZwx3WfpB9
 l9z8KEqxXY2NA3xYCaOh6L691AFq8Bxbz8T+bFT3kIVb/XG+Im5V4218M A==;
X-CSE-ConnectionGUID: cFp9I7fYRoClv3tZJUDDFQ==
X-CSE-MsgGUID: GhC3AxK8Rx21VsY/Q6Y1Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29193457"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="29193457"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:15:36 -0700
X-CSE-ConnectionGUID: tfbG7qezRZaBSFU3g7ykTQ==
X-CSE-MsgGUID: TvKFZ87dS4qVBaXU+O5U8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110242798"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.206])
 ([10.245.245.206])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:15:35 -0700
Message-ID: <4fc5fd25-dc7a-4e13-a6c1-adec1f20e5fc@intel.com>
Date: Mon, 21 Oct 2024 11:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/xe: Update xe_ttm_access_memory to use GPU for
 non-visible access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-4-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241019192030.1505020-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 19/10/2024 20:20, Matthew Brost wrote:
> Add migrate layer functions to access VRAM and update
> xe_ttm_access_memory to use for non-visible access.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I guess this needs some IGTs? In i915 I think we have test_ptrace() in 
gem_mmap_offset.c, which could maybe be ported or something similar?

> ---
>   drivers/gpu/drm/xe/xe_bo.c      |  18 ++-
>   drivers/gpu/drm/xe/xe_migrate.c | 267 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_migrate.h |   4 +
>   3 files changed, 285 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 99557af16120..0a7b91df69c2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1133,13 +1133,22 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>   	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
>   		return -EIO;
>   
> -	/* FIXME: Use GPU for non-visible VRAM */
> -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> -		return -EIO;
> -
>   	if (!xe_pm_runtime_get_if_in_use(xe))
>   		return -EIO;
>   
> +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {

I guess commit message/title should be updated to mention that this also 
used for large accesses?

> +		struct xe_migrate *migrate =
> +			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
> +		int err;
> +
> +		err = xe_migrate_access_memory(migrate, bo, offset, buf, len,
> +					       write);
> +		if (err)
> +			return err;

Looks to be leaking the rpm ref here?

> +
> +		goto out;
> +	}
> +
>   	vram = res_to_mem_region(ttm_bo->resource);
>   	xe_res_first(ttm_bo->resource, offset & PAGE_MASK, bo->size, &cursor);
>   
> @@ -1161,6 +1170,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>   			xe_res_next(&cursor, PAGE_SIZE);
>   	} while (bytes_left);
>   
> +out:
>   	xe_pm_runtime_put(xe);
>   
>   	return len;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cfd31ae49cc1..ccdca1f79bb2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1542,6 +1542,273 @@ void xe_migrate_wait(struct xe_migrate *m)
>   		dma_fence_wait(m->fence, false);
>   }
>   
> +static u32 pte_update_cmd_size(u64 size)
> +{
> +	u32 dword;
> +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +
> +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> +	/*
> +	 * MI_STORE_DATA_IMM command is used to update page table. Each
> +	 * instruction can update maximumly 0x1ff pte entries. To update
> +	 * n (n <= 0x1ff) pte entries, we need:
> +	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
> +	 * 2 dword for the page table's physical location
> +	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
> +	 */
> +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> +	dword += entries * 2;
> +
> +	return dword;
> +}
> +
> +static void build_pt_update_batch_sram(struct xe_migrate *m,
> +				       struct xe_bb *bb, u32 pt_offset,
> +				       dma_addr_t *sram_addr, u32 size)
> +{
> +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> +	u32 ptes;
> +	int i = 0;
> +
> +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +	while (ptes) {
> +		u32 chunk = min(0x1ffU, ptes);
> +
> +		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		bb->cs[bb->len++] = pt_offset;
> +		bb->cs[bb->len++] = 0;
> +
> +		pt_offset += chunk * 8;
> +		ptes -= chunk;
> +
> +		while (chunk--) {
> +			u64 addr = sram_addr[i++] & PAGE_MASK;
> +
> +			xe_tile_assert(m->tile, addr);
> +			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> +								 addr, pat_index,
> +								 0, false, 0);
> +			bb->cs[bb->len++] = lower_32_bits(addr);
> +			bb->cs[bb->len++] = upper_32_bits(addr);
> +		}
> +	}
> +}
> +
> +enum xe_migrate_copy_dir {
> +	XE_MIGRATE_COPY_TO_VRAM,
> +	XE_MIGRATE_COPY_TO_SRAM,
> +};
> +
> +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> +					 unsigned long len,
> +					 unsigned long sram_offset,
> +					 dma_addr_t *sram_addr, u64 vram_addr,
> +					 const enum xe_migrate_copy_dir dir)
> +{
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct dma_fence *fence = NULL;
> +	u32 batch_size = 2;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	struct xe_sched_job *job;
> +	struct xe_bb *bb;
> +	u32 update_idx, pt_slot = 0;
> +	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> +	int err;
> +
> +	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> +
> +	batch_size += pte_update_cmd_size(len);
> +	batch_size += EMIT_COPY_DW;
> +
> +	bb = xe_bb_new(gt, batch_size, true);
> +	if (IS_ERR(bb)) {
> +		err = PTR_ERR(bb);
> +		return ERR_PTR(err);
> +	}
> +
> +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> +				   sram_addr, len + sram_offset);
> +
> +	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> +		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> +		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> +
> +	} else {
> +		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> +		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> +	}
> +
> +	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +	update_idx = bb->len;
> +
> +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, XE_PAGE_SIZE);
> +
> +	job = xe_bb_create_migration_job(m->q, bb,
> +					 xe_migrate_batch_base(m, true),
> +					 update_idx);
> +	if (IS_ERR(job)) {
> +		err = PTR_ERR(job);
> +		goto err;
> +	}
> +
> +	xe_sched_job_add_migrate_flush(job, 0);
> +
> +	mutex_lock(&m->job_mutex);
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	dma_fence_put(m->fence);
> +	m->fence = dma_fence_get(fence);
> +	mutex_unlock(&m->job_mutex);
> +
> +	xe_bb_free(bb, fence);
> +
> +	return fence;
> +
> +err:
> +	xe_bb_free(bb, NULL);
> +
> +	return ERR_PTR(err);
> +}
> +
> +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> +				 int len, int write)
> +{
> +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!dma_addr[i])
> +			continue;
> +
> +		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> +			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> +	}
> +	kfree(dma_addr);
> +}
> +
> +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> +				      void *buf, int len, int write)
> +{
> +	dma_addr_t *dma_addr;
> +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> +
> +	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> +	if (!dma_addr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < npages; ++i) {
> +		dma_addr_t addr;
> +		struct page *page;
> +
> +		if (is_vmalloc_addr(buf))
> +			page = vmalloc_to_page(buf);
> +		else
> +			page = virt_to_page(buf);
> +
> +		addr = dma_map_page(xe->drm.dev,
> +				    page, 0, PAGE_SIZE,
> +				    write ? DMA_TO_DEVICE :
> +				    DMA_FROM_DEVICE);
> +		if (dma_mapping_error(xe->drm.dev, addr))
> +			goto err_fault;
> +
> +		dma_addr[i] = addr;
> +		buf += PAGE_SIZE;
> +	}
> +
> +	return dma_addr;
> +
> +err_fault:
> +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> +	return ERR_PTR(-EFAULT);
> +}
> +
> +/**
> + * xe_migrate_access_memory - Access memory of a BO via GPU
> + *
> + * @m: The migration context.
> + * @bo: buffer object
> + * @offset: access offset into buffer object
> + * @buf: pointer to caller memory to read into or write from
> + * @len: length of access
> + * @write: write access
> + *
> + * Access memory of a BO via GPU either reading in or writing from a passed in
> + * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
> + * read to or write from pointer.
> + *
> + * Returns:
> + * 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> +			     unsigned long offset, void *buf, int len,
> +			     int write)
> +{
> +	struct xe_tile *tile = m->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_res_cursor cursor;
> +	struct dma_fence *fence = NULL;
> +	dma_addr_t *dma_addr;
> +	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
> +	int bytes_left = len, current_page = 0;
> +
> +	xe_bo_assert_held(bo);
> +
> +	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> +	if (IS_ERR(dma_addr))
> +		return PTR_ERR(dma_addr);
> +
> +	xe_res_first(bo->ttm.resource, offset, bo->size, &cursor);
> +
> +	do {
> +		struct dma_fence *__fence;
> +		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
> +			cursor.start;
> +		int current_bytes;
> +
> +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> +			current_bytes = min_t(int, bytes_left,
> +					      MAX_PREEMPTDISABLE_TRANSFER);
> +		else
> +			current_bytes = min_t(int, bytes_left, cursor.size);
> +
> +		if (fence)
> +			dma_fence_put(fence);
> +
> +		__fence = xe_migrate_vram(m, current_bytes,
> +					  (unsigned long)buf & ~PAGE_MASK,
> +					  dma_addr + current_page,
> +					  vram_addr, write ?
> +					  XE_MIGRATE_COPY_TO_VRAM :
> +					  XE_MIGRATE_COPY_TO_SRAM);
> +		if (IS_ERR(__fence)) {
> +			if (fence)
> +				dma_fence_wait(fence, false);
> +			fence = __fence;
> +			goto out_err;
> +		}
> +		fence = __fence;
> +
> +		buf += current_bytes;
> +		offset += current_bytes;
> +		current_page += DIV_ROUND_UP(current_bytes, PAGE_SIZE);
> +		bytes_left -= current_bytes;
> +		if (bytes_left)
> +			xe_res_next(&cursor, current_bytes);
> +	} while (bytes_left);
> +
> +	dma_fence_wait(fence, false);
> +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +
> +	return 0;
> +
> +out_err:
> +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +	return PTR_ERR(fence);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_migrate.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 0109866e398a..94197d262178 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -102,6 +102,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   				  struct ttm_resource *dst,
>   				  bool copy_only_ccs);
>   
> +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> +			     unsigned long offset, void *buf, int len,
> +			     int write);
> +
>   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
>   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
>   #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
