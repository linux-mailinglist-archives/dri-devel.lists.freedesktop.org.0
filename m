Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC7AF12E7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431A10E6DD;
	Wed,  2 Jul 2025 11:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aqNOE5hO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F5910E6D4;
 Wed,  2 Jul 2025 11:00:34 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so39999775e9.0; 
 Wed, 02 Jul 2025 04:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751454033; x=1752058833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t0ds9AK2Ik2eMHYEjgFhwa0DurtBkDcoHUWx0LuuV/E=;
 b=aqNOE5hOaLcs87/9HuFZeIhZ2y7FHMP1wWCsMKIDPWmAgWxDzsO6yP6HLWmBL3HLkA
 BnOFWhNk9dArayaYDQ5I6iOQ4/sR7LqL0yStlm/0JNJMK1U6/Z8ugMY1tSl3fxjvuBrS
 o/Qq+wax8P4veDEftnCnbWdI/9yxAE38k2Bgv3q+X0oFrfGqKEVbk+eRKvHY5CzIGhs3
 TNysU6fnDNE0S5Fe3H2JlP5UkFWpylEJ1MNfCj9BMM/0p2RvMD7X21PgYBPRYOj2+2hf
 Jv18ioTSCSTmJLY9IkICEcMLFmiFsDL/EBntHXcZcBMmKM2CQj+duSnB9GEitMy67Ljz
 soIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751454033; x=1752058833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0ds9AK2Ik2eMHYEjgFhwa0DurtBkDcoHUWx0LuuV/E=;
 b=Q4XjDb4nP/ja6xGm05PyzsWF6GxVgxtESaWlu2RCJkwV+syEqo1MbYEzv8vLo0aN+L
 I2VAlBJwzoemqwayABrsEeh5R9HXYWXCTJxYxVY5milsqu52bZwyg0pX2UI3Xc1tTyj/
 ucZ1NzCug27JDOZY87hzwfCUVvRT0iGyfVJ4GGpyq0KUYQ4d839YaRQsMOBEnbwhA+cc
 XWpjwfh/aWXQMdYVbqCnl9oKaag7wl3flTfanUxvA0nI5wprNzHnY+gHVbXJTO0CvK+t
 8zmZNrRkO8gQ8PrlSjwctyQmXfo0afOo2Emm9EdFtAfjFqiVWVhItDK0/YicG8IAR2ny
 Hj4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ8VnYyXPHlLvyWl240CbaCrNGz92JEwY1mF9YoeK8gnUtYZTK0R/JGuYRf33yNwh3LPrUcomM@lists.freedesktop.org,
 AJvYcCVF7N2ZDwWnEfnAuwQaoHjdRPNfbZ+ChzFVTZokykoMWOEoGHogUeoUIGZ7LkufVBdMBUVioq5U+kXf@lists.freedesktop.org,
 AJvYcCWuR35vvObfS7olcHiHVIH2niek41ln4j6hcuWHcV+aa0qBtC3LO9FTanPieZtzheQ3b2WXZFDDbKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/YY4Fwu/EHbSuhTYj/id6SvfmYdmQ/IpO0LmZFgJOGz+f5HUz
 /YqT8xbEd1PD/w4nJKfop2Sd05YQ5MkBYsckx6BC2NJnJFPUp+E6UruDo+rsSw==
X-Gm-Gg: ASbGncswn9KNuNQ8QD1LXgZ2uV8y5HLXAXBADwDyq/81U/b3zx6LgA5lnOhftRxT028
 T2FNWv+lTfbYKkZKachFPvMoTPfLNNqXlqvwNzsizbeVe28rJwey8BnIf/aDd6lKsa1DP3DDOuj
 2sWr0LBhV7i5PrEd0UyBZyWluKvkZZ8yrBrvs88CluEVCrnOvR8ywH5Sc52OKQs6w+G9ELODLyv
 kBgKiprfmNETG/ok3deHfw8kvDfminm47KWqSnM82Xqt0UGtYTqwX4prio5BGwtbIdIfgZHA15q
 KQSbs22BmkPyGdJyFG0a5vcr6iuxuNYN2M9Q3wGyMI0mwh4RD2BxCZiqPEWDTdqAFrAZg8KuA8E
 Nac/YdmLKeyE=
