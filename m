Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31E7796F6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 20:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB35010E6DA;
	Fri, 11 Aug 2023 18:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E1E10E6DA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 18:18:31 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RMsVZ4wWZzDrDX;
 Fri, 11 Aug 2023 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691777911; bh=yF3wu4p6bNeyoy19Zo92NTPlxTcSwguRrIel89ueM8I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jHPYB69+3JSnUaiGbC+RMOSSl1lBrACBaRIuTPiqrOelmirdTfc37qRQx6vLbPfZo
 biUr7H2mgeh+vALBdrfqbQZ7D/yES7hoJ7YownnWR/YlGxV5JA20cNRZF2AEG9AI6A
 JnrXIFCWYfYyY4AO16GCCwwdEQiecMowT+fEFAAw=
X-Riseup-User-ID: FB85DDBA81990DE5C3CE57E0C22B07567AD8393132884B10F80483BC32B19965
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RMsVX1B6czFpZR;
 Fri, 11 Aug 2023 18:18:27 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 11 Aug 2023 15:17:42 -0300
Subject: [PATCH v2 4/6] drm/tests: Add KUnit tests for
 drm_fb_build_fourcc_list()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-gsoc-drm-format-test-v2-v2-4-763b17890644@riseup.net>
References: <20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net>
In-Reply-To: <20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net>
To: dri-devel@lists.freedesktop.org
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert parameterized test for the drm_fb_build_fourcc_list() to ensure
correctness and prevent future regressions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 148 +++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 7f24da0b1e00..2b55d9f025f9 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -3,11 +3,13 @@
 #include <kunit/test.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
@@ -1041,6 +1043,151 @@ static void drm_test_fb_clip_offset(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
 }
 
+struct fb_build_fourcc_list_case {
+	const char *name;
+	u32 native_fourccs[TEST_BUF_SIZE];
+	u32 expected[TEST_BUF_SIZE];
+	size_t fourccs_size;
+};
+
+static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
+	{
+		.name = "no native formats",
+		.native_fourccs = { },
+		.expected = { DRM_FORMAT_XRGB8888 },
+		.fourccs_size = 1,
+	},
+	{
+		.name = "XRGB8888 as native format",
+		.native_fourccs = { DRM_FORMAT_XRGB8888 },
+		.expected = { DRM_FORMAT_XRGB8888 },
+		.fourccs_size = 1,
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
+		.fourccs_size = 3,
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
+		.fourccs_size = 12,
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
+		.fourccs_size = 10,
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
+	KUNIT_EXPECT_EQ(test, nfourccs_out, params->fourccs_size);
+	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -1055,6 +1202,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
 	{}
 };
 

-- 
2.41.0

