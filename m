Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3657D5B40
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7BD10E486;
	Tue, 24 Oct 2023 19:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD11E10E488
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8D05841AC4;
 Tue, 24 Oct 2023 21:11:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsmiCaOHQFAZ; Tue, 24 Oct 2023 21:11:43 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174703; bh=cpKhqPg2spRLSQkozkiRlKIUstGpeki3AKzBL74ciY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aAudvwRNGT4v87G4vcbCESUgVZExpXOJRvYcqbPfjQFksAYSKKNORF0VWQI0jv63K
 /rBc8K4aJQi6Kg/WJ2QxxjodEiJu0GbEHLTOqBVKGVM3L7jlir5l/+mUw8jAQ/Jw8L
 dNTxZ9pI5Iww3URVZNEQTtCfB9oFlGZJIVhqIIcIEzAOj7FcyQJJp6HTO8O4vZgH24
 +v83qBGaoYfyYxe7j/+dYHmvBJLx/jsyR711uqoGl0bH7rPJ7o+QRm4Nn9y7s0IWo+
 9LNh94YAG6lzeyKma3h0RIxFUKG1fCzFqwPho4sMZ5krgWSM0k659L5lT9fs7mx/DV
 At94SHlhKWLAg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/11] drm/tests: Add test for drm_mode_addfb2()
Date: Tue, 24 Oct 2023 16:10:01 -0300
Message-ID: <20231024191002.1620-11-gcarlos@disroot.org>
In-Reply-To: <20231024191002.1620-1-gcarlos@disroot.org>
References: <20231024191002.1620-1-gcarlos@disroot.org>
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
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a single KUnit test case for the drm_mode_addfb2 function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Rely on drm_kunit_helper_alloc_device() for mock initialization.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 104 ++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index dbe412d0dca4..149e1985e53f 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -10,6 +10,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_kunit_helpers.h>
@@ -341,8 +342,18 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
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
 struct drm_framebuffer_test_priv {
 	struct drm_device dev;
+	struct drm_file file_priv;
+	struct kunit *test;
 	void *private;
 };
 
@@ -365,14 +376,16 @@ static int drm_framebuffer_test_init(struct kunit *test)
 	struct device *parent;
 	struct drm_framebuffer_test_priv *priv;
 	struct drm_device *dev;
+	struct drm_file *file_priv;
 
 	parent = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
 
 	priv = drm_kunit_helper_alloc_drm_device(test, parent, typeof(*priv),
-						 dev, 0);
+						 dev, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
 	dev = &priv->dev;
+	file_priv = &priv->file_priv;
 
 	dev->mode_config.min_width = MIN_WIDTH;
 	dev->mode_config.max_width = MAX_WIDTH;
@@ -380,10 +393,22 @@ static int drm_framebuffer_test_init(struct kunit *test)
 	dev->mode_config.max_height = MAX_HEIGHT;
 	dev->mode_config.funcs = &mock_config_funcs;
 
+	mutex_init(&file_priv->fbs_lock);
+	INIT_LIST_HEAD(&file_priv->fbs);
+
 	test->priv = priv;
+
 	return 0;
 }
 
+static void drm_framebuffer_test_exit(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_file *file_priv = &priv->file_priv;
+
+	mutex_destroy(&file_priv->fbs_lock);
+}
+
 static void drm_test_framebuffer_create(struct kunit *test)
 {
 	const struct drm_framebuffer_test *params = test->param_value;
@@ -650,7 +675,83 @@ static void drm_test_framebuffer_free(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
 }
 
+static struct drm_framebuffer *
+fb_create_addfb2_mock(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_mode_fb_cmd2 *cmd)
+{
+	struct drm_framebuffer_test_priv *priv = container_of(dev, typeof(*priv), dev);
+	struct drm_framebuffer *fb;
+	struct kunit *test = priv->test;
+
+	fb = kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fb);
+
+	fb->base.id = 1;
+
+	priv->private = fb;
+	return fb;
+}
+
+static struct drm_mode_config_funcs config_funcs_addfb2_mock = {
+	.fb_create = fb_create_addfb2_mock,
+};
+
+static void drm_test_framebuffer_addfb2(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_file *file_priv = &priv->file_priv;
+	struct drm_framebuffer *fb = NULL;
+	u32 driver_features;
+	int ret;
+
+	/* A valid cmd */
+	struct drm_mode_fb_cmd2 cmd = {
+		.width = 600, .height = 600,
+		.pixel_format = DRM_FORMAT_ABGR8888,
+		.handles = { 1, 0, 0 }, .pitches = { 4 * 600, 0, 0 },
+	};
+
+	priv->test = test;
+	dev->mode_config.funcs = &config_funcs_addfb2_mock;
+
+	/* Must fail due to missing DRIVER_MODESET support */
+	driver_features = dev->driver_features;
+	dev->driver_features = 0u;
+	ret = drm_mode_addfb2(dev, &cmd, file_priv);
+	KUNIT_EXPECT_EQ(test, ret, -EOPNOTSUPP);
+	KUNIT_ASSERT_PTR_EQ(test, priv->private, NULL);
+	dev->driver_features = driver_features;
+
+	/*
+	 * Set an invalid cmd to trigger a fail on the
+	 * drm_internal_framebuffer_create function
+	 */
+	cmd.width = 0;
+	ret = drm_mode_addfb2(dev, &cmd, file_priv);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	KUNIT_ASSERT_PTR_EQ(test, priv->private, NULL);
+	cmd.width = 600; /* restore to a valid value */
+
+	ret = drm_mode_addfb2(dev, &cmd, file_priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	/* The fb_create_addfb2_mock set fb id to 1 */
+	KUNIT_EXPECT_EQ(test, cmd.fb_id, 1);
+
+	fb = priv->private;
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
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
@@ -664,6 +765,7 @@ static struct kunit_case drm_framebuffer_tests[] = {
 static struct kunit_suite drm_framebuffer_test_suite = {
 	.name = "drm_framebuffer",
 	.init = drm_framebuffer_test_init,
+	.exit = drm_framebuffer_test_exit,
 	.test_cases = drm_framebuffer_tests,
 };
 
-- 
2.41.0

