Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02FF4E28DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FD010E459;
	Mon, 21 Mar 2022 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412710E443
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o7-20020a05600c4fc700b0038c87edc21eso50982wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCh1QArxFCqzvNZwZDADhHQGVV+zpScUrLahqPM9IBw=;
 b=BQcOJ/ooZwWr7EzHoix+2I2Ly64qXLKmnhpJnawaM/hnNv6VTUkqOIM7NHwZAyKOOh
 RuyfaZ2wJ3wu3WASBDfDE7lOn4jeVpgVixmX7gS99Pl36E8FkzvJR/UisaaA2224/lfU
 JbT1J07BORhD+YjbIM7zNI26owtE2XZaesOce9dX9Cqeqeh0kdPettfXe+5/tv4LlS7M
 E65KI6mYfKGUT6kPps/wVyh8CCkhLyJNg0do+ziPyMhzJVdw1HEEd/ezT0fXsJPi8kZ+
 9IyYeAGamAtQlPkBFQ6ky0EqTQG+93hJps8ZA/6tcT4nBQkvBa7Etl9gGcUzkdTxB7j0
 nycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCh1QArxFCqzvNZwZDADhHQGVV+zpScUrLahqPM9IBw=;
 b=kkhqguFkR8PSAMmj5vPwJK95I/0c6py3CLLn8Uie1+TL2PeI8E9FuzI2ey7Na2aI0+
 9zyQT9t9hfwNral9OQ1q1gxf0K/sOBXAR3XdFDVqRCIRLcoZwSPgxaEtxKyB/lHUYa92
 c7Z5JAmvw5hgMndKgYk+rqH9OGOGa6D5oICVBbYa4ZIbP19a+wSP2OcFCFAo5w/LyFom
 udxIoANf06/OK6NjjSzX/DgOcwJKN7ob7fuSkM9jg6sEzPGpdlfmvkcWD95QsZ0/crN+
 4EuhUsz0vlKuQeHotxotBfBM3KSmOvFXd83ZLXYqXYRFcSzaDYx4ej2A0iSE8OW5SS41
 Izuw==
X-Gm-Message-State: AOAM530eZJpQ1sBMGc68WcWo1EZVSC1QqrdeeDd+Ba78dQiVmrnIiI70
 F28W1MOF+ntHuvsoyveDIieWWMRsmS0=
X-Google-Smtp-Source: ABdhPJzGLQgnX1SDNxtu59ypaJzmwhXEx2pNn3UemTWA0z2rKJJzyQ6uFzW9Pvyi5gBppUOX/IYHcQ==
X-Received: by 2002:a05:600c:4e93:b0:38c:92d9:c7bc with SMTP id
 f19-20020a05600c4e9300b0038c92d9c7bcmr10907346wmq.173.1647871148898; 
 Mon, 21 Mar 2022 06:59:08 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/23] dma-buf/drivers: make reserving a shared slot mandatory
 v3
Date: Mon, 21 Mar 2022 14:58:45 +0100
Message-Id: <20220321135856.1331-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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

Audit all the users of dma_resv_add_excl_fence() and make sure they
reserve a shared slot also when only trying to add an exclusive fence.

This is the next step towards handling the exclusive fence like a
shared one.

v2: fix missed case in amdgpu
v3: and two more radeon, rename function

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 10 +--
 drivers/dma-buf/st-dma-resv.c                 | 64 +++++++++----------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  8 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  8 +--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  3 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  6 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  5 +-
 drivers/gpu/drm/i915/i915_vma.c               |  8 ++-
 .../drm/i915/selftests/intel_memory_region.c  |  7 ++
 drivers/gpu/drm/lima/lima_gem.c               | 10 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c          | 18 +++---
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  8 +--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  4 ++
 drivers/gpu/drm/qxl/qxl_release.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_cs.c            |  4 ++
 drivers/gpu/drm/radeon/radeon_object.c        |  8 +++
 drivers/gpu/drm/radeon/radeon_vm.c            |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  4 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 12 +++-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        | 15 ++---
 drivers/gpu/drm/v3d/v3d_gem.c                 | 15 +++--
 drivers/gpu/drm/vc4/vc4_gem.c                 |  2 +-
 drivers/gpu/drm/vgem/vgem_fence.c             | 12 ++--
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  9 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 16 +++--
 include/linux/dma-resv.h                      |  4 +-
 30 files changed, 171 insertions(+), 113 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4b12141579e2..78a32da2cb0b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -152,7 +152,7 @@ static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
 }
 
 /**
- * dma_resv_reserve_shared - Reserve space to add shared fences to
+ * dma_resv_reserve_fences - Reserve space to add shared fences to
  * a dma_resv.
  * @obj: reservation object
  * @num_fences: number of fences we want to add
@@ -167,7 +167,7 @@ static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
  * RETURNS
  * Zero for success, or -errno
  */
