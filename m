Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325494C253
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 18:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B1110E782;
	Thu,  8 Aug 2024 16:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1ChD40g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B707410E782;
 Thu,  8 Aug 2024 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723133501; x=1754669501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r8sMdeDaRxLzvT2g1SNM5M2IFf2IXOFB2vRN1wjR3mM=;
 b=G1ChD40g4jGrp4JQ8l8k1D086/VeVndf1U4pk+g6y4PKAy6R77VUVtTj
 +3znNEA7mSIySNbbsdFh2xTTrqf/lZVEDjWc8/qEztKsP518GUR4J6nDC
 EXpQatomw190Md+AXJEvMDWfGRtDzcfdckJqS/38mf1YbqxHE5vgWufOc
 qim/75FYoloRJ89KFTkEwXq9s2IENvxtC7iVbNro04MtkKJyLa3wGcNM4
 aVakxNWXZJfJRELCYDY48lIEvAyZY0ODY0YhaadVy/Cm/F8V1pK9CVTJ4
 DfhyBDnpPgBQnLeQQAycOTV68KSFSQ1d72/7082KcbLy8X5ofk7RvUZOq w==;
X-CSE-ConnectionGUID: v9NeT6J2QKK/uPNIKfW+Ng==
X-CSE-MsgGUID: 5YjSHgJyTqeQpuK/0UM0ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25032302"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="25032302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:11:40 -0700
X-CSE-ConnectionGUID: bglNPk8CTwGZfzOUxW8YYA==
X-CSE-MsgGUID: GTWnauRbQCa/kIYncuRyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="62118366"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.117])
 ([10.245.146.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:11:38 -0700
Message-ID: <45e4b0a2-c2e7-4cc2-814c-a39c764a0a3b@linux.intel.com>
Date: Thu, 8 Aug 2024 18:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/gem: Calculate object page offset for
 partial memory mapping
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <20240807100521.478266-3-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240807100521.478266-3-andi.shyti@linux.intel.com>
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


On 8/7/2024 12:05 PM, Andi Shyti wrote:
> To enable partial memory mapping of GPU virtual memory, it's
> necessary to introduce an offset to the object's memory
> (obj->mm.pages) scatterlist. This adjustment compensates for
> instances when userspace mappings do not start from the beginning
> of the object.
>
> Based on a patch by Chris Wilson.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c |  4 +++-
>   drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
>   drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
>   3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index d3ee8ef7ea2f..bb00af317d59 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -252,6 +252,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
>   	struct vm_area_struct *area = vmf->vma;
>   	struct i915_mmap_offset *mmo = area->vm_private_data;
>   	struct drm_i915_gem_object *obj = mmo->obj;
> +	unsigned long obj_offset;
>   	resource_size_t iomap;
>   	int err;
>   
> @@ -273,10 +274,11 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
>   		iomap -= obj->mm.region->region.start;
>   	}
>   
> +	obj_offset = area->vm_pgoff - drm_vma_node_start(&mmo->vma_node);
>   	/* PTEs are revoked in obj->ops->put_pages() */
>   	err = remap_io_sg(area,
>   			  area->vm_start, area->vm_end - area->vm_start,
> -			  obj->mm.pages->sgl, iomap);
> +			  obj->mm.pages->sgl, obj_offset, iomap);
>   
>   	if (area->vm_flags & VM_WRITE) {
>   		GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
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
