Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8BB07564
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416310E27D;
	Wed, 16 Jul 2025 12:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nGKH27zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3510E25A;
 Wed, 16 Jul 2025 12:15:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so22747715e9.0; 
 Wed, 16 Jul 2025 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752668124; x=1753272924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=3fxM1hSuse8OSedIhya2+rL/rZZQZq0RN5u6v8xUF/o=;
 b=nGKH27zxNOaF5xCI1wyoJOJi55nhBuzVDUIy4fAcGjw6eYJ4VmvKEruWBSct1eshc0
 CD8sQyAIr67xpg9Ehsy9vTV/qv7SvRSg547ittyCvwCq083PFdiOJv8gUC4yflFhLnqZ
 zf6q92J/abB34Zv/QUbnkFtmJJRqMl7o9COMjJfGEB2ESR2qxPS3mxfSHJl2VqKCoaMl
 0PJ7BcPFxdfPsAitrpFAWKeTMCF8lKQQmtlD7o3rfE7b/uCBi3C1tu2+JduMM/H9j90Z
 VtDxxiK1rPsprYC6Zphc412W0GY93WU3soXVNY22+zzewGfuAqy19kV0eLhS0Fzh68cw
 WyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752668124; x=1753272924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fxM1hSuse8OSedIhya2+rL/rZZQZq0RN5u6v8xUF/o=;
 b=RWaCyF9gNt5z4WZ1T9lIsrSxLaoIP9xwVWn2T4MgSUAmgoW4TVscgMwg+mIF2wI3/4
 l6kZGbOmh5KyOFWUjCGMb4EcX36JrWl0zmVWuCvOSCd+iQqbS7ppskF96xs0ZxTx2zzw
 5oDR/pdTjFtIfvJrp2aZRranuIztInfupgUwlAAlnv0UxIYTACLMs80sPbxz53LMYpib
 Wv673qVaOZs8r+dX6x34gZJ4yOVdkwu4+zwpZMMEiCSvKxoqNBDwBAOK78sXQpm+TGHL
 xotiKxUBoXKI5Vsq/cuwTO9i2rS66AhapDLFDldwlM/WqKNNx621X+mdOxJ2vSj/qsJc
 XAvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPeQ4IG/1FnL4NtRvmPZkZ0H5kDyxwJg9sQVVhAB6AZOxKzBJhLeenvVwErHXrKgG5HUUdfXJLqio=@lists.freedesktop.org,
 AJvYcCUjNaszkcQdK9wM/uqbaCcSM3K4y+Yiks95NhPwoHgfFjo/AOHzTgW/JgbFfOSdJzP8eNNE2csuuGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznEyKpgBT+nrVz3v31y9gcETdRrqPwFIKGdFKN0Y1j1cCQcQ0f
 8zj/rgsGjkgmRdRULOdzaZZ7MSHh++aDyjueORS5pcMNepq/Sx7/ZFzS
X-Gm-Gg: ASbGncvIG4mD1taDVopbokDTSqcyWtY0gL/7mFazcZ2Bd02S3Kq4NQj+yFUswPgjm2f
 Vnnmoyzg4Iufydom139Nhq6KQW6m7DsnqWtmpyILEDdfN/ypO79p/LRU6jzTmgaD0Bcq1sPEFc8
 UZVUL0SiRyCQusNs8w3nX3TceRCBIX++vNFUgzF6Xo+YJEIQoIDwUVB5i1LdkAMbuljD/23QK9n
 dKfz5EDmkIXkqpzNHJQuSNL4eDw6R8trknGOUjYTQqBoSM+LA76TJ6XDkS4onpT7KMhTh5j+eOI
 Bm5Pkp+X8a9NgVm1No1d8KRYuojDeUasQBLcksRdHOxWRud+MTkjQwjEx12gUuoeNOBZzTgoYu0
 Q0Bik9cxbK9UcJZ8ziHJ4GZYQv00D3S/ZsA==
X-Google-Smtp-Source: AGHT+IEijVvUeTrZQBpbcffp8+i7Dmg7KOz8v8HCS7z4HxjqU24ICfh4r7Of0pznilxUkL0cXqQaiA==
X-Received: by 2002:a05:6000:2288:b0:3b2:dfc6:2485 with SMTP id
 ffacd0b85a97d-3b60e4c5127mr1641062f8f.4.1752668123944; 
 Wed, 16 Jul 2025 05:15:23 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:a070:d03e:65e1:892])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2bb4sm19121735e9.8.2025.07.16.05.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 05:15:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/ttm: rename ttm_bo_put to _fini v2
