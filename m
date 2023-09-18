Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7D7A5656
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 01:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DE110E126;
	Mon, 18 Sep 2023 23:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946DC10E126
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 23:51:30 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RqM5G174vzDqPT;
 Mon, 18 Sep 2023 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695081090; bh=KJ+HroIpOCcaLS/f1y68fFfMxbEWwVHvekKoBmXaj+Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ivOvcNPEY5z9wxHipmt7ndcfA/LTEWT/uWWJrDLZIgVZELnA/hULQDDQty5UI3Mg4
 jaBTBz1eIGzDWeYSprzalPqyYah4F3dATtbzH/n+UhlAHPA8fFOA0c6E2oIU14TtJK
 BMyMRrPQwcy3rd37s4G9X3QOJqLd4qExPQtCJa8A=
X-Riseup-User-ID: AE15BB6E39A4C64F7A731C17901034675C066C8E09B6A40AE55D89803B9B0D2A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RqM5C1xMjzFpgC;
 Mon, 18 Sep 2023 23:51:27 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 18 Sep 2023 20:51:04 -0300
Subject: [PATCH RESEND v3 1/2] drm/tests: Add calls to drm_fb_blit() on
 supported format conversion tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230918-final-gsoc-v3-1-b999c042a4cc@riseup.net>
References: <20230918-final-gsoc-v3-0-b999c042a4cc@riseup.net>
In-Reply-To: <20230918-final-gsoc-v3-0-b999c042a4cc@riseup.net>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Add a call to drm_fb_blit() on existing format conversion tests that
has support.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 143 +++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 1a6bd291345d..9cad723ada9d 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -643,6 +643,18 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
+
+	buf = dst.vaddr;
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
@@ -677,6 +689,18 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
@@ -711,6 +735,18 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
@@ -745,6 +781,18 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip);
+
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
@@ -782,6 +830,16 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 
 	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
@@ -816,6 +874,18 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip);
+
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
@@ -850,6 +920,17 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
+				  &params->clip);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
@@ -884,6 +965,19 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result = 0;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src, &fb,
+				  &params->clip);
+
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
@@ -951,6 +1045,41 @@ static void drm_test_fb_swab(struct kunit *test)
 	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
+				  &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr;
+	memset(buf, 0, dst_size);
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf = dst.vaddr;
+	memset(buf, 0, dst_size);
+
+	struct drm_format_info mock_format = *fb.format;
+
+	mock_format.format |= DRM_FORMAT_BIG_ENDIAN;
+	fb.format = &mock_format;
+
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 struct clip_offset_case {
@@ -1538,6 +1667,20 @@ static void drm_test_fb_memcpy(struct kunit *test)
 
 	drm_fb_memcpy(dst, dst_pitches, src, &fb, &params->clip);
 
+	for (size_t i = 0; i < fb.format->num_planes; i++) {
+		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
+		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
+				       "Failed expectation on plane %zu", i);
+
+		memset(buf[i], 0, dst_size[i]);
+	}
+
+
+	int blit_result;
+
+	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
 	for (size_t i = 0; i < fb.format->num_planes; i++) {
 		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
 		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],

-- 
2.41.0

