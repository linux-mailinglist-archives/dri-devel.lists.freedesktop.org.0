Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E083FB2A1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE4489BB2;
	Mon, 30 Aug 2021 08:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248E389C07;
 Mon, 30 Aug 2021 08:40:09 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id e129so26583546yba.5;
 Mon, 30 Aug 2021 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uJeGcPCDj23JXaCaHp+GvPkNdf/R0K6jzLG98uAI6Ug=;
 b=jbengxmHkizc89iLxUU9phkL2h8Y0v+4+TRjntRyj9EEjsVm8DhvxUuGPHctjzpSo5
 z5qTOJtufDFWR0LOFdHAe7fIl/MwfICPbtn7rQy5fkiYgCWf1F1h+ejFjTjrKafHiZfV
 vIiffEe+zu3N5UgCUB8oTcF2UpZVTKSTrKaPSZMTZ964E56ld/WoYny318jxolloPwkP
 Sf4uEEURSWQhRtbh7bRshKqy38Ppu/3jF6GHROBpodw5jJac3m1VlQnTU12+iQ/3JQBS
 NtiwJpyONZwNRwCLTbXqlgKXLnM0MFwUW+Dm3Wm8QkfFjaMhDyrFTZqVBtoYdi6WStXN
 AN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uJeGcPCDj23JXaCaHp+GvPkNdf/R0K6jzLG98uAI6Ug=;
 b=d4LfH4ycCp54+kdim0ujyzhTfUR6MHlYZEO9Sj4NtAyrpXn9ALOoECMNpWG+4hqdNa
 sQ6+MBKqxRuyWDDuvrph7FLClKz3SgB/7qCpn+RB5MZIwF9nybeE4wQzsxT1SiIdofzL
 LRGB7C6pGOR7yTKZ0mDMYKaN0LRfeo0MUkBTn4lg2jga9Qrsab5N03KAKKLHr74fy2M1
 EuYNYzhLz/dLrnO7IE5ckLNEDpSXRDC0Nq6KMk37eG/mCEt2/smKgF04QByAJ2MQxdqx
 Xu46/Rv76JCUY/C13FfhYUgFLMu+kwi/P6ZkJHR+oSgM0V8+y1gT4ngJHPiTiPmfKryu
 t2Mw==
X-Gm-Message-State: AOAM531M/zW2yCYSh2h1AseB1uKq3ux061UkjI++JiZ4Dkh/1zfVKd4f
 HCYhZDZvMH7dX+SO5Z9pvQVr4cRSHOl9jkIOjAw=
X-Google-Smtp-Source: ABdhPJzC/v0j59R1xCEusgt/5TryfCISfgyzb5gYyxa2afcQpTvYrsNvqhhfFUj6/iFVROVWDxUgiWmLdmQRGCo60UU=
X-Received: by 2002:a25:808b:: with SMTP id n11mr21312693ybk.141.1630312808168; 
 Mon, 30 Aug 2021 01:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210830074835.16596-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210830074835.16596-1-thomas.hellstrom@linux.intel.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 30 Aug 2021 18:39:57 +1000
Message-ID: <CACAvsv5dCy18iKFfF2xpUg13OSPv5_YHkCi6SLkWTXssiny2xw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct
 ttm_resource
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Mon, 30 Aug 2021 at 17:48, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The code was making a copy of a struct ttm_resource. However,
> recently the struct ttm_resources were allowed to be subclassed and
> also were allowed to be malloced, hence the driver could end up assuming
> the copy we handed it was subclassed and worse, the original could have
> been freed at this point.
>
> Fix this by using the original struct ttm_resource before it is
> potentially freed in ttm_bo_move_sync_cleanup()
>
> Reported-by: Ben Skeggs <skeggsb@gmail.com>
> Reported-by: Dave Airlie <airlied@gmail.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-bas=
ed iomem")
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
That's basically identical to what I came up with locally, so:

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 5c20d0541cc3..c893c3db2623 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -139,7 +139,6 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>         struct ttm_resource *src_mem =3D bo->resource;
>         struct ttm_resource_manager *src_man =3D
>                 ttm_manager_type(bdev, src_mem->mem_type);
> -       struct ttm_resource src_copy =3D *src_mem;
>         union {
>                 struct ttm_kmap_iter_tt tt;
>                 struct ttm_kmap_iter_linear_io io;
> @@ -173,11 +172,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo=
,
>         if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLO=
C)))
>                 ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_=
iter);
>
> -       src_copy =3D *src_mem;
> +       if (!src_iter->ops->maps_tt)
> +               ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem=
);
>         ttm_bo_move_sync_cleanup(bo, dst_mem);
>
> -       if (!src_iter->ops->maps_tt)
> -               ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_co=
py);
>  out_src_iter:
>         if (!dst_iter->ops->maps_tt)
>                 ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem=
);
> --
> 2.31.1
>
