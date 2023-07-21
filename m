Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F475D140
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097B610E6EB;
	Fri, 21 Jul 2023 18:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DA910E6EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:24:00 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4R6ycc0cHjzDrR5;
 Fri, 21 Jul 2023 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1689963840; bh=/Z7z1h6DnF8BRnpv8Z9z2W7wKicXRnHsi7X2Ky7Wvy4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H7tq1XRfHRsKXBDnO85Rqa/7EC9peMdZql1xSjFMnbwneSiNqWP1R9rKNXkYNyaVA
 Aaaw+2qD9jm6c+JY2tHcA0xbF1dhTjJlaxuyiBx704Ntjg9uGqoUbKmB7VsYMfXhh/
 umZQyMWcrBsRoWG8SEL4nTJWPp/lBYBKW0HM/xWg=
X-Riseup-User-ID: 4B78708AB9124ACABC231CB7F6258CF06BAED231FB28D299B59EFECA542248D0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4R6ycX2HJxzFqjb;
 Fri, 21 Jul 2023 18:23:56 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/format-helper: Add KUnit tests for
 drm_fb_build_fourcc_list()
Date: Fri, 21 Jul 2023 15:23:14 -0300
Message-ID: <20230721182316.560649-5-arthurgrillo@riseup.net>
In-Reply-To: <20230721182316.560649-1-arthurgrillo@riseup.net>
References: <20230721182316.560649-1-arthurgrillo@riseup.net>
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
Cc: tzimmermann@suse.de, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert parameterized test for the drm_fb_build_fourcc_list() to ensure
correctness and prevent future regressions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 2e1c5463f063..de4677868647 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -3,6 +3,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
@@ -11,6 +12,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include "../drm_crtc_internal.h"
 
@@ -1047,6 +1049,146 @@ static void drm_test_fb_clip_offset(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
 }
 
+struct fb_build_fourcc_list_case {
+	const char *name;
+	u32 native_fourccs[TEST_BUF_SIZE];
+	u32 expected[TEST_BUF_SIZE];
+};
+
+struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
+	{
+		.name = "no native formats",
+		.native_fourccs = { },
+		.expected = { DRM_FORMAT_XRGB8888 },
+	},
+	{
+		.name = "XRGB8888 as native format",
+		.native_fourccs = { DRM_FORMAT_XRGB8888 },
+		.expected = { DRM_FORMAT_XRGB8888 },
+	},
+	{
+		.name = "remove duplicates",
+		.native_fourccs = {
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_XRGB8888,
+		},
+		.expected = {
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB565,
+		},
+	},
+	{
+		.name = "convert alpha formats",
+		.native_fourccs = {
+			DRM_FORMAT_ARGB1555,
+			DRM_FORMAT_ABGR1555,
+			DRM_FORMAT_RGBA5551,
+			DRM_FORMAT_BGRA5551,
+			DRM_FORMAT_ARGB8888,
+			DRM_FORMAT_ABGR8888,
+			DRM_FORMAT_RGBA8888,
+			DRM_FORMAT_BGRA8888,
+			DRM_FORMAT_ARGB2101010,
+			DRM_FORMAT_ABGR2101010,
+			DRM_FORMAT_RGBA1010102,
+			DRM_FORMAT_BGRA1010102,
+		},
+		.expected = {
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_XBGR1555,
+			DRM_FORMAT_RGBX5551,
+			DRM_FORMAT_BGRX5551,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_XBGR8888,
+			DRM_FORMAT_RGBX8888,
+			DRM_FORMAT_BGRX8888,
+			DRM_FORMAT_XRGB2101010,
+			DRM_FORMAT_XBGR2101010,
+			DRM_FORMAT_RGBX1010102,
+			DRM_FORMAT_BGRX1010102,
+		},
+	},
+	{
+		.name = "random formats",
+		.native_fourccs = {
+			DRM_FORMAT_Y212,
+			DRM_FORMAT_ARGB1555,
+			DRM_FORMAT_ABGR16161616F,
+			DRM_FORMAT_C8,
+			DRM_FORMAT_BGR888,
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_RGBA5551,
+			DRM_FORMAT_BGR565_A8,
+			DRM_FORMAT_R10,
+			DRM_FORMAT_XYUV8888,
+		},
+		.expected = {
+			DRM_FORMAT_Y212,
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_ABGR16161616F,
+			DRM_FORMAT_C8,
+			DRM_FORMAT_BGR888,
+			DRM_FORMAT_RGBX5551,
+			DRM_FORMAT_BGR565_A8,
+			DRM_FORMAT_R10,
+			DRM_FORMAT_XYUV8888,
+			DRM_FORMAT_XRGB8888,
+		},
+	},
+};
+
+static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
+
+static size_t get_nfourccs(const u32 *fourccs)
+{
+	size_t i;
+
+	for (i = 0; i < TEST_BUF_SIZE && fourccs[i]; ++i)
+		;
+
+	return i;
+}
+
+static void drm_test_fb_build_fourcc_list(struct kunit *test)
+{
+	const struct fb_build_fourcc_list_case *params = test->param_value;
+	u32 fourccs_out[TEST_BUF_SIZE];
+	size_t nfourccs_out;
+	struct drm_device *drm;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
+						get_nfourccs(params->native_fourccs),
+						fourccs_out, TEST_BUF_SIZE);
+
+	drm_kunit_helper_free_device(test, dev);
+	KUNIT_EXPECT_EQ(test, nfourccs_out, get_nfourccs(params->expected));
+	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -1061,6 +1203,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
 	{}
 };
 
-- 
2.41.0

