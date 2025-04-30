Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0066AA4693
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5B10E32A;
	Wed, 30 Apr 2025 09:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Kr9zL4b4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 935 seconds by postgrey-1.36 at gabe;
 Wed, 30 Apr 2025 09:13:29 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4368210E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=inMIW
 EhVfTFIN8ho7f8yrG5qi3Y8wmmQJwlgSIp5P78=; b=Kr9zL4b4+N8pvX11SB5NL
 WVgY4jOCU22EYJ1SSF77LXUJqoHmwFFcSwv9yt9R1m7I42USLhY7iB5g28qneISF
 mOVMGGDTp1+SrskO1kv3KNK5H+ffZtV/GZ+XWiAif4M9Hk7gZKimjuql4O8SSihK
 EYqlDtEeCWjhTSSDZ5m6Ms=
Received: from localhost.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD351ze5RFo2yEaBg--.45889S2;
 Wed, 30 Apr 2025 16:57:04 +0800 (CST)
From: oushixiong1025@163.com
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH 1/3] dma-buf: add flags to skip map_dma_buf() for some drivers
Date: Wed, 30 Apr 2025 16:56:56 +0800
Message-Id: <20250430085658.540746-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD351ze5RFo2yEaBg--.45889S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfJw4xZr4DWr1ktr4Dur1Utrb_yoW8Wry3Jo
 WfXFy3J3WrX34rAr9xJFnxtF9xX3Z5Zw4fGw4rtrs0qFW2qF4jyFyavr13AF15tr4UJFsr
 ua43tw1rXry5Ga4xn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2vPfDUUUU
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBw-D2gR4Jp7-QAAs1
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

[WHY] Some Importer does not need to call dma_buf_map_attachment() to
get the scatterlist info, especially those drivers of hardware that do
not support DMA, such as the udl, the virtgpu and the ast.

[HOW] skip map_dma_buf() when dma_buf_dynamic_attach() for some drivers.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/accel/ivpu/ivpu_gem.c                 |  2 +-
 drivers/accel/qaic/qaic_data.c                |  2 +-
 drivers/dma-buf/dma-buf.c                     | 29 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
 drivers/gpu/drm/armada/armada_gem.c           |  2 +-
 drivers/gpu/drm/drm_prime.c                   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  2 +-
 drivers/gpu/drm/tegra/gem.c                   |  4 +--
 drivers/gpu/drm/virtio/virtgpu_prime.c        |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |  2 +-
 drivers/iio/industrialio-buffer.c             |  2 +-
 drivers/infiniband/core/umem_dmabuf.c         |  3 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  2 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  2 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  2 +-
 drivers/misc/fastrpc.c                        |  2 +-
 drivers/usb/gadget/function/f_fs.c            |  2 +-
 drivers/xen/gntdev-dmabuf.c                   |  2 +-
 include/linux/dma-buf.h                       |  5 ++--
 net/core/devmem.c                             |  2 +-
 22 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 8741c73b92ce..5258a66ed945 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -183,7 +183,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret;
 
