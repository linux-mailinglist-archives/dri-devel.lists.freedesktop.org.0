Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1747595838
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B15112058;
	Tue, 16 Aug 2022 10:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E3D8D173
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:29:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k17so5024712wmr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 03:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J8iZCnBWtxZ0luRrE1AM5j//meG3qtyDdNSPKnb1YHs=;
 b=hUkuVh9lEKqrEmzF5ZobH61GwSmNKxGbR7mofpKpO0nrfUJoLYzig7Z7klxVp3W6l5
 b8JLj1/EwCiuPmDaQyouGnTbFPdmTJBNIfidM1NmZAvHi2FBp5MhrEaLms+GDqNTavrn
 umEHH/FCQQQ0ygdgj+V4KyQWboAkPfFgnRGr7jNOujVtwpSZyvzvXRCUnqWMzMIcXgeN
 Q7WvkKOSPOcbdWNEsbJBbS9UGTWjeLmJk42QF7Nd5GmsJRi/8ZDWVumIXnzhlEWAYVHW
 w4S7GTQlBh89aM0Jov5MrcrndqdGBQzeWz2RXh5+/LSV6R82DyB1Th1hQrNv5vAMcSgP
 FbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J8iZCnBWtxZ0luRrE1AM5j//meG3qtyDdNSPKnb1YHs=;
 b=J/btkD5jLhr49Pfk+1jx3aTn5BFgizgg7Ub/thMJ9i62sL8PGN8zMGu5TquuVlcTTK
 Ajpia7/eiThRtw/V63yhDr5xTdNld3eDolY2kAySk31AkQnyu+L4XjvpdYl3r18y/2ir
 aVJ8HbnlgAik4n9dKgsHhI2ygOywp8v/hzEF8IMLGoXgAxycOC54AnmX4J6XOrAO3bba
 Dvnoy8xD6RN/AmcomJAsbUmmCjbGNrbCOHZCtQTV/L3lOQqT/n//fz8MjltHNU09TSdL
 mrAMcJd0ldT/PTZuqXOTC5evGnDBD28DZNuMOOmZQea6vtIhk0sB2gUGX0u719bXCjco
 hMNA==
X-Gm-Message-State: ACgBeo0RymYjYYm3X0f8lxVri+dmAZNmWbVu83M+sXlB0oavdfCZKttG
 ++7FcdnkY3sRIPmZmmkZxLw=
X-Google-Smtp-Source: AA6agR5GZrhy96PxyNn6J8YPvp9VPH4OOXh2X8llRt4ZS2gJe7pGP8FEXNNx6VOywUColdgeHjlAMg==
X-Received: by 2002:a7b:cbd0:0:b0:3a6:9f6:a3e8 with SMTP id
 n16-20020a7bcbd0000000b003a609f6a3e8mr1140857wmi.13.1660645755719; 
 Tue, 16 Aug 2022 03:29:15 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adffe49000000b002251639bfd0sm1668407wrs.59.2022.08.16.03.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:29:15 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Date: Tue, 16 Aug 2022 12:29:03 +0200
Message-Id: <20220816102903.276879-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816102903.276879-1-jose.exposito89@gmail.com>
References: <20220816102903.276879-1-jose.exposito89@gmail.com>
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
 dlatypov@google.com, linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test cases to test the conversion from XRGB8888 to
grayscale.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index d8536db4de1e..2f548aa51a30 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
 	const u32 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_gray8_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -46,6 +51,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_rgb565_result rgb565_result;
 	struct convert_to_rgb888_result rgb888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
+	struct convert_to_gray8_result gray8_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -71,6 +77,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x3FF00000 },
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = { 0x4C },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -97,6 +107,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x3FF00000 },
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = { 0x4C },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -155,6 +169,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x3FFFFC00, 0x000FFFFF,
 			},
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFF, 0x00,
+				0x4C, 0x99,
+				0x19, 0x66,
+				0xE5, 0xB2,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -206,6 +229,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
 			},
 		},
+		.gray8_result = {
+			.dst_pitch = 5,
+			.expected = {
+				0x3C, 0x33, 0x34, 0x00, 0x00,
+				0x6F, 0x3C, 0x33, 0x00, 0x00,
+				0x34, 0x6F, 0x3C, 0x00, 0x00,
+			},
+		},
 	},
 };
 
@@ -381,11 +412,42 @@ static void xrgb8888_to_xrgb2101010_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
+static void xrgb8888_to_gray8_test(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_gray8_result *result = &params->gray8_result;
+	size_t dst_size;
+	__u8 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_R8, result->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_xrgb2101010_test, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(xrgb8888_to_gray8_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

