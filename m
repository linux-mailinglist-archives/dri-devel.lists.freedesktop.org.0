Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A45BC36E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1A610E545;
	Mon, 19 Sep 2022 07:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050410E544
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 07:15:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z6so13541131wrq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 00:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Y+/9Eo/+FGAJXwWdsnxjUOBvrjDggVecVUqEpljQ8Wk=;
 b=ViUfs/eBqECjm7D7VWc7N4a82hDDl4MzRy5bhTYFej2oWh9Y+dzSw5MOyCoWiuZQpM
 Ji+iy79Z9ZFmZ3Xtxfmb4VEeN8rnjIBZTaqi0dqoVZJvNChhdlw/qBX6MH7FcdLSknRC
 /iyc2Xw5lFLahewd1ROXvKYQswYWjecUX6gTSSP2iJZHNBhbnf/p38HU4IqqH7ptsh1O
 NWADMLOd2TvjlHburh5KMwoNZpbe+jMrOM/q/mDlbjDadkpgSVJtkAd5+8JABPZTSQRM
 dPEusn487wgbVEMqXuTNN9njMcOqRpPWyp+40+cFAfUFU9Vo402J9PGBFRIsGQHsg38P
 860A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Y+/9Eo/+FGAJXwWdsnxjUOBvrjDggVecVUqEpljQ8Wk=;
 b=g4225S04SeRaOu1lafKKr84rnyHBAqylybQL7ClWCB0nzeufmNqAkbaWke5VaT02KJ
 vGH/IgLrOOt6iMWyFUpAVLQDkVgcPyfg3MYi8ICLXnLX6qpjVvdqQA4VQKjMY6AYWD9M
 4BRgiNBa/qmXPvtlfg0QrTvuz7vvjt9BZy/Ax6DGjZe1XWeSaeWllQLLMkgLZFG5UpPG
 OctcgL73L+zyPs9da3DM23NZAAwera9eAXtjydfh3YzW8Wq9yCs4uhPxLX8KGxPPuiq+
 f0USP3vIC2IawymgJ4VMTViPQ7AleTlRWDB9isw0LwgFRTlBZ0YpmingLtN/wH7FTLLr
 PKeQ==
X-Gm-Message-State: ACrzQf04s3b22YlHX4tYbKnob8h07b9r/FfNo8Bm5I6K71tqWVY5wlKY
 hrVwCyT191aWFFlT8XuraqM=
X-Google-Smtp-Source: AMsMyM5nvUP3P5v4Z2/2BG3H3e4ejGni9OAuNRCLJSe/+rsrn4BbPRCmQYGaplUpbRi7Epj+nWtYtw==
X-Received: by 2002:a5d:6852:0:b0:228:c94b:a5b0 with SMTP id
 o18-20020a5d6852000000b00228c94ba5b0mr9382436wrw.540.1663571743768; 
 Mon, 19 Sep 2022 00:15:43 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b0022ac12fff29sm12864564wrt.65.2022.09.19.00.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 00:15:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v4 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_xrgb2101010()
Date: Mon, 19 Sep 2022 09:15:30 +0200
Message-Id: <20220919071531.105124-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919071531.105124-1-jose.exposito89@gmail.com>
References: <20220919071531.105124-1-jose.exposito89@gmail.com>
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
index 4afc4ac27342..e2f76621453c 100644
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
index cc1ab672314a..09d358b54da0 100644
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
 
@@ -319,10 +350,42 @@ static void drm_test_fb_xrgb8888_to_rgb888_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
+static void drm_test_fb_xrgb8888_to_xrgb2101010_test(struct kunit *test)
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
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

