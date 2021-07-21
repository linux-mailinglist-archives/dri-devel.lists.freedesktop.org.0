Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BEF3D141A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A77B6E83A;
	Wed, 21 Jul 2021 16:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E246E419;
 Wed, 21 Jul 2021 16:25:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="272583929"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="272583929"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:25:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="495414860"
Received: from darraghf-mobl.ger.corp.intel.com (HELO [10.213.232.142])
 ([10.213.232.142])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:25:44 -0700
Subject: Re: [PATCH 6/6] drm/i915: Make the kmem slab for i915_buddy_block a
 global
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210721152358.2893314-1-jason@jlekstrand.net>
 <20210721152358.2893314-7-jason@jlekstrand.net>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <23df1788-bd8e-ac44-337d-92bb5f345b8f@intel.com>
Date: Wed, 21 Jul 2021 17:25:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210721152358.2893314-7-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/07/2021 16:23, Jason Ekstrand wrote:
> There's no reason that I can tell why this should be per-i915_buddy_mm
> and doing so causes KMEM_CACHE to throw dmesg warnings because it tries
> to create a debugfs entry with the name i915_buddy_block multiple times.
> We could handle this by carefully giving each slab its own name but that
> brings its own pain because then we have to store that string somewhere
> and manage the lifetimes of the different slabs.  The most likely
> outcome would be a global atomic which we increment to get a new name or
> something like that.
> 
> The much easier solution is to use the i915_globals system like we do
> for every other slab in i915.  This ensures that we have exactly one of
> them for each i915 driver load and it gets neatly created on module load
> and destroyed on module unload.  Using the globals system also means
> that its now tied into the shrink handler so we can properly respond to
> low-memory situations.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 88be9a0a06b7 ("drm/i915/ttm: add ttm_buddy_man")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>

It was intentionally ripped it out with the idea that we would be moving 
the buddy stuff into ttm, and so part of that was trying to get rid of 
the some of the i915 specifics, like this globals thing.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/i915_buddy.c   | 44 ++++++++++++++++++++++-------
>   drivers/gpu/drm/i915/i915_buddy.h   |  3 +-
>   drivers/gpu/drm/i915/i915_globals.c |  2 ++
>   3 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
> index 29dd7d0310c1f..911feedad4513 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.c
> +++ b/drivers/gpu/drm/i915/i915_buddy.c
> @@ -8,8 +8,14 @@
>   #include "i915_buddy.h"
>   
>   #include "i915_gem.h"
> +#include "i915_globals.h"
>   #include "i915_utils.h"
>   
> +static struct i915_global_buddy {
> +	struct i915_global base;
> +	struct kmem_cache *slab_blocks;
> +} global;
> +
>   static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>   						 struct i915_buddy_block *parent,
>   						 unsigned int order,
> @@ -19,7 +25,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>   
>   	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
>   
> -	block = kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
> +	block = kmem_cache_zalloc(global.slab_blocks, GFP_KERNEL);
>   	if (!block)
>   		return NULL;
>   
> @@ -34,7 +40,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>   static void i915_block_free(struct i915_buddy_mm *mm,
>   			    struct i915_buddy_block *block)
>   {
> -	kmem_cache_free(mm->slab_blocks, block);
> +	kmem_cache_free(global.slab_blocks, block);
>   }
>   
>   static void mark_allocated(struct i915_buddy_block *block)
> @@ -85,15 +91,11 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>   
>   	GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
>   
> -	mm->slab_blocks = KMEM_CACHE(i915_buddy_block, SLAB_HWCACHE_ALIGN);
> -	if (!mm->slab_blocks)
> -		return -ENOMEM;
> -
>   	mm->free_list = kmalloc_array(mm->max_order + 1,
>   				      sizeof(struct list_head),
>   				      GFP_KERNEL);
>   	if (!mm->free_list)
> -		goto out_destroy_slab;
> +		return -ENOMEM;
>   
>   	for (i = 0; i <= mm->max_order; ++i)
>   		INIT_LIST_HEAD(&mm->free_list[i]);
> @@ -145,8 +147,6 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>   	kfree(mm->roots);
>   out_free_list:
>   	kfree(mm->free_list);
> -out_destroy_slab:
> -	kmem_cache_destroy(mm->slab_blocks);
>   	return -ENOMEM;
>   }
>   
> @@ -161,7 +161,6 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
>   
>   	kfree(mm->roots);
>   	kfree(mm->free_list);
> -	kmem_cache_destroy(mm->slab_blocks);
>   }
>   
>   static int split_block(struct i915_buddy_mm *mm,
> @@ -410,3 +409,28 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/i915_buddy.c"
>   #endif
> +
> +static void i915_global_buddy_shrink(void)
> +{
> +	kmem_cache_shrink(global.slab_blocks);
> +}
> +
> +static void i915_global_buddy_exit(void)
> +{
> +	kmem_cache_destroy(global.slab_blocks);
> +}
> +
> +static struct i915_global_buddy global = { {
> +	.shrink = i915_global_buddy_shrink,
> +	.exit = i915_global_buddy_exit,
> +} };
> +
> +int __init i915_global_buddy_init(void)
> +{
> +	global.slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
> +	if (!global.slab_blocks)
> +		return -ENOMEM;
> +
> +	i915_global_register(&global.base);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
> index 37f8c42071d12..d8f26706de52f 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.h
> +++ b/drivers/gpu/drm/i915/i915_buddy.h
> @@ -47,7 +47,6 @@ struct i915_buddy_block {
>    * i915_buddy_alloc* and i915_buddy_free* should suffice.
>    */
>   struct i915_buddy_mm {
> -	struct kmem_cache *slab_blocks;
>   	/* Maintain a free list for each order. */
>   	struct list_head *free_list;
>   
> @@ -130,4 +129,6 @@ void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
>   
>   void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
>   
> +int i915_global_buddy_init(void);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index 87267e1d2ad92..e57102a4c8d16 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -8,6 +8,7 @@
>   #include <linux/workqueue.h>
>   
>   #include "i915_active.h"
> +#include "i915_buddy.h"
>   #include "gem/i915_gem_context.h"
>   #include "gem/i915_gem_object.h"
>   #include "i915_globals.h"
> @@ -87,6 +88,7 @@ static void __i915_globals_cleanup(void)
>   
>   static __initconst int (* const initfn[])(void) = {
>   	i915_global_active_init,
> +	i915_global_buddy_init,
>   	i915_global_context_init,
>   	i915_global_gem_context_init,
>   	i915_global_objects_init,
> 
