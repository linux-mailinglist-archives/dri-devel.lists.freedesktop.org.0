Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF6CACCDE
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF610E41C;
	Mon,  8 Dec 2025 10:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b6GRMMpp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DDF10E416
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188538;
 bh=njWDuxd+IygGjxvrIPhpR6lzR86ZGXxny7DYits7UXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b6GRMMppznjXt4VZVETyfA/hpP7kCtJeZEuk7t5rMPXfXeAEyfrn/s+2Enpc+pziZ
 MkoLzx6BFp5ALfd1rLeY8OXtCOnIYYBDurU3puSOqaiwC3XLuTH21oDSlp0CwVWvM4
 horBKsyy96uLPODqlJzPiLYDSDNzGDNN5oxDi3tvwEedxXZs7Y+oeXEFrXcMjALnr1
 7IQ0i96E8YzyOgGfZBYy3g/F49TWExSCeod1ywEoSQcPj3S8L9K+2pMGPfC/+Un333
 +FsDIRkMFFwnITyzTDfBOvuk1/VNHirRWonc0y3aWGmHNSZl7D/Mqj/d9ea98B0IdD
 tkl4YgWr1K5Nw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B863B17E153D;
 Mon,  8 Dec 2025 11:08:57 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v8 12/13] drm/panfrost: Add flag to map GEM object Write-Back
 Cacheable
Date: Mon,  8 Dec 2025 11:08:39 +0100
Message-ID: <20251208100841.730527-13-boris.brezillon@collabora.com>
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

Will be used by the UMD to optimize CPU accesses to buffers
that are frequently read by the CPU, or on which the access
pattern makes non-cacheable mappings inefficient.

Mapping buffers CPU-cached implies taking care of the CPU
cache maintenance in the UMD, unless the GPU is IO coherent.

v2:
- Add more to the commit message

v3:
- No changes

v4:
- Fix the map_wc test in panfrost_ioctl_query_bo_info()

v5:
- Drop Steve's R-b (enough has changed to justify a new review)

v6:
- Collect R-b

v7:
- No changes

v8:
- Fix double drm_gem_object_funcs::export assignment

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c | 32 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  5 ++++
 include/uapi/drm/panfrost_drm.h         |  5 +++-
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b191795d88cd..43a453ee9614 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -126,6 +126,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 	return 0;
 }
 
+#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
+				 PANFROST_BO_HEAP | \
+				 PANFROST_BO_WB_MMAP)
+
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -135,8 +139,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	struct panfrost_gem_mapping *mapping;
 	int ret;
 
-	if (!args->size || args->pad ||
-	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
+	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
 		return -EINVAL;
 
 	/* Heaps should never be executable */
@@ -656,6 +659,9 @@ static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
 
 		if (bo->is_heap)
 			args->create_flags |= PANFROST_BO_HEAP;
+
+		if (!bo->base.map_wc)
+			args->create_flags |= PANFROST_BO_WB_MMAP;
 	}
 
 	drm_gem_object_put(gem_obj);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8231ae04f54c..bdc2fec1b353 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -426,12 +426,42 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	return &obj->base.base;
 }
 
+static bool
+should_map_wc(struct panfrost_gem_object *bo)
+{
+	struct panfrost_device *pfdev = to_panfrost_device(bo->base.base.dev);
+
+	/* We can't do uncached mappings if the device is coherent,
+	 * because the zeroing done by the shmem layer at page allocation
+	 * time happens on a cached mapping which isn't CPU-flushed (at least
+	 * not on Arm64 where the flush is deferred to PTE setup time, and
+	 * only done conditionally based on the mapping permissions). We can't
+	 * rely on dma_map_sgtable()/dma_sync_sgtable_for_xxx() either to flush
+	 * those, because they are NOPed if dma_dev_coherent() returns true.
+	 */
+	if (pfdev->coherent)
+		return false;
+
+	/* Cached mappings are explicitly requested, so no write-combine. */
+	if (bo->wb_mmap)
+		return false;
+
+	/* The default is write-combine. */
+	return true;
+}
+
 struct panfrost_gem_object *
 panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct panfrost_gem_object *bo;
 
+	/* The heap buffer is not supposed to be CPU-visible, so don't allow
+	 * WB_MMAP on those.
+	 */
+	if ((flags & PANFROST_BO_HEAP) && (flags & PANFROST_BO_WB_MMAP))
+		return ERR_PTR(-EINVAL);
+
 	/* Round up heap allocations to 2MB to keep fault handling simple */
 	if (flags & PANFROST_BO_HEAP)
 		size = roundup(size, SZ_2M);
@@ -443,6 +473,8 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 	bo = to_panfrost_bo(&shmem->base);
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
+	bo->wb_mmap = !!(flags & PANFROST_BO_WB_MMAP);
+	bo->base.map_wc = should_map_wc(bo);
 
 	return bo;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index d61ffe1f6841..3095c570ee5f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -98,6 +98,11 @@ struct panfrost_gem_object {
 	bool noexec		:1;
 	bool is_heap		:1;
 
+	/* On coherent devices, this reflects the creation flags, not the true
+	 * cacheability attribute of the mapping.
+	 */
+	bool wb_mmap		:1;
+
 #ifdef CONFIG_DEBUG_FS
 	struct panfrost_gem_debugfs debugfs;
 #endif
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 36ae48ea50d3..50d5337f35ef 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -124,9 +124,12 @@ struct drm_panfrost_wait_bo {
 	__s64 timeout_ns;
 };
 
-/* Valid flags to pass to drm_panfrost_create_bo */
+/* Valid flags to pass to drm_panfrost_create_bo.
+ * PANFROST_BO_WB_MMAP can't be set if PANFROST_BO_HEAP is.
+ */
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2
+#define PANFROST_BO_WB_MMAP	4
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
-- 
2.51.1