-int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
+int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 {
 	struct dma_resv_list *old, *new;
 	unsigned int i, j, k, max;
@@ -230,7 +230,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 
 	return 0;
 }
-EXPORT_SYMBOL(dma_resv_reserve_shared);
+EXPORT_SYMBOL(dma_resv_reserve_fences);
 
 #ifdef CONFIG_DEBUG_MUTEXES
 /**
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(dma_resv_reserve_shared);
  * @obj: the dma_resv object to reset
  *
  * Reset the number of pre-reserved shared slots to test that drivers do
- * correct slot allocation using dma_resv_reserve_shared(). See also
+ * correct slot allocation using dma_resv_reserve_fences(). See also
  * &dma_resv_list.shared_max.
  */
 void dma_resv_reset_shared_max(struct dma_resv *obj)
@@ -260,7 +260,7 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
  * @fence: the shared fence to add
  *
  * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
- * dma_resv_reserve_shared() has been called.
+ * dma_resv_reserve_fences() has been called.
  *
  * See also &dma_resv.fence for a discussion of the semantics.
  */
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index cbe999c6e7a6..d2e61f6ae989 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -75,17 +75,16 @@ static int test_signaling(void *arg, bool shared)
 		goto err_free;
 	}
 
-	if (shared) {
-		r = dma_resv_reserve_shared(&resv, 1);
-		if (r) {
-			pr_err("Resv shared slot allocation failed\n");
-			goto err_unlock;
-		}
+	r = dma_resv_reserve_fences(&resv, 1);
+	if (r) {
+		pr_err("Resv shared slot allocation failed\n");
+		goto err_unlock;
+	}
 
+	if (shared)
 		dma_resv_add_shared_fence(&resv, f);
-	} else {
+	else
 		dma_resv_add_excl_fence(&resv, f);
-	}
 
 	if (dma_resv_test_signaled(&resv, shared)) {
 		pr_err("Resv unexpectedly signaled\n");
@@ -134,17 +133,16 @@ static int test_for_each(void *arg, bool shared)
 		goto err_free;
 	}
 
-	if (shared) {
-		r = dma_resv_reserve_shared(&resv, 1);
-		if (r) {
-			pr_err("Resv shared slot allocation failed\n");
-			goto err_unlock;
-		}
+	r = dma_resv_reserve_fences(&resv, 1);
+	if (r) {
+		pr_err("Resv shared slot allocation failed\n");
+		goto err_unlock;
+	}
 
+	if (shared)
 		dma_resv_add_shared_fence(&resv, f);
-	} else {
+	else
 		dma_resv_add_excl_fence(&resv, f);
-	}
 
 	r = -ENOENT;
 	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
@@ -206,18 +204,17 @@ static int test_for_each_unlocked(void *arg, bool shared)
 		goto err_free;
 	}
 
-	if (shared) {
-		r = dma_resv_reserve_shared(&resv, 1);
-		if (r) {
-			pr_err("Resv shared slot allocation failed\n");
-			dma_resv_unlock(&resv);
-			goto err_free;
-		}
+	r = dma_resv_reserve_fences(&resv, 1);
+	if (r) {
+		pr_err("Resv shared slot allocation failed\n");
+		dma_resv_unlock(&resv);
+		goto err_free;
+	}
 
+	if (shared)
 		dma_resv_add_shared_fence(&resv, f);
-	} else {
+	else
 		dma_resv_add_excl_fence(&resv, f);
-	}
 	dma_resv_unlock(&resv);
 
 	r = -ENOENT;
@@ -290,18 +287,17 @@ static int test_get_fences(void *arg, bool shared)
 		goto err_resv;
 	}
 
