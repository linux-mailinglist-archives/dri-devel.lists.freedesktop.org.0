Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E355BB04
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF50C10E98C;
	Mon, 27 Jun 2022 16:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0229C10E675
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:13:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b26so1381770wrc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sR0i/5wHgKGgcKAj1oFVaLag4FmoRFAS+vJEGm7kxWA=;
 b=o6JsORBuaxyA4y5Zgg0xWYAqgpc61ahcGe6qZ4qO/tS2TZ/LyerjvdUL0voByDPUWR
 91DyDM/t9B+gjqXYtgWEjKJJwVKKz4Ql/Ap8CkBhu4CMHZ9iiJAztrFu1oFaMxwCeIPc
 hruIoRfw/9gZUtBfIi9hdltipebePdmqulNWSlAkX5Wnb84LqYC30IlCi/50LXqqcg5e
 Gfl4yg3DKAsxxUK8hFKKxD/MEefpOVUNznyjXIEvZG4wtZ7w0SpwGyxPOb+tD+iBE/Cl
 eSffdkdlWgbcykSQbjvHbd4O0d1qRAuTgY/H1rA2+mgBF5urCKxenIVmyE+tEk4UiAKO
 V3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sR0i/5wHgKGgcKAj1oFVaLag4FmoRFAS+vJEGm7kxWA=;
 b=WKwrk9VfNIgVQZzuTkNisHIlLxZNJ6Tzo4FBbunhHcGMhIitfUrxYW7aCsXAZE5Jhl
 ZfHIVuU1Qd64vEO02T+1O1ZfciHKFrjB5aJy7auK8OxsudIPBTfuU8vjn1vxpWm+X/A6
 +iGEuChKZwIf+H/Xe1FaOFeVcutfuDTI2m8m6JkpQBsUV6dM/V24BrIGklrpFx8mldGp
 j9qpY98w/uaVj7mPd1LP0htOFOkDDcqamAD+wSzaQiuMSW9/S+h0oymZMGfZGVtX6U8r
 E0lqdFbHI8tveWyTn2gst0iYPxei8w8AgjnQCqOoQFuj6XyYyZf535FEuOCOXZfBT17d
 ARXg==
X-Gm-Message-State: AJIora9c3vPl1Kbrlo5HV3rSNIysrGFAoWk+rj/mjHk7+GgKHMphWc5U
 5TEo6re+Xj3LS3YJ/yofGIw=
X-Google-Smtp-Source: AGRyM1uXaUsdLwSruwTs8r/EWwloxLYVhaZMlSUZe9HsNODTVAnTJoypluHPz528fg7eu9C8QP9Ofg==
X-Received: by 2002:a5d:5984:0:b0:21b:a858:3678 with SMTP id
 n4-20020a5d5984000000b0021ba8583678mr13241777wri.293.1656346387544; 
 Mon, 27 Jun 2022 09:13:07 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm10883600wrs.31.2022.06.27.09.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:13:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 2/4] drm/format-helper: Transform tests to be agnostic of
 target format
Date: Mon, 27 Jun 2022 18:11:30 +0200
Message-Id: <20220627161132.33256-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support multiple destination format conversions, store the
target format, conversion function, parameters and expected result in
its own structure.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 88 ++++++++++++++-----
 1 file changed, 64 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index de8cf525109e..732d945e7f4e 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -16,34 +16,55 @@
 
 #define TEST_BUF_SIZE 50
 
