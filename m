Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BDB41CC7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B4710E143;
	Wed,  3 Sep 2025 11:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991EC10E143
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:10:34 +0000 (UTC)
Message-ID: <28c94812-0bfb-45ec-bb44-c3dc6e85e5f3@lankhorst.se>
Date: Wed, 3 Sep 2025 13:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v4)
To: dri-devel@lists.freedesktop.org
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-3-airlied@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250902041024.2040450-3-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2025-09-02 kl. 06:06, skrev Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
> 
> This uses the newly introduced per-node gpu tracking stats,
> to track GPU memory allocated via TTM and reclaimable memory in
> the TTM page pools.
> 
> These stats will be useful later for system information and
> later when mem cgroups are integrated.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> v2: add reclaim parameters and adjust the right counters.
> v3: drop the nid helper and get it from page.
> v4: use mod_lruvec_page_state (Shakeel)
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..148c7530738d 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -150,8 +150,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  	if (!pool->use_dma_alloc) {
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
> -		if (p)
> +		if (p) {
>  			p->private = order;
> +			mod_lruvec_page_state(p, NR_GPU_ACTIVE, 1 << order);
> +		}
>  		return p;
>  	}
>  
> @@ -186,7 +188,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  /* Reset the caching and pages of size 1 << order */
>  static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
> -			       unsigned int order, struct page *p)
> +			       unsigned int order, struct page *p, bool reclaim)
>  {
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>  	struct ttm_pool_dma *dma;
> @@ -201,6 +203,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> +		mod_lruvec_page_state(p, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
> +				      -(1 << order));
>  		__free_pages(p, order);
>  		return;
>  	}
> @@ -288,6 +292,9 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  	list_add(&p->lru, &pt->pages);
>  	spin_unlock(&pt->lock);
>  	atomic_long_add(1 << pt->order, &allocated_pages);
> +
> +	mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
> +	mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
>  }
>  
>  /* Take pages from a specific pool_type, return NULL when nothing available */
> @@ -299,6 +306,8 @@ static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
>  	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
>  	if (p) {
>  		atomic_long_sub(1 << pt->order, &allocated_pages);
> +		mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
> +		mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));
>  		list_del(&p->lru);
>  	}
>  	spin_unlock(&pt->lock);
> @@ -331,7 +340,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>  	spin_unlock(&shrinker_lock);
>  
>  	while ((p = ttm_pool_type_take(pt)))
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
>  }
>  
>  /* Return the pool_type to use for the given caching and order */
> @@ -383,7 +392,7 @@ static unsigned int ttm_pool_shrink(void)
>  
>  	p = ttm_pool_type_take(pt);
>  	if (p) {
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
>  		num_pages = 1 << pt->order;
>  	} else {
>  		num_pages = 0;
> @@ -475,7 +484,7 @@ static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool, struct page *page,
>  	if (pt)
>  		ttm_pool_type_give(pt, page);
>  	else
> -		ttm_pool_free_page(pool, caching, order, page);
> +		ttm_pool_free_page(pool, caching, order, page, false);
>  
>  	return nr;
>  }
> @@ -780,7 +789,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	return 0;
>  
>  error_free_page:
> -	ttm_pool_free_page(pool, page_caching, order, p);
> +	ttm_pool_free_page(pool, page_caching, order, p, false);
>  
>  error_free_all:
>  	if (tt->restore)

Looking at the patch, there are 2 users of ttm_pool_free_page, one frees an active page (various error paths), the other during page reclaim at pool teardown and shrinking.

So perhaps split into ttm_pool_free_active_page() and ttm_pool_reclaim_page()?

Kind regards,
~Maarten Lankhorst
