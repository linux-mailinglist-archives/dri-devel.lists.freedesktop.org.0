Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65FB8A83B4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF59C1134CE;
	Wed, 17 Apr 2024 13:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agrM1K/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0F1134CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359039; x=1744895039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HM4ISemNR9jLDRakZxdx0WbmHpr8qrh1I4v4lb11zOA=;
 b=agrM1K/IroBf2cgar6ZXtdobOoBuz81FhHrEVRmwWPL5ir1jyQG3lkQB
 iZorOg/EyZGAYszJdAwOUskAcsDRHn6Z6FdWwRdbch220PmLweWAcRFWV
 zCR3ptwmWeIs/Uh47SmG19l21P7uyzanGKAxOIE7UTKLJl2YMeGMyP1E7
 gdCCbjD+GTxqn1yT2em58yIXcp37jYnzRsLo8cNVp0bZi0qeFeDkak6Yv
 hxJ6XJ6LoUxe2fsND6ukyD3OT9Fo9IqJrEL5NeXD237A6SN5bwiUZDnxf
 0FUHaQKjTnWyAPDIZ89wVm/5zFUPRwn216P0wYvH34uowW8LIRU57EWvR A==;
X-CSE-ConnectionGUID: oYwlZv20T0GgOSchHRlVIg==
X-CSE-MsgGUID: 2sexTMGSRbiqwraiarFXZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20268323"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20268323"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:59 -0700
X-CSE-ConnectionGUID: JpQBQ1PDREyBHzfSUyl/Jg==
X-CSE-MsgGUID: fWIeYqlPTrChpwLofYDcAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53569026"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.244.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:57 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v11 08/10] drm/ttm/tests: Add eviction testing
Date: Wed, 17 Apr 2024 15:03:21 +0200
Message-Id: <7ce95d43e9e457f8119132eb81cd40f02f3ac732.1713357042.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713357042.git.karolina.stolarek@intel.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
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

Add tests for ttm_bo_validate that focus on BO eviction and swapout.
Update device funcs definition with eviction-related callbacks. Add
alternative funcs where evict_flags() routes eviction to a domain
that can't allocate resources (dubbed "busy manager" in the tests).
Extract the common path of ttm_device init into a function.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
Tested-by: Somalapuram, Amaranath <asomalap@amd.com>
---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 433 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 106 ++++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   8 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  28 ++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   2 +
 5 files changed, 569 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 27ab09aa8311..3b87d837e26a 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -758,6 +758,431 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
 
