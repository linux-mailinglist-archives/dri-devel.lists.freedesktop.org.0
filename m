Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9BA33D0E9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 10:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC4E89826;
	Tue, 16 Mar 2021 09:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B08B89826
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 09:35:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k8so7053296wrc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=L8rmclrM30OQf+zoD/aRRNKaHVgJcN0eGvOhVUJESVY=;
 b=fK/FA++4FLle3cDw+w5XTukQNmnpuYt6o88AzMdabYXLVINA9muuJJHP8N1LRcVBnt
 Aph3+jpGhWLhAtWrv7yaOCnp7rivVpS+qJb6UFAEAJMfCNGfE/cZ8bvOJnJvzVszejhr
 S+oH7wQ/8YLi/TGmCxzRElOkXDZ4Pt5MO28hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L8rmclrM30OQf+zoD/aRRNKaHVgJcN0eGvOhVUJESVY=;
 b=C8l2U1XGPl/EfLnzQ1t9n9YRhIunZR12B+hg9OhQ3oWZE/8UfIhyrgagsED6i/7NnW
 Av12Iiir1pjXIhmL4C2Mtcmru+x01cepG+0uJoh3dHCwS7JJoX0tUfX5PUKbS4/JPubL
 9sKfYgnDuqXBHaB0TkaxDKzsOJ1l6TweHM1630Izdk7kbMoRvSPBTiQ6CdWh7r+vD3mu
 ShsU715bO4rHedfS+l2YTE8eHPxmKcBr0SiHWGgK54bzQBAWUBCjppx77hIHwnu/qRJP
 B7726fbCQYdogUKRAQMWoUR0TJgNTzVwzCLrIZbZOEJTEvC/K5XJI+mtYs/smW4SMfe/
 ADvA==
X-Gm-Message-State: AOAM531lxa/1Pr7J8nXqn0O07iwHn33d7Mu/KJUIrbnfCktCXxIIKKcR
 CU0SBNOPLZx0ZwbalmExGgAAKA4+Zhg5Lx7D
X-Google-Smtp-Source: ABdhPJwph7xyTcEmACpEtRAx+OuW+ADEmftHLOa7uYS/tHZ1VWQ0uTddQXrSxSCADHcoq25DycGqvA==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr3898982wru.264.1615887356892; 
 Tue, 16 Mar 2021 02:35:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm2529989wmi.6.2021.03.16.02.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 02:35:56 -0700 (PDT)
Date: Tue, 16 Mar 2021 10:35:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: switch to per device LRU lock
Message-ID: <YFB7+kSfBH485ZnF@phenom.ffwll.local>
References: <20210315160422.152528-1-christian.koenig@amd.com>
 <20210315160422.152528-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315160422.152528-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 15, 2021 at 05:04:22PM +0100, Christian K=F6nig wrote:
> Instead of having a global lock.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

I guess per zone lru lock is a lot more work since then we need to handle
ordering and ABBA deadlocks? s/zone/mem region/ I think is the proper ttm
lingo.
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  8 ++---
>  drivers/gpu/drm/qxl/qxl_release.c      |  5 +--
>  drivers/gpu/drm/ttm/ttm_bo.c           | 49 ++++++++++++--------------
>  drivers/gpu/drm/ttm/ttm_device.c       | 12 +++----
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c |  8 ++---
>  drivers/gpu/drm/ttm/ttm_resource.c     |  9 +++--
>  include/drm/ttm/ttm_bo_driver.h        |  4 +--
>  include/drm/ttm/ttm_device.h           |  4 +--
>  8 files changed, 43 insertions(+), 56 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 9d19078246c8..ae18c0e32347 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -638,15 +638,15 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_devic=
e *adev,
>  	struct amdgpu_vm_bo_base *bo_base;
>  =

>  	if (vm->bulk_moveable) {
> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&adev->mman.bdev.lru_lock);
>  		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&adev->mman.bdev.lru_lock);
>  		return;
>  	}
>  =

>  	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&adev->mman.bdev.lru_lock);
>  	list_for_each_entry(bo_base, &vm->idle, vm_status) {
>  		struct amdgpu_bo *bo =3D bo_base->bo;
>  =

> @@ -660,7 +660,7 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device =
*adev,
>  						&bo->shadow->tbo.mem,
>  						&vm->lru_bulk_move);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&adev->mman.bdev.lru_lock);
>  =

>  	vm->bulk_moveable =3D true;
>  }
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_=
release.c
> index f5845c96d414..b19f2f00b215 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -426,16 +426,13 @@ void qxl_release_fence_buffer_objects(struct qxl_re=
lease *release)
>  		       release->id | 0xf0000000, release->base.seqno);
>  	trace_dma_fence_emit(&release->base);
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> -
>  	list_for_each_entry(entry, &release->bos, head) {
>  		bo =3D entry->bo;
>  =

>  		dma_resv_add_shared_fence(bo->base.resv, &release->base);
> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
>  	ww_acquire_fini(&release->ticket);
>  }
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a1be88be357b..a8103c8718a3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -242,9 +242,9 @@ static int ttm_bo_individualize_resv(struct ttm_buffe=
r_object *bo)
>  		 * reference it any more. The only tricky case is the trylock on
>  		 * the resv object while holding the lru_lock.
>  		 */
> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&bo->bdev->lru_lock);
>  		bo->base.resv =3D &bo->base._resv;
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  	}
>  =

