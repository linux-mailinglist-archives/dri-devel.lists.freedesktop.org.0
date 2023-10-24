Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5B7D5B2D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6905C10E481;
	Tue, 24 Oct 2023 19:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F5010E480
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 92189419BC;
 Tue, 24 Oct 2023 21:10:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szOVVpzjSUQh; Tue, 24 Oct 2023 21:10:44 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174644; bh=Q9rZD8Rln0ANnHRh1OHokVw7Xr16LrkSUc+tByqUo1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TsO7VC1Exa2UeL3A0bGji/FyAV3M5eHzYhklQArQGl36ZcDRNBXdrydsfdydrmMcV
 h+ehRWpiTOWrY/PxyXhs6savFM6Zcf6oFy4QL7pPXXX9qBCWqrWCe1WazLtEj3Bqb2
 Yl0dybSpZNOiUg8ZQ2uIx06DpqV77egScBEA6MtdUXb4YaoFpy8e14vPT3xvXAJO9F
 5WKSYSgaaO0/qZWe+udsHC3yRk3cvw0mvV/e6BT++reN3jgU5eytpkaEPdh+R1IzAE
 TCkqyeXLUzMsEy991Och2iZ1k34brdJpH2G004sktC3gf06FWHpBt6w+P1UMGBhrqj
 5F9FYcOnUfKWA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/11] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Date: Tue, 24 Oct 2023 16:09:55 -0300
Message-ID: <20231024191002.1620-5-gcarlos@disroot.org>
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

Introduce a test to cover the creation of framebuffer with
modifier on a device that doesn't support it.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index eb76a71644e9..8a9b6d08d639 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -403,8 +403,36 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
 		  drm_framebuffer_test_to_desc);
 
+/*
+ * This test is very similar to drm_test_framebuffer_create, except that it
+ * set dev->mode_config.fb_modifiers_not_supported member to 1, covering
+ * the case of trying to create a framebuffer with modifiers without the
+ * device really supporting it.
+ */
+static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	int buffer_created = 0;
+
+	/* A valid cmd with modifier */
+	struct drm_mode_fb_cmd2 cmd = {
+		.width = MAX_WIDTH, .height = MAX_HEIGHT,
+		.pixel_format = DRM_FORMAT_ABGR8888, .handles = { 1, 0, 0 },
+		.offsets = { UINT_MAX / 2, 0, 0 }, .pitches = { 4 * MAX_WIDTH, 0, 0 },
+		.flags = DRM_MODE_FB_MODIFIERS,
+	};
+
+	priv->private = &buffer_created;
+	dev->mode_config.fb_modifiers_not_supported = 1;
+
+	drm_internal_framebuffer_create(dev, &cmd, NULL);
+	KUNIT_EXPECT_EQ(test, 0, buffer_created);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
 };
 
-- 
2.41.0

