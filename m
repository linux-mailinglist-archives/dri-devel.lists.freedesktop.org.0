Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86C399F54
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 12:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4726E12B;
	Thu,  3 Jun 2021 10:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747B06E12B;
 Thu,  3 Jun 2021 10:58:38 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id j184so5442122qkd.6;
 Thu, 03 Jun 2021 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GW2AlzTJ3CKkay93z563BbkGoE24ycSxqQnlA1HqPYU=;
 b=sP62rKBTUd37klq7PnKtYOZUIZI0qgeHtLXExzhl1vt59QsTbDuSB/6zW/UAHUOu5x
 OL7rbL7ByYWULFeeuQ8r21i6fHfDoPtunyEhqnmmem37j8Mli0wd5wvWrNAWgg5GwBoa
 EbA3/Z9ZBUlyEU6NnJ44TkhZVPH2MacsWxLPRsNNnzS2Lm6VSM914taP8T6/QkjnPx2J
 kf+IMu31PiCYNevF4G6P3dDiVe1LG2IJDxa0VRohpOmWTfqN4dEGfzoc/T8ScjuxcvoT
 LEnrxFYbi6MlR7F7Ryv+jliTgwqkzUsUJ1g2FV47VZlLtZnRcMerdGes51xT5uaFmWqW
 4oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GW2AlzTJ3CKkay93z563BbkGoE24ycSxqQnlA1HqPYU=;
 b=sDxWR4W13iJWfXZ4QD0XXQxEK/15/m8IQP3Vef3Li0OXWNJQycGaddEYTDTmrTXKNF
 v+1C3iVdl4Am4ui3xvmC2cPD7swnTBEHoZry9aHh0LrxPZhwVnNG1mg/fktl7ATWNYOm
 OAGsz9PSiz1qj1Ym7sANBmPuVlrdKGs8h9V6zorfMvZqHgzG7r9SGaSuQo1LlhefBrzk
 DkSYLYn9Eq/3ZdVJQL2djgWdWqvfMGC7qXG9v+xNo57AnhF8u97P21NFleGZbU3WxNiK
 xJMWh9gci8t4WF0N9a7SkRdNu/tlQjUMyc84fI46cOqjAflhP0iVUXGgycXtO0Zq9Ewt
 WIBg==
X-Gm-Message-State: AOAM532QqefLiBD8gKq1FS+LIQ33FYl7hXfVILvghT/iTuaDy4wvW9Uq
 8auyTkPYeHHJjLFdhKAeT/RIGFEBajp5yOer5h3CxB/tdBc=
X-Google-Smtp-Source: ABdhPJzVgPzaM/BdCHjoO7D/DJeQ+caDXA4tHh+Id9O/AvC0v1vvpoOKC1vDvUfAEXlkZL1kLnwVO8VYzxhrFKU5NZc=
X-Received: by 2002:a05:620a:b09:: with SMTP id
 t9mr32539892qkg.17.1622717917417; 
 Thu, 03 Jun 2021 03:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
 <20210602170716.280491-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210602170716.280491-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Jun 2021 11:58:11 +0100