>  	return r;
> @@ -303,7 +303,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  =

>  		if (unlock_resv)
>  			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  =

>  		lret =3D dma_resv_wait_timeout_rcu(resv, true, interruptible,
>  						 30 * HZ);
> @@ -313,7 +313,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  		else if (lret =3D=3D 0)
>  			return -EBUSY;
>  =

> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&bo->bdev->lru_lock);
>  		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
>  			/*
>  			 * We raced, and lost, someone else holds the reservation now,
> @@ -323,7 +323,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  			 * delayed destruction would succeed, so just return success
>  			 * here.
>  			 */
> -			spin_unlock(&ttm_glob.lru_lock);
> +			spin_unlock(&bo->bdev->lru_lock);
>  			return 0;
>  		}
>  		ret =3D 0;
> @@ -332,13 +332,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
>  	if (ret || unlikely(list_empty(&bo->ddestroy))) {
>  		if (unlock_resv)
>  			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  		return ret;
>  	}
>  =

>  	ttm_bo_del_from_lru(bo);
>  	list_del_init(&bo->ddestroy);
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  	ttm_bo_cleanup_memtype_use(bo);
>  =

>  	if (unlock_resv)
> @@ -355,13 +355,12 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
>   */
>  bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct list_head removed;
>  	bool empty;
>  =

>  	INIT_LIST_HEAD(&removed);
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	while (!list_empty(&bdev->ddestroy)) {
>  		struct ttm_buffer_object *bo;
>  =

> @@ -372,24 +371,24 @@ bool ttm_bo_delayed_delete(struct ttm_device *bdev,=
 bool remove_all)
>  			continue;
>  =

>  		if (remove_all || bo->base.resv !=3D &bo->base._resv) {
> -			spin_unlock(&glob->lru_lock);
> +			spin_unlock(&bdev->lru_lock);
>  			dma_resv_lock(bo->base.resv, NULL);
>  =

> -			spin_lock(&glob->lru_lock);
> +			spin_lock(&bdev->lru_lock);
>  			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>  =

>  		} else if (dma_resv_trylock(bo->base.resv)) {
>  			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>  		} else {
> -			spin_unlock(&glob->lru_lock);
> +			spin_unlock(&bdev->lru_lock);
>  		}
>  =

>  		ttm_bo_put(bo);
> -		spin_lock(&glob->lru_lock);
> +		spin_lock(&bdev->lru_lock);
>  	}
>  	list_splice_tail(&removed, &bdev->ddestroy);
>  	empty =3D list_empty(&bdev->ddestroy);
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  =

>  	return empty;
>  }
> @@ -424,7 +423,7 @@ static void ttm_bo_release(struct kref *kref)
>  		ttm_bo_flush_all_fences(bo);
>  		bo->deleted =3D true;
>  =

> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&bo->bdev->lru_lock);
>  =

>  		/*
>  		 * Make pinned bos immediately available to
> @@ -438,17 +437,17 @@ static void ttm_bo_release(struct kref *kref)
>  =

>  		kref_init(&bo->kref);
>  		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  =

>  		schedule_delayed_work(&bdev->wq,
>  				      ((HZ / 100) < 1) ? 1 : HZ / 100);
>  		return;
>  	}
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	ttm_bo_del_from_lru(bo);
>  	list_del(&bo->ddestroy);
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  =

>  	ttm_bo_cleanup_memtype_use(bo);
>  	dma_resv_unlock(bo->base.resv);
> @@ -622,7 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  	unsigned i;
>  	int ret;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>  		list_for_each_entry(bo, &man->lru[i], lru) {
>  			bool busy;
> @@ -659,7 +658,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  	if (!bo) {
>  		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
>  			busy_bo =3D NULL;
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  		ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
>  		if (busy_bo)
>  			ttm_bo_put(busy_bo);
> @@ -673,7 +672,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  		return ret;
>  	}
>  =

> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  =

>  	ret =3D ttm_bo_evict(bo, ctx);
>  	if (locked)
> @@ -773,10 +772,9 @@ static int ttm_bo_mem_placement(struct ttm_buffer_ob=
ject *bo,
>  	mem->mem_type =3D place->mem_type;
>  	mem->placement =3D place->flags;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	ttm_bo_move_to_lru_tail(bo, mem, NULL);
> -	spin_unlock(&ttm_glob.lru_lock);
> -
> +	spin_unlock(&bo->bdev->lru_lock);
>  	return 0;
>  }
>  =

> @@ -1160,7 +1158,6 @@ EXPORT_SYMBOL(ttm_bo_wait);
>  int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ct=
x *ctx,
>  		   gfp_t gfp_flags)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	bool locked;
>  	int ret;
>  =

> @@ -1185,7 +1182,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, st=
ruct ttm_operation_ctx *ctx,
>  =

>  	ttm_bo_del_from_lru(bo);
>  	/* TODO: Cleanup the locking */
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  =

