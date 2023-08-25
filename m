Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC49788CEE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A444C10E6CB;
	Fri, 25 Aug 2023 16:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5C010E6C6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5EBC4413B7;
 Fri, 25 Aug 2023 18:08:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjxVK5hksRVP; Fri, 25 Aug 2023 18:08:30 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979710; bh=O67py2nFOxoSGH7NgFXOdNdwHRs5g1jXdaIEuVqQ6hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=I/cHaX0CDQUgeQM4Q05794whY1ihsbgEMg9Wdu2yrK5wJZ4TIlZ/pLwW+4EmdE5EN
 vfxFxBwXhPQVgz80AT6qG2DqUiswNF/7DTWSlzx1Q9ujf+UX6yNaIaokggqpXCosGY
 QI26HG9IUfPcbY9pJYONTGD3a4iKbsaKh9xeULSX5B6b/AtVcJBEZyosRUcTVPy+sO
 ln8GXZvuST4J6ccQiT/Og5T9jkU0BodNMvGbO+JYRRrR0jb7tI+lvbfTfrSC4H1Onl
 y4tpdOJRw/wtdtWkKi00bWDq42NSADZXaKSZyIgRe1HERkIfETf5pIRaWH7pmrec1W
 OGN2N2QjbzVUQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Date: Fri, 25 Aug 2023 13:07:18 -0300
Message-ID: <20230825160725.12861-4-gcarlos@disroot.org>
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

Introduce a test to cover the creation of framebuffer with
modifier on a device that doesn't support it.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index aeaf2331f9cc..b20871e88995 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -396,7 +396,35 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
 		  drm_framebuffer_test_to_desc);
 
+/*
+ * This test is very similar to drm_test_framebuffer_create, except that it
+ * set mock->mode_config.fb_modifiers_not_supported member to 1, covering
+ * the case of trying to create a framebuffer with modifiers without the
+ * device really supporting it.
+ */
+static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
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
+	mock->private = &buffer_created;
+	dev->mode_config.fb_modifiers_not_supported = 1;
+
+	drm_internal_framebuffer_create(dev, &cmd, NULL);
+	KUNIT_EXPECT_EQ(test, 0, buffer_created);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	{ }
 };
-- 
2.41.0

