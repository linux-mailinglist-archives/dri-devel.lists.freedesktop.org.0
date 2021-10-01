Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61C41EF92
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8B6ED06;
	Fri,  1 Oct 2021 14:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3736ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:34:37 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C38461F457AD;
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
Subject: [PATCH v2 4/5] drm/panfrost: Add a PANFROST_BO_GPUONLY flag
Date: Fri,  1 Oct 2021 16:34:26 +0200
Message-Id: <20211001143427.1564786-5-boris.brezillon@collabora.com>
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

This lets the driver reduce shareability domain of the MMU mapping,
which can in turn reduce access time and save power on cache-coherent
systems.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 ++-
 drivers/gpu/drm/panfrost/panfrost_gem.c | 1 +
 drivers/gpu/drm/panfrost/panfrost_gem.h | 1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 3 +++
 include/uapi/drm/panfrost_drm.h         | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b29ac942ae2d..b176921b9392 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -77,7 +77,8 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 
 #define PANFROST_BO_FLAGS \
 	(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP | \
-	 PANFROST_BO_NOREAD | PANFROST_BO_NOWRITE)
+	 PANFROST_BO_NOREAD | PANFROST_BO_NOWRITE | \
+	 PANFROST_BO_GPUONLY)
 
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index d6c1bb1445f2..4b1f85c0b98f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -254,6 +254,7 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 	bo->noread = !!(flags & PANFROST_BO_NOREAD);
 	bo->nowrite = !!(flags & PANFROST_BO_NOWRITE);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
+	bo->gpuonly = !!(flags & PANFROST_BO_GPUONLY);
 
 	/*
 	 * Allocate an id of idr table where the obj is registered
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 6246b5fef446..e332d5a4c24f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -40,6 +40,7 @@ struct panfrost_gem_object {
 	bool noread		:1;
 	bool nowrite		:1;
 	bool is_heap		:1;
+	bool gpuonly		:1;
 };
 
 struct panfrost_gem_mapping {
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 6a5c9d94d6f2..89eee8e80aa5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -321,6 +321,9 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (!bo->noread)
 		prot |= IOMMU_READ;
 
+	if (bo->gpuonly)
+		prot |= IOMMU_DEVONLY;
+
 	sgt = drm_gem_shmem_get_pages_sgt(obj);
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index a2de81225125..538b58b2d095 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -88,6 +88,7 @@ struct drm_panfrost_wait_bo {
 #define PANFROST_BO_HEAP	2
 #define PANFROST_BO_NOREAD	4
 #define PANFROST_BO_NOWRITE	8
+#define PANFROST_BO_GPUONLY	0x10
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
-- 
2.31.1

