Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E5356C94A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 13:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6C112EB7;
	Sat,  9 Jul 2022 11:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D55112EB5
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:58:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so580417wmb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOA7JdIx7LclTnxriLkitT5hOMN7G/KZhm/8tzsBWhw=;
 b=YqACFK8JTt8y9rttRvi5GJ/9pkVKnBjIuM3PEgMXzXj8NjcWPbx+MASUjXrxE68nx6
 OQGJyKbwJdK1TzXZVmWBA6EYvjJKh/yi8UlLfKJBNs1UauneT1GAlI30WhHPGgt/gfja
 CWvIN0ETzTGHZdov9mpfPw5GPoK1cwuHdGTO5BHvas/7DN981II+oIOW+8KzTiplEDkX
 sBF1rbvmuJxWTYTD9Z5WIu2MekAQm+2SQuIWVhWmSg5xPVJOJyZcMfrmjiLGHCvPW5BO
 WxpSlgeYlupIv7QdqEPvrxJibgYXfVgVxh4hOe0MpCdpFcxU9drTUtyTW3pDPL7Hh/Hn
 dzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nOA7JdIx7LclTnxriLkitT5hOMN7G/KZhm/8tzsBWhw=;
 b=o8WKc5E3brd1ZKQ3Ayqk7k+jziesXWp+EigYuWCZjrTjyLCgbkjfG0xyHF0ljnljAV
 t2vTIYofeQApu0I7C45c/Hp7oEhCRFmu5K1fuc0UCT+JoSFxQGw9niHJ89dxQrE2GMAV
 fRQpZ4c9FgfOYRJlb73RDQfBLpoFGRqUeSS5yUiQkaN9Ij9x30iaOFUMhNfHgUG396sT
 KgKhKqQohG0IPAsJvtZW8ub49nFfgDIgMLBGq2HIj+UgkXNqA0a+q3ZFn4RIwP8RDk7o
 MpA7VDHAsa4INejBg8vJ+jndifOIQLqJ6HeWbsIO2ulaTrYtbSaVJhIALp8vEUs8A9r1
 /F8A==
X-Gm-Message-State: AJIora+SOLe16fyA8qraYrT4WhWKWHa0/qVTrxZF78bqNLL6OjCjGZKx
 TCNaZWVr6WdLNXdS2qG5xms=
X-Google-Smtp-Source: AGRyM1u/fsdcR6R79U7gfq+Fe7nxoZpoRlPqHJddUTulxbAGQIE9UESOGueJF2jm9IAzYcgj1IfwTA==
X-Received: by 2002:a7b:cb10:0:b0:3a0:312c:fd3c with SMTP id
 u16-20020a7bcb10000000b003a0312cfd3cmr5155014wmj.52.1657367929092; 
 Sat, 09 Jul 2022 04:58:49 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.185])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm1199494wrb.102.2022.07.09.04.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 04:58:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 3/4] drm/format-helper: Support multiple target formats
 results
Date: Sat,  9 Jul 2022 13:58:36 +0200
Message-Id: <20220709115837.560877-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709115837.560877-1-jose.exposito89@gmail.com>
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
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
destination pitch and the expected result in its own structure.

Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 53 ++++++++++++-------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index f66aaa0e52c9..0a490ad4fd32 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -16,34 +16,42 @@
 
 #define TEST_BUF_SIZE 50
 
+struct convert_to_rgb332_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
-	unsigned int dst_pitch;
 	struct drm_rect clip;
 	const u32 xrgb8888[TEST_BUF_SIZE];
-	const u8 expected[4 * TEST_BUF_SIZE];
+	struct convert_to_rgb332_result rgb332_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 	{
 		.name = "single_pixel_source_buffer",
 		.pitch = 1 * 4,
-		.dst_pitch = 0,
 		.clip = DRM_RECT_INIT(0, 0, 1, 1),
 		.xrgb8888 = { 0x01FF0000 },
-		.expected = { 0xE0 },
+		.rgb332_result = {
+			.dst_pitch = 0,
+			.expected = { 0xE0 },
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
+		.rgb332_result = {
+			.dst_pitch = 0,
+			.expected = { 0xE0 },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -52,7 +60,6 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		 */
 		.name = "well_known_colors",
 		.pitch = 4 * 4,
-		.dst_pitch = 0,
 		.clip = DRM_RECT_INIT(1, 1, 2, 4),
 		.xrgb8888 = {
 			0x00000000, 0x00000000, 0x00000000, 0x00000000,
@@ -61,28 +68,33 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
 			0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
 		},
-		.expected = {
-			0xFF, 0x00,
-			0xE0, 0x1C,
-			0x03, 0xE3,
-			0xFC, 0x1F,
+		.rgb332_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFF, 0x00,
+				0xE0, 0x1C,
+				0x03, 0xE3,
+				0xFC, 0x1F,
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
+		.rgb332_result = {
+			.dst_pitch = 5,
+			.expected = {
+				0x0A, 0x08, 0xA0, 0x00, 0x00,
+				0x6D, 0x0A, 0x08, 0x00, 0x00,
+				0xA0, 0x6D, 0x0A, 0x00, 0x00,
+			},
 		},
 	},
 };
@@ -138,6 +150,7 @@ KUNIT_ARRAY_PARAM(convert_xrgb8888, convert_xrgb8888_cases,
 static void xrgb8888_to_rgb332_test(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_rgb332_result *result = &params->rgb332_result;
 	size_t dst_size;
 	__u8 *dst = NULL;
 	__u32 *src = NULL;
@@ -147,7 +160,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 		.pitches = { params->pitch, 0, 0 },
 	};
 
-	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, params->dst_pitch,
+	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, result->dst_pitch,
 				       &params->clip);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
@@ -157,9 +170,9 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 	src = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, src);
 
-	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, src, &fb,
+	drm_fb_xrgb8888_to_rgb332(dst, result->dst_pitch, src, &fb,
 				  &params->clip);
-	KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
+	KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0);
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
-- 
2.25.1

