Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4C788CF5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB7510E6CE;
	Fri, 25 Aug 2023 16:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6CD10E6CE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7B91240DB9;
 Fri, 25 Aug 2023 18:11:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id poRfREpXN1fi; Fri, 25 Aug 2023 18:11:12 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979872; bh=lBnr9BHCQJz/tR6buqaorkeGrdpjUc6C/fWk0NhZg/0=;
 h=From:To:Cc:Subject:Date;
 b=AKBbSN3RKYDl2y5qnihVnD/GZIRWL0cw8Nvy2bACfhxabYEV9mJHQzpv7nWp9TNdZ
 c9OD634DJO9KoEAYCm25oNSK92k39uJobgzqxe/8vswRy2UW0CCezjZPnh7dkVOSEr
 7WDQb42pAFmPAiunpoZ7/ouEH0KYxCxDztM2EJbZsQokiGRPFB2OTeY7C3c/iRGVmv
 v6fgV1XvryQrhbKs9zb/4Mnv+k5WhCAMuSccs8v7OtbgYgzVhqpD6fYPo1ULp4/9Bf
 8hsTnO4x2QnO1SxVg3XKUI3fp9qGSFya/sLEwDdS6oIQODyM+VJ+/UVEwiuIjNFV27
 5sCXWMmaT9ycg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/tests: Add test for drm_framebuffer_init()
Date: Fri, 25 Aug 2023 13:11:08 -0300
Message-ID: <20230825161108.13701-1-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_init function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 3d14d35b4c4d..50d88bf3fa65 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -557,8 +557,60 @@ static void drm_test_framebuffer_lookup(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, fb2);
 }
 
+static void drm_test_framebuffer_init(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
+	struct drm_device wrong_drm = { };
+	struct drm_format_info format = { };
+	struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
+	struct drm_framebuffer *fb2;
+	struct drm_framebuffer_funcs funcs = { };
+	int ret;
+
+	/* Fails if fb->dev doesn't point to the drm_device passed on first arg */
+	fb1.dev = &wrong_drm;
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	fb1.dev = dev;
+
+	/* Fails if fb.format isn't set */
+	fb1.format = NULL;
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	fb1.format = &format;
+
+	ret = drm_framebuffer_init(dev, &fb1, &funcs);
+	KUNIT_EXPECT_EQ(test, ret, 0);
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
+	KUNIT_EXPECT_EQ(test, fb1.base.id, 1);
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
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
+	KUNIT_CASE(drm_test_framebuffer_init),
 	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
-- 
2.41.0

