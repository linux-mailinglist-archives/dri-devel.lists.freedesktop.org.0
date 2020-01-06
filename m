Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4EE1310A8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50B89C03;
	Mon,  6 Jan 2020 10:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA9489A76
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:36:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20943AFAF;
 Mon,  6 Jan 2020 10:36:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v3 2/3] drm/vram-helper: Remove BO device from public interface
Date: Mon,  6 Jan 2020 11:36:45 +0100
Message-Id: <20200106103646.13077-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106103646.13077-1-tzimmermann@suse.de>
References: <20200106103646.13077-1-tzimmermann@suse.de>
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

TTM is an implementation detail of the VRAM helpers and therefore
shouldn't be exposed to the callers. There's only one correct value
for the BO device anyway, which is the one stored in the DRM device.

So remove struct ttm_bo_device from the VRAM-helper interface and
use the device's VRAM manager unconditionally. The GEM initializer
function fails if the VRAM manager has not been initialized.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_mode.c              |  3 +--
 drivers/gpu/drm/drm_gem_vram_helper.c       | 21 +++++++++------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c    |  3 +--
 drivers/gpu/drm/mgag200/mgag200_drv.c       |  3 +--
 include/drm/drm_gem_vram_helper.h           |  2 --
 6 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 43572eb11ae9..34608f0499eb 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1144,8 +1144,7 @@ static int ast_cursor_init(struct drm_device *dev)
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-					  size, 0);
+		gbo = drm_gem_vram_create(dev, size, 0);
 		if (IS_ERR(gbo)) {
 			ret = PTR_ERR(gbo);
 			goto err_drm_gem_vram_put;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 4908f1281002..b760fd27f3c0 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -92,13 +92,18 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 }
 
 static int drm_gem_vram_init(struct drm_device *dev,
-			     struct ttm_bo_device *bdev,
 			     struct drm_gem_vram_object *gbo,
 			     size_t size, unsigned long pg_align)
 {
+	struct drm_vram_mm *vmm = dev->vram_mm;
+	struct ttm_bo_device *bdev;
 	int ret;
 	size_t acc_size;
 
+	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
+		return -EINVAL;
+	bdev = &vmm->bdev;
+
 	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
 
 	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
@@ -126,7 +131,6 @@ static int drm_gem_vram_init(struct drm_device *dev,
 /**
  * drm_gem_vram_create() - Creates a VRAM-backed GEM object
  * @dev:		the DRM device
- * @bdev:		the TTM BO device backing the object
  * @size:		the buffer size in bytes
  * @pg_align:		the buffer's alignment in multiples of the page size
  *
@@ -135,7 +139,6 @@ static int drm_gem_vram_init(struct drm_device *dev,
  * an ERR_PTR()-encoded error code otherwise.
  */
 struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
-						struct ttm_bo_device *bdev,
 						size_t size,
 						unsigned long pg_align)
 {
@@ -146,7 +149,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	if (!gbo)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align);
+	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
 	if (ret < 0)
 		goto err_kfree;
 
@@ -480,7 +483,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
 	Helper for implementing &struct drm_driver.dumb_create
  * @file:		the DRM file
  * @dev:		the DRM device
- * @bdev:		the TTM BO device managing the buffer object
  * @pg_align:		the buffer's alignment in multiples of the page size
  * @args:		the arguments as provided to \
 				&struct drm_driver.dumb_create
@@ -496,7 +498,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
  */
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
-				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
 				  struct drm_mode_create_dumb *args)
 {
@@ -512,7 +513,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 	if (!size)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, bdev, size, pg_align);
+	gbo = drm_gem_vram_create(dev, size, pg_align);
 	if (IS_ERR(gbo))
 		return PTR_ERR(gbo);
 
@@ -604,11 +605,7 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 				    struct drm_device *dev,
 				    struct drm_mode_create_dumb *args)
 {
-	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
-		return -EINVAL;
-
-	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev, 0,
-					     args);
+	return drm_gem_vram_fill_create_dumb(file, dev, 0, args);
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 16f5cd2c1b3b..4a5bde80045a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -58,7 +58,7 @@ int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
 	if (size == 0)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0);
+	gbo = drm_gem_vram_create(dev, size, 0);
 	if (IS_ERR(gbo)) {
 		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index dd54fd507e13..d491edd317ff 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -208,8 +208,7 @@ int mgag200_cursor_init(struct mga_device *mdev)
 		return -ENOMEM;
 
 	for (i = 0; i < ncursors; ++i) {
-		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-					  size, 0);
+		gbo = drm_gem_vram_create(dev, size, 0);
 		if (IS_ERR(gbo)) {
 			ret = PTR_ERR(gbo);
 			goto err_drm_gem_vram_put;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index dc125838f5d1..1b5b60da2e62 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -120,8 +120,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
 	if (mgag200_pin_bo_at_0(mdev))
 		pg_align = PFN_UP(mdev->mc.vram_size);
 
-	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
-					     pg_align, args);
+	return drm_gem_vram_fill_create_dumb(file, dev, pg_align, args);
 }
 
 static struct drm_driver driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 90736427285e..9341f54383b3 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -93,7 +93,6 @@ static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
 }
 
 struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
-						struct ttm_bo_device *bdev,
 						size_t size,
 						unsigned long pg_align);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
@@ -109,7 +108,6 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
 
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
-				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
 				  struct drm_mode_create_dumb *args);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
