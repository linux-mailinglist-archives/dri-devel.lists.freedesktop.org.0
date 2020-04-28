Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490301BC12B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485B6E35F;
	Tue, 28 Apr 2020 14:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1A96E35F;
 Tue, 28 Apr 2020 14:27:36 +0000 (UTC)
IronPort-SDR: zaa0JB47grjpVzd7O1yLikK45uvPfryEUXt+B8/OZAlEuhxXSO+dH5hhPbIcYLkkZUjvjzfvYn
 qd51VgoS+ZtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 07:27:35 -0700
IronPort-SDR: jNARB9oOaVwR8a2RkUVAoMTAEt2QguGl2UzmS9sk7DF6E3Z1+74FSZGnqvuhXyVsoJGRusoA09
 F4hn13yZQXyw==
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="432201047"
Received: from mzacniex-mobl1.ger.corp.intel.com (HELO [10.252.53.85])
 ([10.252.53.85])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 07:27:31 -0700
Subject: Re: [Intel-gfx] [RFC 06/17] drm: i915: fix sg_table nents vs.
 orig_nents misuse
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132025eucas1p21580e634500a3e85564551cddf168b4a@eucas1p2.samsung.com>
 <20200428132005.21424-7-m.szyprowski@samsung.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <88c841d0-c64c-f1db-b91a-2c4fe7097ccf@linux.intel.com>
