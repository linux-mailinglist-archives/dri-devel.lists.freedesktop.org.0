Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B4948637
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 01:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681C10E2DC;
	Mon,  5 Aug 2024 23:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="kpGz97bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306810E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 23:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id C36DD41255;
 Tue,  6 Aug 2024 01:38:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oI1y-NH_KPzi; Tue,  6 Aug 2024 01:38:49 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1722901129; bh=eIiKDd7PD5sklMxxfFS9fHCxQ/wJduZqr50Xb84T8kA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kpGz97bmjlGioicwlX1Y3Efyqhge5gt+Jxv7BvWTBrnrHC9xMfEqEFpY3h/l/ohyC
 dd1c3eKAws2zxcgVX+Acm6Wl2x2bI9QDpZR1hC7ZAmauBFhNwXYI2opKBRSfK2xTHZ
 PYqqO/9TcgWUAZ0d/u7DMxjyJHtutQIP8Tpl146tgswwCLaT47K5sxHnm5VxsKOOSe
 Br4GWyfI+4aOZuoNdZDkacgpc3Az1LaDRyyJ4eLqT2wGgwuNHcLiE+n1FByhBOEtLW
 Nhm4MceBIN9aukJKD0h9gGlTtIWA0vI+oDt9AsD5m1tZsWJnOvbjsDv1/nAgogYgcf
 q3pLywNRyqX9g==
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
Subject: [PATCH v4 9/9] drm/tests: Add test for drm_framebuffer_free()
Date: Mon,  5 Aug 2024 20:39:34 -0300
Message-ID: <20240805234022.18586-10-gcarlos@disroot.org>
In-Reply-To: <20240805234022.18586-1-gcarlos@disroot.org>
References: <20240805234022.18586-1-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_free function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
v2:
  - Reorder kunit cases alphabetically.
v3:
  - Replace the use of void pointer on drm_framebuffer_test_priv struct.
  - Remove the test with unregistered framebuffer object.
  - Add documentation.
v4:
  - Export drm_mode_object_add for test.
---
 drivers/gpu/drm/drm_mode_object.c            |  1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 50 ++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index df4cc0e8e263..e943205a2394 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -81,6 +81,7 @@ int drm_mode_object_add(struct drm_device *dev,
 {
 	return __drm_mode_object_add(dev, obj, obj_type, true, NULL);
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_object_add);
 
 void drm_mode_object_register(struct drm_device *dev,
 			      struct drm_mode_object *obj)
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 72314805839d..6ea04cc8f324 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -358,6 +358,7 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 struct drm_framebuffer_test_priv {
 	struct drm_device dev;
 	bool buffer_created;
+	bool buffer_freed;
 };
 
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
@@ -649,10 +650,59 @@ static void drm_test_framebuffer_init_dev_mismatch(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
 }
 
+static void destroy_free_mock(struct drm_framebuffer *fb)
+{
+	struct drm_framebuffer_test_priv *priv = container_of(fb->dev, typeof(*priv), dev);
+
+	priv->buffer_freed = true;
+}
+
+static struct drm_framebuffer_funcs framebuffer_funcs_free_mock = {
+	.destroy = destroy_free_mock,
+};
+
+/*
+ * In summary, the drm_framebuffer_free() function must implicitly call
+ * fb->funcs->destroy() and garantee that the framebufer object is unregistered
+ * from the drm_device idr pool.
+ */
+static void drm_test_framebuffer_free(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_mode_object *obj;
+	struct drm_framebuffer fb = {
+		.dev = dev,
+		.funcs = &framebuffer_funcs_free_mock,
+	};
+	int id, ret;
+
+	priv->buffer_freed = false;
+
+	/*
+	 * Mock	a framebuffer that was not unregistered	at the moment of the
+	 * drm_framebuffer_free() call.
+	 */
+	ret = drm_mode_object_add(dev, &fb.base, DRM_MODE_OBJECT_FB);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	id = fb.base.id;
+
+	drm_framebuffer_free(&fb.base.refcount);
+
+	/* The framebuffer object must be unregistered */
+	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_FB);
+	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
+	KUNIT_EXPECT_EQ(test, fb.base.id, 0);
+
+	/* Test if fb->funcs->destroy() was called */
+	KUNIT_EXPECT_EQ(test, priv->buffer_freed, true);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_free),
 	KUNIT_CASE(drm_test_framebuffer_init),
 	KUNIT_CASE(drm_test_framebuffer_init_bad_format),
 	KUNIT_CASE(drm_test_framebuffer_init_dev_mismatch),
-- 
2.44.2

