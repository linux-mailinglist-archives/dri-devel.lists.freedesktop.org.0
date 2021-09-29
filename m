Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DE41C32C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 13:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FA66E1A3;
	Wed, 29 Sep 2021 11:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256956E1A3;
 Wed, 29 Sep 2021 11:08:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="205065908"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="205065908"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:08:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="438412729"
Received: from jmaugusx-mobl1.gar.corp.intel.com (HELO [10.249.254.159])
 ([10.249.254.159])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:07:59 -0700
Message-ID: <d2a953e29a559511d9e76d938b36528caee32072.camel@linux.intel.com>
Subject: Re: [PATCH v5 09/13] drm/i915/ttm: add tt shmem backend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Wed, 29 Sep 2021 13:07:56 +0200
In-Reply-To: <20210927114114.152310-9-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <20210927114114.152310-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-09-27 at 12:41 +0100, Matthew Auld wrote:
> For cached objects we can allocate our pages directly in shmem. This
> should make it possible(in a later patch) to utilise the existing
> i915-gem shrinker code for such objects. For now this is still
> disabled.

Some minor comments below, with those either fixed or deemed
unnecessary, 
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




> 
> v2(Thomas):
>   - Add optional try_to_writeback hook for objects. Importantly we
> need
>     to check if the object is even still shrinkable; in between us
>     dropping the shrinker LRU lock and acquiring the object lock it
> could for
>     example have been moved. Also we need to differentiate between
>     "lazy" shrinking and the immediate writeback mode. Also later we
> need to
>     handle objects which don't even have mm.pages, so bundling this
> into
>     put_pages() would require somehow handling that edge case, hence
>     just letting the ttm backend handle everything in
> try_to_writeback
>     doesn't seem too bad.
> v3(Thomas):
>   - Likely a bad idea to touch the object from the unpopulate hook,
>     since it's not possible to hold a reference, without also
> creating
>     circular dependency, so likely this is too fragile. For now just
>     ensure we at least mark the pages as dirty/accessed when called
> from the
>     shrinker on WILLNEED objects.
>   - s/try_to_writeback/shrinker_release_pages, since this can do more
>     than just writeback.
>   - Get rid of do_backup boolean and just set the SWAPPED flag prior
> to
>     calling unpopulate.
>   - Keep shmem_tt as lowest priority for the TTM LRU bo_swapout walk,
> since
>     these just get skipped anyway. We can try to come up with
> something
>     better later.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   8 +
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  14 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  17 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 240
> ++++++++++++++++--
>  5 files changed, 245 insertions(+), 36 deletions(-)
> 
> 

...

