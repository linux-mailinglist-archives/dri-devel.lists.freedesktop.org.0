Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE27D5B2B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0551E10E47C;
	Tue, 24 Oct 2023 19:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02010E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5F879408F8;
 Tue, 24 Oct 2023 21:10:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdazFlb28SyP; Tue, 24 Oct 2023 21:10:23 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174623; bh=qNJH4yQCHq9jqsFNiYXxGgJSx73+TQ4kyjBByujZh2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a0UfHn+602CTuno6osT2Rw40I4K3k2jRjqQOvpYutuPfDpty8EAtIFAZN5oO7lLzS
 NbUXyFwS2V3MnpgU7H8YenFEPrUTgnN8YOuIowpiBr+1xBsnXYEOiYRsZKaqK8d9oY
 3y8Vwv+QihEMbuo5od48a7MZmgEjslmDNTuELi+bu+gr30BUF9622xx6q2g8JQgkBg
 s70ElTnUWnL3+cnDpl9YemSYgmalkKE2vloF9vhHuRn3tCL02i5t8VaJknEI5Tjxr+
 v+qyTtxQ5ZfheWNonA16ViC/wtzmSLfUwjODhQTA5kbfUqsF89mb53hgIR6qx+wsPw
 jiGT/LN5Wu3Gw==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/11] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Date: Tue, 24 Oct 2023 16:09:53 -0300
Message-ID: <20231024191002.1620-3-gcarlos@disroot.org>
In-Reply-To: <20231024191002.1620-1-gcarlos@disroot.org>
References: <20231024191002.1620-1-gcarlos@disroot.org>
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
v2:
  - Remove strcpy to strscpy change.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 9c6170edd5f7..659cbd5a3be3 100644
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
@@ -85,6 +87,18 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
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
@@ -264,6 +278,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
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
2.41.0

