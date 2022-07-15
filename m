Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0925758C2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F189A10EE3C;
	Fri, 15 Jul 2022 00:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840AD10ECD6;
 Fri, 15 Jul 2022 00:53:27 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B161F6601A52;
 Fri, 15 Jul 2022 01:53:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657846406;
 bh=97ScU/XzBWnFMURtp1TI4dy45l3K+cbLfS70sqP3l1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R6c6r91Av1Cy0liCl7qy3cfVrQtVpDxkopwQXPoDXifXxk3jKCNB/sDL4Lt6NwZbQ
 NMfdYanGjFtcDPx70znL9miWiomfnnevfdg6KLCsdCcbTXk+Y1eK4FhyhKydi/0r9q
 DQhTu0nG6ELRNbEDPmCUs9qtCuCdCMFWhLkPEWNXk88lQ621ZJS0Qa84qJpY0C4S9w
 OfVSxwOAzLFoScj2+qT7wUQPW1lUSmNqPz2Rbsjq2fejDa4aJQ6pBdPK6PdAWaInnD
 Cy96bNQCPz1M5FXJlpLo4ZeeoUxS9LkEsLUfv9WUTgFbM8umIWetL4nHvLd6ijkWi1
 X0BP+zxIg2arA==
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v1 3/6] dma-buf: Move all dma-bufs to dynamic locking
 specification
Date: Fri, 15 Jul 2022 03:52:41 +0300
Message-Id: <20220715005244.42198-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch moves the non-dynamic dma-buf users over to the dynamic
locking specification. From now on all dma-buf importers are responsible
for holding dma-buf's reservation lock around operations performed over
dma-bufs. This strict locking convention prevents dead lock situation for
dma-buf importers and exporters.

Previously the "unlocked" versions of the dma-buf API functions weren't
taking the reservation lock and this patch makes them to take the lock.

Intel and AMD GPU drivers already were mapping imported dma-bufs under
the held lock, hence the "locked" variant of the functions are added
for them and the drivers are updated to use the "locked" versions.

Intel driver is also updated to not lock the exported buffer on
attachment since lock is now held by importer. We also need to move
the ww context acquirement from exporters (i915 driver) to importers,
otherwise lockdep won't be happy. This will be done in the next patch
since i915 is the only driver that uses ww context on attachment today
and it's not critical to make this change separately for i915 driver.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c                  | 125 +++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   4 +-
 drivers/gpu/drm/drm_prime.c                |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  12 +-
 include/linux/dma-buf.h                    |   6 +
 5 files changed, 104 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d16237a6ffaa..0ee588276534 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -841,14 +841,14 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 	attach->importer_ops = importer_ops;
 	attach->importer_priv = importer_priv;
 
+	dma_resv_lock(dmabuf->resv, NULL);
+
 	if (dmabuf->ops->attach) {
 		ret = dmabuf->ops->attach(dmabuf, attach);
 		if (ret)
 			goto err_attach;
 	}
-	dma_resv_lock(dmabuf->resv, NULL);
 	list_add(&attach->node, &dmabuf->attachments);
-	dma_resv_unlock(dmabuf->resv);
 
 	/* When either the importer or the exporter can't handle dynamic
 	 * mappings we cache the mapping here to avoid issues with the
@@ -859,7 +859,6 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 		struct sg_table *sgt;
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
-			dma_resv_lock(attach->dmabuf->resv, NULL);
 			ret = dmabuf->ops->pin(attach);
 			if (ret)
 				goto err_unlock;
@@ -872,15 +871,16 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 			ret = PTR_ERR(sgt);
 			goto err_unpin;
 		}
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt = sgt;
 		attach->dir = DMA_BIDIRECTIONAL;
 	}
 
+	dma_resv_unlock(dmabuf->resv);
+
 	return attach;
 
 err_attach:
+	dma_resv_unlock(attach->dmabuf->resv);
 	kfree(attach);
 	return ERR_PTR(ret);
 
@@ -889,8 +889,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 		dmabuf->ops->unpin(attach);
 
 err_unlock:
-	if (dma_buf_is_dynamic(attach->dmabuf))
-		dma_resv_unlock(attach->dmabuf->resv);
+	dma_resv_unlock(dmabuf->resv);
 
 	dma_buf_detach_unlocked(dmabuf, attach);
 	return ERR_PTR(ret);
@@ -937,24 +936,23 @@ void dma_buf_detach_unlocked(struct dma_buf *dmabuf,
 	if (WARN_ON(!dmabuf || !attach))
 		return;
 
-	if (attach->sgt) {
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dma_resv_lock(attach->dmabuf->resv, NULL);
+	if (WARN_ON(dmabuf != attach->dmabuf))
+		return;
 
+	dma_resv_lock(dmabuf->resv, NULL);
+
+	if (attach->sgt) {
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
-	dma_resv_unlock(dmabuf->resv);
+
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	dma_resv_unlock(dmabuf->resv);
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach_unlocked, DMA_BUF);
@@ -1030,10 +1028,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
  *
  * Important: Dynamic importers must wait for the exclusive fence of the struct
  * dma_resv attached to the DMA-BUF first.
+ *
+ * Importer is responsible for holding dmabuf's reservation lock.
  */