-	if (shared) {
-		r = dma_resv_reserve_shared(&resv, 1);
-		if (r) {
-			pr_err("Resv shared slot allocation failed\n");
-			dma_resv_unlock(&resv);
-			goto err_resv;
-		}
+	r = dma_resv_reserve_fences(&resv, 1);
+	if (r) {
+		pr_err("Resv shared slot allocation failed\n");
+		dma_resv_unlock(&resv);
+		goto err_resv;
+	}
 
+	if (shared)
 		dma_resv_add_shared_fence(&resv, f);
-	} else {
+	else
 		dma_resv_add_excl_fence(&resv, f);
-	}
 	dma_resv_unlock(&resv);
 
 	r = dma_resv_get_fences(&resv, shared, &i, &fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b6f266f612ea..7de8f67f7dde 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1220,7 +1220,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 				  AMDGPU_FENCE_OWNER_KFD, false);
 	if (ret)
 		goto wait_pd_fail;
-	ret = dma_resv_reserve_shared(vm->root.bo->tbo.base.resv, 1);
+	ret = dma_resv_reserve_fences(vm->root.bo->tbo.base.resv, 1);
 	if (ret)
 		goto reserve_shared_fail;
 	amdgpu_bo_fence(vm->root.bo,
@@ -2530,7 +2530,7 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, void *gws, struct kgd_mem **mem
 	 * Add process eviction fence to bo so they can
 	 * evict each other.
 	 */
-	ret = dma_resv_reserve_shared(gws_bo->tbo.base.resv, 1);
+	ret = dma_resv_reserve_fences(gws_bo->tbo.base.resv, 1);
 	if (ret)
 		goto reserve_shared_fail;
 	amdgpu_bo_fence(gws_bo, &process_info->eviction_fence->base, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index ea0cde4904f0..2f808decd8d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1384,6 +1384,14 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 		     bool shared)
 {
 	struct dma_resv *resv = bo->tbo.base.resv;
+	int r;
+
+	r = dma_resv_reserve_fences(resv, 1);
+	if (r) {
+		/* As last resort on OOM we block for the fence */
+		dma_fence_wait(fence, false);
+		return;
+	}
 
 	if (shared)
 		dma_resv_add_shared_fence(resv, fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b37fc7d7d2c7..0ab85280e8ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2968,7 +2968,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	if (r)
 		goto error_free_root;
 
-	r = dma_resv_reserve_shared(root_bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
 	if (r)
 		goto error_unreserve;
 
@@ -3411,7 +3411,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 		value = 0;
 	}
 
-	r = dma_resv_reserve_shared(root->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root->tbo.base.resv, 1);
 	if (r) {
 		pr_debug("failed %d to reserve fence slot\n", r);
 		goto error_unlock;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f2805ba74c80..7b878221f1d3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -543,7 +543,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 		goto reserve_bo_failed;
 	}
 
-	r = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
 	if (r) {
 		pr_debug("failed %d to reserve bo\n", r);
 		amdgpu_bo_unreserve(bo);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 385ea141c23e..b808ddb9da48 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -179,11 +179,9 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
 		struct dma_resv *robj = bo->obj->base.resv;
 
-		if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
-			ret = dma_resv_reserve_shared(robj, 1);
-			if (ret)
-				return ret;
-		}
+		ret = dma_resv_reserve_fences(robj, 1);
+		if (ret)
+			return ret;
 
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
 			continue;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 8a248003dfae..8a2223eb0ba9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -106,7 +106,8 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 	trace_i915_gem_object_clflush(obj);
 
 	clflush = NULL;
-	if (!(flags & I915_CLFLUSH_SYNC))
+	if (!(flags & I915_CLFLUSH_SYNC) &&
+	    dma_resv_reserve_fences(obj->base.resv, 1) == 0)
 		clflush = clflush_work_create(obj);
 	if (clflush) {
 		i915_sw_fence_await_reservation(&clflush->base.chain,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 3a5b247be738..e8eb6ee83f24 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -994,11 +994,9 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 			}
 		}
 
-		if (!(ev->flags & EXEC_OBJECT_WRITE)) {
-			err = dma_resv_reserve_shared(vma->obj->base.resv, 1);
-			if (err)
-				return err;
-		}
+		err = dma_resv_reserve_fences(vma->obj->base.resv, 1);
+		if (err)
+			return err;
 
 		GEM_BUG_ON(drm_mm_node_allocated(&vma->node) &&
 			   eb_vma_misplaced(&eb->exec[i], vma, ev->flags));
@@ -2297,7 +2295,7 @@ static int eb_parse(struct i915_execbuffer *eb)
 		goto err_trampoline;
 	}
 
-	err = dma_resv_reserve_shared(shadow->obj->base.resv, 1);
+	err = dma_resv_reserve_fences(shadow->obj->base.resv, 1);
 	if (err)
 		goto err_trampoline;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index ee9612a3ee5e..4de6500f3c55 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -596,7 +596,11 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 	assert_object_held(src);
 	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
 
-	ret = dma_resv_reserve_shared(src_bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(src_bo->base.resv, 1);
+	if (ret)
+		return ret;
+
+	ret = dma_resv_reserve_fences(dst_bo->base.resv, 1);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index ecb691c81d1e..f9b369ed4b50 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -180,7 +180,10 @@ static int igt_lmem_pages_migrate(void *arg)
 					  i915_gem_object_is_lmem(obj),
 					  0xdeadbeaf, &rq);
 		if (rq) {
-			dma_resv_add_excl_fence(obj->base.resv, &rq->fence);
+			err = dma_resv_reserve_fences(obj->base.resv, 1);
+			if (!err)
+				dma_resv_add_excl_fence(obj->base.resv,
+							&rq->fence);
 			i915_request_put(rq);
 		}
 		if (err)
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index c0d6d5526abe..fe9f89289418 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1633,6 +1633,12 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 			intel_frontbuffer_put(front);
 		}
 
+		if (!(flags & __EXEC_OBJECT_NO_RESERVE)) {
+			err = dma_resv_reserve_fences(vma->obj->base.resv, 1);
+			if (unlikely(err))
+				return err;
+		}
+
 		if (fence) {
 			dma_resv_add_excl_fence(vma->obj->base.resv, fence);
 			obj->write_domain = I915_GEM_DOMAIN_RENDER;
@@ -1640,7 +1646,7 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 		}
 	} else {
 		if (!(flags & __EXEC_OBJECT_NO_RESERVE)) {
-			err = dma_resv_reserve_shared(vma->obj->base.resv, 1);
+			err = dma_resv_reserve_fences(vma->obj->base.resv, 1);
 			if (unlikely(err))
 				return err;
 		}
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 7acba1d2135e..7f40502b2c1e 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -895,6 +895,13 @@ static int igt_lmem_write_cpu(void *arg)
 	}
 
 	i915_gem_object_lock(obj, NULL);
