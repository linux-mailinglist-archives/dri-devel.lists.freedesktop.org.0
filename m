Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0195A3EA0
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 18:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A73110EDFD;
	Sun, 28 Aug 2022 16:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7C310E187
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 16:45:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bu22so7162997wrb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vJhh/lTctUSQJ2j9ZuvCFA+0ks2hV9Sn9L7SV18NIxM=;
 b=gfPdja9H01Nsbt78g1QvgP7UzzDh1NJ8LR4shpPhYcuXAW8sQcqev4YENRnS7EBVQV
 qN3vfQT9D8vFRp73NoGa+ZPMkO7a1O/VIG1dyT8/f4V+y6PgbRRaCt45OlX6XTU8zslB
 AjJwABgxu0QIr2LMu6Ap87UrF7u8aUf/nrl3G3zr/yrC+e+cOE9V9mYvbJxDvzZSHZ2f
 uImN86d62hS7Oevq4jfxeSqZsTEWrqNzbqyK46q5VyEyT3UXCOPnq3YLIKAZyzsqjZca
 5LRn/s8pmOb9lQ7hyq/CS+wSEhSbci7mN5jOa69D9LiJf8pJqpDxUntAqPakMDe4LCAr
 qGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vJhh/lTctUSQJ2j9ZuvCFA+0ks2hV9Sn9L7SV18NIxM=;
 b=IyRM7zHs118rMTvANjoasH5MDesrO7KDjnc9HPZP9QJhzt+AJ3u9ioklzJxxo5tZBu
 yUh2JSPQ9+FY+vl3o2otAz8EPwQwbbkqPVyBgi9CPrmYyr59ouyxleLkz+aaILQG3C0P
 kYn8EZnUnqEgshnJ0a96Rac9z+4RT0gTIr/hXxGkpJCeJBUiqrvB2+y/yT3ZGCqdQOZ/
 miwGWJ6yDltSi4L6kJkwB9z2DiASRrygGwFva/C0Y3edbqTahWsEMDX2TFmFj02001ND
 mB759XVDdh8FHduyCYFd//fbmAOfhkrApn+haoxIdcjFQlF8jOZgVFSwuHMj9Irlb1+l
 FAJA==
X-Gm-Message-State: ACgBeo2w9RIA9kT3M/0SpPAlY/+JCRSdItEJK+3BlDKtQ6BtgNKaNez8
 qHl3faXxA+HPA1mgiui0gZQ=
X-Google-Smtp-Source: AA6agR7xVlLAVUPoNOFYZfbfV0dfk38RLDO+1uN29xU/u2TnyUYcM1sM7o2jLcVqNTro6XhluVmOdg==
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr4859815wrs.358.1661705131425; 
 Sun, 28 Aug 2022 09:45:31 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adfef0e000000b0021d6924b777sm399926wro.115.2022.08.28.09.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 09:45:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 1/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb888()
Date: Sun, 28 Aug 2022 18:45:15 +0200
Message-Id: <20220828164517.185092-2-jose.exposito89@gmail.com>
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
RGB888.

Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: David Gow <davidgow@google.com>
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

