Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB44AEEFF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 11:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67A210E6EC;
	Wed,  9 Feb 2022 10:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048C10E6EB;
 Wed,  9 Feb 2022 10:10:15 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id o5so1367008qvm.3;
 Wed, 09 Feb 2022 02:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4s1Rq7hhmsvmzqQ8qd1nNImQlsr6h9TTk9RcGNTPNBU=;
 b=hhXXzXyztIIn/2yV9nnbNHr8o+21tmqmMz2rVOScqws1+PCA/5oXXTRlNPUmUnGaBM
 k8axiFg/MxNc+RRYkFHjtZyZ3h4bvHMxQYJneXE9H6l27l0CWIRMqDboGiv1RGcyYPcE
 63hR9PLIQsyGvvh38xS/W8G+MGTNJXttPI8azdNrSp7sPUzgS+op/V91GBDaz/PGaiNT
 Qto4BTD8bc/xAKx2HNQ0z7iA+MfjkLEwLwwSDjxfrvMEpEpEoA9r2rzRPmYJjRnioJEc
 u7GaZjSlhmBStaPn+6LeJkYopk4Va/Az7ERw3xB/xnk7aLZ54EfWzxwrh2D9N7Wk5fSL
 sqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4s1Rq7hhmsvmzqQ8qd1nNImQlsr6h9TTk9RcGNTPNBU=;
 b=jsEfpzHFJNr4dcawfkGpClTdQtNbmTXDRjrn9D76w2PA7lnRtne6rYD1YJGctqzJ6W
 qZZn0a2PlmVuf6AfxVSJ1xKQnWfwarGoRAVRjPV1WJrrA9OvhA8OzwZbxZ3XlAbN960a
 GhPUHG09hrcFa3yfOLuh7Rxp6pF+DmxfQlZuD80zpD/nQkaAwWQUidVggoKNEVFTV7eo
 I3RDFTghjQVYDaiP3TL5+47L177Td+/3ZAMf2WZI+JQ7w75vnAf/4dQfPxMYhKCO/KYo
 PZxJBuoXu4Zp0DOKAej4dzwVNp427YdiUdlVvZ1rh+xHlsgofvhRhQ8a3LjKCG3AziVd
 cMCQ==
X-Gm-Message-State: AOAM533B2gk7e27Lzb/NtQLxV1q4PkRPZPhqCWXuMQKtYoqI27GvHucn
 yvBdJpoXhquBsGGIAYkKV+mUa3nD1pw9IdxVzh4=
X-Google-Smtp-Source: ABdhPJzJWE+Gu7oPJtJiKZbktDIqZzcvF6a8+wOklkHbX3CTF6xWThGkWeNvAO/J1C2iwzt0f9bOJ3ONExVCpH15h50=
X-Received: by 2002:ad4:4ee9:: with SMTP id dv9mr910379qvb.41.1644401414504;
 Wed, 09 Feb 2022 02:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20220209084059.1042345-1-christian.koenig@amd.com>
 <20220209084059.1042345-3-christian.koenig@amd.com>
In-Reply-To: <20220209084059.1042345-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 9 Feb 2022 10:09:48 +0000
Message-ID: <CAM0jSHMVx+tstuauLGZ-hoijjiZv7LCJE6t6nJmdrT5k84KzOA@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/ttm: move the LRU into resource handling v3
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Feb 2022 at 08:41, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This way we finally fix the problem that new resource are
> not immediately evict-able after allocation.
>
> That has caused numerous problems including OOM on GDS handling
> and not being able to use TTM as general resource manager.
>
> v2: stop assuming in ttm_resource_fini that res->bo is still valid.
> v3: cleanup kerneldoc, add more lockdep annotation
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c            | 115 ++--------------------
>  drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
>  drivers/gpu/drm/ttm/ttm_device.c        |  64 ++++++-------
>  drivers/gpu/drm/ttm/ttm_resource.c      | 122 +++++++++++++++++++++++-
>  include/drm/ttm/ttm_bo_api.h            |  16 ----
>  include/drm/ttm/ttm_bo_driver.h         |  29 +-----
>  include/drm/ttm/ttm_resource.h          |  35 +++++++
>  9 files changed, 197 insertions(+), 195 deletions(-)

<snip>

>  /**
>   * ttm_resource_init - resource object constructure
>   * @bo: buffer object this resources is allocated for
> @@ -52,10 +156,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>         res->bus.is_iomem =3D false;
>         res->bus.caching =3D ttm_cached;
>         res->bo =3D bo;
> +       INIT_LIST_HEAD(&res->lru);
>
>         man =3D ttm_manager_type(bo->bdev, place->mem_type);
>         spin_lock(&bo->bdev->lru_lock);
>         man->usage +=3D bo->base.size;
> +       ttm_resource_move_to_lru_tail(res, NULL);
>         spin_unlock(&bo->bdev->lru_lock);
>  }
>  EXPORT_SYMBOL(ttm_resource_init);
> @@ -66,15 +172,21 @@ EXPORT_SYMBOL(ttm_resource_init);
>   * @res: the resource to clean up
>   *
>   * Should be used by resource manager backends to clean up the TTM resou=
rce
> - * objects before freeing the underlying structure. Counterpart of
> - * &ttm_resource_init
> + * objects before freeing the underlying structure. Makes sure the resou=
rce is
> + * removed from the LRU before destruction.
> + * Counterpart of &ttm_resource_init.
>   */
>  void ttm_resource_fini(struct ttm_resource_manager *man,
>                        struct ttm_resource *res)
>  {
> -       spin_lock(&man->bdev->lru_lock);
> -       man->usage -=3D res->bo->base.size;
> -       spin_unlock(&man->bdev->lru_lock);
> +       struct ttm_device *bdev =3D man->bdev;
> +
> +       spin_lock(&bdev->lru_lock);
> +       list_del_init(&res->lru);
> +       if (res->bo && bdev->funcs->del_from_lru_notify)
> +               bdev->funcs->del_from_lru_notify(res->bo);
> +       man->usage -=3D res->num_pages << PAGE_SHIFT;

Above we are using the bo->base.size for tracking usage, but here we
are using num_pages. Is it guaranteed that bo->base.size is always
page aligned? Do we need some kind of WARN_ON()? Perhaps also sanity
checking that usage =3D=3D 0 when tearing down the man?
