Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A533E665C4B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BE710E73B;
	Wed, 11 Jan 2023 13:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835DC10E73B;
 Wed, 11 Jan 2023 13:17:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j17so23476642lfr.3;
 Wed, 11 Jan 2023 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEUdIlhvsudcUeJHAqVGKsk9jdmEVyioNTjdjyPqo8U=;
 b=fkoRCLluVB6E2adzSWMey5zQ9VDMerhOF97rshd1asj9jkFj2bpxZo7O2HC1JtWB+8
 FPEoVUeHPLblfzlQfg7dimrkyIGwYxgpu3sB4ol2L5p4V7lPaAynrZAdx6iyT8ro12LM
 FFOmZTd13FMKVmJnIvq/LgsP2O/3+NUw0zEAGbFchjxycz13MX96ak/iOAZh2g8fiFZU
 8kM5k7KyH1dU/laWDtptMk1IKKogy7fMuwDS3nXzg8ueI9MvkqWGN1jYsVt01tEWhbWK
 ZueONwukzMBsSOnX6+wdOfwpnR0bOTqRUSkngSm1juOhPqv3dCOyftqxFF08PLVca3Sh
 ajLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pEUdIlhvsudcUeJHAqVGKsk9jdmEVyioNTjdjyPqo8U=;
 b=MU/f0ls5uhvDArhD8m7Z9j2ZwC1c0wEjCPwQuhhtQQMhBHdi37HmBkYBw2b4tjmHNT
 d83DpfqTgdEJwyhTRFGnkj2UDBuoOg5nTvfzYvnoOAHtYtx2NnwD1Mqh2DKdZ2XBJf7l
 gyy7hTQZfk0QP4oF69TMDwU9UxgMktO2x5riBWmDeCG09mZX0AaRhBtzUlEHWkj08uyv
 VKYwJOpBq1XlKZFtJ40D0xSz4ea6rBhnJl6ZQTpcINGo1BsxnzNpXAgQVi4pK56aSZzv
 wOTG1G4tWj7qOl0Ur9RheOGZSwpUMsGIfkBy89++ByBJBA0yN5Fl0p8eUNQ4nwgyaOt4
 POmw==
X-Gm-Message-State: AFqh2krqneVbhGn07RQEw3RLNaBYcruUgrt5ZwaLOme8MxuBMjr1GXzX
 95c8WedoeXN2ZvEjwvD6g0gMj46QVBa5vVdqWnZVtocJxw4Y5w==
X-Google-Smtp-Source: AMrXdXu236VzVHSsdxhFtcNnmFQEz0b2Mj2m34fWQ9Zaoaj9idaEm9Nr2OPaDlyfiQDfOxY0vl5HDeerZwgCtl+aEv0=
X-Received: by 2002:a05:6512:1694:b0:4ca:fd8d:dd6 with SMTP id
 bu20-20020a056512169400b004cafd8d0dd6mr2575462lfb.185.1673443066688; Wed, 11
 Jan 2023 05:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20230111114256.72669-1-christian.koenig@amd.com>
