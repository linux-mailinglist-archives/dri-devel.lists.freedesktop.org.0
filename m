Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB3962D46
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E029710E54D;
	Wed, 28 Aug 2024 16:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OszIWggN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2707610E552
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:06:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-371a9bea8d4so3813495f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724861210; x=1725466010; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DSYIsNDUoqSXxWxCcKFT0NLFz1vWrDLyksnv49ELocI=;
 b=OszIWggNrhWJGkRL42Wh7xXFKN73qWDMfeZKPTNM4Vud60LB88upJE/5bxJuP4SfJi
 Duckwplqp/SwI2SunjS2UQwJ5qk+OUVVaTu5dH1hiyLKAQaW8QVs2XK82ksopXM+ZPNB
 kYs0JNkHnZ0rEpLMWRaO6acQEEZnV7RwjCvU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861210; x=1725466010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSYIsNDUoqSXxWxCcKFT0NLFz1vWrDLyksnv49ELocI=;
 b=qdvJ+HfToVxNEP8Sy+Xi3JK5B6IMeGbNBA9dSUwdC01g4O9VxpMTgrTX4QDu8NRSSy
 xgnv/gj6b/U2fb1WR5eKQZHn+jeA/6Q0Q6ycKqHdjA+vZNqgUsNN69D5FVWug9fJ6Ehv
 H9H/LTeoOJdAx2N5JhaS0QdAiydUzuSAVPJeGIrzaka84HYz4C1Y6xpkEHciopeBb8f1
 Ncjn0p2VkMFUElptA5cIdkGJ+F2iJz4F7KviCMlrpuHvJqliQP0/ilf0Z+lqN3K2+nZM
 fWFHIQ4D63aEI70tNwaIGJx/8bFJ8pjLIwE/20BBxji6EcLrIfQihAF1kct+xwhpC6bO
 hlog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsJ5fNTIPaRRhrqyStHE2DsPccWQ2ye0OV+UNgc2eq6hE1kSy6qTg+Pp9UoAXAqGB0ke0840rsZtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9mpdmkIMGYuSfcVq8n4cUmFOW+dSu381xOXFtpv75/QfLG+KB
 0yQ0mrss10J8sUzx9ZwhH/5UcfvulaA4d4K8yDkMljqBRUL1Cd44OTXiWkRVzuY=
X-Google-Smtp-Source: AGHT+IF+p7bhC+ZcfNN0SBOQuQMwiX0MgmxVkGlEFj3sFAo9l9AEc4vNVAA4aGZbDPeQefko9xtp+g==
X-Received: by 2002:a5d:4852:0:b0:367:94a7:12c8 with SMTP id
 ffacd0b85a97d-3749b52e436mr54556f8f.6.1724861210161; 
 Wed, 28 Aug 2024 09:06:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b238ed7sm153542f8f.32.2024.08.28.09.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:06:49 -0700 (PDT)
Date: Wed, 28 Aug 2024 18:06:47 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828024901.2582335-24-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Aug 27, 2024 at 07:48:56PM -0700, Matthew Brost wrote:
> Migration is implemented with range granularity, with VRAM backing being
> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> SVM range is migrated to SRAM, the TTM BO is destroyed).
> 
> The design choice for using TTM BO for VRAM backing store, as opposed to
> direct buddy allocation, is as follows:
> 
> - DRM buddy allocations are not at page granularity, offering no
>   advantage over a BO.

This one I'm not understanding.

> - DRM buddy allocations do not solve locking inversion problems between
>   mmap lock and dma-resv locks.

Which mmap -> dma_resv inversion? I've seen a lot ... I guess it also
matters hugely which migration path we're in, i.e. opportunistic
migration, cpu fault where we have to migrate or die, or when we run out
of vram and need to evict stuff to make space.

> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>   evict each other).

So core mm handles this by just roughly equally shrinking everything.
Seems to work, and it has a pile of object shrinkers, and the page lru is
also split into page cache and anon memory.

I think you need to put in more justification that unified eviction is
required than just stating it, because a look at mm/ gives a very well
established counterexample.

> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>   require a dma-resv.

So from the TTM side we need exhaustive eviction, or at least something a
bit more exhaustive than what ttm currently has. Note that i915-gem also
never really got to perfect exhaustive eviction, it's just a pile better
than ttm right now.

Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
eviction is going to win because the shrinkers can only trylock dma_resv.
So this part works. It actually works so well on the system memory side
that if we're not careful we can trigger oom, because we're too good at
getting at all the memory.

SVM VRAM allocations otoh do not need exhaustive evictions. Or at least I
don't see why, because the idea is that thanks to gpu and cpu page faults,
you can always get out of a pinch by just trashing everything for a while
and migrating the handfull of available pages a lot.

> - Likely allocation size is 2M which makes of size of BO (872)
>   acceptable per allocation (872 / 2M == .0004158).
> 
> With this, using TTM BO for VRAM backing store seems to be an obvious
> choice as it allows leveraging of the TTM eviction code.

Except it requires that you hold dma_resv, which brings in all kinds of
pain. And for eviction we really don't need a lot of synchronization, so a
lot of that locking is not needed, unlike the case where we have a cpu
fault, where we absolutely need mmap_lock and all that to make sure we
fault in the right page.

