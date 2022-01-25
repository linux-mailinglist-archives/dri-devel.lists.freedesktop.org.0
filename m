Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3B49B894
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C0710E127;
	Tue, 25 Jan 2022 16:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030D10E127
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:30:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l25so20894527wrb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oaZ8C3M+A3BztCknfbNl9Y8jrQk8LH2/sJKyOimZgJk=;
 b=HSrXwQ37jZwZ12TEl8i4UjOWhhElu5JveeyXjsI9glwGwmLc8m3I2RJo3KYG/6VsaQ
 ME0NPG28N61JpoEKBgbutovkZ2+d7boKa/mLV/F/yCOd5VMhZa/XQFYovT3rxbqXUWB1
 IzbySvGqf4+wy2aGQa3foLugIZfn8TEoUEHx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oaZ8C3M+A3BztCknfbNl9Y8jrQk8LH2/sJKyOimZgJk=;
 b=2d8jZ/Gen1tcO+X1I61dnJUx9/ynstwo4j6ijVt/0egZSfaHt4VuCwlWYeE8SKLyHH
 RQYzIBCssSAc39r2dXLcWRR5Y1li5lqhMqcvU1ZUl+3ZpmadfbjZStWPUWEHIT8yhuSV
 CzE+NXqRmZWW2zrFZsOywHl3/XYX/XK1X2Y4ctFIPue/cPGGi9TC86XNV1+kTfIDS3WA
 gdrfpYsVR5XjYUZnw6nHCy3s2CD0YJvOmUFeu0o4s9LHKU1gEaQrNCLPp5u+pP0Ehksc
 B96fgeQWOZQKbwTBrxXH4jmu3bZCotOUUDxMHGHTSaiROY0WE3rdTKY3K/80rjMJ+BAE
 Tiyw==
X-Gm-Message-State: AOAM533FHB6px6dItk4VjxuQi7eqeVwMEY7bHg/pbeyQDp1xXf/iQQiW
 rjSqS3A54IqHe3MW/UhHrLr9Qg==
X-Google-Smtp-Source: ABdhPJyfR7b1gI9Vu6sWDzDei3eUS7LVHH38NdclLlbjrecXMKYeE5GyxLhhwQERBwhdIRh/HaXOhQ==
X-Received: by 2002:a5d:6d50:: with SMTP id k16mr18853003wri.693.1643128225905; 
 Tue, 25 Jan 2022 08:30:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n14sm9473376wri.80.2022.01.25.08.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:30:25 -0800 (PST)
Date: Tue, 25 Jan 2022 17:30:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 02/12] drm/ttm: add back a reference to the bdev to the
 res manager
