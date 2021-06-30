Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD03B863E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70E789DE3;
	Wed, 30 Jun 2021 15:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD4B89D84;
 Wed, 30 Jun 2021 15:27:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="195658714"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="195658714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 08:27:23 -0700
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="641745740"
Received: from vanderss-mobl.ger.corp.intel.com (HELO [10.249.254.133])
 ([10.249.254.133])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 08:27:21 -0700
Message-ID: <7593b3ba63007323679472f5120f7d72a96f71c1.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/ttm: Reorganize the ttm move code somewhat
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 30 Jun 2021 17:27:19 +0200
In-Reply-To: <CAM0jSHMbhYs5u7eV-Adjo1d=qB69WNuh-Z1gY-wfH31_=F7czg@mail.gmail.com>
References: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
 <20210624193045.5087-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMbhYs5u7eV-Adjo1d=qB69WNuh-Z1gY-wfH31_=F7czg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-06-30 at 15:19 +0100, Matthew Auld wrote:
> On Thu, 24 Jun 2021 at 20:31, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > In order to make the code a bit more readable and to facilitate
> > async memcpy moves, reorganize the move code a little. Determine
> > at an early stage whether to copy or to clear.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 70 ++++++++++++++-------
> > ----
> >  1 file changed, 40 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index c39d982c4fa6..4e529adcdfc7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -431,6 +431,7 @@ i915_ttm_resource_get_st(struct
> > drm_i915_gem_object *obj,
> >  }
> > 
> >  static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
> > +                              bool clear,
> >                                struct ttm_resource *dst_mem,
> >                                struct sg_table *dst_st)
> >  {
> > @@ -449,13 +450,10 @@ static int i915_ttm_accel_move(struct
> > ttm_buffer_object *bo,
> >                 return -EINVAL;
> > 
> >         dst_level = i915_ttm_cache_level(i915, dst_mem, ttm);
> > -       if (!ttm || !ttm_tt_is_populated(ttm)) {
> > +       if (clear) {
> >                 if (bo->type == ttm_bo_type_kernel)
> >                         return -EINVAL;
> 
> Was that meant to be:
> return 0:
> 
> ?
> 
> Also does that mean we are incorrectly falling back to memset, for
> non-userspace objects, instead of making it a noop?

No, we're deliberately falling back to memset for non-userspace
objects, but the logic only memsets in the BO_ALLOC_CPU_CLEAR case if
everything is implemented correctly.

> 
> > 
> > -               if (ttm && !(ttm->page_flags &
> > TTM_PAGE_FLAG_ZERO_ALLOC))
> > -                       return 0;
> > -
> >                 intel_engine_pm_get(i915->gt.migrate.context-
> > >engine);
> >                 ret = intel_context_migrate_clear(i915-
> > >gt.migrate.context, NULL,
> >                                                   dst_st->sgl,
> > dst_level,
> > @@ -489,27 +487,53 @@ static int i915_ttm_accel_move(struct
> > ttm_buffer_object *bo,
> >         return ret;
> >  }
> > 
> > -static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> > -                        struct ttm_operation_ctx *ctx,
> > -                        struct ttm_resource *dst_mem,
> > -                        struct ttm_place *hop)
> > +static void __i915_ttm_move(struct ttm_buffer_object *bo, bool
> > clear,
> > +                           struct ttm_resource *dst_mem,
> > +                           struct sg_table *dst_st)
> >  {
> >         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> > -       struct ttm_resource_manager *dst_man =
> > -               ttm_manager_type(bo->bdev, dst_mem->mem_type);
> >         struct intel_memory_region *dst_reg, *src_reg;
> >         union {
> >                 struct ttm_kmap_iter_tt tt;
> >                 struct ttm_kmap_iter_iomap io;
> >         } _dst_iter, _src_iter;
> >         struct ttm_kmap_iter *dst_iter, *src_iter;
> > -       struct sg_table *dst_st;
> >         int ret;
> > 
> >         dst_reg = i915_ttm_region(bo->bdev, dst_mem->mem_type);
> >         src_reg = i915_ttm_region(bo->bdev, bo->resource-
> > >mem_type);
> >         GEM_BUG_ON(!dst_reg || !src_reg);
> > 
> > +       ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_st);
> > +       if (ret) {
> 
> One future consideration is flat CCS where I don't think we can
> easily
> fall back to memcpy for userspace objects. Maybe we can make this
> fallback conditional on DG1 or !ALLOC_USER for now, or just add a
> TODO?

Ugh. Is that true for both clearing and copying, or is it only copying?

Problem is if we hit an engine reset and fence error during initial
clearing / swapin, the plan moving forward is to intercept that and
resort to cpu clearing / copying for security reasons. In the worst
case we at least need to be able to clear.

/Thomas


> 
> > +               dst_iter = !cpu_maps_iomem(dst_mem) ?
> > +                       ttm_kmap_iter_tt_init(&_dst_iter.tt, bo-
> > >ttm) :
> > +                       ttm_kmap_iter_iomap_init(&_dst_iter.io,
> > &dst_reg->iomap,
> > +                                                dst_st, dst_reg-
> > >region.start);
> > +
> > +               src_iter = !cpu_maps_iomem(bo->resource) ?
> > +                       ttm_kmap_iter_tt_init(&_src_iter.tt, bo-
> > >ttm) :
> > +                       ttm_kmap_iter_iomap_init(&_src_iter.io,
> > &src_reg->iomap,
> > +                                                obj-
> > >ttm.cached_io_st,
> > +                                                src_reg-
> > >region.start);
> > +
> > +               ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter,
> > src_iter);
> > +       }
> > +}
> > +
> > +static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> > +                        struct ttm_operation_ctx *ctx,
> > +                        struct ttm_resource *dst_mem,
> > +                        struct ttm_place *hop)
> > +{
> > +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> > +       struct ttm_resource_manager *dst_man =
> > +               ttm_manager_type(bo->bdev, dst_mem->mem_type);
> > +       struct ttm_tt *ttm = bo->ttm;
> > +       struct sg_table *dst_st;
> > +       bool clear;
> > +       int ret;
> > +
> >         /* Sync for now. We could do the actual copy async. */
> >         ret = ttm_bo_wait_ctx(bo, ctx);
> >         if (ret)
> > @@ -526,9 +550,8 @@ static int i915_ttm_move(struct
> > ttm_buffer_object *bo, bool evict,
> >         }
> > 
> >         /* Populate ttm with pages if needed. Typically system
> > memory. */
> > -       if (bo->ttm && (dst_man->use_tt ||
> > -                       (bo->ttm->page_flags &
> > TTM_PAGE_FLAG_SWAPPED))) {
> > -               ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> > +       if (ttm && (dst_man->use_tt || (ttm->page_flags &
> > TTM_PAGE_FLAG_SWAPPED))) {
> > +               ret = ttm_tt_populate(bo->bdev, ttm, ctx);
> >                 if (ret)
> >                         return ret;
> >         }
> > @@ -537,23 +560,10 @@ static int i915_ttm_move(struct
> > ttm_buffer_object *bo, bool evict,
> >         if (IS_ERR(dst_st))
> >                 return PTR_ERR(dst_st);
> > 
> > -       ret = i915_ttm_accel_move(bo, dst_mem, dst_st);
> > -       if (ret) {
> > -               /* If we start mapping GGTT, we can no longer use
> > man::use_tt here. */
> > -               dst_iter = !cpu_maps_iomem(dst_mem) ?
> > -                       ttm_kmap_iter_tt_init(&_dst_iter.tt, bo-
> > >ttm) :
> > -                       ttm_kmap_iter_iomap_init(&_dst_iter.io,
> > &dst_reg->iomap,
> > -                                                dst_st, dst_reg-
> > >region.start);
> > -
> > -               src_iter = !cpu_maps_iomem(bo->resource) ?
> > -                       ttm_kmap_iter_tt_init(&_src_iter.tt, bo-
> > >ttm) :
> > -                       ttm_kmap_iter_iomap_init(&_src_iter.io,
> > &src_reg->iomap,
> > -                                                obj-
> > >ttm.cached_io_st,
> > -                                                src_reg-
> > >region.start);
> > +       clear = !cpu_maps_iomem(bo->resource) && (!ttm ||
> > !ttm_tt_is_populated(ttm));
> > +       if (!(clear && ttm && !(ttm->page_flags &
> > TTM_PAGE_FLAG_ZERO_ALLOC)))
> 
> Seems quite hard to read?
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> 
> > +               __i915_ttm_move(bo, clear, dst_mem, dst_st);
> > 
> > -               ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter,
> > src_iter);
> > -       }
> > -       /* Below dst_mem becomes bo->resource. */
> >         ttm_bo_move_sync_cleanup(bo, dst_mem);
> >         i915_ttm_adjust_domains_after_move(obj);
> >         i915_ttm_free_cached_io_st(obj);
> > --
> > 2.31.1
> > 


