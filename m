Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC194F7AB0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFEF89121;
	Thu,  7 Apr 2022 09:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61F110E6DA;
 Thu,  7 Apr 2022 09:00:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id k2so5579092edj.9;
 Thu, 07 Apr 2022 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bwj+8gBq2xXM4g/IACcczKySy6ChOBgcIz6LVQPwA9s=;
 b=U9J8Ga0XnJQ6qrmWDljbqLEFztqP/CF7ztD9fmgeLThcXdNT9QDsVpILXghteQsPUg
 PgFhbsPZSfk/8bHSNMDFlX/uiU7uTz5YnOocUcW3YPWvdBaPSHPrYQfVzYj3Sk8Jzi9b
 uBEZtFWgvEJGF3h05UiOiaPxOttZLHNxFC1BS/1dGbGbXNbC3nmgaOxR0XDX8t3AUUh7
 zKJWBXJhXgXfQDwIc7eawTgKyEXIv7Sbd97ttjyajgQ9lIBHPx/VeZ2k6r1+SIyt0vMB
 AUYEyeijmoqtZImcy5dXfUial3lz0yeao/7FumYb7SixgmvOA8SEW89eb/BldvtPkNWp
 ukDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bwj+8gBq2xXM4g/IACcczKySy6ChOBgcIz6LVQPwA9s=;
 b=OzS5rtS8pDlRpSsLt3CMMhAo6VmA4+v6O3zOVujq8rO2zPSETVnFTu4BEULWcYWLmi
 GEJoPFz9Y7jPo0SRPSnkxofWjrsbsNCMRWs/kYHzK8CoEkRKFOwaMtWXhePQyWyAWNmG
 sprNeFIXauwqE3cHSt2v6Ao1Xu/Gei1WR7AY7cvhFKWQ/vOlWbFvO1IUtnr1ciJb8niH
 UhsxC9ei3q9UJ1Z58dDkDF6a32IPZ2gdZlrZpQdrCtQAtyTKrdTuhZuwn70NaN5J2JRt
 mge9RPGGUX7eqLAYItwP5CUBZ/jTEv737g5S/HZqQE2wQrrds7sKyYffWJ5ZWrU8vuDt
 mZlQ==
X-Gm-Message-State: AOAM531debl4+/jqyRiq2hdmRbC6+22aF56qBcXU+rZk/Buv6EpTJOBw
 HHmpyQAt4MIcOeONj6uPO/DA6PUGRo0=
X-Google-Smtp-Source: ABdhPJw3SFJHG4bJdWzkCWUvGg6ScA7P3x23IMHNIyZ0TpqiJcR/3PwvBDrXTZOzTaCuevqUvLfARA==
X-Received: by 2002:a05:6402:84b:b0:419:85:b724 with SMTP id
 b11-20020a056402084b00b004190085b724mr13288715edz.413.1649322000102; 
 Thu, 07 Apr 2022 02:00:00 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/15] dma-buf: add DMA_RESV_USAGE_BOOKKEEP v3
Date: Thu,  7 Apr 2022 10:59:40 +0200
Message-Id: <20220407085946.744568-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an usage for submissions independent of implicit sync but still
interesting for memory management.

v2: cleanup the kerneldoc a bit
v3: separate amdgpu changes from this

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c                  |  4 ++--
 drivers/dma-buf/st-dma-resv.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_mn.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                | 14 +++++++-------
 include/linux/dma-resv.h                    | 13 ++++++++++++-
 14 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f4860e5f2d8b..5b64aa554c36 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -520,7 +520,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 	list = NULL;
 
-	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
+	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
@@ -726,7 +726,7 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
  */
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
 {
-	static const char *usage[] = { "kernel", "write", "read" };
+	static const char *usage[] = { "kernel", "write", "read", "bookkeep" };
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 062b57d63fa6..8ace9e84c845 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -296,7 +296,7 @@ int dma_resv(void)
 	int r;
 
 	spin_lock_init(&fence_lock);
-	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_READ;
+	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_BOOKKEEP;
 	     ++usage) {
 		r = subtests(tests, (void *)(unsigned long)usage);
 		if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index 65998cbcd7f7..4ba4b54092f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -111,7 +111,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	struct dma_fence *fence;
 	int r;
 
-	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_READ, &fence);
+	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP, &fence);
 	if (r)
 		goto fallback;
 
@@ -139,7 +139,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	/* Not enough memory for the delayed delete, as last resort
 	 * block for all the fences to complete.
 	 */
