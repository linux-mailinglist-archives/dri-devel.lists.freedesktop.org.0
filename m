Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0775D13C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B534810E6E7;
	Fri, 21 Jul 2023 18:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D69C10E6E7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:23:47 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4R6ycL5B5PzDrRD;
 Fri, 21 Jul 2023 18:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1689963826; bh=hznAlxvmoCeys7xS2gR+2SApESTNqaTVVlM4joqwNj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bQ02X2kbXjG9QHSqalCURWz6/rq9c0uiTUayQWkHpC8eo7gxGZNFkFWOLn02gUXEc
 EGPN3G2K0KsW83TSHpkYB7K8+xx6+UqEHrC+LmfOt+eYgLClYqzGELBcD6iaEYy43m
 fAve/nfecR2678nHdUdxEtNc5p2XPhmilyIcrIYM=
X-Riseup-User-ID: DB210E2CA508755592EF76F089A2A554737C4BC56A25FA8FFEFDE19B7E0648A0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4R6ycG5SrwzFpqX;
 Fri, 21 Jul 2023 18:23:42 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/format-helper: Test default pitch fallback
Date: Fri, 21 Jul 2023 15:23:11 -0300
Message-ID: <20230721182316.560649-2-arthurgrillo@riseup.net>
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

Test the default pitch fallback when NULL is passed as the dst_pitch on
the conversion procedures.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 132 ++++++++++++------
 1 file changed, 87 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 474bb7a1c4ee..bc6894f0a202 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -16,6 +16,8 @@
 
 #define TEST_BUF_SIZE 50
 
+#define TEST_USE_DEFAULT_PITCH 0
+
 struct convert_to_gray8_result {
 	unsigned int dst_pitch;
 	const u8 expected[TEST_BUF_SIZE];
@@ -97,48 +99,48 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.clip = DRM_RECT_INIT(0, 0, 1, 1),
 		.xrgb8888 = { 0x01FF0000 },
 		.gray8_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x4C },
 		},
 		.rgb332_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xE0 },
 		},
 		.rgb565_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xF800 },
 			.expected_swab = { 0x00F8 },
 		},
 		.xrgb1555_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x7C00 },
 		},
 		.argb1555_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xFC00 },
 		},
 		.rgba5551_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xF801 },
 		},
 		.rgb888_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x00, 0x00, 0xFF },
 		},
 		.argb8888_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xFFFF0000 },
 		},
 		.xrgb2101010_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x3FF00000 },
 		},
 		.argb2101010_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xFFF00000 },
 		},
 		.mono_result = {
-			.dst_pitch = 0,
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
 			.expected = { 0b0 },
 		},
 	},
@@ -151,48 +153,48 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0x00000000, 0x10FF0000,
 		},
 		.gray8_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x4C },
 		},
 		.rgb332_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xE0 },
 		},
 		.rgb565_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xF800 },
 			.expected_swab = { 0x00F8 },
 		},
 		.xrgb1555_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x7C00 },
 		},
 		.argb1555_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xFC00 },
 		},
 		.rgba5551_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xF801 },
 		},
 		.rgb888_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x00, 0x00, 0xFF },
 		},
 		.argb8888_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xFFFF0000 },
 		},
 		.xrgb2101010_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0x3FF00000 },
 		},
 		.argb2101010_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0xFFF00000 },
 		},
 		.mono_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0b0 },
 		},
 	},
@@ -212,7 +214,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
 		},
 		.gray8_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFF, 0x00,
 				0x4C, 0x99,
@@ -221,7 +223,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.rgb332_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFF, 0x00,
 				0xE0, 0x1C,
@@ -230,7 +232,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.rgb565_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFFFF, 0x0000,
 				0xF800, 0x07E0,
@@ -245,7 +247,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.xrgb1555_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0x7FFF, 0x0000,
 				0x7C00, 0x03E0,
@@ -254,7 +256,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.argb1555_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFFFF, 0x8000,
 				0xFC00, 0x83E0,
@@ -263,7 +265,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.rgba5551_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFFFF, 0x0001,
 				0xF801, 0x07C1,
@@ -272,7 +274,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.rgb888_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
 				0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00,
@@ -281,7 +283,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.argb8888_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFFFFFFFF, 0xFF000000,
 				0xFFFF0000, 0xFF00FF00,
@@ -290,7 +292,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.xrgb2101010_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0x3FFFFFFF, 0x00000000,
 				0x3FF00000, 0x000FFC00,
@@ -299,7 +301,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.argb2101010_result = {
-			.dst_pitch = 0,
+			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFFFFFFFF, 0xC0000000,
 				0xFFF00000, 0xC00FFC00,
@@ -308,7 +310,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			},
 		},
 		.mono_result = {
-			.dst_pitch = 0,
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0b01,
 				0b10,
@@ -530,7 +532,10 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_gray8(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -560,7 +565,10 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgb332(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_rgb332(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_rgb332(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -590,12 +598,19 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_rgb565(&dst, NULL, &src, &fb, &params->clip, false);
+	else
+		drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip,
+					  false);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_rgb565(&dst, NULL, &src, &fb, &params->clip, true);
+	else
+		drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
 }
@@ -626,7 +641,10 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_xrgb1555(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -657,7 +675,10 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_argb1555(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -688,7 +709,10 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -723,7 +747,11 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	 * RGB888 expected results are already in little-endian
 	 * order, so there's no need to convert the test output.
 	 */
-	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_rgb888(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -753,7 +781,11 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_argb8888(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -784,7 +816,10 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_xrgb2101010(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -815,7 +850,11 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_argb2101010(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -846,7 +885,10 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
+		drm_fb_xrgb8888_to_mono(&dst, NULL, &src, &fb, &params->clip);
+	else
+		drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
-- 
2.41.0

