Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F6DAF12E4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD9310E6DA;
	Wed,  2 Jul 2025 11:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lO5kU1RX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531310E6D1;
 Wed,  2 Jul 2025 11:00:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4042286f8f.3; 
 Wed, 02 Jul 2025 04:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751454032; x=1752058832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zozcE2yt5P4zyGe2O1cUiU7km9Yt7O5BBpJWGW/qT4Y=;
 b=lO5kU1RX0cJcTgAtNZ8yps/FIZhbw7nsLfvc/mWhOR3GezNG57VmcllvBzpJFmkeyK
 2fTJbjBh6MLqbAnGfut57XcOkdKVLoH1VRtWyI40cYPR9RPZjKXrEFGu1Z8yYBjcuqjQ
 Ua8UcsoA2RfSKbhKfaQv2Lf4SvuP0GFSbN7r/aYCz+yTWitjVGJn7XNdmkK7V/paMTsJ
 IqPlwjPP/DXON6+3Fiadqp2UoayXZX9QcYm7V8ZcMeeOtozlUIWcGX+lzniVdcM1+qFp
 ZoG8qx3eNncwXhHcCb27T5UrP1aU3anF9/A22WkE8pa6phYP4agPRob39zVTInJFWo5i
 ykzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751454032; x=1752058832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zozcE2yt5P4zyGe2O1cUiU7km9Yt7O5BBpJWGW/qT4Y=;
 b=CGwXfG1okljceJ4WDjML9YPRd2Ov11to4WVdfFnlF+XrDfqfE+TtVSgeGcVui8FQgu
 ad+a8azETXXTPy6sokkD+uis64KidK7I1hidByBU9JqWB6PDET5b5gXEeDpxp98eRnKZ
 zaz7c/O6TcyG+StqhtrFZncEKO1cgUaOz42kmwhmStAl5yAG8mynbYcappeD9yiYEoya
 nQzSSq6W9Qx6HvcbxAX04aZ+ymMW8xgwQe/Tw94UZ+BDqATpqJgKTA10tcF1uV1qYOEZ
 fIKa+BKJZC+fK5FC9TS2jSYwHYUYTOelywJ7EpT068DYyv3YxA2o5ndtRB1rl9iChyUk
 0Xlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWD0I5mEmGi+Q+/iIdXW9rcKxFCUNfNndzAJ901f01aCaAHzvh0XIwttFAH/5cx61435UqKATi5J0=@lists.freedesktop.org,
 AJvYcCWKePocZ//0VSQEsZ7zhtDTbexgx4FlED8iC7c7B6unMGbqAA2bMvuRqLCV5zWD0tz3Cg3D2BX3@lists.freedesktop.org,
 AJvYcCXGZTtDOTVSixn8QHzap8fpK2sSgJYikqkdUzhd1twktT/AZLFQ/LLuC9QJ0KbYfBqTHKU7bMAKgQzj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP9yePO4WM8zelZJrzktn052Zn/m0QYemr3Moy+xDFHczNhqMU
 KsfsF7+NqNZPyjacB4cYwFrsYhq3n4iG2Ojm+QFHwfuI/FQns/pbv3DQ
X-Gm-Gg: ASbGnct/ltOmHE2fL/51oi1QwLPhBDhxc8J53HEE33JaHiAgbgCWhsRqsLnDbQuxvvm
 561u1pIUbRoRS9cYAgEi7e67IsDGDlHOm8X8p3xkNmXlvrCnr6MgMtyeBxlS6l1BImeLDrVd72d
 LFF+JU4fTd4u2Z1Lv8UsnkltYJ7VwKx0zT16tXMIn2ZbLtws2R1YvbtUnvSUgsWiO9q1cJBmUIL
 vq/xv4AunLZg6mrV37m1Z0iPt7yFOX+615KwD6qQAme8DAk9fv5mkXdUSUjmWOkxONbdN2rgYKy
 x4xJDnriszzFpuLgFlkbZXXA/LZtgNCmy/vy9lEUXvLDMkfgf2QrSlQkTdMKHfxig2XwZh3IbJI
 e/56kSZeCzfo=
X-Google-Smtp-Source: AGHT+IFZS3a5m+eLFc9oyuunKKunicWyvdPM17porbIxhlrznQSg6ULOuVMN5BMPKNba9vM89m0C2Q==
X-Received: by 2002:a05:6000:1a86:b0:3a4:ef00:a78c with SMTP id
 ffacd0b85a97d-3b2019b72abmr1719274f8f.55.1751454031421; 
 Wed, 02 Jul 2025 04:00:31 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:1e00:ab87:1cdf:ca26:fa8c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b913esm220664735e9.33.2025.07.02.04.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:00:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: rename ttm_bo_put to _fini
Date: Wed,  2 Jul 2025 13:00:27 +0200
Message-Id: <20250702110028.2521-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702110028.2521-1-christian.koenig@amd.com>
References: <20250702110028.2521-1-christian.koenig@amd.com>
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
index e5e33a68d935..9a2a8496eea3 100644
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
index f4d9e68b21e7..3ea27c9707ef 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -49,6 +49,14 @@
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
@@ -318,18 +326,11 @@ static void ttm_bo_release(struct kref *kref)
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
index 7aa2c17825da..c4aa3eaba2a2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1649,7 +1649,7 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	 * refcount directly if needed.
 	 */
 	__xe_bo_vunmap(gem_to_xe_bo(obj));
-	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
+	ttm_bo_fini(container_of(obj, struct ttm_buffer_object, base));
 }
 
 static void xe_gem_object_close(struct drm_gem_object *obj,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 894ff7ccd68e..21dac074b94d 100644
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
2.34.1

