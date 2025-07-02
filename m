Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E013EAF5E17
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC3310E735;
	Wed,  2 Jul 2025 16:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Fn9j41WG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 328 seconds by postgrey-1.36 at gabe;
 Wed, 02 Jul 2025 16:08:31 UTC
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8001C10E735
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:08:31 +0000 (UTC)
Date: Wed, 2 Jul 2025 09:08:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751472509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DA9or3GnPWkEvPbsGm5zpjvC/QtJWGUlbNCVxhB/hgs=;
 b=Fn9j41WGIBtS0B2AR1FkyUdgi9wB+rAiywwC4QP/aiO37R/IPaGNa1hVDiCf8VNbGbNfJF
 s1LqDJHCrp7YVBJktjSrVa6y9JjiP5/rzUbcYgnoMOm3VDrRKjuIfSZpZPYcbuNAhDl1TN
 K7Pz1c/ryKYG4fwDpugJW4KoLi5YPt0=
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
Subject: Re: [PATCH 02/17] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v2)
Message-ID: <njhqhxhqyng4uunbod7stgxmlu3c4ovjfbejnervmjt3djxxyj@zimlpdxyuae5>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-3-airlied@gmail.com>
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

On Mon, Jun 30, 2025 at 02:49:21PM +1000, Dave Airlie wrote:
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
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..11a5777b4a85 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -131,6 +131,16 @@ static struct list_head shrinker_list;
>  static struct shrinker *mm_shrinker;
>  static DECLARE_RWSEM(pool_shrink_rwsem);
>  
> +/* helper to get a current valid node id from a pool */
> +static int ttm_pool_nid(struct ttm_pool *pool) {
> +	int nid = NUMA_NO_NODE;
> +	if (pool)
> +		nid = pool->nid;
> +	if (nid == NUMA_NO_NODE)
> +		nid = numa_node_id();
> +	return nid;
> +}
> +
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  					unsigned int order)
> @@ -150,8 +160,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  	if (!pool->use_dma_alloc) {
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
> -		if (p)
> +		if (p) {
>  			p->private = order;
> +			mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)), NR_GPU_ACTIVE, (1 << order));

Use mod_lruvec_page_state(), it will handle both cases of charged and
uncharged pages.

