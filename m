Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18857FD638
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2957110E4E6;
	Wed, 29 Nov 2023 12:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A62710E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701259381; x=1732795381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qan6RfiBmv4sg97CXHBW0gd6QU3Q6fRwyYISsVQO5dk=;
 b=ARlkcLXaNBS9njMXqXYZoeT84QO5BjyTWagtmSkRDBerGxjmlFMT3bP6
 MfFcuGm8XcLtMoqLq1H5QyCHvjYDLeMsJpFdQuCc6JKkkvFQ6SIcM9H6O
 +8ob9iBJj22E0qABq8z2y67C+2Rb2m2LktViHMeAkzPBAiWjR2+1MSqVk
 +Xpz0jlnGvcyRFGnlOiMwSyp9J43SMV44PJ2LYsGJVushPCVfwnbFWfJR
 JBcQ1ElPh79jeoWMzqxuryx3uHpPYXsmEcDZ/RJSLANApUKXkzCjH9tBG
 dXi9oyCa0oVGA+aSbY8b9WatFD8nYxPQhr66iWt9Iu70z9bI+K3F1LwpX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479350840"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="479350840"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772662535"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="772662535"
Received: from jszeliga-mobl.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.0.25])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:02:59 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 5/8] drm/ttm/tests: Use an init function from the helpers
 lib
Date: Wed, 29 Nov 2023 13:02:31 +0100
Message-Id: <5ea96ffdcc26b0127c9609fc614a1cb6aafd2464.1701257386.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701257386.git.karolina.stolarek@intel.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new helper function that also initializes the device. Use it in
ttm_tt test suite and delete the local definition.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 14 ++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  1 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 15 +--------------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7b7c1fa805fc..899a54dbe443 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -150,6 +150,20 @@ int ttm_test_devices_init(struct kunit *test)
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
index 2f51c833a536..53bb5834939f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -39,6 +39,7 @@ void ttm_test_devices_put(struct kunit *test, struct ttm_test_devices *devs);
 
 /* Generic init/fini for tests that only need DRM/TTM devices */
 int ttm_test_devices_init(struct kunit *test);
+int ttm_test_devices_all_init(struct kunit *test);
 void ttm_test_devices_fini(struct kunit *test);
 
 #endif // TTM_KUNIT_HELPERS_H
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index fd4502c18de6..a33a426a814d 100644
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

