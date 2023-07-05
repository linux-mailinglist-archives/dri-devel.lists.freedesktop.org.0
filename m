Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670D748248
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 12:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60910E352;
	Wed,  5 Jul 2023 10:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4C10E350;
 Wed,  5 Jul 2023 10:37:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so10169312e87.1; 
 Wed, 05 Jul 2023 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688553472; x=1691145472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xVSvOcV+LZn4zU+s2TEYvGGlksk65ytp81aGhpNe5PU=;
 b=rerGBByjN3TXlNvmBGIGnG3oSpzqu3fy4mtFmUgRHI+ZIy8HokNSaDpg88Lel6qDKX
 nhhhtgPo5rEcuT6moKqsB09N1cy8eQLqzVNc1ze0fOpTs6cpph8kUN+N3BI5q/fvJFX5
 q94Nvxr2LW+VUZUx7xpvmzNo705Gx0vWSUtVNZQWxW9AElkInRCjyhAg5zoE2OeN/m4M
 waPNDtS+nfpSxOk4HC1QD9RgUJBvZSwUl6FY56f15oBIFc807hIBKbRF9QMecp3TLand
 YZps5PGF887lgNGS195mgPwRZf/lTOGG0rB5mMYOFXZpQP7fxtzBwLT9Vev/GVCjH4Eb
 usjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688553472; x=1691145472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVSvOcV+LZn4zU+s2TEYvGGlksk65ytp81aGhpNe5PU=;
 b=YVTdgK4/xVwh4QcTBc5FQttLRsQ5IYuCyIyUUnZs9fbZqrJMOI+GyPBNdSjZ2IEq8d
 OQtyphn01wTymJZi3U52GmKYnhBWS/ylE0WZfnwjF+hzUbDx64ryrvN11tIWxgPBdS2R
 9omMvBAzasylknuJHMprqFhRCrBKUDT97t1gkki9xtqqY1SHFKmSiGTnaLaWTOE4BWzD
 ohQoqDnAO+xEdCrPGVan5l+GffS53061mwYzSJ4KwsoKeRIXTyUFGk1AFXmqAnMQ7WFQ
 EVP0WtmARMYFiAIfI8jQv8jCJc9qTun+sZbQcVSfYaeIsLGITvM+WO5EWDQMV1wTCXtM
 6AeQ==
X-Gm-Message-State: ABy/qLax8eiejANWB6McpX2nx/eSIqvkGhZwhcb6bQ8t5WsEpOB/VvhC
 68F7CGsRzLZMx1VHgI9Ip16WKHMiYD6n4j26bxyWc9q+0mU=
X-Google-Smtp-Source: APBJJlH+rjY+u1Rhec+Hh0UaknkV+BjFWMokHPqTP7onKmj6rdhEQtKdp6VSKIuy6g8sROZfuk4dH+8OREFVrKaOp+g=
X-Received: by 2002:a05:6512:70c:b0:4fb:7b4c:d38c with SMTP id
 b12-20020a056512070c00b004fb7b4cd38cmr10389420lfs.60.1688553472068; Wed, 05
 Jul 2023 03:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230705100732.432835-1-Lang.Yu@amd.com>