But for eviction we only need to throw out some pages, if we're not
entirely precise with picking the right ones (or have no idea into which
vma they're all currently mapped into) it doesn't matter. That's why
migrate_device_pages doesn't care about any of that at all, it doesn't
need to by design. But by bo backing memory you drag in all that stuff
that's causing headacheds for eviction.

The only thing migration tries to do is remove all pte, and if that
succeeds, move the page. Specialized for the gpusvm case, looking at mm/
code as cheat sheet, we need roughly:

- reverse mapping structure like anon_vma. Except gpusvm can assume that
  there's currently only one gpu side mapping, so we can just stuff the
  gpusvm an va_address into the page, and protect it with the page lock.

- we need pagetable locks, so that we can manipulate pagetables (well
  specifically make ptes invalid) without taking any other locks.

- everyone else inserting or removing ptes for svm mappings also needs to
  lock the page, or we have races. This might be the hmm_range_fault races
  you're seeing when allowing vram pages, since I don't think there's
  anything else stopping the page lookup otherwise from succeeding.

- we might also need to stuff migrate ptes into the gpu side, like the cpu
  does, to hold up refaults before the migration has finished. But I think
  those are only needed for anon memory in sram because there's no other
  way to find the right page than swap pte entries, of which migration
  entries are a special case.

- core code also expects us to handle the page refcount correctly for svm
  device memory, so we can't free the pages like normal bo pages either
  directly to drm_buddy.

Now typing this all up will look an awful lot like what you have, with the
dma_resv lock serving as the page lock and the pagetable lock. The only
reason is that these locks are much smaller and nest within all the other
stuff going on and so avoid the inversion issues.

So one annoying part is that this is a lot of pointlessly looking typing.
The other is that it's full of races, because core mm really is yolo all
the way down. So lots of ways you lock the wrong page and fun stuff like
that, but the few cases that matter work:

- svm fault handling with hmm_range fault retries with mmu notifiers. Note
  that we need to have vram pages locked and the notifier retrie needs to
  be under the pagetable lock, or there's room to escape. At least that's
  what I came up with last time I thought it all through.

- migrate_to_ram: it will hold a page reference which we know was the
  valid vram page when the cpu pte was locked, but it might not be it
  anymore. So we have to lock the page and check whether it's still gpu
  mapped, and if not retry the entire fault since most likey another
  migrate_to_ram has succeed meanwhile in parallel.

- for eviction we don't care, we might actually be migrating a page no one
  even wants anymore.

Now I think you can get all this done with the dma_resv lock and maybe the
bo refcount. But it does involve a tremendous amount of headaches and
impendence mismatch, because that's not how page faults and migrations
work in core mm.

Cheers, Sima

> Current migration policy is migrate any SVM range greater than or equal
> to 64k once.
> 
> [1] https://patchwork.freedesktop.org/series/133643/
> 
> Signed-off-by: Matthew Brost matthew.brost@intel.com
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 81 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h |  1 +
>  2 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 4372c02a341f..fd8987e0a506 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  				      struct xe_svm_range *range)
>  {
> +	struct drm_gpusvm_ctx ctx = {};
>  	struct dma_fence *fence;
>  
> +	/* Evict any pages holding references to vram allocation */
> +	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
> +		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm, &range->base, &ctx);
> +
>  	xe_vm_lock(vm, false);
>  	fence = xe_vm_range_unbind(vm, range);
>  	xe_vm_unlock(vm);
> @@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>  }
>  
> +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +				       struct xe_svm_range *range,
> +				       const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct xe_mem_region *mr = tile_to_mr(tile);
> +	struct drm_buddy_block *block;
> +	struct list_head *blocks;
> +	struct xe_bo *bo;
> +	ktime_t end = 0;
> +	int err;
> +
> +retry:
> +	xe_vm_lock(vm, false);
> +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.va.end -
> +			  range->base.va.start, ttm_bo_type_device,
> +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
> +		return bo;
> +	}
> +
> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private = mr;
> +
> +	/*
> +	 * Take ref because as soon as drm_gpusvm_migrate_to_vram succeeds the
> +	 * creation ref can be dropped upon CPU fault or unmap.
> +	 */
> +	xe_bo_get(bo);
> +
> +	err = drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm, &range->base,
> +					 bo, ctx);
> +	if (err) {
> +		xe_bo_put(bo);	/* Local ref */
> +		xe_bo_put(bo);	/* Creation ref */
> +		return ERR_PTR(err);
> +	}
> +
> +	return bo;
> +}
> +
>  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_tile *tile, u64 fault_addr,
>  			    bool atomic)
>  {
> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> +	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma),
> +		.vram_possible = IS_DGFX(vm->xe), };
>  	struct xe_svm_range *range;
>  	struct drm_gpusvm_range *r;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> +	struct xe_bo *bo = NULL;
>  	ktime_t end = 0;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
>  retry:
> +	xe_bo_put(bo);
> +	bo = NULL;
> +
>  	/* Always process UNMAPs first so view SVM ranges is current */
>  	err = xe_svm_garbage_collector(vm);
>  	if (err)
> @@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (xe_svm_range_is_valid(range, tile))
>  		return 0;
>  
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (IS_DGFX(vm->xe) && !range->migrated &&
> +	    range->base.flags.migrate_vram &&
> +	    (range->base.va.end - range->base.va.start) >= SZ_64K) {
> +		range->migrated = true;
> +
> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (IS_ERR(bo)) {
> +			drm_info(&vm->xe->drm,
> +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %ld\n",
> +				 vm->usm.asid, PTR_ERR(bo));
> +			bo = NULL;
> +			goto retry;
> +		}
> +	}
> +
>  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>  	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
>  	       goto retry;
> @@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	dma_fence_put(fence);
>  
>  err_out:
> +	xe_bo_put(bo);
> +
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 8b72e91cc37d..3f432483a230 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -18,6 +18,7 @@ struct xe_svm_range {
>  	struct list_head garbage_collector_link;
>  	u8 tile_present;
>  	u8 tile_invalidated;
> +	u8 migrated	:1;
>  };
>  
>  int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
