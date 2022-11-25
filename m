Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C4638F98
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 19:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8E910E789;
	Fri, 25 Nov 2022 18:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DF110E789;
 Fri, 25 Nov 2022 18:18:58 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so3115118otl.10; 
 Fri, 25 Nov 2022 10:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mud0IdWnZA5/vZw/T0Fn4wNfLRdDkVHWWgkfE744iwg=;
 b=dnawR48LjXCGw6CfXW2m3FxrrPVwm3/fdiJIwDKzBAayRKjgtYviH59l1ynnJS0+sQ
 3dIBMeSc7JYwl0ry1oe1FNBcDUE9arWH5rM/zjwqnFSEkMQ/d8q/Ni9eydxGrussopKu
 f8Zz9JUwpdQjkR+m8TsTG0Ptti+OmGYnwwOUe1WrzFqrqDvuUMFon16L6ApxpBt2EQj2
 z8aO5153+5paPG6mdBilKhDViIHNvK4OuLkHvodbCeWIeb+8ByZ9JLz1sgcBef2LWgtz
 QWSIUmI/NB4w4vI1hqcpMAVYnogFpV+0oW7+wQpefTjx6J38z7KbL7hUmFHNS05XqvEH
 WcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mud0IdWnZA5/vZw/T0Fn4wNfLRdDkVHWWgkfE744iwg=;
 b=0qAr2hiB7w51NpVqJP1dLbZqIqERDeceQDp3jYtCAe/BKDouNeP1jmNyWz+aHGJa1v
 IHWjlk9p75JDuOmjI41qPBh6xapfBI0va4xGwlkc0r8YY9FuFBIb+pOh/v/F5Znopl/t
 wJKTGIByIsu+p9rFQpqCemCAy9Iorc5Ujqrjpu0IIcb5wf07CsH/chxdARKDgR6Fk4v1
 vg9k/eHx8wutSemk9Sgd8iLsukXvZX4D3qkDOVZvOsGzby3tkaOOJUa5NjMnD3g5O57C
 Zv8RQlU+Xl6A/OFGI77kOpnysrWAbK4l1ZOh3Bxx0k+mIipvSn3hSMilOCvMDaBwsvxV
 vkoQ==
X-Gm-Message-State: ANoB5pl2SVHqY/ljRPRBNFrXlRky37ojld14bFHlTVyRTZq4dMJA4dYC
 V35lspWAkfI+spU83JN4mRN9X28LE/yTipb1Ogg=
X-Google-Smtp-Source: AA0mqf5+jo7+zTlV4KtcgCDY+3kGfkbcSdUNGqt0t3QS5cBwjBZfBJf0VoatwfXE6OnVwNmHxM5Tj6JbNfeS1aioTRU=
X-Received: by 2002:a05:6830:1b62:b0:66c:7982:2d45 with SMTP id
 d2-20020a0568301b6200b0066c79822d45mr9930336ote.123.1669400337678; Fri, 25
 Nov 2022 10:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Nov 2022 13:18:46 -0500
Message-ID: <CADnq5_NFXJCOD7bLS7Ax5W09To_J6bBfCj4_+1tDP5r9kFxnvQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022 at 5:21 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> We already fallback to a dummy BO with no backing store when we
> allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.
>
> Drop all those workarounds and generalize this for GTT as well. This
> fixes ENOMEM issues with runaway applications which try to allocate/free
> GTT in a loop and are otherwise only limited by the CPU speed.
>
> The CS will wait for the cleanup of freed up BOs to satisfy the
> various domain specific limits and so effectively throttle those
> buggy applications down to a sane allocation behavior again.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

This looks like a good bug fix and unrelated to the rest of this series.
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
>  2 files changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index a0780a4e3e61..62e98f1ad770 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *ad=
ev, unsigned long size,
>         bp.resv =3D resv;
>         bp.preferred_domain =3D initial_domain;
>         bp.flags =3D flags;
> -       bp.domain =3D initial_domain;
> +       bp.domain =3D initial_domain | AMDGPU_GEM_DOMAIN_CPU;
>         bp.bo_ptr_size =3D sizeof(struct amdgpu_bo);
>
>         r =3D amdgpu_bo_create_user(adev, &bp, &ubo);
> @@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev,=
 void *data,
>         }
>
>         initial_domain =3D (u32)(0xffffffff & args->in.domains);
> -retry:
>         r =3D amdgpu_gem_object_create(adev, size, args->in.alignment,
> -                                    initial_domain,
> -                                    flags, ttm_bo_type_device, resv, &go=
bj);
> +                                    initial_domain, flags, ttm_bo_type_d=
evice,
> +                                    resv, &gobj);
>         if (r && r !=3D -ERESTARTSYS) {
> -               if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
> -                       flags &=3D ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED=
;
> -                       goto retry;
> -               }
> -
> -               if (initial_domain =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {
> -                       initial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;
> -                       goto retry;
> -               }
>                 DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu,=
 %d)\n",
>                                 size, initial_domain, args->in.alignment,=
 r);
>         }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 974e85d8b6cc..919bbea2e3ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>                 bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>
>         bo->tbo.bdev =3D &adev->mman.bdev;
> -       if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
> -                         AMDGPU_GEM_DOMAIN_GDS))
> -               amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU=
);
> -       else
> -               amdgpu_bo_placement_from_domain(bo, bp->domain);
> +       amdgpu_bo_placement_from_domain(bo, bp->domain);
>         if (bp->type =3D=3D ttm_bo_type_kernel)
>                 bo->tbo.priority =3D 1;
>
> --
> 2.34.1
>
