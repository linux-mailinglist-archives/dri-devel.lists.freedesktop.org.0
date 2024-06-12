Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA939051F0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600EA10E045;
	Wed, 12 Jun 2024 12:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3oo5W+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F420910E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193805; x=1749729805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lBNlVnbacLL3aNTrnTTtESID2s6aEyQRslHd+e7cEhk=;
 b=X3oo5W+uuVZ78xo7cjdFCSi9P0bkY9iWlVTBFh53lWlEDbozfuom0Vpn
 jXSvDE6wjmesBVgfmEfkW9/BYw9x5tiatTyYOzGyGv9x1OJYDLA5I1wyj
 EQoctNP8xzB69cvZgESrJJYv4NcGryhmnbVBHVT2WSZsNkcmPfcnOeI6k
 bjbywWIAgcAw2bAGqpcO8QToh5kDTf3xqg1jLywBIQVdHZibSlnHiGEQG
 1YFqS+KAZpwqblyVxGrtZ0UknTQ5WCm+JfHP+k0RZDxWhU8xsKSNdzMPj
 TBnuQ1X2K+/HHcmNwE/sCUcm9fLeTOgdVH83nSzGRuIJP9MS8Sz2bUfkw A==;
X-CSE-ConnectionGUID: Boll0Np+RAW+TfOCMBYvFw==
X-CSE-MsgGUID: PRQIicD2RI6vW7T8V9jbZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077588"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:25 -0700
X-CSE-ConnectionGUID: +EupcGbVRYqIOe0DG2ItOw==
X-CSE-MsgGUID: pGKMq+w8Ri+oDlhgpDXzzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574007"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:23 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 01/12] drm/ttm/tests: Fix a warning in
 ttm_bo_unreserve_bulk
Date: Wed, 12 Jun 2024 14:02:55 +0200
Message-Id: <c5bd2df114781b4eb5c1e8295b2ae4ac2c30a179.1718192625.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718192625.git.karolina.stolarek@intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
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

BOs in a bulk move have to share the same reservation object. That is
not the case in the ttm_bo_unreserve_bulk subtest. Update
ttm_bo_kunit_init() helper to accept dma_resv object so we can define
buffer objects that share the same resv. Update calls to that helper
accordingly.

Fixes: 995279d280d1 ("drm/ttm/tests: Add tests for ttm_bo functions")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 40 +++++++++++--------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  7 +++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  3 +-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |  4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 20 +++++-----
 6 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc92..ffcfe5e6709a 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -56,7 +56,7 @@ static void ttm_bo_reserve_optimistic_no_ticket(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_bo_reserve(bo, params->interruptible, params->no_wait, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -71,7 +71,7 @@ static void ttm_bo_reserve_locked_no_sleep(struct kunit *test)
 	bool no_wait = true;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	/* Let's lock it beforehand */
 	dma_resv_lock(bo->base.resv, NULL);
@@ -92,7 +92,7 @@ static void ttm_bo_reserve_no_wait_ticket(struct kunit *test)
 
 	ww_acquire_init(&ctx, &reservation_ww_class);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
 	KUNIT_ASSERT_EQ(test, err, -EBUSY);
@@ -110,7 +110,7 @@ static void ttm_bo_reserve_double_resv(struct kunit *test)
 
 	ww_acquire_init(&ctx, &reservation_ww_class);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -138,8 +138,8 @@ static void ttm_bo_reserve_deadlock(struct kunit *test)
 	bool no_wait = false;
 	int err;
 
-	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
-	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
+	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	ww_acquire_init(&ctx1, &reservation_ww_class);
 	mutex_lock(&bo2->base.resv->lock.base);
@@ -208,7 +208,7 @@ static void ttm_bo_reserve_interrupted(struct kunit *test)
 	struct task_struct *task;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	task = kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-reserve");
 
@@ -249,7 +249,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 	bo->priority = bo_prio;
 
 	err = ttm_resource_alloc(bo, place, &res1);
@@ -288,7 +288,7 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 	place = ttm_place_kunit_init(test, mem_type, 0);
 
 	dma_resv_lock(bo->base.resv, NULL);
@@ -321,6 +321,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	struct ttm_resource *res1, *res2;
 	struct ttm_device *ttm_dev;
 	struct ttm_place *place;
+	struct dma_resv *resv;
 	uint32_t mem_type = TTM_PL_SYSTEM;
 	unsigned int bo_priority = 0;
 	int err;
@@ -332,12 +333,17 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
+	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
 	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
-	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	dma_resv_init(resv);
+
+	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE, resv);
+	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE, resv);
 
 	dma_resv_lock(bo1->base.resv, NULL);
 	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
@@ -363,6 +369,8 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 
 	ttm_resource_free(bo1, &res1);
 	ttm_resource_free(bo2, &res2);
