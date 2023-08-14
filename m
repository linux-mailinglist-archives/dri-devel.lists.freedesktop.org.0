Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9977C34B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 00:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270D210E230;
	Mon, 14 Aug 2023 22:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D012D10E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 22:12:34 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RPpYG4RPRz9t4T;
 Mon, 14 Aug 2023 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1692051154; bh=ODMVAbqftWnlnYkJc5iKtcszrGDXZ1RkuscB+skncW8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kriu/WKlbsNtMpjXxM2gy85ItiyeffCryb99GJlmRhy/D/g0UkyyLtff1Tqg2WdSj
 56AeRjgkNKV9ttDSWQeSb73zZoP9+OWoqzkVBuVqT4NDrERxs63msuD+3kxftrFr5E
 wt3Fg1xMZzAX7jNwyNHKyILf2iA5TLvxk3s9RcQQ=
X-Riseup-User-ID: 10E943F48F3152BFE4E2F0EE96BE71C15A21336041B43CF8245C54DEDB7A39FA
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RPpYC5c4JzJmsJ;
 Mon, 14 Aug 2023 22:12:31 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 14 Aug 2023 19:12:02 -0300
Subject: [PATCH v3 3/6] drm/tests: Add KUnit tests for drm_fb_clip_offset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230814-gsoc-drm-format-test-v2-v3-3-bd3e9f9bc2fb@riseup.net>
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

Insert parameterized test for the drm_fb_clip_offset() to ensure
correctness and prevent future regressions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index d10e18fcb994..7f24da0b1e00 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -951,6 +951,96 @@ static void drm_test_fb_swab(struct kunit *test)
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
+	unsigned int offset;
+	unsigned int pitch = params->pitch;
+
+	if (pitch == TEST_USE_DEFAULT_PITCH)
+		pitch = drm_format_info_min_pitch(format_info, 0,
+						  drm_rect_width(&params->clip));
+
+	/*
+	 * Assure that the pitch is not zero, because this will inevitable cause the
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
@@ -964,6 +1054,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
 	{}
 };
 

-- 
2.41.0