+static void ttm_bo_validate_swapout(struct kunit *test)
+{
+	unsigned long size_big, size = ALIGN(BO_SIZE, PAGE_SIZE);
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_buffer_object *bo_small, *bo_big;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	uint32_t mem_type = TTM_PL_TT;
+	struct ttm_place *place;
+	struct sysinfo si;
+	int err;
+
+	si_meminfo(&si);
+	size_big = ALIGN(((uint64_t)si.totalram * si.mem_unit / 2), PAGE_SIZE);
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, size_big + size);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo_small = kunit_kzalloc(test, sizeof(*bo_small), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_small);
+
+	drm_gem_private_object_init(priv->drm, &bo_small->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_small, bo_type, placement,
+				   PAGE_SIZE, &ctx, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo_small->base.resv);
+
+	bo_big = ttm_bo_kunit_init(test, priv, size_big);
+
+	dma_resv_lock(bo_big->base.resv, NULL);
+	err = ttm_bo_validate(bo_big, placement, &ctx);
+	dma_resv_unlock(bo_big->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_NOT_NULL(test, bo_big->resource);
+	KUNIT_EXPECT_EQ(test, bo_big->resource->mem_type, mem_type);
+	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, TTM_PL_SYSTEM);
+	KUNIT_EXPECT_TRUE(test, bo_small->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
+
+	ttm_bo_put(bo_big);
+	ttm_bo_put(bo_small);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+}
+
+static void ttm_bo_validate_happy_evict(struct kunit *test)
+{
+	uint32_t mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT,
+		 mem_type_evict = TTM_PL_SYSTEM;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	uint32_t small = SZ_8K, medium = SZ_512K,
+		 big = MANAGER_SIZE - (small + medium);
+	uint32_t bo_sizes[] = { small, medium, big };
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bos, *bo_val;
+	struct ttm_placement *placement;
+	struct ttm_place *place;
+	uint32_t bo_no = 3;
+	int i, err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, mem_multihop, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bos = kunit_kmalloc_array(test, bo_no, sizeof(*bos), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bos);
+
+	memset(bos, 0, sizeof(*bos) * bo_no);
+	for (i = 0; i < bo_no; i++) {
+		drm_gem_private_object_init(priv->drm, &bos[i].base, bo_sizes[i]);
+		err = ttm_bo_init_reserved(priv->ttm_dev, &bos[i], bo_type, placement,
+					   PAGE_SIZE, &ctx_init, NULL, NULL,
+					   &dummy_ttm_bo_destroy);
+		dma_resv_unlock(bos[i].base.resv);
+	}
+
+	bo_val = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo_val->type = bo_type;
+
+	ttm_bo_reserve(bo_val, false, false, NULL);
+	err = ttm_bo_validate(bo_val, placement, &ctx_val);
+	ttm_bo_unreserve(bo_val);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, bos[0].resource->mem_type, mem_type_evict);
+	KUNIT_EXPECT_TRUE(test, bos[0].ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC);
+	KUNIT_EXPECT_TRUE(test, bos[0].ttm->page_flags & TTM_TT_FLAG_PRIV_POPULATED);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, small * 2 + BO_SIZE);
+	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type, mem_type);
+
+	for (i = 0; i < bo_no; i++)
+		ttm_bo_put(&bos[i]);
+	ttm_bo_put(bo_val);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
+}
+
+static void ttm_bo_validate_all_pinned_evict(struct kunit *test)
+{
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_buffer_object *bo_big, *bo_small;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_placement *placement;
+	uint32_t mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT;
+	struct ttm_place *place;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, mem_multihop, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo_big = kunit_kzalloc(test, sizeof(*bo_big), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_big);
+
+	drm_gem_private_object_init(priv->drm, &bo_big->base, MANAGER_SIZE);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_big, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	ttm_bo_pin(bo_big);
+	dma_resv_unlock(bo_big->base.resv);
+
+	bo_small = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo_small->type = bo_type;
+
+	ttm_bo_reserve(bo_small, false, false, NULL);
+	err = ttm_bo_validate(bo_small, placement, &ctx_val);
+	ttm_bo_unreserve(bo_small);
+
+	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
+
+	ttm_bo_put(bo_small);
+
+	ttm_bo_reserve(bo_big, false, false, NULL);
+	ttm_bo_unpin(bo_big);
+	dma_resv_unlock(bo_big->base.resv);
+	ttm_bo_put(bo_big);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
+}
+
+static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
+{
+	uint32_t mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT,
+		 mem_type_evict = TTM_PL_SYSTEM;
+	struct ttm_buffer_object *bo, *bo_evictable, *bo_pinned;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_placement *placement;
+	struct ttm_place *place;
+	uint32_t size = SZ_512K;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, mem_multihop, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo_pinned = kunit_kzalloc(test, sizeof(*bo_pinned), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_pinned);
+
+	drm_gem_private_object_init(priv->drm, &bo_pinned->base, size);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_pinned, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	ttm_bo_pin(bo_pinned);
+	dma_resv_unlock(bo_pinned->base.resv);
+
+	bo_evictable = kunit_kzalloc(test, sizeof(*bo_evictable), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_evictable);
+
+	drm_gem_private_object_init(priv->drm, &bo_evictable->base, size);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_evictable, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo_evictable->base.resv);
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo->type = bo_type;
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx_val);
+	ttm_bo_unreserve(bo);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
+	KUNIT_EXPECT_EQ(test, bo_pinned->resource->mem_type, mem_type);
+	KUNIT_EXPECT_EQ(test, bo_evictable->resource->mem_type, mem_type_evict);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2 + BO_SIZE);
+
+	ttm_bo_put(bo);
+	ttm_bo_put(bo_evictable);
+
+	ttm_bo_reserve(bo_pinned, false, false, NULL);
+	ttm_bo_unpin(bo_pinned);
+	dma_resv_unlock(bo_pinned->base.resv);
+	ttm_bo_put(bo_pinned);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
+}
+
+static void ttm_bo_validate_deleted_evict(struct kunit *test)
+{
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	uint32_t small = SZ_8K, big = MANAGER_SIZE - BO_SIZE;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_buffer_object *bo_big, *bo_small;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_resource_manager *man;
+	uint32_t mem_type = TTM_PL_VRAM;
+	struct ttm_placement *placement;
+	struct ttm_place *place;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	man = ttm_manager_type(priv->ttm_dev, mem_type);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo_big = kunit_kzalloc(test, sizeof(*bo_big), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_big);
+
+	drm_gem_private_object_init(priv->drm, &bo_big->base, big);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_big, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, ttm_resource_manager_usage(man), big);
+
+	dma_resv_unlock(bo_big->base.resv);
+	bo_big->deleted = true;
+
+	bo_small = ttm_bo_kunit_init(test, test->priv, small);
+	bo_small->type = bo_type;
+
+	ttm_bo_reserve(bo_small, false, false, NULL);
+	err = ttm_bo_validate(bo_small, placement, &ctx_val);
+	ttm_bo_unreserve(bo_small);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, mem_type);
+	KUNIT_EXPECT_EQ(test, ttm_resource_manager_usage(man), small);
+	KUNIT_EXPECT_NULL(test, bo_big->ttm);
+	KUNIT_EXPECT_NULL(test, bo_big->resource);
+
+	ttm_bo_put(bo_small);
+	ttm_bo_put(bo_big);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+}
+
+static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
+{
+	uint32_t mem_type = TTM_PL_VRAM, mem_type_evict = TTM_PL_MOCK1;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo_init, *bo_val;
+	struct ttm_placement *placement;
+	struct ttm_place *place;
+	int err;
+
+	/*
+	 * Drop the default device and setup a new one that points to busy
+	 * thus unsuitable eviction domain
+	 */
+	ttm_device_fini(priv->ttm_dev);
+
+	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev, false, false);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	ttm_busy_manager_init(priv->ttm_dev, mem_type_evict, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo_init = kunit_kzalloc(test, sizeof(*bo_init), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_init);
+
+	drm_gem_private_object_init(priv->drm, &bo_init->base, MANAGER_SIZE);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_init, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo_init->base.resv);
+
+	bo_val = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo_val->type = bo_type;
+
+	ttm_bo_reserve(bo_val, false, false, NULL);
+	err = ttm_bo_validate(bo_val, placement, &ctx_val);
+	ttm_bo_unreserve(bo_val);
+
+	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
+	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type, mem_type);
+	KUNIT_EXPECT_NULL(test, bo_val->resource);
+
+	ttm_bo_put(bo_init);
+	ttm_bo_put(bo_val);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
+}
+
+static void ttm_bo_validate_evict_gutting(struct kunit *test)
+{
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo, *bo_evict;
+	uint32_t mem_type = TTM_PL_MOCK1;
+	struct ttm_placement *placement;
+	struct ttm_place *place;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo_evict = kunit_kzalloc(test, sizeof(*bo_evict), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_evict);
+
+	drm_gem_private_object_init(priv->drm, &bo_evict->base, MANAGER_SIZE);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_evict, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo_evict->base.resv);
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo->type = bo_type;
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx_val);
+	ttm_bo_unreserve(bo);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
+	KUNIT_ASSERT_NULL(test, bo_evict->resource);
+	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC);
+
+	ttm_bo_put(bo_evict);
+	ttm_bo_put(bo);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+}
+
+static void ttm_bo_validate_recrusive_evict(struct kunit *test)
+{
+	uint32_t mem_type = TTM_PL_TT, mem_type_evict = TTM_PL_MOCK2;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
+	struct ttm_placement *placement_tt, *placement_mock;
+	struct ttm_buffer_object *bo_tt, *bo_mock, *bo_val;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_place *place_tt, *place_mock;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, mem_type_evict, MANAGER_SIZE);
+
+	place_tt = ttm_place_kunit_init(test, mem_type, 0);
+	place_mock = ttm_place_kunit_init(test, mem_type_evict, 0);
+
+	placement_tt = ttm_placement_kunit_init(test, place_tt, 1);
+	placement_mock = ttm_placement_kunit_init(test, place_mock, 1);
+
+	bo_tt = kunit_kzalloc(test, sizeof(*bo_tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_tt);
+
+	bo_mock = kunit_kzalloc(test, sizeof(*bo_mock), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo_mock);
+
+	drm_gem_private_object_init(priv->drm, &bo_tt->base, MANAGER_SIZE);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_tt, bo_type, placement_tt,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo_tt->base.resv);
+
+	drm_gem_private_object_init(priv->drm, &bo_mock->base, MANAGER_SIZE);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo_mock, bo_type, placement_mock,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo_mock->base.resv);
+
+	bo_val = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo_val->type = bo_type;
+
+	ttm_bo_reserve(bo_val, false, false, NULL);
+	err = ttm_bo_validate(bo_val, placement_tt, &ctx_val);
+	ttm_bo_unreserve(bo_val);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type_evict);
+
+	ttm_bo_put(bo_val);
+	ttm_bo_put(bo_tt);
+	ttm_bo_put(bo_mock);
+}
+
 static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
 	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man, ttm_bo_types_gen_params),
