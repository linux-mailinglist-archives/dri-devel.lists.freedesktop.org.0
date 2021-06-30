Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2443B84F3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CB489C27;
	Wed, 30 Jun 2021 14:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B575689C27;
 Wed, 30 Jun 2021 14:20:05 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id j184so2562330qkd.6;
 Wed, 30 Jun 2021 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WX+8s3+Ib0fTVasYW1m7EhFyc/UxyEHPeYqtWJPBvFI=;
 b=P8eAvemN48WNXeoX8cDWxWjJioN7F5JnuDcfCSl1xGAJBUUZY8TvuaTrGEv12dF6da
 ddR576FENOhwQu3R7RXb4MJndRSynkM2iXdeQi7Z0javxQFwee2rdseLCTbDHCE3MqSe
 2CVhI2N5W/IsHA1pKmC0UEmhmWid0NKrKwwAa9JXz4vp4Pa8ap1LtDEoFfyXxpW++B3O
 yvScfOJse+jlQm7EVm7jgnkcr5YmLZ+aHI21UfxeyNxiIU+VmLCrWjxDyzpU7Ol+gmKN
 9VJITVChnOizGCToOR5cjyXxcmijAl7O9leUEeu/CCvnx0VrAk3oXBfYehgTKaXukD0z
 nzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WX+8s3+Ib0fTVasYW1m7EhFyc/UxyEHPeYqtWJPBvFI=;
 b=bzJCbTRTJAjAUYTUb5Kj90qV9Qmg/3MdQAuGRruClC+aHeCj0yBzK1FFdetg77nQV8
 zJQFOnnLE6Sc95QVUC8XfBXJxH5YkZdw+Cy5aHAKM7baFS20ayAytDoRT/0Bc/ha5i8r
 XjAWvaq4aPE0e5Ly7WKFpTI6zTRS1mIv8J8FXc+UzFf4CinNd0hqpojleIfcXWCGEf65
 vrqD1gMHcMMLcwZ3X/8Q1irTFdLWuOFOCNuk8G5G5LzrbAPnIWXs9pihjKSWFa7c5vMN
 v4QkXHs9Hk/3p1FravDbeIkf05W9ShcHrVtCpkrGbVWM12KiameW20zd20YPAl/j+J1z
 rwBg==
X-Gm-Message-State: AOAM5315IOdE7u9Rj0zORTDuelwUtx2lOhr+2tUL09IbA0m15t4vATGB
 ylaPHiV8w/zXX46PQCh4kFuD20eNG6gFeIOe/CA=
X-Google-Smtp-Source: ABdhPJx8RFgMjVZeJ4FqZTf2LdhOxbfGdPd7jK9XUUzmsRdAuYO5EfIRcaO3ydbSIFUG/7yugpVIi+3HNB3QdnO9gKs=
X-Received: by 2002:a37:b1c3:: with SMTP id a186mr37441161qkf.17.1625062804826; 
 Wed, 30 Jun 2021 07:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
 <20210624193045.5087-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210624193045.5087-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 30 Jun 2021 15:19:38 +0100
Message-ID: <CAM0jSHMbhYs5u7eV-Adjo1d=qB69WNuh-Z1gY-wfH31_=F7czg@mail.gmail.com>
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

