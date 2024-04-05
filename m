Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B443589A596
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13510FEB2;
	Fri,  5 Apr 2024 20:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="i9HrSFa7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7611287A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rel46GAZqiNR0Uiew9qnWeBqWRATfL6MWcuJZHlQqxk=; b=i9HrSFa7gxEu/skxi4Xn3wQILw
 rJkb2uklS86ymWKjrtIYAsaIlp8vLCmzqxlt0XJsxtZt3c/+YXSnSRF2LJhrI9qA5sV2cd92WOpPx
 fuHfbpChYHX8XtB9v66ZLLUAtPH7R5oqGpnVxKb1Q9feIgeecUKemsUVq8LL7eh6ZEhpwwJ4j8hlF
 mzlH3o/X7aLcSw+BBuDDHYUApiwcI4czQqp0qJMht11cfAVb/hp7Eg54eNXjFxqB5vn5b1NeLkIPh
 YNz7Mh5m+bGnVWG176swgpEql2I1B9w4pZMGNbxO5r6JYbsNrfXCbd2REUf9s+ACE/4x9+mvynAtX
 KBwCC4yw==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rsq1T-001kwR-Oa; Fri, 05 Apr 2024 22:18:52 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 6/6] drm/v3d: Enable big and super pages
Date: Fri,  5 Apr 2024 15:29:09 -0300
Message-ID: <20240405201753.1176914-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405201753.1176914-1-mcanal@igalia.com>
References: <20240405201753.1176914-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The V3D MMU also supports 64KB and 1MB pages, called big and super pages,
respectively. In order to set a 64KB page or 1MB page in the MMU, we need
to make sure that page table entries for all 4KB pages within a big/super
page must be correctly configured.

In order to create a big/super page, we need a contiguous memory region.
That's why we use a separate mountpoint with THP enabled. In order to
place the page table entries in the MMU, we iterate over the 16 4KB pages
(for big pages) or 256 4KB pages (for super pages) and insert the PTE.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c    | 21 +++++++++++++--
 drivers/gpu/drm/v3d/v3d_drv.c   |  8 ++++++
 drivers/gpu/drm/v3d/v3d_drv.h   |  2 ++
 drivers/gpu/drm/v3d/v3d_gemfs.c |  6 +++++
 drivers/gpu/drm/v3d/v3d_mmu.c   | 46 ++++++++++++++++++++++++++-------
 5 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 79e31c5299b1..cfe82232886a 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -94,6 +94,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 	struct sg_table *sgt;
+	u64 align;
 	int ret;

 	/* So far we pin the BO in the MMU for its lifetime, so use
@@ -103,6 +104,15 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);

+	if (!v3d->super_pages)
+		align = SZ_4K;
+	else if (obj->size >= SZ_1M)
+		align = SZ_1M;
+	else if (obj->size >= SZ_64K)
+		align = SZ_64K;
+	else
+		align = SZ_4K;
+
 	spin_lock(&v3d->mm_lock);
 	/* Allocate the object's space in the GPU's page tables.
 	 * Inserting PTEs will happen later, but the offset is for the
@@ -110,7 +120,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	 */
 	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
 					 obj->size >> V3D_MMU_PAGE_SHIFT,
-					 SZ_4K >> V3D_MMU_PAGE_SHIFT, 0, 0);
+					 align >> V3D_MMU_PAGE_SHIFT, 0, 0);
 	spin_unlock(&v3d->mm_lock);
 	if (ret)
 		return ret;
@@ -130,10 +140,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 			     size_t unaligned_size)
 {
 	struct drm_gem_shmem_object *shmem_obj;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_bo *bo;
 	int ret;

-	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
+	/* Let the user opt out of allocating the BOs with THP */
+	if (v3d->super_pages)
+		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
+							  v3d->gemfs);
+	else
+		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
+
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 3debf37e7d9b..3dbd29560be4 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -36,6 +36,12 @@
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0

+static bool super_pages = true;
+module_param_named(super_pages, super_pages, bool, 0400);
+MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support. Note: \
+			       To enable Super Pages, you need support to \
+			       enable THP.");
+
 static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
