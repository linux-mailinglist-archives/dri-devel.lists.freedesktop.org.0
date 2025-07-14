Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D98B0476E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 20:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF08F10E091;
	Mon, 14 Jul 2025 18:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZTEBT6Pb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CE510E091
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 18:33:28 +0000 (UTC)
Date: Mon, 14 Jul 2025 11:33:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752518006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V0w35sJiaFHKvoa98nG7CjPkF9EmUF1Ww6GJaNOJtTs=;
 b=ZTEBT6Pbnvhhx9aSZPRbvf9H5sxgmTRsbc4SufMQVgPBitsj+t8xI61Cd9xB+MYbfamVpr
 Tiaxk4ECpU9Fm+pNlWcQ+tCxH4D0mESOhcrPH+gFJIEWG6AzOC8TWnhxlOFjvpxq7uOsWA
 DrhH6wun759jmhp7wMXW0kU/w6frt8Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>, 
 Dave Airlie <airlied@redhat.com>, Matthew Brost <matthew.brost@intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 02/18] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v3)
Message-ID: <6jilicmybrxnrv3ynpcheh7skij6caly6bqs5mls77tovmiskz@sxhok6ewvilg>
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714052243.1149732-3-airlied@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

On Mon, Jul 14, 2025 at 03:18:17PM +1000, Dave Airlie wrote:
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
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..ee2344089d47 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -150,8 +150,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  	if (!pool->use_dma_alloc) {
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
> -		if (p)
> +		if (p) {
>  			p->private = order;
> +			mod_node_page_state(NODE_DATA(page_to_nid(p)), NR_GPU_ACTIVE, (1 << order));

Please use mod_lruvec_page_state() here.

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
> @@ -201,6 +203,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> +		mod_node_page_state(NODE_DATA(page_to_nid(p)),
> +				    reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
> +				    -(1 << order));

Same here.

>  		__free_pages(p, order);
>  		return;
>  	}
> @@ -276,6 +281,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>  static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  {
>  	unsigned int i, num_pages = 1 << pt->order;
> +	int nid = page_to_nid(p);
>  
>  	for (i = 0; i < num_pages; ++i) {
>  		if (PageHighMem(p))
> @@ -288,17 +294,24 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  	list_add(&p->lru, &pt->pages);
>  	spin_unlock(&pt->lock);
>  	atomic_long_add(1 << pt->order, &allocated_pages);
> +
> +	mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, -num_pages);
> +	mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, num_pages);

Same here.

>  }
>  
>  /* Take pages from a specific pool_type, return NULL when nothing available */
>  static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
>  {
>  	struct page *p;
> +	int nid;
>  
>  	spin_lock(&pt->lock);
>  	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
>  	if (p) {
> +		nid = page_to_nid(p);
>  		atomic_long_sub(1 << pt->order, &allocated_pages);
> +		mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, (1 << pt->order));
> +		mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -(1 << pt->order));

Same here.

