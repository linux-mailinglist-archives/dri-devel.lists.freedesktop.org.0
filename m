Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871BF8C659E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBB010E76E;
	Wed, 15 May 2024 11:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0+a1SGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850E10E6DE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715772299; x=1747308299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wH50ZFsV2LZjjfl4nVUyxRvikLKvYxKPp33tG9QsWBc=;
 b=Q0+a1SGCqu0TBSXi1shb2sJIG3vxhFL54Je5uAzg1d2PpmyNXI85UsT2
 eW7yHy/n6rTQYm1PeMKgUOjUWapFmCFHkr4HC300plBJ3FQ9JoCSGhdZN
 vQfZlS3f79ZUg5YtNjnX/xPtYi7IsfemX5phwnAC09XRr1Za4hM0f59TB
 fyvq5I8qvmBeGPtcfiwTRZQieBkFxis12swB4bj3o0/HCxqQjlJ+NvA6z
 D53QfsOHMHsHwHiRdKMPdAxCbbbbZkHUv6eXjhsVRNlsLSbrf2INQhJnV
 xNQRjsJAQVdZfVU3NQPHhM/KO9T7ptmdw4qxrdZIbYr2Dly/9aqq5z6Xr Q==;
X-CSE-ConnectionGUID: qMsJCDy5SJq3ubJpO7O1Sg==
X-CSE-MsgGUID: fMsbMwYPQEKVs6ihBqLxAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22955380"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22955380"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:24:59 -0700
X-CSE-ConnectionGUID: PzqLaXpHSBGpcYltK7vbLQ==
X-CSE-MsgGUID: tGsVfflQTHeWLNxwuaRGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30955248"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:24:56 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v12 04/10] drm/ttm/tests: Use an init function from the
 helpers lib
Date: Wed, 15 May 2024 13:24:27 +0200
Message-Id: <b1dcc27b65170aa590d1fc38305eb3c13bb33129.1715767062.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715767062.git.karolina.stolarek@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
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

Add a new helper function that also initializes the device. Use it in
ttm_tt test suite and delete the local definition.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 14 ++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  1 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 15 +--------------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index c9ee7fe7c36d..f25bd7951b74 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -158,6 +158,20 @@ int ttm_test_devices_init(struct kunit *test)
 }
 EXPORT_SYMBOL_GPL(ttm_test_devices_init);
 
+int ttm_test_devices_all_init(struct kunit *test)
+{
+	struct ttm_test_devices *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	priv = ttm_test_devices_all(test);
+	test->priv = priv;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ttm_test_devices_all_init);
+
 void ttm_test_devices_fini(struct kunit *test)
 {
 	ttm_test_devices_put(test, test->priv);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index c83d31b23c9a..3dbf404e22a8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -40,6 +40,7 @@ void ttm_test_devices_put(struct kunit *test, struct ttm_test_devices *devs);
 
 /* Generic init/fini for tests that only need DRM/TTM devices */
 int ttm_test_devices_init(struct kunit *test);
+int ttm_test_devices_all_init(struct kunit *test);
 void ttm_test_devices_fini(struct kunit *test);
 
 #endif // TTM_KUNIT_HELPERS_H
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index 67bf51723c92..17988fa99fa6 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -15,19 +15,6 @@ struct ttm_tt_test_case {
 	uint32_t extra_pages_num;
 };
 
-static int ttm_tt_test_init(struct kunit *test)
-{
-	struct ttm_test_devices *priv;
-
-	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, priv);
-
-	priv = ttm_test_devices_all(test);
-	test->priv = priv;
-
-	return 0;
-}
-
 static const struct ttm_tt_test_case ttm_tt_init_basic_cases[] = {
 	{
 		.description = "Page-aligned size",
@@ -285,7 +272,7 @@ static struct kunit_case ttm_tt_test_cases[] = {
 
 static struct kunit_suite ttm_tt_test_suite = {
 	.name = "ttm_tt",
-	.init = ttm_tt_test_init,
+	.init = ttm_test_devices_all_init,
 	.exit = ttm_test_devices_fini,
 	.test_cases = ttm_tt_test_cases,
 };
-- 
2.34.1

