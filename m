Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B1790129
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9110E06D;
	Fri,  1 Sep 2023 17:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F5210E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:08:41 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RckyJ5ncwz9s1s;
 Fri,  1 Sep 2023 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693588120; bh=n1qJ+iYdJyS0Z6qWqVsHA+zklZ+YlLX4fqsPhZjpzxw=;
 h=From:Date:Subject:To:Cc:From;
 b=Helk9iKydqyGWdVHU9wiMvj+BIM4vxD9JAIHwKdIDK71YwHnxxRo0dzYI9GmC6Rnr
 dgLs0HQz9ymVFd6iMj3IMqJaXJGQ3bHzbXu1l7HxScOgbQQ4uuxBT/s6+EKoWeDPlc
 B7AAtFPEOtEpZdUCG2wm2DZy+bq3kjnUsKp1irfM=
X-Riseup-User-ID: D3E0F26EFF1C9044158334DE277C8CB8DC1F132AF7E0607139ADF814596ADA88
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RckyF3JhyzFpdX;
 Fri,  1 Sep 2023 17:08:37 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 01 Sep 2023 14:08:29 -0300
Subject: [PATCH] drm/tests: Add KUnit tests for drm_fb_blit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230901-final-gsoc-v1-1-e310c7685982@riseup.net>
X-B4-Tracking: v=1; b=H4sIAIwa8mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSwND3bTMvMQc3fTi/GRdY0vTRAsTExPjZIs0JaCGgqLUtMwKsGHRsbW
 1ADXGtchcAAAA
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

Insert parameterized test for the drm_fb_blit() to ensure correctness
and prevent future regressions.

The test is done by adding a call to drm_fb_blit() on every format
that has support. Also, to fully test the function, add new format
conversion tests.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 284 +++++++++++++++++++++++++
 1 file changed, 284 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 79bc9d4bbd71..889287245b1e 100644
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
 
@@ -643,6 +705,18 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
+
+	buf = dst.vaddr;
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
@@ -677,6 +751,18 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
@@ -711,6 +797,18 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
@@ -745,6 +843,18 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
@@ -782,6 +892,16 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 
 	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
@@ -816,6 +936,18 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip);
+
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
@@ -850,6 +982,17 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
+				  &params->clip);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
@@ -884,6 +1027,19 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src, &fb,
+				  &params->clip);
+
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
@@ -951,6 +1107,119 @@ static void drm_test_fb_swab(struct kunit *test)
 	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	int blit_result;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
+				  &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr;
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr;
+	memset(buf, 0, TEST_BUF_SIZE);
+
+	struct drm_format_info mock_format = *fb.format;
+
+	mock_format.format |= DRM_FORMAT_BIG_ENDIAN;
+	fb.format = &mock_format;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
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
 }
 
 struct clip_offset_case {
@@ -1543,6 +1812,19 @@ static void drm_test_fb_memcpy(struct kunit *test)
 		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
 				       "Failed expectation on plane %zu", i);
 	}
+
+	memset(*buf, 0, TEST_BUF_SIZE * DRM_FORMAT_MAX_PLANES);
+
+	int blit_result;
+
+	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	for (size_t i = 0; i < fb.format->num_planes; i++) {
+		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
+		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
+				       "Failed expectation on plane %zu", i);
+	}
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
@@ -1558,6 +1840,8 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),

---
base-commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6
change-id: 20230901-final-gsoc-395a84443c8f

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

