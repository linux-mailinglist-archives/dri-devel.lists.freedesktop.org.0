Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98111C692
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 08:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B176EC73;
	Thu, 12 Dec 2019 07:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B806EC73
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:41:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86DD6B008;
 Thu, 12 Dec 2019 07:41:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 1/3] drm/vram-helper: Remove interruptible flag from public
 interface
Date: Thu, 12 Dec 2019 08:41:15 +0100
Message-Id: <20191212074117.29283-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212074117.29283-1-tzimmermann@suse.de>
References: <20191212074117.29283-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag 'interruptible', which is passed to various functions,
is always set to be false. Remove it and hard-code the value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/ast/ast_mode.c              |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c       | 17 ++++++-----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c       |  2 +-
 include/drm/drm_gem_vram_helper.h           |  4 +---
 6 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b879bd666e35..26336642dd59 100644
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
index 666cb4c22bb9..4908f1281002 100644
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
 
@@ -485,7 +482,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
  * @dev:		the DRM device
  * @bdev:		the TTM BO device managing the buffer object
  * @pg_align:		the buffer's alignment in multiples of the page size
- * @interruptible:	sleep interruptible if waiting for memory
  * @args:		the arguments as provided to \
 				&struct drm_driver.dumb_create
  *
@@ -502,7 +498,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
 				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
-				  bool interruptible,
 				  struct drm_mode_create_dumb *args)
 {
 	size_t pitch, size;
@@ -517,7 +512,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 	if (!size)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, bdev, size, pg_align, interruptible);
+	gbo = drm_gem_vram_create(dev, bdev, size, pg_align);
 	if (IS_ERR(gbo))
 		return PTR_ERR(gbo);
 
@@ -613,7 +608,7 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 		return -EINVAL;
 
 	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev, 0,
-					     false, args);
+					     args);
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 21b684eab5c9..16f5cd2c1b3b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -58,7 +58,7 @@ int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
 	if (size == 0)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
+	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0);
 	if (IS_ERR(gbo)) {
 		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
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
index 9f4f5f071add..dc125838f5d1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -121,7 +121,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
 		pg_align = PFN_UP(mdev->mc.vram_size);
 
 	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
-					     pg_align, false, args);
+					     pg_align, args);
 }
 
 static struct drm_driver driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 08adaf3695ea..90736427285e 100644
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
@@ -112,7 +111,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
 				  struct ttm_bo_device *bdev,
 				  unsigned long pg_align,
-				  bool interruptible,
 				  struct drm_mode_create_dumb *args);
 
 /*
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
