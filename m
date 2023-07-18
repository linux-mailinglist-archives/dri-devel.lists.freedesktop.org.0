Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A3758484
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575C410E3BD;
	Tue, 18 Jul 2023 18:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB95210E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8827844EBE;
 Tue, 18 Jul 2023 20:19:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGPZUuehdjiU; Tue, 18 Jul 2023 20:19:39 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689704379; bh=I4/QCtT8EAnJeFazDLXsxNI976Ga8yTSON+a+3kWwz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ieFJV1heZzHbQKZn217Wgf6gkdGQRdoN678YDYNgK9j/7muGzBv5MQx/eMFiKGYIa
 CV82nycmb1w6b0/pPPUbwDhVocpkZtS7AbBl1S8yvC6LKagRTG+Rs6y0KKEtYuPPeH
 OkJebMuGU9EWDBnhlKaGuXrE5TzRXDZETiHQdgK0fbP5Gz1brV+ravXf2FnALLsIsC
 ks1gMkVaME2ZFcPVe3vlpX7cWQdMF+DdxyQOoU022H71BiZLk2HmHMicCEe5r9xUJi
 i0lo6oGtskZOMk5Bk4sMcuw3rFikHigQapdc7AqJO/sORCnZdf/Ah4i0tNL11fOCOS
 VrsnqCPZ1rRiw==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Date: Tue, 18 Jul 2023 15:17:25 -0300
Message-ID: <20230718181726.3799-4-gcarlos@disroot.org>
In-Reply-To: <20230718181726.3799-1-gcarlos@disroot.org>
References: <20230718181726.3799-1-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 mripard@kernel.org, mairacanal@riseup.net,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
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
index ee92120cd8e9..cbab12503f5f 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -20,6 +20,8 @@
 #define MIN_HEIGHT 4
 #define MAX_HEIGHT 4096
 
+#define DRM_MODE_FB_INVALID BIT(2)
+
 struct drm_framebuffer_test {
 	int buffer_created;
 	struct drm_mode_fb_cmd2 cmd;
@@ -84,6 +86,18 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
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
@@ -263,6 +277,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
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
@@ -361,7 +382,7 @@ static void drm_test_framebuffer_create(struct kunit *test)
 
 static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
 {
-	strcpy(desc, t->name);
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
-- 
2.41.0

