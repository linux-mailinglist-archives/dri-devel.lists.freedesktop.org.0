Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CD6B5BFB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02F410E196;
	Sat, 11 Mar 2023 12:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C8110E196
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:51:59 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PYjVR34wyz9sBT;
 Sat, 11 Mar 2023 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678539119; bh=eA+NrMT/hAKp88z/Lp2OzIN1JdcoLauZlLJCsFiDPsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HhETIUdCl+oaP9YW897WMBiTPwuG53KgWsOBJLiA3tzbe+PQf4W8mJg8td6l1faz7
 ecpfHSba7l2bUoIPYF3umOwgyH/4NDHbX5FxVMYAAoc5g3g7xOVTq3+OnYBHgytMy4
 XIU9xQzFOWAuJEBjQ/4qCz0FlarqCrFeW+Jys86Q=
X-Riseup-User-ID: 0E3CE73A0C3FAF6E8CB5B7432A39426468482F9CB531752B5A18FDFABAFC05C4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4PYjVN4cyFz5vW0;
 Sat, 11 Mar 2023 12:51:56 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
Date: Sat, 11 Mar 2023 09:51:40 -0300
Message-Id: <20230311125141.564801-2-arthurgrillo@riseup.net>
In-Reply-To: <20230311125141.564801-1-arthurgrillo@riseup.net>
References: <20230311125141.564801-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, tzimmermann@suse.de, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test cases to test the conversion from XRGB8888 to
monochromatic.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 84b5cc29c8fc..041b3d2f100f 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -67,6 +67,11 @@ struct convert_to_argb2101010_result {
 	const u32 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_mono_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -82,6 +87,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_argb8888_result argb8888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
 	struct convert_to_argb2101010_result argb2101010_result;
+	struct convert_to_mono_result mono_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -131,6 +137,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0xFFF00000 },
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = { 0b0 },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -181,6 +191,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0xFFF00000 },
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = { 0b0 },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -293,6 +307,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xFFFFFC00, 0xC00FFFFF,
 			},
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0b01,
+				0b10,
+				0b00,
+				0b11,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -392,6 +415,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xEA20300C, 0xDB1705CD, 0xC3844672, 0x00000000, 0x00000000,
 			},
 		},
+		.mono_result = {
+			.dst_pitch = 2,
+			.expected = {
+				0b000, 0b000,
+				0b000, 0b000,
+				0b000, 0b000,
+			},
+		},
 	},
 };
 
@@ -792,6 +823,36 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
+static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_mono_result *result = &params->mono_result;
+	size_t dst_size;
+	u8 *buf = NULL;
+	__le32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip);
+
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -803,6 +864,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.39.2

