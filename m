Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60977C34D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 00:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBACB10E235;
	Mon, 14 Aug 2023 22:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6365010E237
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 22:12:40 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RPpYN0zGjz9t4T;
 Mon, 14 Aug 2023 22:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1692051160; bh=8GiRPt62NUdNCa4ZanqPpNCUpz0mng6Tv2yluaDT/kM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f3sWeoGSNrYIUHUSR5p5uK+u8nCGNsUV+HitviF0EiiRu6nuzpTwabGZCFsf8rIvk
 a3p4cjWj7PKZodKRV8tLN00D/cd4cMIZU8NmFsffHBMm/OSbzseRp1biAyRUVv3qJ+
 MrHhEL1c1bNxhGICyR+VFHyBbW1I9ncHExIpd22A=
X-Riseup-User-ID: 0032236F6583B50EE0F16ABA4D693DD79A962828D065EB0E0CE663EEAD7DCB9B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RPpYK4p8ZzJmsJ;
 Mon, 14 Aug 2023 22:12:37 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 14 Aug 2023 19:12:04 -0300
Subject: [PATCH v3 5/6] drm/tests: Add multi-plane support to
 conversion_buf_size()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230814-gsoc-drm-format-test-v2-v3-5-bd3e9f9bc2fb@riseup.net>
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

The drm_fb_memcpy() supports multi-plane formats. To fully test it in
the future, add multi-plane support to the conversion_buf_size() helper.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index eca6b3415a42..8ac7a667f0d9 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -472,7 +472,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
  * The size of the destination buffer or negative value on error.
  */
 static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
-				  const struct drm_rect *clip)
+				  const struct drm_rect *clip, int plane)
 {
 	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
 
@@ -480,7 +480,7 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 		return -EINVAL;
 
 	if (!dst_pitch)
-		dst_pitch = drm_format_info_min_pitch(dst_fi, 0, drm_rect_width(clip));
+		dst_pitch = drm_format_info_min_pitch(dst_fi, plane, drm_rect_width(clip));
 
 	return dst_pitch * drm_rect_height(clip);
 }
@@ -554,7 +554,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_R8, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -588,7 +588,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -621,7 +621,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGB565, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -660,7 +660,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_XRGB1555, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -694,7 +694,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_ARGB1555, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -728,7 +728,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGBA5551, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -762,7 +762,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGB888, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -799,7 +799,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_ARGB8888,
-				       result->dst_pitch, &params->clip);
+				       result->dst_pitch, &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -833,7 +833,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_XRGB2101010,
-				       result->dst_pitch, &params->clip);
+				       result->dst_pitch, &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -867,7 +867,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_ARGB2101010,
-				       result->dst_pitch, &params->clip);
+				       result->dst_pitch, &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -900,7 +900,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 		.pitches = { params->pitch, 0, 0 },
 	};
 
-	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip);
+	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip, 0);
 
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
@@ -933,7 +933,7 @@ static void drm_test_fb_swab(struct kunit *test)
 		.pitches = { params->pitch, 0, 0 },
 	};
 
-	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip);
+	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip, 0);
 
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 

-- 
2.41.0