+
+	err = dma_resv_reserve_fences(obj->base.resv, 1);
+	if (err) {
+		i915_gem_object_unlock(obj);
+		goto out_put;
+	}
+
 	/* Put the pages into a known state -- from the gpu for added fun */
 	intel_engine_pm_get(engine);
 	err = intel_context_migrate_clear(engine->gt->migrate.context, NULL,
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 6a6f6f2ead75..9435a3ca71c8 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -256,13 +256,11 @@ int lima_gem_get_info(struct drm_file *file, u32 handle, u32 *va, u64 *offset)
 static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
 			    bool write, bool explicit)
 {
-	int err = 0;
+	int err;
 
-	if (!write) {
-		err = dma_resv_reserve_shared(lima_bo_resv(bo), 1);
-		if (err)
-			return err;
-	}
+	err = dma_resv_reserve_fences(lima_bo_resv(bo), 1);
+	if (err)
+		return err;
 
 	/* explicit sync use user passed dep fence */
 	if (explicit)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6cfa984dee6a..993dbcd7a586 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -320,16 +320,14 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		bool write = submit->bos[i].flags & MSM_SUBMIT_BO_WRITE;
 
-		if (!write) {
-			/* NOTE: _reserve_shared() must happen before
-			 * _add_shared_fence(), which makes this a slightly
-			 * strange place to call it.  OTOH this is a
-			 * convenient can-fail point to hook it in.
-			 */
-			ret = dma_resv_reserve_shared(obj->resv, 1);
-			if (ret)
-				return ret;
-		}
+		/* NOTE: _reserve_shared() must happen before
+		 * _add_shared_fence(), which makes this a slightly
+		 * strange place to call it.  OTOH this is a
+		 * convenient can-fail point to hook it in.
+		 */
+		ret = dma_resv_reserve_fences(obj->resv, 1);
+		if (ret)
+			return ret;
 
 		/* exclusive fences must be ordered */
 		if (no_implicit && !write)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index a3a04e0d76ec..0268259e97eb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -346,11 +346,9 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 	struct dma_resv *resv = nvbo->bo.base.resv;
 	int i, ret;
 
-	if (!exclusive) {
-		ret = dma_resv_reserve_shared(resv, 1);
-		if (ret)
-			return ret;
-	}
+	ret = dma_resv_reserve_fences(resv, 1);
+	if (ret)
+		return ret;
 
 	/* Waiting for the exclusive fence first causes performance regressions
 	 * under some circumstances. So manually wait for the shared ones first.
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a6925dbb6224..c34114560e49 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -247,6 +247,10 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
+		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
+		if (ret)
+			return ret;
+
 		/* panfrost always uses write mode in its current uapi */
 		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
 							      true);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 469979cd0341..cde1e8ddaeaa 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -200,7 +200,7 @@ static int qxl_release_validate_bo(struct qxl_bo *bo)
 			return ret;
 	}
 
