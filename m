Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C7959C6F6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941B38EBCD;
	Mon, 22 Aug 2022 18:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07647113567;
 Mon, 22 Aug 2022 18:47:05 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so12252296pjf.2; 
 Mon, 22 Aug 2022 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hNJnoLv/5u03Gc3FZcUv6HW87BdWPdf/MJiQ6bgU6aY=;
 b=Z5hQ4f1KZHVn6Rf56bcS2ztHd9S+0zc6FX/vOx0CCPu5n3DbqdZYPx7/o2zuHulWnM
 Z6kx+u4iAQa7FlF8joSXLKfDW6tGYYATW9Ko68JT0aeppcUontfTKm2vzPKuqU/MgeZj
 n4LGLPbTs6yu+n5Q6XhAbiU5EbmuUUIzlgIhKHMs7gd2gyHOgGZZhcGXqWRr4Rlbaguy
 0ln7iT0Kwmp1/otcTXU76/SiwuyK5Jw0A0R1zdIo4nNDF2Kkor4XCz8y2/Sf1d9wbX8k
 3lyOjdWmSa/JPRFPeFmUscPqQnkAckSQAvkZ+HYgysTVrqQ4xtacCDzFcb+g3X3KG2J9
 3CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hNJnoLv/5u03Gc3FZcUv6HW87BdWPdf/MJiQ6bgU6aY=;
 b=evciTx4uz7wJ1/Zc5eyvF6/TF965AF5AkfsOLbcfPYau2RRdzrKohviRMZ3ZwWiYw9
 NgB01mgybiLjFAkMP1FcDVGexsdgPGWzBN3kkwd6mdWN3zGebCjjOhvKqr2W/Z1Nk949
 SZGjdkZ6x3j8e/+Eq5ZjdoDGd4lldwUc5z0TIKq1HnBKgVAirVyEDRSEZ9lN2eLgla0c
 ewqbZLpnrE/7xu6mXWRZZ3frEkXwdXw7IIswMVleIZ6lAE3k71xzLQ0cI9jPS5SKoifd
 MipP26Q32gbsJ2zrdBrraGvZyVsKy/NvvPYsBkvZLhsrXADXu3Ot28pJkIIoW+3ytq89
 X2gw==
X-Gm-Message-State: ACgBeo1koCmVLDiq7gL/BXAk6qSWLUmQLiqfFMYmzC70PEq/BP0UcUpS
 +TwjUpoNz74ADvGhypYU4pYgZM2yYhw=
X-Google-Smtp-Source: AA6agR46jPCWWebDm8SZ5Yrt/HRYcHDiSjarv2sCQh1INfDofeZ1UMWIAczIxOKgDWaprj82bfTc/w==
X-Received: by 2002:a17:90a:cf89:b0:1fa:a98a:c61 with SMTP id
 i9-20020a17090acf8900b001faa98a0c61mr29779451pju.69.1661194024504; 
 Mon, 22 Aug 2022 11:47:04 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79492000000b005367a03d56csm3459616pfk.104.2022.08.22.11.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:47:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/iommu: optimize map/unmap
Date: Mon, 22 Aug 2022 11:47:42 -0700
Message-Id: <20220822184742.32076-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Using map_pages/unmap_pages cuts down on the # of pgtable walks needed
in the process of finding where to insert/remove an entry.  The end
result is ~5-10x faster than mapping a single page at a time.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 91 ++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a54ed354578b..0f3f60da3314 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -21,6 +21,7 @@ struct msm_iommu_pagetable {
 	struct msm_mmu base;
 	struct msm_mmu *parent;
 	struct io_pgtable_ops *pgtbl_ops;
+	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	phys_addr_t ttbr;
 	u32 asid;
 };
@@ -29,23 +30,85 @@ static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 	return container_of(mmu, struct msm_iommu_pagetable, base);
 }
 
+/* based on iommu_pgsize() in iommu.c: */
+static size_t iommu_pgsize(struct msm_iommu_pagetable *pagetable,
+			   unsigned long iova, phys_addr_t paddr,
+			   size_t size, size_t *count)
+{
+	unsigned int pgsize_idx, pgsize_idx_next;
+	unsigned long pgsizes;
+	size_t offset, pgsize, pgsize_next;
+	unsigned long addr_merge = paddr | iova;
+
+	/* Page sizes supported by the hardware and small enough for @size */
+	pgsizes = pagetable->pgsize_bitmap & GENMASK(__fls(size), 0);
+
+	/* Constrain the page sizes further based on the maximum alignment */
+	if (likely(addr_merge))
+		pgsizes &= GENMASK(__ffs(addr_merge), 0);
+
+	/* Make sure we have at least one suitable page size */
+	BUG_ON(!pgsizes);
+
+	/* Pick the biggest page size remaining */
+	pgsize_idx = __fls(pgsizes);
+	pgsize = BIT(pgsize_idx);
+	if (!count)
+		return pgsize;
+
+	/* Find the next biggest support page size, if it exists */
+	pgsizes = pagetable->pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
+	if (!pgsizes)
+		goto out_set_count;
+
+	pgsize_idx_next = __ffs(pgsizes);
+	pgsize_next = BIT(pgsize_idx_next);
+
+	/*
+	 * There's no point trying a bigger page size unless the virtual
+	 * and physical addresses are similarly offset within the larger page.
+	 */
+	if ((iova ^ paddr) & (pgsize_next - 1))
+		goto out_set_count;
+
+	/* Calculate the offset to the next page size alignment boundary */
+	offset = pgsize_next - (addr_merge & (pgsize_next - 1));
+
+	/*
+	 * If size is big enough to accommodate the larger page, reduce
+	 * the number of smaller pages.
+	 */
+	if (offset + pgsize_next <= size)
+		size = offset;
+
+out_set_count:
+	*count = size >> pgsize_idx;
+	return pgsize;
+}
+
 static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 		size_t size)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
-	size_t unmapped = 0;
 
 	/* Unmap the block one page at a time */
 	while (size) {
-		unmapped += ops->unmap(ops, iova, 4096, NULL);
-		iova += 4096;
-		size -= 4096;
+		size_t unmapped, pgsize, count;
+
+		pgsize = iommu_pgsize(pagetable, iova, iova, size, &count);
+
+		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
+		if (!unmapped)
+			break;
+
+		iova += unmapped;
+		size -= unmapped;
 	}
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (unmapped == size) ? 0 : -EINVAL;
+	return (size == 0) ? 0 : -EINVAL;
 }
 
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
@@ -54,7 +117,6 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
 	struct scatterlist *sg;
-	size_t mapped = 0;
 	u64 addr = iova;
 	unsigned int i;
 
@@ -64,15 +126,19 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 
 		/* Map the block one page at a time */
 		while (size) {
-			if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
-				msm_iommu_pagetable_unmap(mmu, iova, mapped);
+			size_t pgsize, count, mapped;
+
+			pgsize = iommu_pgsize(pagetable, addr, phys, size, &count);
+
+			if (ops->map_pages(ops, addr, phys, pgsize, count,
+					   prot, GFP_KERNEL, &mapped)) {
+				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
 				return -EINVAL;
 			}
 
-			phys += 4096;
-			addr += 4096;
-			size -= 4096;
-			mapped += 4096;
+			phys += mapped;
+			addr += mapped;
+			size -= mapped;
 		}
 	}
 
@@ -207,6 +273,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
+	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
 
 	/*
-- 
2.37.2

