Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A707972EE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 15:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00B610E7E6;
	Thu,  7 Sep 2023 13:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3153910E7DA;
 Thu,  7 Sep 2023 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694095190; x=1725631190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KRpj1V5n8BOxdlw9LM3sE/BGTs1SZYbw+0NHS+qJbtA=;
 b=XLUewpMoSGqF/2x74G2FvkDkjPelUbeYQKkZf/HNYoCaq+Nvq+Y0G202
 z5NG/72j6l/erFDCxKwVB/ZPH7XgMdXR5igab/LBhFkYro70BpP7s/d0A
 EWMaETVbrS4OmlDaDeoqXKa1Mo1vciTEdPW+c8YLU8v1bAiA/VAltUqSH
 abxcaZnPkpHMBgB6lftj+tXCq6m1EZWRGklXNn+TPGXjj8DAiFJ4jbmWP
 BixmjqyYi/z1koEYZm/HzOkBgVyQYv/0rbw/N+YfT24i4kcSulNNggqiH
 cuXQaFBamfoAkQJNx1n6KcquP8/3mSOCNGrGPguSUXJGwH5VdA3dugaum g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367599090"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="367599090"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="856845221"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="856845221"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.26])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:53:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/tests/drm_exec: Add a test for object freeing
 within drm_exec_fini()
Date: Thu,  7 Sep 2023 15:53:39 +0200
Message-ID: <20230907135339.7971-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check that object freeing from within drm_exec_fini() works as expected
and is unlikely to generate any warnings.

v3:
- Condition the test on CONFIG_DEBUG_LOCK_ALLOC
- Make the test fail if the situation that generates the lockdep
  warning occurs. (Maxime Ripard)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 82 +++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 563949d777dd..83fddc6fe1ae 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -21,6 +21,9 @@
 struct drm_exec_priv {
 	struct device *dev;
 	struct drm_device *drm;
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	struct drm_exec *exec;
+#endif
 };
 
 static int drm_exec_test_init(struct kunit *test)
@@ -170,6 +173,82 @@ static void test_prepare_array(struct kunit *test)
 	drm_gem_private_object_fini(&gobj2);
 }
 
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+static void drm_exec_test_obj_free(struct drm_gem_object *gem)
+{
+	struct kunit *test = current->kunit_test;
+	struct drm_exec_priv *priv = test->priv;
+	bool resv_class_held;
+	bool first_object_locked;
+
+	/*
+	 * The lock alloc tracking code may warn if the dma_resv lock
+	 * class is still held, and we're freeing the first object we
+	 * locked.
+	 */
+	resv_class_held = (lockdep_is_held(&gem->resv->lock.base) ==
+			   LOCK_STATE_HELD);
+	first_object_locked = (gem == priv->exec->objects[0]);
+	KUNIT_EXPECT_FALSE(current->kunit_test,
+			   resv_class_held && first_object_locked);
+
+	dma_resv_fini(gem->resv);
+	kfree(gem);
+}
+
+static const struct drm_gem_object_funcs put_funcs = {
+	.free = drm_exec_test_obj_free,
+};
+
+/*
+ * Check that freeing objects from within drm_exec_fini()
+ * doesn't trigger a false lock alloc warning due to
+ * the dma_resv lock *class* still being held and we're
+ * freeing the first object locked, which *might* be
+ * registered as the address of the held lock of that
+ * lock class.
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
+	priv->exec = &exec;
+
+	gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, gobj1);
+	if (!gobj1)
+		return;
+
+	gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, gobj2);
+	if (!gobj2) {
+		kfree(gobj1);
+		return;
+	}
+
+	gobj1->funcs = &put_funcs;
+	gobj2->funcs = &put_funcs;
+	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
+	array[0] = gobj1;
+	array[1] = gobj2;
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
+#endif
+
 static void test_multiple_loops(struct kunit *test)
 {
 	struct drm_exec exec;
@@ -198,6 +277,9 @@ static struct kunit_case drm_exec_tests[] = {
 	KUNIT_CASE(test_prepare),
 	KUNIT_CASE(test_prepare_array),
 	KUNIT_CASE(test_multiple_loops),
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	KUNIT_CASE(test_early_put),
+#endif
 	{}
 };
 
-- 
2.41.0