On Thu, 24 Jun 2021 at 20:31, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> In order to make the code a bit more readable and to facilitate
> async memcpy moves, reorganize the move code a little. Determine
> at an early stage whether to copy or to clear.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 70 ++++++++++++++-----------
>  1 file changed, 40 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index c39d982c4fa6..4e529adcdfc7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -431,6 +431,7 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *=
obj,
>  }
>
>  static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
> +                              bool clear,
>                                struct ttm_resource *dst_mem,
>                                struct sg_table *dst_st)
>  {
> @@ -449,13 +450,10 @@ static int i915_ttm_accel_move(struct ttm_buffer_ob=
ject *bo,
>                 return -EINVAL;
>
>         dst_level =3D i915_ttm_cache_level(i915, dst_mem, ttm);
> -       if (!ttm || !ttm_tt_is_populated(ttm)) {
> +       if (clear) {
>                 if (bo->type =3D=3D ttm_bo_type_kernel)
>                         return -EINVAL;

Was that meant to be:
return 0:

?

Also does that mean we are incorrectly falling back to memset, for
non-userspace objects, instead of making it a noop?

>
> -               if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> -                       return 0;
> -
>                 intel_engine_pm_get(i915->gt.migrate.context->engine);
>                 ret =3D intel_context_migrate_clear(i915->gt.migrate.cont=
ext, NULL,
>                                                   dst_st->sgl, dst_level,
> @@ -489,27 +487,53 @@ static int i915_ttm_accel_move(struct ttm_buffer_ob=
ject *bo,
>         return ret;
>  }
>
> -static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> -                        struct ttm_operation_ctx *ctx,
> -                        struct ttm_resource *dst_mem,
> -                        struct ttm_place *hop)
> +static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
> +                           struct ttm_resource *dst_mem,
> +                           struct sg_table *dst_st)
>  {
>         struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> -       struct ttm_resource_manager *dst_man =3D
> -               ttm_manager_type(bo->bdev, dst_mem->mem_type);
>         struct intel_memory_region *dst_reg, *src_reg;
>         union {
>                 struct ttm_kmap_iter_tt tt;
>                 struct ttm_kmap_iter_iomap io;
>         } _dst_iter, _src_iter;
>         struct ttm_kmap_iter *dst_iter, *src_iter;
> -       struct sg_table *dst_st;
>         int ret;
>
>         dst_reg =3D i915_ttm_region(bo->bdev, dst_mem->mem_type);
>         src_reg =3D i915_ttm_region(bo->bdev, bo->resource->mem_type);
>         GEM_BUG_ON(!dst_reg || !src_reg);
>
> +       ret =3D i915_ttm_accel_move(bo, clear, dst_mem, dst_st);
> +       if (ret) {

One future consideration is flat CCS where I don't think we can easily
fall back to memcpy for userspace objects. Maybe we can make this
fallback conditional on DG1 or !ALLOC_USER for now, or just add a
TODO?

> +               dst_iter =3D !cpu_maps_iomem(dst_mem) ?
> +                       ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
> +                       ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg-=
>iomap,
> +                                                dst_st, dst_reg->region.=
start);
> +
> +               src_iter =3D !cpu_maps_iomem(bo->resource) ?
> +                       ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
> +                       ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg-=
>iomap,
> +                                                obj->ttm.cached_io_st,
> +                                                src_reg->region.start);
> +
> +               ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_ite=
r);
> +       }
> +}
> +
> +static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> +                        struct ttm_operation_ctx *ctx,
> +                        struct ttm_resource *dst_mem,
> +                        struct ttm_place *hop)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +       struct ttm_resource_manager *dst_man =3D
> +               ttm_manager_type(bo->bdev, dst_mem->mem_type);
> +       struct ttm_tt *ttm =3D bo->ttm;
> +       struct sg_table *dst_st;
> +       bool clear;
> +       int ret;
> +
>         /* Sync for now. We could do the actual copy async. */
>         ret =3D ttm_bo_wait_ctx(bo, ctx);
>         if (ret)
> @@ -526,9 +550,8 @@ static int i915_ttm_move(struct ttm_buffer_object *bo=
, bool evict,
>         }
>
>         /* Populate ttm with pages if needed. Typically system memory. */
> -       if (bo->ttm && (dst_man->use_tt ||
> -                       (bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED))) {
> -               ret =3D ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> +       if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_PAGE_FLAG_S=
WAPPED))) {
> +               ret =3D ttm_tt_populate(bo->bdev, ttm, ctx);
>                 if (ret)
>                         return ret;
>         }
> @@ -537,23 +560,10 @@ static int i915_ttm_move(struct ttm_buffer_object *=
bo, bool evict,
>         if (IS_ERR(dst_st))
>                 return PTR_ERR(dst_st);
>
> -       ret =3D i915_ttm_accel_move(bo, dst_mem, dst_st);
> -       if (ret) {
> -               /* If we start mapping GGTT, we can no longer use man::us=
e_tt here. */
> -               dst_iter =3D !cpu_maps_iomem(dst_mem) ?
> -                       ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
> -                       ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg-=
>iomap,
> -                                                dst_st, dst_reg->region.=
start);
> -
> -               src_iter =3D !cpu_maps_iomem(bo->resource) ?
> -                       ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
> -                       ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg-=
>iomap,
> -                                                obj->ttm.cached_io_st,
> -                                                src_reg->region.start);
> +       clear =3D !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_po=
pulated(ttm));
> +       if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLO=
C)))

Seems quite hard to read?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> +               __i915_ttm_move(bo, clear, dst_mem, dst_st);
>
> -               ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_ite=
r);
> -       }
> -       /* Below dst_mem becomes bo->resource. */
>         ttm_bo_move_sync_cleanup(bo, dst_mem);
>         i915_ttm_adjust_domains_after_move(obj);
>         i915_ttm_free_cached_io_st(obj);
> --
> 2.31.1
>