Date: Tue, 28 Apr 2020 15:27:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428132005.21424-7-m.szyprowski@samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2020 14:19, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
> numer of the created entries in the DMA address space. However the
> subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
> called with the original number of entries passed to dma_map_sg. The
> sg_table->nents in turn holds the result of the dma_map_sg call as stated
> in include/linux/scatterlist.h. Adapt the code to obey those rules.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 13 +++++++------
>   drivers/gpu/drm/i915/gem/i915_gem_internal.c     |  4 ++--
>   drivers/gpu/drm/i915/gem/i915_gem_region.c       |  4 ++--
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c        |  5 +++--
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c  | 10 +++++-----
>   drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  5 +++--
>   drivers/gpu/drm/i915/gt/intel_ggtt.c             | 12 ++++++------
>   drivers/gpu/drm/i915/i915_gem_gtt.c              | 12 +++++++-----
>   drivers/gpu/drm/i915/i915_scatterlist.c          |  4 ++--
>   drivers/gpu/drm/i915/selftests/scatterlist.c     |  8 ++++----
>   10 files changed, 41 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 7db5a79..d829852 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -36,21 +36,22 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
>   		goto err_unpin_pages;
>   	}
>   
> -	ret = sg_alloc_table(st, obj->mm.pages->nents, GFP_KERNEL);
> +	ret = sg_alloc_table(st, obj->mm.pages->orig_nents, GFP_KERNEL);
>   	if (ret)
>   		goto err_free;
>   
>   	src = obj->mm.pages->sgl;
>   	dst = st->sgl;
> -	for (i = 0; i < obj->mm.pages->nents; i++) {
> +	for (i = 0; i < obj->mm.pages->orig_nents; i++) {
>   		sg_set_page(dst, sg_page(src), src->length, 0);
>   		dst = sg_next(dst);
>   		src = sg_next(src);
>   	}
>   
> -	if (!dma_map_sg_attrs(attachment->dev,
> -			      st->sgl, st->nents, dir,
> -			      DMA_ATTR_SKIP_CPU_SYNC)) {
> +	st->nents = dma_map_sg_attrs(attachment->dev,
> +				     st->sgl, st->orig_nents, dir,
> +				     DMA_ATTR_SKIP_CPU_SYNC);
> +	if (!st->nents) {
>   		ret = -ENOMEM;
>   		goto err_free_sg;
>   	}
> @@ -74,7 +75,7 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
>   	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
>   
>   	dma_unmap_sg_attrs(attachment->dev,
> -			   sg->sgl, sg->nents, dir,
> +			   sg->sgl, sg->orig_nents, dir,
>   			   DMA_ATTR_SKIP_CPU_SYNC);
>   	sg_free_table(sg);
>   	kfree(sg);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> index cbbff81..a8ebfdd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -73,7 +73,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
>   	}
>   
>   	sg = st->sgl;
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg_page_sizes = 0;
>   
>   	do {
> @@ -94,7 +94,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
>   
>   		sg_set_page(sg, page, PAGE_SIZE << order, 0);
>   		sg_page_sizes |= PAGE_SIZE << order;
> -		st->nents++;
> +		st->nents = st->orig_nents = st->nents + 1;
>   
>   		npages -= 1 << order;
>   		if (!npages) {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index 1515384..58ca560 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -53,7 +53,7 @@
>   	GEM_BUG_ON(list_empty(blocks));
>   
>   	sg = st->sgl;
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg_page_sizes = 0;
>   	prev_end = (resource_size_t)-1;
>   
> @@ -78,7 +78,7 @@
>   
>   			sg->length = block_size;
>   
> -			st->nents++;
> +			st->nents = st->orig_nents = st->nents + 1;
>   		} else {
>   			sg->length += block_size;
>   			sg_dma_len(sg) += block_size;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 5d5d7ee..851a732 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -80,7 +80,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>   	noreclaim |= __GFP_NORETRY | __GFP_NOWARN;
>   
>   	sg = st->sgl;
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg_page_sizes = 0;
>   	for (i = 0; i < page_count; i++) {
>   		const unsigned int shrink[] = {
> @@ -140,7 +140,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>   				sg_page_sizes |= sg->length;
>   				sg = sg_next(sg);
>   			}
> -			st->nents++;
> +			st->nents = st->orig_nents = st->nents + 1;

A bit higher up, not shown in the patch, we have allocated a table via 
sg_alloc_table giving it a pessimistic max nents, sometimes much larger 
than the st->nents this loops will create. But orig_nents has been now 
been overwritten. Will that leak memory come sg_table_free?

As minimum it will nerf our i915_sg_trim optimization a bit lower down, 
also not shown in the diff.

Regards,

Tvrtko

> +
>   			sg_set_page(sg, page, PAGE_SIZE, 0);
>   		} else {
>   			sg->length += PAGE_SIZE;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index c9988b6..bd141f9 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -76,7 +76,7 @@ static int get_huge_pages(struct drm_i915_gem_object *obj)
>   
>   	rem = obj->base.size;
>   	sg = st->sgl;
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg_page_sizes = 0;
>   
>   	/*
> @@ -99,7 +99,7 @@ static int get_huge_pages(struct drm_i915_gem_object *obj)
>   
>   			sg_set_page(sg, page, page_size, 0);
>   			sg_page_sizes |= page_size;
> -			st->nents++;
> +			st->nents = st->orig_nents = st->nents + 1;
>   
>   			rem -= page_size;
>   			if (!rem) {
> @@ -201,7 +201,7 @@ static int fake_get_huge_pages(struct drm_i915_gem_object *obj)
>   	/* Use optimal page sized chunks to fill in the sg table */
>   	rem = obj->base.size;
>   	sg = st->sgl;
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg_page_sizes = 0;
>   	do {
>   		unsigned int page_size = get_largest_page_size(i915, rem);
> @@ -217,7 +217,7 @@ static int fake_get_huge_pages(struct drm_i915_gem_object *obj)
>   
>   		sg_page_sizes |= len;
>   
> -		st->nents++;
> +		st->nents = st->orig_nents = st->nents + 1;
>   
>   		rem -= len;
>   		if (!rem) {
> @@ -252,7 +252,7 @@ static int fake_get_huge_pages_single(struct drm_i915_gem_object *obj)
>   	}
>   
>   	sg = st->sgl;
> -	st->nents = 1;
> +	st->nents = st->orig_nents = 1;
>   
>   	page_size = get_largest_page_size(i915, obj->base.size);
>   	GEM_BUG_ON(!page_size);
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> index debaf7b..5723525 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> @@ -28,7 +28,8 @@ static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attachment,
>   		sg = sg_next(sg);
>   	}
>   
> -	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
> +	st->nents = dma_map_sg(attachment->dev, st->sgl, st->orig_nents, dir);
> +	if (!st->nents) {
>   		err = -ENOMEM;
>   		goto err_st;
>   	}
> @@ -46,7 +47,7 @@ static void mock_unmap_dma_buf(struct dma_buf_attachment *attachment,
>   			       struct sg_table *st,
>   			       enum dma_data_direction dir)
>   {
> -	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
> +	dma_unmap_sg(attachment->dev, st->sgl, st->orig_nents, dir);
>   	sg_free_table(st);
>   	kfree(st);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 66165b1..9a298bf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -1221,7 +1221,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   	for (column = 0; column < width; column++) {
>   		src_idx = stride * (height - 1) + column + offset;
>   		for (row = 0; row < height; row++) {
> -			st->nents++;
> +			st->nents = st->orig_nents = st->nents + 1;
>   			/*
>   			 * We don't need the pages, but need to initialize
>   			 * the entries so the sg list can be happily traversed.
> @@ -1259,7 +1259,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   	if (ret)
>   		goto err_sg_alloc;
>   
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg = st->sgl;
>   
>   	for (i = 0 ; i < ARRAY_SIZE(rot_info->plane); i++) {
> @@ -1306,7 +1306,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   
>   			length = min(left, length);
>   
> -			st->nents++;
> +			st->nents = st->orig_nents = st->nents + 1;
>   
>   			sg_set_page(sg, NULL, length, 0);
>   			sg_dma_address(sg) = addr;
> @@ -1343,7 +1343,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   	if (ret)
>   		goto err_sg_alloc;
>   
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	sg = st->sgl;
>   
>   	for (i = 0 ; i < ARRAY_SIZE(rem_info->plane); i++) {
> @@ -1389,7 +1389,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   	GEM_BUG_ON(!iter);
>   
>   	sg = st->sgl;
> -	st->nents = 0;
> +	st->nents = st->orig_nents = 0;
>   	do {
>   		unsigned int len;
>   
> @@ -1400,7 +1400,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   			sg_dma_address(iter) + (offset << PAGE_SHIFT);
>   		sg_dma_len(sg) = len;
>   
> -		st->nents++;
> +		st->nents = st->orig_nents = st->nents + 1;
>   		count -= len >> PAGE_SHIFT;
>   		if (count == 0) {
>   			sg_mark_end(sg);
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index cb43381..c4122cd3 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -28,10 +28,11 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>   			       struct sg_table *pages)
>   {
>   	do {
> -		if (dma_map_sg_attrs(&obj->base.dev->pdev->dev,
> -				     pages->sgl, pages->nents,
> -				     PCI_DMA_BIDIRECTIONAL,
> -				     DMA_ATTR_NO_WARN))
> +		pages->nents = dma_map_sg_attrs(&obj->base.dev->pdev->dev,
> +						pages->sgl, pages->orig_nents,
> +						PCI_DMA_BIDIRECTIONAL,
> +						DMA_ATTR_NO_WARN);
> +		if (page->nents)
>   			return 0;
>   
>   		/*
> @@ -68,7 +69,8 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>   		}
>   	}
>   
> -	dma_unmap_sg(kdev, pages->sgl, pages->nents, PCI_DMA_BIDIRECTIONAL);
> +	dma_unmap_sg(kdev, pages->sgl, pages->orig_nents,
> +		     PCI_DMA_BIDIRECTIONAL);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index cc6b384..05bee13 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -15,11 +15,11 @@ bool i915_sg_trim(struct sg_table *orig_st)
>   	if (orig_st->nents == orig_st->orig_nents)
>   		return false;
>   
> -	if (sg_alloc_table(&new_st, orig_st->nents, GFP_KERNEL | __GFP_NOWARN))
> +	if (sg_alloc_table(&new_st, orig_st->orig_nents, GFP_KERNEL | __GFP_NOWARN))
>   		return false;
>   
>   	new_sg = new_st.sgl;
> -	for_each_sg(orig_st->sgl, sg, orig_st->nents, i) {
> +	for_each_sg(orig_st->sgl, sg, orig_st->orig_nents, i) {
>   		sg_set_page(new_sg, sg_page(sg), sg->length, 0);
>   		sg_dma_address(new_sg) = sg_dma_address(sg);
>   		sg_dma_len(new_sg) = sg_dma_len(sg);
> diff --git a/drivers/gpu/drm/i915/selftests/scatterlist.c b/drivers/gpu/drm/i915/selftests/scatterlist.c
> index d599186..4456fe5 100644
> --- a/drivers/gpu/drm/i915/selftests/scatterlist.c
> +++ b/drivers/gpu/drm/i915/selftests/scatterlist.c
> @@ -48,9 +48,9 @@ static noinline int expect_pfn_sg(struct pfn_table *pt,
>   	unsigned long pfn, n;
>   
>   	pfn = pt->start;
> -	for_each_sg(pt->st.sgl, sg, pt->st.nents, n) {
> +	for_each_sg(pt->st.sgl, sg, pt->st.orig_nents, n) {
>   		struct page *page = sg_page(sg);
> -		unsigned int npages = npages_fn(n, pt->st.nents, rnd);
> +		unsigned int npages = npages_fn(n, pt->st.orig_nents, rnd);
>   
>   		if (page_to_pfn(page) != pfn) {
>   			pr_err("%s: %s left pages out of order, expected pfn %lu, found pfn %lu (using for_each_sg)\n",
> @@ -86,7 +86,7 @@ static noinline int expect_pfn_sg_page_iter(struct pfn_table *pt,
>   	unsigned long pfn;
>   
>   	pfn = pt->start;
> -	for_each_sg_page(pt->st.sgl, &sgiter, pt->st.nents, 0) {
> +	for_each_sg_page(pt->st.sgl, &sgiter, pt->st.orig_nents, 0) {
>   		struct page *page = sg_page_iter_page(&sgiter);
>   
>   		if (page != pfn_to_page(pfn)) {
> @@ -256,7 +256,7 @@ static int alloc_table(struct pfn_table *pt,
>   		pfn += npages;
>   	}
>   	sg_mark_end(sg);
> -	pt->st.nents = n;
> +	pt->st.nents = pt->st.orig_nents = n;
>   	pt->end = pfn;
>   
>   	return 0;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
