Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9DCBCC7B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BC810E28A;
	Fri, 10 Oct 2025 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cuCPDrwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B8710E287
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760091119;
 bh=j+bpxEUiIIOgV6N+8SHZbBdx4TuOwu2IH2LRt9tQ/es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cuCPDrwGZWUS+RzrNqoQSSJGrjw9OzMuqMVJvYjs9ru+79RqfiXNlJRiWuw5SWUbA
 Gamnb3TcTNSObQHOLGui1H6runKpxO5UySeLy8qRJO1i4Ubi9PhZI+x/qDV8uKYYaO
 SXj1EwqH6L7OEAoYOQUdkjSXncSI6KlWc7YuH924/5pqF4ihpWTvMAfnmg+2+9C6yh
 JHyCaukwb9sYy9SZMTLA2tX4F8l2aIQo3r3URrN42M5INneXKmQ2oVtpknBbkl2pVW
 3p1gR6dQh0prn2UMcHX3AGnbnI6cppDLSYvYEYlpcCqGHwhcsGEwoMrlOKpJuNj/WI
 s2rFsP/6TGMtA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E811817E10B7;
 Fri, 10 Oct 2025 12:11:58 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 03/13] drm/shmem: Add a drm_gem_shmem_sync() helper
Date: Fri, 10 Oct 2025 12:11:36 +0200
Message-ID: <20251010101147.3290604-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010101147.3290604-1-boris.brezillon@collabora.com>
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This enables syncing mapped GEM objects between the CPU and GPU via calls
to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
so it's best if every driver doesn't hand-roll it.

When we're dealing with a dma-buf, the synchronization requests are
forwarded to the exporter through dma_buf_{begin,end}_cpu_access().

We provide a drm_gem_shmem_object_sync() for drivers that wants to
have this default implementation as their drm_gem_object_funcs::sync,
but we don't set drm_gem_shmem_funcs::sync to
drm_gem_shmem_object_sync() to avoid changing the behavior of drivers
currently relying on the default gem_shmem vtable.

v2:
- s/drm_gem_shmem_sync_mmap/drm_gem_shmem_sync/
- Change the prototype to match drm_gem_object_funcs::sync()
- Add a wrapper for drm_gem_object_funcs::sync()

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 89 ++++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     | 11 ++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index dc94a27710e5..4094bd243cc8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -690,6 +690,95 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 
+/**
+ * drm_gem_shmem_sync - Sync CPU-mapped data to/from the device
+ * @shmem: shmem GEM object
+ * @offset: Offset into the GEM object
+ * @size: Size of the area to sync
+ * @access: Flags describing the access to sync for
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
+		       size_t size, enum drm_gem_object_access_flags access)
+{
+	bool for_dev = (access & DRM_GEM_OBJECT_ACCESSOR_MASK) == DRM_GEM_OBJECT_DEV_ACCESS;
+	u32 access_type = access & DRM_GEM_OBJECT_ACCESS_TYPE_MASK;
+	struct drm_device *dev = shmem->base.dev;
+	enum dma_data_direction dir;
+	struct sg_table *sgt;
+	struct scatterlist *sgl;
+	unsigned int count;
+
+	if (access_type == DRM_GEM_OBJECT_RW_ACCESS)
+		dir = DMA_BIDIRECTIONAL;
+	else if (access_type == DRM_GEM_OBJECT_READ_ACCESS)
+		dir = for_dev ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	else if (access_type == DRM_GEM_OBJECT_WRITE_ACCESS)
+		dir = for_dev ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	else
+		return 0;
+
+	/* Don't bother if it's WC-mapped */
+	if (shmem->map_wc)
+		return 0;
+
+	if (size == 0)
+		return 0;
+
+	if (offset + size < offset || offset + size > shmem->base.size)
+		return -EINVAL;
+
+	if (drm_gem_is_imported(&shmem->base)) {
+		/* We can't do fine-grained syncs with dma_buf and there's no
+		 * easy way to guarantee that CPU caches/memory won't get
+		 * impacted by the buffer-wide synchronization, so let's fail
+		 * instead of pretending we can cope with that.
+		 */
+		if (offset != 0 || size != shmem->base.size)
+			return -EINVAL;
+
+		struct dma_buf *dma_buf = shmem->base.import_attach->dmabuf;
+
+		if (for_dev)
+			return dma_buf_end_cpu_access(dma_buf, dir);
+		else
+			return dma_buf_begin_cpu_access(dma_buf, dir);
+	}
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	for_each_sgtable_dma_sg(sgt, sgl, count) {
+		if (size == 0)
+			break;
+
+		dma_addr_t paddr = sg_dma_address(sgl);
+		size_t len = sg_dma_len(sgl);
+
+		if (len <= offset) {
+			offset -= len;
+			continue;
+		}
+
+		paddr += offset;
+		len -= offset;
+		len = min_t(size_t, len, size);
+		size -= len;
+		offset = 0;
+
+		if (for_dev)
+			dma_sync_single_for_device(dev->dev, paddr, len, dir);
+		else
+			dma_sync_single_for_cpu(dev->dev, paddr, len, dir);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_sync);
+
 /**
  * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
  * @shmem: shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 589f7bfe7506..6363e4ac9163 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -123,6 +123,8 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 				 struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
+int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
+		       size_t size, enum drm_gem_object_access_flags access);
 
 int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
@@ -279,6 +281,15 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+static inline int
+drm_gem_shmem_object_sync(struct drm_gem_object *obj, size_t offset,
+			  size_t size, enum drm_gem_object_access_flags access)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_sync(shmem, offset, size, access);
+}
+
 /*
  * Driver ops
  */
-- 
2.51.0

