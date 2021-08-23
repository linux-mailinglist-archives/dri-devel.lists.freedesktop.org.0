Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDF3F466B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E1589C7F;
	Mon, 23 Aug 2021 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C48089C7F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:10:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="204195253"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="204195253"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 01:10:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="514706133"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 01:10:44 -0700
Message-ID: <9bfdf5b8b9bb8890e1d7e0801b742196ffd1273e.camel@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/ttm: move the LRU into resource handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 23 Aug 2021 10:10:42 +0200
In-Reply-To: <20210719115145.1260-4-christian.koenig@amd.com>
References: <20210719115145.1260-1-christian.koenig@amd.com>
 <20210719115145.1260-4-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-07-19 at 13:51 +0200, Christian König wrote:
> This way we finally fix the problem that new resource are
> not immediately evict-able after allocation.
> 
> That has caused numerous problems including OOM on GDS handling
> and not being able to use TTM as general resource manager.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c            | 101 ++-----------------
>  drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
>  drivers/gpu/drm/ttm/ttm_device.c        |   4 +-
>  drivers/gpu/drm/ttm/ttm_resource.c      | 127
> ++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo_api.h            |  16 ---
>  include/drm/ttm/ttm_bo_driver.h         |  29 +-----
>  include/drm/ttm/ttm_resource.h          |  35 +++++++
>  9 files changed, 177 insertions(+), 146 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 18246b5b6ee3..4b178a74b4e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -643,12 +643,12 @@ void amdgpu_vm_move_to_lru_tail(struct
> amdgpu_device *adev,
>  
>         if (vm->bulk_moveable) {
>                 spin_lock(&adev->mman.bdev.lru_lock);
> -               ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> +               ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>                 spin_unlock(&adev->mman.bdev.lru_lock);
>                 return;
>         }
>  
> -       memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
> +       ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>  
>         spin_lock(&adev->mman.bdev.lru_lock);
>         list_for_each_entry(bo_base, &vm->idle, vm_status) {
> @@ -658,11 +658,9 @@ void amdgpu_vm_move_to_lru_tail(struct
> amdgpu_device *adev,
>                 if (!bo->parent)
>                         continue;
>  
> -               ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
> -                                       &vm->lru_bulk_move);
> +               ttm_bo_move_to_lru_tail(&bo->tbo, &vm-
> >lru_bulk_move);
>                 if (shadow)
>                         ttm_bo_move_to_lru_tail(&shadow->tbo,
> -                                               shadow->tbo.resource,
>                                                 &vm->lru_bulk_move);
>         }
>         spin_unlock(&adev->mman.bdev.lru_lock);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index bf33724bed5c..b38eef37f1c8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -472,7 +472,7 @@ static void i915_ttm_adjust_lru(struct
> drm_i915_gem_object *obj)
>                         bo->priority = I915_TTM_PRIO_NO_PAGES;
>         }
>  
> -       ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
> +       ttm_bo_move_to_lru_tail(bo, NULL);
>         spin_unlock(&bo->bdev->lru_lock);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5a2dc712c632..09a62ad06b9d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -69,95 +69,15 @@ static void ttm_bo_mem_space_debug(struct
> ttm_buffer_object *bo,
>         }
>  }
>  
> -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
> -{
> -       struct ttm_device *bdev = bo->bdev;
> -
> -       list_del_init(&bo->lru);
> -
> -       if (bdev->funcs->del_from_lru_notify)
> -               bdev->funcs->del_from_lru_notify(bo);
> -}
> -
> -static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos
> *pos,
> -                                    struct ttm_buffer_object *bo)
> -{
> -       if (!pos->first)
> -               pos->first = bo;
> -       pos->last = bo;
> -}
> -
>  void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
> -                            struct ttm_resource *mem,
>                              struct ttm_lru_bulk_move *bulk)
>  {
> -       struct ttm_device *bdev = bo->bdev;
> -       struct ttm_resource_manager *man;
> -
> -       if (!bo->deleted)
> -               dma_resv_assert_held(bo->base.resv);
> -
> -       if (bo->pin_count) {
> -               ttm_bo_del_from_lru(bo);
> -               return;
> -       }
> -
> -       man = ttm_manager_type(bdev, mem->mem_type);
> -       list_move_tail(&bo->lru, &man->lru[bo->priority]);
> -
> -       if (bdev->funcs->del_from_lru_notify)
> -               bdev->funcs->del_from_lru_notify(bo);
> -
> -       if (bulk && !bo->pin_count) {
> -               switch (bo->resource->mem_type) {
> -               case TTM_PL_TT:
> -                       ttm_bo_bulk_move_set_pos(&bulk->tt[bo-
> >priority], bo);
> -                       break;
> +       dma_resv_assert_held(bo->base.resv);
>  
> -               case TTM_PL_VRAM:
> -                       ttm_bo_bulk_move_set_pos(&bulk->vram[bo-
> >priority], bo);
> -                       break;
> -               }
> -       }
> +       ttm_resource_move_to_lru_tail(bo->resource, bulk);
>  }
>  EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
>  
> -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
> -{
> -       unsigned i;
> -
> -       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -               struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
> -               struct ttm_resource_manager *man;
> -
> -               if (!pos->first)
> -                       continue;
> -
> -               dma_resv_assert_held(pos->first->base.resv);
> -               dma_resv_assert_held(pos->last->base.resv);
> -
> -               man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
> -               list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> -                                   &pos->last->lru);
> -       }
> -
> -       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -               struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
> -               struct ttm_resource_manager *man;
> -
> -               if (!pos->first)
> -                       continue;
> -
> -               dma_resv_assert_held(pos->first->base.resv);
> -               dma_resv_assert_held(pos->last->base.resv);
> -
> -               man = ttm_manager_type(pos->first->bdev,
> TTM_PL_VRAM);
> -               list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> -                                   &pos->last->lru);
> -       }
> -}
> -EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
> -
>  static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>                                   struct ttm_resource *mem, bool
> evict,
>                                   struct ttm_operation_ctx *ctx,
> @@ -339,7 +259,6 @@ static int ttm_bo_cleanup_refs(struct
> ttm_buffer_object *bo,
>                 return ret;
>         }
>  
> -       ttm_bo_del_from_lru(bo);
>         list_del_init(&bo->ddestroy);
>         spin_unlock(&bo->bdev->lru_lock);
>         ttm_bo_cleanup_memtype_use(bo);
> @@ -440,7 +359,7 @@ static void ttm_bo_release(struct kref *kref)
>                  */
>                 if (bo->pin_count) {
>                         bo->pin_count = 0;
> -                       ttm_bo_move_to_lru_tail(bo, bo->resource,
> NULL);
> +                       ttm_resource_move_to_lru_tail(bo->resource,
> NULL);
>                 }
>  
>                 kref_init(&bo->kref);
> @@ -453,7 +372,6 @@ static void ttm_bo_release(struct kref *kref)
>         }
>  
>         spin_lock(&bo->bdev->lru_lock);
> -       ttm_bo_del_from_lru(bo);
>         list_del(&bo->ddestroy);
>         spin_unlock(&bo->bdev->lru_lock);
>  
> @@ -667,15 +585,17 @@ int ttm_mem_evict_first(struct ttm_device
> *bdev,
>                         struct ww_acquire_ctx *ticket)
>  {
>         struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> +       struct ttm_resource *res;
>         bool locked = false;
>         unsigned i;
>         int ret;
>  
>         spin_lock(&bdev->lru_lock);
>         for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -               list_for_each_entry(bo, &man->lru[i], lru) {
> +               list_for_each_entry(res, &man->lru[i], lru) {
>                         bool busy;
>  
> +                       bo = res->bo;

Follow up to previous review: What happens here if someone now
reassigns @res->bo and then kills @bo. At least it's not immediately
clear what's protecting from that. Isn't a kref_get_unless_zero() on
the bo needed here, and res->bo being assigned (and properly cleared on
bo destruction) under the lru_lock when needed?

Admittedly as you pointed out earlier we can't kref_put() the bo under
the lru lock but (if all else fails) one could perhaps defer the put to
a worker, or move the bo to lru tail and drop the lru lock iff
kref_put() may hit a zero refcount.

/Thomas







