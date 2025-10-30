Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB01EC2075D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2210E401;
	Thu, 30 Oct 2025 14:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Uh2wgLfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A0910E5D2;
 Thu, 30 Oct 2025 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833138;
 bh=+iu5PtaFpmoSjXtsfCvhEy2qNXj0jXPF8fI4Kum+WdA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Uh2wgLfq0RSTVdQyiwOmvveZKLbWNOHGbdDlnP5a5VZRObATT6DqXF2THJ8cQGA4Q
 92UyfaDPPuAXj6rLmz6qIYGsNrtvSfIltPNzcfZEX78rdupuERXjdJifod0Bx29X84
 tXCXygmBtnAZALzw6FEbfmUZ00ybhXsMeMVmrWSRU5Gl4GzGz6BjvLmuSXMm+7yuJW
 z0mpU7loOZsiKPxcSzrgOiotn6RfvcROcqWzoMuDJwFhsKHo/bA/t4CcV5B1ck7mPz
 fYPEZlO/m5tvhxvVsY6RtE5c7LHtq/joM3pDClym3qx77IdM6RNoCT0fVj1AtlEnWE
 oMjeP9Ivj956A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D09AB17E1401;
 Thu, 30 Oct 2025 15:05:37 +0100 (CET)
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
Subject: [PATCH v5 02/16] drm/shmem: Provide a generic {begin,
 end}_cpu_access() implementation
Date: Thu, 30 Oct 2025 15:05:11 +0100
Message-ID: <20251030140525.366636-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030140525.366636-1-boris.brezillon@collabora.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
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

The default implementation simply takes care of invalidating/flushing
caches around CPU accesses. It takes care of both the exporter and
the importers, which forces us to overload the default
::[un]map_dma_buf() implementation provided by drm_gem.c to store the
sgt.

v5:
- New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 114 +++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  10 +++
 2 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index dc94a27710e5..e49c75739c20 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -893,6 +893,120 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
 
+/**
+ * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
+ * @attach: attachment
+ * @sgt: SG table to unmap
+ * @dir: type of access done by this attachment
+ *
+ * Default implementation for dma_buf_ops::map_dma_buf(). This is just a wrapper
+ * around drm_gem_map_dma_buf() that lets us set the dma_buf_attachment::priv
+ * to the sgt so that drm_gem_shmem_prime_{begin,end}_cpu_access() can sync
+ * around CPU accesses.
+ */
+struct sg_table *
+drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
+				enum dma_data_direction dir)
+{
+	struct sg_table *sgt = drm_gem_map_dma_buf(attach, dir);
+
+	if (!IS_ERR(sgt))
+		attach->priv = sgt;
+
+	return sgt;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_map_dma_buf);
+
+/**
+ * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
+ * @attach: attachment
+ * @sgt: SG table to unmap
+ * @dir: type of access done by this attachment
+ *
+ * Default implementation for dma_buf_ops::unmap_dma_buf(). This is just a wrapper
+ * around drm_gem_unmap_dma_buf() that lets us reset the dma_buf_attachment::priv
+ * field so that drm_gem_shmem_prime_{begin,end}_cpu_access() don't consider it
+ * as a mapped attachment to sync against.
+ */
+void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
+				       struct sg_table *sgt,
+				       enum dma_data_direction dir)
+{
+	attach->priv = NULL;
+	drm_gem_unmap_dma_buf(attach, sgt, dir);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_unmap_dma_buf);
+
+/**
+ * drm_gem_shmem_prime_begin_cpu_access - Default end_cpu_access() for exported buffers
+ * @dma_buf: The exported DMA buffer this acts on
+ * @dir: direction of the access
+ *
+ * Default implementation for dma_buf_ops::begin_cpu_access(). This only takes care of
+ * cache maintenance.
+ */
+int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
+					 enum dma_data_direction dir)
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
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_begin_cpu_access);
+
+/**
+ * drm_gem_shmem_prime_end_cpu_access - Default end_cpu_access() for exported buffers
+ * @dma_buf: The exported DMA buffer this acts on
+ * @dir: direction of the access
+ *
+ * Default implementation for dma_buf_ops::end_cpu_access(). This only takes care of
+ * cache maintenance.
+ */
+int drm_gem_shmem_prime_end_cpu_access(struct dma_buf *dma_buf,
+				       enum dma_data_direction dir)
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
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_end_cpu_access);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 589f7bfe7506..075275d6b2fd 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -291,6 +291,16 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 							 struct dma_buf *buf);
+struct sg_table *
+drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
+				enum dma_data_direction dir);
+void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
+				       struct sg_table *sgt,
+				       enum dma_data_direction dir);
+int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
+					 enum dma_data_direction dir);
+int drm_gem_shmem_prime_end_cpu_access(struct dma_buf *dma_buf,
+				       enum dma_data_direction dir);
 
 /**
  * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
-- 
2.51.0

