Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E157796F5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 20:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B64C10E6D9;
	Fri, 11 Aug 2023 18:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFD010E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 18:18:25 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RMsVT0y8Tz9t79;
 Fri, 11 Aug 2023 18:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691777905; bh=iy+K0VRr7kUmeVGTo3VCN8Pq5W3/NJqKk/7m7y1U+p8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gx3rnYoItWPWj2DnT6CiZOWdBdInqPqbHctVi4eKuAEke1FxTB+/+nO9JDpPBHL7S
 ROcSqgWdX7eRnhyHmxZGuxrspaQn1ciZa8ALdaPPQW7/sbPXlbggkMQYUbHUQn1aJc
 iV4VN34IYbCxeZTLmcQQkmZ/PaErdBRh/vZHzd+4=
X-Riseup-User-ID: DBB9FA5A004A336E6E66A8E5713B6E2CF9FF26F9A455C2EF4D9D00AD69046566
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RMsVQ5KH8zFpZR;
 Fri, 11 Aug 2023 18:18:22 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 11 Aug 2023 15:17:40 -0300
Subject: [PATCH v2 2/6] drm/tests: Add KUnit tests for drm_fb_swab()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230811-gsoc-drm-format-test-v2-v2-2-763b17890644@riseup.net>
References: <20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net>
In-Reply-To: <20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net>
To: dri-devel@lists.freedesktop.org
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert parameterized test for the drm_fb_swab() to ensure correctness
and prevent future regressions.

Each expected color has it bytes reversed in order, so xrgb would be
bgrx.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 938d4fdb4291..d10e18fcb994 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -74,6 +74,11 @@ struct convert_to_mono_result {
 	const u8 expected[TEST_BUF_SIZE];
 };
 
+struct fb_swab_result {
+	unsigned int dst_pitch;
+	const u32 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -90,6 +95,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
 	struct convert_to_argb2101010_result argb2101010_result;
 	struct convert_to_mono_result mono_result;
+	struct fb_swab_result swab_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -143,6 +149,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
 			.expected = { 0b0 },
 		},
+		.swab_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = { 0x0000FF01 },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -197,6 +207,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = { 0b0 },
 		},
+		.swab_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = { 0x0000FF10 },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -318,6 +332,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0b11,
 			},
 		},
+		.swab_result = {
+			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
+			.expected = {
+				0xFFFFFF11, 0x00000022,
+				0x0000FF33, 0x00FF0044,
+				0xFF000055, 0xFF00FF66,
+				0x00FFFF77, 0xFFFF0088,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -425,6 +448,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0b010, 0b000,
 			},
 		},
+		.swab_result = {
+			.dst_pitch =  20,
+			.expected = {
+				0x9C440EA1, 0x054D11B1, 0x03F3A8C1, 0x00000000, 0x00000000,
+				0x73F06CD1, 0x9C440EA2, 0x054D11B2, 0x00000000, 0x00000000,
+				0x0303A8C2, 0x73F06CD2, 0x9C440EA3, 0x00000000, 0x00000000,
+			},
+		},
 	},
 };
 
@@ -886,6 +917,40 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
+static void drm_test_fb_swab(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct fb_swab_result *result = &params->swab_result;
+	size_t dst_size;
+	u32 *buf = NULL;
+	__le32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip);
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
+	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
+		NULL : &result->dst_pitch;
+
+	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -898,6 +963,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
 	{}
 };
 

-- 
2.41.0

