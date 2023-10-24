Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F07D5B3B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E41310E482;
	Tue, 24 Oct 2023 19:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317210E486
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7FE50419BC;
 Tue, 24 Oct 2023 21:11:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDqeAapOMyjG; Tue, 24 Oct 2023 21:11:09 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174669; bh=yEKpIBb7hDWC2UjERUf4B9ebwRmJUaPxM8ESGmaaNcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cjRRM8CtE/O2tRFUW2V/eEdUhUYu+TZ0yt9+VZm8nDoyC6C2oBTjUinBWqsoG67iy
 029P9wf7JqSRJiHyORcsCCXxaYGTWq7kguoEqJSNOVgtEYLfSiw2P70VRojwZQLHAu
 reVM3NfvKTwPgOFN9ABeNmg8fbv1wgyhOI+kIL/L12Rzwlou8sRttd71STQzZkm/jt
 oSPOzvPd8PB7trLATct6TnDRn+VLnwGjsutDv62k1RT2/eu34r9mvs24zH1aY6CSoU
 i0burNcI2sUpGoJk+k7PciYw6uMYr3LCOBfpCGXTTleD7alJazLEWkgEg33rbm7Ncv
 C5vUJ1GqbmcsQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/11] drm/tests: Add test for drm_framebuffer_cleanup()
Date: Tue, 24 Oct 2023 16:09:57 -0300
Message-ID: <20231024191002.1620-7-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_cleanup function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Rely on drm_kunit_helper_alloc_device() for mock initialization.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 7b51862fb0f2..a63f30985f75 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -490,8 +490,45 @@ check_src_coords_test_to_desc(const struct drm_framebuffer_check_src_coords_case
 KUNIT_ARRAY_PARAM(check_src_coords, drm_framebuffer_check_src_coords_cases,
 		  check_src_coords_test_to_desc);
 
+static void drm_test_framebuffer_cleanup(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct list_head *fb_list = &dev->mode_config.fb_list;
+	struct drm_framebuffer fb1 = { .dev = dev };
+	struct drm_framebuffer fb2 = { .dev = dev };
+
+	/* This must result on [fb_list] -> fb1 -> fb2 */
+	list_add_tail(&fb1.head, fb_list);
+	list_add_tail(&fb2.head, fb_list);
+	dev->mode_config.num_fb = 2;
+
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb1.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb1.head.prev, fb_list);
+	KUNIT_ASSERT_PTR_EQ(test, fb1.head.next, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, &fb1.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
+
+	drm_framebuffer_cleanup(&fb1);
+
+	/* Now [fb_list] -> fb2 */
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, fb_list);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
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
2.41.0

