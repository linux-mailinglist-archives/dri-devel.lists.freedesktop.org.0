Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2EA7930EB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 23:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2910E53E;
	Tue,  5 Sep 2023 21:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946D10E52B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 21:27:51 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RgJWW3z56z9sq8;
 Tue,  5 Sep 2023 21:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693949271; bh=SfC3acT52vqTQcJCjEZ9BZJRIMIFGBBoyzvQKMIu288=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WAje50ByhEIxKU0ql98qZSwldR4/oWe+pkpmLDxOlGRJMm+JsJlTvIh/dShaK7RAE
 182UWL/g6SnGrKhj0jtBfGQn/HKj2WtUSr/1enWkFI2EWZcOfmsiYhHvRvp99Up+lX
 Kkq7Tw7miNQs2C3GgMcC3hTzW23XWuSu8RmRLFWQ=
X-Riseup-User-ID: FB472200E3F3A7E10ADF48BBEEC92C28C2F7F0C102AD01F3B9A0A5FE1A323228
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RgJWQ2kyqzFryd;
 Tue,  5 Sep 2023 21:27:46 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Tue, 05 Sep 2023 18:27:10 -0300
Subject: [PATCH v2 2/2] drm/tests: Add new format conversion tests to
 better cover drm_fb_blit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230905-final-gsoc-v2-2-b52e8cb068ea@riseup.net>
References: <20230905-final-gsoc-v2-0-b52e8cb068ea@riseup.net>
In-Reply-To: <20230905-final-gsoc-v2-0-b52e8cb068ea@riseup.net>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

To fully cover drm_fb_blit(), add format conversion tests that are only
supported through drm_fb_blit().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 142 +++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index b888f7334510..889287245b1e 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -81,6 +81,16 @@ struct fb_swab_result {
 	const u32 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_xbgr8888_result {
+	unsigned int dst_pitch;
+	const u32 expected[TEST_BUF_SIZE];
+};
+
+struct convert_to_abgr8888_result {
+	unsigned int dst_pitch;
+	const u32 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -98,6 +108,8 @@ struct convert_xrgb8888_case {
 	struct convert_to_argb2101010_result argb2101010_result;
 	struct convert_to_mono_result mono_result;
 	struct fb_swab_result swab_result;
+	struct convert_to_xbgr8888_result xbgr8888_result;
+	struct convert_to_abgr8888_result abgr8888_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -155,6 +167,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x0000FF01 },
 		},
+		.xbgr8888_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = { 0x010000FF },
+		},
+		.abgr8888_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = { 0xFF0000FF },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -213,6 +233,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x0000FF10 },
 		},
+		.xbgr8888_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = { 0x100000FF },
+		},
+		.abgr8888_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = { 0xFF0000FF },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -343,6 +371,24 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00FFFF77, 0xFFFF0088,
 			},
 		},
+		.xbgr8888_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = {
+				0x11FFFFFF, 0x22000000,
+				0x330000FF, 0x4400FF00,
+				0x55FF0000, 0x66FF00FF,
+				0x7700FFFF, 0x88FFFF00,
+			},
+		},
+		.abgr8888_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = {
+				0xFFFFFFFF, 0xFF000000,
+				0xFF0000FF, 0xFF00FF00,
+				0xFFFF0000, 0xFFFF00FF,
+				0xFF00FFFF, 0xFFFFFF00,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -458,6 +504,22 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x0303A8C2, 0x73F06CD2, 0x9C440EA3, 0x00000000, 0x00000000,
 			},
 		},
+		.xbgr8888_result = {
+			.dst_pitch =  20,
+			.expected = {
+				0xA19C440E, 0xB1054D11, 0xC103F3A8, 0x00000000, 0x00000000,
+				0xD173F06C, 0xA29C440E, 0xB2054D11, 0x00000000, 0x00000000,
+				0xC20303A8, 0xD273F06C, 0xA39C440E, 0x00000000, 0x00000000,
+			},
+		},
+		.abgr8888_result = {
+			.dst_pitch =  20,
+			.expected = {
+				0xFF9C440E, 0xFF054D11, 0xFF03F3A8, 0x00000000, 0x00000000,
+				0xFF73F06C, 0xFF9C440E, 0xFF054D11, 0x00000000, 0x00000000,
+				0xFF0303A8, 0xFF73F06C, 0xFF9C440E, 0x00000000, 0x00000000,
+			},
+		},
 	},
 };
 
@@ -1082,6 +1144,84 @@ static void drm_test_fb_swab(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
+static void drm_test_fb_xrgb8888_to_abgr8888(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_abgr8888_result *result = &params->abgr8888_result;
+	size_t dst_size;
+	u32 *buf = NULL;
+	__le32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_XBGR8888, result->dst_pitch, &params->clip, 0);
+
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ABGR8888, &src, &fb, &params->clip);
+
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
+static void drm_test_fb_xrgb8888_to_xbgr8888(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_xbgr8888_result *result = &params->xbgr8888_result;
+	size_t dst_size;
+	u32 *buf = NULL;
+	__le32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_XBGR8888, result->dst_pitch, &params->clip, 0);
+
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XBGR8888, &src, &fb, &params->clip);
+
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
 struct clip_offset_case {
 	const char *name;
 	unsigned int pitch;
@@ -1700,6 +1840,8 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),

-- 
2.41.0