@@ -777,6 +1202,14 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE(ttm_bo_validate_move_fence_signaled),
 	KUNIT_CASE_PARAM(ttm_bo_validate_move_fence_not_signaled,
 			 ttm_bo_validate_wait_gen_params),
+	KUNIT_CASE(ttm_bo_validate_swapout),
+	KUNIT_CASE(ttm_bo_validate_happy_evict),
+	KUNIT_CASE(ttm_bo_validate_all_pinned_evict),
+	KUNIT_CASE(ttm_bo_validate_allowed_only_evict),
+	KUNIT_CASE(ttm_bo_validate_deleted_evict),
+	KUNIT_CASE(ttm_bo_validate_busy_domain_evict),
+	KUNIT_CASE(ttm_bo_validate_evict_gutting),
+	KUNIT_CASE(ttm_bo_validate_recrusive_evict),
 	{}
 };
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 3e3b67a49f3d..b924b59d10ec 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -6,6 +6,42 @@
 
 #include "ttm_kunit_helpers.h"
 
+static const struct ttm_place sys_place = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = TTM_PL_SYSTEM,
+	.flags = TTM_PL_FLAG_FALLBACK,
+};
+
+static const struct ttm_place mock1_place = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = TTM_PL_MOCK1,
+	.flags = TTM_PL_FLAG_FALLBACK,
+};
+
+static const struct ttm_place mock2_place = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = TTM_PL_MOCK2,
+	.flags = TTM_PL_FLAG_FALLBACK,
+};
+
+static struct ttm_placement sys_placement = {
+	.num_placement = 1,
+	.placement = &sys_place,
+};
+
+static struct ttm_placement bad_placement = {
+	.num_placement = 1,
+	.placement = &mock1_place,
+};
+
+static struct ttm_placement mock_placement = {
+	.num_placement = 1,
+	.placement = &mock2_place,
+};
+
 static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo,
 					   uint32_t page_flags)
 {
@@ -65,10 +101,52 @@ static int mock_move(struct ttm_buffer_object *bo, bool evict,
 	return ttm_bo_move_memcpy(bo, ctx, new_mem);
 }
 
+static void mock_evict_flags(struct ttm_buffer_object *bo,
+			     struct ttm_placement *placement)
+{
+	switch (bo->resource->mem_type) {
+	case TTM_PL_VRAM:
+	case TTM_PL_SYSTEM:
+		*placement = sys_placement;
+		break;
+	case TTM_PL_TT:
+		*placement = mock_placement;
+		break;
+	case TTM_PL_MOCK1:
+		/* Purge objects coming from this domain */
+		break;
+	}
+}
+
+static void bad_evict_flags(struct ttm_buffer_object *bo,
+			    struct ttm_placement *placement)
+{
+	*placement = bad_placement;
+}
+
+static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
+					    struct ttm_device *ttm,
+					    bool use_dma_alloc,
+					    bool use_dma32,
+					    struct ttm_device_funcs *funcs)
+{
+	struct drm_device *drm = priv->drm;
+	int err;
+
+	err = ttm_device_init(ttm, funcs, drm->dev,
+			      drm->anon_inode->i_mapping,
+			      drm->vma_offset_manager,
+			      use_dma_alloc, use_dma32);
+
+	return err;
+}
+
 struct ttm_device_funcs ttm_dev_funcs = {
 	.ttm_tt_create = ttm_tt_simple_create,
 	.ttm_tt_destroy = ttm_tt_simple_destroy,
 	.move = mock_move,
+	.eviction_valuable = ttm_bo_eviction_valuable,
+	.evict_flags = mock_evict_flags,
 };
 EXPORT_SYMBOL_GPL(ttm_dev_funcs);
 
