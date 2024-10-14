Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230F99DA31
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BA510E4E5;
	Mon, 14 Oct 2024 23:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="I/Tif45k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333510E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 23:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728949110; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xbom7hRmOLyTDvGutlUXv+fKn2jgZQFCGDuowQWULzvfeAQDgalBz97lHDzeA++E51MfB1/8EIGOHoDEWo0j0iEii+rz3x6voXfYZBPkkeM7/tCIu2U45OZSM0fSpfWo07Dtmg6CzEiwNCII656oILF14N3WSYvi21wwCzP/U2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728949110;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cTKk0WNBcIa96646eTQzjonKMBIEq894GB/+vwgj7o0=; 
 b=nLlK/3svCz9v5UKUpQdC+dOjU1s0iT6N3iZgvvdXYNvQ56d6mDYHEFkXoyeNKGRplymdc0c8s3/bjNRvv4+pIIZtJIW5x7s4jvnnNObnB2PQWdy/jnEMaHAfDLWqrla5wrgu/NQIBAqkD0jvYOxZ1EoJOB2TTgyZB9u/ckbg8H8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949110; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=cTKk0WNBcIa96646eTQzjonKMBIEq894GB/+vwgj7o0=;
 b=I/Tif45kGUkevat81fxHuNj+cKY3s8GzlScFhaPnt6nFNWPVyMfcojOo/UWH59tM
 Ns5P7uiG1MlU0S2+4EtbI/4wYhjdABhiXQI4MQ2UnVjHkq6NKDE0WOElAmgncsF/Ses
 nmUBgp2eWHdMioLyEAeC0bGGh/1kkDY2pQdXI5HY=
Received: by mx.zohomail.com with SMTPS id 1728949108582336.2330557385968;
 Mon, 14 Oct 2024 16:38:28 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] drm/panfrost: Handle page mapping failure
Date: Tue, 15 Oct 2024 00:31:40 +0100
Message-ID: <20241014233758.994861-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
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

Right now Panfrost's GPU page fault IRQ assumes the architectural page
mapping function always suceeds. That might not always be the case, so we
haravest its return status and unmap whatever we had mapped so far.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 66 +++++++++++++++++--------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 8514a02d306d..03fbb12804ab 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -291,13 +291,34 @@ static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
 	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
+static void mmu_unmap_range(size_t len, u64 iova, bool is_heap,
+			    struct io_pgtable_ops *ops)
+{
+	size_t unmapped_len = 0;
+
+	while (unmapped_len < len) {
+		size_t unmapped_page, pgcount;
+		size_t pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
+
+		if (is_heap)
+			pgcount = 1;
+		if (!is_heap || ops->iova_to_phys(ops, iova)) {
+			unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+			WARN_ON(unmapped_page != pgsize * pgcount);
+		}
+		iova += pgsize * pgcount;
+		unmapped_len += pgsize * pgcount;
+	}
+}
+
 static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
-		      u64 iova, int prot, struct sg_table *sgt)
+		      u64 iova, int prot, struct sg_table *sgt, bool is_heap)
 {
 	unsigned int count;
 	struct scatterlist *sgl;
 	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
 	u64 start_iova = iova;
+	int ret;
 
 	for_each_sgtable_dma_sg(sgt, sgl, count) {
 		unsigned long paddr = sg_dma_address(sgl);
@@ -311,8 +332,13 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 			size_t pgcount, mapped = 0;
 			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
 
-			ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
+			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
 				       GFP_KERNEL, &mapped);
+			if (ret) {
+				/* Unmap everything we mapped and bail out */
+				mmu_unmap_range(mapped, start_iova, is_heap, ops);
+				return ret;
+			}
 			/* Don't get stuck if things have gone wrong */
 			mapped = max(mapped, pgsize);
 			iova += mapped;
@@ -334,6 +360,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE;
+	int ret;
 
 	if (WARN_ON(mapping->active))
 		return 0;
@@ -345,8 +372,13 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
 
-	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
-		   prot, sgt);
+	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
+			 prot, sgt, false);
+	if (ret) {
+		drm_gem_shmem_put_pages(shmem);
+		return ret;
+	}
+
 	mapping->active = true;
 
 	return 0;
@@ -360,7 +392,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 	struct io_pgtable_ops *ops = mapping->mmu->pgtbl_ops;
 	u64 iova = mapping->mmnode.start << PAGE_SHIFT;
 	size_t len = mapping->mmnode.size << PAGE_SHIFT;
-	size_t unmapped_len = 0;
+
 
 	if (WARN_ON(!mapping->active))
 		return;
@@ -368,19 +400,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 	dev_dbg(pfdev->base.dev, "unmap: as=%d, iova=%llx, len=%zx",
 		mapping->mmu->as, iova, len);
 
-	while (unmapped_len < len) {
-		size_t unmapped_page, pgcount;
-		size_t pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
-
-		if (bo->is_heap)
-			pgcount = 1;
-		if (!bo->is_heap || ops->iova_to_phys(ops, iova)) {
-			unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
-			WARN_ON(unmapped_page != pgsize * pgcount);
-		}
-		iova += pgsize * pgcount;
-		unmapped_len += pgsize * pgcount;
-	}
+	mmu_unmap_range(len, iova, bo->is_heap, ops);
 
 	panfrost_mmu_flush_range(pfdev, mapping->mmu,
 				 mapping->mmnode.start << PAGE_SHIFT, len);
@@ -533,8 +553,11 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	if (ret)
 		goto err_map;
 
-	mmu_map_sg(pfdev, bomapping->mmu, addr,
-		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
+	ret = mmu_map_sg(pfdev, bomapping->mmu, addr,
+			 IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC,
+			 sgt, true);
+	if (ret)
+		goto err_mmu_map_sg;
 
 	bomapping->active = true;
 	bo->heap_rss_size += SZ_2M;
@@ -548,6 +571,9 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 
 	return 0;
 
+err_mmu_map_sg:
+	dma_unmap_sgtable(pfdev->base.dev, sgt,
+			  DMA_BIDIRECTIONAL, 0);
 err_map:
 	sg_free_table(sgt);
 err_unlock:
-- 
2.46.2