+
+	dma_resv_fini(resv);
 }
 
 static void ttm_bo_put_basic(struct kunit *test)
@@ -384,7 +392,7 @@ static void ttm_bo_put_basic(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 	bo->type = ttm_bo_type_device;
 
 	err = ttm_resource_alloc(bo, place, &res);
@@ -445,7 +453,7 @@ static void ttm_bo_put_shared_resv(struct kunit *test)
 
 	dma_fence_signal(fence);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 	bo->type = ttm_bo_type_device;
 	bo->base.resv = external_resv;
 
@@ -467,7 +475,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	for (int i = 0; i < no_pins; i++) {
 		dma_resv_lock(bo->base.resv, NULL);
@@ -502,7 +510,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_resource_alloc(bo, place, &res);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -553,7 +561,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_resource_alloc(bo, place, &res);
 	KUNIT_ASSERT_EQ(test, err, 0);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7b7c1fa805fc..5be317a0af56 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -51,7 +51,8 @@ EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
 
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
-					    size_t size)
+					    size_t size,
+					    struct dma_resv *obj)
 {
 	struct drm_gem_object gem_obj = { };
 	struct ttm_buffer_object *bo;
@@ -61,6 +62,10 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 	KUNIT_ASSERT_NOT_NULL(test, bo);
 
 	bo->base = gem_obj;
+
+	if (obj)
+		bo->base.resv = obj;
+
 	err = drm_gem_object_init(devs->drm, &bo->base, size);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index 2f51c833a536..c83d31b23c9a 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -28,7 +28,8 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  bool use_dma32);
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
-					    size_t size);
+					    size_t size,
+					    struct dma_resv *obj);
 struct ttm_place *ttm_place_kunit_init(struct kunit *test,
 				       uint32_t mem_type, uint32_t flags);
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 0a3fede84da9..4643f91c6bd5 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -57,7 +57,7 @@ static struct ttm_tt *ttm_tt_kunit_init(struct kunit *test,
 	struct ttm_tt *tt;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, priv->devs, size);
+	bo = ttm_bo_kunit_init(test, priv->devs, size, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, bo);
 	priv->mock_bo = bo;
 
@@ -209,7 +209,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, devs, size);
+	bo = ttm_bo_kunit_init(test, devs, size, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, bo);
 
 	err = ttm_sg_tt_init(tt, bo, 0, caching);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 029e1f094bb0..67584058dadb 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -54,7 +54,7 @@ static void ttm_init_test_mocks(struct kunit *test,
 	/* Make sure we have what we need for a good BO mock */
 	KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
 
-	priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
+	priv->bo = ttm_bo_kunit_init(test, priv->devs, size, NULL);
 	priv->place = ttm_place_kunit_init(test, mem_type, flags);
 }
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index fd4502c18de6..67bf51723c92 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -63,7 +63,7 @@ static void ttm_tt_init_basic(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, test->priv, params->size);
+	bo = ttm_bo_kunit_init(test, test->priv, params->size, NULL);
 
 	err = ttm_tt_init(tt, bo, page_flags, caching, extra_pages);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -89,7 +89,7 @@ static void ttm_tt_init_misaligned(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
 
 	/* Make the object size misaligned */
 	bo->base.size += 1;
@@ -110,7 +110,7 @@ static void ttm_tt_fini_basic(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_tt_init(tt, bo, 0, caching, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -130,7 +130,7 @@ static void ttm_tt_fini_sg(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_sg_tt_init(tt, bo, 0, caching);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -151,7 +151,7 @@ static void ttm_tt_fini_shmem(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_tt_init(tt, bo, 0, caching, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -168,7 +168,7 @@ static void ttm_tt_create_basic(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 	bo->type = ttm_bo_type_device;
 
 	dma_resv_lock(bo->base.resv, NULL);
@@ -187,7 +187,7 @@ static void ttm_tt_create_invalid_bo_type(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 	bo->type = ttm_bo_type_sg + 1;
 
 	dma_resv_lock(bo->base.resv, NULL);
@@ -208,7 +208,7 @@ static void ttm_tt_create_ttm_exists(struct kunit *test)
 	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	err = ttm_tt_init(tt, bo, 0, caching, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -239,7 +239,7 @@ static void ttm_tt_create_failed(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	/* Update ttm_device_funcs so we don't alloc ttm_tt */
 	devs->ttm_dev->funcs = &ttm_dev_empty_funcs;
@@ -257,7 +257,7 @@ static void ttm_tt_destroy_basic(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	int err;
 
-	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
 
 	dma_resv_lock(bo->base.resv, NULL);
 	err = ttm_tt_create(bo, false);
-- 
2.34.1

