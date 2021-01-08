Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8DB2EEFE4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 10:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E726E7FE;
	Fri,  8 Jan 2021 09:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF17B6E7EC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:43:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65BF9AFA7;
 Fri,  8 Jan 2021 09:43:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 sam@ravnborg.org
Subject: [PATCH v4 04/13] drm/shmem-helper: Provide a vmap function for
 short-term mappings
Date: Fri,  8 Jan 2021 10:43:31 +0100
Message-Id: <20210108094340.15290-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implementations of the vmap/vunmap GEM callbacks may perform pinning
of the BO and may acquire the associated reservation object's lock.
Callers that only require a mapping of the contained memory can thus
interfere with other tasks that require exact pinning, such as scanout.
This is less of an issue with private SHMEM buffers, but may happen
with imported ones.

Therefore provide the new interfaces drm_gem_shmem_vmap_local() and
drm_gem_shmem_vunmap_local(), which only perform the vmap/vunmap
operations. Callers have to hold the reservation lock while the mapping
persists.

This patch also connects GEM SHMEM helpers to GEM object functions with
equivalent functionality.

v4:
	* call dma_buf_{vmap,vunmap}_local() where necessary (Daniel)
	* move driver changes into separate patches (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 90 +++++++++++++++++++++++---
 include/drm/drm_gem_shmem_helper.h     |  2 +
 2 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 9825c378dfa6..298832b2b43b 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -32,6 +32,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.get_sg_table = drm_gem_shmem_get_sg_table,
 	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
+	.vmap_local = drm_gem_shmem_vmap_local,
+	.vunmap_local = drm_gem_shmem_vunmap_local,
 	.mmap = drm_gem_shmem_mmap,
 };
 
@@ -261,7 +263,8 @@ void drm_gem_shmem_unpin(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
-static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
+static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map,
+				     bool local)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
@@ -272,7 +275,10 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
 	}
 
 	if (obj->import_attach) {
-		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
+		if (local)
+			ret = dma_buf_vmap_local(obj->import_attach->dmabuf, map);
+		else
+			ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
 			if (WARN_ON(map->is_iomem)) {
 				ret = -EIO;
@@ -313,7 +319,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
 	return ret;
 }
 
-/*
+/**
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
@@ -339,15 +345,53 @@ int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	ret = mutex_lock_interruptible(&shmem->vmap_lock);
 	if (ret)
 		return ret;
-	ret = drm_gem_shmem_vmap_locked(shmem, map);
+	ret = drm_gem_shmem_vmap_locked(shmem, map, false);
 	mutex_unlock(&shmem->vmap_lock);
 
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
+/**
+ * drm_gem_shmem_vmap_local - Create a virtual mapping for a shmem GEM object
+ * @shmem: shmem GEM object
+ * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
+ *       store.
+ *
+ * This function makes sure that a contiguous kernel virtual address mapping
+ * exists for the buffer backing the shmem GEM object.
+ *
+ * The function is called with the BO's reservation object locked. Callers must
+ * hold the lock until after unmapping the buffer.
+ *
+ * This function can be used to implement &drm_gem_object_funcs.vmap_local. But
+ * it can also be called by drivers directly, in which case it will hide the
+ * differences between dma-buf imported and natively allocated objects.
+ *
+ * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap_local().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int ret;
+
+	dma_resv_assert_held(obj->resv);
+
+	ret = mutex_lock_interruptible(&shmem->vmap_lock);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_vmap_locked(shmem, map, true);
+	mutex_unlock(&shmem->vmap_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_shmem_vmap_local);
+
 static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
-					struct dma_buf_map *map)
+					struct dma_buf_map *map, bool local)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -358,7 +402,10 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 		return;
 
 	if (obj->import_attach)
-		dma_buf_vunmap(obj->import_attach->dmabuf, map);
+		if (local)
+			dma_buf_vunmap_local(obj->import_attach->dmabuf, map);
+		else
+			dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	else
 		vunmap(shmem->vaddr);
 
@@ -366,7 +413,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 	drm_gem_shmem_put_pages(shmem);
 }
 
-/*
+/**
  * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Kernel virtual address where the SHMEM GEM object was mapped
@@ -384,11 +431,38 @@ void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	mutex_lock(&shmem->vmap_lock);
-	drm_gem_shmem_vunmap_locked(shmem, map);
+	drm_gem_shmem_vunmap_locked(shmem, map, false);
 	mutex_unlock(&shmem->vmap_lock);
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
+/**
+ * drm_gem_shmem_vunmap_local - Unmap a virtual mapping fo a shmem GEM object
+ * @shmem: shmem GEM object
+ * @map: Kernel virtual address where the SHMEM GEM object was mapped
+ *
+ * This function cleans up a kernel virtual address mapping acquired by
+ * drm_gem_shmem_vmap_local(). The mapping is only removed when the use count
+ * drops to zero.
+ *
+ * The function is called with the BO's reservation object locked.
+ *
+ * This function can be used to implement &drm_gem_object_funcs.vmap_local.
+ * But it can also be called by drivers directly, in which case it will hide
+ * the differences between dma-buf imported and natively allocated objects.
+ */
+void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	dma_resv_assert_held(obj->resv);
+
+	mutex_lock(&shmem->vmap_lock);
+	drm_gem_shmem_vunmap_locked(shmem, map, true);
+	mutex_unlock(&shmem->vmap_lock);
+}
+EXPORT_SYMBOL(drm_gem_shmem_vunmap_local);
+
 struct drm_gem_shmem_object *
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 434328d8a0d9..3f59bdf749aa 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -114,7 +114,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_object *obj);
 void drm_gem_shmem_unpin(struct drm_gem_object *obj);
 int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