X-Google-Smtp-Source: AGHT+IFGwc5FhuEaXt7JBOykhhyiv8RK3vEml2cX/YpRrLvFgTbuyd5k6OmC2v5ocw4EHt79/7C0uA==
X-Received: by 2002:a05:600c:1554:b0:440:9b1a:cd78 with SMTP id
 5b1f17b1804b1-454a36e4aecmr33209145e9.10.1751454032140; 
 Wed, 02 Jul 2025 04:00:32 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:1e00:ab87:1cdf:ca26:fa8c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b913esm220664735e9.33.2025.07.02.04.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:00:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: replace TTMs refcount with the DRM refcount v2
Date: Wed,  2 Jul 2025 13:00:28 +0200
Message-Id: <20250702110028.2521-3-christian.koenig@amd.com>
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

Instead of keeping a separate reference count for the TTM object also use
the reference count for DRM GEM objects inside TTM.

Apart from avoiding two reference counts for one object this approach has
the clear advantage of being able to use drm_exec inside TTM.

v2: adjust XE assert as well and re-enable disabled test

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   8 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   2 -
 drivers/gpu/drm/ttm/ttm_bo.c                  | 148 +++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_internal.h         |   9 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 include/drm/ttm/ttm_bo.h                      |   9 --
 7 files changed, 87 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 4553c4e0e0f1..4e475a436e78 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -127,7 +127,7 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
 	dma_resv_unlock(bo->base.resv);
 
 	KUNIT_EXPECT_EQ(test, err, 0);
-	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
+	KUNIT_EXPECT_EQ(test, kref_read(&bo->base.refcount), 1);
 	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
 	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
 	KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
@@ -176,7 +176,7 @@ static void ttm_bo_init_reserved_mock_man(struct kunit *test)
 	dma_resv_unlock(bo->base.resv);
 
 	KUNIT_EXPECT_EQ(test, err, 0);
-	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
+	KUNIT_EXPECT_EQ(test, kref_read(&bo->base.refcount), 1);
 	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
 	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
 	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
@@ -977,6 +977,8 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
 }
 
+extern const struct drm_gem_object_funcs ttm_deleted_object_funcs;
+
 static void ttm_bo_validate_deleted_evict(struct kunit *test)
 {
 	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
@@ -1007,7 +1009,7 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ttm_resource_manager_usage(man), big);
 
 	dma_resv_unlock(bo_big->base.resv);
-	bo_big->deleted = true;
+	bo_big->base.funcs = &ttm_deleted_object_funcs;
 
 	bo_small = ttm_bo_kunit_init(test, test->priv, small, NULL);
 	bo_small->type = bo_type;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7aaf0d1395ff..49016fd43e50 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -193,8 +193,6 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 	bo->bdev = devs->ttm_dev;
 	bo->destroy = dummy_ttm_bo_destroy;
 
-	kref_init(&bo->kref);
-
 	return bo;
 }
 EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3ea27c9707ef..d456be1d6e1e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,7 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_util.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -49,14 +50,6 @@
 #include "ttm_module.h"
 #include "ttm_bo_internal.h"
 
-static void ttm_bo_release(struct kref *kref);
-
-/* TODO: remove! */
-void ttm_bo_put(struct ttm_buffer_object *bo)
-{
-	kref_put(&bo->kref, ttm_bo_release);
-}
-
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
 {
@@ -253,82 +246,92 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
 	ttm_bo_put(bo);
 }
 