-struct sg_table *
-dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
-				enum dma_data_direction direction)
+struct sg_table *dma_buf_map_attachment_locked(struct dma_buf_attachment *attach,
+					       enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
 	int r;
@@ -1043,8 +1042,7 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 	if (WARN_ON(!attach || !attach->dmabuf))
 		return ERR_PTR(-EINVAL);
 
-	if (dma_buf_attachment_is_dynamic(attach))
-		dma_resv_assert_held(attach->dmabuf->resv);
+	dma_resv_assert_held(attach->dmabuf->resv);
 
 	if (attach->sgt) {
 		/*
@@ -1059,7 +1057,6 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 	}
 
 	if (dma_buf_is_dynamic(attach->dmabuf)) {
-		dma_resv_assert_held(attach->dmabuf->resv);
 		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
 			r = attach->dmabuf->ops->pin(attach);
 			if (r)
@@ -1099,10 +1096,38 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
 }
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_locked, DMA_BUF);
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
+	sg_table = dma_buf_map_attachment_locked(attach, direction);
+	dma_resv_unlock(attach->dmabuf->resv);
+
+	return sg_table;
+}
 EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
 
 /**
- * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
+ * dma_buf_unmap_attachment_locked - unmaps and decreases usecount of the buffer;might
  * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
  * dma_buf_ops.
  * @attach:	[in]	attachment to unmap buffer from
@@ -1110,31 +1135,51 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
  * @direction:  [in]    direction of DMA transfer
  *
  * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
+ *
+ * Importer is responsible for holding dmabuf's reservation lock.
  */
-void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
-				       struct sg_table *sg_table,
-				       enum dma_data_direction direction)
+void dma_buf_unmap_attachment_locked(struct dma_buf_attachment *attach,
+				     struct sg_table *sg_table,
+				     enum dma_data_direction direction)
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
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_locked, DMA_BUF);
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
+	dma_buf_unmap_attachment_locked(attach, sg_table, direction);
+	dma_resv_unlock(attach->dmabuf->resv);
+}
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
 
 /**
@@ -1348,6 +1393,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
 int dma_buf_mmap_unlocked(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 			  unsigned long pgoff)
 {
+	int ret;
+
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1368,7 +1415,11 @@ int dma_buf_mmap_unlocked(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	dma_resv_lock(dmabuf->resv, NULL);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+	dma_resv_unlock(dmabuf->resv);
+
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
 
@@ -1401,6 +1452,7 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (!dmabuf->ops->vmap)
 		return -EINVAL;
 
+	dma_resv_lock(dmabuf->resv, NULL);
 	mutex_lock(&dmabuf->lock);
 	if (dmabuf->vmapping_counter) {
 		dmabuf->vmapping_counter++;
@@ -1422,6 +1474,7 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 
 out_unlock:
 	mutex_unlock(&dmabuf->lock);
+	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, DMA_BUF);
@@ -1440,6 +1493,7 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(dmabuf->vmapping_counter == 0);
 	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
 
+	dma_resv_lock(dmabuf->resv, NULL);
 	mutex_lock(&dmabuf->lock);
 	if (--dmabuf->vmapping_counter == 0) {
 		if (dmabuf->ops->vunmap)
@@ -1447,6 +1501,7 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 		iosys_map_clear(&dmabuf->vmap_ptr);
 	}
 	mutex_unlock(&dmabuf->lock);
+	dma_resv_unlock(dmabuf->resv);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e354ad140a0a..0d8b82e5b22f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -883,7 +883,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 			struct sg_table *sgt;
 
 			attach = gtt->gobj->import_attach;
-			sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+			sgt = dma_buf_map_attachment_locked(attach, DMA_BIDIRECTIONAL);
 			if (IS_ERR(sgt))
 				return PTR_ERR(sgt);
 
@@ -1008,7 +1008,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 		struct dma_buf_attachment *attach;
 
 		attach = gtt->gobj->import_attach;
-		dma_buf_unmap_attachment_unlocked(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		dma_buf_unmap_attachment_locked(attach, ttm->sg, DMA_BIDIRECTIONAL);
 		ttm->sg = NULL;
 	}
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1bd234fd21a5..b75ef1756873 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -678,7 +678,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return drm_gem_vmap_unlocked(obj, map);
+	return drm_gem_vmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -694,7 +694,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap_unlocked(obj, map);
+	drm_gem_vunmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index cc54a5b1d6ae..c199bf71c373 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -174,10 +174,6 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
 		return -EOPNOTSUPP;
 
 	for_i915_gem_ww(&ww, err, true) {
-		err = i915_gem_object_lock(obj, &ww);
-		if (err)
-			continue;
-
 		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
 		if (err)
 			continue;
@@ -241,8 +237,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 
 	assert_object_held(obj);
 
-	pages = dma_buf_map_attachment_unlocked(obj->base.import_attach,
-						DMA_BIDIRECTIONAL);
+	pages = dma_buf_map_attachment_locked(obj->base.import_attach,
+					      DMA_BIDIRECTIONAL);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -270,8 +266,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
 					     struct sg_table *pages)
 {
-	dma_buf_unmap_attachment_unlocked(obj->base.import_attach, pages,
-					  DMA_BIDIRECTIONAL);
+	dma_buf_unmap_attachment_locked(obj->base.import_attach, pages,
+					DMA_BIDIRECTIONAL);
 }
 
 static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 9ab09569dec1..da924a56d58f 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -626,6 +626,12 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *,
 				       struct sg_table *,
 				       enum dma_data_direction);
 
+struct sg_table *dma_buf_map_attachment_locked(struct dma_buf_attachment *,
+					       enum dma_data_direction);
+void dma_buf_unmap_attachment_locked(struct dma_buf_attachment *attach,
+				     struct sg_table *sg_table,
+				     enum dma_data_direction direction);
+
 void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
-- 
2.36.1

