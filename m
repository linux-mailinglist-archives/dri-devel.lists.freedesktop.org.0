Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B67754243
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 20:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7FC10E8D3;
	Fri, 14 Jul 2023 18:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65D10E8D2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 01A5940B42;
 Fri, 14 Jul 2023 20:08:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFB0oipgnOCk; Fri, 14 Jul 2023 20:08:46 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689358126; bh=kpryaEClraU066T2dbISwNctGwV1TRNDGalAYs3XCFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g9s3K3glvTNWEmqmlvbQYY4wulTg9mLRXm324OcxNchEWt2rcvIbF9zRc83Wl8mDi
 Vi/WUVimrQd3No9i/9WAafsNELvE0rk+u9v5qUdEfJefiwQqiHKlRT1+UDiWV3jucm
 ZRkSEyWUs8UidsiRDSbv56O/ecMoCJtF1WZjz8Qxz+k6n4lck+bQQl/7P0ZEmmcean
 0r/34KiOg0MtKZTxYUIakA2maVhuODx7zcGDwp/iuJ+wrCYi/wl5/vYUbbBU93pdYj
 hPzwbumPZgVlBiVurWbE+TUhQyiRWw4Gv+qCcWJyDeDJYJM/oQOlhjWOv1q1KsuFH0
 vjoZyOxc8id6g==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Date: Fri, 14 Jul 2023 15:06:19 -0300
Message-ID: <20230714180619.15850-5-gcarlos@disroot.org>
In-Reply-To: <20230714180619.15850-1-gcarlos@disroot.org>
References: <20230714180619.15850-1-gcarlos@disroot.org>
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

Introduce a test to cover the creation of a framebuffer with
a setted modifier and a driver that don't support modifiers.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 1fbb534b2e22..7ee595321462 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -388,6 +388,26 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
 		  drm_framebuffer_test_to_desc);
 
+static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
+{
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
+	mock->mode_config.fb_modifiers_not_supported = 0;
+}
+
 struct check_src_coords_case {
 	const int expect;
 	const uint32_t src_x;
@@ -494,6 +514,7 @@ KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
 		  check_src_coords_test_to_desc);
 
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	{ }
-- 
2.41.0

