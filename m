Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7080F581C4A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 01:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CB6B216C;
	Tue, 26 Jul 2022 23:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292DFB217D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 23:09:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 x23-20020a05600c179700b003a30e3e7989so162288wmo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oIjUYYBOwxHZn2ecu0MuwO5iaRLwywmUHAZ/RS0frQw=;
 b=PqZn57nRt/sCz7jZKRta1WifqaGU2h37re/DwH9LCZBTRxoNWTI++D2Dp3kj2ysqiM
 LYtTKrDQhzwYN1/YjfK2/wDy472NHnQFPN4TdMrOwoLRD9rYniY/s/nKHEDtz38mM4bi
 bkNe0Cj6GFp6EBAju3sxhRXizbUq/k4czy2U/eoD1H5u9KQKcNdBKnC321c3NqmyqNJJ
 +b4QfLC6LRWCwLHGylL3CkmbwcNhyn+KuaQjHo0ehtaOSjylgDG0zy/mzukLmHhJMiHx
 +odLlZdoIVxtWnM4Kd/IOJbH7oJAGd1jge5fBcnhy3pyFOqXjKAcoxWxkFQ0Oe8C89eS
 3xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oIjUYYBOwxHZn2ecu0MuwO5iaRLwywmUHAZ/RS0frQw=;
 b=TYXl6+rbMNDw5Z3ulFJzg7lYWG80mlPDPC212XwRXdAgAgg4ylaYWNCvT1HkXYsNHa
 4JjiM74eTipPEVxpfwwwJ6Cm+UQenYJRQJw/n1RiYH5lOz4xY8P7I1DjkxbUMTChI8SA
 MvwLaKJKaHnEygKIq2sAJwpRUCwCKnKukvxl+xtxGKaiTU3VzC0GSOUamcg+6lhenE11
 lUcA7v/3IoubCIbv+gksSKee2IcdIsB0LY7uieJVMm8r190HJBgQ6imnUBoe1H5EdVc3
 AaD8/oSboK/qZICWuGLVwvif4li5JqZtfLE/s7Ia1X1X7f4mntn0ZItwukuFoslHPcQo
 rEGQ==
X-Gm-Message-State: AJIora9hGuCW/nSnUr7YB+IFNKo8sl6rDv/YxjLbA+pTUEEPfVLR8FHi
 kyDploHdQ79kgw87LuP9fYOnFZp53KefTA==
X-Google-Smtp-Source: AGRyM1tFLDABFVLuRLqINt1PGPt0nzQwUF/dvYsheoH0cu1MNlLHcJRKMS2POHcSl1iiA+F0/AolnA==
X-Received: by 2002:a05:600c:2056:b0:3a3:2cf8:ec9 with SMTP id
 p22-20020a05600c205600b003a32cf80ec9mr870387wmg.51.1658876979381; 
 Tue, 26 Jul 2022 16:09:39 -0700 (PDT)
Received: from localhost.localdomain ([94.73.33.57])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0021e86504736sm7278533wrb.16.2022.07.26.16.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 16:09:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
Date: Wed, 27 Jul 2022 01:09:16 +0200
Message-Id: <20220726230916.390575-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726230916.390575-1-jose.exposito89@gmail.com>
References: <20220726230916.390575-1-jose.exposito89@gmail.com>
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
RGB565.

The documentation and the color picker available on [1] are useful
resources to understand this patch and validate the values returned by
the conversion function.

Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Link: http://www.barth-dev.de/online/rgb565-color-picker/ # [1]
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index bbe9e9f57e2b..26ecf3b4b137 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -21,12 +21,19 @@ struct convert_to_rgb332_result {
 	const u8 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_rgb565_result {
+	unsigned int dst_pitch;
+	const u16 expected[TEST_BUF_SIZE];
+	const u16 expected_swab[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
 	struct drm_rect clip;
 	const u32 xrgb8888[TEST_BUF_SIZE];
 	struct convert_to_rgb332_result rgb332_result;
+	struct convert_to_rgb565_result rgb565_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -39,6 +46,11 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0xE0 },
 		},
+		.rgb565_result = {
+			.dst_pitch = 0,
+			.expected = { 0xF800 },
+			.expected_swab = { 0x00F8 },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -52,6 +64,11 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0xE0 },
 		},
+		.rgb565_result = {
+			.dst_pitch = 0,
+			.expected = { 0xF800 },
+			.expected_swab = { 0x00F8 },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -77,6 +94,21 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xFC, 0x1F,
 			},
 		},
+		.rgb565_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFFFF, 0x0000,
+				0xF800, 0x07E0,
+				0x001F, 0xF81F,
+				0xFFE0, 0x07FF,
+			},
+			.expected_swab = {
+				0xFFFF, 0x0000,
+				0x00F8, 0xE007,
+				0x1F00, 0x1FF8,
+				0xE0FF, 0xFF07,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -96,6 +128,19 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xA0, 0x6D, 0x0A, 0x00, 0x00,
 			},
 		},
+		.rgb565_result = {
+			.dst_pitch = 10,
+			.expected = {
+				0x0A33, 0x1260, 0xA800, 0x0000, 0x0000,
+				0x6B8E, 0x0A33, 0x1260, 0x0000, 0x0000,
+				0xA800, 0x6B8E, 0x0A33, 0x0000, 0x0000,
+			},
+			.expected_swab = {
+				0x330A, 0x6012, 0x00A8, 0x0000, 0x0000,
+				0x8E6B, 0x330A, 0x6012, 0x0000, 0x0000,
+				0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
+			},
+		},
 	},
 };
 
@@ -175,8 +220,41 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0);
 }
 
+static void xrgb8888_to_rgb565_test(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_rgb565_result *result = &params->rgb565_result;
+	size_t dst_size;
+	__u16 *dst = NULL;
+	__u32 *src = NULL;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_RGB565, result->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
+
+	src = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, src);
+
+	drm_fb_xrgb8888_to_rgb565(dst, result->dst_pitch, src, &fb,
+				  &params->clip, false);
+	KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0);
+
+	drm_fb_xrgb8888_to_rgb565(dst, result->dst_pitch, src, &fb,
+				  &params->clip, true);
+	KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected_swab, dst_size), 0);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

