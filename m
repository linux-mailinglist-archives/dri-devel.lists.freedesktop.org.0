Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A39758485
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F810E3C5;
	Tue, 18 Jul 2023 18:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4936510E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E2F8B44EBF;
 Tue, 18 Jul 2023 20:19:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaqFjBWqHy60; Tue, 18 Jul 2023 20:19:43 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689704383; bh=YhUCbYUHFgY/A/B5JuF4w5fDDjji8xWqk5tX6lhk89w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=k38By5c/jhkUY5DIP3jUVB13dn39xCi76vzAuvkgN215xIsZpkltbHAd/aXOJ6Z48
 cY1yQLaNfxCyDBB0VaO94fHsAirvvp269iqV8bcF1cHkOdODd03FDPKVWrfkTrahMj
 rMzDPaYT0rqe97tqT63QMxPls4Q0/c5rV8WBuC7W427jfs7oA176XRP7yXcUvc1rCW
 haaltwNsrUjhY/AsDI5B7UW9r3UnSDshew8J4YeA4EKtPSgHFwDJDwHZDn56CkD/w1
 QFJ9VywoZHYjYEr7Ylh31t8QB2lCVDiF37FCCaAivlytwu775y1fwi1dG5vVL6o5pt
 uIjM5V0V7+MXQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Date: Tue, 18 Jul 2023 15:17:26 -0300
Message-ID: <20230718181726.3799-5-gcarlos@disroot.org>
In-Reply-To: <20230718181726.3799-1-gcarlos@disroot.org>
References: <20230718181726.3799-1-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 mripard@kernel.org, mairacanal@riseup.net,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a test to cover the creation of framebuffer with
modifier on a device that don't support it.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index cbab12503f5f..0f1744b5d2c1 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -388,6 +388,34 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
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
+	/* A valid cmd with modifier */
+	struct drm_mode_fb_cmd2 cmd = {
+		.width = MAX_WIDTH, .height = MAX_HEIGHT,
+		.pixel_format = DRM_FORMAT_ABGR8888, .handles = { 1, 0, 0 },
+		.offsets = { UINT_MAX / 2, 0, 0 }, .pitches = { 4 * MAX_WIDTH, 0, 0 },
+		.flags = DRM_MODE_FB_MODIFIERS,
+	};
+	struct drm_device *mock = test->priv;
+	int buffer_created = 0;
+
+	mock->dev_private = &buffer_created;
+	mock->mode_config.fb_modifiers_not_supported = 1;
+
+	drm_internal_framebuffer_create(mock, &cmd, NULL);
+	KUNIT_EXPECT_EQ(test, 0, buffer_created);
+
+	/* Restore original value */
+	mock->mode_config.fb_modifiers_not_supported = 0;
+}
+
 /* Parameters for testing drm_framebuffer_check_src_coords function */
 struct check_src_coords_case {
 	const char *name; /* Description of the parameter case */
@@ -513,6 +541,7 @@ KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
 		  check_src_coords_test_to_desc);
 
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	{ }
-- 
2.41.0

