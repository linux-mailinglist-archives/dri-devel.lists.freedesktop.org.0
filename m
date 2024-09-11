Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A224797473B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 02:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4C610E594;
	Wed, 11 Sep 2024 00:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Hl68Gri8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B110E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 00:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id C1E8541A14;
 Wed, 11 Sep 2024 02:13:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjocm6Cx52L7; Wed, 11 Sep 2024 02:13:20 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1726013599; bh=bsgFFLHh75ijQ55czeGmxAy5GK6I7T8ny0FIdoEwj2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Hl68Gri8Q/XdvP7NRBQS9kR8YqpXW3OCIxI1e2HGS5ERMrPigLP0ekxHudRX48Xqe
 Es0HtV8zUsUMYwvfqml6Y72X9JV7EPvl08MY2MGNb7YqWooINlsktffqF+B1zF4tqp
 oQ/NW7pzRZ+R6g0LMhoeoRxpPVfWo7Yn+pKh3kSRyCDwFtR/hFC2gQvnLX4nOefBv7
 8KqFl3rMhu1vcr082X6AoYS+etRtJ6RbJAeltO2l6bPbLBiVWxp13tALl9Zc/ZHyJy
 odigwckEhzflZpbcmHdMSbvD8j2EAkPGduo70Xst1UcADEwET0g9ILCPsUlxLYuS1j
 O90nHOMZFUnxA==
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
Subject: [PATCH v4 RESEND 7/9] drm/tests: Add test for drm_framebuffer_lookup()
Date: Tue, 10 Sep 2024 21:15:32 -0300
Message-ID: <20240911001559.28284-8-gcarlos@disroot.org>
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

Add two KUnit test cases for the drm_framebuffer_lookup function, one
for the base case, that tests if the lookup finds the correct framebuffer
object and another that tests the lookup for an inexistent framebuffer.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
v2:
  - Reorder kunit cases alphabetically.
  - Replace drm_mode_object_add() call to drm_framebuffer_init().
  - Rely on drm_kunit_helper_alloc_device() for mock initialization.
v3:
  - Rename framebuffer variables.
  - Add documentation.
  - Split the lookup for inexistent framebuffer into another test.
  - Call drm_framebuffer_put after lookup on drm_test_framebuffer_lookup
    test.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 908583d74b20..e11b5bc9a105 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -529,10 +529,51 @@ static void drm_test_framebuffer_cleanup(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
 }
 
+/*
+ * Initialize a framebuffer, lookup its id and test if the returned reference
+ * matches.
+ */
+static void drm_test_framebuffer_lookup(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_format_info format = { };
+	struct drm_framebuffer expected_fb = { .dev = dev, .format = &format };
+	struct drm_framebuffer *returned_fb;
+	uint32_t id = 0;
+	int ret;
+
+	ret = drm_framebuffer_init(dev, &expected_fb, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	id = expected_fb.base.id;
+
+	/* Looking for expected_fb */
+	returned_fb = drm_framebuffer_lookup(dev, NULL, id);
+	KUNIT_EXPECT_PTR_EQ(test, returned_fb, &expected_fb);
+	drm_framebuffer_put(returned_fb);
+
+	drm_framebuffer_cleanup(&expected_fb);
+}
+
+/* Try to lookup an id that is not linked to a framebuffer */
+static void drm_test_framebuffer_lookup_inexistent(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_framebuffer *fb;
+	uint32_t id = 0;
+
+	/* Looking for an inexistent framebuffer */
+	fb = drm_framebuffer_lookup(dev, NULL, id);
+	KUNIT_EXPECT_NULL(test, fb);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_lookup),
+	KUNIT_CASE(drm_test_framebuffer_lookup_inexistent),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
 };
-- 
2.44.2

