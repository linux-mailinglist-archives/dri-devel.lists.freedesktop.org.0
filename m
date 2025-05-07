Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54EAADBD0
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 11:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AED10E77D;
	Wed,  7 May 2025 09:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="pZA2ID3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC5C10E785
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tjJ5P
 eEsTYRm+wYyLq5v+GtNo38lY0whPyf5kSGjYxo=; b=pZA2ID3av4d+1lya1nqQH
 PD5r6g/Wa7HSC8gc6xX8UZrMQR4JpzuTLWm5z08t3KWoSrWgztwmDBTfGc4rD+Gt
 dNL9YC2jHC860Rlbik299uQ+E2r5WH1oWaNEvp2VElQK+mXbWrQufQ0KZbbYStcb
 myr5yUkjH9+S3ANnkEB+B0=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wCn0Sw2LBtoPOJREw--.58097S2; 
 Wed, 07 May 2025 17:47:36 +0800 (CST)
From: oushixiong1025@163.com
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v3 1/3] drm/shmem-helper: Import dmabuf without mapping its
 sg_table
Date: Wed,  7 May 2025 17:47:26 +0800
Message-Id: <20250507094728.603302-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn0Sw2LBtoPOJREw--.58097S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtryrGFW8Aw17Zr48ArW5KFg_yoWxKr45pF
 sIyryUtrW5tFWqg3s3Awn7Aas8uw409a1xX3yfXw4Y93WktF1q9F1rAr90vFyUAryDJFyf
 tFyDAFyrCryjkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn2-5UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXAZFD2gZ+covnwABsj
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY]
1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
   DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
   sg_table import.
   They only need dma_buf_vmap() to access the shared buffer's
   kernel virtual address.

2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
   trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
   restricts the maximum DMA streaming mapping memory, resulting in
   errors like:

   ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

[HOW]
Provide a gem_prime_import implementation without sg_table mapping
to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
require sg_table can adopt this.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
v1->v2:
        Patch rebase.
v2->v3:
        Rename the import callback function.
        Remove drm_gem_shmem_prime_export() and separate some codes
        to drm_gem_prime_import_self().

 drivers/gpu/drm/drm_gem_shmem_helper.c | 51 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_prime.c            | 46 +++++++++++++++++------
 include/drm/drm_gem_shmem_helper.h     | 15 ++++++++
 include/drm/drm_prime.h                |  3 ++
 4 files changed, 104 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index aa43265f4f4f..85900ec1954a 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -800,6 +800,57 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+/**
+ * drm_gem_shmem_prime_import_no_sgt - Import dmabuf without mapping its sg_table
+ * @dev: Device to import into
+ * @dma_buf: dma-buf object to import
+ *
+ * Drivers that use the shmem helpers but also wants to import dmabuf without
+ * mapping its sg_table can use this as their &drm_driver.gem_prime_import
+ * implementation.
+ */
+struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
+							 struct dma_buf *dma_buf)
+{
+	struct dma_buf_attachment *attach;
+	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *obj;
+	size_t size;
+	int ret;
+
+	obj = drm_gem_prime_import_self(dev, dma_buf);
+	if (obj)
+		return obj;
+
+	attach = dma_buf_attach(dma_buf, dev->dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	size = PAGE_ALIGN(attach->dmabuf->size);
+
+	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
+	if (IS_ERR(shmem)) {
+		ret = PTR_ERR(shmem);
+		goto fail_detach;
+	}
+
+	drm_dbg_prime(dev, "size = %zu\n", size);
+
+	shmem->base.import_attach = attach;
+	shmem->base.resv = dma_buf->resv;
+
+	return &shmem->base;
+
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_sgt);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d828502268b8..1e43b6022329 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -910,6 +910,38 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 }
 EXPORT_SYMBOL(drm_gem_prime_export);
 
+
+/**
+ * drm_gem_prime_import_self - Import a DMA-BUF exported from the same DRM device.
+ * @dev: drm_device to check against
+ * @dma_buf: dma-buf object to import
+ *
+ * This function checks if the DMA-BUF was exported from a GEM object belonging
+ * to @dev. If so, it increments the GEM object's refcount and returns it directly.
+ *
+ * Return: GEM object if it belongs to @dev, NULL otherwise.
+ */
+struct drm_gem_object *drm_gem_prime_import_self(struct drm_device *dev,
+						 struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj;
+
+	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
+		obj = dma_buf->priv;
+		if (obj->dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_gem_prime_import_self);
+
 /**
  * drm_gem_prime_import_dev - core implementation of the import callback
  * @dev: drm_device to import into
@@ -933,17 +965,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret;
 
-	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
-		obj = dma_buf->priv;
-		if (obj->dev == dev) {
-			/*
-			 * Importing dmabuf exported from our own gem increases
-			 * refcount on gem itself instead of f_count of dmabuf.
-			 */
-			drm_gem_object_get(obj);
-			return obj;
-		}
-	}
+	obj = drm_gem_prime_import_self(dev, dma_buf);
+	if (obj)
+		return obj;
 
 	if (!dev->driver->gem_prime_import_sg_table)
 		return ERR_PTR(-EINVAL);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index b4f993da3cae..6e8e907bc43e 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 				    struct sg_table *sgt);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
+struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
+							 struct dma_buf *buf);
 
 /**
  * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
@@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
 	.dumb_create		   = drm_gem_shmem_dumb_create
 
+/**
+ * DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP - shmem GEM operations
+ * 				       without mapping sg_table on
+ * 				       imported buffer.
+ *
+ * This macro provides a shortcut for setting the shmem GEM operations in
+ * the &drm_driver structure for drivers that do not require a sg_table on
+ * imported buffers. Only vmap is supported on imported buffer.
+ */
+#define DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP \
+	.gem_prime_import       = drm_gem_shmem_prime_import_no_sgt, \
+	.dumb_create            = drm_gem_shmem_dumb_create
+
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index fa085c44d4ca..b5179a9cde93 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
 
 /* helper functions for importing */
+struct drm_gem_object *drm_gem_prime_import_self(struct drm_device *dev,
+						 struct dma_buf *dma_buf);
+
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 						struct dma_buf *dma_buf,
 						struct device *attach_dev);
-- 
2.17.1

