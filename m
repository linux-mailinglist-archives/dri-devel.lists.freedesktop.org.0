Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4582E6C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 02:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8144E10E3CB;
	Tue, 16 Jan 2024 01:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E9510E379;
 Tue, 16 Jan 2024 01:25:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a2d6ded84fcso174555566b.2; 
 Mon, 15 Jan 2024 17:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705368292; x=1705973092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NW8IeT94sqxk9dJoctrT0QMHmgttzl2Wny6AX+IZ+rw=;
 b=dwmSs88vBlSjzJjuImJuOp3m4VDxzdRBhoHwU6RZUpTFUCt1/fu1DbBMSFc3Y++4cx
 bGyDjMUcOIzH6pYcLOmylydab9sfCEeYkq64w0QU/BAsJ9sFFmC/sJwRZFyEKV88I3t5
 NIk29e/21mxr8yRRVuLi1LThHzPW6Jk1dEb2qa4eO8iTa0Wb4LY5AMM8C6IQeP5l7YIt
 ptF+o+oXLHDkYQ/QFCLc45AW7pHzB/Pgp19fuonpFK2uiLqdJXSTOZhOVsKodOnTdDZf
 H/Oam6e0Gqe11uNU/jRYpRACEgCvYGIJKbuJVigz9pRpm2MSCnn+mJX/ta0cDvwaY7Sx
 bgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705368292; x=1705973092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NW8IeT94sqxk9dJoctrT0QMHmgttzl2Wny6AX+IZ+rw=;
 b=l/lz8/a95fCEFsFwt5Op8MXzK4MlXZpjMYzgaY5x4Rb8NDGH3In5EQFQbLm8VYQM7K
 qogTl4Cv86fQoAFFqKThRMmaeVGeWA6fQ68xkdczyPWtn3Mppe3Wc0LOpx7pVBNPpYII
 MZemhxkN6gGHPx3U84GP+kKFRqA/lAc2MmRRVPDi4Cv0PpcR+etlmaOZ/j2w0IutD8Sw
 R6ZbZi+iqrLeE07GuQBTPgGfKv7GwTIoQxdFOGwHWQeRdwXMqO5AYsanzzwlwDDRa69O
 o6sAH+o3evwkpx9aznKyZsdvNJVITMB1T//gjEdI0itBJrBnrbgoHTWjcSTVnYUH9Nhk
 +Yug==
X-Gm-Message-State: AOJu0YwhRolphL5JlUIhqoHyDwiJBDu/H3GqNRcEKUdgipMKCKixmw6h
 kVd1mT+EmsWC8q1wPhBxH/Gnvd4HlznB7rwZvJg=
X-Google-Smtp-Source: AGHT+IE7foSY+Dx2N5bmgzzoWLNyF/v3T+JuHVyumUdu2biAyJgYRltBRPWbCD/dA9o3J15XrHunE5FfBHCNomI2V2Y=
X-Received: by 2002:a17:906:c058:b0:a27:b278:b3e with SMTP id
 bm24-20020a170906c05800b00a27b2780b3emr2593812ejb.83.1705368292224; Mon, 15
 Jan 2024 17:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20240112084750.3729837-1-alexious@zju.edu.cn>
In-Reply-To: <20240112084750.3729837-1-alexious@zju.edu.cn>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 16 Jan 2024 09:24:37 +0800
Message-ID: <CAKGbVbswTUYJsZDLWao58MTyt7yAYMMXA5zjeYVBTRvd9X3n0g@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix a memleak in lima_heap_alloc
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

Thanks for the fix. As the error handling gets longer and duplicated,
could you rearrange them like the lima_gem_submit():
err_out2:
    dma_unmap_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
err_out1:
    kfree(bo->base.sgt);
    bo->base.sgt =3D NULL;
err_out0:
    sg_free_table(&sgt);
    return ret.

Regards,
Qiang

On Fri, Jan 12, 2024 at 4:49=E2=80=AFPM Zhipeng Lu <alexious@zju.edu.cn> wr=
ote:
>
> When lima_vm_map_bo fails, the resources need to be deallocated, or
> there will be memleaks.
>
> Fixes: 6aebc51d7aef ("drm/lima: support heap buffer creation")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  drivers/gpu/drm/lima/lima_gem.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 4f9736e5f929..824ed22141c7 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -92,8 +92,13 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm=
 *vm)
>
>         if (vm) {
>                 ret =3D lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
> -               if (ret)
> +               if (ret) {
> +                       dma_unmap_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0=
);
> +                       sg_free_table(&sgt);
> +                       kfree(bo->base.sgt);
> +                       bo->base.sgt =3D NULL;
>                         return ret;
> +               }
>         }
>
>         bo->heap_size =3D new_size;
> --
> 2.34.1
>
