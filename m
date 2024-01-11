Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA382ABFF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DBF10E8F0;
	Thu, 11 Jan 2024 10:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043F10E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704968970; x=1736504970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TGJjH8EFK87CwdF+2eSk521uJE0jZbU8i5HlP4H07SE=;
 b=FnA3ZQ6/Ak9g9Rh4OtoS+7nYYeBOhiuH4y1YwAjqN8fxOUrWLl4SqsBP
 /3fc1jv3U8KsK/yuoUJBG1RlKNFBaljkpHrWpYzcM90iTBWkTYPowdn1y
 aI1V2MiP07bvIJVDsHP+K/qEFQgDHfYslRzTBTlVU4IW28Pi/+S0fVV6n
 Ap+CXtH+g2azFMfatHLYDE1WHb7/tb72hvbS7BKmaLwlUKO/fLiJq2H7w
 gxiveWRjSDpZwlQjd3LakinddOsAOpn8/5ouA3FGliJaAUxUrgkXzB9yD
 zP6kGl5vR81jrkkQhGd5qfTKoJFVVi6jHHLdpnGkK5qSz4q14aEJq37XJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5888896"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5888896"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="901507426"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="901507426"
Received: from iboiko-mobl.ger.corp.intel.com (HELO kdrobnik-desk.toya.net.pl)
 ([10.213.15.66])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:29:28 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v9 7/8] drm/ttm/tests: Add tests for ttm_tt_populate
Date: Thu, 11 Jan 2024 11:28:55 +0100
Message-Id: <63cb972aae2fc31860a5a9e823c1d2b0cbe043dd.1704959786.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704959786.git.karolina.stolarek@intel.com>
References: <cover.1704959786.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tests for functions that add and release pages to TTs. Test the
swapin operation. Export ttm_tt_unpopulate, ttm_tt_swapin and
ttm_tt_swapout symbols for testing purposes.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c | 119 ++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_tt.c            |   3 +
 2 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index a33a426a814d..b626228124aa 100644
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
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
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
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
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
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
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
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
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
index d978dc539a9b..0c7af842007f 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -238,6 +238,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
 out_err:
 	return ret;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
 
 /**
  * ttm_tt_swapout - swap out tt object
@@ -295,6 +296,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 
 	return ret;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
 
 int ttm_tt_populate(struct ttm_device *bdev,
 		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
@@ -373,6 +375,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 
 	ttm->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_unpopulate);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.34.1

