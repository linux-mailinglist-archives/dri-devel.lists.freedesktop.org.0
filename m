Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C8C20763
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6061510E99D;
	Thu, 30 Oct 2025 14:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lJw34kci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A1310E993;
 Thu, 30 Oct 2025 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833139;
 bh=3rG5aKg+AL5ZQCR4iB2jiQLGJuYBkDRu5tq3RKVGZvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lJw34kcivR9NsQwvKNLFFEY9/Lt1CU3uVQRRYhjGeaBfkQSxSCzf/4vYEkqg+RAW0
 9nlzu2lHOM6NMkO2CI7QMB5NEIfj4BBtsK6RHYPMnrcsHsKHiOtLW0IGAkdftOMpbO
 JezqqWun+CIvGScRZ2j4ENTytdVErUEEQb7dS8vo8fXLkouwyQ8wrrQxWbCS4k+to3
 tMN5aFn/99mHmKR1TLMSevKQjJnk3nDpcTifKq2Z/dZeLyXU9sn+o42F8YqoBIqoOR
 EvB4rKV9mBwzlZ3p7gEKSvZtIcYdWqCFhZdi9ZeVt3+4cN9nz96onJYhwkFKtumIrq
 +4a9NFgMTz+7g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DA8D217E1413;
 Thu, 30 Oct 2025 15:05:38 +0100 (CET)
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
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 03/16] drm/shmem: Add a drm_gem_shmem_sync() helper
Date: Thu, 30 Oct 2025 15:05:12 +0100
Message-ID: <20251030140525.366636-4-boris.brezillon@collabora.com>
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This enables syncing mapped GEM objects between the CPU and GPU via calls
to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
so it's best if every driver doesn't hand-roll it.

v2:
- s/drm_gem_shmem_sync_mmap/drm_gem_shmem_sync/
- Change the prototype to match drm_gem_object_funcs::sync()
- Add a wrapper for drm_gem_object_funcs::sync()

v3:
- No changes

v4:
- Add Steve's R-b

v5:
- Change the semantics of the drm_gem_shmem_sync() helper to better
  reflect the UMD cache flush/flush+invalidate semantics (discussed
  with Faith)
- Drop R-bs

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 93 ++++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     | 14 ++++
 2 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e49c75739c20..d9266e22a0dc 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -690,6 +690,99 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 
+/**
+ * drm_gem_shmem_sync - Sync CPU-mapped data
+ * @shmem: shmem GEM object
+ * @offset: Offset into the GEM object
+ * @size: Size of the area to sync
+ * @type: Type of synchronization
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
+		       size_t size, enum drm_gem_shmem_sync_type type)
+{
+	const struct drm_device *dev = shmem->base.dev;
+	struct sg_table *sgt;
+	struct scatterlist *sgl;
+	unsigned int count;
+
+	/* Make sure the range is in bounds. */
+	if (offset + size < offset || offset + size > shmem->base.size)
+		return -EINVAL;
+
+	/* Disallow CPU-cache maintenance on imported buffers. */
+	if (drm_gem_is_imported(&shmem->base))
+		return -EINVAL;
+
+	switch (type) {
+	case DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH:
+	case DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/* Don't bother if it's WC-mapped */
+	if (shmem->map_wc)
+		return 0;
+
+	/* Nothing to do if the size is zero. */
+	if (size == 0)
+		return 0;
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
+		/* It's unclear whether dma_sync_xxx() is the right API to do CPU
+		 * cache maintenance given an IOMMU can register their own
+		 * implementation doing more than just CPU cache flushes/invalidation,
+		 * and what we really care about here is CPU caches only, but that's
+		 * the best we have that is both arch-agnostic and does at least the
+		 * CPU cache maintenance on a <page,offset,size> tuple.
+		 *
+		 * Also, I wish we could do a single
+		 *
+		 *	dma_sync_single_for_device(BIDIR)
+		 *
+		 * and get a flush+invalidate, but that's not how it's implemented
+		 * in practice (at least on arm64), so we have to make it
+		 *
+		 *	dma_sync_single_for_device(TO_DEVICE)
+		 *	dma_sync_single_for_cpu(FROM_DEVICE)
+		 *
+		 * for the flush+invalidate case.
+		 */
+		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
+		if (type == DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
+			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
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
index 075275d6b2fd..b0b6d0104a9a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -124,6 +124,20 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 				 struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
+/**
+ * enum enum drm_gem_shmem_sync_type - Type of synchronization
+ */
+enum drm_gem_shmem_sync_type {
+	/** DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH: Flush CPU caches */
+	DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH = 0,
+
+	/** DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and invalidate CPU caches */
+	DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE,
+};
+
+int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
+		       size_t size, enum drm_gem_shmem_sync_type type);
+
 int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
 
-- 
2.51.0

