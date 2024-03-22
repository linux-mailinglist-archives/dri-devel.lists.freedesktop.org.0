Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488DA886E88
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0852D1124EF;
	Fri, 22 Mar 2024 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSZeF1Y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C181124EC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117810; x=1742653810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXiYGqVeg5NaALq4mcXDPN7FV/G9q1PuqVTbQG/zC1I=;
 b=RSZeF1Y/OIzxyXfF6wX1Yf8sa1xfSFl7FuEnhGY7bf/8zW5Ro6phc7Id
 NPZYBAztoB/o2TwN9gSqf891ftAVvBrndgGrQS/VT42sZ0ucjkPB9HMa2
 i+KU0GJkuI73ceoXIhJhkimGpoL238EJYrWqyR06zY6ZP0nk+/qAAtpj2
 GPG7TZ+9pioycX2aR/jM2Vegpa9aF+Mm2hLvJZjQbwF3FFsQ2GCaIXaK+
 8zvrZRild89+x5b71zDbUssAehpq6vVrmTvbwGOZ/uMKBWrBEfY5On7kZ
 4OH+gBcWEMZAiih+qGTGrZdQ0+5wBiKUhu+V2CxWOZQn/qCRnu2ydPdwq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022814"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022814"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398532"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:07 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 5/9] drm/ttm/tests: Add test cases dependent on fence
 signaling
Date: Fri, 22 Mar 2024 15:29:54 +0100
Message-Id: <8a9a650b897a75612d6e1107f5961413222a856b.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
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

Add test cases that check how the state of dma fences in BO's
reservation object influence the ttm_bo_validation() flow. Do similar
tests for resource manager's move fence.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 305 ++++++++++++++++++
 1 file changed, 305 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 7070b5d16c10..a43e8cb769ef 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -2,6 +2,8 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <linux/delay.h>
+#include <linux/kthread.h>
 
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_placement.h>
@@ -13,11 +15,14 @@
 #define BO_SIZE		SZ_4K
 #define MANAGER_SIZE	SZ_1M
 
