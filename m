Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218AB07AAA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6E710E7E5;
	Wed, 16 Jul 2025 16:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mbkEQhFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3976610E7DC;
 Wed, 16 Jul 2025 16:06:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so30505e9.2; 
 Wed, 16 Jul 2025 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681965; x=1753286765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PT3mlqMD+Qajgs/YlapKPVuyPhWId62hWdvioUlPKJI=;
 b=mbkEQhFrA146vlQ1vz/+RxGL4lvt+yrgxEX123+cdPiYp9G2cpMIRq2GGyn4T9KfFw
 e7Fiuj7mWtBY9K3bPvCTbZvbh2nm0WQBQy4zvVVlXumRuRZ8ReWvDu0+MOvvo5Cw+TK6
 FpPZE2/V8xgpYDb+UjnQqg6xttglV92fAoSei0ub+6xqaDXRV4G2M0lB3IsL5uKBhl0K
 MW7XgIQAHTmv+vNRnRg+koK2EKD41+MP3f49++sT6CvIeD4jkfroH0FUqn6KqrZejmbh
 lP+6DFfPBuO40Nand25ZGGO+84JOooRPIB45Gr8D3ZWkvQbP7fxIQa8vayuOZuMrbzl+
 L+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681965; x=1753286765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PT3mlqMD+Qajgs/YlapKPVuyPhWId62hWdvioUlPKJI=;
 b=dS6NfHfMfSaxboJRNX+XT928JHnLDVtquVCKyRs98kfqMxsD2MrHIlWkI4RzXT7KUR
 RS5UtToyK3lH8nDbELSJinwZTdxBiHppR2ePtSfpH53JbVv9tVRepcHvrDHZeIPsFS88
 OJBtWnqpIVBRv/2lp+v7ZzqnNOizpD2xV+RAAHumsKO/PJ7a8k+JG63EYphISCDHELkE
 XR3BLp/4E8h2myWyXf5SiDdhNmOhVERatsQLXB39J3+CmykTlefizbCHis41d5k2se0f
 kjxBu/z8kv1KijyNXt7kHnZpNE5sjVDlQc5ZirB5ozXPGZsSuQJudsd2KGuQZ+fMBKRV
 N2Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBChm4gu8XJ8dO8NN8OxtXjUd0KxN0PYnVUtNv4DIJW5dFp/o5gA8ep4kSBOKPFNRKIThEeSvY4vY=@lists.freedesktop.org,
 AJvYcCX88A92wyCbx3Q42HSr/bzRjZbSuYwOW2Pdq8U6vFZO/ZGWWFxxHjwvSA3rB+mHS7n1gp2DUmxfxpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYM89DAQh6o731Otor57jionLP4AJd6NAh93r23WurTvIQGPqI
 YebWhDaQQXe7z9pToN7ulcy1fHHG+Gv8Y5Bpvs0vRhhWVzShp8s6dWUO
X-Gm-Gg: ASbGnctXA+NN4bAsIBdvJfiUV7Cp8cmABcLCz/pUsDC+084IK/211VjVxJdvqbA5hPS
 mHyK0gv3OfgD+S7ZyjgVNiRqT/5k4gEYcSWc9xGwH5ZpizsiBCMV3f4xml19VRypOWES69GwXg5
 TNydStTKYAzUI3txDhaIV65Kj9yv655SnDdyfElRL+U3SZEf1a0tshTS8m99/ZU44vR8NVgD5po
 8purWWthWXFzwFw+amTDfjhPxNnnaaFCRTgzDVOQ2mzuaWUqcbTLv+EOcn1dEaWztoZrnGs9NA8
 ejDu0Aq+xN4vsFo5AR5BgKLnYVbu6IjBCh3i3l/JBvFYtYTK4VVvWEse2FERIktkY/UAv9I9aLv
 1JE7WNpm+mes05mA8iiDzk/f8/hbaGVcYums=
X-Google-Smtp-Source: AGHT+IFlUTndbmSxn5hUcGIx0WjrgS0SXTomq/8fsgWtt2ANfLgm0H6iDhaULqi8Jt3CZDMOzHZpvw==
X-Received: by 2002:a5d:5e88:0:b0:3a5:58a5:6a83 with SMTP id
 ffacd0b85a97d-3b60dd4fe6fmr3658297f8f.13.1752681960025; 
 Wed, 16 Jul 2025 09:06:00 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:05:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/7] drm/ttm: replace TTMs refcount with the DRM refcount v3
Date: Wed, 16 Jul 2025 18:04:20 +0200
Message-ID: <20250716160555.20217-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716160555.20217-1-christian.koenig@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
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
v3: handle another case in i915

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  35 ++---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   8 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   2 -
 drivers/gpu/drm/ttm/ttm_bo.c                  | 146 +++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_internal.h         |   9 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 include/drm/ttm/ttm_bo.h                      |   9 --
 8 files changed, 100 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 57bb111d65da..37175020f123 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -932,7 +932,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	 * Don't manipulate the TTM LRUs while in TTM bo destruction.
 	 * We're called through i915_ttm_delete_mem_notify().
 	 */
