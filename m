Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EA3B8749
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 18:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04026EA52;
	Wed, 30 Jun 2021 16:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AA46EA51;
 Wed, 30 Jun 2021 16:54:46 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id b2so3111987qka.7;
 Wed, 30 Jun 2021 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nv/sfFdXK4pjU9qCxCDHMjLejOMZRWYWsYHchTSu3x8=;
 b=pxkUnlR9ilrQhUXsYfhC5Jnpnx1sxIz1rzNZ58ERVmC1uxckL1me/2n4meOmwH40Sq
 cZn/G76Nz2cMsvL7WW14Do0UoO6Y2K9iXDQn8RpvYQCUU3yLjovEISdYVQbUSluqwZDE
 Dg595mq/QpCu79gD/pei/z5mcmIlSXNY3QVDaFc4mel9e1dua00GRPys3uY7x9ivoLxD
 bsGVCMj2uYABhY8z/TFadn26jl/3notgPBqHYO/12Cz1pU+tTpykZPDsfBEvFHl3xcij
 NnNGCuqaH1UlWRY7cyGxcCBUY93rhhgcoOxYK2m62FxDuNfFCN45vXNOK8NID5cypbMl
 xLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nv/sfFdXK4pjU9qCxCDHMjLejOMZRWYWsYHchTSu3x8=;
 b=AUbObT3eoOZI7INb8Cn50m+p2T4gJwofA0zN0K8XvZglX3FcQpQxz8Jc5SpDFfXDMc
 NX9ND3knlHxkB0xkedwHqGmsmVqAknGYKkRq8wU8XvvvaT37Z+wuYSatYr+9R7qQIAHU
 immQ6/TSDhoL0jhf1tv8xp7/r71MmBSEJtn5MegGRaBkDCGaK5VdBwxDoU+aokIYnVcL
 iHus9iNdTfOzkm75frqQMw1+NwktRT+r/Fc99lgtgxTtbkryjQIIrP/HIbJOsdGg4dps
 11/R1iyyZnLjXQLehXPuK+xHZ23KfEQaaDcUX+Ut1rCpXHo5AvOrI0DcHHpOvA1lPc7g
 hUzQ==
X-Gm-Message-State: AOAM530mJQ0cFV2PPqW9EFs1gruZemTVhYTDqABYpx0uZQ+f4QawBpCB
 Y6h0WxkEIuUd/5ZriLmXJ7iPMR782B4mGkQTX8pR2m0clOzFFA==
X-Google-Smtp-Source: ABdhPJyZqwmpuOBX3ejh7V1fi+OtOygYG6krV/XWHOrsRUEjZz1iqZZ/jHDtf/+6Jhj5TNkBeO+KSvCmlue2a/VHBt8=
X-Received: by 2002:a37:4388:: with SMTP id
 q130mr36683137qka.460.1625072085534; 
 Wed, 30 Jun 2021 09:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
 <20210624193045.5087-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMbhYs5u7eV-Adjo1d=qB69WNuh-Z1gY-wfH31_=F7czg@mail.gmail.com>
 <7593b3ba63007323679472f5120f7d72a96f71c1.camel@linux.intel.com>