>  	/*
>  	 * Move to system cached
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 2c280fb1e992..924d892109e8 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -81,7 +81,6 @@ static int ttm_global_init(void)
>  	ttm_pool_mgr_init(num_pages * 50 / 100);
>  	ttm_tt_mgr_init();
>  =

> -	spin_lock_init(&glob->lru_lock);
>  	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
>  =

>  	if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> @@ -125,13 +124,12 @@ EXPORT_SYMBOL(ttm_global_swapout);
>  long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ct=
x *ctx,
>  			gfp_t gfp_flags)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct ttm_resource_manager *man;
>  	struct ttm_buffer_object *bo;
>  	unsigned i, j;
>  	int ret;
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>  		man =3D ttm_manager_type(bdev, i);
>  		if (!man || !man->use_tt)
> @@ -156,7 +154,7 @@ long ttm_device_swapout(struct ttm_device *bdev, stru=
ct ttm_operation_ctx *ctx,
>  			}
>  		}
>  	}
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_device_swapout);
> @@ -223,6 +221,7 @@ int ttm_device_init(struct ttm_device *bdev, struct t=
tm_device_funcs *funcs,
>  =

>  	bdev->vma_manager =3D vma_manager;
>  	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> +	spin_lock_init(&bdev->lru_lock);
>  	INIT_LIST_HEAD(&bdev->ddestroy);
>  	bdev->dev_mapping =3D mapping;
>  	mutex_lock(&ttm_global_mutex);
> @@ -235,7 +234,6 @@ EXPORT_SYMBOL(ttm_device_init);
>  =

>  void ttm_device_fini(struct ttm_device *bdev)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct ttm_resource_manager *man;
>  	unsigned i;
>  =

> @@ -252,11 +250,11 @@ void ttm_device_fini(struct ttm_device *bdev)
>  	if (ttm_bo_delayed_delete(bdev, true))
>  		pr_debug("Delayed destroy list was clean\n");
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		if (list_empty(&man->lru[0]))
>  			pr_debug("Swap list %d was clean\n", i);
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  =

>  	ttm_pool_fini(&bdev->pool);
>  	ttm_global_release();
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm=
/ttm_execbuf_util.c
> index 690ab97d52b7..071c48d672c6 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -51,14 +51,12 @@ void ttm_eu_backoff_reservation(struct ww_acquire_ctx=
 *ticket,
>  	if (list_empty(list))
>  		return;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo =3D entry->bo;
>  =

> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	if (ticket)
>  		ww_acquire_fini(ticket);
> @@ -154,7 +152,6 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ct=
x *ticket,
>  	if (list_empty(list))
>  		return;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo =3D entry->bo;
>  =

> @@ -162,10 +159,9 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_c=
tx *ticket,
>  			dma_resv_add_shared_fence(bo->base.resv, fence);
>  		else
>  			dma_resv_add_excl_fence(bo->base.resv, fence);
> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
>  	if (ticket)
>  		ww_acquire_fini(ticket);
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index ed1672a9f332..04f2eef653ab 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -91,7 +91,6 @@ int ttm_resource_manager_evict_all(struct ttm_device *b=
dev,
>  		.no_wait_gpu =3D false,
>  		.force_alloc =3D true
>  	};
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct dma_fence *fence;
>  	int ret;
>  	unsigned i;
> @@ -100,18 +99,18 @@ int ttm_resource_manager_evict_all(struct ttm_device=
 *bdev,
>  	 * Can't use standard list traversal since we're unlocking.
>  	 */
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>  		while (!list_empty(&man->lru[i])) {
> -			spin_unlock(&glob->lru_lock);
> +			spin_unlock(&bdev->lru_lock);
>  			ret =3D ttm_mem_evict_first(bdev, man, NULL, &ctx,
>  						  NULL);
>  			if (ret)
>  				return ret;
> -			spin_lock(&glob->lru_lock);
> +			spin_lock(&bdev->lru_lock);
>  		}
>  	}
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  =

>  	spin_lock(&man->move_lock);
>  	fence =3D dma_fence_get(man->move);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index d007feef7676..dbccac957f8f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -180,9 +180,9 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_=
buffer_object *bo,
>  static inline void
>  ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>  {
> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  }
>  =

>  static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index cda6efb4c34b..bae56d29e8ff 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -56,7 +56,6 @@ extern struct ttm_global {
>  	 */
>  =

>  	struct page *dummy_read_page;
> -	spinlock_t lru_lock;
>  =

>  	/**
>  	 * Protected by ttm_global_mutex.
> @@ -277,8 +276,9 @@ struct ttm_device {
>  	struct ttm_pool pool;
>  =

>  	/*
> -	 * Protected by the global:lru lock.
> +	 * Protection for the per manager LRU and ddestroy lists.
>  	 */
> +	spinlock_t lru_lock;
>  	struct list_head ddestroy;
>  =

>  	/*
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
