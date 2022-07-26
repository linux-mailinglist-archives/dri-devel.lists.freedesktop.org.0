Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C7581C48
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 01:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D999B214A;
	Tue, 26 Jul 2022 23:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545CCB20F8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 23:09:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h9so22066681wrm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WjHwX17IyVtE8JB1105eRfVv2sAKL5cPl31La/xOQo=;
 b=VGK4nGWHPp+fpD4KWPsFdVLzQoUwu3AS2ZsPPS1d9SDhBhj4jsgK1a7w4mr+kiRkVk
 sV7TSqPh4d6SYELXugNc5Mfxum2KHCm8lFD/01gYXW6nAcSDeg0RO8OzNPA5FOOqa05Q
 uK1doUC+LZxBh2JvADCr/aUKb44C1/HMSu105vww/VzpGa1cG1pE3t2ZGTCL0fpowSL0
 aDKIa5XiEpnEhMERgglzPkq9wEMMscvQ4UGkllAI4EHWy3cn0d0U9WlT1Ewf+xLAjrh2
 /5mycI6+I2DWcUo+3+pqTJdBA6s0BnnCdzza9UfjvVdUogQxTqoB3bPIkc+rI3lBg/B+
 vJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WjHwX17IyVtE8JB1105eRfVv2sAKL5cPl31La/xOQo=;
 b=MFV6H2a8bI5DqRKUL6k1cnejTb4x1FiFEA0dEGO7DxvuBt5QCU/3mz+47mk++B+7lc
 o6p1Cx5yp1/K6KgYRQVIbhn8tMJaAnPQRNcyHFSfzS3nwZEQIFK0xiqy9msImixSd1of
 zVrTJ9rm3jo9QyQepzB8ajUNLKGA9UbT5M7Y/QmmFyGNapD9g73e2iFmTPHFOiqfijjV
 evnr9eWyYkEKDRJytwgIU4A4RpCUWcjvRiACVaJP0P6T85EoizyCqHYN5L6R7U/f4/i6
 uZM6DblEcXf55CuDqVLH8sozeqYFYZSHYB0ZR2OfoD7Hgj2L9IzaGgwNV1QpRZ3XN6kG
 6RSw==
X-Gm-Message-State: AJIora81ivNunMlslQGK4x0qm1UQTqXcN/ByPcl13Pa3I6WKjO5N6MxX
 25yoHici2BbxvJAbdgJn4bA=
X-Google-Smtp-Source: AGRyM1v/fQQzGFvnnr7oKrY5P9zFJMTTvyjTxfnbA8sJj+wpsxKlBRi5cRJ61oLJ48N2T6oZihddRg==
X-Received: by 2002:adf:e70e:0:b0:21d:7f90:7501 with SMTP id
 c14-20020adfe70e000000b0021d7f907501mr11552680wrm.447.1658876967632; 
 Tue, 26 Jul 2022 16:09:27 -0700 (PDT)
Received: from localhost.localdomain ([94.73.33.57])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0021e86504736sm7278533wrb.16.2022.07.26.16.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 16:09:27 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 1/4] drm/format-helper: Fix test on big endian architectures
Date: Wed, 27 Jul 2022 01:09:13 +0200
Message-Id: <20220726230916.390575-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726230916.390575-1-jose.exposito89@gmail.com>
References: <20220726230916.390575-1-jose.exposito89@gmail.com>
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

The tests fail on big endian architectures, like PowerPC:

 $ ./tools/testing/kunit/kunit.py run \
   --kunitconfig=drivers/gpu/drm/tests \
   --arch=powerpc --cross_compile=powerpc64-linux-gnu-

Transform the XRGB8888 buffer from little endian to the CPU endian
before calling the conversion function to avoid this error.

Fixes: 8f456104915f ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()")
Reported-by: David Gow <davidgow@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 98583bf56044..eefaba3aaea2 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -111,6 +111,21 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 	return dst_pitch * drm_rect_height(clip);
 }
 
+static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
+{
+	u32 *dst = NULL;
+	int n;
+
+	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
+	if (!dst)
+		return NULL;
+
+	for (n = 0; n < buf_size; n++)
+		dst[n] = le32_to_cpu((__force __le32)buf[n]);
+
+	return dst;
+}
+
 static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case *t,
 					 char *desc)
 {
@@ -125,6 +140,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 	const struct xrgb8888_to_rgb332_case *params = test->param_value;
 	size_t dst_size;
 	__u8 *dst = NULL;
+	__u32 *src = NULL;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -138,8 +154,11 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
 
-	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb8888,
-				  &fb, &params->clip);
+	src = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, src);
+
+	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, src, &fb,
+				  &params->clip);
 	KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
 }
 
-- 
2.25.1

