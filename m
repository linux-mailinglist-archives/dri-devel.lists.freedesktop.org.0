Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967D5733D0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 12:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEEE98F4C;
	Wed, 13 Jul 2022 10:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCACD98F4B;
 Wed, 13 Jul 2022 10:08:58 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bn33so12876891ljb.13;
 Wed, 13 Jul 2022 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Byd4/jahjyoyw0K/iMAz20kd4FdeP/AViHSjhRTyo1o=;
 b=hvXkweVLrF81HDyll6b+YOUORVhujNOXY357RUs2UlHOVR3BAuVzU5d8N6za3hjFNf
 zfcm6CRPC+T8DjUJfOb6wm8bIXgOiCbF3ppE4fVGCMNv0ZNl5qBRNOb+VTKGaeoQd/DZ
 q4iUpzy40dPt9JvJrQOElKG+PncHEKB6xYD3eYWY5oUfKoCGfqp9SYUVLDtebkCiHa13
 AhY67e+0px7Ckkwg2+PnV2LJKEIxpsifmyklpYmQOHWY+OaBYBaCVsvKbJx0bD+qh1Gl
 8nzv6d6ePgazegjsMcIXnmiXr94L4kXTZZJGBshblPBDyCJdknYfI2/3Gw+xjH8H6r88
 0mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Byd4/jahjyoyw0K/iMAz20kd4FdeP/AViHSjhRTyo1o=;
 b=5TN2OM5XwsRoZesNnjNye8J6Abyy7HMxe2Nra9+2ourz2PAbEIx2JLQ8mpFIFxZlbo
 eYrz/tRvi1Joj+GiQc576qGMb1n539phiacy8HGcaQ5b3FbbKQdLndE9a9Ar7SX3cRTH
 G3zUjaQLhGkT+2HHWOBw9AEP1sC4/1sEm2yEqNytwzVz0vX2ewl/CCvjVZpW+ukB+zBJ
 aC9ACVjsfEJTvX/NVaK7xXFAwAQWL1WEA+82vbdSAAq7H2kj/vaKDOeSlPNtVJrLyWyO
 77TVXqcO/6priaAyNLlVIEl+LyJ+XHsFAJ+xZhQc7f6FawsdKU84tvQuk2eL6oMpwNSB
 skMQ==
X-Gm-Message-State: AJIora9i23vRP/HNzpREiA5TYqs2iv1STi+5c5agkWUyylMDeEPKoHF2
 zD3ojRjmYwJXnSGqEZMYUG+/LCZMMxsUU2pYkC8=
X-Google-Smtp-Source: AGRyM1tAZnzXtYYuYfWjBkbdDqiHPbR6CZzD48vTvXTahZWN6qSsFdEVuIZaHvEiMZY/6/uQFqUET+Sa/o1ORNjRVfk=
X-Received: by 2002:a05:651c:981:b0:253:b87e:ba6c with SMTP id
 b1-20020a05651c098100b00253b87eba6cmr1291651ljq.530.1657706936921; Wed, 13
 Jul 2022 03:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220712114605.52369-1-christian.koenig@amd.com>
In-Reply-To: <20220712114605.52369-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 13 Jul 2022 11:08:29 +0100
Message-ID: <CAM0jSHOiFRZaU=NC9d0U8wD-1OWx_c+K0xfKz5unAxggU6WFtQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Jul 2022 at 12:46, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Make sure we can at least move and alloc TT objects without backing store=
.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 70e2ed4e99df..5449738c262f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -289,8 +289,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_b=
uffer_object *bo,
>  {
>         struct drm_i915_private *i915 =3D container_of(bo->bdev, typeof(*=
i915),
>                                                      bdev);
> -       struct ttm_resource_manager *man =3D
> -               ttm_manager_type(bo->bdev, bo->resource->mem_type);
>         struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
>         unsigned long ccs_pages =3D 0;
>         enum ttm_caching caching;
> @@ -304,8 +302,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_b=
uffer_object *bo,
>         if (!i915_tt)
>                 return NULL;
>
> -       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
> -           man->use_tt)
> +       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
> +           ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
>                 page_flags |=3D TTM_TT_FLAG_ZERO_ALLOC;

AFAICT it should be safe to make this:

if (obj->flags & I915_BO_ALLOC_CPU_CLEAR)
        page_flags |=3D TTM_TT_FLAG_ZERO_ALLOC;

Hopefully that fixes the igt_lmem_create_cleared_cpu subtest?

>
>         caching =3D i915_ttm_select_tt_caching(obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_ttm_move.c
> index a10716f4e717..dcb838dffd7b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -490,7 +490,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool =
evict,
>         bool clear;
>         int ret;
>
> -       if (GEM_WARN_ON(!obj)) {
> +       if (!bo->resource || GEM_WARN_ON(!obj)) {

IIUC in patch 3 we now nuke the bo->resource when doing the "pipeline
gutting" thing, but I think i915 is (ab)using that when swapping out
shmem objects (see i915_ttm_shrink), so I think here we need to
somehow inspect the tt to see if something needs to be swapped in? We
might also need to move it back to lmem after. Or maybe this is
already handled somehow? CI should hopefully be able to confirm
(gem_lmem_swapping).

>                 ttm_bo_move_null(bo, dst_mem);
>                 return 0;
>         }
> --
> 2.25.1
>
