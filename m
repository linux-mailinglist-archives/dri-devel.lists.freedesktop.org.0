Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2A4E507D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8689810E675;
	Wed, 23 Mar 2022 10:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392A10E675
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:39:54 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id r13so1950360ejd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sWGyL8qUOBTDmeLNh1YHhECG8vUN2TwgqgPToOxztTQ=;
 b=JAXhRAz9J9q2+dLad7jjByk8GtYe/S1eBjJWMYm5GfNgiV40kh3qTsDerV8Yc+4RbT
 KPSYsEZfmKuBgc3pl9FOFvxMziw4kn8lgS1hGdTw6ui54cs3IefNoiGfzbguwts0i6F2
 Picjre2sl3vb6asUW7PteNO9jfYy5VokkOnt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sWGyL8qUOBTDmeLNh1YHhECG8vUN2TwgqgPToOxztTQ=;
 b=IR3TNut6Z6/l5soiq8GFKWHdTT5NV2QDBsU2M6MsT8dgWWiuiLu+Pa29b42A6JoxQr
 QzKTbpinKVFyTN9G5FGroSkrnC6u0ofNEo0f4YifYm3+DYJuXbT+ah2z2zMy+CZ+DcUk
 A6EmSILjKQOZY9hcfuqdSft/kKoteXJdtXX2XF2F74cpu2eC/aj2fGSKK291oPvE6Y1X
 Gf6eS4yhpRbuqBJKOgHWQcRnlAdy2FoCopVrZyCj2zpNDcvu01rO+tfIorE8oE7RsXue
 ThyrVyM6Cl+eM7FA1nUCs0lFDjg+GX58M6Fn+3bR2iLqcwgQGTKoTWIxTQ9OUUNPpLXH
 FQcQ==
X-Gm-Message-State: AOAM533XaIXA85VaS2vf3s4MlCgfgK0oV4l550eUAZY8eseZYvw11TI1
 jGYF4a7BgqPxvvF++xDbcetRVnWF/qmXryLsz/4=
X-Google-Smtp-Source: ABdhPJwfn0xgQo8JVU2j/Yg80Z94pCEZK+cgndT+kbn2jPXP8DD5trCjkDTH+0qoWuyiuy3VYPsVoQ==
X-Received: by 2002:a17:907:60d6:b0:6df:a099:e26e with SMTP id
 hv22-20020a17090760d600b006dfa099e26emr27909565ejc.34.1648031992302; 
 Wed, 23 Mar 2022 03:39:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ga5-20020a1709070c0500b006de43e9605asm9718569ejc.181.2022.03.23.03.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:39:51 -0700 (PDT)
Date: Wed, 23 Mar 2022 11:39:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Message-ID: <Yjr49uihoRadEpUv@phenom.ffwll.local>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <Yjr31qQyWxaEbkmZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yjr31qQyWxaEbkmZ@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: felix.kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 11:35:02AM +0100, Daniel Vetter wrote:
> On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
> > This way we finally fix the problem that new resource are
> > not immediately evict-able after allocation.
> > 
> > That has caused numerous problems including OOM on GDS handling
> > and not being able to use TTM as general resource manager.
> > 
> > v2: stop assuming in ttm_resource_fini that res->bo is still valid.
> > v3: cleanup kerneldoc, add more lockdep annotation
> > v4: consistently use res->num_pages
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

One thing I've forgotten: Compared to v1 you moved away from atomic64_t
for res->usage, which is nice and cleaner and great, but not mentioned in
the commit message :-) Maybe add that too.
-Daniel

> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
> >  drivers/gpu/drm/ttm/ttm_bo.c            | 115 ++--------------------
> >  drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
> >  drivers/gpu/drm/ttm/ttm_device.c        |  64 ++++++------
> >  drivers/gpu/drm/ttm/ttm_resource.c      | 124 ++++++++++++++++++++++--
> >  include/drm/ttm/ttm_bo_api.h            |  16 ---
> >  include/drm/ttm/ttm_bo_driver.h         |  29 +-----
> >  include/drm/ttm/ttm_resource.h          |  35 +++++++
> >  9 files changed, 198 insertions(+), 196 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index b37fc7d7d2c7..f2ce5a0defd9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -683,12 +683,12 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
> >  
> >  	if (vm->bulk_moveable) {
> >  		spin_lock(&adev->mman.bdev.lru_lock);
> > -		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> > +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> >  		spin_unlock(&adev->mman.bdev.lru_lock);
> >  		return;
> >  	}
> >  
> > -	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
> > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> >  
> >  	spin_lock(&adev->mman.bdev.lru_lock);
> >  	list_for_each_entry(bo_base, &vm->idle, vm_status) {
> > @@ -698,11 +698,9 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
> >  		if (!bo->parent)
> >  			continue;
> >  
> > -		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
> > -					&vm->lru_bulk_move);
> > +		ttm_bo_move_to_lru_tail(&bo->tbo, &vm->lru_bulk_move);
> >  		if (shadow)
> >  			ttm_bo_move_to_lru_tail(&shadow->tbo,
> > -						shadow->tbo.resource,
> >  						&vm->lru_bulk_move);
> >  	}
> >  	spin_unlock(&adev->mman.bdev.lru_lock);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index de3fe79b665a..582e8dc9bc8c 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -849,7 +849,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
> >  			bo->priority = I915_TTM_PRIO_NO_PAGES;
> >  	}
> >  
> > -	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
> > +	ttm_bo_move_to_lru_tail(bo, NULL);
> >  	spin_unlock(&bo->bdev->lru_lock);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index db3dc7ef5382..cb0fa932d495 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -69,108 +69,16 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
> >  	}
> >  }
> >  
> > -static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object *bo)
> > -{
> > -	struct ttm_device *bdev = bo->bdev;
> > -
> > -	list_move_tail(&bo->lru, &bdev->pinned);
> > -
> > -	if (bdev->funcs->del_from_lru_notify)
> > -		bdev->funcs->del_from_lru_notify(bo);
> > -}
> > -
> > -static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
> > -{
> > -	struct ttm_device *bdev = bo->bdev;
> > -
> > -	list_del_init(&bo->lru);
> > -
> > -	if (bdev->funcs->del_from_lru_notify)
> > -		bdev->funcs->del_from_lru_notify(bo);
> > -}
> > -
> > -static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
> > -				     struct ttm_buffer_object *bo)
> > -{
> > -	if (!pos->first)
> > -		pos->first = bo;
> > -	pos->last = bo;
> > -}
> > -
> >  void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
> > -			     struct ttm_resource *mem,
> >  			     struct ttm_lru_bulk_move *bulk)
> >  {
> > -	struct ttm_device *bdev = bo->bdev;
> > -	struct ttm_resource_manager *man;
> > -
> > -	if (!bo->deleted)
> > -		dma_resv_assert_held(bo->base.resv);
> > -
> > -	if (bo->pin_count) {
> > -		ttm_bo_move_to_pinned(bo);
> > -		return;
> > -	}
> > -
> > -	if (!mem)
> > -		return;
> > -
> > -	man = ttm_manager_type(bdev, mem->mem_type);
> > -	list_move_tail(&bo->lru, &man->lru[bo->priority]);
> > -
> > -	if (bdev->funcs->del_from_lru_notify)
> > -		bdev->funcs->del_from_lru_notify(bo);
> > -
> > -	if (bulk && !bo->pin_count) {
> > -		switch (bo->resource->mem_type) {
> > -		case TTM_PL_TT:
> > -			ttm_bo_bulk_move_set_pos(&bulk->tt[bo->priority], bo);
> > -			break;
> > +	dma_resv_assert_held(bo->base.resv);
> >  
> > -		case TTM_PL_VRAM:
> > -			ttm_bo_bulk_move_set_pos(&bulk->vram[bo->priority], bo);
> > -			break;
> > -		}
> > -	}
> > +	if (bo->resource)
> > +		ttm_resource_move_to_lru_tail(bo->resource, bulk);
> >  }
> >  EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
> >  
> > -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
> > -{
> > -	unsigned i;
> > -
> > -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> > -		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
> > -		struct ttm_resource_manager *man;
> > -
> > -		if (!pos->first)
> > -			continue;
> > -
> > -		dma_resv_assert_held(pos->first->base.resv);
> > -		dma_resv_assert_held(pos->last->base.resv);
> > -
> > -		man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
> > -		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> > -				    &pos->last->lru);
> > -	}
> > -
> > -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> > -		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
> > -		struct ttm_resource_manager *man;
> > -
> > -		if (!pos->first)
> > -			continue;
> > -
> > -		dma_resv_assert_held(pos->first->base.resv);
> > -		dma_resv_assert_held(pos->last->base.resv);
> > -
> > -		man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
> > -		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> > -				    &pos->last->lru);
> > -	}
> > -}
> > -EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
> > -
> >  static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
> >  				  struct ttm_resource *mem, bool evict,
> >  				  struct ttm_operation_ctx *ctx,
> > @@ -344,7 +252,6 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> >  		return ret;
> >  	}
> >  
> > -	ttm_bo_move_to_pinned(bo);
> >  	list_del_init(&bo->ddestroy);
> >  	spin_unlock(&bo->bdev->lru_lock);
> >  	ttm_bo_cleanup_memtype_use(bo);
> > @@ -445,7 +352,7 @@ static void ttm_bo_release(struct kref *kref)
> >  		 */
> >  		if (bo->pin_count) {
> >  			bo->pin_count = 0;
> > -			ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
> > +			ttm_resource_move_to_lru_tail(bo->resource, NULL);
> >  		}
> >  
> >  		kref_init(&bo->kref);
> > @@ -458,7 +365,6 @@ static void ttm_bo_release(struct kref *kref)
> >  	}
> >  
> >  	spin_lock(&bo->bdev->lru_lock);
> > -	ttm_bo_del_from_lru(bo);
> >  	list_del(&bo->ddestroy);
> >  	spin_unlock(&bo->bdev->lru_lock);
> >  
> > @@ -673,15 +579,17 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >  			struct ww_acquire_ctx *ticket)
> >  {
> >  	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> > +	struct ttm_resource *res;
> >  	bool locked = false;
> >  	unsigned i;
> >  	int ret;
> >  
> >  	spin_lock(&bdev->lru_lock);
> >  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> > -		list_for_each_entry(bo, &man->lru[i], lru) {
> > +		list_for_each_entry(res, &man->lru[i], lru) {
> >  			bool busy;
> >  
> > +			bo = res->bo;
> >  			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> >  							    &locked, &busy)) {
> >  				if (busy && !busy_bo && ticket !=
> > @@ -699,7 +607,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >  		}
> >  
> >  		/* If the inner loop terminated early, we have our candidate */
> > -		if (&bo->lru != &man->lru[i])
> > +		if (&res->lru != &man->lru[i])
> >  			break;
> >  
> >  		bo = NULL;
> > @@ -875,9 +783,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> >  	}
> >  
> >  error:
> > -	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
> > -		ttm_bo_move_to_lru_tail_unlocked(bo);
> > -
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(ttm_bo_mem_space);
> > @@ -971,7 +876,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
> >  	bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
> >  
> >  	kref_init(&bo->kref);
> > -	INIT_LIST_HEAD(&bo->lru);
> >  	INIT_LIST_HEAD(&bo->ddestroy);
> >  	bo->bdev = bdev;
> >  	bo->type = type;
> > @@ -1021,8 +925,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
> >  		return ret;
> >  	}
> >  
> > -	ttm_bo_move_to_lru_tail_unlocked(bo);
> > -
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(ttm_bo_init_reserved);
> > @@ -1123,7 +1025,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> >  		return ret == -EBUSY ? -ENOSPC : ret;
> >  	}
> >  
> > -	ttm_bo_move_to_pinned(bo);
> >  	/* TODO: Cleanup the locking */
> >  	spin_unlock(&bo->bdev->lru_lock);
> >  
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 544a84fa6589..0163e92b57af 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -231,7 +231,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
> >  
> >  	atomic_inc(&ttm_glob.bo_count);
> >  	INIT_LIST_HEAD(&fbo->base.ddestroy);
> > -	INIT_LIST_HEAD(&fbo->base.lru);
> >  	fbo->base.moving = NULL;
> >  	drm_vma_node_reset(&fbo->base.base.vma_node);
> >  
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> > index be24bb6cefd0..ba35887147ba 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -144,6 +144,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> >  {
> >  	struct ttm_resource_manager *man;
> >  	struct ttm_buffer_object *bo;
> > +	struct ttm_resource *res;
> >  	unsigned i, j;
> >  	int ret;
> >  
> > @@ -154,8 +155,11 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> >  			continue;
> >  
> >  		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> > -			list_for_each_entry(bo, &man->lru[j], lru) {
> > -				uint32_t num_pages = PFN_UP(bo->base.size);
> > +			list_for_each_entry(res, &man->lru[j], lru) {
> > +				uint32_t num_pages;
> > +
> > +				bo = res->bo;
> > +				num_pages = PFN_UP(bo->base.size);
> >  
> >  				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> >  				/* ttm_bo_swapout has dropped the lru_lock */
> > @@ -259,49 +263,45 @@ void ttm_device_fini(struct ttm_device *bdev)
> >  }
> >  EXPORT_SYMBOL(ttm_device_fini);
> >  
> > -void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
> > +static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
> > +					      struct list_head *list)
> >  {
> > -	struct ttm_resource_manager *man;
> > -	struct ttm_buffer_object *bo;
> > -	unsigned int i, j;
> > +	struct ttm_resource *res;
> >  
> >  	spin_lock(&bdev->lru_lock);
> > -	while (!list_empty(&bdev->pinned)) {
> > -		bo = list_first_entry(&bdev->pinned, struct ttm_buffer_object, lru);
> > +	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
> > +		struct ttm_buffer_object *bo = res->bo;
> > +
> >  		/* Take ref against racing releases once lru_lock is unlocked */
> > -		if (ttm_bo_get_unless_zero(bo)) {
> > -			list_del_init(&bo->lru);
> > -			spin_unlock(&bdev->lru_lock);
> > +		if (!ttm_bo_get_unless_zero(bo))
> > +			continue;
> >  
> > -			if (bo->ttm)
> > -				ttm_tt_unpopulate(bo->bdev, bo->ttm);
> > +		list_del_init(&res->lru);
> > +		spin_unlock(&bdev->lru_lock);
> >  
> > -			ttm_bo_put(bo);
> > -			spin_lock(&bdev->lru_lock);
> > -		}
> > +		if (bo->ttm)
> > +			ttm_tt_unpopulate(bo->bdev, bo->ttm);
> > +
> > +		ttm_bo_put(bo);
> > +		spin_lock(&bdev->lru_lock);
> >  	}
> > +	spin_unlock(&bdev->lru_lock);
> > +}
> > +
> > +void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
> > +{
> > +	struct ttm_resource_manager *man;
> > +	unsigned int i, j;
> > +
> > +	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
> >  
> >  	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> >  		man = ttm_manager_type(bdev, i);
> >  		if (!man || !man->use_tt)
> >  			continue;
> >  
> > -		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> > -			while (!list_empty(&man->lru[j])) {
> > -				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
> > -				if (ttm_bo_get_unless_zero(bo)) {
> > -					list_del_init(&bo->lru);
> > -					spin_unlock(&bdev->lru_lock);
> > -
> > -					if (bo->ttm)
> > -						ttm_tt_unpopulate(bo->bdev, bo->ttm);
> > -
> > -					ttm_bo_put(bo);
> > -					spin_lock(&bdev->lru_lock);
> > -				}
> > -			}
> > -		}
> > +		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j)
> > +			ttm_device_clear_lru_dma_mappings(bdev, &man->lru[j]);
> >  	}
> > -	spin_unlock(&bdev->lru_lock);
> >  }
> >  EXPORT_SYMBOL(ttm_device_clear_dma_mappings);
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> > index cbd47a104962..8c253b6de6cc 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -29,6 +29,110 @@
> >  #include <drm/ttm/ttm_resource.h>
> >  #include <drm/ttm/ttm_bo_driver.h>
> >  
> > +/**
> > + * ttm_lru_bulk_move_init - initialize a bulk move structure
> > + * @bulk: the structure to init
> > + *
> > + * For now just memset the structure to zero.
> > + */
> > +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
> > +{
> > +	memset(bulk, 0, sizeof(*bulk));
> > +}
> > +EXPORT_SYMBOL(ttm_lru_bulk_move_init);
> > +
> > +/**
> > + * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
> > + *
> > + * @bulk: bulk move structure
> > + *
> > + * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
> > + * resource order never changes. Should be called with &ttm_device.lru_lock held.
> > + */
> > +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
> > +{
> > +	unsigned i;
> > +
> > +	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> > +		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
> > +		struct ttm_resource_manager *man;
> > +
> > +		if (!pos->first)
> > +			continue;
> > +
> > +		lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
> > +		dma_resv_assert_held(pos->first->bo->base.resv);
> > +		dma_resv_assert_held(pos->last->bo->base.resv);
> > +
> > +		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
> > +		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> > +				    &pos->last->lru);
> > +	}
> > +
> > +	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> > +		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
> > +		struct ttm_resource_manager *man;
> > +
> > +		if (!pos->first)
> > +			continue;
> > +
> > +		lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
> > +		dma_resv_assert_held(pos->first->bo->base.resv);
> > +		dma_resv_assert_held(pos->last->bo->base.resv);
> > +
> > +		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
> > +		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> > +				    &pos->last->lru);
> > +	}
> > +}
> > +EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
> > +
> > +/* Record a resource position in a bulk move structure */
> > +static void ttm_lru_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
> > +				      struct ttm_resource *res)
> > +{
> > +	if (!pos->first)
> > +		pos->first = res;
> > +	pos->last = res;
> > +}
> > +
> > +/* Move a resource to the LRU tail and track the bulk position */
> > +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
> > +				   struct ttm_lru_bulk_move *bulk)
> > +{
> > +	struct ttm_buffer_object *bo = res->bo;
> > +	struct ttm_device *bdev = bo->bdev;
> > +	struct ttm_resource_manager *man;
> > +
> > +	lockdep_assert_held(&bo->bdev->lru_lock);
> > +
> > +	if (bo->pin_count) {
> > +		list_move_tail(&res->lru, &bdev->pinned);
> > +		if (bdev->funcs->del_from_lru_notify)
> > +			bdev->funcs->del_from_lru_notify(res->bo);
> > +		return;
> > +	}
> > +
> > +	man = ttm_manager_type(bdev, res->mem_type);
> > +	list_move_tail(&res->lru, &man->lru[bo->priority]);
> > +
> > +	if (bdev->funcs->del_from_lru_notify)
> > +		bdev->funcs->del_from_lru_notify(bo);
> > +
> > +	if (!bulk)
> > +		return;
> > +
> > +	switch (res->mem_type) {
> > +	case TTM_PL_TT:
> > +		ttm_lru_bulk_move_set_pos(&bulk->tt[bo->priority], res);
> > +		break;
> > +
> > +	case TTM_PL_VRAM:
> > +		ttm_lru_bulk_move_set_pos(&bulk->vram[bo->priority], res);
> > +		break;
> > +	}
> > +}
> > +
> >  /**
> >   * ttm_resource_init - resource object constructure
> >   * @bo: buffer object this resources is allocated for
> > @@ -52,10 +156,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> >  	res->bus.is_iomem = false;
> >  	res->bus.caching = ttm_cached;
> >  	res->bo = bo;
> > +	INIT_LIST_HEAD(&res->lru);
> >  
> >  	man = ttm_manager_type(bo->bdev, place->mem_type);
> >  	spin_lock(&bo->bdev->lru_lock);
> > -	man->usage += bo->base.size;
> > +	man->usage += res->num_pages << PAGE_SHIFT;
> > +	ttm_resource_move_to_lru_tail(res, NULL);
> >  	spin_unlock(&bo->bdev->lru_lock);
> >  }
> >  EXPORT_SYMBOL(ttm_resource_init);
> > @@ -66,15 +172,21 @@ EXPORT_SYMBOL(ttm_resource_init);
> >   * @res: the resource to clean up
> >   *
> >   * Should be used by resource manager backends to clean up the TTM resource
> > - * objects before freeing the underlying structure. Counterpart of
> > - * &ttm_resource_init
> > + * objects before freeing the underlying structure. Makes sure the resource is
> > + * removed from the LRU before destruction.
> > + * Counterpart of &ttm_resource_init.
> 
> ttm_resource_init() or the link wont work correctly. There's a few more
> like this. From earlier patches, but please fix.
> 
> Also in my earlier review I had a bunch more kerneldoc comments that
> arean't addressed here yet:
> 
> https://lore.kernel.org/dri-devel/YfAqtI95aewAb10L@phenom.ffwll.local/
> 
> With that addressed Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> still holds.
> -Daniel
> 
> 
> >   */
> >  void ttm_resource_fini(struct ttm_resource_manager *man,
> >  		       struct ttm_resource *res)
> >  {
> > -	spin_lock(&man->bdev->lru_lock);
> > -	man->usage -= res->bo->base.size;
> > -	spin_unlock(&man->bdev->lru_lock);
> > +	struct ttm_device *bdev = man->bdev;
> > +
> > +	spin_lock(&bdev->lru_lock);
> > +	list_del_init(&res->lru);
> > +	if (res->bo && bdev->funcs->del_from_lru_notify)
> > +		bdev->funcs->del_from_lru_notify(res->bo);
> > +	man->usage -= res->num_pages << PAGE_SHIFT;
> > +	spin_unlock(&bdev->lru_lock);
> >  }
> >  EXPORT_SYMBOL(ttm_resource_fini);
> >  
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > index c17b2df9178b..3da77fc54552 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -55,8 +55,6 @@ struct ttm_placement;
> >  
> >  struct ttm_place;
> >  
> > -struct ttm_lru_bulk_move;
> > -
> >  /**
> >   * enum ttm_bo_type
> >   *
> > @@ -94,7 +92,6 @@ struct ttm_tt;
> >   * @ttm: TTM structure holding system pages.
> >   * @evicted: Whether the object was evicted without user-space knowing.
> >   * @deleted: True if the object is only a zombie and already deleted.
> > - * @lru: List head for the lru list.
> >   * @ddestroy: List head for the delayed destroy list.
> >   * @swap: List head for swap LRU list.
> >   * @moving: Fence set when BO is moving
> > @@ -143,7 +140,6 @@ struct ttm_buffer_object {
> >  	 * Members protected by the bdev::lru_lock.
> >  	 */
> >  
> > -	struct list_head lru;
> >  	struct list_head ddestroy;
> >  
> >  	/**
> > @@ -295,7 +291,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
> >   * ttm_bo_move_to_lru_tail
> >   *
> >   * @bo: The buffer object.
> > - * @mem: Resource object.
> >   * @bulk: optional bulk move structure to remember BO positions
> >   *
> >   * Move this BO to the tail of all lru lists used to lookup and reserve an
> > @@ -303,19 +298,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
> >   * held, and is used to make a BO less likely to be considered for eviction.
> >   */
> >  void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
> > -			     struct ttm_resource *mem,
> >  			     struct ttm_lru_bulk_move *bulk);
> >  
> > -/**
> > - * ttm_bo_bulk_move_lru_tail
> > - *
> > - * @bulk: bulk move structure
> > - *
> > - * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
> > - * BO order never changes. Should be called with ttm_global::lru_lock held.
> > - */
> > -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
> > -
> >  /**
> >   * ttm_bo_lock_delayed_workqueue
> >   *
> > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> > index 5f087575194b..6c7352e13708 100644
> > --- a/include/drm/ttm/ttm_bo_driver.h
> > +++ b/include/drm/ttm/ttm_bo_driver.h
> > @@ -45,33 +45,6 @@
> >  #include "ttm_tt.h"
> >  #include "ttm_pool.h"
> >  
> > -/**
> > - * struct ttm_lru_bulk_move_pos
> > - *
> > - * @first: first BO in the bulk move range
> > - * @last: last BO in the bulk move range
> > - *
> > - * Positions for a lru bulk move.
> > - */
> > -struct ttm_lru_bulk_move_pos {
> > -	struct ttm_buffer_object *first;
> > -	struct ttm_buffer_object *last;
> > -};
> > -
> > -/**
> > - * struct ttm_lru_bulk_move
> > - *
> > - * @tt: first/last lru entry for BOs in the TT domain
> > - * @vram: first/last lru entry for BOs in the VRAM domain
> > - * @swap: first/last lru entry for BOs on the swap list
> > - *
> > - * Helper structure for bulk moves on the LRU list.
> > - */
> > -struct ttm_lru_bulk_move {
> > -	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> > -	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> > -};
> > -
> >  /*
> >   * ttm_bo.c
> >   */
> > @@ -182,7 +155,7 @@ static inline void
> >  ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
> >  {
> >  	spin_lock(&bo->bdev->lru_lock);
> > -	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
> > +	ttm_bo_move_to_lru_tail(bo, NULL);
> >  	spin_unlock(&bo->bdev->lru_lock);
> >  }
> >  
> > diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> > index 323c14a30c6b..181e82e3d806 100644
> > --- a/include/drm/ttm/ttm_resource.h
> > +++ b/include/drm/ttm/ttm_resource.h
> > @@ -26,10 +26,12 @@
> >  #define _TTM_RESOURCE_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/list.h>
> >  #include <linux/mutex.h>
> >  #include <linux/atomic.h>
> >  #include <linux/dma-buf-map.h>
> >  #include <linux/dma-fence.h>
> > +
> >  #include <drm/drm_print.h>
> >  #include <drm/ttm/ttm_caching.h>
> >  #include <drm/ttm/ttm_kmap_iter.h>
> > @@ -179,6 +181,33 @@ struct ttm_resource {
> >  	uint32_t placement;
> >  	struct ttm_bus_placement bus;
> >  	struct ttm_buffer_object *bo;
> > +	struct list_head lru;
> > +};
> > +
> > +/**
> > + * struct ttm_lru_bulk_move_pos
> > + *
> > + * @first: first res in the bulk move range
> > + * @last: last res in the bulk move range
> > + *
> > + * Positions for a lru bulk move.
> > + */
> > +struct ttm_lru_bulk_move_pos {
> > +	struct ttm_resource *first;
> > +	struct ttm_resource *last;
> > +};
> > +
> > +/**
> > + * struct ttm_lru_bulk_move
> > + *
> > + * @tt: first/last lru entry for resources in the TT domain
> > + * @vram: first/last lru entry for resources in the VRAM domain
> > + *
> > + * Helper structure for bulk moves on the LRU list.
> > + */
> > +struct ttm_lru_bulk_move {
> > +	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> > +	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> >  };
> >  
> >  /**
> > @@ -267,6 +296,12 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
> >  	man->move = NULL;
> >  }
> >  
> > +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
> > +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> > +
> > +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
> > +				   struct ttm_lru_bulk_move *bulk);
> > +
> >  void ttm_resource_init(struct ttm_buffer_object *bo,
> >                         const struct ttm_place *place,
> >                         struct ttm_resource *res);
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
