Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47236BDF895
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5864210E871;
	Wed, 15 Oct 2025 16:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AaRVLc/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E724E10E853
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760544218;
 bh=8mCnSS9hIFy3mPf3vQmseYu6lxx3kVow51GwE1/Zcv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AaRVLc/X0+zUNwC8ip8k1ACp8bzKnI3d2FieRwieP+FFF9jCfQFIB9S4jiZNl5M8P
 ujttYmfn8CPkKTGa8wEiVV9hhxKtThCJx79/xWIfym6DJJfDfsJoYXSjPTXOicy9+Q
 YGoE7OMBY4NjaO7wm+R5WqKCHtyL2zHC610VSu6WyY+wNUJHB71KMBPAWdtxpY8XGk
 s15Fpr9mIirSqwkasX4D56fuhWJPTUcBEwYeDNnK1bl+pRyxyIYOYTLarrxAlxH1OA
 lStKXEOzBfTjmLXCbaXW/R+sn6gaQiNzwsrr5Nzx73bZ7n83QmOZAiTsqYRbLiSNqN
 i7oNkPmCtQ0HQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 303EB17E13F9;
 Wed, 15 Oct 2025 18:03:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v4 03/14] drm/prime: Provide default ::{begin,
 end}_cpu_access() implementations
Date: Wed, 15 Oct 2025 18:03:15 +0200
Message-ID: <20251015160326.3657287-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015160326.3657287-1-boris.brezillon@collabora.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
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

v4:
- Add Steve's R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
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

