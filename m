Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CE92672C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D315410E960;
	Wed,  3 Jul 2024 17:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="hR5uZVuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3469910E959
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:30:24 +0000 (UTC)
X-Virus-Scanned: SPAM Filter at disroot.org
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720027272; bh=PgYvBlZcjpFiRTrMY2RZm6D1+pkrrfjZ3EDILDMwGhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hR5uZVuWbZUD7663Xi7D8ecgubQYdjBYsK1RXMBv2OdLv/iRyV+Uvc1eqlZoffSKk
 UMvZfSH8MFP8yRtSOFhY8lqkhnpDsAP8pGfM0lMmdyt2NBxnfMgwVZWxAVfNrxtcvr
 KomnKj/hWtepiY4QwMhyVKBw7zC+1QFgQmQMpLQ91xDMeiNNjs0WADn/dY1KAKAeqE
 63v6VQ59Zh4TuqQ7iuzA/5acrpTmtP88SZ3VY/xUn4sw6mwYU25alyZHSRHjVCHdZm
 MafBAAAZ4aFhONhCUbArsfOoMeuLYGZZV7VEE7PYckI8MdpPkPJ8E3ARj+IQKxRfgM
 DaQYzqtKBxIHg==
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
Subject: [PATCH v3 4/9] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Date: Wed,  3 Jul 2024 14:22:23 -0300
Message-ID: <20240703172228.11166-5-gcarlos@disroot.org>
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

Introduce a test to cover the creation of framebuffer with
modifier on a device that doesn't support it.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Reorder kunit cases alphabetically.
v3:
  - Replace the use of void pointer on drm_framebuffer_test_priv struct.
  - Test return value of drm_internal_framebuffer_create().
  - Change test documentation to don't rely on another test.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 4b1884be9d7a..22966ebfe9cb 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -415,8 +415,33 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
 		  drm_framebuffer_test_to_desc);
 
+/* Tries to create a framebuffer with modifiers without drm_device supporting it */
+static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
+{
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
+	struct drm_framebuffer *fb;
+
+	/* A valid cmd with modifier */
+	struct drm_mode_fb_cmd2 cmd = {
+		.width = MAX_WIDTH, .height = MAX_HEIGHT,
+		.pixel_format = DRM_FORMAT_ABGR8888, .handles = { 1, 0, 0 },
+		.offsets = { UINT_MAX / 2, 0, 0 }, .pitches = { 4 * MAX_WIDTH, 0, 0 },
+		.flags = DRM_MODE_FB_MODIFIERS,
+	};
+
+	priv->buffer_created = false;
+	dev->mode_config.fb_modifiers_not_supported = 1;
+
+	fb = drm_internal_framebuffer_create(dev, &cmd, NULL);
+	KUNIT_EXPECT_EQ(test, false, priv->buffer_created);
+	KUNIT_ASSERT_EQ(test, IS_ERR(fb), true);
+	KUNIT_EXPECT_EQ(test, PTR_ERR(fb), -EINVAL);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
 };
 
-- 
2.44.2

