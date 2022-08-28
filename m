Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAD5A3EA2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 18:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8179D10E6B7;
	Sun, 28 Aug 2022 16:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18E710E187
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 16:45:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i188-20020a1c3bc5000000b003a7b6ae4eb2so2027918wma.4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rJjTif4+g5XOJTLGqcyodmj0ft42i9kQrxGSEhjuF08=;
 b=Pvj0SKWtb33+3HVhsjkEkZ5GgQ0eNUZe2o+u4wVpGiQCn/j0CFIPO+ys9JKt7gRLZv
 9ipl2H03xu6JEqsWwae1pJtYEP4Ipqb3ViOVP4WXHr2EZOa0iuK3lJWlzLz05yU2G9Vq
 whM1f8LbY9IzA0mbf41d7DI59MDN1fIu7l/P44212hYv3Ph3JgKyTaJGyhGlTLr3osrP
 GDAMF8WCMAuW5lsll5HBXVn63RFgShTj2V2f2a2uYptxCU0ZgnFneacjQ8qb82p9ez9D
 1H3l2zSMmz8pt4gigEipmM6gJYeJkqlbIJroGiKCZLYVS1Rc6X4rqdGw9aKyPfGWL6fa
 20sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rJjTif4+g5XOJTLGqcyodmj0ft42i9kQrxGSEhjuF08=;
 b=W4/WCMKMUBRcdnxOWNupjFLS5Pozb/WNyrG/HBpIpejpFEC9LbrRlXWQ+8h/yDVkjQ
 5P5EGvmRqGoWTCgVeH3yAjJN6ZLka/RoWsZl12qgLxrg9qLMDmVVfTOQLWqZCqovKJGW
 ewv/D3GzLjhNvlDDvuTZiP77ZZlsaPTNeQuu8mjFtukwNzZJuG302ImBD86b3NHs/bcS
 OW9QMeI5rW+3h+fPR6UlB/ytoBBWM9b4RBqbGKUVm53+6NrlS/suAiHB3L40GEipoLl8
 iVprJ161Fy/hqheGDazor3eJlptKER0IQG2iwvsnWLo7oP1N3zZ+8dJZZETYnC+rkeHR
 CgOw==
X-Gm-Message-State: ACgBeo3CDbAJS+PlRgO47sJZ+FdFBmUr7bLssaRQJ9sxPuf/DA0IKk8Y
 JhyUzNwufTqw4gP4SfYsrWk=
X-Google-Smtp-Source: AA6agR61Qf1qoXk3S6nbbo9zG7j/gKVHvd8fiDrV83u8UUr3CghkpN7OQdWH5rinK8Y3DItW1BVRnw==
X-Received: by 2002:a05:600c:4e0f:b0:3a5:e065:9b50 with SMTP id
 b15-20020a05600c4e0f00b003a5e0659b50mr4846594wmq.35.1661705132495; 
 Sun, 28 Aug 2022 09:45:32 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adfef0e000000b0021d6924b777sm399926wro.115.2022.08.28.09.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 09:45:32 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_xrgb2101010()
Date: Sun, 28 Aug 2022 18:45:16 +0200
Message-Id: <20220828164517.185092-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220828164517.185092-1-jose.exposito89@gmail.com>
References: <20220828164517.185092-1-jose.exposito89@gmail.com>
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
 dlatypov@google.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test cases to test the conversion from XRGB8888 to
XRGB2101010.

In order to be able to call drm_fb_xrgb8888_to_xrgb2101010() when
compiling CONFIG_DRM_KMS_HELPER as a module export the symbol.

Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c           |  1 +
 .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 56642816fdff..b9a9fea0f6f1 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -553,6 +553,7 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
 	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_xrgb8888_to_xrgb2101010_line);
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
 
 static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 08d08e7ab19a..d8536db4de1e 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -32,6 +32,11 @@ struct convert_to_rgb888_result {
 	const u8 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_xrgb2101010_result {
+	unsigned int dst_pitch;
+	const u32 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -40,6 +45,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_rgb332_result rgb332_result;
 	struct convert_to_rgb565_result rgb565_result;
 	struct convert_to_rgb888_result rgb888_result;
+	struct convert_to_xrgb2101010_result xrgb2101010_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -61,6 +67,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x00, 0x00, 0xFF },
 		},
+		.xrgb2101010_result = {
+			.dst_pitch = 0,
+			.expected = { 0x3FF00000 },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -83,6 +93,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x00, 0x00, 0xFF },
 		},
+		.xrgb2101010_result = {
+			.dst_pitch = 0,
+			.expected = { 0x3FF00000 },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -132,6 +146,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
 			},
 		},
+		.xrgb2101010_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0x3FFFFFFF, 0x00000000,
+				0x3FF00000, 0x000FFC00,
+				0x000003FF, 0x3FF003FF,
+				0x3FFFFC00, 0x000FFFFF,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -175,6 +198,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			},
 		},
+		.xrgb2101010_result = {
+			.dst_pitch = 20,
+			.expected = {
+				0x03844672, 0x0444D414, 0x2A20300C, 0x00000000, 0x00000000,
+				0x1B1705CD, 0x03844672, 0x0444D414, 0x00000000, 0x00000000,
+				0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
+			},
+		},
 	},
 };
 
@@ -319,10 +350,42 @@ static void xrgb8888_to_rgb888_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
+static void xrgb8888_to_xrgb2101010_test(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
+	size_t dst_size;
+	__u32 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_XRGB2101010,
+				       result->dst_pitch, &params->clip);
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
+	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(xrgb8888_to_xrgb2101010_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