Message-ID: <YfAln7wVi3NyOgu/@phenom.ffwll.local>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122514.1832-3-christian.koenig@amd.com>
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
Cc: thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 01:25:04PM +0100, Christian König wrote:
> It is simply a lot cleaner to have this around instead of adding
> the device throughout the call chain.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    |  3 ++-
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c           |  4 ++--
>  drivers/gpu/drm/ttm/ttm_range_manager.c         |  2 +-
>  drivers/gpu/drm/ttm/ttm_resource.c              |  3 +++
>  drivers/gpu/drm/ttm/ttm_sys_manager.c           |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c  |  2 +-
>  include/drm/ttm/ttm_resource.h                  | 16 +++++++++-------
>  11 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index ea5470c8c921..9e7685a4878c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -293,7 +293,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  	man->use_tt = true;
>  	man->func = &amdgpu_gtt_mgr_func;
>  
> -	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, &adev->mman.bdev,
> +				  gtt_size >> PAGE_SHIFT);
>  
>  	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index ffddec08e931..6f7189d32f0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -153,7 +153,7 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
>  	man->use_tt = true;
>  	man->func = &amdgpu_preempt_mgr_func;
>  
> -	ttm_resource_manager_init(man, (1 << 30));
> +	ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
>  
>  	atomic64_set(&mgr->used, 0);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 55d68408951d..ddd0b6d74070 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -699,7 +699,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
>  
> -	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, &adev->mman.bdev,
> +				  adev->gmc.real_vram_size >> PAGE_SHIFT);
>  
>  	man->func = &amdgpu_vram_mgr_func;
>  
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index bf857703c797..79dc8c6f2833 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -204,7 +204,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
>  	man = &bman->manager;
>  	man->use_tt = use_tt;
>  	man->func = &i915_ttm_buddy_manager_func;
> -	ttm_resource_manager_init(man, bman->mm.size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, bdev, bman->mm.size >> PAGE_SHIFT);
>  
>  	ttm_resource_manager_set_used(man, true);
>  	ttm_set_driver_manager(bdev, type, man);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 91ef33f8f22c..85f1f5a0fe5d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -164,7 +164,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>  
>  		man->func = &nouveau_vram_manager;
>  
> -		ttm_resource_manager_init(man,
> +		ttm_resource_manager_init(man, &drm->ttm.bdev,
>  					  drm->gem.vram_available >> PAGE_SHIFT);
>  		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
>  		ttm_resource_manager_set_used(man, true);
> @@ -211,7 +211,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  
>  	man->func = func;
>  	man->use_tt = true;
> -	ttm_resource_manager_init(man, size_pages);
> +	ttm_resource_manager_init(man, &drm->ttm.bdev, size_pages);
>  	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
>  	ttm_resource_manager_set_used(man, true);
>  	return 0;
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 55a41355f684..8cd4f3fb9f79 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -158,7 +158,7 @@ int ttm_range_man_init_nocheck(struct ttm_device *bdev,
>  
>  	man->func = &ttm_range_manager_func;
>  
> -	ttm_resource_manager_init(man, p_size);
> +	ttm_resource_manager_init(man, bdev, p_size);
>  
>  	drm_mm_init(&rman->mm, 0, p_size);
>  	spin_lock_init(&rman->lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 89bcfe22a0ca..41e7bf195168 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -126,16 +126,19 @@ EXPORT_SYMBOL(ttm_resource_compat);
>   * ttm_resource_manager_init
>   *
>   * @man: memory manager object to init
> + * @bdev: ttm device this manager belongs to
>   * @p_size: size managed area in pages.
>   *
>   * Initialise core parts of a manager object.
>   */
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
> +			       struct ttm_device *bdev,
>  			       unsigned long p_size)
>  {
>  	unsigned i;
>  
>  	spin_lock_init(&man->move_lock);
> +	man->bdev = bdev;
>  	man->size = p_size;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> index 135394dcca95..2ced169513cb 100644
> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> @@ -43,7 +43,7 @@ void ttm_sys_man_init(struct ttm_device *bdev)
>  	man->use_tt = true;
>  	man->func = &ttm_sys_manager_func;
>  
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man, bdev, 0);
>  	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
>  	ttm_resource_manager_set_used(man, true);
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 99ccf690f8a1..60e3cc537f36 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -162,7 +162,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  
>  	man->func = &vmw_gmrid_manager_func;
>  	man->use_tt = true;
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man, &dev_priv->bdev, 0);
>  	spin_lock_init(&gman->lock);
>  	gman->used_gmr_pages = 0;
>  	ida_init(&gman->gmr_ida);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> index a64188c7268d..d3007bf1b8f5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> @@ -70,7 +70,7 @@ int vmw_sys_man_init(struct vmw_private *dev_priv)
>  	man->use_tt = true;
>  	man->func = &vmw_sys_manager_func;
>  
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man, bdev, 0);
>  	ttm_set_driver_manager(bdev, VMW_PL_SYSTEM, man);
>  	ttm_resource_manager_set_used(man, true);
>  	return 0;
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index df1f06b7b504..6bf37383002b 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -105,11 +105,11 @@ struct ttm_resource_manager_func {
>   * @use_type: The memory type is enabled.
>   * @use_tt: If a TT object should be used for the backing store.
>   * @size: Size of the managed region.
> + * @bdev: ttm device this manager belongs to
>   * @func: structure pointer implementing the range manager. See above
>   * @move_lock: lock for move fence
> - * static information. bdev::driver::io_mem_free is never used.
> - * @lru: The lru list for this memory type.
>   * @move: The fence of the last pipelined move operation.
> + * @lru: The lru list for this memory type.
>   *
>   * This structure is used to identify and manage memory types for a device.
>   */
> @@ -119,20 +119,21 @@ struct ttm_resource_manager {
>  	 */
>  	bool use_type;
>  	bool use_tt;
> +	struct ttm_device *bdev;
>  	uint64_t size;
>  	const struct ttm_resource_manager_func *func;
>  	spinlock_t move_lock;
>  
>  	/*
> -	 * Protected by the global->lru_lock.
> +	 * Protected by @move_lock.
>  	 */
> -
> -	struct list_head lru[TTM_MAX_BO_PRIORITY];
> +	struct dma_fence *move;
>  
>  	/*
> -	 * Protected by @move_lock.
> +	 * Protected by the global->lru_lock.

Since you edit these anyway, maybe move the kerneldoc from the header
comment to inline style and comment them. Having things split up doesn't
help anyone.

Anyway I'll trust gcc on this one :-)

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	 */
> -	struct dma_fence *move;
> +
> +	struct list_head lru[TTM_MAX_BO_PRIORITY];
>  };
>  
>  /**
> @@ -272,6 +273,7 @@ bool ttm_resource_compat(struct ttm_resource *res,
>  			 struct ttm_placement *placement);
>  
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
> +			       struct ttm_device *bdev,
>  			       unsigned long p_size);
>  
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
