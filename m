Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D316F926727
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEECF10E95A;
	Wed,  3 Jul 2024 17:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="F0pBHuk3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B2910E94F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:30:22 +0000 (UTC)
X-Virus-Scanned: SPAM Filter at disroot.org
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720027265; bh=xWhhT0PIpYdUYnVVPcuw6cE/PMXrJBxbisiuTpAxlE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=F0pBHuk3ZSr0NX17Xo3XztlLiveFn6X/0/iHTp8UXZ9DTVtc7B6+NQgqellKN6/Os
 YEy3cYj8ksYvKOsmxWn+21NqEFi9HPD9ynjJIDF92yMNl9mx0PqDtXuy3FqmwrdN8q
 grvXdM6FTQlkDBwS8E0ebC1/Tz+iwgW0rXiRgxypBUoWlO7tWHq2TiUI4849OMV2Ri
 rXrmxnVAa+nWuXrfSMUmbZE1M7OBmx3y3gJgN1zZnPMlhCXP46UQvUGWoSslxKKUsP
 4sOpSy98gvsP7LkkgLqwMzc/Fow40YIAMpVbaaVvGLvdE3qBQvE08rH4DTIozic2IK
 c05soHWOgBcIw==
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
Subject: [PATCH v3 2/9] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Date: Wed,  3 Jul 2024 14:22:21 -0300
Message-ID: <20240703172228.11166-3-gcarlos@disroot.org>
In-Reply-To: <20240703172228.11166-1-gcarlos@disroot.org>
References: <20240703172228.11166-1-gcarlos@disroot.org>
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

