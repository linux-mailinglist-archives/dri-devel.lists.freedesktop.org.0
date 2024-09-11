Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB997473D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 02:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A610E93C;
	Wed, 11 Sep 2024 00:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Y9VM8EPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E4C10E940
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 00:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5127A41AE3;
 Wed, 11 Sep 2024 02:13:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJrMQT1gu3eY; Wed, 11 Sep 2024 02:13:02 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1726013582; bh=hdt7+HC6BtHhK+jHHNwc4wG89rZaKps0KSw5On+WLWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y9VM8EPQAI1/mQ09KyhAXovM9F4GtCGvBGRSH09CKNLFoiPdU8aRPj61r76IWvIYW
 a44NhzANJ4MWAcs9h4E1EvWuMik9SnMx59th5dUhT9Hd8Jb9h2Kf1LtNh8xIIQ6Wl1
 86p35fLDj4QQb+F99Gl/EYQ3iFNkEDgTS81zHkZYz9rUtpwOOFk/Nfu1T5W8CDlGgI
 HrdY98Uvw7vFrw1ri+W2OOLzCW+dBUumtk/HNyyVnA60GrQZUFMPdX57BtZW6tis0X
 mqj3w2BRD/n6u0QYo6g47xITzL1YSDnV+Q0+A79dq0T8uWj8n0rzg46Dt+p6XFNP+b
 sVD9vzvhJLmGw==
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: [PATCH v4 RESEND 2/9] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Date: Tue, 10 Sep 2024 21:15:27 -0300
Message-ID: <20240911001559.28284-3-gcarlos@disroot.org>
In-Reply-To: <20240911001559.28284-1-gcarlos@disroot.org>
References: <20240911001559.28284-1-gcarlos@disroot.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test case to cover:
1. Invalid flag atribute in the struct drm_mode_fb_cmd2.
2. Pixel format which requires non-linear modifier with
DRM_FORMAT_MOD_LINEAR set.
3. Buffer offset for inexistent plane

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
v2:
  - Remove strcpy to strscpy change.
v3:
  - Rename and commment the "Buffer offset for inexistent plane"
    test case.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 3882a88b6631..3ed987423322 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -21,6 +21,8 @@
 #define MIN_HEIGHT 4
 #define MAX_HEIGHT 4096
 
+#define DRM_MODE_FB_INVALID BIT(2)
+
 struct drm_framebuffer_test {
 	int buffer_created;
 	struct drm_mode_fb_cmd2 cmd;
@@ -85,6 +87,24 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .pitches = { 4 * MAX_WIDTH, 0, 0 },
 	}
 },
+
+/*
+ * All entries in members that represents per-plane values (@modifier, @handles,
+ * @pitches and @offsets) must be zero when unused.
+ */
+{ .buffer_created = 0, .name = "ABGR8888 Buffer offset for inexistent plane",
+	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
+		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, UINT_MAX / 2, 0 },
+		 .pitches = { 4 * MAX_WIDTH, 0, 0 }, .flags = DRM_MODE_FB_MODIFIERS,
+	}
+},
+
+{ .buffer_created = 0, .name = "ABGR8888 Invalid flag",
+	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
+		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, 0, 0 },
+		 .pitches = { 4 * MAX_WIDTH, 0, 0 }, .flags = DRM_MODE_FB_INVALID,
+	}
+},
 { .buffer_created = 1, .name = "ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
 		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, 0, 0 },
@@ -264,6 +284,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
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
-- 
2.44.2

