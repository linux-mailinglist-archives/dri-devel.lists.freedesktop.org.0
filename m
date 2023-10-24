Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5AF7D5B3C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3B10E484;
	Tue, 24 Oct 2023 19:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF2510E483
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 1FC3241AA0;
 Tue, 24 Oct 2023 21:11:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wuEisYSXWb3U; Tue, 24 Oct 2023 21:11:16 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174676; bh=7qgVKaq0bGOawttIrXJG6a6aZjnwW6w8TF15hqpJFqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hOURSApql/ivLtqYyQlwJhy8lc2ymROwpvQsWJjlrFzC8nMTao9Bwmz+PyVogdb5C
 rwb0Cbx3hpASTb+E4OQC3Lj1aZW5iMVrvigoPSPZR/6I1O40HhlpL9nVFzuqVKuv3K
 gf6yo3H/dL2bcpk/BcbwfVvsL++jH+b1wGsp0S82HisgWskUri60rBG0CWS/IFQ9jB
 //TMZOwo+GLc593tHSUsFfkwURWl2X4qId87NeW6+F02JDdC4TL6rWfB1qyRSXBcwL
 XVPDjE+mmMnusYqFSuVUqpT6WHkByt3CK6+PQwJTPhP8+df5gJs2L9+zJV/rkLmBIa
 92H0W0KciERRQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/tests: Add test for drm_framebuffer_lookup()
Date: Tue, 24 Oct 2023 16:09:58 -0300
Message-ID: <20231024191002.1620-8-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_lookup function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Replace drm_mode_object_add() call to drm_framebuffer_init().
  - Rely on drm_kunit_helper_alloc_device() for mock initialization.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index a63f30985f75..fb9589dd8aed 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -526,10 +526,36 @@ static void drm_test_framebuffer_cleanup(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
 }
 
+static void drm_test_framebuffer_lookup(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_format_info format = { };
+	struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
+	struct drm_framebuffer *fb2;
+	uint32_t id = 0;
+	int ret;
+
+	ret = drm_framebuffer_init(dev, &fb1, NULL);
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
+
+	drm_framebuffer_cleanup(&fb1);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
 };
-- 
2.41.0

