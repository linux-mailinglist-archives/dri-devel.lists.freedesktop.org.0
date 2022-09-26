Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1C5E9BA9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 10:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41C110E3B3;
	Mon, 26 Sep 2022 08:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E18E10E206
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 08:08:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so4545281wma.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WcgXDoMd0CVdxOWuR/GM8D94WcALUjLEc5ia9kSiHqU=;
 b=hbiv/D7EdlkW6+bV0VRFWklX+6adfuzsk5mTQSXjW3YzTnbyGABTuEYseP/vxVrv2a
 P3Q+V711IBp9I+LsJGFZJV5MIFTBnm/fTq280RSsLgy9L/CuVw4Pj+PZcvNW1UgmdJ6J
 XQrpkGNdpTEEgEqA5AS8lswbDpHapmZufycc6sB0WdoUyCEtgM+fytxZpZHgUwdHru9j
 LBrzJLLtU6bhL9ImhwSTcMfaW4H/dSEiPaiBqZP7vY5RU26obRsgt8nw81KZcMqwGv7X
 VrOLrlMZVFmqC2NF4cBysBYnYlzHCpiZuRkboYCN51RHxeXj9Q3Q9A8B8jx0/JZFYQe3
 hRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WcgXDoMd0CVdxOWuR/GM8D94WcALUjLEc5ia9kSiHqU=;
 b=Tjg78rfb83Pct3X9HTB6ey6T8InXfJRrBmUqAdeJCAZzGVMgfTUEaVa8jmEgkpUlgQ
 g435fBLnNFGM/YE+Dtw2eqJ7EQCTFJHsHVipkUW8ZP4cCa6MMGp9wsDtE3civG+gspIv
 f2e1dGAhI5aNXWhK4Bi2P6uifvNS8f3Hngo9fN2EnLH0uF8cNDQzUpzZXFf7kuEw5CI/
 ODlXTrru5JCMBABploHK43RVSyJMYh6Uc0IO26EpRWrqjAFydMUM0TqM+30zaAHoilXa
 HPLs8NzdyE14foVSe3jmk/2NFYpoTrBPl78dLufn12UhM/dmctnNv15/o1MnX9sKF52j
 FP6Q==
X-Gm-Message-State: ACrzQf1XcSKUgjYz7VjSr4GvOMG5MB7U6yYZb5FdKuAzxa5yKRKmBuAz
 4qzy0yUhXiO92/SlAVQHgmo=
X-Google-Smtp-Source: AMsMyM5xF6KiDr6ZUij9bip2Wrijf6oe5EIypAhSp3xgij8ghz42DLUWJp7pUcgBPd5U1F0VWZx63w==
X-Received: by 2002:a7b:ce0d:0:b0:3b4:8728:3e7e with SMTP id
 m13-20020a7bce0d000000b003b487283e7emr13478059wmc.182.1664179727918; 
 Mon, 26 Sep 2022 01:08:47 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d6642000000b0022ac61ebb14sm13421078wrw.22.2022.09.26.01.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 01:08:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v5 1/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb888()
Date: Mon, 26 Sep 2022 10:08:35 +0200
Message-Id: <20220926080837.65734-2-jose.exposito89@gmail.com>
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
RGB888.

Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: David Gow <davidgow@google.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index ab49f5e8796c..bc830601e7a2 100644
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
 
@@ -255,9 +289,40 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
 }
 
+static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
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
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

