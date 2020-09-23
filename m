Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92B2754D2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 11:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187EA6E093;
	Wed, 23 Sep 2020 09:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CB66E093;
 Wed, 23 Sep 2020 09:52:43 +0000 (UTC)
IronPort-SDR: UQo/hK2K3gff/26nznxVtZmu69MENX3p8U4srk5hVmrvjCKPV6lpEWa9ETox+E2d7bjjRxvGAT
 wIE/V+vdUupQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="148500533"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148500533"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 02:52:41 -0700
IronPort-SDR: seIxyGE1Vw8wLigC1YT863o99ElqSWQAiuSZRkgjZoMQsFRRWMV/uMP79du30Xlum1gHB9JcsL
 DrdLmgIHayQA==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="486376229"
Received: from yymichae-mobl.ger.corp.intel.com (HELO [10.214.208.219])
 ([10.214.208.219])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 02:52:36 -0700
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: use vmap in i915_gem_object_map
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-5-hch@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9b5d40af-7378-9e68-ca51-73b2148287f3@linux.intel.com>
Date: Wed, 23 Sep 2020 10:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918163724.2511-5-hch@lst.de>
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
 Stefano Stabellini <sstabellini@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/09/2020 17:37, Christoph Hellwig wrote:
> i915_gem_object_map implements fairly low-level vmap functionality in
> a driver.  Split it into two helpers, one for remapping kernel memory
> which can use vmap, and one for I/O memory that uses vmap_pfn.
> 
> The only practical difference is that alloc_vm_area prefeaults the
> vmalloc area PTEs, which doesn't seem to be required here for the
> kernel memory case (and could be added to vmap using a flag if actually
> required).

Patch looks good to me.

Series did not get a CI run from our side because of a different base so 
I don't know if you would like to have a run there? If so you would need 
to rebase against git://anongit.freedesktop.org/drm-tip drm-tip and you 
could even send a series to intel-gfx-trybot@lists.freedesktop.org, 
suppressing cc, to check it out without sending a copy to the real 
mailing list.

Regards,

Tvrtko

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/Kconfig              |   1 +
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 101 ++++++++++------------
>   2 files changed, 47 insertions(+), 55 deletions(-)
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
> index e8a083743e0927..90029ea83aede9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -234,50 +234,24 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
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
> +static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
>   				 enum i915_map_type type)
>   {
> -	unsigned long n_pte = obj->base.size >> PAGE_SHIFT;
> -	struct sg_table *sgt = obj->mm.pages;
> -	pte_t *stack[32], **mem;
> -	struct vm_struct *area;
> +	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
> +	struct page *stack[32], **pages = stack, *page;
> +	struct sgt_iter iter;
>   	pgprot_t pgprot;
> -
> -	if (!i915_gem_object_has_struct_page(obj) && type != I915_MAP_WC)
> -		return NULL;
> -
> -	/* A single page can always be kmapped */
> -	if (n_pte == 1 && type == I915_MAP_WB)
> -		return kmap(sg_page(sgt->sgl));
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
> +	void *vaddr;
>   
>   	switch (type) {
>   	default:
>   		MISSING_CASE(type);
>   		fallthrough;	/* to use PAGE_KERNEL anyway */
>   	case I915_MAP_WB:
> +		/* A single page can always be kmapped */
> +		if (n_pages == 1)
> +			return kmap(sg_page(obj->mm.pages->sgl));
>   		pgprot = PAGE_KERNEL;
>   		break;
>   	case I915_MAP_WC:
> @@ -285,30 +259,44 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>   		break;
>   	}
>   
> -	if (i915_gem_object_has_struct_page(obj)) {
> -		struct sgt_iter iter;
> -		struct page *page;
> -		pte_t **ptes = mem;
> -
> -		for_each_sgt_page(page, iter, sgt)
> -			**ptes++ = mk_pte(page, pgprot);
> -	} else {
> -		resource_size_t iomap;
> -		struct sgt_iter iter;
> -		pte_t **ptes = mem;
> -		dma_addr_t addr;
> +	if (n_pages > ARRAY_SIZE(stack)) {
> +		/* Too big for stack -- allocate temporary array instead */
> +		pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +		if (!pages)
> +			return NULL;
> +	}
>   
> -		iomap = obj->mm.region->iomap.base;
> -		iomap -= obj->mm.region->region.start;
> +	for_each_sgt_page(page, iter, obj->mm.pages)
> +		pages[i++] = page;
> +	vaddr = vmap(pages, n_pages, 0, pgprot);
> +	if (pages != stack)
> +		kvfree(pages);
> +	return vaddr;
> +}
>   
> -		for_each_sgt_daddr(addr, iter, sgt)
> -			**ptes++ = iomap_pte(iomap, addr, pgprot);
> +static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj)
> +{
> +	resource_size_t iomap = obj->mm.region->iomap.base -
> +		obj->mm.region->region.start;
> +	unsigned long n_pfn = obj->base.size >> PAGE_SHIFT;
> +	unsigned long stack[32], *pfns = stack, i;
> +	struct sgt_iter iter;
> +	dma_addr_t addr;
> +	void *vaddr;
> +
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
> @@ -360,7 +348,10 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>   	}
>   
>   	if (!ptr) {
> -		ptr = i915_gem_object_map(obj, type);
> +		if (i915_gem_object_has_struct_page(obj))
> +			ptr = i915_gem_object_map_page(obj, type);
> +		else if (type == I915_MAP_WC)
> +			ptr = i915_gem_object_map_pfn(obj);
>   		if (!ptr) {
>   			err = -ENOMEM;
>   			goto err_unpin;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
