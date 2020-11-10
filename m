Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101402AD8DC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B48C89AB6;
	Tue, 10 Nov 2020 14:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7BA89AB6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:34:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so5797094wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DmA2m6oK6qehKYsnwT85DhzX1/7ik4/aWB7l7B4Opm4=;
 b=TaoZaPeTmC2xenek6v2xuGqBWKvD+evYj5R84SLL9QdNAgYhd/JOYw5aTZQqYYonOt
 A5nnKI42w1ZZBHBb9pvBlj8f84MV51JXJSlfzpYGEtekLihm4/WG2mfltE7zhXKBr4RB
 IDZJvfC+pipn62RphZjvs5Fx7cvvxF1cKkxDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DmA2m6oK6qehKYsnwT85DhzX1/7ik4/aWB7l7B4Opm4=;
 b=DccmkqR4ZCCOhzYzll9jlu0FPvb/460P0eadEwmfSGBFYaqatLv8J46CGFWt3XyjWp
 mcxi57Z3qAMoHkHdEtXkxLjeMHcRMwghuhipQs3GNAxlzwSFG/r/2HxIyge72KS8j9ML
 O+ObqYcHRVI21fzYYX9/Oy+Y3rhbAdxW5cpx8XeD2dkvLTnLthYz9QLdKK4od2YlU7k1
 p3CCRl7/J3Ys1+df7BIPACdAZZbqW66RaZKsd+XjvQVTIjRbctdHRD6efr2p4uEbAKGe
 FWhh7ihzE1EZYJpxhDxqqoWh7yJfYh4HK6W/x12vqUKuILiKm4R8DjbI19C4isP6hXg5
 47ig==
X-Gm-Message-State: AOAM5300GvMDajka43k2kobHCkFexSoxfTT/wseDefTUJoL/whaMpkou
 XMa8fxSloktRqqWaKP2SVcQy3Q==
X-Google-Smtp-Source: ABdhPJyxPHv3xouVfWEsgr2MzOEFpmHY73HswTcrWWF6FIKrgYq16l+Hl0h2Eyx0ItonrfHU3gwmWA==
X-Received: by 2002:adf:8bcc:: with SMTP id w12mr26216839wra.157.1605018884717; 
 Tue, 10 Nov 2020 06:34:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m126sm3196022wmm.0.2020.11.10.06.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:34:43 -0800 (PST)
