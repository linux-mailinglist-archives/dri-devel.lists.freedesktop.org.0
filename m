Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02D7E5831
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9B210E75F;
	Wed,  8 Nov 2023 13:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7029D10E75F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451837; x=1730987837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEyMZL761Sr6XyF/w/jeGUzdJ7SW697c36mIE3qQTgo=;
 b=HkXdLe4QzVq39OXIkXN9RXcV0Ox1awjCidkInzFlGCgubLqzd+7vYAyW
 1WOMpPIC2n9Zrxwfy0pW4Y87AqtgC70+bV0ghbFoHuEmjW66mIB6tDNcH
 uKj+in0jOoGuvTwVmiUk9eJli4Zzl/PeHP23bmUYEqZExuLEuKE1078hA
 RaglKYQiNdwHljdekSdj3MF92GiUIGJqAvDDJJNlpOxe59gtOlMAWL4y0
 47u6ixEGPD5sJy0DK1Dx55ijynBijA2Pl/+22CW8v4QChJHOtbo04TkBl
 icuYPPBFDTnRWTeTHv4yM1PFeAgjhdgpbJ4X9pisNU+8frxrr2JJ/fqOx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="475993621"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="475993621"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880212981"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="880212981"
Received: from asawoscx-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.23.233])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:57:05 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 5/8] drm/ttm/tests: Use an init function from the helpers
 lib
Date: Wed,  8 Nov 2023 14:56:27 +0100
Message-Id: <c59f150b72809c1b7bec7995e97581128c13a1cb.1699445194.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1699445194.git.karolina.stolarek@intel.com>
References: <cover.1699445194.git.karolina.stolarek@intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
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
index 10c5e7f54ff3..5526669c1f19 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -151,6 +151,20 @@ int ttm_test_devices_init(struct kunit *test)
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
index f38140f93c05..1455a5ac2462 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -40,6 +40,7 @@ void ttm_test_devices_put(struct kunit *test, struct ttm_test_devices *devs);
 
 /* Generic init/fini for tests that only need DRM/TTM devices */
 int ttm_test_devices_init(struct kunit *test);
+int ttm_test_devices_all_init(struct kunit *test);
 void ttm_test_devices_fini(struct kunit *test);
 
 #endif // TTM_KUNIT_HELPERS_H
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index 4f5fc4d460b4..98c3deef94e3 100644
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
2.25.1

