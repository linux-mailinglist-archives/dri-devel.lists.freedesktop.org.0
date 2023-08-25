Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADCC788CF8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5250310E6D2;
	Fri, 25 Aug 2023 16:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636B10E6D2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CEE2D40D83;
 Fri, 25 Aug 2023 18:11:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71RMPZk8EU4j; Fri, 25 Aug 2023 18:11:52 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979912; bh=cjtiCIVPvKmi0KHHG/emXJ6JrAyrcA7ZlmZ787o4ORA=;
 h=From:To:Cc:Subject:Date;
 b=kcttNbmhEyaJIuXoZWkDIl8WmK7ExiTzZ2o0gf+MLWP4dp2gCYdkdD1rmtxjTJH4a
 7Vc/RT/FbJ/W+OKzbRwClebBK9DPm42rjdqoYk6cNWOEdTcx0fUtNdqvDQmIp9Fa5P
 iK5y8n1+PgVdXwi7vEisGjnoGw8v/PCpPeVS4dYcBISlq9AN2QIJbrOra+7O6evMzp
 XZy4VsFPynczbFfmuYTbCPP//WFNL7FFM0JMxSd2fZid/L4NHLMkVg+JfDR18NQc4c
 GrSf+BWZpnWXAzv72dsGuf9a3RmsnL+o1xj0vXale0Di28dVgodIwPkf5cPPdA37qe
 VXnAzzib7I1sg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] drm/tests: Add test for drm_framebuffer_free()
Date: Fri, 25 Aug 2023 13:11:48 -0300
Message-ID: <20230825161149.13841-1-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_free function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 50d88bf3fa65..8eca92fdc645 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -608,8 +608,57 @@ static void drm_test_framebuffer_init(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);
 }
 
+static void destroy_free_mock(struct drm_framebuffer *fb)
+{
+	struct drm_mock *mock = container_of(fb->dev, typeof(*mock), dev);
+	int *buffer_freed = mock->private;
+	*buffer_freed = 1;
+}
+
+static struct drm_framebuffer_funcs framebuffer_funcs_free_mock = {
+	.destroy = destroy_free_mock,
+};
+
+static void drm_test_framebuffer_free(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
+	struct drm_mode_object *obj;
+	struct drm_framebuffer fb = {
+		.dev = dev,
+		.funcs = &framebuffer_funcs_free_mock,
+	};
+	int buffer_freed = 0;
+	int id, ret;
+
+	mock->private = &buffer_freed;
+
+	/*
+	 * Case where the fb isn't registered. Just test if
+	 * drm_framebuffer_free calls fb->funcs->destroy
+	 */
+	drm_framebuffer_free(&fb.base.refcount);
+	KUNIT_EXPECT_EQ(test, buffer_freed, 1);
+
+	buffer_freed = 0;
+
+	ret = drm_mode_object_add(dev, &fb.base, DRM_MODE_OBJECT_FB);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	id = fb.base.id;
+
+	/* Now, test with the fb registered, that must end unregistered */
+	drm_framebuffer_free(&fb.base.refcount);
+	KUNIT_EXPECT_EQ(test, fb.base.id, 0);
+	KUNIT_EXPECT_EQ(test, buffer_freed, 1);
+
+	/* Test if the old id of the fb was really removed from the idr pool */
+	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_FB);
+	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
+	KUNIT_CASE(drm_test_framebuffer_free),
 	KUNIT_CASE(drm_test_framebuffer_init),
 	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
-- 
2.41.0

