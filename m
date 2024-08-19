Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D12956CAC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1346510E27C;
	Mon, 19 Aug 2024 14:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dKb88FAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD82B10E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:07:18 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-39d20c4be2eso15342655ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724076438; x=1724681238;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zInusf384MoOXg5RDBYhVVIadQ13Cf9VYTTCR/vH0vg=;
 b=dKb88FAb8Pt89GM/h9mUF5r9DXMeW4qyiPhwwxVVkMgogN9h6cn99WZGyf1SDcurJL
 YI96aRk8b18Avgik1/74Th/qEP87gBl4/qMsOHCdJsyC3bxQ36G4DaTu3PBYYBZsWHMc
 fu2MzN8xI37lqa0FwZfuyFoG57S5Kscr1cGcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724076438; x=1724681238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zInusf384MoOXg5RDBYhVVIadQ13Cf9VYTTCR/vH0vg=;
 b=qv6zpL1+jU6xoYL/X1LfguliO2DDsV8EbuGC5T2L/CfogtfUw7oI6HD1TGCsWZ3TTy
 nQ85i57nH8AGgW4amsGcNdgo6NX8+5IfRhEyloDrIzkCQh8xZW/DsyvihEWOHuUQpTcL
 K4nif1RJUe1F0KZbPIePV1Ut2dylWyNl15PfXCYYC8pTEUgZBOYCXzrPdN9AkQ7u1wHI
 JgAkPIJIncPPcg9hZUQ0XehR90oYvEdfj+Hib+5RHarOLy46aT+lnYUApdZsC5pBxrGi
 CifR937vEEt2Ua1uZs9uAUh8NekZB3c5nK/TLUAzstORcerb5oCjL4SycdGSoP/DPOOE
 SzIg==
X-Gm-Message-State: AOJu0YxOxig+SS4Nxs1Nq5XIGxiQAYFutYXxqbINk14Ed96MT6ZabVRq
 OSPgf9/WxgCLYqrc0xrQBvjtFjkuLYQMo1ZcXT+smqdgg7FvqVVgo4fBVqwxnM9CcjvXYJFLCad
 C8asheJCnC03hcNVY+fD9MGV3XqKmvQ8GL4xe
X-Google-Smtp-Source: AGHT+IFBRJ9RIrMZmaC++KoG2j75Y8cMmwi42TLdr/jx9pxnZ9uKFRa79LOMOp31rN8oPKXyhjA+PEWkMyP0b9TrG0Y=
X-Received: by 2002:a05:6e02:160a:b0:39a:12d7:2841 with SMTP id
 e9e14a558f8ab-39d26d060d6mr129247625ab.15.1724076437684; Mon, 19 Aug 2024
 07:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240815153404.630214-1-zack.rusin@broadcom.com>
 <20240815153404.630214-2-zack.rusin@broadcom.com>
