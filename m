Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B817D5B3F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3090110E487;
	Tue, 24 Oct 2023 19:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEF010E485
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 261E741A79;
 Tue, 24 Oct 2023 21:11:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzrmORnB6rEc; Tue, 24 Oct 2023 21:11:35 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174695; bh=ayvIn1gb3GHnc2l0wgnoLFWK5/qk0P5APIvoHqK3nUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iH5ABCSV8YimBzVkjXCp48y65zdtnk6HwXyNM1uf025ySr8GhFfoTXc4vqrQJFDSu
 9rVFwHMxH0cE97rE7Vp6Vy09+4CAb2J0T71esq9w97/zVhPHkVMaHCH4ewKlZQGdNd
 6y9tBpiIzwSHn6Ss5kRp7CH1IDk29GAHa/qqATRchmtEMbwkRzHP84MDt7h5D/6ZuL
 +4cbTcFkC7Apc6P/bQ5Spzvxiih1V11O8V+CKtXKoLGyq3+evZS7nTQUUoEN2dhJWG
 wACDmqCcb8VLAvc3l/XE/1Jsh/QhqH6p7bS2PnZk6/kegih9cBP5ic4SiSx+GS3I/F
 cUy+uZY4GfJ1w==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/11] drm/tests: Add test for drm_framebuffer_free()
Date: Tue, 24 Oct 2023 16:10:00 -0300
Message-ID: <20231024191002.1620-10-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_free function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index eedd5e920279..dbe412d0dca4 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -602,10 +602,59 @@ static void drm_test_framebuffer_init(struct kunit *test)
 	drm_framebuffer_cleanup(&fb1);
 }
 
+static void destroy_free_mock(struct drm_framebuffer *fb)
+{
+	struct drm_framebuffer_test_priv *priv = container_of(fb->dev, typeof(*priv), dev);
+	int *buffer_freed = priv->private;
+	*buffer_freed = 1;
+}
+
+static struct drm_framebuffer_funcs framebuffer_funcs_free_mock = {
+	.destroy = destroy_free_mock,
+};
+
+static void drm_test_framebuffer_free(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_mode_object *obj;
+	struct drm_framebuffer fb = {
+		.dev = dev,
+		.funcs = &framebuffer_funcs_free_mock,
+	};
+	int buffer_freed = 0;
+	int id, ret;
+
+	priv->private = &buffer_freed;
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
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_free),
 	KUNIT_CASE(drm_test_framebuffer_init),
 	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
-- 
2.41.0