Date: Wed, 16 Jul 2025 14:15:22 +0200
Message-ID: <20250716121522.3340-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Give TTM BOs a separate cleanup function.

No funktional change, but the next step in removing the TTM BO reference
counting and replacing it with the GEM object reference counting.

v2: move the code around a bit to make it clearer what's happening

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  4 +-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 12 ++--
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 60 +++++++++----------
 drivers/gpu/drm/ttm/ttm_bo.c                  | 15 +++--
 drivers/gpu/drm/ttm/ttm_bo_internal.h         |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 include/drm/ttm/ttm_bo.h                      |  2 +-
 14 files changed, 58 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 6626a6e64ff5..0a5b204086f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -198,7 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
 
 	amdgpu_hmm_unregister(aobj);
-	ttm_bo_put(&aobj->tbo);
+	ttm_bo_fini(&aobj->tbo);
 }
 
 int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b04cde4a60e7..90760d0ca071 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -107,7 +107,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
 
 static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
 {
-	/* We got here via ttm_bo_put(), which means that the
+	/* We got here via ttm_bo_fini(), which means that the
 	 * TTM buffer object in 'bo' has already been cleaned
 	 * up; only release the GEM object.
 	 */
@@ -234,11 +234,11 @@ EXPORT_SYMBOL(drm_gem_vram_create);
  * drm_gem_vram_put() - Releases a reference to a VRAM-backed GEM object
  * @gbo:	the GEM VRAM object
  *
- * See ttm_bo_put() for more information.
+ * See ttm_bo_fini() for more information.
  */
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
 {
-	ttm_bo_put(&gbo->bo);
+	ttm_bo_fini(&gbo->bo);
 }
 EXPORT_SYMBOL(drm_gem_vram_put);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 1f4814968868..57bb111d65da 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1029,7 +1029,7 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 {
 	GEM_BUG_ON(!obj->ttm.created);
 
-	ttm_bo_put(i915_gem_to_ttm(obj));
+	ttm_bo_fini(i915_gem_to_ttm(obj));
 }
 
 static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
@@ -1325,7 +1325,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * If this function fails, it will call the destructor, but
 	 * our caller still owns the object. So no freeing in the
 	 * destructor until obj->ttm.created is true.
-	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
+	 * Similarly, in delayed_destroy, we can't call ttm_bo_fini()
 	 * until successful initialization.
 	 */
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index a720d8f53209..22d0eced95da 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -57,7 +57,7 @@ static void lsdc_gem_object_free(struct drm_gem_object *obj)
 	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
 
 	if (tbo)
-		ttm_bo_put(tbo);
+		ttm_bo_fini(tbo);
 }
 
 static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct iosys_map *map)
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 690e10fbf0bd..395d92ab6271 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -87,7 +87,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 		return;
 	}
 
-	ttm_bo_put(&nvbo->bo);
+	ttm_bo_fini(&nvbo->bo);
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index fc5e3763c359..d26043424e95 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -39,7 +39,7 @@ void qxl_gem_object_free(struct drm_gem_object *gobj)
 	qxl_surface_evict(qdev, qobj, false);
 
 	tbo = &qobj->tbo;
-	ttm_bo_put(tbo);
+	ttm_bo_fini(tbo);
 }
 
 int qxl_gem_object_create(struct qxl_device *qdev, int size,
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index f86773f3db20..18ca1bcfd2f9 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -86,7 +86,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
 
 	if (robj) {
 		radeon_mn_unregister(robj);
-		ttm_bo_put(&robj->tbo);
+		ttm_bo_fini(&robj->tbo);
 	}
 }
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 6c77550c51af..5426b435f702 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	dma_resv_fini(resv);
 }
 
-static void ttm_bo_put_basic(struct kunit *test)
+static void ttm_bo_fini_basic(struct kunit *test)
 {
 	struct ttm_test_devices *priv = test->priv;
 	struct ttm_buffer_object *bo;
@@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit *test)
 	dma_resv_unlock(bo->base.resv);
 	KUNIT_EXPECT_EQ(test, err, 0);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static const char *mock_name(struct dma_fence *f)