@@ -77,17 +155,29 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  bool use_dma_alloc,
 			  bool use_dma32)
 {
-	struct drm_device *drm = priv->drm;
-	int err;
+	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
+						use_dma32, &ttm_dev_funcs);
+}
+EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
 
-	err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
-			      drm->anon_inode->i_mapping,
-			      drm->vma_offset_manager,
-			      use_dma_alloc, use_dma32);
+struct ttm_device_funcs ttm_dev_funcs_bad_evict = {
+	.ttm_tt_create = ttm_tt_simple_create,
+	.ttm_tt_destroy = ttm_tt_simple_destroy,
+	.move = mock_move,
+	.eviction_valuable = ttm_bo_eviction_valuable,
+	.evict_flags = bad_evict_flags,
+};
+EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
 
-	return err;
+int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
+				    struct ttm_device *ttm,
+				    bool use_dma_alloc,
+				    bool use_dma32)
+{
+	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
+						use_dma32, &ttm_dev_funcs_bad_evict);
 }
-EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
+EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
 
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index 3e5fe272c54c..02cb5fc4015a 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -13,7 +13,11 @@
 #include <drm/drm_kunit_helpers.h>
 #include <kunit/test.h>
 
+#define TTM_PL_MOCK1 (TTM_PL_PRIV + 1)
+#define TTM_PL_MOCK2 (TTM_PL_PRIV + 2)
+
 extern struct ttm_device_funcs ttm_dev_funcs;