-	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
+	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
 			      false, MAX_SCHEDULE_TIMEOUT);
 	amdgpu_pasid_free(pasid);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 86f5248676b0..b86c0b8252a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -75,7 +75,7 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
 
 	mmu_interval_set_seq(mni, cur_seq);
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
 				  false, MAX_SCHEDULE_TIMEOUT);
 	mutex_unlock(&adev->notifier_lock);
 	if (r <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 744e144e5fc2..11c46b3e4c60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -260,7 +260,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		return -EINVAL;
 
 	/* TODO: Use DMA_RESV_USAGE_READ here */
-	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, f) {
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, f) {
 		dma_fence_chain_for_each(f, f) {
 			struct dma_fence *tmp = dma_fence_chain_contained(f);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5db5066e74b4..49ffad312d5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1345,7 +1345,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * be resident to run successfully
 	 */
 	dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
-				DMA_RESV_USAGE_READ, f) {
+				DMA_RESV_USAGE_BOOKKEEP, f) {
 		if (amdkfd_fence_check_mm(f, current->mm))
 			return false;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index a0376fd36a82..5277c10d901d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2059,7 +2059,7 @@ static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, fence) {
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, fence) {
 		/* Add a callback for each fence in the reservation object */
 		amdgpu_vm_prt_get(adev);
 		amdgpu_vm_add_prt_cb(adev, fence);
@@ -2665,7 +2665,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 		return true;
 
 	/* Don't evict VM page tables while they are busy */
-	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_READ))
+	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP))
 		return false;
 
 	/* Try to block ongoing updates */
@@ -2846,7 +2846,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
 {
 	timeout = dma_resv_wait_timeout(vm->root.bo->tbo.base.resv,
-					DMA_RESV_USAGE_READ,
+					DMA_RESV_USAGE_BOOKKEEP,
 					true, timeout);
 	if (timeout <= 0)
 		return timeout;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index a200d3e66573..4115a222a853 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -66,7 +66,7 @@ bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
 
 #ifdef CONFIG_LOCKDEP
-	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_READ) &&
+	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP) &&
 		    i915_gem_object_evictable(obj));
 #endif
 	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 644fe237601c..094f06b4ce33 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -86,7 +86,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 		return true;
 
 	/* we will unbind on next submission, still have userptr pins */
-	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_READ, false,
+	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
 				  MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r);
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 33e5889d6608..2d9ed3b94574 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -62,7 +62,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 		int rel = 0;
 
 		dma_resv_iter_begin(&cursor, bo->tbo.base.resv,
-				    DMA_RESV_USAGE_READ);
+				    DMA_RESV_USAGE_BOOKKEEP);
 		dma_resv_for_each_fence_unlocked(&cursor, fence) {
 			if (dma_resv_iter_is_restarted(&cursor))
 				rel = 0;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 6616a828f40b..8c01a7f0e027 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -163,7 +163,7 @@ static int radeon_gem_set_domain(struct drm_gem_object *gobj,
 	if (domain == RADEON_GEM_DOMAIN_CPU) {
 		/* Asking for cpu access wait for object idle */
 		r = dma_resv_wait_timeout(robj->tbo.base.resv,
-					  DMA_RESV_USAGE_READ,
+					  DMA_RESV_USAGE_BOOKKEEP,
 					  true, 30 * HZ);
 		if (!r)
 			r = -EBUSY;
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index 68ebeb1bdfff..29fe8423bd90 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -66,7 +66,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 		return true;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
 				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6bf3fb1c8045..360f980c7e10 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -223,7 +223,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_READ);
+	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
@@ -252,7 +252,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	struct dma_resv *resv = &bo->base._resv;
 	int ret;
 
-	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_READ))
+	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
 		ret = 0;
 	else
 		ret = -EBUSY;
@@ -264,7 +264,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 			dma_resv_unlock(bo->base.resv);
 		spin_unlock(&bo->bdev->lru_lock);
 
-		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
+		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
 					     interruptible,
 					     30 * HZ);
 
@@ -369,7 +369,7 @@ static void ttm_bo_release(struct kref *kref)
 			 * fences block for the BO to become idle
 			 */
 			dma_resv_wait_timeout(bo->base.resv,
-					      DMA_RESV_USAGE_READ, false,
+					      DMA_RESV_USAGE_BOOKKEEP, false,
 					      30 * HZ);
 		}
 
@@ -380,7 +380,7 @@ static void ttm_bo_release(struct kref *kref)
 		ttm_mem_io_free(bdev, bo->resource);
 	}
 
-	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ) ||
+	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP) ||
 	    !dma_resv_trylock(bo->base.resv)) {
 		/* The BO is not idle, resurrect it for delayed destroy */
 		ttm_bo_flush_all_fences(bo);
@@ -1046,13 +1046,13 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	long timeout = 15 * HZ;
 
 	if (no_wait) {
-		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ))
+		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP))
 			return 0;
 		else
 			return -EBUSY;
 	}
 
-	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_READ,
+	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
 					interruptible, timeout);
 	if (timeout < 0)
 		return timeout;
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index a749f229ae91..1db759eacc98 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -55,7 +55,7 @@ struct dma_resv_list;
  * This enum describes the different use cases for a dma_resv object and
  * controls which fences are returned when queried.
  *
- * An important fact is that there is the order KERNEL<WRITE<READ and
+ * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
  * when the dma_resv object is asked for fences for one use case the fences
  * for the lower use case are returned as well.
  *
@@ -93,6 +93,17 @@ enum dma_resv_usage {
 	 * an implicit read dependency.
 	 */
 	DMA_RESV_USAGE_READ,
+
+	/**
+	 * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
+	 *
+	 * This should be used by submissions which don't want to participate in
+	 * implicit synchronization.
+	 *
+	 * The most common case are preemption fences as well as page table
+	 * updates and their TLB flushes.
+	 */
+	DMA_RESV_USAGE_BOOKKEEP
 };
 
 /**
-- 
2.25.1

