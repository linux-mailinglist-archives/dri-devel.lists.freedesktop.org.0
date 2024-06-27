Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC791A846
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 15:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706FC10EA9F;
	Thu, 27 Jun 2024 13:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LPf+Icvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2295010E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 13:47:26 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7f3d4788eeeso44508839f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719496045; x=1720100845;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40dhuzkIfipD69AcEkrSXDBS83EF2lkDNmI95hVGJ80=;
 b=LPf+IcvsrfFiDAGa7o3cyQ+htOnJ379CkgBH2bC7sLrYyO2r3GOx3/we20sX2+kN/r
 7WUW0QQhJsE5VDhkkYqIPfRYjBeckNGv5IdltL/rxQAYBRqYP2S6Iwtg+3pF+v6XAQvB
 u9vkujcuhe2EvuDVWYSgL7GfHHU3UHS+/jRiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719496045; x=1720100845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40dhuzkIfipD69AcEkrSXDBS83EF2lkDNmI95hVGJ80=;
 b=N21kJAbby/0QNLwpAParNDtnyZJfPtX2NPMCfR67MVr8/w+zrQ4UwAdMjdYydAGNjT
 Yx7cF14C3aaLFrEmmrNEp92ktrwctJ+RKRAHp25/UgqVX9SVT1lPtjzklH28SEEVKpE/
 3j9ujc2iTat4LtkyToMUCch0z6E+VzSapfbFT3RmtuZGLgT9nR5OtKdLjxDYYOoGeo4p
 U2OTp3zHCkz7kRaNK1y9DX/s3MCalIXS3bFUJVcog64GwGf1QZ7jlkEp/+zdEdkwdZZV
 DoeH++9ooBQyNtH917ty/zd9U3mMZIxqPd9tGbbIRAoE1mxZmjr6q+chxChljZEfo/lk
 0gNQ==
X-Gm-Message-State: AOJu0YyPAhw7LAA+TGzzbw5dO+8dnQxwq1Q315DUVxHmSKQSlb2jer1O
 G5S3ggXoWMyj3fWCSqK9I6jYxM3y75GI8sBwZ5iLPMpNDHxJNmoC529vqjDhmVU6Eb2QZC7itPK
 3MZJ7LTMFxtNtA85mdPz8jkigPwrWBWTbWEGK
X-Google-Smtp-Source: AGHT+IGwilMEviNMAecEw2eaKfyfOM8Z80JvlzaJ8WetqqzuVQ/91QhRabA4nZSQF25dzfC2HRW6a+YpgQ8iATTZNbQ=
X-Received: by 2002:a05:6602:6d08:b0:7eb:8c69:86d6 with SMTP id
 ca18e2360f4ac-7f3a75c0251mr1568703139f.14.1719496045102; Thu, 27 Jun 2024
 06:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
 <20240627053452.2908605-5-zack.rusin@broadcom.com>
In-Reply-To: <20240627053452.2908605-5-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Thu, 27 Jun 2024 16:47:14 +0300
Message-ID: <CAKLwHdUw4gBU7HOEX=a2p0_HH2GW9-hCRRY5dcp7=DZc_uoJCg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/vmwgfx: Add basic support for external buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
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

On Thu, Jun 27, 2024 at 8:34=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> Make vmwgfx go through the dma-buf interface to map/unmap imported
> buffers. The driver used to try to directly manipulate external
> buffers, assuming that everything that was coming to it had to live
> in cpu accessible memory. While technically true because what's in the
> vms is controlled by us, it's semantically completely broken.
>
> Fix importing of external buffers by forwarding all memory access
> requests to the importer.
>
> Tested by the vmw_prime basic_vgem test.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 62 +++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_gem.c
> index 07185c108218..07567d9519ec 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
> - * Copyright 2021-2023 VMware, Inc.
> + * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
> + * =E2=80=9CBroadcom=E2=80=9D refers to Broadcom Inc. and/or its subsidi=
aries.
>   *
>   * Permission is hereby granted, free of charge, to any person
>   * obtaining a copy of this software and associated documentation
> @@ -78,6 +79,59 @@ static struct sg_table *vmw_gem_object_get_sg_table(st=
ruct drm_gem_object *obj)
>         return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages, vmw=
_tt->dma_ttm.num_pages);
>  }
>
> +static int vmw_gem_vmap(struct drm_gem_object *obj, struct iosys_map *ma=
p)
> +{
> +       struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(obj);
> +       int ret;
> +
> +       if (obj->import_attach) {
> +               ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> +               if (!ret) {
> +                       if (drm_WARN_ON(obj->dev, map->is_iomem)) {
> +                               dma_buf_vunmap(obj->import_attach->dmabuf=
, map);
> +                               return -EIO;
> +                       }
> +               }
> +       } else {
> +               ret =3D ttm_bo_vmap(bo, map);
> +       }
> +
> +       return ret;
> +}
> +
> +static void vmw_gem_vunmap(struct drm_gem_object *obj, struct iosys_map =
*map)
> +{
> +       if (obj->import_attach) {
> +               dma_buf_vunmap(obj->import_attach->dmabuf, map);
> +       } else {
> +               drm_gem_ttm_vunmap(obj, map);
> +       }
> +}
> +
> +static int vmw_gem_mmap(struct drm_gem_object *obj, struct vm_area_struc=
t *vma)
> +{
> +       int ret;
> +
> +       if (obj->import_attach) {
> +               /* Reset both vm_ops and vm_private_data, so we don't end=
 up with
> +                * vm_ops pointing to our implementation if the dma-buf b=
ackend
> +                * doesn't set those fields.
> +                */
> +               vma->vm_private_data =3D NULL;
> +               vma->vm_ops =3D NULL;
> +
> +               ret =3D dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> +               if (!ret)
> +                       drm_gem_object_put(obj);
> +
> +               return ret;
> +       }
> +
> +       return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>  static const struct vm_operations_struct vmw_vm_ops =3D {
>         .pfn_mkwrite =3D vmw_bo_vm_mkwrite,
>         .page_mkwrite =3D vmw_bo_vm_mkwrite,
> @@ -94,9 +148,9 @@ static const struct drm_gem_object_funcs vmw_gem_objec=
t_funcs =3D {
>         .pin =3D vmw_gem_object_pin,
>         .unpin =3D vmw_gem_object_unpin,
>         .get_sg_table =3D vmw_gem_object_get_sg_table,
> -       .vmap =3D drm_gem_ttm_vmap,
> -       .vunmap =3D drm_gem_ttm_vunmap,
> -       .mmap =3D drm_gem_ttm_mmap,
> +       .vmap =3D vmw_gem_vmap,
> +       .vunmap =3D vmw_gem_vunmap,
> +       .mmap =3D vmw_gem_mmap,
>         .vm_ops =3D &vmw_vm_ops,
>  };
>
> --
> 2.40.1
>

LGTM!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
