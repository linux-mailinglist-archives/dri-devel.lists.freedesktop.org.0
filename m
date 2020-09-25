Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B5278914
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 15:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FF96EC5D;
	Fri, 25 Sep 2020 13:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA7C6EB2E;
 Fri, 25 Sep 2020 13:11:42 +0000 (UTC)
IronPort-SDR: rAu/0Jz1/y86PQdl419TefK6I6/letQAa9AgvdKgvpVBqU+6B7maqrQiHM9yWAglKRY0/n7gQk
 QKOH1JL5kXNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="140934121"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="140934121"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:11:41 -0700
IronPort-SDR: Cx9GTgN932+B5kZwf5dsa5xKxL7N/hfSSwW0z4VmSrslkwicASqHt4X6SFa68TyEONbCGp1Y40
 IRYR97di+wig==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455828530"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:11:35 -0700
Subject: Re: [PATCH 08/11] drm/i915: use vmap in i915_gem_object_map
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-9-hch@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <63e331f4-2283-b579-f9b1-795a73f80bb8@linux.intel.com>
Date: Fri, 25 Sep 2020 14:11:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-9-hch@lst.de>
Content-Language: en-US
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/09/2020 14:58, Christoph Hellwig wrote:
> i915_gem_object_map implements fairly low-level vmap functionality in
> a driver.  Split it into two helpers, one for remapping kernel memory
> which can use vmap, and one for I/O memory that uses vmap_pfn.
> 
> The only practical difference is that alloc_vm_area prefeaults the
> vmalloc area PTEs, which doesn't seem to be required here for the
> kernel memory case (and could be added to vmap using a flag if actually
> required).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/Kconfig              |   1 +
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 126 ++++++++++------------
>   2 files changed, 59 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 9afa5c4a6bf006..1e1cb245fca778 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -25,6 +25,7 @@ config DRM_I915
>   	select CRC32
>   	select SND_HDA_I915 if SND_HDA_CORE
>   	select CEC_CORE if CEC_NOTIFIER
> +	select VMAP_PFN
>   	help
>   	  Choose this option if you have a system that has "Intel Graphics
>   	  Media Accelerator" or "HD Graphics" integrated graphics,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 6550c0bc824ea2..b519417667eb4b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -232,34 +232,21 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
>   	return err;
>   }
>   
> -static inline pte_t iomap_pte(resource_size_t base,
> -			      dma_addr_t offset,
> -			      pgprot_t prot)
> -{
> -	return pte_mkspecial(pfn_pte((base + offset) >> PAGE_SHIFT, prot));
> -}
> -
>   /* The 'mapping' part of i915_gem_object_pin_map() below */
> -static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
> -				 enum i915_map_type type)
> +static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
> +		enum i915_map_type type)
>   {
> -	unsigned long n_pte = obj->base.size >> PAGE_SHIFT;
> -	struct sg_table *sgt = obj->mm.pages;
> -	pte_t *stack[32], **mem;
> -	struct vm_struct *area;
> +	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
> +	struct page *stack[32], **pages = stack, *page;
> +	struct sgt_iter iter;
>   	pgprot_t pgprot;
> +	void *vaddr;
>   
> -	if (!i915_gem_object_has_struct_page(obj) && type != I915_MAP_WC)
> -		return NULL;
> -
> -	if (GEM_WARN_ON(type == I915_MAP_WC &&
> -			!static_cpu_has(X86_FEATURE_PAT)))
> -		return NULL;
> -
> -	/* A single page can always be kmapped */
> -	if (n_pte == 1 && type == I915_MAP_WB) {
> -		struct page *page = sg_page(sgt->sgl);
> -
> +	switch (type) {
> +	default:
> +		MISSING_CASE(type);
> +		fallthrough;	/* to use PAGE_KERNEL anyway */
> +	case I915_MAP_WB:
>   		/*
>   		 * On 32b, highmem using a finite set of indirect PTE (i.e.
>   		 * vmap) to provide virtual mappings of the high pages.
> @@ -277,30 +264,8 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>   		 * So if the page is beyond the 32b boundary, make an explicit
>   		 * vmap.
>   		 */
> -		if (!PageHighMem(page))
> -			return page_address(page);
> -	}
> -
> -	mem = stack;
> -	if (n_pte > ARRAY_SIZE(stack)) {
> -		/* Too big for stack -- allocate temporary array instead */
> -		mem = kvmalloc_array(n_pte, sizeof(*mem), GFP_KERNEL);
> -		if (!mem)
> -			return NULL;
> -	}
> -
> -	area = alloc_vm_area(obj->base.size, mem);
> -	if (!area) {
> -		if (mem != stack)
> -			kvfree(mem);
> -		return NULL;
> -	}
> -
> -	switch (type) {
> -	default:
> -		MISSING_CASE(type);
> -		fallthrough;	/* to use PAGE_KERNEL anyway */
> -	case I915_MAP_WB:
> +		if (n_pages == 1 && !PageHighMem(sg_page(obj->mm.pages->sgl)))
> +			return page_address(sg_page(obj->mm.pages->sgl));
>   		pgprot = PAGE_KERNEL;
>   		break;
>   	case I915_MAP_WC:
> @@ -308,30 +273,49 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>   		break;
>   	}
>   
> -	if (i915_gem_object_has_struct_page(obj)) {
> -		struct sgt_iter iter;
> -		struct page *page;
> -		pte_t **ptes = mem;
> +	if (n_pages > ARRAY_SIZE(stack)) {
> +		/* Too big for stack -- allocate temporary array instead */
> +		pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +		if (!pages)
> +			return NULL;
> +	}
>   
> -		for_each_sgt_page(page, iter, sgt)
> -			**ptes++ = mk_pte(page, pgprot);
> -	} else {
> -		resource_size_t iomap;
> -		struct sgt_iter iter;
> -		pte_t **ptes = mem;
> -		dma_addr_t addr;
> +	i = 0;
> +	for_each_sgt_page(page, iter, obj->mm.pages)
> +		pages[i++] = page;
> +	vaddr = vmap(pages, n_pages, 0, pgprot);
> +	if (pages != stack)
> +		kvfree(pages);
> +	return vaddr;
> +}
>   
> -		iomap = obj->mm.region->iomap.base;
> -		iomap -= obj->mm.region->region.start;
> +static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
> +		enum i915_map_type type)
> +{
> +	resource_size_t iomap = obj->mm.region->iomap.base -
> +		obj->mm.region->region.start;
> +	unsigned long n_pfn = obj->base.size >> PAGE_SHIFT;
> +	unsigned long stack[32], *pfns = stack, i;
> +	struct sgt_iter iter;
> +	dma_addr_t addr;
> +	void *vaddr;
> +
> +	if (type != I915_MAP_WC)
> +		return NULL;
>   
> -		for_each_sgt_daddr(addr, iter, sgt)
> -			**ptes++ = iomap_pte(iomap, addr, pgprot);
> +	if (n_pfn > ARRAY_SIZE(stack)) {
> +		/* Too big for stack -- allocate temporary array instead */
> +		pfns = kvmalloc_array(n_pfn, sizeof(*pfns), GFP_KERNEL);
> +		if (!pfns)
> +			return NULL;
>   	}
>   
> -	if (mem != stack)
> -		kvfree(mem);
> -
> -	return area->addr;
> +	for_each_sgt_daddr(addr, iter, obj->mm.pages)
> +		pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
> +	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
> +	if (pfns != stack)
> +		kvfree(pfns);
> +	return vaddr;
>   }
>   
>   /* get, pin, and map the pages of the object into kernel space */
> @@ -383,7 +367,13 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>   	}
>   
>   	if (!ptr) {
> -		ptr = i915_gem_object_map(obj, type);
> +		if (GEM_WARN_ON(type == I915_MAP_WC &&
> +				!static_cpu_has(X86_FEATURE_PAT)))
> +			ptr = NULL;
> +		else if (i915_gem_object_has_struct_page(obj))
> +			ptr = i915_gem_object_map_page(obj, type);
> +		else
> +			ptr = i915_gem_object_map_pfn(obj, type);
>   		if (!ptr) {
>   			err = -ENOMEM;
>   			goto err_unpin;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
