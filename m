Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24570595839
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9404B11ADD6;
	Tue, 16 Aug 2022 10:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4268ECA3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:29:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id h1so5013246wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/7pcMlkWYdqvd9nF4xjztw1PEhSKdH6W+Iikd1ByWuw=;
 b=fjgXliTQmp5AXMdjyj5BNorQm9b2QUgkuF9SUN7Rt5bCG3Yq9Kr1x94ZifYm+8nVx0
 inz8PqyRLDZjqb5gY81bWFL0yvLSIjXMVAKdCo8E5qpHS2UAhTiT/w55V1fR2cD5Pd2B
 1Rx+cRG/T9KhAKwyGRinIsjzPbukSldQFl1GGVizLBrfm1XMPI72YWtoNtMgkYEmKW05
 TXbTLePLT8qZVgAgEuCwywy9mlzdoK4LGNXQ3/iGFhUMp7OpcHa3REKtRBee4KGA151v
 8ho4BL9+LhpURGEzBp4FXtfYChdegmjZyBxMB5w8yIaqOYOy9rxlBIE1yRCag9ZeJB1e
 IxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/7pcMlkWYdqvd9nF4xjztw1PEhSKdH6W+Iikd1ByWuw=;
 b=zft2D0yfvSt8ldbUVAlpowzRnXSLQhG4F2vgrSd40nzSzCxW4u57YpMoOBEGyK9p+F
 aPgm/3XqrNeAZsAyczr2376C+Z23E0mzbOFqoyFBwM47n3MkB1asmtwnNa5qI42u/vz/
 2bRAji1pBSncEW1mGdGBb/aKvoY3uZijekcM+av5ElSjeD7T2ZTbxMa1wqQIvpT3WGdZ
 jfr5JivyllBmEFoUl+0XU7VaO8Qc8VAvUAh8pWIZTHehrSVpV45Q6ycYOGBZ5rVs3a9w
 noodne378Hfsz7qnTQcvuqelumHQ63IIfsTYUPLIo8mbp3ZL65AdY8QHVPJSuNlEjFwz
 27PA==
X-Gm-Message-State: ACgBeo2XWGfuvkc/Fo/gEDdrY1/ITP0i/7HIARBBKDwGsNMYN9wh8OSH
 NfL90bXH7+CDDfrhvMJX2Wc=
X-Google-Smtp-Source: AA6agR4bNICp6baTecdnoJqeEJgR+Z8OLujzSNuslJ6EgUSTKVKO7aJi7ympl6exGaWyuJ1XuiVDSg==
X-Received: by 2002:a05:600c:1f08:b0:3a5:e8d6:ddd2 with SMTP id
 bd8-20020a05600c1f0800b003a5e8d6ddd2mr7393277wmb.57.1660645753401; 
 Tue, 16 Aug 2022 03:29:13 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adffe49000000b002251639bfd0sm1668407wrs.59.2022.08.16.03.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:29:13 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 1/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb888()
Date: Tue, 16 Aug 2022 12:29:01 +0200
Message-Id: <20220816102903.276879-2-jose.exposito89@gmail.com>
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
RGB888.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 828487071796..08d08e7ab19a 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -27,6 +27,11 @@ struct convert_to_rgb565_result {
 	const u16 expected_swab[TEST_BUF_SIZE];
 };
 
+struct convert_to_rgb888_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -34,6 +39,7 @@ struct convert_xrgb8888_case {
 	const u32 xrgb8888[TEST_BUF_SIZE];
 	struct convert_to_rgb332_result rgb332_result;
 	struct convert_to_rgb565_result rgb565_result;
+	struct convert_to_rgb888_result rgb888_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -51,6 +57,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.expected = { 0xF800 },
 			.expected_swab = { 0x00F8 },
 		},
+		.rgb888_result = {
+			.dst_pitch = 0,
+			.expected = { 0x00, 0x00, 0xFF },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -69,6 +79,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.expected = { 0xF800 },
 			.expected_swab = { 0x00F8 },
 		},
+		.rgb888_result = {
+			.dst_pitch = 0,
+			.expected = { 0x00, 0x00, 0xFF },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -109,6 +123,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xE0FF, 0xFF07,
 			},
 		},
+		.rgb888_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
+				0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00,
+				0xFF, 0x00, 0x00, 0xFF, 0x00, 0xFF,
+				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -141,6 +164,17 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
 			},
 		},
+		.rgb888_result = {
+			.dst_pitch = 15,
+			.expected = {
+				0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11, 0x03, 0x03, 0xA8,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				0x03, 0x03, 0xA8, 0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			},
+		},
 	},
 };
 
@@ -255,9 +289,40 @@ static void xrgb8888_to_rgb565_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
 }
 
+static void xrgb8888_to_rgb888_test(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_rgb888_result *result = &params->rgb888_result;
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
+	dst_size = conversion_buf_size(DRM_FORMAT_RGB888, result->dst_pitch,
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
+	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

