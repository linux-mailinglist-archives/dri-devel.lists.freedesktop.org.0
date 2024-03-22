Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B165886E89
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215101124F0;
	Fri, 22 Mar 2024 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VK+S0wx0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D31124EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117804; x=1742653804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZdDI3UkaSdpNpdK5sNPHWpRr3SWZ1LJAeaEZuKLv5SY=;
 b=VK+S0wx0cc2/SvGNCEF6RaYSYzv4/7CDj8TeMtze0NfUk3Q5JSRbsctp
 zKvbA7VtoHM/3/tjLOFxlC87Nhb0OhvmtjmF3FZSdbc2/1ttsXWcZ4yxB
 3vTkAeMvH6zKlKkPFy0+KCQKiyCwgKFMZBXg2/3jkwAuDUzI91NZpL1U/
 qeQVTJ8rFHjnLz/WXB0WEPz5axb+CV3l0QDXyXovzpVq/UFQyMINYt5pP
 De9yG5Zio2vKWk7K6jJr65OpOqtDPptEjFyz4f3ZNN1gAoBqN3jqTOKdm
 s5ZdKKfTP7UmNXwPtcWa6y+LnNPlaoo8MttKruv8dok9vxx+YrEoqPQCB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022802"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398522"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:02 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 2/9] drm/ttm/tests: Use an init function from the helpers
 lib
Date: Fri, 22 Mar 2024 15:29:51 +0100
Message-Id: <422541615a890df92140a6d3328b01a1bac1e691.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
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
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 14 ++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  1 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 15 +--------------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index cb1cd676f8ae..2fe0c66f31a9 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -153,6 +153,20 @@ int ttm_test_devices_init(struct kunit *test)
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

