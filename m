Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25D321723
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 13:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABDB6E4EA;
	Mon, 22 Feb 2021 12:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D556E4E3;
 Mon, 22 Feb 2021 12:43:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C3B4B114;
 Mon, 22 Feb 2021 12:43:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, eric@anholt.net, sumit.semwal@linaro.org,
 christian.koenig@amd.com, stern@rowland.harvard.edu
Subject: [PATCH v2 2/3] drm/shmem-helper: Implement struct
 drm_driver.gem_prime_create_object
Date: Mon, 22 Feb 2021 13:43:27 +0100
Message-Id: <20210222124328.27340-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222124328.27340-1-tzimmermann@suse.de>
References: <20210222124328.27340-1-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moves the scatter/gather-table setup from PRIME helpers into SHMEM
helpers. USB-based drivers don't support DMA, so make the sg table
optional. This cleans up rsp code in udl and gm12u320.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 +++++++++++++++++--------
 drivers/gpu/drm/lima/lima_drv.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  6 ++--
 drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +--
 drivers/gpu/drm/tiny/gm12u320.c         |  7 -----
 drivers/gpu/drm/udl/udl_drv.c           |  7 -----
 drivers/gpu/drm/v3d/v3d_bo.c            |  6 ++--
 drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
 drivers/gpu/drm/v3d/v3d_drv.h           |  5 ++--
 include/drm/drm_gem_shmem_helper.h      |  6 ++--
 11 files changed, 38 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index c8a6547a1757..d11154ec0db5 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -711,36 +711,50 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
 
 /**
- * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from
- *                 another driver's scatter/gather table of pinned pages
+ * drm_gem_shmem_prime_create_object - Produce a shmem GEM object from
+ *                 another driver's DMA-BUF attachment
  * @dev: Device to import into
  * @attach: DMA-BUF attachment
- * @sgt: Scatter/gather table of pinned pages
  *
- * This function imports a scatter/gather table exported via DMA-BUF by
- * another driver. Drivers that use the shmem helpers should set this as their
- * &drm_driver.gem_prime_import_sg_table callback.
+ * This function imports a DMA-BUF attachment exported by another driver.
+ * If supported, it sets a scatter/gather table of pinned pages. Drivers
+ * that use the shmem helpers should set this as their
+ * &drm_driver.gem_prime_create_object callback.
  *
  * Returns:
  * A pointer to a newly created GEM object or an ERR_PTR-encoded negative
  * error code on failure.
  */
 struct drm_gem_object *
-drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
-				    struct dma_buf_attachment *attach,
-				    struct sg_table *sgt)
+drm_gem_shmem_prime_create_object(struct drm_device *dev,
+				  struct dma_buf_attachment *attach)
 {
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
+	struct sg_table *sgt = NULL;
 	struct drm_gem_shmem_object *shmem;
+	int ret;
+
+	if (dev->dev->dma_mask) {
+		sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+		if (IS_ERR(sgt))
+			return ERR_CAST(sgt);
+	}
 
 	shmem = __drm_gem_shmem_create(dev, size, true);
-	if (IS_ERR(shmem))
-		return ERR_CAST(shmem);
+	if (IS_ERR(shmem)) {
+		ret = PTR_ERR(shmem);
+		goto err;
+	}
 
 	shmem->sgt = sgt;
 
 	DRM_DEBUG_PRIME("size = %zu\n", size);
 
 	return &shmem->base;
+
+err:
+	if (sgt)
+		dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_create_object);
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 7b8d7178d09a..c8090289ecc7 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -277,8 +277,8 @@ static const struct drm_driver lima_drm_driver = {
 
 	.gem_create_object  = lima_gem_create_object,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.gem_prime_create_object = drm_gem_shmem_prime_create_object,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 83a461bdeea8..8c0979e1926e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -564,7 +564,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.gem_create_object	= panfrost_gem_create_object,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
+	.gem_prime_create_object = panfrost_gem_prime_create_object,
 	.gem_prime_mmap		= drm_gem_prime_mmap,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 3e0723bc36bd..69bb70180ac1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -269,14 +269,12 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 }
 
 struct drm_gem_object *