-static void ttm_bo_release(struct kref *kref)
+static void ttm_bo_free(struct drm_gem_object *gobj)
+{
+	struct ttm_buffer_object *bo = container_of(gobj, typeof(*bo), base);
+
+	atomic_dec(&ttm_glob.bo_count);
+	bo->destroy(bo);
+}
+
+/*
+ * All other callbacks should never ever be called on a deleted TTM object.
+ */
+const struct drm_gem_object_funcs ttm_deleted_object_funcs = {
+	.free = ttm_bo_free
+};
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_deleted_object_funcs);
+
+/* Returns true if the BO is about to get deleted */
+static bool ttm_bo_is_zombie(struct ttm_buffer_object *bo)
+{
+	return bo->base.funcs == &ttm_deleted_object_funcs;
+}
+
+void ttm_bo_fini(struct ttm_buffer_object *bo)
 {
-	struct ttm_buffer_object *bo =
-	    container_of(kref, struct ttm_buffer_object, kref);
 	struct ttm_device *bdev = bo->bdev;
 	int ret;
 
 	WARN_ON_ONCE(bo->pin_count);
 	WARN_ON_ONCE(bo->bulk_move);
 
-	if (!bo->deleted) {
-		ret = ttm_bo_individualize_resv(bo);
-		if (ret) {
-			/* Last resort, if we fail to allocate memory for the
-			 * fences block for the BO to become idle
-			 */
-			dma_resv_wait_timeout(bo->base.resv,
-					      DMA_RESV_USAGE_BOOKKEEP, false,
-					      30 * HZ);
-		}
+	ret = ttm_bo_individualize_resv(bo);
+	if (ret) {
+		/* Last resort, if we fail to allocate memory for the
+		 * fences block for the BO to become idle
+		 */
+		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				      false, 30 * HZ);
+	}
 
-		if (bo->bdev->funcs->release_notify)
-			bo->bdev->funcs->release_notify(bo);
-
-		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
-		ttm_mem_io_free(bdev, bo->resource);
-
-		if (!dma_resv_test_signaled(&bo->base._resv,
-					    DMA_RESV_USAGE_BOOKKEEP) ||
-		    (want_init_on_free() && (bo->ttm != NULL)) ||
-		    bo->type == ttm_bo_type_sg ||
-		    !dma_resv_trylock(bo->base.resv)) {
-			/* The BO is not idle, resurrect it for delayed destroy */
-			ttm_bo_flush_all_fences(bo);
-			bo->deleted = true;
-
-			spin_lock(&bo->bdev->lru_lock);
-
-			/*
-			 * Make pinned bos immediately available to
-			 * shrinkers, now that they are queued for
-			 * destruction.
-			 *
-			 * FIXME: QXL is triggering this. Can be removed when the
-			 * driver is fixed.
-			 */
-			if (bo->pin_count) {
-				bo->pin_count = 0;
-				ttm_resource_move_to_lru_tail(bo->resource);
-			}
+	if (bo->bdev->funcs->release_notify)
+		bo->bdev->funcs->release_notify(bo);
+
+	drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
+	ttm_mem_io_free(bdev, bo->resource);
 
-			kref_init(&bo->kref);
-			spin_unlock(&bo->bdev->lru_lock);
+	if (!dma_resv_test_signaled(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP) ||
+	    (want_init_on_free() && (bo->ttm != NULL)) ||
+	    bo->type == ttm_bo_type_sg ||
+	    !dma_resv_trylock(bo->base.resv)) {
+		/* The BO is not idle, resurrect it for delayed destroy */
+		ttm_bo_flush_all_fences(bo);
 
-			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
+		spin_lock(&bo->bdev->lru_lock);
 
-			/* Schedule the worker on the closest NUMA node. This
-			 * improves performance since system memory might be
-			 * cleared on free and that is best done on a CPU core
-			 * close to it.
-			 */
-			queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
-			return;
+		/*
+		 * Make pinned bos immediately available to
+		 * shrinkers, now that they are queued for
+		 * destruction.
+		 *
+		 * FIXME: QXL is triggering this. Can be removed when the
+		 * driver is fixed.
+		 */
+		if (bo->pin_count) {
+			bo->pin_count = 0;
+			ttm_resource_move_to_lru_tail(bo->resource);
 		}
 
+		kref_init(&bo->base.refcount);
+		bo->base.funcs = &ttm_deleted_object_funcs;
+		spin_unlock(&bo->bdev->lru_lock);
+
+		INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
+
+		/* Schedule the worker on the closest NUMA node. This
+		 * improves performance since system memory might be
+		 * cleared on free and that is best done on a CPU core
+		 * close to it.
+		 */
+		queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
+	} else {
 		ttm_bo_cleanup_memtype_use(bo);
 		dma_resv_unlock(bo->base.resv);
-	}
 
-	atomic_dec(&ttm_glob.bo_count);
-	bo->destroy(bo);
-}
-
-void ttm_bo_fini(struct ttm_buffer_object *bo)
-{
-	ttm_bo_put(bo);
+		atomic_dec(&ttm_glob.bo_count);
+		bo->destroy(bo);
+	}
 }
 EXPORT_SYMBOL(ttm_bo_fini);
 
