Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DC13126A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 13:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2386E2A3;
	Mon,  6 Jan 2020 12:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132D882A9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:58:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51620AF93;
 Mon,  6 Jan 2020 12:58:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v4 3/8] drm/vram: Support scanline alignment for dumb buffers
Date: Mon,  6 Jan 2020 13:57:40 +0100
Message-Id: <20200106125745.13797-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106125745.13797-1-tzimmermann@suse.de>
References: <20200106125745.13797-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding the pitch alignment as an argument to drm_gem_vram_fill_create_dumb()
allows to align scanlines to certain offsets. A value of 0 disables scanline
pitches.

v3:
	* only do power-of-2 test if pitch_align given; fails otherwise
	* mgag200: call drm_gem_vram_fill_create_dumb() with pitch_align
v2:
	* split of patch from related hibmc changes
	* test if scanline pitch is power of 2

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 13 ++++++++++---
 drivers/gpu/drm/mgag200/mgag200_drv.c |  2 +-
 include/drm/drm_gem_vram_helper.h     |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 666cb4c22bb9..51ee1f7bc730 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -485,6 +485,7 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
  * @dev:		the DRM device
  * @bdev:		the TTM BO device managing the buffer object
  * @pg_align:		the buffer's alignment in multiples of the page size
+ * @pitch_align:	the scanline's alignment in powers of 2
  * @interruptible:	sleep interruptible if waiting for memory
  * @args:		the arguments as provided to \
 				&struct drm_driver.dumb_create
@@ -502,6 +503,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
 				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
+				  unsigned long pitch_align,
 				  bool interruptible,
 				  struct drm_mode_create_dumb *args)
 {
@@ -510,7 +512,12 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 	int ret;
 	u32 handle;
 
-	pitch = args->width * ((args->bpp + 7) / 8);
+	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
+	if (pitch_align) {
+		if (WARN_ON_ONCE(!is_power_of_2(pitch_align)))
+			return -EINVAL;
+		pitch = ALIGN(pitch, pitch_align);
+	}
 	size = pitch * args->height;
 
 	size = roundup(size, PAGE_SIZE);
@@ -612,8 +619,8 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
 		return -EINVAL;
 
-	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev, 0,
-					     false, args);
+	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
+					     0, 0, false, args);
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 9f4f5f071add..3473e9e9a20d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -121,7 +121,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
 		pg_align = PFN_UP(mdev->mc.vram_size);
 
 	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
-					     pg_align, false, args);
+					     pg_align, 0, false, args);
 }
 
 static struct drm_driver driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 08adaf3695ea..b86d038f8a3d 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -112,6 +112,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
 				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
+				  unsigned long pitch_align,
 				  bool interruptible,
 				  struct drm_mode_create_dumb *args);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