+static struct spinlock fence_lock;
+
 struct ttm_bo_validate_test_case {
 	const char *description;
 	enum ttm_bo_type bo_type;
 	uint32_t mem_type;
 	bool with_ttm;
+	bool no_gpu_wait;
 };
 
 static struct ttm_placement *ttm_placement_kunit_init(struct kunit *test,
@@ -35,6 +40,43 @@ static struct ttm_placement *ttm_placement_kunit_init(struct kunit *test,
 	return placement;
 }
 
+static const char *fence_name(struct dma_fence *f)
+{
+	return "ttm-bo-validate-fence";
+}
+
+static const struct dma_fence_ops fence_ops = {
+	.get_driver_name = fence_name,
+	.get_timeline_name = fence_name,
+};
+
+static struct dma_fence *alloc_mock_fence(struct kunit *test)
+{
+	struct dma_fence *fence;
+
+	fence = kunit_kzalloc(test, sizeof(*fence), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, fence);
+
+	dma_fence_init(fence, &fence_ops, &fence_lock, 0, 0);
+
+	return fence;
+}
+
+static void dma_resv_kunit_active_fence_init(struct kunit *test,
+					     struct dma_resv *resv,
+					     enum dma_resv_usage usage)
+{
+	struct dma_fence *fence;
+
+	fence = alloc_mock_fence(test);
+	dma_fence_enable_sw_signaling(fence);
+
+	dma_resv_lock(resv, NULL);
+	dma_resv_reserve_fences(resv, 1);
+	dma_resv_add_fence(resv, fence, usage);
+	dma_resv_unlock(resv);
+}
+
 static void ttm_bo_validate_case_desc(const struct ttm_bo_validate_test_case *t,
 				      char *desc)
 {
@@ -456,6 +498,262 @@ static void ttm_bo_validate_multihop(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, final_mem);
 }
 
+static const struct ttm_bo_validate_test_case ttm_bo_no_placement_cases[] = {
+	{
+		.description = "Buffer object in system domain, no page vector",
+	},
+	{
+		.description = "Buffer object in system domain with an existing page vector",
+		.with_ttm = true,
+	},
+};
+
+KUNIT_ARRAY_PARAM(ttm_bo_no_placement, ttm_bo_no_placement_cases,
+		  ttm_bo_validate_case_desc);
+
+static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	uint32_t mem_type = TTM_PL_SYSTEM;
+	struct ttm_resource_manager *man;
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_tt *old_tt;
+	uint32_t flags;
+	int err;
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	man = ttm_manager_type(priv->ttm_dev, mem_type);
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo->type = bo_type;
+
+	if (params->with_ttm) {
+		old_tt = priv->ttm_dev->funcs->ttm_tt_create(bo, 0);
+		ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, &ctx);
+		bo->ttm = old_tt;
+	}
+
+	err = ttm_resource_alloc(bo, place, &bo->resource);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_ASSERT_EQ(test, man->usage, size);
+
+	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, placement);
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx);
+	ttm_bo_unreserve(bo);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_ASSERT_EQ(test, man->usage, 0);
+	KUNIT_ASSERT_NOT_NULL(test, bo->ttm);
+	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, 0);
+
+	if (params->with_ttm) {
+		flags = bo->ttm->page_flags;
+
+		KUNIT_ASSERT_PTR_EQ(test, bo->ttm, old_tt);
+		KUNIT_ASSERT_FALSE(test, flags & TTM_TT_FLAG_PRIV_POPULATED);
+		KUNIT_ASSERT_TRUE(test, flags & TTM_TT_FLAG_ZERO_ALLOC);
+	}
+
+	ttm_bo_put(bo);
+}
+
+static int threaded_dma_resv_signal(void *arg)
+{
+	struct ttm_buffer_object *bo = arg;
+	struct dma_resv *resv = bo->base.resv;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+
+	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_signal(fence);
+	}
+	dma_resv_iter_end(&cursor);
+
+	return 0;
+}
+
+static void ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	uint32_t mem_type = TTM_PL_SYSTEM;
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct task_struct *task;
+	struct ttm_place *place;
+	int err;
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo->type = params->bo_type;
+
+	err = ttm_resource_alloc(bo, place, &bo->resource);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, placement);
+
+	/* Create an active fence to simulate a non-idle resv object */
+	spin_lock_init(&fence_lock);
+	dma_resv_kunit_active_fence_init(test, bo->base.resv, usage);
+
+	task = kthread_create(threaded_dma_resv_signal, bo, "dma-resv-signal");
+	if (IS_ERR(task))
+		KUNIT_FAIL(test, "Couldn't create dma resv signal task\n");
+
+	wake_up_process(task);
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx);
+	ttm_bo_unreserve(bo);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_ASSERT_NOT_NULL(test, bo->ttm);
+	KUNIT_ASSERT_NULL(test, bo->resource);
+	KUNIT_ASSERT_NULL(test, bo->bulk_move);
+	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, 0);
+
+	if (bo->type != ttm_bo_type_sg)
+		KUNIT_ASSERT_PTR_EQ(test, bo->base.resv, &bo->base._resv);
+
+	/* Make sure we have an idle object at this point */
+	dma_resv_wait_timeout(bo->base.resv, usage, false, MAX_SCHEDULE_TIMEOUT);
+
+	ttm_bo_put(bo);
+}
+
+static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
+{
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	uint32_t mem_type = TTM_PL_SYSTEM;
+	struct ttm_resource_manager *man;
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	man = ttm_manager_type(priv->ttm_dev, mem_type);
+	man->move = dma_fence_get_stub();
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo->type = bo_type;
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx);
+	ttm_bo_unreserve(bo);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
+	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
+
+	ttm_bo_put(bo);
+	dma_fence_put(man->move);
+}
+
+static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
+	{
+		.description = "Waits for GPU",
+		.no_gpu_wait = false,
+	},
+	{
+		.description = "Tries to lock straight away",
+		.no_gpu_wait = true,
+	},
+};
+
+KUNIT_ARRAY_PARAM(ttm_bo_validate_wait, ttm_bo_validate_wait_cases,
+		  ttm_bo_validate_case_desc);
+
+static int threaded_fence_signal(void *arg)
+{
+	struct dma_fence *fence = arg;
+
+	msleep(20);
+
+	return dma_fence_signal(fence);
+}
+
+static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_operation_ctx ctx_init = { },
+				 ctx_val  = { .no_wait_gpu = params->no_gpu_wait };
+	uint32_t fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
+	struct ttm_placement *placement_init, *placement_val;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_place *init_place, places[2];
+	struct ttm_resource_manager *man;
+	struct ttm_buffer_object *bo;
+	struct task_struct *task;
+	int err;
+
+	init_place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
+	placement_init = ttm_placement_kunit_init(test, init_place, 1);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement_init,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
+
+	places[0] = (struct ttm_place){ .mem_type = fst_mem, .flags = TTM_PL_FLAG_DESIRED };
+	places[1] = (struct ttm_place){ .mem_type = snd_mem, .flags = TTM_PL_FLAG_FALLBACK };
+	placement_val = ttm_placement_kunit_init(test, places, 2);
+
+	spin_lock_init(&fence_lock);
+	man = ttm_manager_type(priv->ttm_dev, fst_mem);
+	man->move = alloc_mock_fence(test);
+
+	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
+	if (IS_ERR(task))
+		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
+
+	wake_up_process(task);
+	err = ttm_bo_validate(bo, placement_val, &ctx_val);
+	dma_resv_unlock(bo->base.resv);
+
+	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
+
+	if (params->no_gpu_wait)
+		KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
+	else
+		KUNIT_EXPECT_EQ(test, bo->resource->mem_type, fst_mem);
+
+	ttm_bo_put(bo);
+	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
+	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
+}
+
 static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
 	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man, ttm_bo_types_gen_params),
@@ -468,6 +766,13 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE(ttm_bo_validate_pinned),
 	KUNIT_CASE(ttm_bo_validate_busy_placement),
 	KUNIT_CASE_PARAM(ttm_bo_validate_multihop, ttm_bo_types_gen_params),
+	KUNIT_CASE_PARAM(ttm_bo_validate_no_placement_signaled,
+			 ttm_bo_no_placement_gen_params),
+	KUNIT_CASE_PARAM(ttm_bo_validate_no_placement_not_signaled,
+			 ttm_bo_types_gen_params),
+	KUNIT_CASE(ttm_bo_validate_move_fence_signaled),
+	KUNIT_CASE_PARAM(ttm_bo_validate_move_fence_not_signaled,
+			 ttm_bo_validate_wait_gen_params),
 	{}
 };
 
-- 
2.34.1