In-Reply-To: <20230705100732.432835-1-Lang.Yu@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 Jul 2023 11:37:24 +0100
Message-ID: <CAM0jSHN7=8Kbnm2oTnSQ4HZd0sv+nf6R5nEfyXdmHedsr-t6rw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: fix one use-after-free
To: Lang Yu <Lang.Yu@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jul 2023 at 11:08, Lang Yu <Lang.Yu@amd.com> wrote:
>
> bo->kref is increased once(kref_init()) in ttm_bo_release,
> but decreased twice(ttm_bo_put()) respectively in
> ttm_bo_delayed_delete and ttm_bo_cleanup_refs,
> which is unbalanced.
>
> Just clean up bo resource in one place for a delayed deleted bo.
>
> Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")
>
> [   67.399887] refcount_t: underflow; use-after-free.
> [   67.399901] WARNING: CPU: 0 PID: 3172 at lib/refcount.c:28 refcount_warn_saturate+0xc2/0x110
> [   67.400124] RIP: 0010:refcount_warn_saturate+0xc2/0x110
> [   67.400173] Call Trace:
> [   67.400176]  <TASK>
> [   67.400181]  ttm_mem_evict_first+0x4fe/0x5b0 [ttm]
> [   67.400216]  ttm_bo_mem_space+0x1e3/0x240 [ttm]
> [   67.400239]  ttm_bo_validate+0xc7/0x190 [ttm]
> [   67.400253]  ? ww_mutex_trylock+0x1b1/0x390
> [   67.400266]  ttm_bo_init_reserved+0x183/0x1c0 [ttm]
> [   67.400280]  ? __rwlock_init+0x3d/0x70
> [   67.400292]  amdgpu_bo_create+0x1cd/0x4f0 [amdgpu]
> [   67.400607]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
> [   67.400980]  amdgpu_bo_create_user+0x38/0x70 [amdgpu]
> [   67.401291]  amdgpu_gem_object_create+0x77/0xb0 [amdgpu]
> [   67.401641]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
> [   67.401958]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x228/0xa30 [amdgpu]
> [   67.402433]  kfd_ioctl_alloc_memory_of_gpu+0x14e/0x390 [amdgpu]
> [   67.402824]  ? lock_release+0x13f/0x290
> [   67.402838]  kfd_ioctl+0x1e0/0x640 [amdgpu]
> [   67.403205]  ? __pfx_kfd_ioctl_alloc_memory_of_gpu+0x10/0x10 [amdgpu]
> [   67.403579]  ? tomoyo_file_ioctl+0x19/0x20
> [   67.403590]  __x64_sys_ioctl+0x95/0xd0
> [   67.403601]  do_syscall_64+0x3b/0x90
> [   67.403609]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 89 ++++--------------------------------
>  1 file changed, 10 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 326a3d13a829..1e073dfb1332 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -224,82 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>         dma_resv_iter_end(&cursor);
>  }
>
> -/**
> - * ttm_bo_cleanup_refs
> - * If bo idle, remove from lru lists, and unref.
> - * If not idle, block if possible.
> - *
> - * Must be called with lru_lock and reservation held, this function
> - * will drop the lru lock and optionally the reservation lock before returning.
> - *
> - * @bo:                    The buffer object to clean-up
> - * @interruptible:         Any sleeps should occur interruptibly.
> - * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> - * @unlock_resv:           Unlock the reservation lock as well.
> - */
> -
> -static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> -                              bool interruptible, bool no_wait_gpu,
> -                              bool unlock_resv)
> -{
> -       struct dma_resv *resv = &bo->base._resv;
> -       int ret;
> -
> -       if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
> -               ret = 0;
> -       else
> -               ret = -EBUSY;
> -
> -       if (ret && !no_wait_gpu) {
> -               long lret;
> -
> -               if (unlock_resv)
> -                       dma_resv_unlock(bo->base.resv);
> -               spin_unlock(&bo->bdev->lru_lock);
> -
> -               lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
> -                                            interruptible,
> -                                            30 * HZ);
> -
> -               if (lret < 0)
> -                       return lret;
> -               else if (lret == 0)
> -                       return -EBUSY;
> -
> -               spin_lock(&bo->bdev->lru_lock);
> -               if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> -                       /*
> -                        * We raced, and lost, someone else holds the reservation now,
> -                        * and is probably busy in ttm_bo_cleanup_memtype_use.
> -                        *
> -                        * Even if it's not the case, because we finished waiting any
> -                        * delayed destruction would succeed, so just return success
> -                        * here.
> -                        */
> -                       spin_unlock(&bo->bdev->lru_lock);
> -                       return 0;
> -               }
> -               ret = 0;
> -       }
> -
> -       if (ret) {
> -               if (unlock_resv)
> -                       dma_resv_unlock(bo->base.resv);
> -               spin_unlock(&bo->bdev->lru_lock);
> -               return ret;
> -       }
> -
> -       spin_unlock(&bo->bdev->lru_lock);
> -       ttm_bo_cleanup_memtype_use(bo);
> -
> -       if (unlock_resv)
> -               dma_resv_unlock(bo->base.resv);
> -
> -       ttm_bo_put(bo);

The put() here is indeed broken and leads to some nasty uaf I think,
but we fixed that a while back in: c00133a9e87e ("drm/ttm: drop extra
ttm_bo_put in ttm_bo_cleanup_refs"). It looks like you are using an
old tree? Perhaps the issue you are seeing was also fixed with that?

> -
> -       return 0;
> -}
> -
>  /*
>   * Block for the dma_resv object to become idle, lock the buffer and clean up
>   * the resource and tt object.
> @@ -622,8 +546,10 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>         }
>
>         if (bo->deleted) {
> -               ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
> -                                         ctx->no_wait_gpu, locked);
> +               if (locked)
> +                       dma_resv_unlock(bo->base.resv);
> +               spin_unlock(&bdev->lru_lock);
> +               ret = ttm_bo_wait_ctx(bo, ctx);
>                 ttm_bo_put(bo);
>                 return ret;
>         }
> @@ -1146,7 +1072,12 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>         }
>
>         if (bo->deleted) {
> -               ret = ttm_bo_cleanup_refs(bo, false, false, locked);
> +               struct ttm_operation_ctx ctx = { false, false };
> +
> +               if (locked)
> +                       dma_resv_unlock(bo->base.resv);
> +               spin_unlock(&bo->bdev->lru_lock);
> +               ret = ttm_bo_wait_ctx(bo, &ctx);
>                 ttm_bo_put(bo);
>                 return ret == -EBUSY ? -ENOSPC : ret;
>         }
> --
> 2.25.1
>