In-Reply-To: <7593b3ba63007323679472f5120f7d72a96f71c1.camel@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 30 Jun 2021 17:54:19 +0100
Message-ID: <CAM0jSHNyHH2emeOXS4m6-7cAexD626pkQM_Qa6PP5Q-A6bnsaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/ttm: Reorganize the ttm move code somewhat
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 30 Jun 2021 at 16:27, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> On Wed, 2021-06-30 at 15:19 +0100, Matthew Auld wrote:
> > On Thu, 24 Jun 2021 at 20:31, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >
> > > In order to make the code a bit more readable and to facilitate
> > > async memcpy moves, reorganize the move code a little. Determine
> > > at an early stage whether to copy or to clear.
> > >
> > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 70 ++++++++++++++-------
> > > ----
> > >  1 file changed, 40 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > index c39d982c4fa6..4e529adcdfc7 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > @@ -431,6 +431,7 @@ i915_ttm_resource_get_st(struct
> > > drm_i915_gem_object *obj,
> > >  }
> > >
> > >  static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
> > > +                              bool clear,
> > >                                struct ttm_resource *dst_mem,
> > >                                struct sg_table *dst_st)
> > >  {
> > > @@ -449,13 +450,10 @@ static int i915_ttm_accel_move(struct
> > > ttm_buffer_object *bo,
> > >                 return -EINVAL;
> > >
> > >         dst_level =3D i915_ttm_cache_level(i915, dst_mem, ttm);
> > > -       if (!ttm || !ttm_tt_is_populated(ttm)) {
> > > +       if (clear) {
> > >                 if (bo->type =3D=3D ttm_bo_type_kernel)
> > >                         return -EINVAL;
> >
> > Was that meant to be:
> > return 0:
> >
> > ?
> >
> > Also does that mean we are incorrectly falling back to memset, for
> > non-userspace objects, instead of making it a noop?
>
> No, we're deliberately falling back to memset for non-userspace
> objects, but the logic only memsets in the BO_ALLOC_CPU_CLEAR case if
> everything is implemented correctly.
>
> >
> > >
> > > -               if (ttm && !(ttm->page_flags &
> > > TTM_PAGE_FLAG_ZERO_ALLOC))
> > > -                       return 0;
> > > -
> > >                 intel_engine_pm_get(i915->gt.migrate.context-
> > > >engine);
> > >                 ret =3D intel_context_migrate_clear(i915-
> > > >gt.migrate.context, NULL,
> > >                                                   dst_st->sgl,
> > > dst_level,
> > > @@ -489,27 +487,53 @@ static int i915_ttm_accel_move(struct
> > > ttm_buffer_object *bo,
> > >         return ret;
> > >  }
> > >
> > > -static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> > > -                        struct ttm_operation_ctx *ctx,
> > > -                        struct ttm_resource *dst_mem,
> > > -                        struct ttm_place *hop)
> > > +static void __i915_ttm_move(struct ttm_buffer_object *bo, bool
> > > clear,
> > > +                           struct ttm_resource *dst_mem,
> > > +                           struct sg_table *dst_st)
> > >  {
> > >         struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> > > -       struct ttm_resource_manager *dst_man =3D
> > > -               ttm_manager_type(bo->bdev, dst_mem->mem_type);
> > >         struct intel_memory_region *dst_reg, *src_reg;
> > >         union {
> > >                 struct ttm_kmap_iter_tt tt;
> > >                 struct ttm_kmap_iter_iomap io;
> > >         } _dst_iter, _src_iter;
> > >         struct ttm_kmap_iter *dst_iter, *src_iter;
> > > -       struct sg_table *dst_st;
> > >         int ret;
> > >
> > >         dst_reg =3D i915_ttm_region(bo->bdev, dst_mem->mem_type);
> > >         src_reg =3D i915_ttm_region(bo->bdev, bo->resource-
> > > >mem_type);
> > >         GEM_BUG_ON(!dst_reg || !src_reg);
> > >
> > > +       ret =3D i915_ttm_accel_move(bo, clear, dst_mem, dst_st);
> > > +       if (ret) {
> >
> > One future consideration is flat CCS where I don't think we can
> > easily
> > fall back to memcpy for userspace objects. Maybe we can make this
> > fallback conditional on DG1 or !ALLOC_USER for now, or just add a
> > TODO?
>
> Ugh. Is that true for both clearing and copying, or is it only copying?

With clearing I think we are required to nuke the aux CCS state using
some special blitter command.

For copying/moving I think it's a similar story, where special care
might be needed for the aux state, which likely requires the blitter.
Although tbh I don't really remember all the details.

>
> Problem is if we hit an engine reset and fence error during initial
> clearing / swapin, the plan moving forward is to intercept that and
> resort to cpu clearing / copying for security reasons. In the worst
> case we at least need to be able to clear.
>
> /Thomas
>
>
> >
> > > +               dst_iter =3D !cpu_maps_iomem(dst_mem) ?
> > > +                       ttm_kmap_iter_tt_init(&_dst_iter.tt, bo-
> > > >ttm) :
> > > +                       ttm_kmap_iter_iomap_init(&_dst_iter.io,
> > > &dst_reg->iomap,
> > > +                                                dst_st, dst_reg-
> > > >region.start);
> > > +
> > > +               src_iter =3D !cpu_maps_iomem(bo->resource) ?
> > > +                       ttm_kmap_iter_tt_init(&_src_iter.tt, bo-
> > > >ttm) :
> > > +                       ttm_kmap_iter_iomap_init(&_src_iter.io,
> > > &src_reg->iomap,
> > > +                                                obj-
> > > >ttm.cached_io_st,
> > > +                                                src_reg-
> > > >region.start);
> > > +
> > > +               ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter,
> > > src_iter);
> > > +       }
> > > +}
> > > +
> > > +static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> > > +                        struct ttm_operation_ctx *ctx,
> > > +                        struct ttm_resource *dst_mem,
> > > +                        struct ttm_place *hop)
> > > +{
> > > +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> > > +       struct ttm_resource_manager *dst_man =3D
> > > +               ttm_manager_type(bo->bdev, dst_mem->mem_type);
> > > +       struct ttm_tt *ttm =3D bo->ttm;
> > > +       struct sg_table *dst_st;
> > > +       bool clear;
> > > +       int ret;
> > > +
> > >         /* Sync for now. We could do the actual copy async. */
> > >         ret =3D ttm_bo_wait_ctx(bo, ctx);
> > >         if (ret)
> > > @@ -526,9 +550,8 @@ static int i915_ttm_move(struct
> > > ttm_buffer_object *bo, bool evict,
> > >         }
> > >
> > >         /* Populate ttm with pages if needed. Typically system
> > > memory. */
> > > -       if (bo->ttm && (dst_man->use_tt ||
> > > -                       (bo->ttm->page_flags &
> > > TTM_PAGE_FLAG_SWAPPED))) {
> > > -               ret =3D ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> > > +       if (ttm && (dst_man->use_tt || (ttm->page_flags &
> > > TTM_PAGE_FLAG_SWAPPED))) {
> > > +               ret =3D ttm_tt_populate(bo->bdev, ttm, ctx);
> > >                 if (ret)
> > >                         return ret;
> > >         }
> > > @@ -537,23 +560,10 @@ static int i915_ttm_move(struct
> > > ttm_buffer_object *bo, bool evict,
> > >         if (IS_ERR(dst_st))
> > >                 return PTR_ERR(dst_st);
> > >
> > > -       ret =3D i915_ttm_accel_move(bo, dst_mem, dst_st);
> > > -       if (ret) {
> > > -               /* If we start mapping GGTT, we can no longer use
> > > man::use_tt here. */
> > > -               dst_iter =3D !cpu_maps_iomem(dst_mem) ?
> > > -                       ttm_kmap_iter_tt_init(&_dst_iter.tt, bo-
> > > >ttm) :
> > > -                       ttm_kmap_iter_iomap_init(&_dst_iter.io,
> > > &dst_reg->iomap,
> > > -                                                dst_st, dst_reg-
> > > >region.start);
> > > -
> > > -               src_iter =3D !cpu_maps_iomem(bo->resource) ?
> > > -                       ttm_kmap_iter_tt_init(&_src_iter.tt, bo-
> > > >ttm) :
> > > -                       ttm_kmap_iter_iomap_init(&_src_iter.io,
> > > &src_reg->iomap,
> > > -                                                obj-
> > > >ttm.cached_io_st,
> > > -                                                src_reg-
> > > >region.start);
> > > +       clear =3D !cpu_maps_iomem(bo->resource) && (!ttm ||
> > > !ttm_tt_is_populated(ttm));
> > > +       if (!(clear && ttm && !(ttm->page_flags &
> > > TTM_PAGE_FLAG_ZERO_ALLOC)))
> >
> > Seems quite hard to read?
> >
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> >
> > > +               __i915_ttm_move(bo, clear, dst_mem, dst_st);
> > >
> > > -               ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter,
> > > src_iter);
> > > -       }
> > > -       /* Below dst_mem becomes bo->resource. */
> > >         ttm_bo_move_sync_cleanup(bo, dst_mem);
> > >         i915_ttm_adjust_domains_after_move(obj);
> > >         i915_ttm_free_cached_io_st(obj);
> > > --
> > > 2.31.1
> > >
>
>
