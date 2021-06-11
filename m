Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F88C3A45A5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99336E81D;
	Fri, 11 Jun 2021 15:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804366E81D;
 Fri, 11 Jun 2021 15:42:35 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id c9so5053908qkm.0;
 Fri, 11 Jun 2021 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BDpHOJFDeHxQfsCSGNMgqS/vani6r65YOC/XK9va9Uc=;
 b=K82IBz8N0RN6z+qoEFuwj50CKoz1yW9ZbHp7K6k/qaG4R2PAUyjYk3deV9VOYgCDYu
 CARoX9OARc2yQvExP0Yu9uIMcmu29l3l9U5C34jzWMnBU5FFGfGpgWiSW2JJl1RNHzgb
 81y6mWw6lQsTMm7kWqiNehs3yNPoTuG2ASSkI4dAtVkZzw+JEl8p6bK8Apb3ziX+y2bu
 GATARGUwZXNH5FkF4qIVpODpnn58xpBPobA5XM4muWLlVr8XB9kntQppkHYkOxijlnom
 /p7kXtn+UiOn/Jk85ZJNHWszc5nJuQ/sNNxldyCGKTqii1Q8TrYMyosVqwJYqLezdXP/
 NF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BDpHOJFDeHxQfsCSGNMgqS/vani6r65YOC/XK9va9Uc=;
 b=GzFfeEArAQlK7zm/rCIjpZAxdeOWVzcG4YqraPWdgwGptL1kDxRrigX9kOlVgciu7t
 lqvBwYfrUD4iAF3pXVXfjCdFCqjPRwRQoCinaGOMISpVu9UGD/gR5HS0SHMY0QpEIPCA
 oakguiZIwyn7G9ca/Bu84EnUNVTTacldX5bU+L0Df402VpNzPUZkjh653QvMrEPqFq54
 cbJOpxvvyvBVsc/4M49Tes47CjqeeaqdNhD/9HPY3Xa3cmgm6lX0NQuO5ZYvL3cSWbNo
 rDCu6k03tDrKA8WTBQwrph6FDhvPYxNzGZyevFukAA6Fcm5h43XDndbWQbZRRMAbR1Tn
 W1gg==
X-Gm-Message-State: AOAM531jQ8UjshuyOjBuAKqabNstnDGoQTpVDEW980PFXY41w3fpi+Bp
 wwkjajnPYMumZTAJhkGDrv3abYPKQ67jQRHONdzEwnRk0Usr7g==
X-Google-Smtp-Source: ABdhPJwVHshX91AEfIdcKoh/sJVkZO4KD6v8D0NF3Pxi84Hnr6THII7ftwnIiC1ndvtmUDA7d4Tyq0QFAincMnnwNz0=
X-Received: by 2002:a37:9a0b:: with SMTP id c11mr4216808qke.327.1623426154498; 
 Fri, 11 Jun 2021 08:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
 <20210611145459.8576-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210611145459.8576-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Jun 2021 16:42:07 +0100
Message-ID: <CAM0jSHPyB2CStY_e=1p8uRpYw7+yBNhOvxzwJc8XvvLgPzd-Rw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/i915/ttm: Calculate the object placement at
 get_pages time
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

On Fri, 11 Jun 2021 at 15:55, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Instead of relying on a static placement, calculate at get_pages() time.
> This should work for LMEM regions and system for now. For stolen we need
> to take preallocated range into account. That well be added later.

That will be

>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Fixed a style issue (Reported by Matthew Auld)
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 92 ++++++++++++++++++-------
>  drivers/gpu/drm/i915/intel_region_ttm.c |  8 ++-
>  drivers/gpu/drm/i915/intel_region_ttm.h |  2 +
>  3 files changed, 75 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 45ef1d101937..fd3d11728229 100644
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

I915_TTM_MAX_PLACEMENTS INTEL_REGION_UNKNOWN ?

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
> +       unsigned int num_allowed =3D obj->mm.n_placements;
> +       unsigned int i;
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

GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS)?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
