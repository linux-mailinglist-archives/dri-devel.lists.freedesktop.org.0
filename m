Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C859583A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB1D8D173;
	Tue, 16 Aug 2022 10:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9290DE1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:29:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so5223395wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZUx34QkHnBswCsUg5dOcBaoezDJ6gfWumxiIbYHCirs=;
 b=iNJTjNTrsT+WogTYPkEAEhy9SRvgJoM0IwoK9HllLm5bRoE/UsSQi9ijHQE9b1MCLb
 fjEu5WK399K8xPkUwnOfprDq5JfgJVZB5pCJfXqgWND3NuePAvnNxdTSffr3esCV6qan
 o7mJUbSkrDjNZOJnEtHMVUVsJCgLxjZx1n7imAv8lIk4GSFnq3fRSWiJRDepn/Kynn26
 jPY0bJ67ZLEIFOn34quychCwurRDo2DzV+EnDxdEyZo/+WM01IJ/iqgAKldJdixIqrWD
 lwDrTYkT6J+vqSR5Kp8+REV8TPmB/ChCFek2dzfC3lhKt1szDPOY4W+87Dr0ncsLn1TO
 x+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZUx34QkHnBswCsUg5dOcBaoezDJ6gfWumxiIbYHCirs=;
 b=SbUsdkgFdFD6wd4PC3UIgHJhC3UoMBATciBhSVSkW9NYvTwMS3UsGR+Xgxj4YjDj8c
 Jc9NTdruj4lm9m8MuZ6wxv/Pp39+/rCXtkcWi8wkJrUB6aTfx88Kl7i77mw8XxCY0z9u
 FZYEsawvT/DfwRFwrwBZNJqCffoWp7sGKmtun4578Bl2mjbCJXBVyLdpKOBTyunK3BIF
 YlvuU5uyMyiOb3x4cYsO3HrYkZbTkJXTnKp/D34VIqvqyxTyUQeeHVFYzrgMLSUlcaPT
 gTxibQqKYHEKG+2t+NdHgV5L04jJg7zinixcV/1Mjclb0Djp2tYc4lgwbC9P/S8fnjIb
 OgIg==
X-Gm-Message-State: ACgBeo1/KJxUL3h8UMn6dLvv0wT+1lDAUN8cNRJ7bPZkVeawsUZoCPpu
 4vUPFa7dFPOHAz/wRQhcYdg=
X-Google-Smtp-Source: AA6agR5iHzQVr37Imsp8vtLPGEI0c14MbmGxjtQYWSuBdSpxix+OPsAN07NhKDaJU7WiPHcoHA4NgQ==
X-Received: by 2002:a05:600c:3ba0:b0:3a5:b73a:8773 with SMTP id
 n32-20020a05600c3ba000b003a5b73a8773mr16993312wms.64.1660645754524; 
 Tue, 16 Aug 2022 03:29:14 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adffe49000000b002251639bfd0sm1668407wrs.59.2022.08.16.03.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:29:14 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_xrgb2101010()
Date: Tue, 16 Aug 2022 12:29:02 +0200
Message-Id: <20220816102903.276879-3-jose.exposito89@gmail.com>
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
XRGB2101010.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

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

