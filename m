Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3999C9E589
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A38A10E79E;
	Wed,  3 Dec 2025 09:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VO0LQRgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2CB10E798;
 Wed,  3 Dec 2025 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764752512;
 bh=huFqotsOpbSv7Ez+Kqu1hmbSb6aO/QmtjN9XxGi/0MM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VO0LQRgA2HSKKiJPKPhJT3ljZYeFKho+OIvN8YXFlitCjBekfY7QTUpkQBp52CZ3c
 D/kU195PjoG+CQhlolDyOAX77N8HRUVWoI2UbcMYNXvecaYMEfVp4SkxxdvNchlrp8
 UVmBG9IBCasPQ79rKgHmBOZpw4Vk76xsWfdekmW4TXpPucf/MwMLrgBqo4CRQtODaV
 hYb0CHlnWrHj2MnMRlpiyxn9N/N8MfSUjsPJxRwWx6W40ZJIZ825OOSH0c8iOFKTQ1
 UL9WEOhgQbKwPbd7KONTlOagvQF34jUf1DVrWWAcsQeu9SkGXh42B6m0QyvvgnNYpp
 iXGEgu87QM6HA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B5FB317E0CF5;
 Wed,  3 Dec 2025 10:01:51 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v7 01/13] drm/panthor: Provide a custom dma_buf implementation
Date: Wed,  3 Dec 2025 10:01:29 +0100
Message-ID: <20251203090141.227394-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251203090141.227394-1-boris.brezillon@collabora.com>
References: <20251203090141.227394-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before we introduce cached CPU mappings, we want a dma_buf
implementation satisfying synchronization requests around CPU
accesses coming from a dma_buf exported by our driver. Let's
provide our own implementation relying on the default
gem_shmem_prime helpers designed for that purpose.

v5:
- New patch

v6:
- Collect R-b

v7:
- Hand-roll the dma_buf sync/import logic (was previously done by
  generic prime/shmem helpers)

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |   1 +
 drivers/gpu/drm/panthor/panthor_gem.c | 118 +++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h |   4 +
 3 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index d1d4c50da5bf..d12ac4cb0ac4 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1621,6 +1621,7 @@ static const struct drm_driver panthor_drm_driver = {
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_import = panthor_gem_prime_import,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panthor_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 10d255cccc09..173d42d65000 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -184,14 +184,130 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	return ERR_PTR(ret);
 }
 
+static struct sg_table *
+panthor_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
+			      enum dma_data_direction dir)
+{
+	struct sg_table *sgt = drm_gem_map_dma_buf(attach, dir);
+
+	if (!IS_ERR(sgt))
+		attach->priv = sgt;
+
+	return sgt;
+}
+
+static void
+panthor_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
+				struct sg_table *sgt,
+				enum dma_data_direction dir)
+{
+	attach->priv = NULL;
+	drm_gem_unmap_dma_buf(attach, sgt, dir);
+}
+
+static int
+panthor_gem_prime_begin_cpu_access(struct dma_buf *dma_buf,
+				   enum dma_data_direction dir)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_device *dev = obj->dev;
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct dma_buf_attachment *attach;
+
+	dma_resv_lock(obj->resv, NULL);
+	if (shmem->sgt)
+		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
+
+	if (shmem->vaddr)
+		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
+
+	list_for_each_entry(attach, &dma_buf->attachments, node) {
+		struct sg_table *sgt = attach->priv;
+
+		if (sgt)
+			dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
+	}
+	dma_resv_unlock(obj->resv);
+
+	return 0;
+}
+
+static int
+panthor_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
+				 enum dma_data_direction dir)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_device *dev = obj->dev;
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct dma_buf_attachment *attach;
+
+	dma_resv_lock(obj->resv, NULL);
+	list_for_each_entry(attach, &dma_buf->attachments, node) {
+		struct sg_table *sgt = attach->priv;
+
+		if (sgt)
+			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
+	}
+
+	if (shmem->vaddr)
+		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
+
+	if (shmem->sgt)
+		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
+
+	dma_resv_unlock(obj->resv);
+	return 0;
+}
+
+static const struct dma_buf_ops panthor_dma_buf_ops = {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = panthor_gem_prime_map_dma_buf,
+	.unmap_dma_buf = panthor_gem_prime_unmap_dma_buf,
+	.release = drm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+	.begin_cpu_access = panthor_gem_prime_begin_cpu_access,
+	.end_cpu_access = panthor_gem_prime_end_cpu_access,
+};
+
 static struct dma_buf *
 panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME,
+		.owner = THIS_MODULE,
+		.ops = &panthor_dma_buf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
 	/* We can't export GEMs that have an exclusive VM. */
 	if (to_panthor_bo(obj)->exclusive_vm_root_gem)
 		return ERR_PTR(-EINVAL);
 
-	return drm_gem_prime_export(obj, flags);
+	return drm_gem_dmabuf_export(dev, &exp_info);
+}
+
+struct drm_gem_object *
+panthor_gem_prime_import(struct drm_device *dev,
+			 struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	if (dma_buf->ops == &panthor_dma_buf_ops && obj->dev == dev) {
+		/* Importing dmabuf exported from our own gem increases
+		 * refcount on gem itself instead of f_count of dmabuf.
+		 */
+		drm_gem_object_get(obj);
+		return obj;
+	}
+
+	return drm_gem_prime_import(dev, dma_buf);
 }
 
 static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 80c6e24112d0..91d1880f8a5d 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -147,6 +147,10 @@ panthor_gem_create_with_handle(struct drm_file *file,
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
 
+struct drm_gem_object *
+panthor_gem_prime_import(struct drm_device *dev,
+			 struct dma_buf *dma_buf);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
-- 
2.51.1

