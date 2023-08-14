Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B384577C34E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 00:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA94110E234;
	Mon, 14 Aug 2023 22:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1FA10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 22:12:44 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RPpYR5c21zDqkB;
 Mon, 14 Aug 2023 22:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1692051164; bh=2qxuJSuhRTf5AWoXUWvLam/PGZuVg1kMmyT+aQF0qEo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YYnRtjO3pM0BvwzrR+cyhxIh0N6HnWvmRzlxNtNsVeVD9DTWZhvE/ZG7Lc7WO9sbg
 wOzLeu02E6SemWnvSDOKVQiS8vLxP+b1GYIUUWbWD1xipDELrkMKp3duWMwhJXlR15
 rM/OwzVh+EyKnLwP+gN/1csugqSU7Ba5U/cQWQZI=
X-Riseup-User-ID: 83FFC2F78EA2D32519EB2494D806AA07DD50041AE72E74EE50E4E8A42F508294
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RPpYN2zGlzJmsJ;
 Mon, 14 Aug 2023 22:12:40 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 14 Aug 2023 19:12:05 -0300
Subject: [PATCH v3 6/6] drm/tests: Add KUnit tests for drm_fb_memcpy()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-gsoc-drm-format-test-v2-v3-6-bd3e9f9bc2fb@riseup.net>
References: <20230814-gsoc-drm-format-test-v2-v3-0-bd3e9f9bc2fb@riseup.net>
In-Reply-To: <20230814-gsoc-drm-format-test-v2-v3-0-bd3e9f9bc2fb@riseup.net>
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

Insert parameterized test for the drm_fb_memcpy() to ensure correctness
and prevent future regressions. The test case can accept different
formats.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 362 +++++++++++++++++++++++++
 1 file changed, 362 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 8ac7a667f0d9..0cbca4ccabac 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1184,6 +1184,367 @@ static void drm_test_fb_build_fourcc_list(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
 }
 
