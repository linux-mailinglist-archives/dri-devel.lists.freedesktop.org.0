Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59049C0637F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 14:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E145810EA58;
	Fri, 24 Oct 2025 12:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="R8fGSHTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C94F10EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761308512;
 bh=bmy9Tj/bLBPRfIA4F0G8CfYnpaUPg4TaSrOWBi4bz4M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R8fGSHTHRV/2fYFa8xSQhPdTirNc290VsZBWmaxUCpdqZuZSBKJfDDP24Fr0ID4I0
 iXmwA9W3W+5lv/2/oVUbVNrG+pLk2Kkqn7GVoY3FQqXNMMH4H6tjeyXBgW4DmjZaH/
 E6Mdl+90KflZhAp7Afa0ZP/GG1O/Ek4nLxZjb5gbBZhVXQ4ScWM4SU5/Q3ZE6QbZiW
 JdPhYCKKxQGdzmd0J+7rmY7GddZKkMD7Fa6Izc2mImP6gC+1Ds3qf2pPfDX8r0kJoD
 Gy/UVrFkGvZkW21eEZIjvRsb0b4ZMAMLw7dzRqLPLBrI1RE7bybU1vxmJRC7cfo+lI
 4dcvUx1wDQ+0w==
Message-ID: <a825aed9-c217-4864-807d-9fce40076388@lankhorst.se>
Date: Fri, 24 Oct 2025 14:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/ttm: Use common ancestor of evictor and
 evictee as limit pool
To: Natalie Vock <natalie.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
 <20251015-dmemcg-aggressive-protect-v2-5-36644fb4e37f@gmx.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20251015-dmemcg-aggressive-protect-v2-5-36644fb4e37f@gmx.de>
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

Den 2025-10-15 kl. 15:57, skrev Natalie Vock:
> When checking whether to skip certain buffers because they're protected
> by dmem.low, we're checking the effective protection of the evictee's
> cgroup, but depending on how the evictor's cgroup relates to the
> evictee's, the semantics of effective protection values change.
> 
> When testing against cgroups from different subtrees, page_counter's
> recursive protection propagates memory protection afforded to a parent
> down to the child cgroups, even if the children were not explicitly
> protected. This prevents cgroups whose parents were afforded no
> protection from stealing memory from cgroups whose parents were afforded
> more protection, without users having to explicitly propagate this
> protection.
> 
> However, if we always calculate protection from the root cgroup, this
> breaks prioritization of sibling cgroups: If one cgroup was explicitly
> protected and its siblings were not, the protected cgroup should get
> higher priority, i.e. the protected cgroup should be able to steal from
> unprotected siblings. This only works if we restrict the protection
> calculation to the subtree shared by evictor and evictee.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7f7872ab2090cc8db188e08ddfdcd12fe924f743..bc88941c0aadb9a1d6fbaa470ccdeae4f91c41fb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -524,13 +524,29 @@ struct ttm_bo_evict_walk {
>  
>  static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  {
> +	struct dmem_cgroup_pool_state *limit_pool;
>  	struct ttm_bo_evict_walk *evict_walk =
>  		container_of(walk, typeof(*evict_walk), walk);
>  	s64 lret;
>  
> -	if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state->limit_pool,
> -					      bo->resource->css, evict_walk->try_low,
> -					      &evict_walk->hit_low))
> +	/*
> +	 * If only_evict_unprotected is set, then we're trying to evict unprotected
> +	 * buffers in favor of a protected allocation for charge_pool. Explicitly skip
> +	 * buffers belonging to the same cgroup here - that cgroup is definitely protected,
> +	 * even though dmem_cgroup_state_evict_valuable would allow the eviction because a
> +	 * cgroup is always allowed to evict from itself even if it is protected.
> +	 */
> +	if (evict_walk->alloc_state->only_evict_unprotected &&
> +			bo->resource->css == evict_walk->alloc_state->charge_pool)
> +		return 0;
> +
> +	limit_pool = evict_walk->alloc_state->limit_pool;
> +	if (!limit_pool)
> +		limit_pool = dmem_cgroup_common_ancestor(bo->resource->css,
> +							 evict_walk->alloc_state->charge_pool);
> +
> +	if (!dmem_cgroup_state_evict_valuable(limit_pool, bo->resource->css,
> +					      evict_walk->try_low, &evict_walk->hit_low))
>  		return 0;
>  
>  	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
> 
Patches themselves look good, I think it would help to add a bit more documentation since
cgroup related dmem eviction is already complicated, and while I believe those changes are
correct, it will help others to understand the code in case bugs show up.

Perhaps even add a global overview of how dmem eviction interacts with TTM eviction.

This will need review from the TTM maintainers/reviewers too before being accepted.

With the extra documentation added:
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
