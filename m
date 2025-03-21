Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A9A6BA28
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B5C10E7B5;
	Fri, 21 Mar 2025 11:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmtD5VNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B9810E7B5;
 Fri, 21 Mar 2025 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742558041; x=1774094041;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T/gFapJBj1JgabHjkCkpzC0kd1ddMb0xsJsW+d1dPCI=;
 b=hmtD5VNU6wGacnlnyoaQO7YOlX+eDb6HKfF3ZMGzl/ZfMsdkXD/pyX8Q
 /tm//IRU28WTP0GD+a+35urR3UK+zX7Ky3u0sVvZSizSvMcjOX/8ltGS5
 3g/AP3CyUnaCsq+85Z7iWIvaM4bsPeFWiwhkiZ7Auig8uuVXNOd+ChTz9
 Z7HB4uz1seqXWx/NA/Ka4p7CIjp4vMQJJ/IAC+ytWdmBUYcpazROctr7Z
 ySikzqjOWJGZ6CxRrEdqOHRX55th0APGXktAXfbr0N1C6kqWVYI25JGZL
 whrneV4JxzYCdBZt0mYf/X2+XiHEr0IruYCWeHzcLqluXJiGN8RzC/noe A==;
X-CSE-ConnectionGUID: rT+6gRYoRQC/VlFz4PxLaw==
X-CSE-MsgGUID: JgfVApU7QHiGK3OWqMcOhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47479284"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="47479284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:54:00 -0700
X-CSE-ConnectionGUID: 1nQkH2PZQdCFoRnlKvoPeQ==
X-CSE-MsgGUID: wr+ArePRR6WzAw5U1lWrvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128435517"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.56])
 ([10.245.245.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:53:58 -0700
Message-ID: <29c81d5b-b5f5-458e-8f4c-8eb26f8f48b5@intel.com>
Date: Fri, 21 Mar 2025 11:53:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/gpusvm: pull out drm_gpusvm_pages substructure
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-13-matthew.auld@intel.com>
 <Z9x94yBoffcSbwv9@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z9x94yBoffcSbwv9@lstrano-desk.jf.intel.com>
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

On 20/03/2025 20:43, Matthew Brost wrote:
> On Thu, Mar 20, 2025 at 05:30:01PM +0000, Matthew Auld wrote:
>> Pull the pages stuff from the svm range into its own substructure, with
>> the idea of having the main pages related routines, like get_pages(),
>> unmap_pages() and free_pages() all operating on some lower level
>> structures, which can then be re-used for stuff like userptr which wants
>> to use basic stuff like get_pages(), but not all the other more complex
>> svm stuff.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c | 95 +++++++++++++++++++-----------------
>>   drivers/gpu/drm/xe/xe_pt.c   |  2 +-
>>   drivers/gpu/drm/xe/xe_svm.c  |  6 +--
>>   drivers/gpu/drm/xe/xe_svm.h  |  2 +-
>>   include/drm/drm_gpusvm.h     | 43 +++++++++-------
>>   5 files changed, 82 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 5b4ecd36dff1..f27731a51f34 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -812,7 +812,7 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>>   	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
>>   	INIT_LIST_HEAD(&range->entry);
>>   	range->notifier_seq = LONG_MAX;
>> -	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
>> +	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
>>   
>>   	return range;
>>   }
>> @@ -1120,27 +1120,27 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
>>   
>>   /**
>> - * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
>> + * __drm_gpusvm_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
>>    * @gpusvm: Pointer to the GPU SVM structure
>> - * @range: Pointer to the GPU SVM range structure
>> + * @svm_pages: Pointer to the GPU SVM pages structure
>>    * @npages: Number of pages to unmap
>>    *
>>    * This function unmap pages associated with a GPU SVM range. Assumes and
>>    * asserts correct locking is in place when called.
>>    */
>> -static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>> -					   struct drm_gpusvm_range *range,
>> -					   unsigned long npages)
>> +static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>> +				     struct drm_gpusvm_pages *svm_pages,
>> +				     unsigned long npages)
>>   {
>>   	unsigned long i, j;
>> -	struct drm_pagemap *dpagemap = range->dpagemap;
>> +	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
>>   	struct device *dev = gpusvm->drm->dev;
>>   
>>   	lockdep_assert_held(&gpusvm->notifier_lock);
>>   
>> -	if (range->flags.has_dma_mapping) {
>> +	if (svm_pages->flags.has_dma_mapping) {
>>   		for (i = 0, j = 0; i < npages; j++) {
>> -			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
>> +			struct drm_pagemap_device_addr *addr = &svm_pages->dma_addr[j];
>>   
>>   			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
>>   				dma_unmap_page(dev,
>> @@ -1152,9 +1152,9 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>>   							    dev, *addr);
>>   			i += 1 << addr->order;
>>   		}
>> -		range->flags.has_devmem_pages = false;
>> -		range->flags.has_dma_mapping = false;
>> -		range->dpagemap = NULL;
>> +		svm_pages->flags.has_devmem_pages = false;
>> +		svm_pages->flags.has_dma_mapping = false;
>> +		svm_pages->dpagemap = NULL;
>>   	}
>>   }
>>   
>> @@ -1165,14 +1165,14 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>>    *
>>    * This function frees the dma address array associated with a GPU SVM range.
>>    */
>> -static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
>> -					struct drm_gpusvm_range *range)
>> +static void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
>> +				  struct drm_gpusvm_pages *svm_pages)
>>   {
>>   	lockdep_assert_held(&gpusvm->notifier_lock);
>>   
>> -	if (range->dma_addr) {
>> -		kvfree(range->dma_addr);
>> -		range->dma_addr = NULL;
>> +	if (svm_pages->dma_addr) {
>> +		kvfree(svm_pages->dma_addr);
>> +		svm_pages->dma_addr = NULL;
>>   	}
>>   }
>>   
>> @@ -1200,8 +1200,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
>>   		return;
>>   
>>   	drm_gpusvm_notifier_lock(gpusvm);
>> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
>> -	drm_gpusvm_range_free_pages(gpusvm, range);
>> +	__drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages);
>> +	drm_gpusvm_free_pages(gpusvm, &range->pages);
>>   	__drm_gpusvm_range_remove(notifier, range);
>>   	drm_gpusvm_notifier_unlock(gpusvm);
>>   
>> @@ -1266,6 +1266,14 @@ void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>>   
> 
> Same comment as patch #1, let's aim to keep kernel doc for all functions in drm_gpusvm.c.
> 
>> +static bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
>> +				   struct drm_gpusvm_pages *svm_pages)
>> +{
>> +	lockdep_assert_held(&gpusvm->notifier_lock);
>> +
>> +	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
>> +}
>> +
>>   /**
>>    * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
>>    * @gpusvm: Pointer to the GPU SVM structure
>> @@ -1283,9 +1291,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>>   bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>>   				  struct drm_gpusvm_range *range)
>>   {
>> -	lockdep_assert_held(&gpusvm->notifier_lock);
>> -
>> -	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
>> +	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>>   
>> @@ -1301,17 +1307,17 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>>    */
>>   static bool
>>   drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
>> -				      struct drm_gpusvm_range *range)
>> +				      struct drm_gpusvm_pages *svm_pages)
>>   {
>>   	bool pages_valid;
>>   
>> -	if (!range->dma_addr)
>> +	if (!svm_pages->dma_addr)
>>   		return false;
>>   
>>   	drm_gpusvm_notifier_lock(gpusvm);
>> -	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
>> +	pages_valid = drm_gpusvm_pages_valid(gpusvm, svm_pages);
>>   	if (!pages_valid)
>> -		drm_gpusvm_range_free_pages(gpusvm, range);
>> +		drm_gpusvm_free_pages(gpusvm, svm_pages);
>>   	drm_gpusvm_notifier_unlock(gpusvm);
>>   
>>   	return pages_valid;
>> @@ -1332,6 +1338,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   			       struct drm_gpusvm_range *range,
>>   			       const struct drm_gpusvm_ctx *ctx)
>>   {
>> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
>>   	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
>>   	struct hmm_range hmm_range = {
>>   		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
>> @@ -1360,7 +1367,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   
>>   retry:
>>   	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> -	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
>> +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, svm_pages))
>>   		goto set_seqno;
>>   
>>   	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>> @@ -1401,7 +1408,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   	 */
>>   	drm_gpusvm_notifier_lock(gpusvm);
>>   
>> -	if (range->flags.unmapped) {
>> +	if (svm_pages->flags.unmapped) {
>>   		drm_gpusvm_notifier_unlock(gpusvm);
>>   		err = -EFAULT;
>>   		goto err_free;
>> @@ -1413,13 +1420,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   		goto retry;
>>   	}
>>   
>> -	if (!range->dma_addr) {
>> +	if (!svm_pages->dma_addr) {
>>   		/* Unlock and restart mapping to allocate memory. */
>>   		drm_gpusvm_notifier_unlock(gpusvm);
>> -		range->dma_addr = kvmalloc_array(npages,
>> -						 sizeof(*range->dma_addr),
>> -						 GFP_KERNEL);
>> -		if (!range->dma_addr) {
>> +		svm_pages->dma_addr =
>> +			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
>> +		if (!svm_pages->dma_addr) {
>>   			err = -ENOMEM;
>>   			goto err_free;
>>   		}
>> @@ -1457,13 +1463,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   					goto err_unmap;
>>   				}
>>   			}
>> -			range->dma_addr[j] =
>> +			svm_pages->dma_addr[j] =
>>   				dpagemap->ops->device_map(dpagemap,
>>   							  gpusvm->drm->dev,
>>   							  page, order,
>>   							  dma_dir);
>>   			if (dma_mapping_error(gpusvm->drm->dev,
>> -					      range->dma_addr[j].addr)) {
>> +					      svm_pages->dma_addr[j].addr)) {
>>   				err = -EFAULT;
>>   				goto err_unmap;
>>   			}
>> @@ -1487,7 +1493,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   				goto err_unmap;
>>   			}
>>   
>> -			range->dma_addr[j] = drm_pagemap_device_addr_encode
>> +			svm_pages->dma_addr[j] = drm_pagemap_device_addr_encode
>>   				(addr, DRM_INTERCONNECT_SYSTEM, order,
>>   				 dma_dir);
>>   
>> @@ -1503,10 +1509,10 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   		num_dma_mapped = i;
>>   	}
>>   
>> -	range->flags.has_dma_mapping = true;
>> +	svm_pages->flags.has_dma_mapping = true;
>>   	if (zdd) {
>> -		range->flags.has_devmem_pages = true;
>> -		range->dpagemap = dpagemap;
>> +		svm_pages->flags.has_devmem_pages = true;
>> +		svm_pages->dpagemap = dpagemap;
>>   	}
>>   
>>   	drm_gpusvm_notifier_unlock(gpusvm);
>> @@ -1517,7 +1523,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   	return 0;
>>   
>>   err_unmap:
>> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
>> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
>>   	drm_gpusvm_notifier_unlock(gpusvm);
>>   err_free:
>>   	kvfree(pfns);
>> @@ -1543,6 +1549,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>>   				  struct drm_gpusvm_range *range,
>>   				  const struct drm_gpusvm_ctx *ctx)
>>   {
>> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
>>   	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
>>   					       drm_gpusvm_range_end(range));
>>   
>> @@ -1551,7 +1558,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>>   	else
>>   		drm_gpusvm_notifier_lock(gpusvm);
>>   
>> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
>> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
>>   
>>   	if (!ctx->in_notifier)
>>   		drm_gpusvm_notifier_unlock(gpusvm);
>> @@ -1719,7 +1726,7 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
>>   
>>   	mmap_assert_locked(gpusvm->mm);
>>   
>> -	if (!range->flags.migrate_devmem)
>> +	if (!range->pages.flags.migrate_devmem)
>>   		return -EINVAL;
>>   
>>   	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
>> @@ -2248,10 +2255,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>>   {
>>   	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
>>   
>> -	range->flags.unmapped = true;
>> +	range->pages.flags.unmapped = true;
>>   	if (drm_gpusvm_range_start(range) < mmu_range->start ||
>>   	    drm_gpusvm_range_end(range) > mmu_range->end)
>> -		range->flags.partial_unmap = true;
>> +		range->pages.flags.partial_unmap = true;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index ffaf0d02dc7d..c43e7619cb80 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -659,7 +659,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   			return -EAGAIN;
>>   		}
>>   		if (xe_svm_range_has_dma_mapping(range)) {
>> -			xe_res_first_dma(range->base.dma_addr, 0,
>> +			xe_res_first_dma(range->base.pages.dma_addr, 0,
>>   					 range->base.itree.last + 1 - range->base.itree.start,
>>   					 &curs);
>>   			is_devmem = xe_res_is_vram(&curs);
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 08617a62ab07..4e7f2e77b38d 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -17,7 +17,7 @@
>>   static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>>   {
>>   	/* Not reliable without notifier lock */
>> -	return range->base.flags.has_devmem_pages;
>> +	return range->base.pages.flags.has_devmem_pages;
>>   }
>>   
>>   static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
>> @@ -135,7 +135,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>>   	range_debug(range, "NOTIFIER");
>>   
>>   	/* Skip if already unmapped or if no binding exist */
>> -	if (range->base.flags.unmapped || !range->tile_present)
>> +	if (range->base.pages.flags.unmapped || !range->tile_present)
>>   		return 0;
>>   
>>   	range_debug(range, "NOTIFIER - EXECUTE");
>> @@ -766,7 +766,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	range_debug(range, "PAGE FAULT");
>>   
>>   	/* XXX: Add migration policy, for now migrate range once */
>> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
>> +	if (!range->skip_migrate && range->base.pages.flags.migrate_devmem &&
>>   	    xe_svm_range_size(range) >= SZ_64K) {
>>   		range->skip_migrate = true;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 93442738666e..79fbd4fec1fb 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -136,7 +136,7 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>>   static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>>   {
>>   	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
>> -	return range->base.flags.has_dma_mapping;
>> +	return range->base.pages.flags.has_dma_mapping;
>>   }
>>   
>>   #define xe_svm_assert_in_notifier(vm__) \
>> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
>> index df120b4d1f83..c15c733ef0ad 100644
>> --- a/include/drm/drm_gpusvm.h
>> +++ b/include/drm/drm_gpusvm.h
>> @@ -186,14 +186,8 @@ struct drm_gpusvm_notifier {
>>   };
>>   
>>   /**
>> - * struct drm_gpusvm_range - Structure representing a GPU SVM range
>> + * struct drm_gpusvm_pages - Structure representing a GPU SVM mapped pages
>>    *
>> - * @gpusvm: Pointer to the GPU SVM structure
>> - * @notifier: Pointer to the GPU SVM notifier
>> - * @refcount: Reference count for the range
>> - * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
>> - * @entry: List entry to fast interval tree traversal
>> - * @notifier_seq: Notifier sequence number of the range's pages
>>    * @dma_addr: Device address array
>>    * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
>>    *            Note this is assuming only one drm_pagemap per range is allowed.
>> @@ -203,17 +197,8 @@ struct drm_gpusvm_notifier {
>>    * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
>>    * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
>>    * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
>> - *
>> - * This structure represents a GPU SVM range used for tracking memory ranges
>> - * mapped in a DRM device.
>>    */
>> -struct drm_gpusvm_range {
>> -	struct drm_gpusvm *gpusvm;
>> -	struct drm_gpusvm_notifier *notifier;
>> -	struct kref refcount;
>> -	struct interval_tree_node itree;
>> -	struct list_head entry;
>> -	unsigned long notifier_seq;
>> +struct drm_gpusvm_pages {
>>   	struct drm_pagemap_device_addr *dma_addr;
>>   	struct drm_pagemap *dpagemap;
>>   	struct {
>> @@ -227,6 +212,30 @@ struct drm_gpusvm_range {
>>   	} flags;
>>   };
>>   
>> +/**
>> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
>> + *
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @notifier: Pointer to the GPU SVM notifier
>> + * @refcount: Reference count for the range
>> + * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
>> + * @entry: List entry to fast interval tree traversal
>> + * @notifier_seq: Notifier sequence number of the range's pages
>> + * @pages: The pages for this range.
>> + *
>> + * This structure represents a GPU SVM range used for tracking memory ranges
>> + * mapped in a DRM device.
>> + */
>> +struct drm_gpusvm_range {
>> +	struct drm_gpusvm *gpusvm;
>> +	struct drm_gpusvm_notifier *notifier;
>> +	struct kref refcount;
>> +	struct interval_tree_node itree;
>> +	struct list_head entry;
>> +	unsigned long notifier_seq;
> 
> Should the notifier seqno be in the pages?

Yeah, I think that makes sense. Thanks.

> 
> Matt
> 
>> +	struct drm_gpusvm_pages pages;
>> +};
>> +
>>   /**
>>    * struct drm_gpusvm - GPU SVM structure
>>    *
>> -- 
>> 2.48.1
>>

