Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D62744D7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5652F6E8A5;
	Tue, 22 Sep 2020 14:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D186F6E89F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:57:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 560F5ACE3;
 Tue, 22 Sep 2020 14:57:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 2/3] drm/vram-helper: Set object function iff they are not
 provided by driver
Date: Tue, 22 Sep 2020 16:56:59 +0200
Message-Id: <20200922145700.25413-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922145700.25413-1-tzimmermann@suse.de>
References: <20200922145700.25413-1-tzimmermann@suse.de>
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

Don't override the GEM object functions unconditionally. If the driver
sets the GEM functions, VRAM helpers will not set them. The idea has been
taken from SHMEM helpers.

v2:
	* updated the commit message (Sam)
	* document the new feature for drm_gem_vram_create()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 9fa7f0ec9308..11315b9e8c03 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -173,6 +173,12 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
  * @size:		the buffer size in bytes
  * @pg_align:		the buffer's alignment in multiples of the page size
  *
+ * GEM objects are allocated by calling struct drm_driver.gem_create_object,
+ * if set. Otherwise kzalloc() will be used. Drivers can set their own GEM
+ * object functions in struct drm_driver.gem_create_object. If no functions
+ * are set, the new GEM object will use the default functions from GEM VRAM
+ * helpers.
+ *
  * Returns:
  * A new instance of &struct drm_gem_vram_object on success, or
  * an ERR_PTR()-encoded error code otherwise.
@@ -182,6 +188,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						unsigned long pg_align)
 {
 	struct drm_gem_vram_object *gbo;
+	struct drm_gem_object *gem;
 	struct drm_vram_mm *vmm = dev->vram_mm;
 	struct ttm_bo_device *bdev;
 	int ret;
@@ -191,8 +198,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	if (dev->driver->gem_create_object) {
-		struct drm_gem_object *gem =
-			dev->driver->gem_create_object(dev, size);
+		gem = dev->driver->gem_create_object(dev, size);
 		if (!gem)
 			return ERR_PTR(-ENOMEM);
 		gbo = drm_gem_vram_of_gem(gem);
@@ -200,11 +206,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
 		if (!gbo)
 			return ERR_PTR(-ENOMEM);
+		gem = &gbo->bo.base;
 	}
 
-	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
+	if (!gem->funcs)
+		gem->funcs = &drm_gem_vram_object_funcs;
 
-	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
+	ret = drm_gem_object_init(dev, gem, size);
 	if (ret) {
 		kfree(gbo);
 		return ERR_PTR(ret);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
