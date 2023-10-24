Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A237D5B41
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2D310E488;
	Tue, 24 Oct 2023 19:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F5510E485
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 9C93E41A42;
 Tue, 24 Oct 2023 21:11:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfPHRlnwXK9x; Tue, 24 Oct 2023 21:11:51 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174711; bh=BVIYdZxkU68rXZ/RWqSgLWyL4kBauhz/JWSa0EsNwDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dUDVHq1zx3ptISf2ZVC6iLznu5odjrbHGx3q4LDEBpKYyYhk5wgI6YUp1siOjgYnt
 Reie8W5YrQN8/J8WG2XNw9lLG9ZT/UAvS9jQl5hjfTTaZCQ5OtVtdeDV88e8IPNCY0
 WXrN4nMbY+rb3pa1Amk25BTOOwVAqC0j4rRSlfxbf4JyrqsldbJQzwJXKN4P/w9rAK
 WqvmSoNfAJGDLYWbTZFjZ12dyVFUaJ/ctxwyGuiq/Bn5zw+b5tuQPNg9Dr1y+Jzn/Z
 edCZj3oJItalZYrSlPAzvGP2j4XR/RQJkO+AilKfP2ck6FFA5eXKF0zem3d1hbmNA+
 X4sAZmQgGth3g==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/11] drm/tests: Add test for drm_fb_release()
Date: Tue, 24 Oct 2023 16:10:02 -0300
Message-ID: <20231024191002.1620-12-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_fb_release function, which also
implicitly test the static legacy_remove_fb function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Rely on drm_kunit_helper_alloc_device() for mock initialization.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 142 +++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 149e1985e53f..70b14e05dc83 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -7,6 +7,7 @@
 
 #include <kunit/test.h>
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode.h>
@@ -750,7 +751,148 @@ static void drm_test_framebuffer_addfb2(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, fb->filp_head.next, &file_priv->fbs);
 }
 
+static void drm_framebuffer_fb_release_remove_mock(struct kref *kref)
+{
+	struct drm_framebuffer *fb = container_of(kref, typeof(*fb), base.refcount);
+	struct drm_framebuffer_test_priv *priv = container_of(fb->dev, typeof(*priv), dev);
+	bool *obj_released = priv->private;
+
+	obj_released[fb->base.id - 1] = true;
+}
+
+static int crtc_set_config_fb_release_mock(struct drm_mode_set *set,
+					   struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_crtc *crtc = set->crtc;
+	struct drm_framebuffer_test_priv *priv = container_of(crtc->dev, typeof(*priv), dev);
+	bool *obj_released = priv->private;
+
+	obj_released[crtc->base.id - 1] = true;
+	obj_released[crtc->primary->base.id - 1] = true;
+	return 0;
+}
+
+static int disable_plane_fb_release_mock(struct drm_plane *plane,
+					 struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_framebuffer_test_priv *priv = container_of(plane->dev, typeof(*priv), dev);
+	bool *obj_released = priv->private;
+
+	obj_released[plane->base.id - 1] = true;
+	return 0;
+}
+
+#define NUM_OBJS 5
+
+/*
+ * The drm_fb_release function implicitly calls at some point the
+ * drm_framebuffer_remove, which actually removes framebuffers
+ * based on the driver supporting or not the atomic API. To simplify
+ * this test, let it rely on legacy removing and leave the atomic remove
+ * to be tested in another test case. By doing that, we can also test
+ * the legacy_remove_fb function entirely.
+ */
+static void drm_test_fb_release(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_file *file_priv = &priv->file_priv;
+	struct drm_plane_funcs plane_funcs = {
+		.disable_plane = disable_plane_fb_release_mock
+	};
+	struct drm_crtc_funcs crtc_funcs = {
+		.set_config = crtc_set_config_fb_release_mock
+	};
+	struct drm_framebuffer *fb1, *fb2;
+	struct drm_plane *plane1, *plane2;
+	struct drm_crtc *crtc;
+	bool *obj_released;
+
+	/*
+	 * obj_released[i] where "i" is the obj.base.id - 1. Note that the
+	 * "released" word means different things for each kind of obj, which
+	 * in case of a framebuffer, means that it was freed, while for the
+	 * crtc and plane, means that it was deactivated.
+	 */
+	obj_released = kunit_kzalloc(test, NUM_OBJS * sizeof(bool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, obj_released);
+	priv->private = obj_released;
+
+	fb1 = kunit_kzalloc(test, sizeof(*fb1), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fb1);
+	list_add(&fb1->filp_head, &file_priv->fbs);
+	kref_init(&fb1->base.refcount);
+	fb1->dev = dev;
+	fb1->base.free_cb = drm_framebuffer_fb_release_remove_mock;
+	fb1->base.id = 1;
+
+	fb2 = kunit_kzalloc(test, sizeof(*fb2), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fb2);
+	list_add(&fb2->filp_head, &file_priv->fbs);
+	kref_init(&fb2->base.refcount);
+	fb2->dev = dev;
+	fb2->base.free_cb = drm_framebuffer_fb_release_remove_mock;
+	fb2->base.id = 2;
+
+	plane1 = kunit_kzalloc(test, sizeof(*plane1), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane1);
+	list_add(&plane1->head, &dev->mode_config.plane_list);
+	drm_modeset_lock_init(&plane1->mutex);
+	plane1->dev = dev;
+	plane1->funcs = &plane_funcs;
+	plane1->base.id = 3;
+
+	plane2 = kunit_kzalloc(test, sizeof(*plane2), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane2);
+	list_add(&plane2->head, &dev->mode_config.plane_list);
+	drm_modeset_lock_init(&plane2->mutex);
+	plane2->dev = dev;
+	plane2->funcs = &plane_funcs;
+	plane2->base.id = 4;
+
+	crtc = kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+	list_add(&crtc->head, &dev->mode_config.crtc_list);
+	drm_modeset_lock_init(&crtc->mutex);
+	crtc->dev = dev;
+	crtc->funcs = &crtc_funcs;
+	crtc->base.id = 5;
+
+	/*
+	 * Attach fb2 to some planes to stress the case where we have more than
+	 * one reference to the fb. plane1 is attached to crtc as primary plane
+	 * and plane2 will represent any non-primary plane, allowing to cover
+	 * all codepaths on legacy_remove_fb
+	 */
+	crtc->primary = plane1;
+	plane1->crtc = crtc;
+	plane1->fb = fb2;
+	plane2->fb = fb2;
+	/* Each plane holds one reference to fb */
+	drm_framebuffer_get(fb2);
+	drm_framebuffer_get(fb2);
+
+	drm_fb_release(file_priv);
+
+	KUNIT_EXPECT_TRUE(test, list_empty(&file_priv->fbs));
+
+	/* Every object from this test should be released */
+	for (int i = 0; i < 5; i++)
+		KUNIT_EXPECT_EQ(test, obj_released[i], 1);
+
+	KUNIT_EXPECT_FALSE(test, kref_read(&fb1->base.refcount));
+	KUNIT_EXPECT_FALSE(test, kref_read(&fb2->base.refcount));
+
+	KUNIT_EXPECT_PTR_EQ(test, plane1->crtc, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, plane1->fb, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, plane1->old_fb, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, plane2->crtc, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, plane2->fb, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, plane2->old_fb, NULL);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(drm_test_fb_release),
 	KUNIT_CASE(drm_test_framebuffer_addfb2),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
-- 
2.41.0

