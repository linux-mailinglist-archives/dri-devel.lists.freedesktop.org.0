Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0290C20780
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F385110E9B6;
	Thu, 30 Oct 2025 14:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="d8glrrf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8758110E9AB;
 Thu, 30 Oct 2025 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833152;
 bh=GY9wMgktOBJ7uArfwVtp9Q3Yv5RK7UzEPvARpt6v/hU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d8glrrf0k/zCgXfVKKerD3H+qnngE28McfepvdZSn77a/IoAK7Zy5xx/G8RHralun
 ++JRbzF1vWNHkQwqxy8+zt0qs4NF8o6SOHUCdawT6rR/LQtb7m+8HiaK2a1IcPKE2Y
 2Uv/1qNY5HUNORhBKOD9AaXOtRsABTpDsjpaJeincDpNGIFBYn5OgQN5RL8K7QQ3+F
 OgqzDHciX65rYwl09O3bdguwjWMWwLV68LCs8l+cukD3sO+W3N0hhZQOfPVqkS4SXu
 HNa2g7b5rD5RQcMxpJeCzDbbchg3AOhREiQIdhhCo178K6Oue3Mm4+4hYV7TIxUd8Y
 e/CVWhjUzQTSw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 57CCF17E37D0;
 Thu, 30 Oct 2025 15:05:51 +0100 (CET)
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
Subject: [PATCH v5 15/16] drm/panfrost: Add flag to map GEM object Write-Back
 Cacheable
Date: Thu, 30 Oct 2025 15:05:24 +0100
Message-ID: <20251030140525.366636-16-boris.brezillon@collabora.com>
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c | 33 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  5 ++++
 include/uapi/drm/panfrost_drm.h         |  5 +++-
 4 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ba03a4420264..74b7dc75d88b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -125,6 +125,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 	return 0;
 }
 
+#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
+				 PANFROST_BO_HEAP | \
+				 PANFROST_BO_WB_MMAP)
+
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -134,8 +138,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	struct panfrost_gem_mapping *mapping;
 	int ret;
 
-	if (!args->size || args->pad ||
-	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
+	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
 		return -EINVAL;
 
 	/* Heaps should never be executable */
@@ -652,6 +655,9 @@ static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
 
 		if (bo->is_heap)
 			args->create_flags |= PANFROST_BO_HEAP;
+
+		if (!bo->base.map_wc)
+			args->create_flags |= PANFROST_BO_WB_MMAP;
 	}
 
 	drm_gem_object_put(gem_obj);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 05d3f8a6fa78..1c600939c17a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -269,6 +269,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.export = drm_gem_prime_export,
 	.status = panfrost_gem_status,
 	.rss = panfrost_gem_rss,
 	.vm_ops = &drm_gem_shmem_vm_ops,
@@ -302,12 +303,42 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
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
@@ -319,6 +350,8 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 	bo = to_panfrost_bo(&shmem->base);
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
+	bo->wb_mmap = !!(flags & PANFROST_BO_WB_MMAP);
+	bo->base.map_wc = should_map_wc(bo);
 
 	return bo;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 87b918f30baa..d2d532b3007a 100644
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
index 743c79a38f1b..82f4e69bafb4 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -101,9 +101,12 @@ struct drm_panfrost_wait_bo {
 	__s64 timeout_ns;	/* absolute */
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
2.51.0

