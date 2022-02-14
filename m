Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899D4B4921
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD93A8907C;
	Mon, 14 Feb 2022 10:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51898907C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:34:44 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id a19so14391148qvm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CW2hRwZIEhQrDRjvEssqANyIvpsUpUOE4q5arABVm7E=;
 b=RvtHbvHcA3lmcGmoELJ+TXYy8rk3zPVwLEkidHPkYQGXxfAhsdCn9IvPz4n5tc5qns
 BLYCVRItNCXdi2n3Y02ESp1+c8as/rJ1x9v9KkG+sE+wJj0wQTdKKU+XkGjVQnr7lTBB
 iPbESSpnNCtuA16XaY2Ibi3Hj+TQ8YRfK7BChh5bgeZnsb7yaldRLs5g4P6U6Cf+4oI0
 7n2Qt7urWc4GCZGO7CXcT30bnuOLA4YYd5b5YPHw0MYUmSRysYfDWl0f/ZVjei2lPRS5
 B/3v2GOik9zehxAUqwLCk26DZ5g2soETGZCJ6kTsOfXqbTD/e9qvR1pGpIr4ksRuCQ8g
 yP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CW2hRwZIEhQrDRjvEssqANyIvpsUpUOE4q5arABVm7E=;
 b=6katLfsI/3jwIIoxPiHQA8FSC/h0+eqKI+RNPlYOmDE6gPILzcu+2jP+IzbAB9nv0q
 8XY/ugPBWFPyW9DbEf0sGBy4mFRZKp1MnM50/RqX1oFbBPfoyZKCCesPLw/0EDUbmpa+
 RgIDDNs/168SMrdGfJt9/UKYnj4FSufTaDiJErFqXaqqZFSZeR/n070keoYFvNdEt5f/
 bsRYZyIKXugMnb4akCq5KS5uzD79ZgaRH0xN2VjmrSHK00c67P/tn9HA7N0UZgq+S5W2
 Ox/EVx9j8bZJCDT8fZdSXrnSvd1YBJZ3WsyhzYlx3T0ScKl62CtM30QzSxTz4M8pewMp
 R95g==
X-Gm-Message-State: AOAM530rqqy9TgkNtYTSUlKEaT2BLABE1P5vpiioFRthlycgaTsllWzU
 +p7GhWTyR1uZDwGkhDBSSGq/52+sSyuEu9nDH9TasCKpNp/wbg==
X-Google-Smtp-Source: ABdhPJwrSdHx2aAsSk6kgXfKRBbBkSKIXlQ+6hEcLKXSpLLivcWUjLjSoQzIWOJFnI+gSJEi5gk6cA2XN+jZYtzJRrY=
X-Received: by 2002:a05:6214:c88:: with SMTP id
 r8mr2732808qvr.21.1644834883830; 
 Mon, 14 Feb 2022 02:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-2-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-2-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 10:34:17 +0000
Message-ID: <CAM0jSHO-h5i8yrX+eDf8P-5GL=4m-5t3ENkEb0HHjU3pU5fomw@mail.gmail.com>
Subject: Re: [PATCH 02/11] drm/ttm: add common accounting to the resource mgr
 v3
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
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 09:34, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> It makes sense to have this in the common manager for debugging and
> accounting of how much resources are used.
>
> v2: cleanup kerneldoc a bit
> v3: drop the atomic, update counter under lock instead
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com> (v1)
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_resource.h     | 11 +++++++++--
>  2 files changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index ae40e144e728..bbb8a0f7aa14 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -41,6 +41,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res)
>  {
> +       struct ttm_resource_manager *man;
> +
>         res->start =3D 0;
>         res->num_pages =3D PFN_UP(bo->base.size);
>         res->mem_type =3D place->mem_type;
> @@ -50,6 +52,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>         res->bus.is_iomem =3D false;
>         res->bus.caching =3D ttm_cached;
>         res->bo =3D bo;
> +
> +       man =3D ttm_manager_type(bo->bdev, place->mem_type);
> +       spin_lock(&bo->bdev->lru_lock);
> +       man->usage +=3D bo->base.size;
> +       spin_unlock(&bo->bdev->lru_lock);
>  }
>  EXPORT_SYMBOL(ttm_resource_init);
>
> @@ -65,6 +72,9 @@ EXPORT_SYMBOL(ttm_resource_init);
>  void ttm_resource_fini(struct ttm_resource_manager *man,
>                        struct ttm_resource *res)
>  {
> +       spin_lock(&man->bdev->lru_lock);
> +       man->usage -=3D res->bo->base.size;
> +       spin_unlock(&man->bdev->lru_lock);
>  }
>  EXPORT_SYMBOL(ttm_resource_fini);
>
> @@ -166,6 +176,7 @@ void ttm_resource_manager_init(struct ttm_resource_ma=
nager *man,
>         spin_lock_init(&man->move_lock);
>         man->bdev =3D bdev;
>         man->size =3D size;
> +       man->usage =3D 0;
>
>         for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
>                 INIT_LIST_HEAD(&man->lru[i]);
> @@ -226,6 +237,24 @@ int ttm_resource_manager_evict_all(struct ttm_device=
 *bdev,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>
> +/**
> + * ttm_resource_manager_usage
> + *
> + * @man: A memory manager object.
> + *
> + * Return how many resources are currently used.

Maybe mention the units here?

"Return how many resources are currently used, in bytes."

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + */
> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
> +{
> +       uint64_t usage;
> +
> +       spin_lock(&man->bdev->lru_lock);
> +       usage =3D man->usage;
> +       spin_unlock(&man->bdev->lru_lock);
> +       return usage;
> +}
> +EXPORT_SYMBOL(ttm_resource_manager_usage);
> +
>  /**
>   * ttm_resource_manager_debug
>   *
> @@ -238,6 +267,7 @@ void ttm_resource_manager_debug(struct ttm_resource_m=
anager *man,
>         drm_printf(p, "  use_type: %d\n", man->use_type);
>         drm_printf(p, "  use_tt: %d\n", man->use_tt);
>         drm_printf(p, "  size: %llu\n", man->size);
> +       drm_printf(p, "  usage: %llu\n", ttm_resource_manager_usage(man))=
;
>         if (man->func->debug)
>                 man->func->debug(man, p);
>  }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resourc=
e.h
> index 555a11fb8a7f..323c14a30c6b 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -27,6 +27,7 @@
>
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> +#include <linux/atomic.h>
>  #include <linux/dma-buf-map.h>
>  #include <linux/dma-fence.h>
>  #include <drm/drm_print.h>
> @@ -130,10 +131,15 @@ struct ttm_resource_manager {
>         struct dma_fence *move;
>
>         /*
> -        * Protected by the global->lru_lock.
> +        * Protected by the bdev->lru_lock.
>          */
> -
>         struct list_head lru[TTM_MAX_BO_PRIORITY];
> +
> +       /**
> +        * @usage: How much of the resources are used, protected by the
> +        * bdev->lru_lock.
> +        */
> +       uint64_t usage;
>  };
>
>  /**
> @@ -283,6 +289,7 @@ void ttm_resource_manager_init(struct ttm_resource_ma=
nager *man,
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>                                    struct ttm_resource_manager *man);
>
> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>                                 struct drm_printer *p);
>
> --
> 2.25.1
>
