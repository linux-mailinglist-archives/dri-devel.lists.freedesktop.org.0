Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D5788CF1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E4C10E6CC;
	Fri, 25 Aug 2023 16:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D44510E6CC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0DBFE40EFD;
 Fri, 25 Aug 2023 18:08:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeHYGLQuw__G; Fri, 25 Aug 2023 18:08:44 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979724; bh=0LF+ZkkGQUjuFnbTwCUUcP0NI72TB7o23qw7MoB3BMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U0DD2sFI0EctTVizCGH08AdJs9blM+FCYoPyZTcrXzm+t89wQmZTyO2VZpLHz7qvG
 pFn8xl7CNZZqKHNxeJCx0qncS0193DX3iRFIzWRhxW9I1Evw5l3W/wVttuP1bjRPGd
 A25WZTOQ9RfxJDHjMQ0iNjDy+hopthK7Apn2kDF/VsYUjGGLI+0h3RYBwngsGojWkY
 ijctRpJ+kTTu6UQoW7fVwf8IcbJ+MvU5xvv/2gdzki8D/L5qyTl8Dzjp5O4dJ8J7Kn
 lvIu8ADt/P3f2oCNmnBuYixf334RsdU/c4VIBNKkA5zyQUlndQTO+UZXGW74PPuHHO
 yGNE1zoOMIkbg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] drm/tests: Add test for drm_framebuffer_lookup()
Date: Fri, 25 Aug 2023 13:07:21 -0300
Message-ID: <20230825160725.12861-7-gcarlos@disroot.org>
In-Reply-To: <20230825160725.12861-1-gcarlos@disroot.org>
References: <20230825160725.12861-1-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_lookup function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 16d9cf4bed88..3d14d35b4c4d 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -8,6 +8,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
@@ -370,6 +371,10 @@ static int drm_framebuffer_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
 	dev = &mock->dev;
 
+	dev->driver = kunit_kzalloc(test, sizeof(*dev->driver), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev->driver);
+
+	idr_init_base(&dev->mode_config.object_idr, 1);
 	mutex_init(&dev->mode_config.fb_lock);
 	INIT_LIST_HEAD(&dev->mode_config.fb_list);
 	dev->mode_config.num_fb = 0;
@@ -530,8 +535,31 @@ static void drm_test_framebuffer_cleanup(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
 }
 
+static void drm_test_framebuffer_lookup(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
+	struct drm_framebuffer fb1 = { };
+	struct drm_framebuffer *fb2;
+	uint32_t id = 0;
+	int ret;
+
+	ret = drm_mode_object_add(dev, &fb1.base, DRM_MODE_OBJECT_FB);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	id = fb1.base.id;
+
+	/* Looking for fb1 */
+	fb2 = drm_framebuffer_lookup(dev, NULL, id);
+	KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
+
+	/* Looking for an inexistent framebuffer */
+	fb2 = drm_framebuffer_lookup(dev, NULL, id + 1);
+	KUNIT_EXPECT_NULL(test, fb2);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
+	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
-- 
2.41.0

