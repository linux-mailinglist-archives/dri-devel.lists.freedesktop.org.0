Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085742F5C9B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 09:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585A4893C9;
	Thu, 14 Jan 2021 08:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4413488130
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:49:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D400AABD6;
 Thu, 14 Jan 2021 08:49:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: eric@anholt.net,
	mripard@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vc4: Initialize vc4_drm_driver with CMA helper defaults
Date: Thu, 14 Jan 2021 09:49:49 +0100
Message-Id: <20210114084949.29014-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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

The function vc4_prime_import_sg_table() is an otherwise empty wrapper
around CMA's drm_gem_cma_prime_import_sg_table(). Removing it in favor
of the latter allows to initialize vc4_drm_driver with CMA's initializer
macro.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 14 --------------
 drivers/gpu/drm/vc4/vc4_drv.c |  7 +------
 drivers/gpu/drm/vc4/vc4_drv.h |  3 ---
 3 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 28e48ef2d295..fddaeb0b09c1 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -738,20 +738,6 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 	.vm_ops = &vc4_vm_ops,
 };
 
-struct drm_gem_object *
-vc4_prime_import_sg_table(struct drm_device *dev,
-			  struct dma_buf_attachment *attach,
-			  struct sg_table *sgt)
-{
-	struct drm_gem_object *obj;
-
-	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
-	if (IS_ERR(obj))
-		return obj;
-
-	return obj;
-}
-
 static int vc4_grab_bin_bo(struct vc4_dev *vc4, struct vc4_file *vc4file)
 {
 	int ret;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index d9b3bba7f2b7..556ad0f02a0d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -180,12 +180,7 @@ static struct drm_driver vc4_drm_driver = {
 
 	.gem_create_object = vc4_create_object,
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_import_sg_table = vc4_prime_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
-
-	.dumb_create = vc4_dumb_create,
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_dumb_create),
 
 	.ioctls = vc4_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(vc4_drm_ioctls),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 0d9c0ecc4769..a7500716cf3f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -801,9 +801,6 @@ int vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file_priv);
 int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
-struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
-						 struct dma_buf_attachment *attach,
-						 struct sg_table *sgt);
 int vc4_bo_cache_init(struct drm_device *dev);
 int vc4_bo_inc_usecnt(struct vc4_bo *bo);
 void vc4_bo_dec_usecnt(struct vc4_bo *bo);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
