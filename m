Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62B75D145
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6A410E6EE;
	Fri, 21 Jul 2023 18:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5A210E6EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:24:04 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4R6ycg6Gckz9tN5;
 Fri, 21 Jul 2023 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1689963844; bh=BYY2Uw00am7mrIDPP4OtaTY5KuHZWU6UR8fg0fzUt2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SxKOH7oN0r4JtYdnDwfbMlwFCGcNGVFg2FenvHjD3Zkh5V6KJDULOjxVOeOsaZKDU
 pWBnvNjX9dlbthZ7+MXz36Sie15aUlVEGgfPZ7FpkbuhL8W8gSulhkwa3ZC7NmT4c9
 w8A5aM7EgAUN5JHxz6nHkXP4Zw3eQeagCeyo0iFw=
X-Riseup-User-ID: 411EF1804E2DED29D9BB70A1BE50B3035BDADCB0CF7AE8EA1155EA577FFA0EAE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4R6ycc2KwSzFpqX;
 Fri, 21 Jul 2023 18:24:00 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/format-helper-test: Add multi-plane support to
 conversion_buf_size()
Date: Fri, 21 Jul 2023 15:23:15 -0300
Message-ID: <20230721182316.560649-6-arthurgrillo@riseup.net>
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

The drm_fb_memcpy() supports multi-plane formats. To fully test it in
the future, add multi-plane support to the conversion_buf_size() helper.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index de4677868647..6ecd92898e8e 100644
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
@@ -587,7 +587,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -620,7 +620,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGB565, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -663,7 +663,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_XRGB1555, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -697,7 +697,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_ARGB1555, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -731,7 +731,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGBA5551, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -765,7 +765,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_RGB888, result->dst_pitch,
-				       &params->clip);
+				       &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -803,7 +803,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_ARGB8888,
-				       result->dst_pitch, &params->clip);
+				       result->dst_pitch, &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -838,7 +838,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_XRGB2101010,
-				       result->dst_pitch, &params->clip);
+				       result->dst_pitch, &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -872,7 +872,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	};
 
 	dst_size = conversion_buf_size(DRM_FORMAT_ARGB2101010,
-				       result->dst_pitch, &params->clip);
+				       result->dst_pitch, &params->clip, 0);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
 	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
@@ -906,7 +906,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 		.pitches = { params->pitch, 0, 0 },
 	};
 
-	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip);
+	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip, 0);
 
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
@@ -939,7 +939,7 @@ static void drm_test_fb_swab(struct kunit *test)
 		.pitches = { params->pitch, 0, 0 },
 	};
 
-	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip);
+	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip, 0);
 
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
-- 
2.41.0

