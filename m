Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9259F7AE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034110ECF8;
	Wed, 24 Aug 2022 10:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A111291E;
 Wed, 24 Aug 2022 10:24:13 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 564056601E8A;
 Wed, 24 Aug 2022 11:23:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661336633;
 bh=TRyyyxIrRrrl6vk4RzRY/ZwmQkxFY8SkgMCVheNpEjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e+SVJdW7J00EFi42WxtrwwDoq/fGTchyUuujQpnw5/nOLkG5VG1k8kj7gG444HtVx
 jUzovXmdG23TRcnW6YwDGQ3lYGnmEM48LnJPSCSYe5gTFMWgbjXBURYKOBnj8N/zfq
 CgnJqsvuPjqqWDNhMeYLmOjF+8qUHvJ0xpyGNTZj+AGC5CV17gx1DyFoNiBI10899t
 +Ti61haTbFwvSXzOxb/Cy2OqnKTYfuSERTGnUYT+AuIlfSJ1vJ8fCP5dV3llWoiEE4
 OZrqFmstz1L80KD5qRE7jRVFWu0DdroD3hyNIO1ue5QqPLkLJETZJqhv/9hfoeywK+
 BIg3hD9uSyafQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
Subject: [PATCH v3 6/9] dma-buf: Move dma-buf attachment to dynamic locking
 specification
Date: Wed, 24 Aug 2022 13:22:45 +0300
Message-Id: <20220824102248.91964-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move dma-buf attachment API functions to the dynamic locking specification.
The strict locking convention prevents deadlock situations for dma-buf
importers and exporters.

Previously, the "unlocked" versions of the attachment API functions
weren't taking the reservation lock and this patch makes them to take
the lock.

Intel and AMD GPU drivers already were mapping the attached dma-bufs under
the held lock during attachment, hence these drivers are updated to use
the locked functions.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c                  | 115 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  12 +++
 include/linux/dma-buf.h                    |  20 ++--
 5 files changed, 110 insertions(+), 49 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 4556a12bd741..f2a5a122da4a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -559,7 +559,7 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
  * 2. Userspace passes this file-descriptors to all drivers it wants this buffer
  *    to share with: First the file descriptor is converted to a &dma_buf using
  *    dma_buf_get(). Then the buffer is attached to the device using
- *    dma_buf_attach().
+ *    dma_buf_attach_unlocked().
  *
  *    Up to this stage the exporter is still free to migrate or reallocate the
  *    backing storage.
@@ -569,8 +569,8 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
  *    dma_buf_map_attachment() and dma_buf_unmap_attachment().
  *
  * 4. Once a driver is done with a shared buffer it needs to call
- *    dma_buf_detach() (after cleaning up any mappings) and then release the
- *    reference acquired with dma_buf_get() by calling dma_buf_put().
+ *    dma_buf_detach_unlocked() (after cleaning up any mappings) and then
+ *    release the reference acquired with dma_buf_get() by calling dma_buf_put().
  *
  * For the detailed semantics exporters are expected to implement see
  * &dma_buf_ops.
@@ -802,7 +802,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  * @importer_priv:	[in]	importer private pointer for the attachment
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
- * must be cleaned up by calling dma_buf_detach().
+ * must be cleaned up by calling dma_buf_detach_unlocked().
  *
  * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
  * functionality.
@@ -858,8 +858,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 	    dma_buf_is_dynamic(dmabuf)) {
 		struct sg_table *sgt;
 
+		dma_resv_lock(attach->dmabuf->resv, NULL);
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
-			dma_resv_lock(attach->dmabuf->resv, NULL);
 			ret = dmabuf->ops->pin(attach);
 			if (ret)
 				goto err_unlock;
@@ -872,8 +872,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 			ret = PTR_ERR(sgt);
 			goto err_unpin;
 		}
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dma_resv_unlock(attach->dmabuf->resv);
+		dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt = sgt;
 		attach->dir = DMA_BIDIRECTIONAL;
 	}
@@ -889,8 +888,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 		dmabuf->ops->unpin(attach);
 
 err_unlock:
-	if (dma_buf_is_dynamic(attach->dmabuf))
-		dma_resv_unlock(attach->dmabuf->resv);
+	dma_resv_unlock(attach->dmabuf->resv);
 
 	dma_buf_detach_unlocked(dmabuf, attach);
 	return ERR_PTR(ret);
@@ -927,7 +925,7 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
  * @dmabuf:	[in]	buffer to detach from.
  * @attach:	[in]	attachment to be detached; is free'd after this call.
  *
