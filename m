Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C950A9A5F1A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 10:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8A710E451;
	Mon, 21 Oct 2024 08:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfF/Ro3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C9410E450;
 Mon, 21 Oct 2024 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729500567; x=1761036567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tlOpJGfSNgUAsSEgOjrM5zt50ZArkc8IJB8E4o7bVWg=;
 b=cfF/Ro3URgwAdqzl6A3vFy7qOKxdpi3zWQ8Ta0Fm1qMndcymvhMr8Nc8
 QwpODgrLYmCOYLXy4pPkYgs+K/jWrNB4PI6IYj9FFgJ5D1Nb/gKEQ8MNl
 tzAfDh5NFfLrn4MbB/JXfBbkgFZRgFQ2+oJrb1g2F0bJIIuAAk9FwFlWS
 qNf+0JDw74J72m+797rOXV2SqP0uSfHD3ettQxgEF2MYtn2/5+lF1u2ga
 CcW2LHNV6bMItdd0E64bNkZiEayjkZyE0fWLHvh/b7va7qH8eFk0GxzS6
 +izLwAUemH8BbZLRRoaRltZkgqbyEUAiG+HQPxWpf2gCfQvL9tqKH80on Q==;
X-CSE-ConnectionGUID: sHw3nMhNTbeBCmFW+E3d7Q==
X-CSE-MsgGUID: /EkGFCLIRFq5rnLj5j9xTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="31833129"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="31833129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 01:49:26 -0700
X-CSE-ConnectionGUID: cF3AQ0FgRT2NhAHHuP5svA==
X-CSE-MsgGUID: yTfPyNn/TECZ0Ulrt9IjxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110224497"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.206])
 ([10.245.245.206])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 01:49:23 -0700
Message-ID: <cd1c5f3b-8e43-40e8-9bbf-9995e4ab2b97@intel.com>
Date: Mon, 21 Oct 2024 09:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] drm/ttm, drm/xe: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com
References: <20241017233941.1047522-1-matthew.brost@intel.com>
 <20241017233941.1047522-2-matthew.brost@intel.com>
 <ebc06f32-6ed2-41a3-bc84-820bda1e7116@intel.com>
 <ZxKL/RbKwq8iJ/gm@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZxKL/RbKwq8iJ/gm@DUT025-TGLU.fm.intel.com>
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

On 18/10/2024 17:25, Matthew Brost wrote:
> On Fri, Oct 18, 2024 at 10:08:06AM +0100, Matthew Auld wrote:
>> On 18/10/2024 00:39, Matthew Brost wrote:
>>> Non-contiguous VRAM cannot be mapped in Xe nor can non-visible VRAM
>>> easily be accessed. Add ttm_bo_access, which is similar to
>>> ttm_bo_vm_access, to access such memory.
>>
>> Is the plan to roll this out also to object error capture and clear color
>> access? Those places seem to be using ttm vmap/kmap which only seems to work
>> with contiguous VRAM, but in those cases we are mapping userspace objects
>> which are potentially not contiguous so I assume that stuff is also quite
>> broken atm?
>>
> 
> I quickly sent this out without checking the error capture code, but
> that seems to be broken but no one is complaining? Seems odd.

It looks like we are also missing some IGTs for the vma dumpable stuff.

