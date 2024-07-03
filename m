Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6947926721
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C283B10E950;
	Wed,  3 Jul 2024 17:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="hxQE1fBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0F10E950
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:30:22 +0000 (UTC)
X-Virus-Scanned: SPAM Filter at disroot.org
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720027285; bh=gjvkiUOSE7F5WUd6+3qhbjUsNsvcnn9qdimWMtEQ8F8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hxQE1fBFpJZM1LXXCBPhUnQTYxLQLwrQFxNPYzzPNzicDHlFpqKZTzxdVJBLh6J1+
 QsL4xv0FZutUJahUpfoqw8O4iXtyo1KcN1xJwjtmJR/oFaz4PzHHYpP/qn+rJ8uDcG
 mFza0mZeHwM591L3muQDJ97ttkF7wINZX60rHaZyRuzo+Z0YnjYdnBdecRdrzvV8CP
 Mgpyapks+GGVrlqLEIqVePZ6zCC0THobDTnkUZiUPj+HMmGceg+sKElanfFuTSD8uX
 tfS2sYA8UePZu2IGW4PcCLeDzO7O61fna5D2DcakgqWl+hVE5foeKQDiGPNFljJcmV
 CAEqoQ41Unz4Q==
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: [PATCH v3 8/9] drm/tests: Add test for drm_framebuffer_init()
Date: Wed,  3 Jul 2024 14:22:27 -0300
Message-ID: <20240703172228.11166-9-gcarlos@disroot.org>
In-Reply-To: <20240703172228.11166-1-gcarlos@disroot.org>
References: <20240703172228.11166-1-gcarlos@disroot.org>
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

Add three KUnit test cases for the drm_framebuffer_init function:

1. Test if expected values are being set after drm_framebuffer_init() call.
2. Try to init a framebuffer without setting its format.
3. Try calling drm_framebuffer_init() with mismatch of the drm_device passed
   at the first argument and the one pointed by fb->dev.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Let fb1.dev unset instead of set it to wrong_drm to test mismatched
    drm_device passed as drm_framebuffer_init() argument.
  - Clean the framebuffer object.
v3:
  - Split into three tests.
  - Add documentation.
  - Stop testing lookup here.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 68 ++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 54829e832c5e..73a1a3a3987e 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -569,10 +569,78 @@ static void drm_test_framebuffer_lookup_inexistent(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, fb);
 }
 
+/* Test if drm_framebuffer_init initializes the framebuffer with expected values */
+static void drm_test_framebuffer_init(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_format_info format = { };
+	struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
+	struct drm_framebuffer_funcs funcs = { };
+	int ret;
+
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Check if fb->funcs is actually set to the drm_framebuffer_funcs passed on */
+	KUNIT_EXPECT_PTR_EQ(test, fb1.funcs, &funcs);
+
+	/* The fb->comm must be set to the current running process */
+	KUNIT_EXPECT_STREQ(test, fb1.comm, current->comm);
+
+	/* The fb->base must be successfully initialized */
+	KUNIT_EXPECT_NE(test, fb1.base.id, 0);
+	KUNIT_EXPECT_EQ(test, fb1.base.type, DRM_MODE_OBJECT_FB);
+	KUNIT_EXPECT_EQ(test, kref_read(&fb1.base.refcount), 1);
+	KUNIT_EXPECT_PTR_EQ(test, fb1.base.free_cb, &drm_framebuffer_free);
+
+	/* There must be just that one fb initialized */
+	KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
+	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, &fb1.head);
+	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);
+
+	drm_framebuffer_cleanup(&fb1);
+}
+
+/* Try to init a framebuffer without setting its format */
+static void drm_test_framebuffer_init_bad_format(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_framebuffer fb1 = { .dev = dev, .format = NULL };
+	struct drm_framebuffer_funcs funcs = { };
+	int ret;
+
+	/* Fails if fb.format isn't set */
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+/*
+ * Test calling drm_framebuffer_init() passing a framebuffer linked to a
+ * different drm_device parent from the one passed on the first argument.
+ */
+static void drm_test_framebuffer_init_dev_mismatch(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_format_info format = { };
+	struct drm_framebuffer fb1 = { .dev = NULL, .format = &format };
+	struct drm_framebuffer_funcs funcs = { };
+	int ret;
+
+	/* Fails if fb->dev doesn't point to the drm_device passed on first arg */
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_init),
+	KUNIT_CASE(drm_test_framebuffer_init_bad_format),
+	KUNIT_CASE(drm_test_framebuffer_init_dev_mismatch),
 	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_lookup_inexistent),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
-- 
2.44.2