- * Clean up a device attachment obtained by calling dma_buf_attach().
+ * Clean up a device attachment obtained by calling dma_buf_attach_unlocked().
  *
  * Optionally this calls &dma_buf_ops.detach for device-specific detach.
  */
@@ -937,21 +935,19 @@ void dma_buf_detach_unlocked(struct dma_buf *dmabuf,
 	if (WARN_ON(!dmabuf || !attach))
 		return;
 
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+
 	if (attach->sgt) {
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dma_resv_lock(attach->dmabuf->resv, NULL);
 
 		__unmap_dma_buf(attach, attach->sgt, attach->dir);
 
-		if (dma_buf_is_dynamic(attach->dmabuf)) {
+		if (dma_buf_is_dynamic(attach->dmabuf))
 			dmabuf->ops->unpin(attach);
-			dma_resv_unlock(attach->dmabuf->resv);
-		}
 	}
-
-	dma_resv_lock(dmabuf->resv, NULL);
 	list_del(&attach->node);
+
 	dma_resv_unlock(dmabuf->resv);
+
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
@@ -1011,7 +1007,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
 EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
 
 /**
- * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
+ * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
  * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
  * dma_buf_ops.
  * @attach:	[in]	attachment whose scatterlist is to be returned
@@ -1030,10 +1026,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
  *
  * Important: Dynamic importers must wait for the exclusive fence of the struct
  * dma_resv attached to the DMA-BUF first.
+ *
+ * Importer is responsible for holding dmabuf's reservation lock.
  */
-struct sg_table *
-dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
-				enum dma_data_direction direction)
+struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
+					enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
 	int r;
@@ -1043,8 +1040,7 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 	if (WARN_ON(!attach || !attach->dmabuf))
 		return ERR_PTR(-EINVAL);
 
-	if (dma_buf_attachment_is_dynamic(attach))
-		dma_resv_assert_held(attach->dmabuf->resv);
+	dma_resv_assert_held(attach->dmabuf->resv);
 
 	if (attach->sgt) {
 		/*
@@ -1059,7 +1055,6 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 	}
 
 	if (dma_buf_is_dynamic(attach->dmabuf)) {
-		dma_resv_assert_held(attach->dmabuf->resv);
 		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
 			r = attach->dmabuf->ops->pin(attach);
 			if (r)
@@ -1099,10 +1094,38 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
 }
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
+
+/**
+ * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
+ * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
+ * dma_buf_ops.
+ * @attach:	[in]	attachment whose scatterlist is to be returned
+ * @direction:	[in]	direction of DMA transfer
+ *
+ * Unlocked variant of dma_buf_map_attachment().
+ */
+struct sg_table *
+dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				enum dma_data_direction direction)
+{
+	struct sg_table *sg_table;
+
+	might_sleep();
+
+	if (WARN_ON(!attach || !attach->dmabuf))
+		return ERR_PTR(-EINVAL);
+
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+	sg_table = dma_buf_map_attachment(attach, direction);
+	dma_resv_unlock(attach->dmabuf->resv);
+
+	return sg_table;
+}
 EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
 
 /**
- * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
+ * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
  * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
  * dma_buf_ops.
  * @attach:	[in]	attachment to unmap buffer from
@@ -1110,31 +1133,51 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
  * @direction:  [in]    direction of DMA transfer
  *
  * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
+ *
+ * Importer is responsible for holding dmabuf's reservation lock.
  */
-void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
-				       struct sg_table *sg_table,
-				       enum dma_data_direction direction)
+void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
+			      struct sg_table *sg_table,
+			      enum dma_data_direction direction)
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
-		return;
-
-	if (dma_buf_attachment_is_dynamic(attach))
-		dma_resv_assert_held(attach->dmabuf->resv);
+	dma_resv_assert_held(attach->dmabuf->resv);
 
 	if (attach->sgt == sg_table)
 		return;
 
-	if (dma_buf_is_dynamic(attach->dmabuf))
-		dma_resv_assert_held(attach->dmabuf->resv);
-
 	__unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
 }
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
+
+/**
+ * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
+ * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
+ * dma_buf_ops.
+ * @attach:	[in]	attachment to unmap buffer from
+ * @sg_table:	[in]	scatterlist info of the buffer to unmap
+ * @direction:	[in]	direction of DMA transfer
+ *
+ * Unlocked variant of dma_buf_unmap_attachment().
+ */
+void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+				       struct sg_table *sg_table,
+				       enum dma_data_direction direction)
+{
+	might_sleep();
+
+	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+		return;
+
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+	dma_buf_unmap_attachment(attach, sg_table, direction);
+	dma_resv_unlock(attach->dmabuf->resv);
+}
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ac1e2911b727..b1c455329023 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -885,7 +885,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 			struct sg_table *sgt;
 
 			attach = gtt->gobj->import_attach;
