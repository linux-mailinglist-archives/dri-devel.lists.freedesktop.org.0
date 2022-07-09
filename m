Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60556C94D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 13:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572A112EB3;
	Sat,  9 Jul 2022 11:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8B4112EB1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:58:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so590128wmb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 04:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=diHVyWaKn6Q/nu2QvOdZ3HTvtDhCo0LX1HleEXdmXqI=;
 b=DWnqE//9FMXAxffjNAXz30EtSW+qp/5vJj2E5W+p4i2W8l/cEecvh8/ar4q095uLXb
 Z8bjLP6cIuNiv0DLgpTYKCYDUhSKds8/BUkC15uc/B3Lw529CuCghyagrtfNDuDoh4ac
 wHVUFnPwK1by1BTZKBN4BN36YfOMpgytcJbZI4ZuHoPy2J8F6+Jq5o1+L8ri62UjXPiu
 rEr+ajtR4MU9c7URWYOU0Vx4/2K4ejgsphClfOVSJLHF2sDDl1qVCyC4u14OxcgEQzli
 bXgLyybpjy3npfKqkLPM629/B/3Re6ZprYhcBJg8WGz/gidLBmnAHkEZRVO/ANW7tsl7
 4V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=diHVyWaKn6Q/nu2QvOdZ3HTvtDhCo0LX1HleEXdmXqI=;
 b=ZagyfW4GMoQWfhTr+QcTJReUVSqwQGS+ot3XvLKGsFBQ6X72WaqJJoRx65elgGddL/
 IoQ/RO7pYR4gDriCOoG4oMnDuKcMvklbrCzukHPnMhHH78yIazobGLbvGcaItsF+82eb
 SQPl5nyC7lQUCpNTdQ/nDPq/btefrkNdsNpHInjBogqDw+nbnZ59YgSWmbWh8+UEIWO9
 WljoLryjjlut7p+DCTLjQ0fsR6GVk+GXQAIMnbyeO8VgjrDT/NGue2IpUxe+I4quW1ub
 QuIOk33lZrXxf/8bgl3jn3v6smNmx9cYzgkcBwS8J5dJzk1j/YCqovl0E9gOdbVLWy+g
 IiGw==
X-Gm-Message-State: AJIora/X7y4SNzy2lLSo2kvw03H63aHPV1iammr40iaIvnnoP7QPIfSg
 E5gimwXxssz1l3SkpH2yafA=
X-Google-Smtp-Source: AGRyM1vVsISrYMEwIKnQOUVlwE02A9wmCavPdKoQTAmON+qapDhbuEkmWNfKWaE4RiRcjz1TIDdG2Q==
X-Received: by 2002:a05:600c:4e07:b0:3a1:8548:4dd7 with SMTP id
 b7-20020a05600c4e0700b003a185484dd7mr5198289wmq.170.1657367926988; 
 Sat, 09 Jul 2022 04:58:46 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.185])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm1199494wrb.102.2022.07.09.04.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 04:58:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 1/4] drm/format-helper: Fix test on big endian architectures
Date: Sat,  9 Jul 2022 13:58:34 +0200
Message-Id: <20220709115837.560877-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709115837.560877-1-jose.exposito89@gmail.com>
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
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
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
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
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 98583bf56044..4d074c2e48bf 100644
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
+	dst = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	if (!dst)
+		return NULL;
+
+	for (n = 0; n < buf_size; n++)
+		dst[n] = le32_to_cpu(buf[n]);
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

