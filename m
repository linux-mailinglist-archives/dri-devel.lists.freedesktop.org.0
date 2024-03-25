Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96388B521
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 00:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3815A10E7BE;
	Mon, 25 Mar 2024 23:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuwPzfPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E5410E7BE;
 Mon, 25 Mar 2024 23:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711408781; x=1742944781;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8EXnVGZn/65+csQvKIPUHp4gpRdPtEdf9IGbzpEcRM8=;
 b=EuwPzfPySgafMknpUvQQMwopESlHIlnw6qXXB0SEwizUe8dXEBdGW6zn
 85UvzGnw4h0QtAXHnm0DX3eZ17shLxBVvM31vQHVbITbhEzK3zmhw6QWn
 SVr0AWTz0aIlGjJd3RNTVBjgu1LJK+6Rk+Zd+bfhKyU1H2Rklbr15cfZi
 onuSD7bC5bE+QJO4i3oIMSKmI7mRK6e9NvCD4MmA1gAFRlIS6RLcYklD0
 /tYqYJX4SkOq0k4sa92SwCmgjOgGXW57a2WbjVa4NnWnB4jmsbsfnRH/+
 KtewkwNREuBKUDv7+84cOv2pfMVPOXxwdjYnGTJmKotEauUC/z/sgUv2T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6302492"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6302492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 16:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15668491"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.33])
 ([10.246.52.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 16:19:36 -0700
Message-ID: <db2627fa-b1da-4a27-8c87-bebe0407d8a7@linux.intel.com>
Date: Tue, 26 Mar 2024 00:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Calculate object page offset for partial
 memory mapping
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
References: <20240325134033.287913-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240325134033.287913-1-andi.shyti@linux.intel.com>
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

Hi Andi,

I have too many questions :) I think the patch makes sense but need more 
context, see below:

On 3/25/2024 2:40 PM, Andi Shyti wrote:
> To enable partial memory mapping of GPU virtual memory, it's
> necessary to introduce an offset to the object's memory
> (obj->mm.pages) scatterlist. This adjustment compensates for
> instances when userspace mappings do not start from the beginning
> of the object.
>
> Based on a patch by Chris Wilson
> <chris.p.wilson@linux.intel.com>.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c |  8 +++++---
>   drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
>   drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
>   3 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index a2195e28b625..57a2dda2c3cc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -276,7 +276,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
>   	/* PTEs are revoked in obj->ops->put_pages() */
>   	err = remap_io_sg(area,
>   			  area->vm_start, area->vm_end - area->vm_start,
> -			  obj->mm.pages->sgl, iomap);
> +			  obj->mm.pages->sgl, 0, iomap);

Why don't we need partial mmap for CPU but only for GTT ?

Sounds like this also need to be cover by a IGT tests.  Don't we need 
"Fixes" tag for this?

Regards,

Nirmoy

>   
>   	if (area->vm_flags & VM_WRITE) {
>   		GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> @@ -302,14 +302,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>   	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   	bool write = area->vm_flags & VM_WRITE;
>   	struct i915_gem_ww_ctx ww;
> +	unsigned long obj_offset;
>   	intel_wakeref_t wakeref;
>   	struct i915_vma *vma;
>   	pgoff_t page_offset;
>   	int srcu;
>   	int ret;
>   
> -	/* We don't use vmf->pgoff since that has the fake offset */
> +	obj_offset = area->vm_pgoff - drm_vma_node_start(&mmo->vma_node);
>   	page_offset = (vmf->address - area->vm_start) >> PAGE_SHIFT;
> +	page_offset += obj_offset;
>   
>   	trace_i915_gem_object_fault(obj, page_offset, true, write);
>   
> @@ -404,7 +406,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>   
>   	/* Finally, remap it using the new GTT offset */
>   	ret = remap_io_mapping(area,
> -			       area->vm_start + (vma->gtt_view.partial.offset << PAGE_SHIFT),
> +			       area->vm_start + ((vma->gtt_view.partial.offset - obj_offset) << PAGE_SHIFT),
>   			       (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT,
>   			       min_t(u64, vma->size, area->vm_end - area->vm_start),
>   			       &ggtt->iomap);
> diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
> index 7998bc74ab49..f5c97a620962 100644
> --- a/drivers/gpu/drm/i915/i915_mm.c
> +++ b/drivers/gpu/drm/i915/i915_mm.c
> @@ -122,13 +122,15 @@ int remap_io_mapping(struct vm_area_struct *vma,
>    * @addr: target user address to start at
>    * @size: size of map area
>    * @sgl: Start sg entry
> + * @offset: offset from the start of the page
>    * @iobase: Use stored dma address offset by this address or pfn if -1
>    *
>    *  Note: this is only safe if the mm semaphore is held when called.
>    */
>   int remap_io_sg(struct vm_area_struct *vma,
>   		unsigned long addr, unsigned long size,
> -		struct scatterlist *sgl, resource_size_t iobase)
> +		struct scatterlist *sgl, unsigned long offset,
> +		resource_size_t iobase)
>   {
>   	struct remap_pfn r = {
>   		.mm = vma->vm_mm,
> @@ -141,6 +143,14 @@ int remap_io_sg(struct vm_area_struct *vma,
>   	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
>   	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
>   
> +	while (offset >= sg_dma_len(r.sgt.sgp) >> PAGE_SHIFT) {
> +		offset -= sg_dma_len(r.sgt.sgp) >> PAGE_SHIFT;
> +		r.sgt = __sgt_iter(__sg_next(r.sgt.sgp), use_dma(iobase));
> +		if (!r.sgt.sgp)
> +			return -EINVAL;
> +	}
> +	r.sgt.curr = offset << PAGE_SHIFT;
> +
>   	if (!use_dma(iobase))
>   		flush_cache_range(vma, addr, size);
>   
> diff --git a/drivers/gpu/drm/i915/i915_mm.h b/drivers/gpu/drm/i915/i915_mm.h
> index 04c8974d822b..69f9351b1a1c 100644
> --- a/drivers/gpu/drm/i915/i915_mm.h
> +++ b/drivers/gpu/drm/i915/i915_mm.h
> @@ -30,6 +30,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
>   
>   int remap_io_sg(struct vm_area_struct *vma,
>   		unsigned long addr, unsigned long size,
> -		struct scatterlist *sgl, resource_size_t iobase);
> +		struct scatterlist *sgl, unsigned long offset,
> +		resource_size_t iobase);
>   
>   #endif /* __I915_MM_H__ */
