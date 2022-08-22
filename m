Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C30659CB46
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 00:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FCFA4767;
	Mon, 22 Aug 2022 22:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 786A0A474E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 22:01:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 565DB12FC;
 Mon, 22 Aug 2022 15:01:45 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C0FA3F67D;
 Mon, 22 Aug 2022 15:01:41 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH] drm/panfrost: Update io-pgtable API
Date: Mon, 22 Aug 2022 23:01:27 +0100
Message-Id: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
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
Cc: linux-arm-kernel@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert to io-pgtable's bulk {map,unmap}_pages() APIs, to help the old
single-page interfaces eventually go away. Unmapping heap BOs still
wants to be done a page at a time, but everything else can get the full
benefit of the more efficient interface.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 40 +++++++++++++++----------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b285a8001b1d..e246d914e7f6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -248,11 +248,15 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
 	mmu_write(pfdev, MMU_INT_MASK, ~0);
 }
 
-static size_t get_pgsize(u64 addr, size_t size)
+static size_t get_pgsize(u64 addr, size_t size, size_t *count)
 {
-	if (addr & (SZ_2M - 1) || size < SZ_2M)
-		return SZ_4K;
+	size_t blk_offset = -addr % SZ_2M;
 
+	if (blk_offset || size < SZ_2M) {
+		*count = min_not_zero(blk_offset, size) / SZ_4K;
+		return SZ_4K;
+	}
+	*count = size / SZ_2M;
 	return SZ_2M;
 }
 
@@ -287,12 +291,16 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 		dev_dbg(pfdev->dev, "map: as=%d, iova=%llx, paddr=%lx, len=%zx", mmu->as, iova, paddr, len);
 
 		while (len) {
-			size_t pgsize = get_pgsize(iova | paddr, len);
+			size_t pgcount, mapped = 0;
+			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
 
-			ops->map(ops, iova, paddr, pgsize, prot, GFP_KERNEL);
-			iova += pgsize;
-			paddr += pgsize;
-			len -= pgsize;
+			ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
+				       GFP_KERNEL, &mapped);
+			/* Don't get stuck if things have gone wrong */
+			mapped = max(mapped, pgsize);
+			iova += mapped;
+			paddr += mapped;
+			len -= mapped;
 		}
 	}
 
@@ -344,15 +352,17 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 		mapping->mmu->as, iova, len);
 
 	while (unmapped_len < len) {
-		size_t unmapped_page;
-		size_t pgsize = get_pgsize(iova, len - unmapped_len);
+		size_t unmapped_page, pgcount;
+		size_t pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
 
-		if (ops->iova_to_phys(ops, iova)) {
-			unmapped_page = ops->unmap(ops, iova, pgsize, NULL);
-			WARN_ON(unmapped_page != pgsize);
+		if (bo->is_heap)
+			pgcount = 1;
+		if (!bo->is_heap || ops->iova_to_phys(ops, iova)) {
+			unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+			WARN_ON(unmapped_page != pgsize * pgcount);
 		}
-		iova += pgsize;
-		unmapped_len += pgsize;
+		iova += pgsize * pgcount;
+		unmapped_len += pgsize * pgcount;
 	}
 
 	panfrost_mmu_flush_range(pfdev, mapping->mmu,
-- 
2.36.1.dirty