+struct convert_xrgb8888_result {
+	u32 dst_format;
+	void (*conv_func)(void *dst, unsigned int dst_pitch,
+			  const void *src,
+			  const struct drm_framebuffer *fb,
+			  const struct drm_rect *clip);
+	unsigned int dst_pitch;
+	const u8 expected[4 * TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
-	unsigned int dst_pitch;
 	struct drm_rect clip;
 	const u32 xrgb8888[TEST_BUF_SIZE];
-	const u8 expected[4 * TEST_BUF_SIZE];
+	struct convert_xrgb8888_result results[1];
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 	{
 		.name = "single_pixel_source_buffer",
 		.pitch = 1 * 4,
-		.dst_pitch = 0,
 		.clip = DRM_RECT_INIT(0, 0, 1, 1),
 		.xrgb8888 = { 0x01FF0000 },
-		.expected = { 0xE0 },
+		.results = {
+			{
+				.dst_format = DRM_FORMAT_RGB332,
+				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.dst_pitch = 0,
+				.expected = { 0xE0 },
+			},
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
 		.pitch = 2 * 4,
-		.dst_pitch = 0,
 		.clip = DRM_RECT_INIT(1, 1, 1, 1),
 		.xrgb8888 = {
 			0x00000000, 0x00000000,
 			0x00000000, 0x10FF0000,
 		},
-		.expected = { 0xE0 },
+		.results = {
+			{
+				.dst_format = DRM_FORMAT_RGB332,
+				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.dst_pitch = 0,
+				.expected = { 0xE0 },
+			},
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -52,7 +73,6 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		 */
 		.name = "well_known_colors",
 		.pitch = 4 * 4,
-		.dst_pitch = 0,
 		.clip = DRM_RECT_INIT(1, 1, 2, 4),
 		.xrgb8888 = {
 			0x00000000, 0x00000000, 0x00000000, 0x00000000,
@@ -61,28 +81,41 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
 			0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
 		},
-		.expected = {
-			0xFF, 0x00,
-			0xE0, 0x1C,
-			0x03, 0xE3,
-			0xFC, 0x1F,
+		.results = {
+			{
+				.dst_format = DRM_FORMAT_RGB332,
+				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.dst_pitch = 0,
+				.expected = {
+					0xFF, 0x00,
+					0xE0, 0x1C,
+					0x03, 0xE3,
+					0xFC, 0x1F,
+				},
+			},
 		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
 		.name = "destination_pitch",
 		.pitch = 3 * 4,
-		.dst_pitch = 5,
 		.clip = DRM_RECT_INIT(0, 0, 3, 3),
 		.xrgb8888 = {
 			0xA10E449C, 0xB1114D05, 0xC1A80303,
 			0xD16C7073, 0xA20E449C, 0xB2114D05,
 			0xC2A80303, 0xD26C7073, 0xA30E449C,
 		},
-		.expected = {
-			0x0A, 0x08, 0xA0, 0x00, 0x00,
-			0x6D, 0x0A, 0x08, 0x00, 0x00,
-			0xA0, 0x6D, 0x0A, 0x00, 0x00,
+		.results = {
+			{
+				.dst_format = DRM_FORMAT_RGB332,
+				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.dst_pitch = 5,
+				.expected = {
+					0x0A, 0x08, 0xA0, 0x00, 0x00,
+					0x6D, 0x0A, 0x08, 0x00, 0x00,
+					0xA0, 0x6D, 0x0A, 0x00, 0x00,
+				},
+			},
 		},
 	},
 };
@@ -123,24 +156,31 @@ KUNIT_ARRAY_PARAM(convert_xrgb8888, convert_xrgb8888_cases,
 static void convert_xrgb8888_test(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_xrgb8888_result *result;
 	size_t dst_size;
 	__u8 *dst = NULL;
+	int n;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
 		.pitches = { params->pitch, 0, 0 },
 	};
 
-	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, params->dst_pitch,
-				       &params->clip);
-	KUNIT_ASSERT_GT(test, dst_size, 0);
+	for (n = 0; n < ARRAY_SIZE(params->results); n++) {
+		result = &params->results[n];
+
+		dst_size = conversion_buf_size(result->dst_format,
+					       result->dst_pitch,
+					       &params->clip);
+		KUNIT_ASSERT_GT(test, dst_size, 0);
 
-	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
+		dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
 
-	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb8888,
+		result->conv_func(dst, result->dst_pitch, params->xrgb8888,
 				  &fb, &params->clip);
-	KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
+		KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0);
+	}
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
-- 
2.25.1