-	attach = dma_buf_attach(dma_buf, attach_dev);
+	attach = dma_buf_attach(dma_buf, attach_dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 43aba57b48f0..c13c64d59143 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -803,7 +803,7 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 	obj = &bo->base;
 	get_dma_buf(dma_buf);
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(dma_buf, dev->dev, false);
 	if (IS_ERR(attach)) {
 		ret = PTR_ERR(attach);
 		goto attach_fail;
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..dd7fe5fbf197 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -904,7 +904,7 @@ static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 		       const struct dma_buf_attach_ops *importer_ops,
-		       void *importer_priv)
+		       void *importer_priv, bool skip_map)
 {
 	struct dma_buf_attachment *attach;
 	int ret;
@@ -941,8 +941,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	 */
 	if (dma_buf_attachment_is_dynamic(attach) !=
 	    dma_buf_is_dynamic(dmabuf)) {
-		struct sg_table *sgt;
-
 		dma_resv_lock(attach->dmabuf->resv, NULL);
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			ret = dmabuf->ops->pin(attach);
@@ -950,16 +948,20 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 				goto err_unlock;
 		}
 
-		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
-		if (!sgt)
-			sgt = ERR_PTR(-ENOMEM);
-		if (IS_ERR(sgt)) {
-			ret = PTR_ERR(sgt);
-			goto err_unpin;
+		if (!skip_map) {
+			struct sg_table *sgt;
+
+			sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
+			if (!sgt)
+				sgt = ERR_PTR(-ENOMEM);
+			if (IS_ERR(sgt)) {
+				ret = PTR_ERR(sgt);
+				goto err_unpin;
+			}
+			attach->sgt = sgt;
+			attach->dir = DMA_BIDIRECTIONAL;
 		}
 		dma_resv_unlock(attach->dmabuf->resv);
-		attach->sgt = sgt;
-		attach->dir = DMA_BIDIRECTIONAL;
 	}
 
 	return attach;
@@ -989,9 +991,10 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
  * mapping.
  */
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-					  struct device *dev)
+					  struct device *dev,
+					  bool skip_map)
 {
-	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
+	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL, skip_map);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e6913fcf2c7b..26c94834e6d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -479,7 +479,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 		return obj;
 
 	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
-					&amdgpu_dma_buf_attach_ops, obj);
+					&amdgpu_dma_buf_attach_ops, obj, false);
 	if (IS_ERR(attach)) {
 		drm_gem_object_put(obj);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 1a1680d71486..7e1a82828b87 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -514,7 +514,7 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
 		}
 	}
 