In-Reply-To: <20230111114256.72669-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 11 Jan 2023 13:17:19 +0000
Message-ID: <CAM0jSHP7bRn05sWrwHriLeaQifNuqO77UPFsWg0MrW5dCeZphQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/ttm: prevent moving of pinned BOs
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
> We have checks for this in the individual drivers move callback, but
> it's probably better to generally forbit that on a higher level.
>
> Also stops exporting ttm_resource_compat() since that's not necessary
> any more after removing the extra checks in vmwgfx.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ----
>  drivers/gpu/drm/nouveau/nouveau_bo.c    |  3 ---
>  drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ----
>  drivers/gpu/drm/ttm/ttm_bo.c            | 20 ++++++++++++--------
>  drivers/gpu/drm/ttm/ttm_resource.c      |  1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 19 ++-----------------
>  6 files changed, 14 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 068c2d8495fd..677cd7d91687 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -466,11 +466,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *=
bo, bool evict,
>                         return r;
>         }
>
> -       /* Can't move a pinned BO */
>         abo =3D ttm_to_amdgpu_bo(bo);
> -       if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
> -               return -EINVAL;
> -
>         adev =3D amdgpu_ttm_adev(bo->bdev);
>
>         if (!old_mem || (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 288eebc70a67..c2ec91cc845d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1015,9 +1015,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool =
evict,
>         if (ret)
>                 goto out_ntfy;
>
> -       if (nvbo->bo.pin_count)
> -               NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
> -
>         if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
>                 ret =3D nouveau_bo_vm_bind(bo, new_reg, &new_tile);
>                 if (ret)
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 1e8e287e113c..67075c85f847 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -211,11 +211,7 @@ static int radeon_bo_move(struct ttm_buffer_object *=
bo, bool evict,
>         if (r)
>                 return r;
>
> -       /* Can't move a pinned BO */
>         rbo =3D container_of(bo, struct radeon_bo, tbo);
> -       if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
> -               return -EINVAL;
> -
>         rdev =3D radeon_get_rdev(bo->bdev);
>         if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && bo->ttm =3D=3D NULL=
) {
>                 ttm_bo_move_null(bo, new_mem);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 326a3d13a829..9baccb2f6e99 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -894,14 +894,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>         if (!placement->num_placement && !placement->num_busy_placement)
>                 return ttm_bo_pipeline_gutting(bo);
>
> -       /*
> -        * Check whether we need to move buffer.
> -        */
> -       if (!bo->resource || !ttm_resource_compat(bo->resource, placement=
)) {
> -               ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> -               if (ret)
> -                       return ret;
> -       }
> +       /* Check whether we need to move buffer. */
> +       if (bo->resource && ttm_resource_compat(bo->resource, placement))
> +               return 0;

Note this now skips the tt create below (intentional?). I think i915
needed that, since it creates a dummy system resource initially for
all objects, and then relies on ZERO_ALLOC being set for certain
objects to know if the memory needs to be cleared or not when later
doing the dummy -> vram. Thoughts?

> +
> +       /* Moving of pinned BOs is forbidden */
> +       if (bo->pin_count)
> +               return -EINVAL;
> +
> +       ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * We might need to add a TTM.
>          */
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index b8a826a24fb2..7333f7a87a2f 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -361,7 +361,6 @@ bool ttm_resource_compat(struct ttm_resource *res,
>
>         return false;
>  }
> -EXPORT_SYMBOL(ttm_resource_compat);
>
>  void ttm_resource_set_bo(struct ttm_resource *res,
>                          struct ttm_buffer_object *bo)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 321c551784a1..dbcef460c452 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -87,12 +87,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_pr=
iv,
>         if (unlikely(ret !=3D 0))
>                 goto err;
>
> -       if (buf->base.pin_count > 0)
> -               ret =3D ttm_resource_compat(bo->resource, placement)
> -                       ? 0 : -EINVAL;
> -       else
> -               ret =3D ttm_bo_validate(bo, placement, &ctx);
> -
> +       ret =3D ttm_bo_validate(bo, placement, &ctx);
>         if (!ret)
>                 vmw_bo_pin_reserved(buf, true);
>
> @@ -128,12 +123,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *de=
v_priv,
>         if (unlikely(ret !=3D 0))
>                 goto err;
>
> -       if (buf->base.pin_count > 0) {
> -               ret =3D ttm_resource_compat(bo->resource, &vmw_vram_gmr_p=
lacement)
> -                       ? 0 : -EINVAL;
> -               goto out_unreserve;
> -       }
> -
>         ret =3D ttm_bo_validate(bo, &vmw_vram_gmr_placement, &ctx);
>         if (likely(ret =3D=3D 0) || ret =3D=3D -ERESTARTSYS)
>                 goto out_unreserve;
> @@ -218,11 +207,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *=
dev_priv,
>                 (void) ttm_bo_validate(bo, &vmw_sys_placement, &ctx);
>         }
>
> -       if (buf->base.pin_count > 0)
> -               ret =3D ttm_resource_compat(bo->resource, &placement)
> -                       ? 0 : -EINVAL;
> -       else
> -               ret =3D ttm_bo_validate(bo, &placement, &ctx);
> +       ret =3D ttm_bo_validate(bo, &placement, &ctx);
>
>         /* For some reason we didn't end up at the start of vram */
>         WARN_ON(ret =3D=3D 0 && bo->resource->start !=3D 0);
> --
> 2.34.1
>
