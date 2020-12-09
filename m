Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7812D4422
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4F46EA28;
	Wed,  9 Dec 2020 14:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C966EA28
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71BF3AD0B;
 Wed,  9 Dec 2020 14:25:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 4/8] drm/gem: Create infrastructure for GEM vmap_local
Date: Wed,  9 Dec 2020 15:25:23 +0100
Message-Id: <20201209142527.26415-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
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

This patch adds vmap_local and vunmap_local to struct drm_gem_object_funcs;
including the PRIME helpers to connect with dma-buf's related interfaces.

Besides the generic DRM core, this will become relevant for fbdev emulation
with virtio, so we update it as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem.c              | 28 ++++++++++++++++++
 drivers/gpu/drm/drm_internal.h         |  2 ++
 drivers/gpu/drm/drm_prime.c            | 39 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_prime.c |  2 ++
 include/drm/drm_gem.h                  | 20 +++++++++++++
 include/drm/drm_prime.h                |  2 ++
 6 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 92f89cee213e..6e131d9bb7bd 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1234,6 +1234,34 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
+int drm_gem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	int ret;
+
+	if (!obj->funcs->vmap_local)
+		return -EOPNOTSUPP;
+
+	ret = obj->funcs->vmap_local(obj, map);
+	if (ret)
+		return ret;
+	else if (dma_buf_map_is_null(map))
+		return -ENOMEM;
+
+	return 0;
+}
+
+void drm_gem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	if (dma_buf_map_is_null(map))
+		return;
+
+	if (obj->funcs->vunmap_local)
+		obj->funcs->vunmap_local(obj, map);
+
+	/* Always set the mapping to NULL. Callers may rely on this. */
+	dma_buf_map_clear(map);
+}
+
 /**
  * drm_gem_lock_reservations - Sets up the ww context and acquires
  * the lock on an array of GEM objects.
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 81d386b5b92a..b0bf6aba763a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -190,6 +190,8 @@ int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
+void drm_gem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 683aa29ecd3b..633edea76985 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -695,6 +695,43 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
+/**
+ * drm_gem_dmabuf_vmap_local - dma_buf vmap_local implementation for GEM
+ * @dma_buf: buffer to be mapped
+ * @map: the virtual address of the buffer
+ *
+ * Sets up a kernel virtual mapping. This can be used as the &dma_buf_ops.vmap_local
+ * callback. Calls into &drm_gem_object_funcs.vmap_local for device specific handling.
+ * The kernel virtual address is returned in map.
+ *
+ * Returns:
+ * 0 on success or a negative errno code otherwise.
+ */
+int drm_gem_dmabuf_vmap_local(struct dma_buf *dma_buf, struct dma_buf_map *map)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	return drm_gem_vmap_local(obj, map);
+}
+EXPORT_SYMBOL(drm_gem_dmabuf_vmap_local);
+
+/**
+ * drm_gem_dmabuf_vunmap_local - dma_buf vunmap_local implementation for GEM
+ * @dma_buf: buffer to be unmapped
+ * @map: the virtual address of the buffer
+ *
+ * Releases a kernel virtual mapping. This can be used as the
+ * &dma_buf_ops.vunmap_local callback. Calls into &drm_gem_object_funcs.vunmap_local
+ * for device specific handling.
+ */
+void drm_gem_dmabuf_vunmap_local(struct dma_buf *dma_buf, struct dma_buf_map *map)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	drm_gem_vunmap_local(obj, map);
+}
+EXPORT_SYMBOL(drm_gem_dmabuf_vunmap_local);
+
 /**
  * drm_gem_prime_mmap - PRIME mmap function for GEM drivers
  * @obj: GEM object
@@ -787,6 +824,8 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	.vmap_local = drm_gem_dmabuf_vmap_local,
+	.vunmap_local = drm_gem_dmabuf_vunmap_local,
 };
 
 /**
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 807a27a16365..fea11a53d8fc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -54,6 +54,8 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 		.mmap = drm_gem_dmabuf_mmap,
 		.vmap = drm_gem_dmabuf_vmap,
 		.vunmap = drm_gem_dmabuf_vunmap,
+		.vmap = drm_gem_dmabuf_vmap_local,
+		.vunmap = drm_gem_dmabuf_vunmap_local,
 	},
 	.device_attach = drm_gem_map_attach,
 	.get_uuid = virtgpu_virtio_get_uuid,
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5e6daa1c982f..1281f26de494 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -151,6 +151,26 @@ struct drm_gem_object_funcs {
 	 */
 	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
+	/**
+	 * @vmap_local:
+	 *
+	 * Returns a virtual address for the buffer. Used by the
+	 * drm_gem_dmabuf_vmap_local() helper.
+	 *
+	 * This callback is optional.
+	 */
+	int (*vmap_local)(struct drm_gem_object *obj, struct dma_buf_map *map);
+
+	/**
+	 * @vunmap_local:
+	 *
+	 * Releases the address previously returned by @vmap. Used by the
+	 * drm_gem_dmabuf_vunmap_local() helper.
+	 *
+	 * This callback is optional.
+	 */
+	void (*vunmap_local)(struct drm_gem_object *obj, struct dma_buf_map *map);
+
 	/**
 	 * @mmap:
 	 *
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 54f2c58305d2..fd2aef6966ef 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -85,6 +85,8 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 			   enum dma_data_direction dir);
 int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
 void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
+int drm_gem_dmabuf_vmap_local(struct dma_buf *dma_buf, struct dma_buf_map *map);
+void drm_gem_dmabuf_vunmap_local(struct dma_buf *dma_buf, struct dma_buf_map *map);
 
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