+struct fb_memcpy_case {
+	const char *name;
+	u32 format;
+	struct drm_rect clip;
+	unsigned int src_pitches[DRM_FORMAT_MAX_PLANES];
+	const u32 src[DRM_FORMAT_MAX_PLANES][TEST_BUF_SIZE];
+	unsigned int dst_pitches[DRM_FORMAT_MAX_PLANES];
+	const u32 expected[DRM_FORMAT_MAX_PLANES][TEST_BUF_SIZE];
+};
+
+/* The `src` and `expected` buffers are u32 arrays. To deal with planes that
+ * have a cpp != 4 the values are stored together on the same u32 number in a
+ * way so the order in memory is correct in a little-endian machine.
+ *
+ * Because of that, on some occasions, parts of a u32 will not be part of the
+ * test, to make this explicit the 0xFF byte is used on those parts.
+ */
+
+static struct fb_memcpy_case fb_memcpy_cases[] = {
+	{
+		.name = "single_pixel_source_buffer",
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(0, 0, 1, 1),
+		.src_pitches = { 1 * 4 },
+		.src = {{ 0x01020304 }},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {{ 0x01020304 }},
+	},
+	{
+		.name = "single_pixel_source_buffer",
+		.format = DRM_FORMAT_XRGB8888_A8,
+		.clip = DRM_RECT_INIT(0, 0, 1, 1),
+		.src_pitches = { 1 * 4, 1 },
+		.src = {
+			{ 0x01020304 },
+			{ 0xFFFFFF01 },
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{ 0x01020304 },
+			{ 0x00000001 },
+		},
+	},
+	{
+		.name = "single_pixel_source_buffer",
+		.format = DRM_FORMAT_YUV444,
+		.clip = DRM_RECT_INIT(0, 0, 1, 1),
+		.src_pitches = { 1, 1, 1 },
+		.src = {
+			{ 0xFFFFFF01 },
+			{ 0xFFFFFF01 },
+			{ 0xFFFFFF01 },
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{ 0x00000001 },
+			{ 0x00000001 },
+			{ 0x00000001 },
+		},
+	},
+	{
+		.name = "single_pixel_clip_rectangle",
+		.format = DRM_FORMAT_XBGR8888,
+		.clip = DRM_RECT_INIT(1, 1, 1, 1),
+		.src_pitches = { 2 * 4 },
+		.src = {
+			{
+				0x00000000, 0x00000000,
+				0x00000000, 0x01020304,
+			},
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{ 0x01020304 },
+		},
+	},
+	{
+		.name = "single_pixel_clip_rectangle",
+		.format = DRM_FORMAT_XRGB8888_A8,
+		.clip = DRM_RECT_INIT(1, 1, 1, 1),
+		.src_pitches = { 2 * 4, 2 * 1 },
+		.src = {
+			{
+				0x00000000, 0x00000000,
+				0x00000000, 0x01020304,
+			},
+			{ 0x01000000 },
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{ 0x01020304 },
+			{ 0x00000001 },
+		},
+	},
+	{
+		.name = "single_pixel_clip_rectangle",
+		.format = DRM_FORMAT_YUV444,
+		.clip = DRM_RECT_INIT(1, 1, 1, 1),
+		.src_pitches = { 2 * 1, 2 * 1, 2 * 1 },
+		.src = {
+			{ 0x01000000 },
+			{ 0x01000000 },
+			{ 0x01000000 },
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{ 0x00000001 },
+			{ 0x00000001 },
+			{ 0x00000001 },
+		},
+	},
+	{
+		.name = "well_known_colors",
+		.format = DRM_FORMAT_XBGR8888,
+		.clip = DRM_RECT_INIT(1, 1, 2, 4),
+		.src_pitches = { 4 * 4 },
+		.src = {
+			{
+				0x00000000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x11FFFFFF, 0x22000000, 0x00000000,
+				0x00000000, 0x33FF0000, 0x4400FF00, 0x00000000,
+				0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
+				0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
+			},
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{
+				0x11FFFFFF, 0x22000000,
+				0x33FF0000, 0x4400FF00,
+				0x550000FF, 0x66FF00FF,
+				0x77FFFF00, 0x8800FFFF,
+			},
+		},
+	},
+	{
+		.name = "well_known_colors",
+		.format = DRM_FORMAT_XRGB8888_A8,
+		.clip = DRM_RECT_INIT(1, 1, 2, 4),
+		.src_pitches = { 4 * 4, 4 * 1 },
+		.src = {
+			{
+				0x00000000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0xFFFFFFFF, 0xFF000000, 0x00000000,
+				0x00000000, 0xFFFF0000, 0xFF00FF00, 0x00000000,
+				0x00000000, 0xFF0000FF, 0xFFFF00FF, 0x00000000,
+				0x00000000, 0xFFFFFF00, 0xFF00FFFF, 0x00000000,
+			},
+			{
+				0x00000000,
+				0x00221100,
+				0x00443300,
+				0x00665500,
+				0x00887700,
+			},
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{
+				0xFFFFFFFF, 0xFF000000,
+				0xFFFF0000, 0xFF00FF00,
+				0xFF0000FF, 0xFFFF00FF,
+				0xFFFFFF00, 0xFF00FFFF,
+			},
+			{
+				0x44332211,
+				0x88776655,
+			},
+		},
+	},
+	{
+		.name = "well_known_colors",
+		.format = DRM_FORMAT_YUV444,
+		.clip = DRM_RECT_INIT(1, 1, 2, 4),
+		.src_pitches = { 4 * 1, 4 * 1, 4 * 1 },
+		.src = {
+			{
+				0x00000000,
+				0x0000FF00,
+				0x00954C00,
+				0x00691D00,
+				0x00B2E100,
+			},
+			{
+				0x00000000,
+				0x00000000,
+				0x00BEDE00,
+				0x00436500,
+				0x00229B00,
+			},
+			{
+				0x00000000,
+				0x00000000,
+				0x007E9C00,
+				0x0083E700,
+				0x00641A00,
+			},
+		},
+		.dst_pitches = { TEST_USE_DEFAULT_PITCH },
+		.expected = {
+			{
+				0x954C00FF,
+				0xB2E1691D,
+			},
+			{
+				0xBEDE0000,
+				0x229B4365,
+			},
+			{
+				0x7E9C0000,
+				0x641A83E7,
+			},
+		},
+	},
+	{
+		.name = "destination_pitch",
+		.format = DRM_FORMAT_XBGR8888,
+		.clip = DRM_RECT_INIT(0, 0, 3, 3),
+		.src_pitches = { 3 * 4 },
+		.src = {
+			{
+				0xA10E449C, 0xB1114D05, 0xC1A8F303,
+				0xD16CF073, 0xA20E449C, 0xB2114D05,
+				0xC2A80303, 0xD26CF073, 0xA30E449C,
+			},
+		},
+		.dst_pitches = { 5 * 4 },
+		.expected = {
+			{
+				0xA10E449C, 0xB1114D05, 0xC1A8F303, 0x00000000, 0x00000000,
+				0xD16CF073, 0xA20E449C, 0xB2114D05, 0x00000000, 0x00000000,
+				0xC2A80303, 0xD26CF073, 0xA30E449C, 0x00000000, 0x00000000,
+			},
+		},
+	},
+	{
+		.name = "destination_pitch",
+		.format = DRM_FORMAT_XRGB8888_A8,
+		.clip = DRM_RECT_INIT(0, 0, 3, 3),
+		.src_pitches = { 3 * 4, 3 * 1 },
+		.src = {
+			{
+				0xFF0E449C, 0xFF114D05, 0xFFA8F303,
+				0xFF6CF073, 0xFF0E449C, 0xFF114D05,
+				0xFFA80303, 0xFF6CF073, 0xFF0E449C,
+			},
+			{
+				0xB2C1B1A1,
+				0xD2A3D1A2,
+				0xFFFFFFC2,
+			},
+		},
+		.dst_pitches = { 5 * 4, 5 * 1 },
+		.expected = {
+			{
+				0xFF0E449C, 0xFF114D05, 0xFFA8F303, 0x00000000, 0x00000000,
+				0xFF6CF073, 0xFF0E449C, 0xFF114D05, 0x00000000, 0x00000000,
+				0xFFA80303, 0xFF6CF073, 0xFF0E449C, 0x00000000, 0x00000000,
+			},
+			{
+				0x00C1B1A1,
+				0xD1A2B200,
+				0xD2A30000,
+				0xFF0000C2,
+			},
+		},
+	},
+	{
+		.name = "destination_pitch",
+		.format = DRM_FORMAT_YUV444,
+		.clip = DRM_RECT_INIT(0, 0, 3, 3),
+		.src_pitches = { 3 * 1, 3 * 1, 3 * 1 },
+		.src = {
+			{
+				0xBAC1323D,
+				0xBA34323D,
+				0xFFFFFF3D,
+			},
+			{
+				0xE1ABEC2A,
+				0xE1EAEC2A,
+				0xFFFFFF2A,
+			},
+			{
+				0xBCEBE4D7,
+				0xBC65E4D7,
+				0xFFFFFFD7,
+			},
+		},
+		.dst_pitches = { 5 * 1, 5 * 1, 5 * 1 },
+		.expected = {
+			{
+				0x00C1323D,
+				0x323DBA00,
+				0xBA340000,
+				0xFF00003D,
+			},
+			{
+				0x00ABEC2A,
+				0xEC2AE100,
+				0xE1EA0000,
+				0xFF00002A,
+			},
+			{
+				0x00EBE4D7,
+				0xE4D7BC00,
+				0xBC650000,
+				0xFF0000D7,
+			},
+		},
+	},
+};
+
+static void fb_memcpy_case_desc(struct fb_memcpy_case *t, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s: %p4cc", t->name, &t->format);
+}
+
+KUNIT_ARRAY_PARAM(fb_memcpy, fb_memcpy_cases, fb_memcpy_case_desc);
+
+static void drm_test_fb_memcpy(struct kunit *test)
+{
+	const struct fb_memcpy_case *params = test->param_value;
+	size_t dst_size[DRM_FORMAT_MAX_PLANES] = { 0 };
+	u32 *buf[DRM_FORMAT_MAX_PLANES] = { 0 };
+	__le32 *src_cp[DRM_FORMAT_MAX_PLANES] = { 0 };
+	__le32 *expected[DRM_FORMAT_MAX_PLANES] = { 0 };
+	struct iosys_map dst[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map src[DRM_FORMAT_MAX_PLANES];
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(params->format),
+	};
+
+	memcpy(fb.pitches, params->src_pitches, DRM_FORMAT_MAX_PLANES * sizeof(int));
+
+	for (size_t i = 0; i < fb.format->num_planes; i++) {
+		dst_size[i] = conversion_buf_size(params->format, params->dst_pitches[i],
+						  &params->clip, i);
+		KUNIT_ASSERT_GT(test, dst_size[i], 0);
+
+		buf[i] = kunit_kzalloc(test, dst_size[i], GFP_KERNEL);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf[i]);
+		iosys_map_set_vaddr(&dst[i], buf[i]);
+
+		src_cp[i] = cpubuf_to_le32(test, params->src[i], TEST_BUF_SIZE);
+		iosys_map_set_vaddr(&src[i], src_cp[i]);
+	}
+
+	const unsigned int *dst_pitches = params->dst_pitches[0] == TEST_USE_DEFAULT_PITCH ? NULL :
+		params->dst_pitches;
+
+	drm_fb_memcpy(dst, dst_pitches, src, &fb, &params->clip);
+
+	for (size_t i = 0; i < fb.format->num_planes; i++) {
+		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
+		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
+				       "Failed expectation on plane %zu", i);
+	}
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -1199,6 +1560,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),
 	{}
 };
 

-- 
2.41.0

