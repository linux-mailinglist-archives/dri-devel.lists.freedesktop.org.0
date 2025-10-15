Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA4BDE985
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BF110E7C4;
	Wed, 15 Oct 2025 13:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dAY1E8fZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0A10E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760533275;
 bh=gtUjtQdjD6itcvCKIhxJp7ItZOCCXnqCjCDBSwdTJ84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dAY1E8fZInheo1Q19dDLapIGQEUJXAS4DUqP0gj/UdaT6L1xMQnVIhTT5KhS4RFcx
 VkOmMXtSLu8zIZnij7Ta0UTbG1vKrXdwe8eJl472DQtPkQ2DRfSvuOcqRQXpeY8XTE
 6tIZxxBqDzuEP+xJ6A73ziLgDpWEuvC8C0BjfN6+7V13K7/v+1dsCMxH6K5X1i8lzD
 0t0vT3KlS+9G188zcVozmNwDDqvLZmVeRqW2d8dIV4c9LW5+asIEiqzHseuzP8ZTey
 sAppEVzmG/qX7xeltbM3p3laldP0tOFrw+mqj+dZaYgfhxBEZga+zPLL++RdhCVCwG
 Cb1GhG+eijWFA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D4AC117E13F9;
 Wed, 15 Oct 2025 15:01:14 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 03/14] drm/prime: Provide default ::{begin,
 end}_cpu_access() implementations
Date: Wed, 15 Oct 2025 15:00:52 +0200
Message-ID: <20251015130103.3634560-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015130103.3634560-1-boris.brezillon@collabora.com>
References: <20251015130103.3634560-1-boris.brezillon@collabora.com>
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

Hook-up drm_gem_dmabuf_{begin,end}_cpu_access() to drm_gem_sync() so
that drivers relying on the default prime_dmabuf_ops can still have
a way to prepare for CPU accesses from outside the UMD.

v2:
- New commit

v3:
- Don't return an error on NOP syncs, and document that case in a
  comment

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_prime.c | 42 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_prime.h     |  5 +++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 43a10b4af43a..30d495c70afb 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -823,6 +823,46 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
+int drm_gem_dmabuf_begin_cpu_access(struct dma_buf *dma_buf,
+				    enum dma_data_direction direction)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	enum drm_gem_object_access_flags access = DRM_GEM_OBJECT_CPU_ACCESS;
+
+	/* begin_cpu_access(DMA_TO_DEVICE) is a NOP, the sync will happen
+	 * in the end_cpu_access() path.
+	 */
+	if (direction == DMA_FROM_DEVICE)
+		access |= DRM_GEM_OBJECT_READ_ACCESS;
+	else if (direction == DMA_BIDIRECTIONAL)
+		access |= DRM_GEM_OBJECT_RW_ACCESS;
+	else
+		return 0;
+
+	return drm_gem_sync(obj, 0, obj->size, access);
+}
+EXPORT_SYMBOL(drm_gem_dmabuf_begin_cpu_access);
+
+int drm_gem_dmabuf_end_cpu_access(struct dma_buf *dma_buf,
+				  enum dma_data_direction direction)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	enum drm_gem_object_access_flags access = DRM_GEM_OBJECT_DEV_ACCESS;
+
+	/* end_cpu_access(DMA_FROM_DEVICE) is a NOP, the sync should have
+	 * happened in the begin_cpu_access() path already.
+	 */
+	if (direction == DMA_TO_DEVICE)
+		access |= DRM_GEM_OBJECT_READ_ACCESS;
+	else if (direction == DMA_BIDIRECTIONAL)
+		access |= DRM_GEM_OBJECT_RW_ACCESS;
+	else
+		return 0;
+
+	return drm_gem_sync(obj, 0, obj->size, access);
+}
+EXPORT_SYMBOL(drm_gem_dmabuf_end_cpu_access);
+
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.attach = drm_gem_map_attach,
 	.detach = drm_gem_map_detach,
@@ -832,6 +872,8 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	.begin_cpu_access = drm_gem_dmabuf_begin_cpu_access,
+	.end_cpu_access = drm_gem_dmabuf_end_cpu_access,
 };
 
 /**
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index f50f862f0d8b..052fba039bb6 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -92,6 +92,11 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map);
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
 
+int drm_gem_dmabuf_begin_cpu_access(struct dma_buf *dma_buf,
+				    enum dma_data_direction direction);
+int drm_gem_dmabuf_end_cpu_access(struct dma_buf *dma_buf,
+				  enum dma_data_direction direction);
+
 struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 				       struct page **pages, unsigned int nr_pages);
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
-- 
2.51.0

