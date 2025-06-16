Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA7ADB124
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C793110E392;
	Mon, 16 Jun 2025 13:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AIeTI6nP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05F010E386;
 Mon, 16 Jun 2025 13:07:32 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ade326e366dso815247166b.3; 
 Mon, 16 Jun 2025 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750079251; x=1750684051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VqDPS65+t3taX5zIuxcpVu/59+ugpF4WvwzbYL+TyO4=;
 b=AIeTI6nP+BaaCKcjKkueuFoKMugaPosWT1g4ko+ZvHjPEu5XPSTOzD1TSPqwL8jLvE
 irIAqxCOSCvwCbNNKnD+KTwQWJs1NZeQ6xt4pfh3F2MwNTHOnjvOZDCWBAg6qZQoiQaZ
 IfiziawKf+6CqI7i/88TwRInGfw+IAnxodA+D43TPnZz5I25ioHIoOMvuIoR0a47T6WP
 Cn7BJO9DROftdgkwJDXpM/EMwij36DbbmwE1A3EyOtMinSD5AOlKs2DRyxC6KEkm1wsL
 /HG6dYa9HIT1n9PLwJK/MkuoefBnTdIdD5Cx03dwovKg+XnC/8XeZCb9C3MxcmVpV/B6
 jUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750079251; x=1750684051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqDPS65+t3taX5zIuxcpVu/59+ugpF4WvwzbYL+TyO4=;
 b=vr3wOrcq20rct6D88NVgzYYuMikTapWhozK+VM+N/JlwwxxBixSkvgCjBKL4Ulaord
 q4qE0d+RTtVHpPQ8uE5+0MrvAdxlBB+vintJSjhULCdtmCyUupMakhIOC1OjgMRJ4oqu
 Ze6aPLI9wSSgnOJrqLdLcroCqKsAZ/U+YkpJzISfXKX74U/UFd25k1glNXdrLQuhVsqk
 In2gdzwRcxHqraLn3GG9fwUWWQWLpm8H2E1eZHrjZnv9GzpnFJKsLT+6H9qkzTVUf1AK
 s718XdqVK6u+AzpHOqpkK6zTT0u7rDVGVbfEwj154kCpW1lEIFoycPo5+ClxBr3jZxVm
 oDGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTbgajpacGXgtqeBR1j9iOJVVXozXofPwhgTbAYs24/3DqMjoboM4wi0xapP9wxr7XosgD8P6mFCM=@lists.freedesktop.org,
 AJvYcCXXoe/4Im+zIMPbx9u+Z13gGHJ9fa8jqy028ZnsLaDEwjhM6U5spE/mYI+X770sPM1h4dcm6hcE8XM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2QzEpH81AKEVxYWoIAQBYMhvZiFU7kcrDZTe5ctZWTq6XVW/J
 OK7M0EELCoZ2K2mRVTJl5jay8tVNhZdw5+ph+wx5KDP0AwvLopkdr/vt
X-Gm-Gg: ASbGncsHF7nkjXXqmZX+aunoDZGOGaewFaLZH631sKzZKBtdoTrDEmCABEBqyHWPX4C
 BPJULyyAVvAPRoCj0Brp29Ep5vLlOTmrmbUgdCKCF/erdoueo7bkOzJBZftEgex5S/AHWu/J9ro
 dT9GIOYRjrmVIO2A6/AF+RHiDkoktisPnMF9LnmsMFk2RVBVj4Ojs1+x5bnbW5RroBF5hywTvtV
 53BmpM5KOFymtME8PGyWb3AUluG5XC9ZHLRUrX62cSR1Oz7wB0k+++SVr7RGCDvzbzRTyvmkPFW
 9J3aDYtFcpVLEDdNIg6jT9QGCB/E/z1L6GRCqwaxtcjG4211ktp20vt5B+K4He2HoUAzmqZSauF
 k
X-Google-Smtp-Source: AGHT+IHzdAgo0f8rQqFFQ5FG5K1PtGxU1kU1cB2GvCm2kBMD4ClxU+JnClhTZIdrQmMNyAgGC3INDw==
X-Received: by 2002:a17:907:ea5:b0:add:f0a2:d5d8 with SMTP id
 a640c23a62f3a-adfad296d0emr799655466b.11.1750079250869; 
 Mon, 16 Jun 2025 06:07:30 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1535:2600:63e1:a803:ebae:a9dd])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf93630a33sm520717766b.29.2025.06.16.06.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:07:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 4/6] drm/ttm: rename ttm_bo_put to _fini
Date: Mon, 16 Jun 2025 15:07:24 +0200
Message-Id: <20250616130726.22863-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616130726.22863-1-christian.koenig@amd.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
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