-panfrost_gem_prime_import_sg_table(struct drm_device *dev,
-				   struct dma_buf_attachment *attach,
-				   struct sg_table *sgt)
+panfrost_gem_prime_create_object(struct drm_device *dev, struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj;
 	struct panfrost_gem_object *bo;
 
-	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	obj = drm_gem_shmem_prime_create_object(dev, attach);
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8088d5fd8480..37b8cb4c6626 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -64,9 +64,7 @@ drm_mm_node_to_panfrost_mapping(struct drm_mm_node *node)
 struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size);
 
 struct drm_gem_object *
-panfrost_gem_prime_import_sg_table(struct drm_device *dev,
-				   struct dma_buf_attachment *attach,
-				   struct sg_table *sgt);
+panfrost_gem_prime_create_object(struct drm_device *dev, struct dma_buf_attachment *attach);
 
 struct panfrost_gem_object *
 panfrost_gem_create_with_handle(struct drm_file *file_priv,
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 9f13a7c7c2da..0b4f4f2af1ef 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -601,12 +601,6 @@ static const uint64_t gm12u320_pipe_modifiers[] = {
 
 DEFINE_DRM_GEM_FOPS(gm12u320_fops);
 
-static struct drm_gem_object *gm12u320_gem_prime_create_object(struct drm_device *dev,
-							       struct dma_buf_attachment *attach)
-{
-	return drm_gem_shmem_prime_import_sg_table(dev, attach, NULL);
-}
-
 static const struct drm_driver gm12u320_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
@@ -618,7 +612,6 @@ static const struct drm_driver gm12u320_drm_driver = {
 
 	.fops		 = &gm12u320_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_create_object = gm12u320_gem_prime_create_object,
 };
 
 static const struct drm_mode_config_funcs gm12u320_mode_config_funcs = {
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index fdf37b44a956..9269092697d8 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -34,19 +34,12 @@ static int udl_usb_resume(struct usb_interface *interface)
 
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 
-static struct drm_gem_object *udl_gem_prime_create_object(struct drm_device *dev,
-							  struct dma_buf_attachment *attach)
-{
-	return drm_gem_shmem_prime_import_sg_table(dev, attach, NULL);
-}
-
 static const struct drm_driver driver = {
 	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_create_object = udl_gem_prime_create_object,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 6a8731ab9d7d..37f65cb44703 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -146,14 +146,12 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 }
 
 struct drm_gem_object *
-v3d_prime_import_sg_table(struct drm_device *dev,
-			  struct dma_buf_attachment *attach,
-			  struct sg_table *sgt)
+v3d_prime_create_object(struct drm_device *dev, struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj;
 	int ret;
 
-	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	obj = drm_gem_shmem_prime_create_object(dev, attach);
 	if (IS_ERR(obj))
 		return obj;
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 99e22beea90b..72d50e240726 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -173,7 +173,7 @@ static const struct drm_driver v3d_drm_driver = {
 	.gem_create_object = v3d_create_object,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_import_sg_table = v3d_prime_import_sg_table,
+	.gem_prime_create_object = v3d_prime_create_object,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.ioctls = v3d_drm_ioctls,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 8a390738d65b..6e4f3eb0b9fc 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -310,9 +310,8 @@ int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv);
 int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv);
-struct drm_gem_object *v3d_prime_import_sg_table(struct drm_device *dev,
-						 struct dma_buf_attachment *attach,
-						 struct sg_table *sgt);
+struct drm_gem_object *v3d_prime_create_object(struct drm_device *dev,
+					       struct dma_buf_attachment *attach);
 
 /* v3d_debugfs.c */
 void v3d_debugfs_init(struct drm_minor *minor);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 434328d8a0d9..837f3b5a83af 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -143,9 +143,7 @@ void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int indent,
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *
-drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
-				    struct dma_buf_attachment *attach,
-				    struct sg_table *sgt);
+drm_gem_shmem_prime_create_object(struct drm_device *dev, struct dma_buf_attachment *attach);
 
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj);
 
@@ -158,7 +156,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj);
 #define DRM_GEM_SHMEM_DRIVER_OPS \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
+	.gem_prime_create_object = drm_gem_shmem_prime_create_object, \
 	.gem_prime_mmap		= drm_gem_prime_mmap, \
 	.dumb_create		= drm_gem_shmem_dumb_create
 
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