Date: Tue, 10 Nov 2020 15:34:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
Message-ID: <20201110143442.GK401619@phenom.ffwll.local>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109005432.861936-2-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 10:54:29AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Currently drivers get called to move a buffer, but if they have to
> move it temporarily through another space (SYSTEM->VRAM via TT)
> then they can end up with a lot of ttm->driver->ttm call stacks,
> if the temprorary space moves requires eviction.
> 
> Instead of letting the driver do all the placement/space for the
> temporary, allow it to report back (-EMULTIHOP) and a placement (hop)
> to the move code, which will then do the temporary move, and the
> correct placement move afterwards.
> 
> This removes a lot of code from drivers, at the expense of
> adding some midlayering. I've some further ideas on how to turn
> it inside out, but I think this is a good solution to the call
> stack problems.
> 
> v2: separate out the driver patches, add WARN for getting
> MULTHOP in paths we shouldn't (Daniel)
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  3 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c      |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c       |  3 +-
>  drivers/gpu/drm/qxl/qxl_ttm.c              |  3 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c        |  3 +-
>  drivers/gpu/drm/ttm/ttm_bo.c               | 68 +++++++++++++++++++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  3 +-
>  include/drm/ttm/ttm_bo_driver.h            |  7 ++-
>  8 files changed, 77 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c01c060e4ac5..ce0d82802333 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -656,7 +656,8 @@ static bool amdgpu_mem_visible(struct amdgpu_device *adev,
>   */
>  static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>  			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>  {
>  	struct amdgpu_device *adev;
>  	struct amdgpu_bo *abo;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 16d68c04ea5d..2cec7b1482b8 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -964,7 +964,8 @@ static void bo_driver_delete_mem_notify(struct ttm_buffer_object *bo)
>  static int bo_driver_move(struct ttm_buffer_object *bo,
>  			  bool evict,
>  			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>  {
>  	struct drm_gem_vram_object *gbo;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 8133377d865d..fee07b9d19ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1023,7 +1023,8 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>  static int
>  nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		struct ttm_operation_ctx *ctx,
> -		struct ttm_resource *new_reg)
> +		struct ttm_resource *new_reg,
> +		struct ttm_place *hop)
>  {
>  	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>  	struct nouveau_bo *nvbo = nouveau_bo(bo);
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index a80d59634143..128c38c8a837 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -140,7 +140,8 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
>  
>  static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		       struct ttm_operation_ctx *ctx,
> -		       struct ttm_resource *new_mem)
> +		       struct ttm_resource *new_mem,
> +		       struct ttm_place *hop)
>  {
>  	struct ttm_resource *old_mem = &bo->mem;
>  	int ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 95038ac3382e..29062dbea299 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -303,7 +303,8 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
>  
>  static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>  			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>  {
>  	struct radeon_device *rdev;
>  	struct radeon_bo *rbo;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e2a124b3affb..9f840f2a7836 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -231,7 +231,8 @@ EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>  
>  static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  				  struct ttm_resource *mem, bool evict,
> -				  struct ttm_operation_ctx *ctx)
> +				  struct ttm_operation_ctx *ctx,
> +				  struct ttm_place *hop)
>  {
>  	struct ttm_bo_device *bdev = bo->bdev;
>  	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
> @@ -259,9 +260,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  		}
>  	}
>  
> -	ret = bdev->driver->move(bo, evict, ctx, mem);
> -	if (ret)
> +	ret = bdev->driver->move(bo, evict, ctx, mem, hop);
> +	if (ret) {
> +		if (ret == -EMULTIHOP)
> +			return ret;
>  		goto out_err;
> +	}
>  
>  	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
>  	return 0;
> @@ -566,6 +570,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  	struct ttm_bo_device *bdev = bo->bdev;
>  	struct ttm_resource evict_mem;
>  	struct ttm_placement placement;
> +	struct ttm_place hop = {};
>  	int ret = 0;
>  
>  	dma_resv_assert_held(bo->base.resv);
> @@ -596,8 +601,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  		goto out;
>  	}
>  
> -	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx);
> +	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx, &hop);
>  	if (unlikely(ret)) {
> +		WARN(ret == -EMULTIHOP, "Unexpected multihop in eviction - likely driver bug\n");
>  		if (ret != -ERESTARTSYS)
>  			pr_err("Buffer eviction failed\n");
>  		ttm_resource_free(bo, &evict_mem);
> @@ -936,11 +942,39 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_mem_space);
>  
> +static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> +				     struct ttm_resource *mem,
> +				     struct ttm_operation_ctx *ctx,
> +				     struct ttm_place *hop)
> +{
> +	struct ttm_placement hop_placement;
> +	int ret;
> +	struct ttm_resource hop_mem = *mem;
> +
> +	hop_mem.mm_node = NULL;
> +	hop_mem.mem_type = TTM_PL_SYSTEM;
> +	hop_mem.placement = 0;
> +
> +	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
> +	hop_placement.placement = hop_placement.busy_placement = hop;
> +
> +	/* find space in the bounce domain */
> +	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
> +	if (ret)
> +		return ret;
> +	/* move to the bounce domain */
> +	ret = ttm_bo_handle_move_mem(bo, &hop_mem, false, ctx, NULL);
> +	if (ret)
> +		return ret;
> +	return 0;
> +}
> +
>  static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>  			      struct ttm_placement *placement,
>  			      struct ttm_operation_ctx *ctx)
>  {
>  	int ret = 0;
> +	struct ttm_place hop = {};
>  	struct ttm_resource mem;
>  
>  	dma_resv_assert_held(bo->base.resv);
> @@ -954,12 +988,25 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>  
>  	/*
>  	 * Determine where to move the buffer.
> +	 *
> +	 * If driver determines move is going to need
> +	 * an extra step then it will return -EMULTIHOP
> +	 * and the buffer will be moved to the temporary
> +	 * stop and the driver will be called to make
> +	 * the second hop.
>  	 */
> +bounce:
>  	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
>  	if (ret)
> -		goto out_unlock;
> -	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx);
> -out_unlock:
> +		return ret;
> +	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx, &hop);
> +	if (ret == -EMULTIHOP) {
> +		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
> +		if (ret)
> +			return ret;
> +		/* try and move to final place now. */
> +		goto bounce;
> +	}
>  	if (ret)
>  		ttm_resource_free(bo, &mem);
>  	return ret;
> @@ -1432,15 +1479,18 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  	if (bo->mem.mem_type != TTM_PL_SYSTEM) {
>  		struct ttm_operation_ctx ctx = { false, false };
>  		struct ttm_resource evict_mem;
> +		struct ttm_place hop = {};
>  
>  		evict_mem = bo->mem;
>  		evict_mem.mm_node = NULL;
>  		evict_mem.placement = 0;
>  		evict_mem.mem_type = TTM_PL_SYSTEM;
>  
> -		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx);
> -		if (unlikely(ret != 0))
> +		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx, &hop);
> +		if (unlikely(ret != 0)) {
> +			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
>  			goto out;
> +		}
>  	}
>  
>  	/**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 51f70bea41cc..6a04261ce760 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -695,7 +695,8 @@ static void vmw_swap_notify(struct ttm_buffer_object *bo)
>  static int vmw_move(struct ttm_buffer_object *bo,
>  		    bool evict,
>  		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem)
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop)
>  {
>  	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
>  	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index da8208f43378..f02f7cf9ae90 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -121,6 +121,8 @@ struct ttm_bo_driver {
>  	 * Return the bo flags for a buffer which is not mapped to the hardware.
>  	 * These will be placed in proposed_flags so that when the move is
>  	 * finished, they'll end up in bo->mem.flags
> +	 * This should not cause multihop evictions, and the core will warn
> +	 * if one is proposed.
>  	 */
>  
>  	void (*evict_flags)(struct ttm_buffer_object *bo,
> @@ -134,12 +136,15 @@ struct ttm_bo_driver {
>  	 * the graphics address space
>  	 * @ctx: context for this move with parameters
>  	 * @new_mem: the new memory region receiving the buffer
> +	 @ @hop: placement for driver directed intermediate hop
>  	 *
>  	 * Move a buffer between two memory regions.
> +	 * Returns errno -EMULTIHOP if driver requests a hop
>  	 */
>  	int (*move)(struct ttm_buffer_object *bo, bool evict,
>  		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem);
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop);

I think the warnings look all good, and everything else too.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On the = {} bikeshed I frankly don't care, since for anything where this
matters vs memset you really should have a pad-less structure (by padding
the structure properly). So imo = {} is perfectly fine.
-Daniel

>  
>  	/**
>  	 * struct ttm_bo_driver_member verify_access
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