The next step in removing the TTM BO reference counting and replacing it
with the GEM object reference counting.

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
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 64 +++++++++----------
 drivers/gpu/drm/ttm/ttm_bo.c                  | 21 +++---
 drivers/gpu/drm/ttm/ttm_bo_internal.h         |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 include/drm/ttm/ttm_bo.h                      |  2 +-
 14 files changed, 64 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 0ecc88df7208..1d5756be974a 100644
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
index ead50fef5e7d..3cb0acdd7bba 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -106,7 +106,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
 
 static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
 {
-	/* We got here via ttm_bo_put(), which means that the
+	/* We got here via ttm_bo_fini(), which means that the
 	 * TTM buffer object in 'bo' has already been cleaned
 	 * up; only release the GEM object.
 	 */
@@ -233,11 +233,11 @@ EXPORT_SYMBOL(drm_gem_vram_create);
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
index 3148f5d3dbd6..4553c4e0e0f1 100644
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
@@ -566,7 +566,7 @@ static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
 		KUNIT_ASSERT_TRUE(test, flags & TTM_TT_FLAG_ZERO_ALLOC);
 	}
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static int threaded_dma_resv_signal(void *arg)
@@ -634,7 +634,7 @@ static void ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
 	/* Make sure we have an idle object at this point */
 	dma_resv_wait_timeout(bo->base.resv, usage, false, MAX_SCHEDULE_TIMEOUT);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 }
 
 static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
@@ -667,7 +667,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
 	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	dma_fence_put(man->move);
 }
 
@@ -752,7 +752,7 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	else
 		KUNIT_EXPECT_EQ(test, bo->resource->mem_type, fst_mem);
 
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo);
 	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
@@ -801,8 +801,8 @@ static void ttm_bo_validate_swapout(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, TTM_PL_SYSTEM);
 	KUNIT_EXPECT_TRUE(test, bo_small->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
 
-	ttm_bo_put(bo_big);
-	ttm_bo_put(bo_small);
+	ttm_bo_fini(bo_big);
+	ttm_bo_fini(bo_small);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
@@ -856,8 +856,8 @@ static void ttm_bo_validate_happy_evict(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type, mem_type);
 
 	for (i = 0; i < bo_no; i++)
-		ttm_bo_put(&bos[i]);
-	ttm_bo_put(bo_val);
+		ttm_bo_fini(&bos[i]);
+	ttm_bo_fini(bo_val);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
@@ -901,12 +901,12 @@ static void ttm_bo_validate_all_pinned_evict(struct kunit *test)
 
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
@@ -965,13 +965,13 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
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
@@ -1022,8 +1022,8 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, bo_big->ttm);
 	KUNIT_EXPECT_NULL(test, bo_big->resource);
 
-	ttm_bo_put(bo_small);
-	ttm_bo_put(bo_big);
+	ttm_bo_fini(bo_small);
+	ttm_bo_fini(bo_big);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
 
@@ -1074,8 +1074,8 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type, mem_type);
 	KUNIT_EXPECT_NULL(test, bo_val->resource);
 
-	ttm_bo_put(bo_init);
-	ttm_bo_put(bo_val);
+	ttm_bo_fini(bo_init);
+	ttm_bo_fini(bo_val);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
@@ -1119,8 +1119,8 @@ static void ttm_bo_validate_evict_gutting(struct kunit *test)
 	KUNIT_ASSERT_NULL(test, bo_evict->resource);
 	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC);
 
-	ttm_bo_put(bo_evict);
-	ttm_bo_put(bo);
+	ttm_bo_fini(bo_evict);
+	ttm_bo_fini(bo);
 
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
@@ -1177,9 +1177,9 @@ static void ttm_bo_validate_recrusive_evict(struct kunit *test)
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
index 0f874f1e2526..abcf45bc3930 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -48,6 +48,14 @@
 #include "ttm_module.h"
 #include "ttm_bo_internal.h"
 
+static void ttm_bo_release(struct kref *kref);
+
+/* TODO: remove! */
+void ttm_bo_put(struct ttm_buffer_object *bo)
+{
+	kref_put(&bo->kref, ttm_bo_release);
+}
+
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
 {
@@ -317,18 +325,11 @@ static void ttm_bo_release(struct kref *kref)
 	bo->destroy(bo);
 }
 
-/**
- * ttm_bo_put
- *
- * @bo: The buffer object.
- *
- * Unreference a buffer object.
- */
-void ttm_bo_put(struct ttm_buffer_object *bo)
+void ttm_bo_fini(struct ttm_buffer_object *bo)
 {
-	kref_put(&bo->kref, ttm_bo_release);
+	ttm_bo_put(bo);
 }
-EXPORT_SYMBOL(ttm_bo_put);
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
index 2a8e7cb8c982..a43b3f4f3da3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1647,7 +1647,7 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	 * refcount directly if needed.
 	 */
 	__xe_bo_vunmap(gem_to_xe_bo(obj));
-	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
+	ttm_bo_fini(container_of(obj, struct ttm_buffer_object, base));
 }
 
 static void xe_gem_object_close(struct drm_gem_object *obj,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8ad6e2713625..4b0552d1bc55 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -383,7 +383,7 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
 int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx);
-void ttm_bo_put(struct ttm_buffer_object *bo);
+void ttm_bo_fini(struct ttm_buffer_object *bo);
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 			  struct ttm_lru_bulk_move *bulk);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
-- 
2.34.1

