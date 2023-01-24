Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0506794DB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D3810E64B;
	Tue, 24 Jan 2023 10:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E10310E64D;
 Tue, 24 Jan 2023 10:13:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a11so22709080lfg.0;
 Tue, 24 Jan 2023 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRbgGSdgZ3lb++t/ReqPAt68S5TzAu/XL1224BG2lP8=;
 b=pwHMx1Albnv2+e5ygLt/xyUxjQOnzSAoibduR35+MBbXJ3naQ5qkAxT9nh63umBDn9
 jnlSP7WKSbGV+ESOL0baF6d9fgmqorvDCgVwKwD1Qw9y9V4FRnVRrIv2LDipZK9NCYgq
 bC2BbUjUs0tDa4w0hMtVMZGjlyOURKsvSUZCLTYy6divJIDwxv3onOAfUnPNWBlT5mq3
 xwovsnR2HsBSUcReDsuAUtHi8V3vRBoCcHrOSnC36pGmI7WCqGRcmDty+JD7fGubvWNu
 T66PsRB64J458JFU1RkoP1i0dKDLJl+xbtkhT+6ZNwGgVr7M69LOgEu75/piLN1Qi8f/
 CWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRbgGSdgZ3lb++t/ReqPAt68S5TzAu/XL1224BG2lP8=;
 b=JbjI59aoPSXfUaXMhI8D1G/JV1EBsl3dZvzJ2J2e4I7roeuJkcmPAS0xC2Xd9OAgtN
 KMEcsrLw9kwKjxczE5Frq9qcOhlv+D4H0f8USIIi5o0wUI8ZCKFbMDIBBZI6xie6ICht
 fO7KRhLprdL7ASG2wAdVcCFi1Phu2x4opiB3q1w5i186iLbGOoFTBgXqGfg3OlheApop
 OhItRIxDompnE144DfJdhxjvRXi9GH3FQUdZ+T+mGTv39BCJ53U1IrYPp8GwfXkW+IXR
 WFYdVYs4hJRQSh4WKC9/MI58Bk6c+hSW4pdahe+4HH485Ut9u1oOAxWA3QTgUt5/abtA
 FnVg==
X-Gm-Message-State: AFqh2ko4RUy2RXeofXEQVkZRbuL52MQgjsAtzyHssd/t80tk7svDZ1zn
 ZQfcBnO0ZTc+ZUGi3MHpYty9yTx5mnS+XTDi708=
X-Google-Smtp-Source: AMrXdXsXwfcKGDrqQg9jgHUwWXPbhgm71xYVzD4ZeL8ZlUSCqnsMJ2rvopWV4jnf4wPqpXHgrvpsQxBRvW5QjNRZFBI=
X-Received: by 2002:a05:6512:1102:b0:4d5:8306:34fa with SMTP id
 l2-20020a056512110200b004d5830634famr1231735lfg.469.1674555183625; Tue, 24
 Jan 2023 02:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20230111114256.72669-1-christian.koenig@amd.com>
 <CAM0jSHP7bRn05sWrwHriLeaQifNuqO77UPFsWg0MrW5dCeZphQ@mail.gmail.com>
 <f25004e8-ec4e-d9d7-3b8c-6115cf6692a1@gmail.com>
In-Reply-To: <f25004e8-ec4e-d9d7-3b8c-6115cf6692a1@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Jan 2023 10:12:35 +0000
Message-ID: <CAM0jSHPth9eXy7tXr3F798xzxsfhq1zBvyr2WUvq0Zjt=9CejA@mail.gmail.com>
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

