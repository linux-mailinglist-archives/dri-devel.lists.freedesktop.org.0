Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920C75E9BAD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 10:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849D10E645;
	Mon, 26 Sep 2022 08:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A89E10E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 08:08:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r7so8944938wrm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vrEtLoLXJ0iTEl/AGiFoQ93+y9nVNiEw3gldZxWD548=;
 b=XwJ/nd17lrK5HtYzpmPMlFKoPPzpoJAqnzR6WlZBiWnwK/24ANec4fDLbPd4eaCOh6
 tOssfynso6DYUeCUwaxCaD6zurRolYnkJxNaSTWLxJbm6J8FrZwL9rXlKuRJf1neDqiX
 sUE3TXl2zflQE+8r53ZDe+ny5BLYWUPTTKg/YpjL2bKdRa0XmKsRBclp9fqgMtWUb5Ox
 jVB106riCFKsH/LV0uioIVbu5iyXcKzq1zInWUmeUOR40VaobgistM847zq9I5g5Aq3m
 hN9htfjUNGHwgqgnzyu47maN6O2a/1LaapdsPJQgYpiBjP6XFvil7+sgqeSOGvv8YVXE
 eYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vrEtLoLXJ0iTEl/AGiFoQ93+y9nVNiEw3gldZxWD548=;
 b=1lqJrZPKMRVOXCmfDfkAcB0GAIpxIv808A1dh+puXr9/xVo5Op1eiGEdy4357eaUtz
 +1k3FcffxZ1FikTsab2+4Msn3CVR4Z+lFtWwXwxO53r+W8uTiRlGJoaxfmyOmakSe85l
 zDUV7UxS3fr83tG7RTvxTqyujMxvWpRZqsPVrPSh5xBZ2ZV5H9xSNMuF6NfwhcMU2QN2
 H5r/egzTGe5rUH5iwgNTB+kcTGxlX5iKzOr1oH/eONAlfwGA2jSYCR+w8mzRGAEIil4c
 Ht7z6MCS6gdpqb6LnWKuMtNnxkdWCQ03TLWnXes4kXSnr0MoUUdtSXw95RAtO3hRhRev
 m2dQ==
X-Gm-Message-State: ACrzQf0SFUODmwd8ofCN8i5mLehURn2SN6Cp7er0r5olYnsKKFUIKHpM
 i9JIE1UJ8kbstpDcrMVokOk=
X-Google-Smtp-Source: AMsMyM7doUvgczCN/zuxOmb+pZhS7rZWQ0TKivw2LEyV7K7JifUKdp1a3ZYMlnTdMi34BMVMpsGelA==
X-Received: by 2002:adf:f80b:0:b0:228:dbb9:5bdf with SMTP id
 s11-20020adff80b000000b00228dbb95bdfmr12549039wrp.327.1664179731590; 
 Mon, 26 Sep 2022 01:08:51 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d6642000000b0022ac61ebb14sm13421078wrw.22.2022.09.26.01.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 01:08:51 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v5 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Date: Mon, 26 Sep 2022 10:08:37 +0200
Message-Id: <20220926080837.65734-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926080837.65734-1-jose.exposito89@gmail.com>
References: <20220926080837.65734-1-jose.exposito89@gmail.com>
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
 Maxime Ripard <maxime@cerno.tech>, magalilemes00@gmail.com, airlied@linux.ie,
 maira.canal@usp.br, dlatypov@google.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test cases to test the conversion from XRGB8888 to
grayscale.

Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: David Gow <davidgow@google.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 4a2f3c0de060..8d86c250c2ec 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -16,6 +16,11 @@
 
 #define TEST_BUF_SIZE 50
 
+struct convert_to_gray8_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_to_rgb332_result {
 	unsigned int dst_pitch;
 	const u8 expected[TEST_BUF_SIZE];
@@ -42,6 +47,7 @@ struct convert_xrgb8888_case {
 	unsigned int pitch;
 	struct drm_rect clip;
 	const u32 xrgb8888[TEST_BUF_SIZE];
+	struct convert_to_gray8_result gray8_result;
 	struct convert_to_rgb332_result rgb332_result;
 	struct convert_to_rgb565_result rgb565_result;
 	struct convert_to_rgb888_result rgb888_result;
@@ -54,6 +60,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.pitch = 1 * 4,
 		.clip = DRM_RECT_INIT(0, 0, 1, 1),
 		.xrgb8888 = { 0x01FF0000 },
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = { 0x4C },
+		},
 		.rgb332_result = {
 			.dst_pitch = 0,
 			.expected = { 0xE0 },
@@ -80,6 +90,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0x00000000, 0x00000000,
 			0x00000000, 0x10FF0000,
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = { 0x4C },
+		},
 		.rgb332_result = {
 			.dst_pitch = 0,
 			.expected = { 0xE0 },
@@ -113,6 +127,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
 			0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
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
 		.rgb332_result = {
 			.dst_pitch = 0,
 			.expected = {
@@ -166,6 +189,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			0xD16C7073, 0xA20E449C, 0xB2114D05,
 			0xC2A80303, 0xD26C7073, 0xA30E449C,
 		},
+		.gray8_result = {
+			.dst_pitch = 5,
+			.expected = {
+				0x3C, 0x33, 0x34, 0x00, 0x00,
+				0x6F, 0x3C, 0x33, 0x00, 0x00,
+				0x34, 0x6F, 0x3C, 0x00, 0x00,
+			},
+		},
 		.rgb332_result = {
 			.dst_pitch = 5,
 			.expected = {
@@ -257,6 +288,36 @@ static void convert_xrgb8888_case_desc(struct convert_xrgb8888_case *t,
 KUNIT_ARRAY_PARAM(convert_xrgb8888, convert_xrgb8888_cases,
 		  convert_xrgb8888_case_desc);
 
+static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
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
 static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params = test->param_value;
@@ -382,6 +443,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
-- 
2.25.1

