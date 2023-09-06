Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361267938DB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634910E5D0;
	Wed,  6 Sep 2023 09:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEF710E5BB;
 Wed,  6 Sep 2023 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693993868; x=1725529868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9m2apirus832JCVCkv41sQyrvyBAffRFGqb2IfG0Ahg=;
 b=HCL44/OdLKGEWm0mgLVkAt7CUbJ8EFrndOHAKXfT6IJ6Wy1kJmmrBMQB
 WStzZEVuFEZaC08JjaBC639iozf1TEhTQ84mwiBR3prkIT7Tl/blgWPTm
 sRqEgyJDJSEi3fDAc8jyf6CDKMB3mEsftbMPAi1CfEDoW6lry4Pbd6jMK
 ty+T+rCSuFGVzubBqgRyl5MM8v5z1nSteD0O64FEC3LLHje/Lhsal5d2p
 CoYlWaDgn7s+zbNZPMahWidLWzBRf4JMxrrOk05U/bBT7P3FE+tMQ6kZz
 Nc61U19F5wxc+VkD2eCxodKUoKWB9Zc2yIa6DYgGVK9926WievAs1l2+v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357331488"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="357331488"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806948097"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806948097"
Received: from igorhaza-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/tests/drm_exec: Add a test for object freeing
 within drm_exec_fini()
Date: Wed,  6 Sep 2023 11:50:38 +0200
Message-ID: <20230906095039.3320-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
References: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check that object freeing from within drm_exec_fini() works as expected
and doesn't generate any warnings.

Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 563949d777dd..294c25f49cc7 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit *test)
 	drm_gem_private_object_fini(&gobj2);
 }
 
+static const struct drm_gem_object_funcs put_funcs = {
+	.free = (void *)kfree,
+};
+
+/*
+ * Check that freeing objects from within drm_exec_fini()
+ * behaves as expected.
+ */
+static void test_early_put(struct kunit *test)
+{
+	struct drm_exec_priv *priv = test->priv;
+	struct drm_gem_object *gobj1;
+	struct drm_gem_object *gobj2;
+	struct drm_gem_object *array[2];
+	struct drm_exec exec;
+	int ret;
+
+	gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
+	if (!gobj1)
+		return;
+
+	gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
+	if (!gobj2) {
+		kfree(gobj1);
+		return;
+	}
+
+	gobj1->funcs = &put_funcs;
+	gobj2->funcs = &put_funcs;
+	array[0] = gobj1;
+	array[1] = gobj2;
+	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec)
+		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
+					     1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	drm_gem_object_put(gobj1);
+	drm_gem_object_put(gobj2);
+	drm_exec_fini(&exec);
+}
+
 static void test_multiple_loops(struct kunit *test)
 {
 	struct drm_exec exec;
@@ -198,6 +244,7 @@ static struct kunit_case drm_exec_tests[] = {
 	KUNIT_CASE(test_prepare),
 	KUNIT_CASE(test_prepare_array),
 	KUNIT_CASE(test_multiple_loops),
+	KUNIT_CASE(test_early_put),
 	{}
 };
 
-- 
2.41.0

