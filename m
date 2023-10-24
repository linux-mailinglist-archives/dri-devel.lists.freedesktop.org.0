Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BFB7D5B3D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AFD10E483;
	Tue, 24 Oct 2023 19:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D5C10E483
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6FB94407DE;
 Tue, 24 Oct 2023 21:11:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7v15vkDB1d8S; Tue, 24 Oct 2023 21:11:26 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174686; bh=njXCWGY8vUBFw4K8QFGULZiAWgcgqnEflsk6TiGUCIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QbJzRvP0kDvGte46AwCG4aIdsuygTfafNW3EifsZfL0mSa3yvamHAd+QauYEQeBJy
 Pl2WDJ/SWEhCptXoJf5xSD+WYeWGMhmQMCIzms91acIDm7xd2b57IMsL98PKYpgFtr
 lPfBRsxbc4bNF70qhVl5miQgPB8MVjiAXNcPdxalBC4Q5lsx+xkqnSqOZ7R7Pi8hV7
 N/tSIKWgsf/PmIs4MU7gYklkOv3tF1GYlbZ3VpU0k7k4K49jvopEM52ySkM0N+OSl3
 fex8SbAFbd533vmYvQR+Z63CFQvgKHqHxZ9+oYZmhrGick7I2Ko8V1c6aYMdpHaFBG
 5+8ToXTDzQ4JA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/11] drm/tests: Add test for drm_framebuffer_init()
Date: Tue, 24 Oct 2023 16:09:59 -0300
Message-ID: <20231024191002.1620-9-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_init function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Let fb1.dev unset instead of set it to wrong_drm to test mismatched
    drm_device passed as drm_framebuffer_init() argument.
  - Clean the framebuffer object.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index fb9589dd8aed..eedd5e920279 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -551,10 +551,62 @@ static void drm_test_framebuffer_lookup(struct kunit *test)
 	drm_framebuffer_cleanup(&fb1);
 }
 
+static void drm_test_framebuffer_init(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_format_info format = { };
+	struct drm_framebuffer fb1 = { .format = &format };
+	struct drm_framebuffer *fb2;
+	struct drm_framebuffer_funcs funcs = { };
+	int ret;
+
+	/* Fails if fb->dev doesn't point to the drm_device passed on first arg */
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_ASSERT_EQ(test, ret, -EINVAL);
+	fb1.dev = dev;
+
+	/* Fails if fb.format isn't set */
+	fb1.format = NULL;
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_ASSERT_EQ(test, ret, -EINVAL);
+	fb1.format = &format;
+
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * Check if fb->funcs is actually set to the drm_framebuffer_funcs
+	 * passed to it
+	 */
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
+	/* Checks if the fb is really published and findable */
+	fb2 = drm_framebuffer_lookup(dev, NULL, fb1.base.id);
+	KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
+
+	/* There must be just that one fb initialized */
+	KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
+	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, &fb1.head);
+	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);
+
+	drm_framebuffer_cleanup(&fb1);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_init),
 	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
-- 
2.41.0

