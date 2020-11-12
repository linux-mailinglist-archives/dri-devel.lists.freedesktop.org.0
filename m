Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32C2B0651
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 14:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFCC6E2A3;
	Thu, 12 Nov 2020 13:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294276E22F;
 Thu, 12 Nov 2020 13:21:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55286AD60;
 Thu, 12 Nov 2020 13:21:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 7/7] drm/radeon: Move radeon_align_pitch() next to its only
 caller
Date: Thu, 12 Nov 2020 14:21:17 +0100
Message-Id: <20201112132117.27228-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112132117.27228-1-tzimmermann@suse.de>
References: <20201112132117.27228-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows to declare the function as static. The tiled parameter is always
false, so it is being removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c   | 24 ------------------------
 drivers/gpu/drm/radeon/radeon_gem.c  | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/radeon/radeon_mode.h |  2 --
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index c687d14a1b93..0b89dd4f4af6 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -30,30 +30,6 @@
 
 #include "radeon.h"
 
-int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp, bool tiled)
-{
-	int aligned = width;
-	int align_large = (ASIC_IS_AVIVO(rdev)) || tiled;
-	int pitch_mask = 0;
-
-	switch (cpp) {
-	case 1:
-		pitch_mask = align_large ? 255 : 127;
-		break;
-	case 2:
-		pitch_mask = align_large ? 127 : 31;
-		break;
-	case 3:
-	case 4:
-		pitch_mask = align_large ? 63 : 15;
-		break;
-	}
-
-	aligned += pitch_mask;
-	aligned &= ~pitch_mask;
-	return aligned * cpp;
-}
-
 void radeon_fbdev_init(struct radeon_device *rdev)
 {
 	struct drm_device *ddev = rdev->ddev;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index eaf7fc9a7b07..e19956c3309f 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -816,6 +816,30 @@ int radeon_gem_op_ioctl(struct drm_device *dev, void *data,
 	return r;
 }
 
+static int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp)
+{
+	int aligned = width;
+	int align_large = ASIC_IS_AVIVO(rdev);
+	int pitch_mask = 0;
+
+	switch (cpp) {
+	case 1:
+		pitch_mask = align_large ? 255 : 127;
+		break;
+	case 2:
+		pitch_mask = align_large ? 127 : 31;
+		break;
+	case 3:
+	case 4:
+		pitch_mask = align_large ? 63 : 15;
+		break;
+	}
+
+	aligned += pitch_mask;
+	aligned &= ~pitch_mask;
+	return aligned * cpp;
+}
+
 int radeon_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args)
@@ -826,7 +850,7 @@ int radeon_mode_dumb_create(struct drm_file *file_priv,
 	int r;
 
 	args->pitch = radeon_align_pitch(rdev, args->width,
-					 DIV_ROUND_UP(args->bpp, 8), 0);
+					 DIV_ROUND_UP(args->bpp, 8));
 	args->size = args->pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 197423ad42c1..50ba2b5edb93 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -982,8 +982,6 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
 
 void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id);
 
-int radeon_align_pitch(struct radeon_device *rdev, int width, int bpp, bool tiled);
-
 /* mst */
 int radeon_dp_mst_init(struct radeon_connector *radeon_connector);
 int radeon_dp_mst_probe(struct radeon_connector *radeon_connector);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
