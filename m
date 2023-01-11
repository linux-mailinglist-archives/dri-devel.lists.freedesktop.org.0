Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D73665C12
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E860710E73F;
	Wed, 11 Jan 2023 13:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351B910E73B;
 Wed, 11 Jan 2023 13:03:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m6so23382924lfj.11;
 Wed, 11 Jan 2023 05:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+6XZlppnJXdnt3sdk6yHFJAO7Qv6lX/rvrlIIQou+M=;
 b=l7nRoEqjPd75VI3kUnw12VBxjvC/Dl1SU7EVblfVKRMf6N58E1OdKWZJMvT8URD7Yp
 JoCkfmyNR7L8n7gUdOHOhRZpTo67IGNC9/dlmccYtAUv1unvkt/nK8/jHLWRg7F68CFQ
 /i967vs7jWuTliNH6vsWw/mqEWiYSJWSCXaRAKrRTTVEzcHuZNOLAS84+9B7H3ppIs1i
 qqVzvRLrM0s0/76YZ7lXAosyEsxGF+aq/f0VraolKx5dj2KRZNgeam0BU/kme6d0vmGk
 WJepJNlsefbgHVUvjavIlv45MtEaLAYYBsG5cmZF7daWCxnL0aneDufHojP2RDrGatpJ
 2rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+6XZlppnJXdnt3sdk6yHFJAO7Qv6lX/rvrlIIQou+M=;
 b=rvHs3mXzek8r1pJvmsDdS5jVhCVCIYrmG2z5DuJKd8uaRQBbSS4auD01S1isL9+ivc
 IowrP9apui58Hl2x9b1g6n7wj/gGdl/yctBQYIZWcDiYK4rt5Qo46HeOcmWHxFKJNXy0
 AROcfgwKIYEdaZs3WYpg4JmZ3iayOCx7Htj7m9ojCytcC9vBtxRIgxEVWmYENzrHDEYd
 TEu4cv60ixwCm3QxqddVJBi9q03zD03LcM3UBvrajdfaKtTvdwQ5I7SpcBueYJQe6M9V
 392Z6UOonboEwnspp4jUq1sC96EpLia0AZRP0BbK+MBS+xyeBM31oZi5wL/oKbX5dGw+
 hGVg==
X-Gm-Message-State: AFqh2kqg+tthUMmhgBVqpy82Gkd0a06/x7E8HuyC3Nfe8M1/dzZJTgSv
 OVT4m3KwMaF89zz+czKeeIK053pzlQnGYUV3Ag0=
X-Google-Smtp-Source: AMrXdXsYCkQHZBWiFlLEgt+FNB2/eaSAgtt5QzE72Xfcw0XOuhl2YC//YglNYKV/hbexNgZZV3M/geQNYtvsubAEaCU=
X-Received: by 2002:a05:6512:370e:b0:4b5:8719:6095 with SMTP id
 z14-20020a056512370e00b004b587196095mr7688792lfr.636.1673442228338; Wed, 11
 Jan 2023 05:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20230111114256.72669-1-christian.koenig@amd.com>
 <20230111114256.72669-2-christian.koenig@amd.com>
In-Reply-To: <20230111114256.72669-2-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 11 Jan 2023 13:03:20 +0000
Message-ID: <CAM0jSHP=LT5mXEFvXWJGPOotgRBBLFe-Pw=4TTHYWo=Maov_uA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/ttm: replace busy placement with flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Jan 2023 at 11:43, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Instead of a list of separate busy placement add flags which indicate
> that a placement should only be used when there is room or if we need to
> evict.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  11 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c      |   2 -
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  36 +++---
>  drivers/gpu/drm/nouveau/nouveau_bo.c       |  59 ++++------
>  drivers/gpu/drm/nouveau/nouveau_bo.h       |   1 -
>  drivers/gpu/drm/qxl/qxl_object.c           |   2 -
>  drivers/gpu/drm/qxl/qxl_ttm.c              |   2 -
>  drivers/gpu/drm/radeon/radeon_object.c     |   2 -
>  drivers/gpu/drm/radeon/radeon_ttm.c        |   8 +-
>  drivers/gpu/drm/radeon/radeon_uvd.c        |   1 -
>  drivers/gpu/drm/ttm/ttm_bo.c               |  21 ++--
>  drivers/gpu/drm/ttm/ttm_resource.c         |  73 +++----------
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |   2 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 121 ++++++++++-----------
>  include/drm/ttm/ttm_placement.h            |  10 +-
>  include/drm/ttm/ttm_resource.h             |   8 +-
>  17 files changed, 134 insertions(+), 231 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 974e85d8b6cc..0995a2f41305 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -201,9 +201,6 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo=
 *abo, u32 domain)