-			sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
 			if (IS_ERR(sgt))
 				return PTR_ERR(sgt);
 
@@ -1010,7 +1010,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 		struct dma_buf_attachment *attach;
 
 		attach = gtt->gobj->import_attach;
-		dma_buf_unmap_attachment_unlocked(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
 		ttm->sg = NULL;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index cc54a5b1d6ae..276a74bc7fd1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -241,8 +241,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 
 	assert_object_held(obj);
 
-	pages = dma_buf_map_attachment_unlocked(obj->base.import_attach,
-						DMA_BIDIRECTIONAL);
+	pages = dma_buf_map_attachment(obj->base.import_attach,
+				       DMA_BIDIRECTIONAL);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -270,8 +270,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
 					     struct sg_table *pages)
 {
-	dma_buf_unmap_attachment_unlocked(obj->base.import_attach, pages,
-					  DMA_BIDIRECTIONAL);
+	dma_buf_unmap_attachment(obj->base.import_attach, pages,
+				 DMA_BIDIRECTIONAL);
 }
 
 static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 389e9f157ca5..9fbef3aea7b1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 			continue;
 		}
 
+		/*
+		 * dma_buf_unmap_attachment() requires reservation to be
+		 * locked. The imported GEM should share reservation lock,
+		 * so it's safe to take the lock.
+		 */
+		if (obj->base.import_attach)
+			i915_gem_object_lock(obj, NULL);
+
 		__i915_gem_object_pages_fini(obj);
+
+		if (obj->base.import_attach)
+			i915_gem_object_unlock(obj);
+
 		__i915_gem_free_object(obj);
 
 		/* But keep the pointer alive for RCU-protected lookups */
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index da2057569101..d48d534dc55c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -46,7 +46,7 @@ struct dma_buf_ops {
 	/**
 	 * @attach:
 	 *
-	 * This is called from dma_buf_attach() to make sure that a given
+	 * This is called from dma_buf_attach_unlocked() to make sure that a given
 	 * &dma_buf_attachment.dev can access the provided &dma_buf. Exporters
 	 * which support buffer objects in special locations like VRAM or
 	 * device-specific carveout areas should check whether the buffer could
@@ -74,7 +74,7 @@ struct dma_buf_ops {
 	/**
 	 * @detach:
 	 *
-	 * This is called by dma_buf_detach() to release a &dma_buf_attachment.
+	 * This is called by dma_buf_detach_unlocked() to release a &dma_buf_attachment.
 	 * Provided so that exporters can clean up any housekeeping for an
 	 * &dma_buf_attachment.
 	 *
@@ -94,7 +94,7 @@ struct dma_buf_ops {
 	 * exclusive with @cache_sgt_mapping.
 	 *
 	 * This is called automatically for non-dynamic importers from
-	 * dma_buf_attach().
+	 * dma_buf_attach_unlocked().
 	 *
 	 * Note that similar to non-dynamic exporters in their @map_dma_buf
 	 * callback the driver must guarantee that the memory is available for
@@ -509,10 +509,10 @@ struct dma_buf_attach_ops {
  * and its user device(s). The list contains one attachment struct per device
  * attached to the buffer.
  *
- * An attachment is created by calling dma_buf_attach(), and released again by
- * calling dma_buf_detach(). The DMA mapping itself needed to initiate a
- * transfer is created by dma_buf_map_attachment() and freed again by calling
- * dma_buf_unmap_attachment().
+ * An attachment is created by calling dma_buf_attach_unlocked(), and released
+ * again by calling dma_buf_detach_unlocked(). The DMA mapping itself needed to
+ * initiate a transfer is created by dma_buf_map_attachment() and freed
+ * again by calling dma_buf_unmap_attachment().
  */
 struct dma_buf_attachment {
 	struct dma_buf *dmabuf;
@@ -626,6 +626,12 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *,
 				       struct sg_table *,
 				       enum dma_data_direction);
 
+struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
+					enum dma_data_direction);
+void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
+			      struct sg_table *sg_table,
+			      enum dma_data_direction direction);
+
 void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
-- 
2.37.2