@@ -472,7 +475,7 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	if (!bo->resource || bo->resource->mem_type != mem_type)
 		goto out_bo_moved;
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (!ret)
 			ttm_bo_cleanup_memtype_use(bo);
@@ -526,7 +529,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
 		return 0;
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		lret = ttm_bo_wait_ctx(bo, walk->arg.ctx);
 		if (!lret)
 			ttm_bo_cleanup_memtype_use(bo);
@@ -626,7 +629,6 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
@@ -645,7 +647,6 @@ EXPORT_SYMBOL(ttm_bo_pin);
 void ttm_bo_unpin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
 	if (WARN_ON_ONCE(!bo->pin_count))
 		return;
 
@@ -934,7 +935,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 {
 	int ret;
 
-	kref_init(&bo->kref);
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = alignment;
@@ -1130,7 +1130,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 		goto out;
 	}
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		pgoff_t num_pages = bo->ttm->num_pages;
 
 		ret = ttm_bo_wait_ctx(bo, ctx);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
index e0d48eac74b0..81327bc73834 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
@@ -34,7 +34,7 @@
  */
 static inline void ttm_bo_get(struct ttm_buffer_object *bo)
 {
-	kref_get(&bo->kref);
+	drm_gem_object_get(&bo->base);
 }
 
 /**
@@ -50,11 +50,14 @@ static inline void ttm_bo_get(struct ttm_buffer_object *bo)
 static inline __must_check struct ttm_buffer_object *
 ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
 {
-	if (!kref_get_unless_zero(&bo->kref))
+	if (!kref_get_unless_zero(&bo->base.refcount))
 		return NULL;
 	return bo;
 }
 
-void ttm_bo_put(struct ttm_buffer_object *bo);
+static inline void ttm_bo_put(struct ttm_buffer_object *bo)
+{
+	drm_gem_object_put(&bo->base);
+}
 
 #endif
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 250675d56b1c..1a1860ffca60 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -247,7 +247,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	atomic_inc(&ttm_glob.bo_count);
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
-	kref_init(&fbo->base.kref);
+	kref_init(&fbo->base.base.refcount);
 	fbo->base.destroy = &ttm_transfered_destroy;
 	fbo->base.pin_count = 0;
 	if (bo->type != ttm_bo_type_sg)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c4aa3eaba2a2..c7e4904639e3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1417,7 +1417,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool locked;
 
-	xe_assert(xe, !kref_read(&ttm_bo->kref));
+	xe_assert(xe, !kref_read(&ttm_bo->base.refcount));
 
 	/*
 	 * We can typically only race with TTM trylocking under the
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 21dac074b94d..644def6c77ae 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -78,11 +78,8 @@ enum ttm_bo_type {
  * @type: The bo type.
  * @page_alignment: Page alignment.
  * @destroy: Destruction function. If NULL, kfree is used.
- * @kref: Reference count of this buffer object. When this refcount reaches
- * zero, the object is destroyed or put on the delayed delete list.
  * @resource: structure describing current placement.
  * @ttm: TTM structure holding system pages.
- * @deleted: True if the object is only a zombie and already deleted.
  * @bulk_move: The bulk move object.
  * @priority: Priority for LRU, BOs with lower priority are evicted first.
  * @pin_count: Pin count.
@@ -109,17 +106,11 @@ struct ttm_buffer_object {
 	uint32_t page_alignment;
 	void (*destroy) (struct ttm_buffer_object *);
 
-	/*
-	* Members not needing protection.
-	*/
-	struct kref kref;
-
 	/*
 	 * Members protected by the bo::resv::reserved lock.
 	 */
 	struct ttm_resource *resource;
 	struct ttm_tt *ttm;
-	bool deleted;
 	struct ttm_lru_bulk_move *bulk_move;
 	unsigned priority;
 	unsigned pin_count;
-- 
2.34.1

