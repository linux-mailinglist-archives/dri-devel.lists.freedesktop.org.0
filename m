Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B906A9051F2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964910E097;
	Wed, 12 Jun 2024 12:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoEoLG42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C58D10E066
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193814; x=1749729814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wH50ZFsV2LZjjfl4nVUyxRvikLKvYxKPp33tG9QsWBc=;
 b=VoEoLG42v9syuqdJzIhCUb04QxGceE7FitHiS1dRmXO1SligfiQu17rc
 WwFloDHbV0Yfwdaa1o2rFBIHfqFL9pz4R/kr4JD9owuKKMv8r1VU4icDy
 bLdFpc5TXknwweqr4L7kly1SOiZg+hxs0297iVH3ovuak334rJh6TeJQr
 KsW+SEcbRPcq8Vh8DJTZEGXfcTFa+g2kktVqsTm6rNQbkWpkugG4VPk9L
 3Hwx/8CjLJIt41TUbnLJwYnc4+3jz6rRdrHY3IQMuISNJ3nGloh6IB0MS
 l6LVfKbZupsGGd852WS6Dvowm8m0907/tuKLZqVmkvOv9Lm5JxIR5LZWo Q==;
X-CSE-ConnectionGUID: XoAj+vCcSxC+qAAtISX8Lg==
X-CSE-MsgGUID: UiPgYbE9Q0+KCzBOPc0hTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077604"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:33 -0700
X-CSE-ConnectionGUID: +kwSDDjBQMmwMZF48hfRxg==
X-CSE-MsgGUID: VhcLJbHaTvOA04a9UC/IiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574059"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:31 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 04/12] drm/ttm/tests: Use an init function from the
 helpers lib
Date: Wed, 12 Jun 2024 14:02:58 +0200
Message-Id: <235f110c1bdd2da7fac62ec03d177a5160dba1d5.1718192625.git.karolina.stolarek@intel.com>
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

