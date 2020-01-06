Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ABA131267
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 13:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D09489617;
	Mon,  6 Jan 2020 12:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A80882A9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:58:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72023B1B1;
 Mon,  6 Jan 2020 12:58:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v4 6/8] drm/vram-helper: Remove interruptible flag from public
 interface
Date: Mon,  6 Jan 2020 13:57:43 +0100
Message-Id: <20200106125745.13797-7-tzimmermann@suse.de>
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

The flag 'interruptible', which is passed to various functions,
is always set to be false. Remove it and hard-code the value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_mode.c              |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c       | 17 ++++++-----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c       |  2 +-
 include/drm/drm_gem_vram_helper.h           |  4 +---
 6 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cde1cae073ec..43572eb11ae9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1145,7 +1145,7 @@ static int ast_cursor_init(struct drm_device *dev)
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
 		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-					  size, 0, false);
+					  size, 0);
 		if (IS_ERR(gbo)) {
 			ret = PTR_ERR(gbo);
 			goto err_drm_gem_vram_put;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 51ee1f7bc730..bc181c0e9440 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -94,8 +94,7 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 static int drm_gem_vram_init(struct drm_device *dev,
 			     struct ttm_bo_device *bdev,
 			     struct drm_gem_vram_object *gbo,
-			     size_t size, unsigned long pg_align,
-			     bool interruptible)
+			     size_t size, unsigned long pg_align)
 {
 	int ret;
 	size_t acc_size;
@@ -112,7 +111,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
 	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
 
 	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
-			  &gbo->placement, pg_align, interruptible, acc_size,
+			  &gbo->placement, pg_align, false, acc_size,
 			  NULL, NULL, ttm_buffer_object_destroy);
 	if (ret)
 		goto err_drm_gem_object_release;
@@ -130,7 +129,6 @@ static int drm_gem_vram_init(struct drm_device *dev,
  * @bdev:		the TTM BO device backing the object
  * @size:		the buffer size in bytes
  * @pg_align:		the buffer's alignment in multiples of the page size
- * @interruptible:	sleep interruptible if waiting for memory
  *
  * Returns:
  * A new instance of &struct drm_gem_vram_object on success, or
@@ -139,8 +137,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
 struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						struct ttm_bo_device *bdev,
 						size_t size,
-						unsigned long pg_align,
-						bool interruptible)
+						unsigned long pg_align)
 {
 	struct drm_gem_vram_object *gbo;
 	int ret;
@@ -149,7 +146,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	if (!gbo)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align, interruptible);
+	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align);
 	if (ret < 0)
 		goto err_kfree;
 
@@ -486,7 +483,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
  * @bdev:		the TTM BO device managing the buffer object
  * @pg_align:		the buffer's alignment in multiples of the page size
  * @pitch_align:	the scanline's alignment in powers of 2
- * @interruptible:	sleep interruptible if waiting for memory
  * @args:		the arguments as provided to \
 				&struct drm_driver.dumb_create
  *
@@ -504,7 +500,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
 				  unsigned long pitch_align,
-				  bool interruptible,
 				  struct drm_mode_create_dumb *args)
 {
 	size_t pitch, size;
@@ -524,7 +519,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 	if (!size)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, bdev, size, pg_align, interruptible);
+	gbo = drm_gem_vram_create(dev, bdev, size, pg_align);
 	if (IS_ERR(gbo))
 		return PTR_ERR(gbo);
 
@@ -620,7 +615,7 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 		return -EINVAL;
 
 	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
-					     0, 0, false, args);
+					     0, 0, args);
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 0af5d966a480..2f668b71fb4c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -51,7 +51,7 @@ int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 		      struct drm_mode_create_dumb *args)
 {
 	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
-					     0, 16, false, args);
+					     0, 16, args);
 }
 
 const struct drm_mode_config_funcs hibmc_mode_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 5444cf1573a3..dd54fd507e13 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -209,7 +209,7 @@ int mgag200_cursor_init(struct mga_device *mdev)
 
 	for (i = 0; i < ncursors; ++i) {
 		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-					  size, 0, false);
+					  size, 0);
 		if (IS_ERR(gbo)) {
 			ret = PTR_ERR(gbo);
 			goto err_drm_gem_vram_put;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 3473e9e9a20d..613fdc2b4b1e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -121,7 +121,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
 		pg_align = PFN_UP(mdev->mc.vram_size);
 
 	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
-					     pg_align, 0, false, args);
+					     pg_align, 0, args);
 }
 
 static struct drm_driver driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b86d038f8a3d..219474c7d584 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -95,8 +95,7 @@ static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
 struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						struct ttm_bo_device *bdev,
 						size_t size,
-						unsigned long pg_align,
-						bool interruptible);
+						unsigned long pg_align);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
 u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
@@ -113,7 +112,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
 				  unsigned long pitch_align,
-				  bool interruptible,
 				  struct drm_mode_create_dumb *args);
 
 /*
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
