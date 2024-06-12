Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372079051F9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4A10E82E;
	Wed, 12 Jun 2024 12:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENQQLC8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B91510E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193829; x=1749729829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTONkUXLzLYaNHg9XVSu5FCoSgKEyasJudSTrTZAMXg=;
 b=ENQQLC8jAYL3sOL/GTOS/EXrOUa6fE6g/si78pq12XvPBYPB08mRdMNy
 FVsP8LK/7uUzB8dH6Xpz791RMyOroq15wRFKt93KegizJJPTmvvYtB/Zi
 yupsfxRBVkt0COF7EH5I0U3RXwwJPwLfd8KjhqzfINeElhNVH6+FJGpWO
 EJFvNOc4yW/26jLMwwWUytauW0UwMkbehiouQ0o9Mx8B6hRAmUIHZNbN5
 430oZowp0U+N3OcifSwo49bVyzajNFKiSGa04AU2kyjIFgAmr/+hXp0tr
 RnyN1kjdoSN9EQutNqE/ETGxGkVJrHVFpVS2LeRWANw/TQUCW8w4jIUXa g==;
X-CSE-ConnectionGUID: nE4F5QJgTVmjyYC521E8Gw==
X-CSE-MsgGUID: uutePt3LTSOBGLgUc+5Huw==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077623"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077623"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:49 -0700
X-CSE-ConnectionGUID: Kvq5TbMhTguK4ddJKqnnYQ==
X-CSE-MsgGUID: 9gooiqt/SAiVp7mLNT9jCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574115"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:46 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 09/12] drm/ttm/tests: Add tests for ttm_tt_populate
Date: Wed, 12 Jun 2024 14:03:03 +0200
Message-Id: <ee42d83a472ba6bca22b4bce58f332f800891186.1718192625.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718192625.git.karolina.stolarek@intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
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

Add tests for functions that add and release pages to TTs. Test the
swapin operation. Export ttm_tt_unpopulate, ttm_tt_swapin and
ttm_tt_swapout symbols for testing purposes.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
Tested-by: Somalapuram, Amaranath <asomalap@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c | 119 ++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_tt.c            |   3 +
 2 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index 17988fa99fa6..a9d75a33acaf 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -256,6 +256,120 @@ static void ttm_tt_destroy_basic(struct kunit *test)
 	ttm_tt_destroy(devs->ttm_dev, bo->ttm);
 }
 
+static void ttm_tt_populate_null_ttm(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	struct ttm_operation_ctx ctx = { };
+	int err;
+
+	err = ttm_tt_populate(devs->ttm_dev, NULL, &ctx);
+	KUNIT_ASSERT_EQ(test, err, -EINVAL);
+}
+
+static void ttm_tt_populate_populated_ttm(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	struct page *populated_page;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	populated_page = *tt->pages;
+
+	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+	KUNIT_ASSERT_PTR_EQ(test, populated_page, *tt->pages);
+}
+
+static void ttm_tt_unpopulate_basic(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_TRUE(test, ttm_tt_is_populated(tt));
+
+	ttm_tt_unpopulate(devs->ttm_dev, tt);
+	KUNIT_ASSERT_FALSE(test, ttm_tt_is_populated(tt));
+}
+
+static void ttm_tt_unpopulate_empty_ttm(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	ttm_tt_unpopulate(devs->ttm_dev, tt);
+	/* Expect graceful handling of unpopulated TTs */
+}
+
+static void ttm_tt_swapin_basic(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	int expected_num_pages = BO_SIZE >> PAGE_SHIFT;
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	int err, num_pages;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_TRUE(test, ttm_tt_is_populated(tt));
+
+	num_pages = ttm_tt_swapout(devs->ttm_dev, tt, GFP_KERNEL);
+	KUNIT_ASSERT_EQ(test, num_pages, expected_num_pages);
+	KUNIT_ASSERT_NOT_NULL(test, tt->swap_storage);
+	KUNIT_ASSERT_TRUE(test, tt->page_flags & TTM_TT_FLAG_SWAPPED);
+
+	/* Swapout depopulates TT, allocate pages and then swap them in */
+	err = ttm_pool_alloc(&devs->ttm_dev->pool, tt, &ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	err = ttm_tt_swapin(tt);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_NULL(test, tt->swap_storage);
+	KUNIT_ASSERT_FALSE(test, tt->page_flags & TTM_TT_FLAG_SWAPPED);
+}
+
 static struct kunit_case ttm_tt_test_cases[] = {
 	KUNIT_CASE_PARAM(ttm_tt_init_basic, ttm_tt_init_basic_gen_params),
 	KUNIT_CASE(ttm_tt_init_misaligned),
@@ -267,6 +381,11 @@ static struct kunit_case ttm_tt_test_cases[] = {
 	KUNIT_CASE(ttm_tt_create_ttm_exists),
 	KUNIT_CASE(ttm_tt_create_failed),
 	KUNIT_CASE(ttm_tt_destroy_basic),
+	KUNIT_CASE(ttm_tt_populate_null_ttm),
+	KUNIT_CASE(ttm_tt_populate_populated_ttm),
+	KUNIT_CASE(ttm_tt_unpopulate_basic),
+	KUNIT_CASE(ttm_tt_unpopulate_empty_ttm),
+	KUNIT_CASE(ttm_tt_swapin_basic),
 	{}
 };
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 7b00ddf0ce49..4b51b9023126 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -251,6 +251,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
 out_err:
 	return ret;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
 
 /**
  * ttm_tt_swapout - swap out tt object
@@ -308,6 +309,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 
 	return ret;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
 
 int ttm_tt_populate(struct ttm_device *bdev,
 		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
@@ -386,6 +388,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 
 	ttm->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_unpopulate);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.34.1