-	attach = dma_buf_attach(buf, dev->dev);
+	attach = dma_buf_attach(buf, dev->dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index bdb51c8f262e..8e70abca33b9 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -949,7 +949,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	if (!dev->driver->gem_prime_import_sg_table)
 		return ERR_PTR(-EINVAL);
 
-	attach = dma_buf_attach(dma_buf, attach_dev);
+	attach = dma_buf_attach(dma_buf, attach_dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 9473050ac842..6015f6beb8e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -305,7 +305,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 		return ERR_PTR(-E2BIG);
 
 	/* need to attach */
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(dma_buf, dev->dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 2fda549dd82d..1992241fdf54 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -287,7 +287,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_import;
 
 	/* Now try a fake an importer */
-	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev);
+	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev, false);
 	if (IS_ERR(import_attach)) {
 		err = PTR_ERR(import_attach);
 		goto out_import;
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 30cf1cdc1aa3..41fb4149409e 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -114,7 +114,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 		}
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(dma_buf, dev->dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ace3e5a805cf..e5527c9d10bb 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -79,7 +79,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 	if (obj->dma_buf) {
 		struct dma_buf *buf = obj->dma_buf;
 
-		map->attach = dma_buf_attach(buf, dev);
+		map->attach = dma_buf_attach(buf, dev, false);
 		if (IS_ERR(map->attach)) {
 			err = PTR_ERR(map->attach);
 			goto free;
@@ -470,7 +470,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	 * domain, map it first to the DRM device to get an sgt.
 	 */
 	if (tegra->domain) {
-		attach = dma_buf_attach(buf, drm->dev);
+		attach = dma_buf_attach(buf, drm->dev, false);
 		if (IS_ERR(attach)) {
 			err = PTR_ERR(attach);
 			goto free;
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 4de2a63ccd18..6d9d1fe342b6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -326,7 +326,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 	drm_gem_private_object_init(dev, obj, buf->size);
 
 	attach = dma_buf_dynamic_attach(buf, dev->dev,
-					&virtgpu_dma_buf_attach_ops, obj);
+					&virtgpu_dma_buf_attach_ops, obj, true);
 	if (IS_ERR(attach)) {
 		kfree(bo);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index f7a20264ea33..9f524b9ed425 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -293,7 +293,7 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 		attach_ops = test->attach_ops;
 #endif
 
-	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
+	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base, false);
 	if (IS_ERR(attach)) {
 		obj = ERR_CAST(attach);
 		goto out_err;
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index a80f7cc25a27..1296af4c2f7a 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1679,7 +1679,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 		goto err_free_priv;
 	}
 
-	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent);
+	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent, false);
 	if (IS_ERR(attach)) {
 		err = PTR_ERR(attach);
 		goto err_dmabuf_put;
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index 0ec2e4120cc9..ed635c407cbd 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -159,7 +159,8 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
 					dmabuf,
 					dma_device,
 					ops,
-					umem_dmabuf);
+					umem_dmabuf,
+					false);
 	if (IS_ERR(umem_dmabuf->attach)) {
 		ret = ERR_CAST(umem_dmabuf->attach);
 		goto out_free_umem;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a13ec569c82f..362f5b555ce2 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -786,7 +786,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 	buf->vb = vb;
 
 	/* create attachment for the dmabuf with the user device */
-	dba = dma_buf_attach(dbuf, buf->dev);
+	dba = dma_buf_attach(dbuf, buf->dev, false);
 	if (IS_ERR(dba)) {
 		pr_err("failed to attach dmabuf\n");
 		kfree(buf);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c6ddf2357c58..4f9a4e9783a1 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -632,7 +632,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 
 	buf->dev = dev;
 	/* create attachment for the dmabuf with the user device */
-	dba = dma_buf_attach(dbuf, buf->dev);
+	dba = dma_buf_attach(dbuf, buf->dev, false);
 	if (IS_ERR(dba)) {
 		pr_err("failed to attach dmabuf\n");
 		kfree(buf);
diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
index b34244ea14dd..d04da2d3e4da 100644
--- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
+++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
@@ -95,7 +95,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
 		goto ref;
 	}
 
-	attachment = dma_buf_attach(dmabuf, dev);
+	attachment = dma_buf_attach(dmabuf, dev, false);
 	if (IS_ERR(attachment)) {
 		dev_err(dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(attachment);
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..aee6f4cbd6c6 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -778,7 +778,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		goto get_err;
 	}
 
-	map->attach = dma_buf_attach(map->buf, sess->dev);
+	map->attach = dma_buf_attach(map->buf, sess->dev, false);
 	if (IS_ERR(map->attach)) {
 		dev_err(sess->dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(map->attach);
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f8..51926ffdb843 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1487,7 +1487,7 @@ static int ffs_dmabuf_attach(struct file *file, int fd)
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
-	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
+	attach = dma_buf_attach(dmabuf, gadget->dev.parent, false);
 	if (IS_ERR(attach)) {
 		err = PTR_ERR(attach);
 		goto err_dmabuf_put;
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 5453d86324f6..9de191b6d1f7 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -587,7 +587,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 	gntdev_dmabuf->priv = priv;
 	gntdev_dmabuf->fd = fd;
 
-	attach = dma_buf_attach(dma_buf, dev);
+	attach = dma_buf_attach(dma_buf, dev, false);
 	if (IS_ERR(attach)) {
 		ret = ERR_CAST(attach);
 		goto fail_free_obj;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..1ea25089b3ba 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -598,11 +598,12 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
 }
 
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-					  struct device *dev);
+					  struct device *dev,
+					  bool skip_map);
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 		       const struct dma_buf_attach_ops *importer_ops,
-		       void *importer_priv);
+		       void *importer_priv, bool skip_map);
 void dma_buf_detach(struct dma_buf *dmabuf,
 		    struct dma_buf_attachment *attach);
 int dma_buf_pin(struct dma_buf_attachment *attach);
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6e27a47d0493..8137ecff9e39 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -202,7 +202,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 
 	binding->dmabuf = dmabuf;
 
-	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
+	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent, false);
 	if (IS_ERR(binding->attachment)) {
 		err = PTR_ERR(binding->attachment);
 		NL_SET_ERR_MSG(extack, "Failed to bind dmabuf to device");
-- 
2.17.1

