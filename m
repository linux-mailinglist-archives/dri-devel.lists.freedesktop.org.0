Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE875D13F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734B10E6EA;
	Fri, 21 Jul 2023 18:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E7810E6EA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:23:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4R6ycX0FJmzDrRS;
 Fri, 21 Jul 2023 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1689963836; bh=GTqYrxQgARKUGRRpAfTOLkuRUKzkcGOi+fRAMYJFNMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lrMwPjqvH5BCo8dWvMCgJPBRhy/OQ5iJhN8Z3hZBNCjnBnv/MyQV9qUYjrxHOQG55
 P1GX8glBKPX5Tsp1CnksuYeTDjiqI1KViZFp1KjPoBAivVia0/jWVRHKGRHM/Ly+ZX
 lBDL8QMmZ0zvzN2hxihg4KHVLhXxo3yKsHDb+uuo=
X-Riseup-User-ID: 12B90C8803757CEADACD15440723597CC8566DC6CD552860C3C6254271389A0B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4R6ycR6HcHzFpqX;
 Fri, 21 Jul 2023 18:23:51 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/format-helper: Add KUnit tests for
 drm_fb_clip_offset()
Date: Fri, 21 Jul 2023 15:23:13 -0300
Message-ID: <20230721182316.560649-4-arthurgrillo@riseup.net>
In-Reply-To: <20230721182316.560649-1-arthurgrillo@riseup.net>
References: <20230721182316.560649-1-arthurgrillo@riseup.net>
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
Cc: tzimmermann@suse.de, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert parameterized test for the drm_fb_clip_offset() to ensure
correctness and prevent future regressions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index abeda642d84a..2e1c5463f063 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -957,6 +957,96 @@ static void drm_test_fb_swab(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
+struct clip_offset_case {
+	const char *name;
+	unsigned int pitch;
+	u32 format;
+	struct drm_rect clip;
+	unsigned int expected_offset;
+};
+
+static struct clip_offset_case clip_offset_cases[] = {
+	{
+		.name = "pass through",
+		.pitch = TEST_USE_DEFAULT_PITCH,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(0, 0, 3, 3),
+		.expected_offset = 0
+	},
+	{
+		.name = "horizontal offset",
+		.pitch = TEST_USE_DEFAULT_PITCH,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(1, 0, 3, 3),
+		.expected_offset = 4,
+	},
+	{
+		.name = "vertical offset",
+		.pitch = TEST_USE_DEFAULT_PITCH,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(0, 1, 3, 3),
+		.expected_offset = 12,
+	},
+	{
+		.name = "horizontal and vertical offset",
+		.pitch = TEST_USE_DEFAULT_PITCH,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(1, 1, 3, 3),
+		.expected_offset = 16,
+	},
+	{
+		.name = "horizontal offset (custom pitch)",
+		.pitch = 20,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(1, 0, 3, 3),
+		.expected_offset = 4,
+	},
+	{
+		.name = "vertical offset (custom pitch)",
+		.pitch = 20,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(0, 1, 3, 3),
+		.expected_offset = 20,
+	},
+	{
+		.name = "horizontal and vertical offset (custom pitch)",
+		.pitch = 20,
+		.format = DRM_FORMAT_XRGB8888,
+		.clip = DRM_RECT_INIT(1, 1, 3, 3),
+		.expected_offset = 24,
+	},
+};
+
+static void clip_offset_case_desc(struct clip_offset_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(clip_offset, clip_offset_cases, clip_offset_case_desc);
+
+static void drm_test_fb_clip_offset(struct kunit *test)
+{
+	const struct clip_offset_case *params = test->param_value;
+	const struct drm_format_info *format_info = drm_format_info(params->format);
+
+	unsigned int offset = -1;
+
+	unsigned int pitch = params->pitch;
+
+	if (pitch == TEST_USE_DEFAULT_PITCH)
+		pitch = drm_format_info_min_pitch(format_info, 0,
+						  drm_rect_width(&params->clip));
+
+	/* Assure that the pitch is not zero, because this will inevitable cause the
+	 * wrong expected result
+	 */
+	KUNIT_ASSERT_NE(test, pitch, 0);
+
+	offset = drm_fb_clip_offset(pitch, format_info, &params->clip);
+
+	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -970,6 +1060,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
 	{}
 };
 
-- 
2.41.0

