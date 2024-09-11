Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE17974741
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 02:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1B10E99C;
	Wed, 11 Sep 2024 00:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="mj8u/iLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3522E10E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 00:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6320D4185A;
 Wed, 11 Sep 2024 02:13:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gACwhLMeqy6a; Wed, 11 Sep 2024 02:13:16 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1726013596; bh=q1+huwKay14UpDzqMJxlu5h358BCrFvEf1bOIaJLiVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mj8u/iLxcA6UXnwOeZ/pXN6R1UQUIaC/kkIwopzhSznkzoTKXMYx++ez3IJ2iTGZt
 t9eNxYorriSolvvDiFWL2TLzo2XBnbMVc95qDX50Lr882Ea9FulpTu2eSr88UTWUyc
 jaQeuNwjG6J3HT8sTJcynQtn1A4KvKNPmiBApfHOJLwel4zkUbJY0iLBhkmgZe0PJh
 OQGN9C15PzfJDx7+6Yv5ksCXh3HSwvv9eXwx+p5AB/cQxp01JWeLaVOpxRmIzd4IfM
 csQjxh4xGdbcZoa6OVPwd7MCuaDIa1Z4R4S/bbdeHc6UCDRLESdlyUR6vH95B415JR
 kiFH4/Js0dEFw==
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
Subject: [PATCH v4 RESEND 6/9] drm/tests: Add test for
 drm_framebuffer_cleanup()
Date: Tue, 10 Sep 2024 21:15:31 -0300
Message-ID: <20240911001559.28284-7-gcarlos@disroot.org>
In-Reply-To: <20240911001559.28284-1-gcarlos@disroot.org>
References: <20240911001559.28284-1-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_cleanup function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Rely on drm_kunit_helper_alloc_device() for mock initialization.
v3:
  - Init framebuffers using drm_framebuffer_init().
  - Add documentation.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 1924e3f9538e..908583d74b20 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -498,8 +498,40 @@ check_src_coords_test_to_desc(const struct drm_framebuffer_check_src_coords_case
 KUNIT_ARRAY_PARAM(check_src_coords, drm_framebuffer_check_src_coords_cases,
 		  check_src_coords_test_to_desc);
 
+/*
+ * Test if drm_framebuffer_cleanup() really pops out the framebuffer object
+ * from device's fb_list and decrement the number of framebuffers for that
+ * device, which is the only things it does.
+ */
+static void drm_test_framebuffer_cleanup(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct list_head *fb_list = &dev->mode_config.fb_list;
+	struct drm_format_info format = { };
+	struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
+	struct drm_framebuffer fb2 = { .dev = dev, .format = &format };
+
+	/* This will result on [fb_list] -> fb2 -> fb1 */
+	drm_framebuffer_init(dev, &fb1, NULL);
+	drm_framebuffer_init(dev, &fb2, NULL);
+
+	drm_framebuffer_cleanup(&fb1);
+
+	/* Now fb2 is the only one element on fb_list */
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&fb2.head));
+	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 1);
+
+	drm_framebuffer_cleanup(&fb2);
+
+	/* Now fb_list is empty */
+	KUNIT_ASSERT_TRUE(test, list_empty(fb_list));
+	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
-- 
2.44.2

