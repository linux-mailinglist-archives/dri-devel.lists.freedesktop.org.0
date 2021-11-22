Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC184590E2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37789FC0;
	Mon, 22 Nov 2021 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616EC89FC0;
 Mon, 22 Nov 2021 15:06:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="258622422"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="258622422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 07:04:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="456665989"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 07:04:53 -0800
Date: Mon, 22 Nov 2021 20:38:01 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 1/4] drm/i915: Avoid allocating a page array for the
 gpu coredump
Message-ID: <20211122150801.GA13257@intel.com>
References: <20211108174547.979714-1-thomas.hellstrom@linux.intel.com>
 <20211108174547.979714-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211108174547.979714-2-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-08 at 18:45:44 +0100, Thomas Hellström wrote:
> The gpu coredump typically takes place in a dma_fence signalling
> critical path, and hence can't use GFP_KERNEL allocations, as that
> means we might hit deadlocks under memory pressure. However
> changing to __GFP_KSWAPD_RECLAIM which will be done in an upcoming
> patch will instead mean a lower chance of the allocation succeeding.
> In particular large contigous allocations like the coredump page
> vector.
> Remove the page vector in favor of a linked list of single pages.
> Use the page lru list head as the list link, as the page owner is
> allowed to do that.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Looks good to me

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 50 +++++++++++++++------------
>  drivers/gpu/drm/i915/i915_gpu_error.h |  4 +--
>  2 files changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 2a2d7643b551..14de64282697 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -275,16 +275,16 @@ static bool compress_start(struct i915_vma_compress *c)
>  static void *compress_next_page(struct i915_vma_compress *c,
>  				struct i915_vma_coredump *dst)
>  {
> -	void *page;
> +	void *page_addr;
> +	struct page *page;
>  
> -	if (dst->page_count >= dst->num_pages)
> -		return ERR_PTR(-ENOSPC);
> -
> -	page = pool_alloc(&c->pool, ALLOW_FAIL);
> -	if (!page)
> +	page_addr = pool_alloc(&c->pool, ALLOW_FAIL);
> +	if (!page_addr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	return dst->pages[dst->page_count++] = page;
> +	page = virt_to_page(page_addr);
> +	list_add_tail(&page->lru, &dst->page_list);
> +	return page_addr;
>  }
>  
>  static int compress_page(struct i915_vma_compress *c,
> @@ -397,7 +397,7 @@ static int compress_page(struct i915_vma_compress *c,
>  
>  	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
>  		memcpy(ptr, src, PAGE_SIZE);
> -	dst->pages[dst->page_count++] = ptr;
> +	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
>  	cond_resched();
>  
>  	return 0;
> @@ -614,7 +614,7 @@ static void print_error_vma(struct drm_i915_error_state_buf *m,
>  			    const struct i915_vma_coredump *vma)
>  {
>  	char out[ASCII85_BUFSZ];
> -	int page;
> +	struct page *page;
>  
>  	if (!vma)
>  		return;
> @@ -628,16 +628,17 @@ static void print_error_vma(struct drm_i915_error_state_buf *m,
>  		err_printf(m, "gtt_page_sizes = 0x%08x\n", vma->gtt_page_sizes);
>  
>  	err_compression_marker(m);
> -	for (page = 0; page < vma->page_count; page++) {
> +	list_for_each_entry(page, &vma->page_list, lru) {
>  		int i, len;
> +		const u32 *addr = page_address(page);
>  
>  		len = PAGE_SIZE;
> -		if (page == vma->page_count - 1)
> +		if (page == list_last_entry(&vma->page_list, typeof(*page), lru))
>  			len -= vma->unused;
>  		len = ascii85_encode_len(len);
>  
>  		for (i = 0; i < len; i++)
> -			err_puts(m, ascii85_encode(vma->pages[page][i], out));
> +			err_puts(m, ascii85_encode(addr[i], out));
>  	}
>  	err_puts(m, "\n");
>  }
> @@ -946,10 +947,12 @@ static void i915_vma_coredump_free(struct i915_vma_coredump *vma)
>  {
>  	while (vma) {
>  		struct i915_vma_coredump *next = vma->next;
> -		int page;
> +		struct page *page, *n;
>  
> -		for (page = 0; page < vma->page_count; page++)
> -			free_page((unsigned long)vma->pages[page]);
> +		list_for_each_entry_safe(page, n, &vma->page_list, lru) {
> +			list_del_init(&page->lru);
> +			__free_page(page);
> +		}
>  
>  		kfree(vma);
>  		vma = next;
> @@ -1016,7 +1019,6 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  	struct i915_ggtt *ggtt = gt->ggtt;
>  	const u64 slot = ggtt->error_capture.start;
>  	struct i915_vma_coredump *dst;
> -	unsigned long num_pages;
>  	struct sgt_iter iter;
>  	int ret;
>  
> @@ -1025,9 +1027,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  	if (!vma || !vma->pages || !compress)
>  		return NULL;
>  
> -	num_pages = min_t(u64, vma->size, vma->obj->base.size) >> PAGE_SHIFT;
> -	num_pages = DIV_ROUND_UP(10 * num_pages, 8); /* worstcase zlib growth */
> -	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ALLOW_FAIL);
> +	dst = kmalloc(sizeof(*dst), ALLOW_FAIL);
>  	if (!dst)
>  		return NULL;
>  
> @@ -1036,14 +1036,13 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  		return NULL;
>  	}
>  
> +	INIT_LIST_HEAD(&dst->page_list);
>  	strcpy(dst->name, name);
>  	dst->next = NULL;
>  
>  	dst->gtt_offset = vma->node.start;
>  	dst->gtt_size = vma->node.size;
>  	dst->gtt_page_sizes = vma->page_sizes.gtt;
> -	dst->num_pages = num_pages;
> -	dst->page_count = 0;
>  	dst->unused = 0;
>  
>  	ret = -EINVAL;
> @@ -1106,8 +1105,13 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  	}
>  
>  	if (ret || compress_flush(compress, dst)) {
> -		while (dst->page_count--)
> -			pool_free(&compress->pool, dst->pages[dst->page_count]);
> +		struct page *page, *n;
> +
> +		list_for_each_entry_safe_reverse(page, n, &dst->page_list, lru) {
> +			list_del_init(&page->lru);
> +			pool_free(&compress->pool, page_address(page));
> +		}
> +
>  		kfree(dst);
>  		dst = NULL;
>  	}
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
> index b98d8cdbe4f2..5aedf5129814 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
> @@ -39,10 +39,8 @@ struct i915_vma_coredump {
>  	u64 gtt_size;
>  	u32 gtt_page_sizes;
>  
> -	int num_pages;
> -	int page_count;
>  	int unused;
> -	u32 *pages[];
> +	struct list_head page_list;
>  };
>  
>  struct i915_request_coredump {
> -- 
> 2.31.1
> 
