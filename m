Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE141EF93
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177336ECFF;
	Fri,  1 Oct 2021 14:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196D66ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:34:36 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4FEEE1F457AC;
 Fri,  1 Oct 2021 15:34:35 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 3/5] drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
Date: Fri,  1 Oct 2021 16:34:25 +0200
Message-Id: <20211001143427.1564786-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211001143427.1564786-1-boris.brezillon@collabora.com>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
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

So we can create GPU mappings without R/W permissions. Particularly
useful to debug corruptions caused by out-of-bound writes.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 ++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  8 +++++++-
 include/uapi/drm/panfrost_drm.h         |  2 ++
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 82ad9a67f251..b29ac942ae2d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -75,6 +75,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 	return 0;
 }
 
+#define PANFROST_BO_FLAGS \
+	(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP | \
+	 PANFROST_BO_NOREAD | PANFROST_BO_NOWRITE)
+
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -84,7 +88,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	struct panfrost_gem_mapping *mapping;
 
 	if (!args->size || args->pad ||
-	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
+	    (args->flags & ~PANFROST_BO_FLAGS))
 		return -EINVAL;
 
 	/* Heaps should never be executable */
@@ -92,6 +96,11 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	    !(args->flags & PANFROST_BO_NOEXEC))
 		return -EINVAL;
 
+	/* Executable implies readable */
+	if ((args->flags & PANFROST_BO_NOREAD) &&
+	    !(args->flags & PANFROST_BO_NOEXEC))
+		return -EINVAL;
+
 	bo = panfrost_gem_create_with_handle(file, dev, args->size, args->flags,
 					     &args->handle);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 23377481f4e3..d6c1bb1445f2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -251,6 +251,8 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 
 	bo = to_panfrost_bo(&shmem->base);
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
+	bo->noread = !!(flags & PANFROST_BO_NOREAD);
+	bo->nowrite = !!(flags & PANFROST_BO_NOWRITE);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
 
 	/*
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8088d5fd8480..6246b5fef446 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -37,6 +37,8 @@ struct panfrost_gem_object {
 	atomic_t gpu_usecount;
 
 	bool noexec		:1;
+	bool noread		:1;
+	bool nowrite		:1;
 	bool is_heap		:1;
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index f51d3f791a17..6a5c9d94d6f2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -307,7 +307,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct drm_gem_object *obj = &bo->base.base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
-	int prot = IOMMU_READ | IOMMU_WRITE;
+	int prot = 0;
 
 	if (WARN_ON(mapping->active))
 		return 0;
@@ -315,6 +315,12 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (bo->noexec)
 		prot |= IOMMU_NOEXEC;
 
+	if (!bo->nowrite)
+		prot |= IOMMU_WRITE;
+
+	if (!bo->noread)
+		prot |= IOMMU_READ;
+
 	sgt = drm_gem_shmem_get_pages_sgt(obj);
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 061e700dd06c..a2de81225125 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -86,6 +86,8 @@ struct drm_panfrost_wait_bo {
 
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2
+#define PANFROST_BO_NOREAD	4
+#define PANFROST_BO_NOWRITE	8
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
-- 
2.31.1

