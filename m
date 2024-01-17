Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A8830506
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 13:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C6B10E699;
	Wed, 17 Jan 2024 12:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCDD10E67A;
 Wed, 17 Jan 2024 12:15:23 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so10985678e87.2; 
 Wed, 17 Jan 2024 04:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705493661; x=1706098461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3cnt7gyC+lpqdMXbg30DVvgkbh9UK/R9kQWe9GwuLk=;
 b=CxWp8C2GdVrVmE1z1TOa7oZmjjuNFb4hUO5I9KUhU4cpcrJ1eB3CxNKZHhx4Z+eCRr
 lD0uEybwhvAu+CVyfZv753GArKjYULMMya4Oo6kIRUkvs03z9YO2tbppQSQfPIcXcCJy
 Ozb1GmHlP9PQDSgI7m+YBj5bokNrRpNL8rKY3s2ZVFGgzXbM6ZT5uXidHXnDjU/Xskqk
 M3ihagCWsZm0qEnVDDwsCSZC/Hch6kevKsGq37z0m4qq2jEsrNJUyxISa5lGBYgDAPgl
 KXPR2sDxaacmTxrF9bS8bsg9e8v3hNzypqYZqOYe1jCtMsC2TIs53eUR3q0sbVQv6p1q
 UyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705493661; x=1706098461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S3cnt7gyC+lpqdMXbg30DVvgkbh9UK/R9kQWe9GwuLk=;
 b=CgHhlxM7Db7c2Le8yEG7Uym+6A1Ebo3wwqE5mwpWelVTXOZLfhjf7PEf3eP1HX4B2E
 CW+YPn1eJR40uKvelIpfvK5btJP5dmAu/rX4fIKCYI81hDYyGsXgl7Fw/eALB7kFXjaf
 MrRum95/W1kNqkY40AF2p8ThTL/48P8+l1c2kodI34hQVv28ujHo4xmubqi8GdRb/afP
 RxbZlqoSFUIh6tkI8glhO8ReeVY5uxyKyQOmLG8e/mpkKTsI6Xw7ERZDAiHJ4dXVUsV0
 F4+knyZyb2DdI0pxbhW2Xhe191T7m7nMpZYjpFq62CGczhh/qkwICSNlzYcSjVEd4t45
 dNew==
X-Gm-Message-State: AOJu0Yy5fhwTLYDfflLizksSfxMRP6N06y3bwn4wvcHeEweyBOG1VPzc
 7o8cTVJ0HqgAgIExQnPLSnIibOgBELVbMinpn0s=
X-Google-Smtp-Source: AGHT+IEZIui8gp91ARMAjRQ8QVaPafjM7rs6iZolQcaT2PPkHja/tMyc/Y0UlszOpLc1VLVkvpOR1DwVIQs/UrmndpM=
X-Received: by 2002:a05:6512:2201:b0:50e:53bc:3f9b with SMTP id
 h1-20020a056512220100b0050e53bc3f9bmr5144540lfu.113.1705493661288; Wed, 17
 Jan 2024 04:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20240117071328.3811480-1-alexious@zju.edu.cn>
In-Reply-To: <20240117071328.3811480-1-alexious@zju.edu.cn>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 17 Jan 2024 20:14:08 +0800
Message-ID: <CAKGbVbuEyKaeZbvU-SREQkto5AqdQo-wjx=cjf2Sx3eDCnah+Q@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/lima: fix a memleak in lima_heap_alloc
To: Zhipeng Lu <alexious@zju.edu.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Wed, Jan 17, 2024 at 3:14=E2=80=AFPM Zhipeng Lu <alexious@zju.edu.cn> wr=
ote:
>
> When lima_vm_map_bo fails, the resources need to be deallocated, or
> there will be memleaks.
>
> Fixes: 6aebc51d7aef ("drm/lima: support heap buffer creation")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
> Changelog:
>
> v2: rearrange the error-handling to ladder tags.
> ---
>  drivers/gpu/drm/lima/lima_gem.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 4f9736e5f929..d3d82ee7fb4c 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -75,29 +75,36 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_v=
m *vm)
>         } else {
>                 bo->base.sgt =3D kmalloc(sizeof(*bo->base.sgt), GFP_KERNE=
L);
>                 if (!bo->base.sgt) {
> -                       sg_free_table(&sgt);
> -                       return -ENOMEM;
> +                       ret =3D -ENOMEM;
> +                       goto err_out0;
>                 }
>         }
>
>         ret =3D dma_map_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
>         if (ret) {
> -               sg_free_table(&sgt);
> -               kfree(bo->base.sgt);
> -               bo->base.sgt =3D NULL;
> -               return ret;
> +               goto err_out1;
>         }
>
>         *bo->base.sgt =3D sgt;
>
>         if (vm) {
>                 ret =3D lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
> -               if (ret)
> -                       return ret;
> +               if (ret) {
> +                       goto err_out2;
> +               }
>         }
>
>         bo->heap_size =3D new_size;
>         return 0;
> +
> +err_out2:
> +       dma_unmap_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
> +err_out1:
> +       kfree(bo->base.sgt);
> +       bo->base.sgt =3D NULL;
> +err_out0:
> +       sg_free_table(&sgt);
> +       return ret;
>  }
>
>  int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file=
,
> --
> 2.34.1
>