-	if (!kref_read(&bo->kref))
+	if (!kref_read(&bo->base.refcount))
 		return;
 
 	/*
@@ -950,30 +950,21 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	 *
 	 * TODO: consider maybe also bumping the shrinker list here when we have
 	 * already unpinned it, which should give us something more like an LRU.
-	 *
-	 * TODO: There is a small window of opportunity for this function to
-	 * get called from eviction after we've dropped the last GEM refcount,
-	 * but before the TTM deleted flag is set on the object. Avoid
-	 * adjusting the shrinker list in such cases, since the object is
-	 * not available to the shrinker anyway due to its zero refcount.
-	 * To fix this properly we should move to a TTM shrinker LRU list for
-	 * these objects.
 	 */
-	if (kref_get_unless_zero(&obj->base.refcount)) {
-		if (shrinkable != obj->mm.ttm_shrinkable) {
-			if (shrinkable) {
-				if (obj->mm.madv == I915_MADV_WILLNEED)
-					__i915_gem_object_make_shrinkable(obj);
-				else
-					__i915_gem_object_make_purgeable(obj);
-			} else {
-				i915_gem_object_make_unshrinkable(obj);
-			}
-
-			obj->mm.ttm_shrinkable = shrinkable;
+	i915_gem_object_get(obj);
+	if (shrinkable != obj->mm.ttm_shrinkable) {
+		if (shrinkable) {
+			if (obj->mm.madv == I915_MADV_WILLNEED)
+				__i915_gem_object_make_shrinkable(obj);
+			else
+				__i915_gem_object_make_purgeable(obj);
+		} else {
+			i915_gem_object_make_unshrinkable(obj);
 		}
-		i915_gem_object_put(obj);
+
+		obj->mm.ttm_shrinkable = shrinkable;
 	}
+	i915_gem_object_put(obj);
 
 	/*
 	 * Put on the correct LRU list depending on the MADV status
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 3a1eef83190c..65e31d171634 100644
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
@@ -928,6 +928,8 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
 }
 
+extern const struct drm_gem_object_funcs ttm_deleted_object_funcs;
+
 static void ttm_bo_validate_deleted_evict(struct kunit *test)
 {
 	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
@@ -958,7 +960,7 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
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
index 9c9e132558d4..d456be1d6e1e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,7 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_util.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -245,88 +246,92 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
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
 
-			kref_init(&bo->kref);
-			spin_unlock(&bo->bdev->lru_lock);
+	drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
+	ttm_mem_io_free(bdev, bo->resource);
 
-			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
+	if (!dma_resv_test_signaled(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP) ||
+	    (want_init_on_free() && (bo->ttm != NULL)) ||
+	    bo->type == ttm_bo_type_sg ||
+	    !dma_resv_trylock(bo->base.resv)) {
+		/* The BO is not idle, resurrect it for delayed destroy */
+		ttm_bo_flush_all_fences(bo);
 
-			/* Schedule the worker on the closest NUMA node. This
-			 * improves performance since system memory might be
-			 * cleared on free and that is best done on a CPU core
-			 * close to it.
-			 */
-			queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
-			return;
+		spin_lock(&bo->bdev->lru_lock);
+
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
 
-		ttm_bo_cleanup_memtype_use(bo);
-		dma_resv_unlock(bo->base.resv);
-	}
+		kref_init(&bo->base.refcount);
+		bo->base.funcs = &ttm_deleted_object_funcs;
+		spin_unlock(&bo->bdev->lru_lock);
 
-	atomic_dec(&ttm_glob.bo_count);
-	bo->destroy(bo);
-}
+		INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
 
-/* TODO: remove! */
-void ttm_bo_put(struct ttm_buffer_object *bo)
-{
-	kref_put(&bo->kref, ttm_bo_release);
-}
+		/* Schedule the worker on the closest NUMA node. This
+		 * improves performance since system memory might be
+		 * cleared on free and that is best done on a CPU core
+		 * close to it.
+		 */
+		queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
+	} else {
+		ttm_bo_cleanup_memtype_use(bo);
+		dma_resv_unlock(bo->base.resv);
 
-void ttm_bo_fini(struct ttm_buffer_object *bo)
-{
-	ttm_bo_put(bo);
+		atomic_dec(&ttm_glob.bo_count);
+		bo->destroy(bo);
+	}
 }
 EXPORT_SYMBOL(ttm_bo_fini);
 
@@ -470,7 +475,7 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	if (!bo->resource || bo->resource->mem_type != mem_type)
 		goto out_bo_moved;
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (!ret)
 			ttm_bo_cleanup_memtype_use(bo);
@@ -524,7 +529,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
 		return 0;
 
-	if (bo->deleted) {
+	if (ttm_bo_is_zombie(bo)) {
 		lret = ttm_bo_wait_ctx(bo, walk->arg.ctx);
 		if (!lret)
 			ttm_bo_cleanup_memtype_use(bo);
@@ -624,7 +629,6 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
@@ -643,7 +647,6 @@ EXPORT_SYMBOL(ttm_bo_pin);
 void ttm_bo_unpin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
 	if (WARN_ON_ONCE(!bo->pin_count))
 		return;
 
@@ -932,7 +935,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 {
 	int ret;
 
-	kref_init(&bo->kref);
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = alignment;
@@ -1128,7 +1130,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
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
index 6502ced6169d..ef1e42e005af 100644
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
index ea458b2f0bb0..9411114c6d5c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1418,7 +1418,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool locked;
 
-	xe_assert(xe, !kref_read(&ttm_bo->kref));
+	xe_assert(xe, !kref_read(&ttm_bo->base.refcount));
 
 	/*
 	 * We can typically only race with TTM trylocking under the
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index da5c2e4971dc..5a16d304a849 100644
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
2.43.0

