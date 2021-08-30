Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751173FAF9F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 03:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D22689C98;
	Mon, 30 Aug 2021 01:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616489D5E;
 Mon, 30 Aug 2021 01:54:20 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id t19so27795323ejr.8;
 Sun, 29 Aug 2021 18:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxsiSscGykjrFqq8NV9Iq8rhc1F7sw+otXN/4lad2y8=;
 b=QLN8nyCMD7KXtGf+YXaZFTj1i54xtrNhqT31OwN3JtpalHEvkARnjhrG19VbE6mVe3
 PjAw2rqOsg2XjvccegWaNencX1KG7Vic3QHSvIhE1TpkkHm7A7dp+TCe2GdgLfzrVC55
 eROJvW+RVjjPZZP0UwzTmF/aIv1sPa70fKHEgRmfahyX/kiTdfX8AjA5unORD7YkuEPz
 GFKo1uINFhQS/cVfHj5MOhf09jBDFtSzhaU9LvJSlHnpxFzjhS4nTja1CsTsYDzbvaae
 G0E02tswDBSNBufw8k4pHlM4K8JQoSA8S/zln4N0GARiVT3AUmJGi9UMdWgIf7VxQfkb
 5URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxsiSscGykjrFqq8NV9Iq8rhc1F7sw+otXN/4lad2y8=;
 b=p/CIE+O5Lem+gldHBN42gVuz+GvQELkoWkJxl1mwN6DLLR/4JZjHZ8KXI00lSowIAD
 Pu68nkLGrEVuhJNURvCNNwLnyLKLfvB7wyEfBYEEs5iVqCydkb2ZTXp1QWClLbexdewc
 6uvbE4kGwh9NMQqnIaz9k2rNZB40JDSbEySnloSr/HfI/UnGeCLFuT/Ms4uU57vy9OKd
 BLPbsjj84xuHlOK30vvEJ2dTUMCh/CaRp4IhQ8T26YkEvOQufH1xzopvtX9iXn0XUUzw
 ohlHrlV3mKfkDiEczUPvOSqHcXHgkd7Rp/twtVJ1RrJhH1PLO7HE+VROuNy/rqGCb8F+
 5mXg==
X-Gm-Message-State: AOAM530+gUJNtWnPBepdE2xgip2YT9rDNUw/md1Axdh8BD9X6bdcWUU3
 ekkuBjfV/4wZwo53f7RhhqeqPx23K7lsMRYKiQ8=
X-Google-Smtp-Source: ABdhPJxq1Ao3hWRIXGiAf7IYwhJ5V75f6h2J1sRj0PPGktvAVhvSzKE7SGDJCA3YfptqTEawZfamEKMjvyM/SYN2yvk=
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr22686084ejf.101.1630288458435; 
 Sun, 29 Aug 2021 18:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210602083818.241793-1-thomas.hellstrom@linux.intel.com>
 <20210602083818.241793-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210602083818.241793-4-thomas.hellstrom@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 30 Aug 2021 11:54:07 +1000
Message-ID: <CAPM=9twjYTME6CPuNmn3S7A_ACUNhMOAY1QcpoOqAZ5RHM6JzA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v10 03/11] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Ben Skeggs <skeggsb@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

I've just been talking with Ben about nouveau having some issues since
this path,

ttm_resource can be subclassed by drivers, and the code below that
copies ttm_resources around pretty much seems to destroy that.


> +       struct ttm_resource *src_mem = &bo->mem;
> +       struct ttm_resource_manager *src_man =
> +               ttm_manager_type(bdev, src_mem->mem_type);
> +       struct ttm_resource src_copy = *src_mem;

This here ^^

> +       union {
> +               struct ttm_kmap_iter_tt tt;
> +               struct ttm_kmap_iter_linear_io io;
> +       } _dst_iter, _src_iter;
> +       struct ttm_kmap_iter *dst_iter, *src_iter;
> +       int ret = 0;
>
> -       /*
> -        * TTM might be null for moves within the same region.
> -        */
> -       if (ttm) {
> +       if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> +                   dst_man->use_tt)) {
>                 ret = ttm_tt_populate(bdev, ttm, ctx);
>                 if (ret)
> -                       goto out1;
> +                       return ret;
>         }
>
> -       for (i = 0; i < new_mem->num_pages; ++i) {
> -               if (old_iomap == NULL) {
> -                       pgprot_t prot = ttm_io_prot(bo, old_mem, PAGE_KERNEL);
> -                       ret = ttm_copy_ttm_io_page(ttm, new_iomap, i,
> -                                                  prot);
> -               } else if (new_iomap == NULL) {
> -                       pgprot_t prot = ttm_io_prot(bo, new_mem, PAGE_KERNEL);
> -                       ret = ttm_copy_io_ttm_page(ttm, old_iomap, i,
> -                                                  prot);
> -               } else {
> -                       ret = ttm_copy_io_page(new_iomap, old_iomap, i);
> -               }
> -               if (ret)
> -                       goto out1;
> +       dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, dst_mem);
> +       if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
> +               dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm);
> +       if (IS_ERR(dst_iter))
> +               return PTR_ERR(dst_iter);
> +
> +       src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, src_mem);
> +       if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
> +               src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm);
> +       if (IS_ERR(src_iter)) {
> +               ret = PTR_ERR(src_iter);
> +               goto out_src_iter;
>         }
> -       mb();
> -out2:
> -       old_copy = *old_mem;
>
> -       ttm_bo_assign_mem(bo, new_mem);
> -
> -       if (!man->use_tt)
> -               ttm_bo_tt_destroy(bo);
> +       ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +       src_copy = *src_mem;
> +       ttm_bo_move_sync_cleanup(bo, dst_mem);
>
> -out1:
> -       ttm_resource_iounmap(bdev, old_mem, new_iomap);
> -out:
> -       ttm_resource_iounmap(bdev, &old_copy, old_iomap);
> +       if (!src_iter->ops->maps_tt)
> +               ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);

passes a copy into linear_io_fini which calls the driver io_mem_free
without the subclass data.

Dave.