+extern struct ttm_device_funcs ttm_dev_funcs_bad_evict;
 
 struct ttm_test_devices {
 	struct drm_device *drm;
@@ -26,6 +30,10 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  struct ttm_device *ttm,
 			  bool use_dma_alloc,
 			  bool use_dma32);
+int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
+				    struct ttm_device *ttm,
+				    bool use_dma_alloc,
+				    bool use_dma32);
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
index 21636b96ac38..4dffb3c274da 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -153,6 +153,14 @@ static int ttm_bad_manager_alloc(struct ttm_resource_manager *man,
 	return -ENOSPC;
 }
 
+static int ttm_busy_manager_alloc(struct ttm_resource_manager *man,
+				  struct ttm_buffer_object *bo,
+				  const struct ttm_place *place,
+				  struct ttm_resource **res)
+{
+	return -EBUSY;
+}
+
 static void ttm_bad_manager_free(struct ttm_resource_manager *man,
 				 struct ttm_resource *res)
 {
@@ -172,6 +180,12 @@ static const struct ttm_resource_manager_func ttm_bad_manager_funcs = {
 	.compatible = ttm_bad_manager_compatible
 };
 
+static const struct ttm_resource_manager_func ttm_bad_busy_manager_funcs = {
+	.alloc = ttm_busy_manager_alloc,
+	.free = ttm_bad_manager_free,
+	.compatible = ttm_bad_manager_compatible
+};
+
 int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
 			 uint32_t size)
 {
@@ -191,6 +205,20 @@ int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
 }
 EXPORT_SYMBOL_GPL(ttm_bad_manager_init);
 
+int ttm_busy_manager_init(struct ttm_device *bdev, uint32_t mem_type,
+			  uint32_t size)
+{
+	struct ttm_resource_manager *man;
+
+	ttm_bad_manager_init(bdev, mem_type, size);
+	man = ttm_manager_type(bdev, mem_type);
+
+	man->func = &ttm_bad_busy_manager_funcs;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ttm_busy_manager_init);
+
 void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
 {
 	struct ttm_resource_manager *man;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
index d2db9de9d876..7a12d73fdc07 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
@@ -25,6 +25,8 @@ int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type,
 			  uint32_t size);
 int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
 			 uint32_t size);
+int ttm_busy_manager_init(struct ttm_device *bdev, uint32_t mem_type,
+			  uint32_t size);
 void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
 void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
 
-- 
2.34.1