-	ret = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 9ed2b2700e0a..446f7bae54c4 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -535,6 +535,10 @@ static int radeon_bo_vm_update_pte(struct radeon_cs_parser *p,
 			return r;
 
 		radeon_sync_fence(&p->ib.sync, bo_va->last_pt_update);
+
+		r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
+		if (r)
+			return r;
 	}
 
 	return radeon_vm_clear_invalids(rdev, vm);
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index b827b87aefe2..afca4bf59a8d 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -783,6 +783,14 @@ void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
 		     bool shared)
 {
 	struct dma_resv *resv = bo->tbo.base.resv;
+	int r;
+
+	r = dma_resv_reserve_fences(resv, 1);
+	if (r) {
+		/* As last resort on OOM we block for the fence */
+		dma_fence_wait(&fence->base, false);
+		return;
+	}
 
 	if (shared)
 		dma_resv_add_shared_fence(resv, &fence->base);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index bb53016f3138..987cabbf1318 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -831,7 +831,7 @@ static int radeon_vm_update_ptes(struct radeon_device *rdev,
 		int r;
 
 		radeon_sync_resv(rdev, &ib->sync, pt->tbo.base.resv, true);
-		r = dma_resv_reserve_shared(pt->tbo.base.resv, 1);
+		r = dma_resv_reserve_fences(pt->tbo.base.resv, 1);
 		if (r)
 			return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index db3dc7ef5382..1dd6f13bb03c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -762,7 +762,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 
 	dma_resv_add_shared_fence(bo->base.resv, fence);
 
-	ret = dma_resv_reserve_shared(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret)) {
 		dma_fence_put(fence);
 		return ret;
@@ -821,7 +821,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	bool type_found = false;
 	int i, ret;
 
-	ret = dma_resv_reserve_shared(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret))
 		return ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 544a84fa6589..862d2f22412a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -221,9 +221,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	fbo->base = *bo;
 
-	ttm_bo_get(bo);
-	fbo->bo = bo;
-
 	/**
 	 * Fix up members that we shouldn't copy directly:
 	 * TODO: Explicit member copy would probably be better here.
@@ -251,6 +248,15 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
+	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
+	if (ret) {
+		kfree(fbo);
+		return ret;
+	}
+
+	ttm_bo_get(bo);
+	fbo->bo = bo;
+
 	ttm_bo_move_to_lru_tail_unlocked(&fbo->base);
 
 	*new_obj = &fbo->base;
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 071c48d672c6..789c645f004e 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -90,6 +90,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
+		unsigned int num_fences;
 
 		ret = ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
 		if (ret == -EALREADY && dups) {
@@ -100,12 +101,10 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 			continue;
 		}
 
+		num_fences = min(entry->num_shared, 1u);
 		if (!ret) {
-			if (!entry->num_shared)
-				continue;
-
-			ret = dma_resv_reserve_shared(bo->base.resv,
-								entry->num_shared);
+			ret = dma_resv_reserve_fences(bo->base.resv,
+						      num_fences);
 			if (!ret)
 				continue;
 		}
@@ -120,9 +119,9 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 			ret = ttm_bo_reserve_slowpath(bo, intr, ticket);
 		}
 
-		if (!ret && entry->num_shared)
-			ret = dma_resv_reserve_shared(bo->base.resv,
-								entry->num_shared);
+		if (!ret)
+			ret = dma_resv_reserve_fences(bo->base.resv,
+						      num_fences);
 
 		if (unlikely(ret != 0)) {
 			if (ticket) {
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 92bc0faee84f..961812d33827 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -259,16 +259,21 @@ v3d_lock_bo_reservations(struct v3d_job *job,
 		return ret;
 
 	for (i = 0; i < job->bo_count; i++) {
+		ret = dma_resv_reserve_fences(job->bo[i]->resv, 1);
+		if (ret)
+			goto fail;
+
 		ret = drm_sched_job_add_implicit_dependencies(&job->base,
 							      job->bo[i], true);
-		if (ret) {
-			drm_gem_unlock_reservations(job->bo, job->bo_count,
-						    acquire_ctx);
-			return ret;
-		}
+		if (ret)
+			goto fail;
 	}
 
 	return 0;
+
+fail:
+	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 4abf10b66fe8..594bd6bb00d2 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -644,7 +644,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 	for (i = 0; i < exec->bo_count; i++) {
 		bo = &exec->bo[i]->base;
 
-		ret = dma_resv_reserve_shared(bo->resv, 1);
+		ret = dma_resv_reserve_fences(bo->resv, 1);
 		if (ret) {
 			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
 			return ret;
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index bd6f75285fd9..2ddbebca87d9 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -157,12 +157,14 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 	}
 
 	/* Expose the fence via the dma-buf */
-	ret = 0;
 	dma_resv_lock(resv, NULL);
-	if (arg->flags & VGEM_FENCE_WRITE)
-		dma_resv_add_excl_fence(resv, fence);
-	else if ((ret = dma_resv_reserve_shared(resv, 1)) == 0)
-		dma_resv_add_shared_fence(resv, fence);
+	ret = dma_resv_reserve_fences(resv, 1);
+	if (!ret) {
+		if (arg->flags & VGEM_FENCE_WRITE)
+			dma_resv_add_excl_fence(resv, fence);
+		else
+			dma_resv_add_shared_fence(resv, fence);
+	}
 	dma_resv_unlock(resv);
 
 	/* Record the fence in our idr for later signaling */
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 48d3c9955f0d..1820ca6cf673 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -214,6 +214,7 @@ void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
 
 int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
 {
+	unsigned int i;
 	int ret;
 
 	if (objs->nents == 1) {
@@ -222,6 +223,14 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
 		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
 						&objs->ticket);
 	}
+	if (ret)
+		return ret;
+
+	for (i = 0; i < objs->nents; ++i) {
+		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
+		if (ret)
+			return ret;
+	}
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 31aecc46624b..fe13aa8b4a64 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -747,16 +747,22 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
 			 struct vmw_fence_obj *fence)
 {
 	struct ttm_device *bdev = bo->bdev;
-
 	struct vmw_private *dev_priv =
 		container_of(bdev, struct vmw_private, bdev);
+	int ret;
 
-	if (fence == NULL) {
+	if (fence == NULL)
 		vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
+	else
+		dma_fence_get(&fence->base);
+
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	if (!ret)
 		dma_resv_add_excl_fence(bo->base.resv, &fence->base);
-		dma_fence_put(&fence->base);
-	} else
-		dma_resv_add_excl_fence(bo->base.resv, &fence->base);
+	else
+		/* Last resort fallback when we are OOM */
+		dma_fence_wait(&fence->base, false);
+	dma_fence_put(&fence->base);
 }
 
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index ecb697d4d861..5fa04d0fccad 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -117,7 +117,7 @@ struct dma_resv {
 	 * A new fence is added by calling dma_resv_add_shared_fence(). Since
 	 * this often needs to be done past the point of no return in command
 	 * submission it cannot fail, and therefore sufficient slots need to be
-	 * reserved by calling dma_resv_reserve_shared().
+	 * reserved by calling dma_resv_reserve_fences().
 	 *
 	 * Note that actual semantics of what an exclusive or shared fence mean
 	 * is defined by the user, for reservation objects shared across drivers
@@ -413,7 +413,7 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
-int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
+int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 			     struct dma_fence *fence);
-- 
2.25.1