Message-ID: <CAM0jSHNV3=_S3Zz46FnHwf6EgSbRcFrmFqFFuLu0zxknGqWXFA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/ttm: Calculate the object
 placement at get_pages time
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Jun 2021 at 18:08, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Instead of relying on a static placement, calculate at get_pages() time.
> This should work for LMEM regions and system for now. For stolen we need
> to take preallocated range into account. That well be added later.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Can we split this patch out and merge it? We can use this for feeding
in the per BO flags.

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 92 ++++++++++++++++++-------
>  drivers/gpu/drm/i915/intel_region_ttm.c |  8 ++-
>  drivers/gpu/drm/i915/intel_region_ttm.h |  2 +
>  3 files changed, 75 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index c73c51755c20..8e1c01168c6d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -24,6 +24,11 @@
>  #define I915_TTM_PRIO_NO_PAGES  1
>  #define I915_TTM_PRIO_HAS_PAGES 2
>
> +/*
> + * Size of struct ttm_place vector in on-stack struct ttm_placement allo=
cs
> + */
> +#define I915_TTM_MAX_PLACEMENTS 10
> +
>  /**
>   * struct i915_ttm_tt - TTM page vector with additional private informat=
ion
>   * @ttm: The base TTM page vector.
> @@ -42,32 +47,18 @@ struct i915_ttm_tt {
>         struct sg_table *cached_st;
>  };
>
> -static const struct ttm_place lmem0_sys_placement_flags[] =3D {
> -       {
> -               .fpfn =3D 0,
> -               .lpfn =3D 0,
> -               .mem_type =3D I915_PL_LMEM0,
> -               .flags =3D 0,
> -       }, {
> -               .fpfn =3D 0,
> -               .lpfn =3D 0,
> -               .mem_type =3D I915_PL_SYSTEM,
> -               .flags =3D 0,
> -       }
> -};
> -
> -static struct ttm_placement i915_lmem0_placement =3D {
> -       .num_placement =3D 1,
> -       .placement =3D &lmem0_sys_placement_flags[0],
> -       .num_busy_placement =3D 1,
> -       .busy_placement =3D &lmem0_sys_placement_flags[0],
> +static const struct ttm_place sys_placement_flags =3D {
> +       .fpfn =3D 0,
> +       .lpfn =3D 0,
> +       .mem_type =3D I915_PL_SYSTEM,
> +       .flags =3D 0,
>  };
>
>  static struct ttm_placement i915_sys_placement =3D {
>         .num_placement =3D 1,
> -       .placement =3D &lmem0_sys_placement_flags[1],
> +       .placement =3D &sys_placement_flags,
>         .num_busy_placement =3D 1,
> -       .busy_placement =3D &lmem0_sys_placement_flags[1],
> +       .busy_placement =3D &sys_placement_flags,
>  };
>
>  static bool gpu_binds_iomem(struct ttm_resource *mem)
> @@ -83,6 +74,55 @@ static bool cpu_maps_iomem(struct ttm_resource *mem)
>
>  static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
>
> +static enum ttm_caching
> +i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
> +{
> +       /*
> +        * Objects only allowed in system get cached cpu-mappings.
> +        * Other objects get WC mapping for now. Even if in system.
> +        */
> +       if (obj->mm.region->type =3D=3D INTEL_MEMORY_SYSTEM &&
> +           obj->mm.n_placements <=3D 1)
> +               return ttm_cached;
> +
> +       return ttm_write_combined;
> +}
> +
> +static void
> +i915_ttm_place_from_region(const struct intel_memory_region *mr,
> +                          struct ttm_place *place)
> +{
> +       memset(place, 0, sizeof(*place));
> +       place->mem_type =3D intel_region_to_ttm_type(mr);
> +}
> +
> +static void
> +i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
> +                           struct ttm_place *requested,
> +                           struct ttm_place *busy,
> +                           struct ttm_placement *placement)
> +{
> +       unsigned int i;
> +       unsigned int num_allowed =3D obj->mm.n_placements;

Style nit: Christmas tree

> +
> +       placement->num_placement =3D 1;
> +       i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
> +                                  obj->mm.region, requested);
> +
> +       /* Cache this on object? */
> +       placement->num_busy_placement =3D num_allowed;
> +       for (i =3D 0; i < placement->num_busy_placement; ++i)
> +               i915_ttm_place_from_region(obj->mm.placements[i], busy + =
i);
> +
> +       if (num_allowed =3D=3D 0) {
> +               *busy =3D *requested;
> +               placement->num_busy_placement =3D 1;
> +       }
> +
> +       placement->placement =3D requested;
> +       placement->busy_placement =3D busy;
> +}
> +
>  static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>                                          uint32_t page_flags)
>  {
> @@ -100,7 +140,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_b=
uffer_object *bo,
>             man->use_tt)
>                 page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
>
> -       ret =3D ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_write_comb=
ined);
> +       ret =3D ttm_tt_init(&i915_tt->ttm, bo, page_flags,
> +                         i915_ttm_select_tt_caching(obj));
>         if (ret) {
>                 kfree(i915_tt);
>                 return NULL;
> @@ -465,10 +506,13 @@ static int i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj)
>                 .no_wait_gpu =3D false,
>         };
>         struct sg_table *st;
> +       struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> +       struct ttm_placement placement;
>         int ret;
>
>         /* Move to the requested placement. */
> -       ret =3D ttm_bo_validate(bo, &i915_lmem0_placement, &ctx);
> +       i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> +       ret =3D ttm_bo_validate(bo, &placement, &ctx);
>         if (ret)
>                 return ret =3D=3D -ENOSPC ? -ENXIO : ret;
>
> @@ -684,7 +728,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>         i915_gem_object_make_unshrinkable(obj);
>         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_N=
OWARN);
>         mutex_init(&obj->ttm.get_io_page.lock);
> -
>         bo_type =3D (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_devic=
e :
>                 ttm_bo_type_kernel;
>
> @@ -708,7 +751,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>         i915_ttm_adjust_domains_after_cpu_move(obj);
>         i915_ttm_adjust_gem_after_move(obj);
>         i915_gem_object_unlock(obj);
> -
>  out:
>         /* i915 wants -ENXIO when out of memory region space. */
>         return (ret =3D=3D -ENOSPC) ? -ENXIO : ret;
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i9=
15/intel_region_ttm.c
> index 0b41a1545570..bc58ea942ef9 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -49,12 +49,16 @@ void intel_region_ttm_device_fini(struct drm_i915_pri=
vate *dev_priv)
>   * driver-private types for now, reserving TTM_PL_VRAM for stolen
>   * memory and TTM_PL_TT for GGTT use if decided to implement this.
>   */
> -static int intel_region_to_ttm_type(struct intel_memory_region *mem)
> +int intel_region_to_ttm_type(const struct intel_memory_region *mem)
>  {
>         int type;
>
>         GEM_BUG_ON(mem->type !=3D INTEL_MEMORY_LOCAL &&
> -                  mem->type !=3D INTEL_MEMORY_MOCK);
> +                  mem->type !=3D INTEL_MEMORY_MOCK &&
> +                  mem->type !=3D INTEL_MEMORY_SYSTEM);
> +
> +       if (mem->type =3D=3D INTEL_MEMORY_SYSTEM)
> +               return TTM_PL_SYSTEM;
>
>         type =3D mem->instance + TTM_PL_PRIV;
>         GEM_BUG_ON(type >=3D TTM_NUM_MEM_TYPES);
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i9=
15/intel_region_ttm.h
> index eaa3eccfa252..88960ae6cff6 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.h
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.h
> @@ -27,6 +27,8 @@ struct sg_table *intel_region_ttm_node_to_st(struct int=
el_memory_region *mem,
>  void intel_region_ttm_node_free(struct intel_memory_region *mem,
>                                 void *node);
>
> +int intel_region_to_ttm_type(const struct intel_memory_region *mem);
> +
>  struct ttm_device_funcs *i915_ttm_driver(void);
>
>  #ifdef CONFIG_DRM_I915_SELFTEST
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
