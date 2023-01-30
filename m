Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C5680E7B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 14:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB010E249;
	Mon, 30 Jan 2023 13:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at gabe;
 Mon, 30 Jan 2023 13:06:52 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F34E10E249
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 13:06:52 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4P57X60C2GzDqLx
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1675083494; bh=oobjJOhurVuxD6CmR+9n6oxrP2c8UTD5sAcDDFieyjI=;
 h=From:To:Cc:Subject:Date:From;
 b=Q62+wuR91Dl7hy6Nn9ygj/g1vXLmjMSCnQuH08HxGWWc+piYI9YUxXzt2dWdOKsU5
 D0v7SBOUYoIlLSQeFNyIX3dYX8ro9FGzowxk6TC4r7S41acbpBrgPDaTh3w/T+xMA8
 nisI9ekm+7bhzm7HfwFNECiPvmmxgPJfEVfh8V0U=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4P57X50rXcz9tPj;
 Mon, 30 Jan 2023 12:58:13 +0000 (UTC)
X-Riseup-User-ID: 19234452AF1B23F67F7F68A97B15BDBDDF60264FE087F6F5567AFBA90F100419
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4P57X20DyPz20cj;
 Mon, 30 Jan 2023 12:58:09 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Gow <davidgow@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
Date: Mon, 30 Jan 2023 09:55:55 -0300
Message-Id: <20230130125554.363481-1-mairacanal@riseup.net>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit b8a926bea8b1 ("kunit: Introduce KUNIT_EXPECT_MEMEQ and
KUNIT_EXPECT_MEMNEQ macros") introduced a new macro to compare blocks of
memory and, if the test fails, print the result in a human-friendly
format. Therefore, use KUNIT_EXPECT_MEMEQ to compare memory blocks in
replacement of the KUNIT_EXPECT_EQ macro.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 34e80eb6d96e..9536829c6e3a 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -597,7 +597,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 
 	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
-	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
@@ -628,7 +628,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 
 	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
-	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
@@ -659,7 +659,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 
 	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
-	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
@@ -724,7 +724,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 
 	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
-	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
@@ -786,7 +786,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 
 	drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
-	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
-- 
2.39.1