@@ -423,7 +423,7 @@ static const struct dma_fence_ops mock_fence_ops = {
 	.get_timeline_name = mock_name,
 };
 
-static void ttm_bo_put_shared_resv(struct kunit *test)
+static void ttm_bo_fini_shared_resv(struct kunit *test)
 {
 	struct ttm_test_devices *priv = test->priv;
 	struct ttm_buffer_object *bo;
@@ -463,7 +463,7 @@ static void ttm_bo_put_shared_resv(struct kunit *test)
 	bo->type = ttm_bo_type_device;
 	bo->base.resv = external_resv;
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static void ttm_bo_pin_basic(struct kunit *test)
@@ -616,8 +616,8 @@ static struct kunit_case ttm_bo_test_cases[] = {
 	KUNIT_CASE(ttm_bo_unreserve_basic),
 	KUNIT_CASE(ttm_bo_unreserve_pinned),
 	KUNIT_CASE(ttm_bo_unreserve_bulk),
-	KUNIT_CASE(ttm_bo_put_basic),
-	KUNIT_CASE(ttm_bo_put_shared_resv),
+	KUNIT_CASE(ttm_bo_fini_basic),
+	KUNIT_CASE(ttm_bo_fini_shared_resv),
 	KUNIT_CASE(ttm_bo_pin_basic),
 	KUNIT_CASE(ttm_bo_pin_unpin_resource),
 	KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 1bcc67977f48..3a1eef83190c 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -144,7 +144,7 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
 				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
 
 	ttm_resource_free(bo, &bo->resource);
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static void ttm_bo_init_reserved_mock_man(struct kunit *test)
@@ -186,7 +186,7 @@ static void ttm_bo_init_reserved_mock_man(struct kunit *test)
 				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
 
 	ttm_resource_free(bo, &bo->resource);
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
 
@@ -221,7 +221,7 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
 
 	ttm_resource_free(bo, &bo->resource);
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static void ttm_bo_validate_basic(struct kunit *test)
@@ -265,7 +265,7 @@ static void ttm_bo_validate_basic(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo->resource->placement,
 			DRM_BUDDY_TOPDOWN_ALLOCATION);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
 
@@ -292,7 +292,7 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static void ttm_bo_validate_failed_alloc(struct kunit *test)
@@ -321,7 +321,7 @@ static void ttm_bo_validate_failed_alloc(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
 }
 
@@ -353,7 +353,7 @@ static void ttm_bo_validate_pinned(struct kunit *test)
 	ttm_bo_unpin(bo);
 	dma_resv_unlock(bo->base.resv);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
@@ -403,7 +403,7 @@ static void ttm_bo_validate_same_placement(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 
 	if (params->mem_type != TTM_PL_SYSTEM)
 		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
@@ -452,7 +452,7 @@ static void ttm_bo_validate_busy_placement(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
 	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
@@ -495,7 +495,7 @@ static void ttm_bo_validate_multihop(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
 	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 
 	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
 	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
@@ -567,7 +567,7 @@ static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
 		KUNIT_ASSERT_TRUE(test, flags & TTM_TT_FLAG_ZERO_ALLOC);
 	}
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static int threaded_dma_resv_signal(void *arg)
@@ -635,7 +635,7 @@ static void ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
 	/* Make sure we have an idle object at this point */
 	dma_resv_wait_timeout(bo->base.resv, usage, false, MAX_SCHEDULE_TIMEOUT);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
@@ -668,7 +668,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
 	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	dma_fence_put(man->move);
 }
 
@@ -753,7 +753,7 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	else
 		KUNIT_EXPECT_EQ(test, bo->resource->mem_type, fst_mem);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
@@ -807,8 +807,8 @@ static void ttm_bo_validate_happy_evict(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type, mem_type);
 
 	for (i = 0; i < bo_no; i++)
-		ttm_bo_put(&bos[i]);
-	ttm_bo_put(bo_val);
+		ttm_bo_fini(&bos[i]);
+	ttm_bo_fini(bo_val);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
@@ -852,12 +852,12 @@ static void ttm_bo_validate_all_pinned_evict(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
 
-	ttm_bo_put(bo_small);
+	ttm_bo_fini(bo_small);
 
 	ttm_bo_reserve(bo_big, false, false, NULL);
 	ttm_bo_unpin(bo_big);
 	dma_resv_unlock(bo_big->base.resv);
-	ttm_bo_put(bo_big);
+	ttm_bo_fini(bo_big);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
@@ -916,13 +916,13 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo_evictable->resource->mem_type, mem_type_evict);
 	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2 + BO_SIZE);
 
-	ttm_bo_put(bo);
-	ttm_bo_put(bo_evictable);
+	ttm_bo_fini(bo);
+	ttm_bo_fini(bo_evictable);
 
 	ttm_bo_reserve(bo_pinned, false, false, NULL);
 	ttm_bo_unpin(bo_pinned);
 	dma_resv_unlock(bo_pinned->base.resv);
-	ttm_bo_put(bo_pinned);
+	ttm_bo_fini(bo_pinned);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
@@ -973,8 +973,8 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, bo_big->ttm);
 	KUNIT_EXPECT_NULL(test, bo_big->resource);
 
-	ttm_bo_put(bo_small);
-	ttm_bo_put(bo_big);
+	ttm_bo_fini(bo_small);
+	ttm_bo_fini(bo_big);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
 
@@ -1025,8 +1025,8 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type, mem_type);
 	KUNIT_EXPECT_NULL(test, bo_val->resource);
 
