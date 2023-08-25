Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5B9788CF9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9DB10E6D5;
	Fri, 25 Aug 2023 16:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311AD10E6D4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E719A40D83;
 Fri, 25 Aug 2023 18:11:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZokuR-yVmeY; Fri, 25 Aug 2023 18:11:58 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979917; bh=cQkPjVtEov5m71kcpErH1rBNEpNlsOEMRd7A9dfTV9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cQPKQXG1XsI0h7RANHa9PjmcgC+xmd9izTJwDxHdURN6EQ5I/RMUyWEzTVsph2EWX
 CfddW0TwWXRuKpR9bowJMq2WnjxR6GSwsVx1EGMeKseY2HG0PwhrZB4trUGWKmbiws
 7P5DBFzzSqWYOIu7RJCadACvxxM3/iPnAHnJy1QGLM2mD/8AGdALsQnaYuthMkZ4x5
 GmBQHHoUl388dUe5cKoDBEjDIbBMDyIyrtUKZ9Uxd6fGgJEmMwzoFMNl6vOBNsc030
 TIpw53VX52WjJqvgmOu1DeFN7XNxghpiFpOSFoL+QiCN+/yQrLxgHNmoxRNZehczRP
 NGSJGLrTeBa1Q==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/tests: Add test for drm_mode_addfb2()
Date: Fri, 25 Aug 2023 13:11:49 -0300
Message-ID: <20230825161149.13841-2-gcarlos@disroot.org>
In-Reply-To: <20230825161149.13841-1-gcarlos@disroot.org>
References: <20230825161149.13841-1-gcarlos@disroot.org>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a single KUnit test case for the drm_mode_addfb2 function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 100 ++++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 8eca92fdc645..b8ddd7e34db5 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -10,6 +10,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
@@ -343,8 +344,18 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 },
 };
 
+/*
+ * This struct is intended to provide a way to mocked functions communicate
+ * with the outer test when it can't be achieved by using its return value. In
+ * this way, the functions that receive the mocked drm_device, for example, can
+ * grab a reference to @private and actually return something to be used on some
+ * expectation. Also having the @test member allows doing expectations from
+ * inside mocked functions.
+ */
 struct drm_mock {
 	struct drm_device dev;
+	struct drm_file file_priv;
+	struct kunit *test;
 	void *private;
 };
 
@@ -366,13 +377,18 @@ static int drm_framebuffer_test_init(struct kunit *test)
 {
 	struct drm_mock *mock;
 	struct drm_device *dev;
+	struct drm_file *file_priv;
+	struct drm_driver *driver;
 
 	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
 	dev = &mock->dev;
+	file_priv = &mock->file_priv;
 
-	dev->driver = kunit_kzalloc(test, sizeof(*dev->driver), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev->driver);
+	driver = kunit_kzalloc(test, sizeof(*dev->driver), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, driver);
+	driver->driver_features = DRIVER_MODESET;
+	dev->driver = driver;
 
 	idr_init_base(&dev->mode_config.object_idr, 1);
 	mutex_init(&dev->mode_config.fb_lock);
@@ -384,6 +400,9 @@ static int drm_framebuffer_test_init(struct kunit *test)
 	dev->mode_config.max_height = MAX_HEIGHT;
 	dev->mode_config.funcs = &mock_config_funcs;
 
+	mutex_init(&file_priv->fbs_lock);
+	INIT_LIST_HEAD(&file_priv->fbs);
+
 	test->priv = mock;
 	return 0;
 }
@@ -392,8 +411,10 @@ static void drm_framebuffer_test_exit(struct kunit *test)
 {
 	struct drm_mock *mock = test->priv;
 	struct drm_device *dev = &mock->dev;
+	struct drm_file *file_priv = &mock->file_priv;
 
 	mutex_destroy(&dev->mode_config.fb_lock);
+	mutex_destroy(&file_priv->fbs_lock);
 }
 
 static void drm_test_framebuffer_create(struct kunit *test)
@@ -656,7 +677,82 @@ static void drm_test_framebuffer_free(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
 }
 
+static struct drm_framebuffer *
+fb_create_addfb2_mock(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_mode_fb_cmd2 *cmd)
+{
+	struct drm_mock *mock = container_of(dev, typeof(*mock), dev);
+	struct drm_framebuffer *fb;
+	struct kunit *test = mock->test;
+
+	fb = kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fb);
+
+	fb->base.id = 1;
+
+	mock->private = fb;
+	return fb;
+}
+
+static struct drm_mode_config_funcs config_funcs_addfb2_mock = {
+	.fb_create = fb_create_addfb2_mock,
+};
+
+static void drm_test_framebuffer_addfb2(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
+	struct drm_file *file_priv = &mock->file_priv;
+	struct drm_framebuffer *fb = NULL;
+	int ret;
+
+	/* A valid cmd */
+	struct drm_mode_fb_cmd2 cmd = {
+		.width = 600, .height = 600,
+		.pixel_format = DRM_FORMAT_ABGR8888,
+		.handles = { 1, 0, 0 }, .pitches = { 4 * 600, 0, 0 },
+	};
+
+	mock->test = test;
+	dev->mode_config.funcs = &config_funcs_addfb2_mock;
+
+	/* Must fail due to missing DRIVER_MODESET support */
+	ret = drm_mode_addfb2(dev, &cmd, file_priv);
+	KUNIT_EXPECT_EQ(test, ret, -EOPNOTSUPP);
+	KUNIT_ASSERT_PTR_EQ(test, mock->private, NULL);
+
+	/* Set DRIVER_MODESET support */
+	dev->driver_features = dev->driver->driver_features;
+
+	/*
+	 * Set an invalid cmd to trigger a fail on the
+	 * drm_internal_framebuffer_create function
+	 */
+	cmd.width = 0;
+	ret = drm_mode_addfb2(dev, &cmd, file_priv);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	KUNIT_ASSERT_PTR_EQ(test, mock->private, NULL);
+	cmd.width = 600; /* restore to a valid value */
+
+	ret = drm_mode_addfb2(dev, &cmd, file_priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	/* The fb_create_addfb2_mock set fb id to 1 */
+	KUNIT_EXPECT_EQ(test, cmd.fb_id, 1);
+
+	fb = mock->private;
+
+	/* The fb must be properly added to the file_priv->fbs list */
+	KUNIT_EXPECT_PTR_EQ(test, file_priv->fbs.prev, &fb->filp_head);
+	KUNIT_EXPECT_PTR_EQ(test, file_priv->fbs.next, &fb->filp_head);
+
+	/* There must be just one fb on the list */
+	KUNIT_EXPECT_PTR_EQ(test, fb->filp_head.prev, &file_priv->fbs);
+	KUNIT_EXPECT_PTR_EQ(test, fb->filp_head.next, &file_priv->fbs);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(drm_test_framebuffer_addfb2),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE(drm_test_framebuffer_free),
 	KUNIT_CASE(drm_test_framebuffer_init),
-- 
2.41.0

