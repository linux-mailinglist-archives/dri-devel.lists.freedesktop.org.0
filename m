Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11309CACCE3
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF1510E41F;
	Mon,  8 Dec 2025 10:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m/uugYax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A4A10E416
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188536;
 bh=Bj8afWDUCK1tO+9S7+BMmisYj0amCyZKTTN1WCvfjPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/uugYaxobFdWJsXTPcqK/x7aukWvJIEHU1wjDTkL/dho6Si3yUN9sFRCDTrJdCdE
 JHLONp9a3VH3csrUaH+JHkOKGX3IXWy08PurJoziizevJvbJM6mqdf6xIFzYKf8ox9
 1cIDfPMDKnP9pRvZVPYsuFIGck28SpiCKn2egoACGFcoY7baT2QR3OBvMFlTQvEKOd
 r0PVKG9iANohWAOtI77l51mKxQUI4eAZi1NaB6RLk2mlqHj7x5yO8ZLjF8TDIzag3a
 UwBijsbP5yojOcGhjNwSCo3qQFAvq/0OzDBS3ClCYDYnYAXjypL8W3Yqwy5e0ah6JU
 /woOjy+IGUUqA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A0D3D17E3656;
 Mon,  8 Dec 2025 11:08:55 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v8 08/13] drm/panfrost: Provide a custom dma_buf implementation
Date: Mon,  8 Dec 2025 11:08:35 +0100
Message-ID: <20251208100841.730527-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208100841.730527-1-boris.brezillon@collabora.com>
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
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
- Hand-roll our own dma_buf boilerplate

v8:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |   1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c | 123 ++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |   3 +
 3 files changed, 127 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..cd6001a7faa2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -852,6 +852,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.minor			= 5,
 
 	.gem_create_object	= panfrost_gem_create_object,
+	.gem_prime_import	= panfrost_gem_prime_import,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panfrost_debugfs_init,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8041b65c6609..4afd1a7f77d5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -259,6 +259,128 @@ static size_t panfrost_gem_rss(struct drm_gem_object *obj)
 	return 0;
 }
 
+static struct sg_table *
+panfrost_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
+			       enum dma_data_direction dir)
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
+panfrost_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
+				 struct sg_table *sgt,
+				 enum dma_data_direction dir)
+{
+	attach->priv = NULL;
+	drm_gem_unmap_dma_buf(attach, sgt, dir);
+}
+
+static int
+panfrost_gem_prime_begin_cpu_access(struct dma_buf *dma_buf,
+				    enum dma_data_direction dir)
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
+panfrost_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
+				  enum dma_data_direction dir)
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
+static const struct dma_buf_ops panfrost_dma_buf_ops = {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = panfrost_gem_prime_map_dma_buf,
+	.unmap_dma_buf = panfrost_gem_prime_unmap_dma_buf,
+	.release = drm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+	.begin_cpu_access = panfrost_gem_prime_begin_cpu_access,
+	.end_cpu_access = panfrost_gem_prime_end_cpu_access,
+};
+
+static struct dma_buf *
+panfrost_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME,
+		.owner = THIS_MODULE,
+		.ops = &panfrost_dma_buf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
+	return drm_gem_dmabuf_export(dev, &exp_info);
+}
+
+struct drm_gem_object *
+panfrost_gem_prime_import(struct drm_device *dev,
+			  struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	if (dma_buf->ops == &panfrost_dma_buf_ops && obj->dev == dev) {
+		/* Importing dmabuf exported from our own gem increases
+		 * refcount on gem itself instead of f_count of dmabuf.
+		 */
+		drm_gem_object_get(obj);
+		return obj;
+	}
+
+	return drm_gem_prime_import(dev, dma_buf);
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -267,6 +389,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.pin = panfrost_gem_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.export = panfrost_gem_prime_export,
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8de3e76f2717..7fec20339354 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -130,6 +130,9 @@ struct drm_gem_object *
 panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct dma_buf_attachment *attach,
 				   struct sg_table *sgt);
+struct drm_gem_object *
+panfrost_gem_prime_import(struct drm_device *dev,
+			  struct dma_buf *dma_buf);
 
 struct panfrost_gem_object *
 panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags);
-- 
2.51.1

