Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613A57DED1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 11:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9269A12A6BF;
	Fri, 22 Jul 2022 09:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE63A12A731;
 Fri, 22 Jul 2022 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658483160; x=1690019160;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sYUmQrbm0Jo3tvS0KREIf1cEPW+JlMwcqzzX7TywFLQ=;
 b=bcMXRbP8aDSkmWpZCv9lGZx8gQeiJoDFBATX16cw4D1bH1yXwiNM66Ir
 +c7PAQnR36MKm42IoPoOVZsJnX1ZhkJorcljX7tJtzm3kSy1h9rioPCqI
 lKGzucD2xNwy5KCxAW1Jaxud3fqBUsLFiRDv0LnoPV0wpFPijIuyV8Wg9
 O8JXeskMDpcWu1KHHeHjiV1tp7d72FoTor0pmAOdwVeva8IkMTkYKwrmN
 NFXM93TsdlO4pvnpy/59r+HO/AVUMbRKs8FiNL1NFe4JtLaaCZ3yisWbk
 er9NzdBkclIBkJGyh+tn2QH6lM9uX/cvYP9oqjbdjTclva17JkMv7hUHp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="348981165"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="348981165"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 02:45:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="549116872"
Received: from rdolan-mobl.ger.corp.intel.com (HELO [10.213.216.165])
 ([10.213.216.165])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 02:45:56 -0700
Message-ID: <a0a7a734-d3dd-960e-f130-39f86b04b24d@linux.intel.com>
Date: Fri, 22 Jul 2022 10:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915: stop using swiotlb
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220721174307.1085741-1-bob.beckett@collabora.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220721174307.1085741-1-bob.beckett@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, kernel@collabora.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2022 18:43, Robert Beckett wrote:
> Calling swiotlb functions directly is nowadays considered harmful. See
> https://lore.kernel.org/intel-gfx/20220711082614.GA29487@lst.de/
> 
> Replace swiotlb_max_segment() calls with dma_max_mapping_size().
> In i915_gem_object_get_pages_internal() no longer consider max_segment
> only if CONFIG_SWIOTLB is enabled. There can be other (iommu related)
> causes of specific max segment sizes.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_internal.c | 20 +++++---------------
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c    |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  4 ++--
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  2 +-
>   drivers/gpu/drm/i915/i915_scatterlist.h      | 16 ----------------
>   5 files changed, 9 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> index c698f95af15f..e1aca378d90f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -6,7 +6,6 @@
>   
>   #include <linux/scatterlist.h>
>   #include <linux/slab.h>
> -#include <linux/swiotlb.h>
>   
>   #include "i915_drv.h"
>   #include "i915_gem.h"
> @@ -38,22 +37,13 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
>   	struct scatterlist *sg;
>   	unsigned int sg_page_sizes;
>   	unsigned int npages;
> -	int max_order;
> +	int max_order = MAX_ORDER;
> +	size_t max_segment;
>   	gfp_t gfp;
>   
> -	max_order = MAX_ORDER;
> -#ifdef CONFIG_SWIOTLB
> -	if (is_swiotlb_active(obj->base.dev->dev)) {
> -		unsigned int max_segment;
> -
> -		max_segment = swiotlb_max_segment();
> -		if (max_segment) {
> -			max_segment = max_t(unsigned int, max_segment,
> -					    PAGE_SIZE) >> PAGE_SHIFT;
> -			max_order = min(max_order, ilog2(max_segment));
> -		}
> -	}
> -#endif
> +	max_segment = dma_max_mapping_size(i915->drm.dev);
> +	max_segment = max_t(size_t, max_segment, PAGE_SIZE) >> PAGE_SHIFT;
> +	max_order = min(max_order, ilog2(max_segment));
>   
>   	gfp = GFP_KERNEL | __GFP_HIGHMEM | __GFP_RECLAIMABLE;
>   	if (IS_I965GM(i915) || IS_I965G(i915)) {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 4eed3dd90ba8..b0ec65b7c1da 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -194,7 +194,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>   	struct intel_memory_region *mem = obj->mm.region;
>   	struct address_space *mapping = obj->base.filp->f_mapping;
>   	const unsigned long page_count = obj->base.size / PAGE_SIZE;
> -	unsigned int max_segment = i915_sg_segment_size();
> +	unsigned int max_segment = dma_max_mapping_size(i915->drm.dev);
>   	struct sg_table *st;
>   	struct sgt_iter sgt_iter;
>   	struct page *page;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 5a5cf332d8a5..882f046f4d18 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -189,7 +189,7 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
>   	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
>   	struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
>   	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> -	const unsigned int max_segment = i915_sg_segment_size();
> +	const unsigned int max_segment = dma_max_mapping_size(i915->drm.dev);
>   	const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
>   	struct file *filp = i915_tt->filp;
>   	struct sgt_iter sgt_iter;
> @@ -568,7 +568,7 @@ static struct i915_refct_sgt *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>   	ret = sg_alloc_table_from_pages_segment(st,
>   			ttm->pages, ttm->num_pages,
>   			0, (unsigned long)ttm->num_pages << PAGE_SHIFT,
> -			i915_sg_segment_size(), GFP_KERNEL);
> +			dma_max_mapping_size(i915_tt->dev), GFP_KERNEL);
>   	if (ret) {
>   		st->sgl = NULL;
>   		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 094f06b4ce33..8a62a71859e6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -129,7 +129,7 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
>   static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
>   {
>   	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
> -	unsigned int max_segment = i915_sg_segment_size();
> +	unsigned int max_segment = dma_max_mapping_size(obj->base.dev->dev);
>   	struct sg_table *st;
>   	unsigned int sg_page_sizes;
>   	struct page **pvec;
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index 9ddb3e743a3e..c9a61b51e99d 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -9,7 +9,6 @@
>   
>   #include <linux/pfn.h>
>   #include <linux/scatterlist.h>
> -#include <linux/swiotlb.h>
>   
>   #include "i915_gem.h"
>   
> @@ -127,21 +126,6 @@ static inline unsigned int i915_sg_dma_sizes(struct scatterlist *sg)
>   	return page_sizes;
>   }
>   
> -static inline unsigned int i915_sg_segment_size(void)
> -{
> -	unsigned int size = swiotlb_max_segment();
> -
> -	if (size == 0)
> -		size = UINT_MAX;

On a more detailed look, there was a CI failure which makes me think 
this cap might need to stay. Because max sg segment is unsigned int. So 
I wonder if sg contstruction overflows without it.

If this quick analysis is right, you could leave i915_sg_segment_size 
helper and cap the return from dma_max_mapping_size to UINT_MAX in it.

Regards,

Tvrtko

*) 
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_106589v1/shard-tglb2/igt@gem_mmap_offset@clear.html

> -
> -	size = rounddown(size, PAGE_SIZE);
> -	/* swiotlb_max_segment_size can return 1 byte when it means one page. */
> -	if (size < PAGE_SIZE)
> -		size = PAGE_SIZE;
> -
> -	return size;
> -}
> -
>   bool i915_sg_trim(struct sg_table *orig_st);
>   
>   /**
