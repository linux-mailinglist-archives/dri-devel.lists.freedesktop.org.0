Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBDADB128
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D85410E39D;
	Mon, 16 Jun 2025 13:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qui8ZcH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2305710E39B;
 Mon, 16 Jun 2025 13:07:35 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso5436932a12.0; 
 Mon, 16 Jun 2025 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750079253; x=1750684053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+rQeAuwVLQ8vBldVjNbK1SMu6BlRh147HzB4aK90NkI=;
 b=Qui8ZcH6loXncY2QengW5ig0hvtagO3VvUTte3OJ5bSpmVHQVOvdUKTIp8b9FQuOS8
 2byWEtXybeVZyUEbEBkE04DY9Ew8tECTY55Gt3avLaMPjPvUuCluHz/FiVkUci9Cq2gz
 F3XpgQ+q/P4aoffEAdu4ItnxbxYijBuD5Xk4CpgAHsXCByNo+TqQcNzmqojGgkxWTEM9
 e2eyklu0TFdvUyyx0F1xfLpFIZQ5suMN9rWnDChS+7DrSjwlpEk/UcJ6ocOJsk12K7ru
 KqvC9ZUGNZoMviLxLJEuDjTcH1UuzaO8pl48mWuJVkMoxovVrmMJ5b5Gaye0semtOn/a
 7eZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750079253; x=1750684053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rQeAuwVLQ8vBldVjNbK1SMu6BlRh147HzB4aK90NkI=;
 b=tgJ7YoVjwBPQyF4NGwgwKf2Y4OAvSWpf87OsgDsq1siywfczanOYh5G03IK/Y0e/0e
 VoJUK+F75qoBIqSJt3cSJooq9vouHNka2Q/fYAwLGEBK/RfIjQIqALZPe9sfGXdAS6r/
 /r20tJyOrkRxz3TMarTgjCwzWVFK7pduPIj0mOFC+kOcwkbOQrytmWut5NBeMEfgCVur
 1g26IHDt4dMIaRG8GGzOyN0DoJW08r/0IHcK1udRjeNoE7VDJHBhPSSelEfB66n/I57W
 3PFcQZ/xwqVbLR+mao8Mk7wGWwMtNpQstrWVrAw1ru/gTJWbfz8ythbjsrip+vgElPQv
 7c5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKA8QWMhphDXDy42uqpevk6R17wF73souB+PcQtDO4+2BKUJVpiEJQ+EEAJuYNgHqMeXAh91MPBZs=@lists.freedesktop.org,
 AJvYcCWnzeufUDAmCwVMjDWShMHeQ9AFlwZBrSeLRfbVs0vBWNasYuFxEsphQJ9owOsVEuc6ABYoST7Ryt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd7NSizqwSsUOCRPjNNmOEjLZtg8RwF+waTeRLy41T+aCPBwvu
 S+9WHxgguUSTdS5W9DXpYrKPhaaHdZPeZTZDXV+w/0v/xd9C2Xusvhq9
X-Gm-Gg: ASbGncuss/bqaDvQz0uAhPGfWTKu00U1zznkar7aB8NI5i0j30WEHF9rb3qXkB1QK6T
 jSO8rIEjsRBiRWJ0/TNiXcCwc1QhNXZfwJQxminjr3sAFiWMV9u9gULCo/lDMtbFYx9gKRojrW5
 KMRyHJ7DMi4cvT6q5P9ixmiu54cciJd+LjPgk9O0DmsKwqI1r6GMpcGGlbtWBfDo4WqDpROxxy8
 7QJIHUk/rY6MwLBNyYHfpXCuj4V+h3q+70PetrP1L5oGwu9tj0sDX1RDozKyxljGKLrUFE511WI
 YFrcBYudHnJH1OdgLlMIbM8DjPHeVFa96XsWzI9TDuN5JiLux0grvsl3ki5urOX7Vl8jNsXns6P
 j
X-Google-Smtp-Source: AGHT+IEQZb8avbANwB4w2lzdc2c5yMHcLMYtKMp5HPbINE8C48BhJ4k5F4h74RlbGkwOZM6HhlNBiw==
X-Received: by 2002:a17:907:9810:b0:adb:469d:223b with SMTP id
 a640c23a62f3a-adfad451c9cmr830484866b.49.1750079253005; 
 Mon, 16 Jun 2025 06:07:33 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1535:2600:63e1:a803:ebae:a9dd])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf93630a33sm520717766b.29.2025.06.16.06.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:07:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 6/6] drm/ttm: replace TTMs refcount with the DRM refcount
Date: Mon, 16 Jun 2025 15:07:26 +0200
Message-Id: <20250616130726.22863-6-christian.koenig@amd.com>
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

Instead of keeping a separate reference count for the TTM object also use
the reference count for DRM GEM objects inside TTM.

Apart from avoiding two reference counts for one object this approach has
the clear advantage of being able to use drm_exec inside TTM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   2 -
 drivers/gpu/drm/ttm/ttm_bo.c                  | 146 +++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_internal.h         |   9 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |   2 +-
 include/drm/ttm/ttm_bo.h                      |   9 --
 6 files changed, 81 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 6766e1753343..7b908920aae5 100644
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
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index b91c13f46225..7bc8eae77b8c 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -190,8 +190,6 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 	bo->bdev = devs->ttm_dev;
 	bo->destroy = dummy_ttm_bo_destroy;
 
-	kref_init(&bo->kref);
-
 	return bo;
 }
 EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index abcf45bc3930..071cbad2fe9e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -48,14 +48,6 @@
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
@@ -252,82 +244,91 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
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
+static const struct drm_gem_object_funcs ttm_deleted_object_funcs = {
+	.free = ttm_bo_free
+};
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
 
@@ -471,7 +472,7 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	if (!bo->resource || bo->resource->mem_type != mem_type)
 		goto out_bo_moved;
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (!ret)
 			ttm_bo_cleanup_memtype_use(bo);
@@ -525,7 +526,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
 		return 0;
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		lret = ttm_bo_wait_ctx(bo, walk->ctx);
 		if (!lret)
 			ttm_bo_cleanup_memtype_use(bo);
@@ -623,7 +624,6 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
@@ -642,7 +642,6 @@ EXPORT_SYMBOL(ttm_bo_pin);
 void ttm_bo_unpin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
 	if (WARN_ON_ONCE(!bo->pin_count))
 		return;
 
@@ -931,7 +930,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 {
 	int ret;
 
-	kref_init(&bo->kref);
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = alignment;
@@ -1127,7 +1125,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
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
index 56f3152f34f5..56645039757e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -245,7 +245,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	atomic_inc(&ttm_glob.bo_count);
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
-	kref_init(&fbo->base.kref);
+	kref_init(&fbo->base.base.refcount);
 	fbo->base.destroy = &ttm_transfered_destroy;
 	fbo->base.pin_count = 0;
 	if (bo->type != ttm_bo_type_sg)
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 4b0552d1bc55..4fe4031f0165 100644
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