> +
> +       err = dma_map_sg_attrs(i915_tt->dev,
> +                              st->sgl, st->nents,
> +                              PCI_DMA_BIDIRECTIONAL,

nit: Since this is a dma api call, should we use DMA_BIDIRECTIONAL
instead of PCI_DMA_BIDIRECTIONAL? DMA_BIDIRECTIONAL is used elsewhere
in this file, but not throughout the driver IIRC.

> +                              DMA_ATTR_SKIP_CPU_SYNC |
> +                              DMA_ATTR_NO_KERNEL_MAPPING |
> +                              DMA_ATTR_NO_WARN);
> +       if (err <= 0) {
> +               err = -EINVAL;
> +               goto err_free_st;
> +       }
> +
> +       i = 0;
> +       for_each_sgt_page(page, sgt_iter, st)
> +               ttm->pages[i++] = page;
> +
> +       if (ttm->page_flags & TTM_TT_FLAG_SWAPPED)
> +               ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
> +
> +       i915_tt->cached_st = st;
> +       return 0;
> +
> +err_free_st:
> +       shmem_free_st(st, filp->f_mapping, false, false);
> +       return err;
> +}
> +
> +static void i915_ttm_tt_shmem_unpopulate(struct ttm_tt *ttm)
> +{
> +       struct i915_ttm_tt *i915_tt = container_of(ttm,
> typeof(*i915_tt), ttm);
> +       bool backup = ttm->page_flags & TTM_TT_FLAG_SWAPPED;
> +
> +       dma_unmap_sg(i915_tt->dev, i915_tt->cached_st->sgl,
> +                    i915_tt->cached_st->nents,
> +                    PCI_DMA_BIDIRECTIONAL);

Same here. 
> +
> +       shmem_free_st(fetch_and_zero(&i915_tt->cached_st),
> +                     file_inode(i915_tt->filp)->i_mapping,
> +                     backup, backup);
> +}
> +
>  static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object
> *bo,
>                                          uint32_t page_flags)
>  {
>         struct ttm_resource_manager *man =
>                 ttm_manager_type(bo->bdev, bo->resource->mem_type);
>         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +       enum ttm_caching caching = i915_ttm_select_tt_caching(obj);
>         struct i915_ttm_tt *i915_tt;
>         int ret;
>  
> @@ -196,36 +279,62 @@ static struct ttm_tt *i915_ttm_tt_create(struct
> ttm_buffer_object *bo,
>             man->use_tt)
>                 page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>  
> -       ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
> -                         i915_ttm_select_tt_caching(obj));
> -       if (ret) {
> -               kfree(i915_tt);
> -               return NULL;
> +       if (i915_gem_object_is_shrinkable(obj) && caching ==
> ttm_cached) {
> +               page_flags |= TTM_TT_FLAG_EXTERNAL |
> +                             TTM_TT_FLAG_EXTERNAL_MAPPABLE;
> +               i915_tt->is_shmem = true;
>         }
>  
> +       ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
> +       if (ret)
> +               goto err_free;
> +
>         i915_tt->dev = obj->base.dev->dev;
>  
>         return &i915_tt->ttm;
> +
> +err_free:
> +       kfree(i915_tt);
> +       return NULL;
> +}
> +
> +static int i915_ttm_tt_populate(struct ttm_device *bdev,
> +                               struct ttm_tt *ttm,
> +                               struct ttm_operation_ctx *ctx)
> +{
> +       struct i915_ttm_tt *i915_tt = container_of(ttm,
> typeof(*i915_tt), ttm);
> +
> +       if (i915_tt->is_shmem)
> +               return i915_ttm_tt_shmem_populate(bdev, ttm, ctx);
> +
> +       return ttm_pool_alloc(&bdev->pool, ttm, ctx);
>  }
>  
>  static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct
> ttm_tt *ttm)
>  {
>         struct i915_ttm_tt *i915_tt = container_of(ttm,
> typeof(*i915_tt), ttm);
>  
> -       if (i915_tt->cached_st) {
> -               dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
> -                                 DMA_BIDIRECTIONAL, 0);
> -               sg_free_table(i915_tt->cached_st);
> -               kfree(i915_tt->cached_st);
> -               i915_tt->cached_st = NULL;
> +       if (i915_tt->is_shmem) {
> +               i915_ttm_tt_shmem_unpopulate(ttm);
> +       } else {
> +               if (i915_tt->cached_st) {
> +                       dma_unmap_sgtable(i915_tt->dev, i915_tt-
> >cached_st,
> +                                         DMA_BIDIRECTIONAL, 0);
> +                       sg_free_table(i915_tt->cached_st);
> +                       kfree(i915_tt->cached_st);
> +                       i915_tt->cached_st = NULL;
> +               }
> +               ttm_pool_free(&bdev->pool, ttm);
>         }
> -       ttm_pool_free(&bdev->pool, ttm);
>  }
>  
>  static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct
> ttm_tt *ttm)
>  {
>         struct i915_ttm_tt *i915_tt = container_of(ttm,
> typeof(*i915_tt), ttm);
>  
> +       if (i915_tt->filp)
> +               fput(i915_tt->filp);
> +
>         ttm_tt_fini(ttm);
>         kfree(i915_tt);
>  }
> @@ -235,6 +344,14 @@ static bool i915_ttm_eviction_valuable(struct
> ttm_buffer_object *bo,
>  {
>         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>  
> +       /*
> +        * EXTERNAL objects should never be swapped out by TTM,
> instead we need
> +        * to handle that ourselves. TTM will already skip such
> objects for us,
> +        * but we would like to avoid grabbing locks for no good
> reason.
> +        */
> +       if (bo->ttm && bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
> +               return -EBUSY;
> +
>         /* Will do for now. Our pinned objects are still on TTM's LRU
> lists */
>         return i915_gem_object_evictable(obj);
>  }
> @@ -328,9 +445,11 @@ static void
> i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
>         i915_gem_object_set_cache_coherency(obj, cache_level);
>  }
>  
> -static void i915_ttm_purge(struct drm_i915_gem_object *obj)
> +static int __i915_ttm_purge(struct drm_i915_gem_object *obj)
>  {
>         struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +       struct i915_ttm_tt *i915_tt =
> +               container_of(bo->ttm, typeof(*i915_tt), ttm);
>         struct ttm_operation_ctx ctx = {
>                 .interruptible = true,
>                 .no_wait_gpu = false,
> @@ -339,17 +458,79 @@ static void i915_ttm_purge(struct
> drm_i915_gem_object *obj)
>         int ret;
>  
>         if (obj->mm.madv == __I915_MADV_PURGED)
> -               return;
> +               return 0;
>  
> -       /* TTM's purge interface. Note that we might be reentering.
> */
>         ret = ttm_bo_validate(bo, &place, &ctx);
> -       if (!ret) {
> -               obj->write_domain = 0;
> -               obj->read_domains = 0;
> -               i915_ttm_adjust_gem_after_move(obj);
> -               i915_ttm_free_cached_io_st(obj);
> -               obj->mm.madv = __I915_MADV_PURGED;
> +       if (ret)
> +               return ret;
> +
> +       if (bo->ttm && i915_tt->filp) {
> +               /*
> +                * The below fput(which eventually calls
> shmem_truncate) might
> +                * be delayed by worker, so when directly called to
> purge the
> +                * pages(like by the shrinker) we should try to be
> more
> +                * aggressive and release the pages immediately.
> +                */
> +               shmem_truncate_range(file_inode(i915_tt->filp),
> +                                    0, (loff_t)-1);
> +               fput(fetch_and_zero(&i915_tt->filp));
> +       }
> +
> +       obj->write_domain = 0;
> +       obj->read_domains = 0;
> +       i915_ttm_adjust_gem_after_move(obj);
> +       i915_ttm_free_cached_io_st(obj);
> +       obj->mm.madv = __I915_MADV_PURGED;
> +       return 0;
> +}
> +
> +static void i915_ttm_purge(struct drm_i915_gem_object *obj)
> +{
> +       __i915_ttm_purge(obj);

Do we need a comment here as to why we choose to ignore the return
value? I typically use a void cast (void)__i915_ttm_purge(obj); to
indicate that ignoring the return value is intentional. Not sure if
that's common practice with i915? 

> +}
> +
> +static int i915_ttm_shrinker_release_pages(struct
> drm_i915_gem_object *obj,
> +                                          bool should_writeback)
> +{
> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +       struct i915_ttm_tt *i915_tt =
> +               container_of(bo->ttm, typeof(*i915_tt), ttm);
> +       struct ttm_operation_ctx ctx = {
> +               .interruptible = true,
> +               .no_wait_gpu = false,
> +       };
> +       struct ttm_placement place = {};
> +       int ret;
> +
> +       if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
> +               return 0;
> +
> +       GEM_BUG_ON(!i915_tt->is_shmem);
> +
> +       if (!i915_tt->filp)
> +               return 0;
> +
> +       switch (obj->mm.madv) {
> +       case I915_MADV_DONTNEED:
> +               return __i915_ttm_purge(obj);
> +       case __I915_MADV_PURGED:
> +               return 0;
> +       }
> +
> +       if (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED)
> +               return 0;
> +
> +       bo->ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
> +       ret = ttm_bo_validate(bo, &place, &ctx);
> +       if (ret) {
> +               bo->ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
> +               return ret;
>         }
> +
> +       if (should_writeback)
> +               __shmem_writeback(obj->base.size, i915_tt->filp-
> >f_mapping);
> +
> +       return 0;
>  }
>  
>  static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
> @@ -618,6 +799,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct
> ttm_buffer_object *bo,
>  
>  static struct ttm_device_funcs i915_ttm_bo_driver = {
>         .ttm_tt_create = i915_ttm_tt_create,
> +       .ttm_tt_populate = i915_ttm_tt_populate,
>         .ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
>         .ttm_tt_destroy = i915_ttm_tt_destroy,
>         .eviction_valuable = i915_ttm_eviction_valuable,
> @@ -685,12 +867,17 @@ static int __i915_ttm_get_pages(struct
> drm_i915_gem_object *obj,
>         }
>  
>         if (!i915_gem_object_has_pages(obj)) {
> +               struct i915_ttm_tt *i915_tt =
> +                       container_of(bo->ttm, typeof(*i915_tt), ttm);
> +
>                 /* Object either has a page vector or is an iomem
> object */
>                 st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj-
> >ttm.cached_io_st;
>                 if (IS_ERR(st))
>                         return PTR_ERR(st);
>  
>                 __i915_gem_object_set_pages(obj, st,
> i915_sg_dma_sizes(st->sgl));
> +               if (!bo->ttm || !i915_tt->is_shmem)
> +                       i915_gem_object_make_unshrinkable(obj);
>         }
>  
>         return ret;
> @@ -770,6 +957,8 @@ static void i915_ttm_put_pages(struct
> drm_i915_gem_object *obj,
>  static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
>  {
>         struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +       struct i915_ttm_tt *i915_tt =
> +               container_of(bo->ttm, typeof(*i915_tt), ttm);
>  
>         /*
>          * Don't manipulate the TTM LRUs while in TTM bo destruction.
> @@ -782,7 +971,10 @@ static void i915_ttm_adjust_lru(struct
> drm_i915_gem_object *obj)
>          * Put on the correct LRU list depending on the MADV status
>          */
>         spin_lock(&bo->bdev->lru_lock);
> -       if (obj->mm.madv != I915_MADV_WILLNEED) {
> +       if (bo->ttm && i915_tt->filp) {
> +               /* Try to keep shmem_tt from being considered for
> shrinking. */
> +               bo->priority = TTM_MAX_BO_PRIORITY - 1;
> +       } else if (obj->mm.madv != I915_MADV_WILLNEED) {
>                 bo->priority = I915_TTM_PRIO_PURGE;
>         } else if (!i915_gem_object_has_pages(obj)) {
>                 if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
> @@ -887,9 +1079,12 @@ static const struct drm_i915_gem_object_ops
> i915_gem_ttm_obj_ops = {
>         .get_pages = i915_ttm_get_pages,
>         .put_pages = i915_ttm_put_pages,
>         .truncate = i915_ttm_purge,
> +       .shrinker_release_pages = i915_ttm_shrinker_release_pages,
> +
>         .adjust_lru = i915_ttm_adjust_lru,
>         .delayed_free = i915_ttm_delayed_free,
>         .migrate = i915_ttm_migrate,
> +
>         .mmap_offset = i915_ttm_mmap_offset,
>         .mmap_ops = &vm_ops_ttm,
>  };
> @@ -937,7 +1132,6 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>         drm_gem_private_object_init(&i915->drm, &obj->base, size);
>         i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class,
> flags);
>         i915_gem_object_init_memory_region(obj, mem);
> -       i915_gem_object_make_unshrinkable(obj);
>         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL |
> __GFP_NOWARN);
>         mutex_init(&obj->ttm.get_io_page.lock);
>         bo_type = (obj->flags & I915_BO_ALLOC_USER) ?
> ttm_bo_type_device :