In-Reply-To: <20240815153404.630214-2-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 19 Aug 2024 17:07:06 +0300
Message-ID: <CAKLwHdU7aNX5wV91ki11WKMzPOMWtj4kxwgc_23SQOQE1x4M-Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/vmwgfx: Fix prime with external buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 15, 2024 at 6:34=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> Make sure that for external buffers mapping goes through the dma_buf
> interface instead of trying to access pages directly.
>
> External buffers might not provide direct access to readable/writable
> pages so to make sure the bo's created from external dma_bufs can be
> read dma_buf interface has to be used.
>
> Fixes crashes in IGT's kms_prime with vgem. Regular desktop usage won't
> trigger this due to the fact that virtual machines will not have
> multiple GPUs but it enables better test coverage in IGT.
>
> v2: Fix the diff rectangle computation
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
> Cc: <stable@vger.kernel.org> # v6.6+
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.9+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 112 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  12 +--
>  3 files changed, 116 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index 717d624e9a05..4049447d211c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -27,6 +27,8 @@
>   ***********************************************************************=
***/
>
>  #include "vmwgfx_drv.h"
> +
> +#include "vmwgfx_bo.h"
>  #include <linux/highmem.h>
>
>  /*
> @@ -420,13 +422,103 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit=
_line_data *d,
>         return 0;
>  }
>
> +static void *map_external(struct vmw_bo *bo, struct iosys_map *map)
> +{
> +       struct vmw_private *vmw =3D
> +               container_of(bo->tbo.bdev, struct vmw_private, bdev);
> +       void *ptr =3D NULL;
> +       int ret;
> +
> +       if (bo->tbo.base.import_attach) {
> +               ret =3D dma_buf_vmap(bo->tbo.base.dma_buf, map);
> +               if (ret) {
> +                       drm_dbg_driver(&vmw->drm,
> +                                      "Wasn't able to map external bo!\n=
");
> +                       goto out;
> +               }
> +               ptr =3D map->vaddr;
> +       } else {
> +               ptr =3D vmw_bo_map_and_cache(bo);
> +       }
> +
> +out:
> +       return ptr;
> +}
> +
> +static void unmap_external(struct vmw_bo *bo, struct iosys_map *map)
> +{
> +       if (bo->tbo.base.import_attach)
> +               dma_buf_vunmap(bo->tbo.base.dma_buf, map);
> +       else
> +               vmw_bo_unmap(bo);
> +}
> +
> +static int vmw_external_bo_copy(struct vmw_bo *dst, u32 dst_offset,
> +                               u32 dst_stride, struct vmw_bo *src,
> +                               u32 src_offset, u32 src_stride,
> +                               u32 width_in_bytes, u32 height,
> +                               struct vmw_diff_cpy *diff)
> +{
> +       struct vmw_private *vmw =3D
> +               container_of(dst->tbo.bdev, struct vmw_private, bdev);
> +       size_t dst_size =3D dst->tbo.resource->size;
> +       size_t src_size =3D src->tbo.resource->size;
> +       struct iosys_map dst_map =3D {0};
> +       struct iosys_map src_map =3D {0};
> +       int ret, i;
> +       u8 *vsrc;
> +       u8 *vdst;
> +
> +       vsrc =3D map_external(src, &src_map);
> +       if (!vsrc) {
> +               drm_dbg_driver(&vmw->drm, "Wasn't able to map src\n");
> +               ret =3D -ENOMEM;
> +               goto out;
> +       }
> +
> +       vdst =3D map_external(dst, &dst_map);
> +       if (!vdst) {
> +               drm_dbg_driver(&vmw->drm, "Wasn't able to map dst\n");
> +               ret =3D -ENOMEM;
> +               goto out;
> +       }
> +
> +       vsrc +=3D src_offset;
> +       vdst +=3D dst_offset;
> +       if (src_stride =3D=3D dst_stride) {
> +               dst_size -=3D dst_offset;
> +               src_size -=3D src_offset;
> +               memcpy(vdst, vsrc,
> +                      min(dst_stride * height, min(dst_size, src_size)))=
;
> +       } else {
> +               WARN_ON(dst_stride < width_in_bytes);

Wouldn't that be a hard BUG_ON / error condition? I mean, there'd
likely be a buffer overrun ensuing.

> +               for (i =3D 0; i < height; ++i) {
> +                       memcpy(vdst, vsrc, width_in_bytes);
> +                       vsrc +=3D src_stride;
> +                       vdst +=3D dst_stride;
> +               }
> +       }
> +
> +       diff->rect.x1 =3D (dst_offset % dst_stride) / diff->cpp;
> +       diff->rect.y1 =3D floor(dst_offset / dst_stride);

That floor looks like a leftover from an earlier (signed integer) version?

> +       diff->rect.x2 =3D diff->rect.x1 + width_in_bytes / diff->cpp;
> +       diff->rect.y2 =3D diff->rect.y1 + height;
> +
> +       ret =3D 0;
> +out:
> +       unmap_external(src, &src_map);
> +       unmap_external(dst, &dst_map);
> +
> +       return ret;
> +}
> +
>  /**
>   * vmw_bo_cpu_blit - in-kernel cpu blit.
>   *
> - * @dst: Destination buffer object.
> + * @vmw_dst: Destination buffer object.
>   * @dst_offset: Destination offset of blit start in bytes.
>   * @dst_stride: Destination stride in bytes.
> - * @src: Source buffer object.
> + * @vmw_src: Source buffer object.
>   * @src_offset: Source offset of blit start in bytes.
>   * @src_stride: Source stride in bytes.
>   * @w: Width of blit.
> @@ -444,13 +536,15 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_=
line_data *d,
>   * Neither of the buffer objects may be placed in PCI memory
>   * (Fixed memory in TTM terminology) when using this function.
>   */
> -int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
> +int vmw_bo_cpu_blit(struct vmw_bo *vmw_dst,
>                     u32 dst_offset, u32 dst_stride,
> -                   struct ttm_buffer_object *src,
> +                   struct vmw_bo *vmw_src,
>                     u32 src_offset, u32 src_stride,
>                     u32 w, u32 h,
>                     struct vmw_diff_cpy *diff)
>  {
> +       struct ttm_buffer_object *src =3D &vmw_src->tbo;
> +       struct ttm_buffer_object *dst =3D &vmw_dst->tbo;
>         struct ttm_operation_ctx ctx =3D {
>                 .interruptible =3D false,
>                 .no_wait_gpu =3D false
> @@ -460,6 +554,11 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>         int ret =3D 0;
>         struct page **dst_pages =3D NULL;
>         struct page **src_pages =3D NULL;
> +       bool src_external =3D (src->ttm->page_flags & TTM_TT_FLAG_EXTERNA=
L) !=3D 0;
> +       bool dst_external =3D (dst->ttm->page_flags & TTM_TT_FLAG_EXTERNA=
L) !=3D 0;
> +
> +       if (WARN_ON(dst =3D=3D src))
> +               return -EINVAL;
>
>         /* Buffer objects need to be either pinned or reserved: */
>         if (!(dst->pin_count))
> @@ -479,6 +578,11 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>                         return ret;
>         }
>
> +       if (src_external || dst_external)
> +               return vmw_external_bo_copy(vmw_dst, dst_offset, dst_stri=
de,
> +                                           vmw_src, src_offset, src_stri=
de,
> +                                           w, h, diff);
> +
>         if (!src->ttm->pages && src->ttm->sg) {
>                 src_pages =3D kvmalloc_array(src->ttm->num_pages,
>                                            sizeof(struct page *), GFP_KER=
NEL);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 32f50e595809..3f4719b3c268 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1353,9 +1353,9 @@ void vmw_diff_memcpy(struct vmw_diff_cpy *diff, u8 =
*dest, const u8 *src,
>
>  void vmw_memcpy(struct vmw_diff_cpy *diff, u8 *dest, const u8 *src, size=
_t n);
>
> -int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
> +int vmw_bo_cpu_blit(struct vmw_bo *dst,
>                     u32 dst_offset, u32 dst_stride,
> -                   struct ttm_buffer_object *src,
> +                   struct vmw_bo *src,
>                     u32 src_offset, u32 src_stride,
>                     u32 w, u32 h,
>                     struct vmw_diff_cpy *diff);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 5106413c14b7..3cc664384b66 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -502,7 +502,7 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dir=
ty *dirty)
>                 container_of(dirty->unit, typeof(*stdu), base);
>         s32 width, height;
>         s32 src_pitch, dst_pitch;
> -       struct ttm_buffer_object *src_bo, *dst_bo;
> +       struct vmw_bo *src_bo, *dst_bo;
>         u32 src_offset, dst_offset;
>         struct vmw_diff_cpy diff =3D VMW_CPU_BLIT_DIFF_INITIALIZER(stdu->=
cpp);
>
> @@ -517,11 +517,11 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_d=
irty *dirty)
>
>         /* Assume we are blitting from Guest (bo) to Host (display_srf) *=
/
>         src_pitch =3D stdu->display_srf->metadata.base_size.width * stdu-=
>cpp;
> -       src_bo =3D &stdu->display_srf->res.guest_memory_bo->tbo;
> +       src_bo =3D stdu->display_srf->res.guest_memory_bo;
>         src_offset =3D ddirty->top * src_pitch + ddirty->left * stdu->cpp=
;
>
>         dst_pitch =3D ddirty->pitch;
> -       dst_bo =3D &ddirty->buf->tbo;
> +       dst_bo =3D ddirty->buf;
>         dst_offset =3D ddirty->fb_top * dst_pitch + ddirty->fb_left * std=
u->cpp;
>
>         (void) vmw_bo_cpu_blit(dst_bo, dst_offset, dst_pitch,
> @@ -1143,7 +1143,7 @@ vmw_stdu_bo_populate_update_cpu(struct vmw_du_updat=
e_plane  *update, void *cmd,
>         struct vmw_diff_cpy diff =3D VMW_CPU_BLIT_DIFF_INITIALIZER(0);
>         struct vmw_stdu_update_gb_image *cmd_img =3D cmd;
>         struct vmw_stdu_update *cmd_update;
> -       struct ttm_buffer_object *src_bo, *dst_bo;
> +       struct vmw_bo *src_bo, *dst_bo;
>         u32 src_offset, dst_offset;
>         s32 src_pitch, dst_pitch;
>         s32 width, height;
> @@ -1157,11 +1157,11 @@ vmw_stdu_bo_populate_update_cpu(struct vmw_du_upd=
ate_plane  *update, void *cmd,
>
>         diff.cpp =3D stdu->cpp;
>
> -       dst_bo =3D &stdu->display_srf->res.guest_memory_bo->tbo;
> +       dst_bo =3D stdu->display_srf->res.guest_memory_bo;
>         dst_pitch =3D stdu->display_srf->metadata.base_size.width * stdu-=
>cpp;
>         dst_offset =3D bb->y1 * dst_pitch + bb->x1 * stdu->cpp;
>
> -       src_bo =3D &vfbbo->buffer->tbo;
> +       src_bo =3D vfbbo->buffer;
>         src_pitch =3D update->vfb->base.pitches[0];
>         src_offset =3D bo_update->fb_top * src_pitch + bo_update->fb_left=
 *
>                 stdu->cpp;
> --
> 2.43.0
>

LGTM, just with those two remarks.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
