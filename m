Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAFA788CED
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADC310E6C8;
	Fri, 25 Aug 2023 16:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C00610E6C8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E047E40DCA;
 Fri, 25 Aug 2023 18:08:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRJoKbmpQyCu; Fri, 25 Aug 2023 18:08:22 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979701; bh=mgyL1N+7+SyFuNb21Y8CXsSIwHN5ILLjhMJBRnDfwsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=K8Ov8ebuH4pOXlk6oRvSK+EnGs5qrMdoiEfzhZBo8BkSYP0UpDOBawMkN+aD3fvvr
 S9jqY1crsi/YrCZ8SWFpPaDQI1f7RbGyXoF0ys8gTtboODn2MnLQBkVMOCva92T+Sy
 jJj6+35kndgBJg75Q1AB0RiwwYPMWXAL6i/0jbA4L4LUoNlMPrxl7TwPE2b8EwGg+g
 krHWRy2v3YtA55WUKg8CSl45b5qvUHXW80yelAZykyjSVqlj21Ji/xUIHU6J5i9HGL
 NR6w3pn+oSMFxhXpiNs/TTnMM6VIBUW/QRhghYJZNe98kfpOh7418jh//HkUP6urN4
 /+huzZTzmym6g==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Date: Fri, 25 Aug 2023 13:07:17 -0300
Message-ID: <20230825160725.12861-3-gcarlos@disroot.org>
In-Reply-To: <20230825160725.12861-1-gcarlos@disroot.org>
References: <20230825160725.12861-1-gcarlos@disroot.org>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test case to cover:
1. Invalid flag atribute in the struct drm_mode_fb_cmd2.
2. Pixel format which requires non-linear modifier with
DRM_FORMAT_MOD_LINEAR set.
3. Non-zero buffer offset for an unused plane

Also replace strcpy to strscpy on test_to_desc for improved security
and reliability.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 23 +++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 173d42b145ed..aeaf2331f9cc 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -19,6 +19,8 @@
 #define MIN_HEIGHT 4
 #define MAX_HEIGHT 4096
 
+#define DRM_MODE_FB_INVALID BIT(2)
+
 struct drm_framebuffer_test {
 	int buffer_created;
 	struct drm_mode_fb_cmd2 cmd;
@@ -83,6 +85,18 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .pitches = { 4 * MAX_WIDTH, 0, 0 },
 	}
 },
+{ .buffer_created = 0, .name = "ABGR8888 Non-zero buffer offset for unused plane",
+	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
+		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, UINT_MAX / 2, 0 },
+		 .pitches = { 4 * MAX_WIDTH, 0, 0 }, .flags = DRM_MODE_FB_MODIFIERS,
+	}
+},
+{ .buffer_created = 0, .name = "ABGR8888 Invalid flag",
+	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
+		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, 0, 0 },
+		 .pitches = { 4 * MAX_WIDTH, 0, 0 }, .flags = DRM_MODE_FB_INVALID,
+	}
+},
 { .buffer_created = 1, .name = "ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
 		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, 0, 0 },
@@ -262,6 +276,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
+{ .buffer_created = 0, .name = "YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)",
+	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YUV420_10BIT,
+		 .handles = { 1, 0, 0 }, .flags = DRM_MODE_FB_MODIFIERS,
+		 .modifier = { DRM_FORMAT_MOD_LINEAR, 0, 0 },
+		 .pitches = { MAX_WIDTH, 0, 0 },
+	}
+},
 { .buffer_created = 1, .name = "X0L2 Normal sizes",
 	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_X0L2,
 		 .handles = { 1, 0, 0 }, .pitches = { 1200, 0, 0 }
@@ -369,7 +390,7 @@ static void drm_test_framebuffer_create(struct kunit *test)
 
 static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
 {
-	strcpy(desc, t->name);
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
-- 
2.41.0