@@ -308,6 +314,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}

+	v3d->super_pages = super_pages;
+
 	ret = v3d_gem_init(drm);
 	if (ret)
 		goto dma_free;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 17236ee23490..0a7aacf51164 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -18,6 +18,7 @@ struct platform_device;
 struct reset_control;

 #define V3D_MMU_PAGE_SHIFT 12
+#define V3D_PAGE_FACTOR (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT)

 #define V3D_MAX_QUEUES (V3D_CPU + 1)

@@ -121,6 +122,7 @@ struct v3d_dev {
 	 * tmpfs instance used for shmem backed objects
 	 */
 	struct vfsmount *gemfs;
+	bool super_pages;

 	struct work_struct overflow_mem_work;

diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index 31cf5bd11e39..7ee55b32c36e 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -12,6 +12,10 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
 	struct file_system_type *type;
 	struct vfsmount *gemfs;

+	/* The user doesn't want support for Super Pages */
+	if (!v3d->super_pages)
+		goto err;
+
 	/*
 	 * By creating our own shmemfs mountpoint, we can pass in
 	 * mount flags that better match our usecase. However, we
@@ -35,6 +39,8 @@ void v3d_gemfs_init(struct v3d_dev *v3d)

 err:
 	v3d->gemfs = NULL;
+	v3d->super_pages = false;
+
 	drm_notice(&v3d->drm,
 		   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
 }
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 14f3af40d6f6..48a240c44a22 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -25,9 +25,16 @@
  * superpage bit set.
  */
 #define V3D_PTE_SUPERPAGE BIT(31)
+#define V3D_PTE_BIGPAGE BIT(30)
 #define V3D_PTE_WRITEABLE BIT(29)
 #define V3D_PTE_VALID BIT(28)

+static bool v3d_mmu_is_aligned(u32 page, u32 pte, size_t alignment)
+{
+	return IS_ALIGNED(page, alignment >> V3D_MMU_PAGE_SHIFT) &&
+		IS_ALIGNED(pte, alignment >> V3D_MMU_PAGE_SHIFT);
+}
+
 static int v3d_mmu_flush_all(struct v3d_dev *v3d)
 {
 	int ret;
@@ -88,18 +95,37 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
 	u32 page = bo->node.start;
 	u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
-	struct sg_dma_page_iter dma_iter;
+	struct scatterlist *sgl;
+	unsigned int count;

-	for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
-		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
+	for_each_sgtable_dma_sg(shmem_obj->sgt, sgl, count) {
+		dma_addr_t dma_addr = sg_dma_address(sgl);
 		u32 page_address = dma_addr >> V3D_MMU_PAGE_SHIFT;
-		u32 pte = page_prot | page_address;
-		u32 i;
-
-		BUG_ON(page_address + (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT) >=
-		       BIT(24));
-		for (i = 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT; i++)
-			v3d->pt[page++] = pte + i;
+		size_t len = sg_dma_len(sgl);
+		u32 i, page_size = 0;
+
+		while (len > 0) {
+			u32 pte = page_prot | page_address;
+
+			BUG_ON(page_address + V3D_PAGE_FACTOR >= BIT(24));
+
+			if (len >= SZ_1M && v3d_mmu_is_aligned(page, pte, SZ_1M)) {
+				page_size = SZ_1M;
+				pte |= V3D_PTE_SUPERPAGE;
+			} else if (len >= SZ_64K && v3d_mmu_is_aligned(page, pte, SZ_64K)) {
+				page_size = SZ_64K;
+				pte |= V3D_PTE_BIGPAGE;
+			} else {
+				page_size = SZ_4K;
+			}
+
+			for (i = 0; i < page_size >> V3D_MMU_PAGE_SHIFT; i++) {
+				v3d->pt[page++] = pte + i;
+				page_address++;
+			}
+
+			len -= page_size;
+		}
 	}

 	WARN_ON_ONCE(page - bo->node.start !=
--
2.44.0

