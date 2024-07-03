Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BC92672B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E20310E95D;
	Wed,  3 Jul 2024 17:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="PFZcuTOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E78B10E952
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:30:22 +0000 (UTC)
X-Virus-Scanned: SPAM Filter at disroot.org
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720027288; bh=u+waA3ERN/R9C1+7FuEqbNu+4+7A8S3ryY4fb2+V13M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PFZcuTOr/ln3wbv1NI/59q/dQCXMStK624W8USBsOtCnpvgm/OMlZv9g4OuuDYaFb
 SL1K7/60qpg5HbseyjDZC3uUgYPMrQPS6QqJbnPACZ5/IUmPSZ1KTS9SIKhE1ZAfgv
 IW1XuPZ2ETdOAvji7Z7WsQMCBfuSG5IS3tOz9QCvmV50jUDZgVUnyfT3dfwmo7bAiE
 17LnBKEdZGBjUjTgF8Q61tkHoValZSKUutwIDI9z/w0sEvaTmsnk4vBroBTdD3qHhy
 SzJBxCrDaelHealhRhbqfjcHQsUattjwOKMpG2qZRY/LtRujLH4NpIv5oNTeCm0IKr
 LSwnODDtScfaA==
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
Subject: [PATCH v3 9/9] drm/tests: Add test for drm_framebuffer_free()
Date: Wed,  3 Jul 2024 14:22:28 -0300
Message-ID: <20240703172228.11166-10-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_free function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
v3:
  - Replace the use of void pointer on drm_framebuffer_test_priv struct.
  - Remove the test with unregistered framebuffer object.
  - Add documentation.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 73a1a3a3987e..7d1d078760f9 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -357,6 +357,7 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 struct drm_framebuffer_test_priv {
 	struct drm_device dev;
 	bool buffer_created;
+	bool buffer_freed;
 };
 
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
@@ -634,10 +635,59 @@ static void drm_test_framebuffer_init_dev_mismatch(struct kunit *test)
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