>
>         placement->num_placement =3D c;
>         placement->placement =3D places;
> -
> -       placement->num_busy_placement =3D c;
> -       placement->busy_placement =3D places;
>  }
>
>  /**
> @@ -1369,8 +1366,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct tt=
m_buffer_object *bo)
>                                         AMDGPU_GEM_DOMAIN_GTT);
>
>         /* Avoid costly evictions; only set GTT as a busy placement */
> -       abo->placement.num_busy_placement =3D 1;
> -       abo->placement.busy_placement =3D &abo->placements[1];
> +       abo->placements[0].flags |=3D TTM_PL_FLAG_IDLE;
>
>         r =3D ttm_bo_validate(bo, &abo->placement, &ctx);
>         if (unlikely(r =3D=3D -EBUSY || r =3D=3D -ERESTARTSYS))
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 677cd7d91687..33cf6e835a68 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -104,23 +104,19 @@ static void amdgpu_evict_flags(struct ttm_buffer_ob=
ject *bo,
>         /* Don't handle scatter gather BOs */
>         if (bo->type =3D=3D ttm_bo_type_sg) {
>                 placement->num_placement =3D 0;
> -               placement->num_busy_placement =3D 0;
>                 return;
>         }
>
>         /* Object isn't an AMDGPU object so ignore */
>         if (!amdgpu_bo_is_amdgpu_bo(bo)) {
>                 placement->placement =3D &placements;
> -               placement->busy_placement =3D &placements;
>                 placement->num_placement =3D 1;
> -               placement->num_busy_placement =3D 1;
>                 return;
>         }
>
>         abo =3D ttm_to_amdgpu_bo(bo);
>         if (abo->flags & AMDGPU_GEM_CREATE_DISCARDABLE) {
>                 placement->num_placement =3D 0;
> -               placement->num_busy_placement =3D 0;
>                 return;
>         }
>
> @@ -129,13 +125,13 @@ static void amdgpu_evict_flags(struct ttm_buffer_ob=
ject *bo,
>         case AMDGPU_PL_GWS:
>         case AMDGPU_PL_OA:
>                 placement->num_placement =3D 0;
> -               placement->num_busy_placement =3D 0;
>                 return;
>
>         case TTM_PL_VRAM:
>                 if (!adev->mman.buffer_funcs_enabled) {
>                         /* Move to system memory */
>                         amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_D=
OMAIN_CPU);
> +
>                 } else if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>                            !(abo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_RE=
QUIRED) &&
>                            amdgpu_bo_in_cpu_visible_vram(abo)) {
> @@ -150,8 +146,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_obje=
ct *bo,
>                                                         AMDGPU_GEM_DOMAIN=
_CPU);
>                         abo->placements[0].fpfn =3D adev->gmc.visible_vra=
m_size >> PAGE_SHIFT;
>                         abo->placements[0].lpfn =3D 0;
> -                       abo->placement.busy_placement =3D &abo->placement=
s[1];
> -                       abo->placement.num_busy_placement =3D 1;
> +                       abo->placements[0].flags |=3D TTM_PL_FLAG_IDLE;
>                 } else {
>                         /* Move to GTT memory */
>                         amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_D=
OMAIN_GTT |
> @@ -923,8 +918,6 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *b=
o)
>         /* allocate GART space */
>         placement.num_placement =3D 1;
>         placement.placement =3D &placements;
> -       placement.num_busy_placement =3D 1;
> -       placement.busy_placement =3D &placements;
>         placements.fpfn =3D 0;
>         placements.lpfn =3D adev->gmc.gart_size >> PAGE_SHIFT;
>         placements.mem_type =3D TTM_PL_TT;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index d40b3edb52d0..f46792b757f9 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -147,7 +147,6 @@ static void drm_gem_vram_placement(struct drm_gem_vra=
m_object *gbo,
>                 invariant_flags =3D TTM_PL_FLAG_TOPDOWN;
>
>         gbo->placement.placement =3D gbo->placements;
> -       gbo->placement.busy_placement =3D gbo->placements;
>
>         if (pl_flag & DRM_GEM_VRAM_PL_FLAG_VRAM) {
>                 gbo->placements[c].mem_type =3D TTM_PL_VRAM;
> @@ -160,7 +159,6 @@ static void drm_gem_vram_placement(struct drm_gem_vra=
m_object *gbo,
>         }
>
>         gbo->placement.num_placement =3D c;
> -       gbo->placement.num_busy_placement =3D c;
>
>         for (i =3D 0; i < c; ++i) {
>                 gbo->placements[i].fpfn =3D 0;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index d409a77449a3..dc483d601cf9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -65,8 +65,6 @@ static const struct ttm_place sys_placement_flags =3D {
>  static struct ttm_placement i915_sys_placement =3D {
>         .num_placement =3D 1,
>         .placement =3D &sys_placement_flags,
> -       .num_busy_placement =3D 1,
> -       .busy_placement =3D &sys_placement_flags,
>  };
>
>  /**
> @@ -154,32 +152,27 @@ i915_ttm_place_from_region(const struct intel_memor=
y_region *mr,
>
>  static void
>  i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
> -                           struct ttm_place *requested,
> -                           struct ttm_place *busy,
> +                           struct ttm_place *places,
>                             struct ttm_placement *placement)
>  {
>         unsigned int num_allowed =3D obj->mm.n_placements;
>         unsigned int flags =3D obj->flags;
>         unsigned int i;
>
> -       placement->num_placement =3D 1;
>         i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
> -                                  obj->mm.region, requested, obj->bo_off=
set,
> +                                  obj->mm.region, &places[0], obj->bo_of=
fset,
>                                    obj->base.size, flags);

Do we also need places[0].flags |=3D TTM_PL_FLAG_IDLE somewhere here?

Series doesn't seem to apply to drm-tip, so no intel-gfx CI. Would it
be possible to have a version that applies to drm-tip, just so we can
verify the i915 bits? We could send it to trybot[1] just to get some
CI results?

[1] https://patchwork.freedesktop.org/project/intel-gfx-trybot/series/?orde=
ring=3D-last_updated