On Tue, 24 Jan 2023 at 09:51, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 11.01.23 um 14:17 schrieb Matthew Auld:
> > On Wed, 11 Jan 2023 at 11:43, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> We have checks for this in the individual drivers move callback, but
> >> it's probably better to generally forbit that on a higher level.
> >>
> >> Also stops exporting ttm_resource_compat() since that's not necessary
> >> any more after removing the extra checks in vmwgfx.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ----
> >>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  3 ---
> >>   drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ----
> >>   drivers/gpu/drm/ttm/ttm_bo.c            | 20 ++++++++++++--------
> >>   drivers/gpu/drm/ttm/ttm_resource.c      |  1 -
> >>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 19 ++-----------------
> >>   6 files changed, 14 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c
> >> index 068c2d8495fd..677cd7d91687 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> @@ -466,11 +466,7 @@ static int amdgpu_bo_move(struct ttm_buffer_objec=
t *bo, bool evict,
> >>                          return r;
> >>          }
> >>
> >> -       /* Can't move a pinned BO */
> >>          abo =3D ttm_to_amdgpu_bo(bo);
> >> -       if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
> >> -               return -EINVAL;
> >> -
> >>          adev =3D amdgpu_ttm_adev(bo->bdev);
> >>
> >>          if (!old_mem || (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/no=
uveau/nouveau_bo.c
> >> index 288eebc70a67..c2ec91cc845d 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> @@ -1015,9 +1015,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bo=
ol evict,
> >>          if (ret)
> >>                  goto out_ntfy;
> >>
> >> -       if (nvbo->bo.pin_count)
> >> -               NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
> >> -
> >>          if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA)=
 {
> >>                  ret =3D nouveau_bo_vm_bind(bo, new_reg, &new_tile);
> >>                  if (ret)
> >> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rad=
eon/radeon_ttm.c
> >> index 1e8e287e113c..67075c85f847 100644
> >> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >> @@ -211,11 +211,7 @@ static int radeon_bo_move(struct ttm_buffer_objec=
t *bo, bool evict,
> >>          if (r)
> >>                  return r;
> >>
> >> -       /* Can't move a pinned BO */
> >>          rbo =3D container_of(bo, struct radeon_bo, tbo);
> >> -       if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
> >> -               return -EINVAL;
> >> -
> >>          rdev =3D radeon_get_rdev(bo->bdev);
> >>          if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && bo->ttm =3D=3D =
NULL) {
> >>                  ttm_bo_move_null(bo, new_mem);
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
.c
> >> index 326a3d13a829..9baccb2f6e99 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >> @@ -894,14 +894,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo=
,
> >>          if (!placement->num_placement && !placement->num_busy_placeme=
nt)
> >>                  return ttm_bo_pipeline_gutting(bo);
> >>
> >> -       /*
> >> -        * Check whether we need to move buffer.
> >> -        */
> >> -       if (!bo->resource || !ttm_resource_compat(bo->resource, placem=
ent)) {
> >> -               ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> >> -               if (ret)
> >> -                       return ret;
> >> -       }
> >> +       /* Check whether we need to move buffer. */
> >> +       if (bo->resource && ttm_resource_compat(bo->resource, placemen=
t))
> >> +               return 0;
> > Note this now skips the tt create below (intentional?). I think i915
> > needed that, since it creates a dummy system resource initially for
> > all objects, and then relies on ZERO_ALLOC being set for certain
> > objects to know if the memory needs to be cleared or not when later
> > doing the dummy -> vram. Thoughts?
>
> That's unproblematic. On initial allocation bo->resource is NULL so we
> never branch out here.

Here is what I see in drm-tip, when first creating an object with ttm:

ttm_bo_init_reserved() -> ttm_resource_alloc(PL_SYSTEM, &bo->resource)
-> ttm_bo_validate()

So bo->resource is for sure not NULL on initial allocation, and is
pointing to PL_SYSTEM. And in i915 we initially stuff everything into
SYSTEM as a dummy placement.

IIRC you had a series that tried to address that (allowing NULL
resource or so), but it never landed:
https://patchwork.freedesktop.org/patch/500698/?series=3D107680&rev=3D2

>
> Christian.
>
> >
> >> +
> >> +       /* Moving of pinned BOs is forbidden */
> >> +       if (bo->pin_count)
> >> +               return -EINVAL;
> >> +
> >> +       ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>          /*
> >>           * We might need to add a TTM.
> >>           */
> >> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/=
ttm_resource.c
> >> index b8a826a24fb2..7333f7a87a2f 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> >> @@ -361,7 +361,6 @@ bool ttm_resource_compat(struct ttm_resource *res,
> >>
> >>          return false;
> >>   }
> >> -EXPORT_SYMBOL(ttm_resource_compat);
> >>
> >>   void ttm_resource_set_bo(struct ttm_resource *res,
> >>                           struct ttm_buffer_object *bo)
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_bo.c
> >> index 321c551784a1..dbcef460c452 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> >> @@ -87,12 +87,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev=
_priv,
> >>          if (unlikely(ret !=3D 0))
> >>                  goto err;
> >>
> >> -       if (buf->base.pin_count > 0)
> >> -               ret =3D ttm_resource_compat(bo->resource, placement)
> >> -                       ? 0 : -EINVAL;
> >> -       else
> >> -               ret =3D ttm_bo_validate(bo, placement, &ctx);
> >> -
> >> +       ret =3D ttm_bo_validate(bo, placement, &ctx);
> >>          if (!ret)
> >>                  vmw_bo_pin_reserved(buf, true);
> >>
> >> @@ -128,12 +123,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private =
*dev_priv,
> >>          if (unlikely(ret !=3D 0))
> >>                  goto err;
> >>
> >> -       if (buf->base.pin_count > 0) {
> >> -               ret =3D ttm_resource_compat(bo->resource, &vmw_vram_gm=
r_placement)
> >> -                       ? 0 : -EINVAL;
> >> -               goto out_unreserve;
> >> -       }
> >> -
> >>          ret =3D ttm_bo_validate(bo, &vmw_vram_gmr_placement, &ctx);
> >>          if (likely(ret =3D=3D 0) || ret =3D=3D -ERESTARTSYS)
> >>                  goto out_unreserve;
> >> @@ -218,11 +207,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_privat=
e *dev_priv,
> >>                  (void) ttm_bo_validate(bo, &vmw_sys_placement, &ctx);
> >>          }
> >>
> >> -       if (buf->base.pin_count > 0)
> >> -               ret =3D ttm_resource_compat(bo->resource, &placement)
> >> -                       ? 0 : -EINVAL;
> >> -       else
> >> -               ret =3D ttm_bo_validate(bo, &placement, &ctx);
> >> +       ret =3D ttm_bo_validate(bo, &placement, &ctx);
> >>
> >>          /* For some reason we didn't end up at the start of vram */
> >>          WARN_ON(ret =3D=3D 0 && bo->resource->start !=3D 0);
> >> --
> >> 2.34.1
> >>
>
