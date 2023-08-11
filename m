Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D27796F4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 20:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1018110E6D7;
	Fri, 11 Aug 2023 18:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB43610E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 18:18:22 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RMsVQ3BpTzDqQy;
 Fri, 11 Aug 2023 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691777902; bh=xn2lQwT3XshoIrHtr5LkfwJKAa88hEPFIqUdAKEYpzk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Pn/cJ4ZiF6IOaE5aw42HcrEo/2PzkNBZVPgldoGzJwb7ofj+liZ/M/MqErxdQ07N0
 gtkeKi/prve7WTJQXWBzj10Xes8TUJI/sQN8t6ZnOQ0c1gkJFcR55d+e+DPuZPoaxM
 PWjvCn8ypHT75mTGHRVOHYyqHU1jejVOMze6AJQ0=
X-Riseup-User-ID: 2E3535B5A48082C1C3BB2D8308E65C0AFF48804EDA714FCD8041CC2970C93DAB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RMsVN0J2XzFpZR;
 Fri, 11 Aug 2023 18:18:19 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 11 Aug 2023 15:17:39 -0300
Subject: [PATCH v2 1/6] drm/tests: Test default pitch fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-gsoc-drm-format-test-v2-v2-1-763b17890644@riseup.net>
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

Test the default pitch fallback when NULL is passed as the dst_pitch on
the conversion procedures.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 126 ++++++++++++++++---------
 1 file changed, 81 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 474bb7a1c4ee..938d4fdb4291 100644
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
@@ -530,7 +532,11 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip);
+
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -560,7 +566,10 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgb332(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -590,12 +599,15 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip, false);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
+		drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
 }
@@ -626,7 +638,10 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -657,7 +672,10 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -688,7 +706,10 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -723,7 +744,10 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	 * RGB888 expected results are already in little-endian
 	 * order, so there's no need to convert the test output.
 	 */
-	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -753,7 +777,10 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -784,7 +811,10 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -815,7 +845,10 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -846,7 +879,10 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_xrgb8888_to_mono(&dst, dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 

-- 
2.41.0