> 
> Let me look into this a bit more before posting a proper series. Will
> also update the error capture if needed.
> 
>>>
>>> Visible VRAM access is only supported at the momement but a follow up
>>> can add GPU access to non-visible VRAM.
>>>
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
>>>    drivers/gpu/drm/xe/xe_bo.c      | 48 +++++++++++++++++++++++++++++++++
>>>    include/drm/ttm/ttm_bo.h        |  2 ++
>>>    3 files changed, 64 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 2c699ed1963a..b53cc064da44 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -405,13 +405,9 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>>>    	return len;
>>>    }
>>> -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>> -		     void *buf, int len, int write)
>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>> +		  void *buf, int len, int write)
>>>    {
>>> -	struct ttm_buffer_object *bo = vma->vm_private_data;
>>> -	unsigned long offset = (addr) - vma->vm_start +
>>> -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>> -		 << PAGE_SHIFT);
>>>    	int ret;
>>>    	if (len < 1 || (offset + len) > bo->base.size)
>>> @@ -439,6 +435,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>    	return ret;
>>>    }
>>> +EXPORT_SYMBOL(ttm_bo_access);
>>> +
>>> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>> +		     void *buf, int len, int write)
>>> +{
>>> +	struct ttm_buffer_object *bo = vma->vm_private_data;
>>> +	unsigned long offset = (addr) - vma->vm_start +
>>> +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>> +		 << PAGE_SHIFT);
>>> +
>>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>> +}
>>>    EXPORT_SYMBOL(ttm_bo_vm_access);
>>>    static const struct vm_operations_struct ttm_bo_vm_ops = {
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 5b232f2951b1..267f3b03a6d0 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -1111,6 +1111,53 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>>>    	}
>>>    }
>>> +static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>>> +				unsigned long offset, void *buf, int len,
>>> +				int write)
>>> +{
>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> +	struct iosys_map vmap;
>>> +	struct xe_res_cursor cursor;
>>> +	struct xe_mem_region *vram;
>>> +	void __iomem *virtual;
>>> +	int bytes_left = len;
>>> +
>>> +	xe_bo_assert_held(bo);
>>
>> I think we need rpm somewhere? Although bo lock might make this tricky.
>>
> 
> Do we? OFC if we interact with hardware we should but also if hardware
> is powered off a BO shouldn't be in VRAM.

There is also d3hot which doesn't kick stuff out to system memory, but 
VRAM is still inaccessible in that mode.

> 
> Maybe do a get_if_awake and bail otherwise?
> 
> Matt
> 
>>> +
>>> +	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
>>> +		return -EIO;
>>> +
>>> +	/* FIXME: Use GPU for non-visible VRAM */
>>> +	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
>>> +		return -EINVAL;
>>> +
>>> +	vram = res_to_mem_region(ttm_bo->resource);
>>> +	xe_res_first(ttm_bo->resource, offset & ~PAGE_MASK, 0, &cursor);
>>> +
>>> +	do {
>>> +		int wcount = PAGE_SIZE - (offset & PAGE_MASK) > bytes_left ?
>>> +			bytes_left : PAGE_SIZE - (offset & PAGE_MASK);
>>> +
>>> +		virtual = (u8 __force *)vram->mapping + cursor.start;
>>> +
>>> +		iosys_map_set_vaddr_iomem(&vmap, (void __iomem *)virtual);
>>> +		if (write)
>>> +			xe_map_memcpy_to(xe, &vmap, offset & PAGE_MASK, buf,
>>> +					 wcount);
>>> +		else
>>> +			xe_map_memcpy_from(xe, buf, &vmap, offset & PAGE_MASK,
>>> +					   wcount);
>>> +
>>> +		offset += wcount;
>>> +		buf += wcount;
>>> +		bytes_left -= wcount;
>>> +		xe_res_next(&cursor, PAGE_SIZE);
>>> +	} while (bytes_left);
>>> +
>>> +	return len;
>>> +}
>>> +
>>>    const struct ttm_device_funcs xe_ttm_funcs = {
>>>    	.ttm_tt_create = xe_ttm_tt_create,
>>>    	.ttm_tt_populate = xe_ttm_tt_populate,
>>> @@ -1120,6 +1167,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
>>>    	.move = xe_bo_move,
>>>    	.io_mem_reserve = xe_ttm_io_mem_reserve,
>>>    	.io_mem_pfn = xe_ttm_io_mem_pfn,
>>> +	.access_memory = xe_ttm_access_memory,
>>>    	.release_notify = xe_ttm_bo_release_notify,
>>>    	.eviction_valuable = ttm_bo_eviction_valuable,
>>>    	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 5804408815be..8ea11cd8df39 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>    int ttm_bo_evict_first(struct ttm_device *bdev,
>>>    		       struct ttm_resource_manager *man,
>>>    		       struct ttm_operation_ctx *ctx);
>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>> +		  void *buf, int len, int write);
>>>    vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>    			     struct vm_fault *vmf);
>>>    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