-	ttm_bo_put(bo_init);
-	ttm_bo_put(bo_val);
+	ttm_bo_fini(bo_init);
+	ttm_bo_fini(bo_val);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
@@ -1070,8 +1070,8 @@ static void ttm_bo_validate_evict_gutting(struct kunit *test)
 	KUNIT_ASSERT_NULL(test, bo_evict->resource);
 	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC);
 
-	ttm_bo_put(bo_evict);
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo_evict);
+	ttm_bo_fini(bo);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
@@ -1128,9 +1128,9 @@ static void ttm_bo_validate_recrusive_evict(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type_evict);
 
-	ttm_bo_put(bo_val);
-	ttm_bo_put(bo_tt);
-	ttm_bo_put(bo_mock);
+	ttm_bo_fini(bo_val);
+	ttm_bo_fini(bo_tt);
+	ttm_bo_fini(bo_mock);
 }
 
 static struct kunit_case ttm_bo_validate_test_cases[] = {
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f4d9e68b21e7..9c9e132558d4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -318,18 +318,17 @@ static void ttm_bo_release(struct kref *kref)
 	bo->destroy(bo);
 }
 
-/**
- * ttm_bo_put
- *
- * @bo: The buffer object.
- *
- * Unreference a buffer object.
- */
+/* TODO: remove! */
 void ttm_bo_put(struct ttm_buffer_object *bo)
 {
 	kref_put(&bo->kref, ttm_bo_release);
 }
-EXPORT_SYMBOL(ttm_bo_put);
+
+void ttm_bo_fini(struct ttm_buffer_object *bo)
+{
+	ttm_bo_put(bo);
+}
+EXPORT_SYMBOL(ttm_bo_fini);
 
 static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 				     struct ttm_operation_ctx *ctx,
diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
index 9d8b747a34db..e0d48eac74b0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
@@ -55,4 +55,6 @@ ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
 	return bo;
 }
 
+void ttm_bo_put(struct ttm_buffer_object *bo);
+
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 7057d852951b..e564d071f40b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -37,7 +37,7 @@ static void vmw_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gobj);
 	if (bo)
-		ttm_bo_put(bo);
+		ttm_bo_fini(bo);
 }
 
 static int vmw_gem_object_open(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..ea458b2f0bb0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1650,7 +1650,7 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	 * refcount directly if needed.
 	 */
 	__xe_bo_vunmap(gem_to_xe_bo(obj));
-	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
+	ttm_bo_fini(container_of(obj, struct ttm_buffer_object, base));
 }
 
 static void xe_gem_object_close(struct drm_gem_object *obj,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 479b7ed075c0..da5c2e4971dc 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -391,7 +391,7 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
 int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx);
-void ttm_bo_put(struct ttm_buffer_object *bo);
+void ttm_bo_fini(struct ttm_buffer_object *bo);
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 			  struct ttm_lru_bulk_move *bulk);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
-- 
2.43.0

