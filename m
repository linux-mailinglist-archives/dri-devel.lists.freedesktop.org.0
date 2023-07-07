Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6774B245
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A567810E596;
	Fri,  7 Jul 2023 13:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6497810E596
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 13:55:39 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5634808e16eso1388393eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688738138; x=1691330138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/+wx5GgG3eThZaJ2KMWHrOvcJKJp2TQJ+qHl7/vC6c=;
 b=OkdR85yaD0eana5sji3+MrZv4YRcuVYvIvvxVXon4o/1y/YcxZxsTL9mGc4iQRA9QB
 ovC1mBZZihMpNt3d9k8HHeYmnBPJZeKM+sYDZetsr0cxoL2bV7DM4BlyLdzfBDV8dJty
 tFw6p1ud/vVSOuHTvKIilp1HzwctPvhtjSU0h/qwG2fHrcthVfk9ptTuygordz93aVZE
 N69Vtl9CDZJTgrucybq0joTjxFMRBk4DO8V5XXwE8qIa/Ci277tYn4K451tf98IdiUEc
 5Jm8ai95LP4esve2yn7o0rpxlGFkhpBgLTrp+n5uxMYI0uOslbBptTENczJwNqyNad9O
 LhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688738138; x=1691330138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/+wx5GgG3eThZaJ2KMWHrOvcJKJp2TQJ+qHl7/vC6c=;
 b=gQh2H7FO9Tg/GxiRIApygxsF7uGBV/dqzj8WNAoCrqyeFRj/j6ugkPD0gUPkAe7BhL
 /BAqvHUhU/YhGu3uw2Sxt9849vUQZ1LC5ctwE0D+glshMVcbr5dW10kPpcBJ0rq8e7k2
 p4WKmmCVQfAmvdBzRUuFg1w0bA1kd/CYmdC+brMBGzaKIJ8IHpRsWixej2qS19DX6BpS
 vNw1IiyGLHwwj8FPeBN5YQ6hp1os/T12Vz6twvm8Y0/YbXbIsZnInA0pZnbP2xxpH1/Z
 l3J2iqxHrFQE06hDBiSOKd0hT5mPQXIho+xdab/fQqPbngmF+WQwkty9IoC1cLPjQr7s
 n1Zw==
X-Gm-Message-State: ABy/qLZyI+tmn/dHYOKv5wQqe8csh2nGCduIAnAGlM4QFWYo/qSGc+d8
 g2R8O1QptKe3K34pvQMMchbFuLJY72os76xYcSE=
X-Google-Smtp-Source: APBJJlEvhhCzsK5j/g5kFzJhK0SN5/p7AFs3MZYo52P9eIhCjtI8spMcnpRaZTiJYkVA+/CbfSnsbK1Ta+GTcbvii/k=
X-Received: by 2002:a4a:4942:0:b0:566:669d:bed0 with SMTP id
 z63-20020a4a4942000000b00566669dbed0mr4200555ooa.3.1688738138183; Fri, 07 Jul
 2023 06:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230707120826.3701-1-christian.koenig@amd.com>
In-Reply-To: <20230707120826.3701-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jul 2023 09:55:26 -0400
Message-ID: <CADnq5_PoZwx+qtHJXcVL3amWoJLn5OJ5GTG3vd8dP63Btdgk2w@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: never consider pinned BOs for eviction&swap
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
Cc: Pierre-eric.Pelloux-prayer@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 8:08=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> There is a small window where we have already incremented the pin count
> but not yet moved the bo from the lru to the pinned list.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1a1cfd675cc4..7139a522b2f3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -517,6 +517,12 @@ static bool ttm_bo_evict_swapout_allowable(struct tt=
m_buffer_object *bo,
>  {
>         bool ret =3D false;
>
> +       if (bo->pin_count) {
> +               *locked =3D false;
> +               *busy =3D false;
> +               return false;
> +       }
> +
>         if (bo->base.resv =3D=3D ctx->resv) {
>                 dma_resv_assert_held(bo->base.resv);
>                 if (ctx->allow_res_evict)
> --
> 2.34.1
>
