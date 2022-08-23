Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DB59E769
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 18:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCFD112FE8;
	Tue, 23 Aug 2022 16:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD6210EB71;
 Tue, 23 Aug 2022 16:36:38 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r69so12751511pgr.2;
 Tue, 23 Aug 2022 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=sHsd8UJitkSZ/06E7cs7tNROVB1mkQZCDyvY2Jg+ha4=;
 b=aDMSJsZdOLMIfhq9hMqJAJGsCd2NG9uT7Y87j/3NTRbwig6fxwUaQVn+X/Yz0CDKJB
 bEueKTMN8ePgcFtiE0TkJ3RgNGIKPrPNUb/hriBZapkE9Qg09s9eMAJG3ACX5r08v6ux
 yXassIf7+70ZKOzp0auTd4ckd6uiq9UGCl+Hb/iN016WIBvS8/kQLv7ruJlQBlDXyIam
 ejoInBmZl1XEMRYKva0VPunKa0CJNeOXmsSU6PczsHjHydTEPwIjEise5QJqj1IAxEhw
 LHLCrFQE/U8eax8b2ZXQOuEKtW/vJRzPQvsj4AjvQivb9aLhbjwEJk7kJ9O73+zNERIz
 AzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=sHsd8UJitkSZ/06E7cs7tNROVB1mkQZCDyvY2Jg+ha4=;
 b=zuMFa6sW6EbmVMpm0tI3fdFcB6qmNGeRUeT2q+Ez5c6q/R9XEOLbAVcvXTdZ9Yuztr
 rGM7CNYM0eh1ASTlPif+ThTc2NVn5XTQHSCYJioaCLN5/oMx+ykHAyP3ZakpwMXtVsst
 68IVQjXIQlHcZ1htmrqyW3NrqM9Tj3liyCCCjF5Wmi2YldwzLhAzJGtNOdED+a0hhkgo
 1dssn0C++X5wnB5rfb7bf9XD03H69Z0qiAB3mgqmlVarB1FuTkDYf25VGZbLHiCIzDFk
 sRxYeoduXE0ZAOFX3DdA4iFx1McxZAFn+Yt9hQWbwXyxmebto6TpEwNziScbID0ctvJa
 kajQ==
X-Gm-Message-State: ACgBeo1FSZd6aFyyyi3dOA1vZxVbvxz94RarksAK0BkKHbJIF4jmUbeR
 c62ss19AVITzBJOI9yA/5Kh6hJPfYSc=
X-Google-Smtp-Source: AA6agR7qTRzNhhRnEQPc//A/W8Gaflk+Qm332922fuNeVJHFKAc+LSxR8+zjVo5aYzlLh8KUGiX4kg==
X-Received: by 2002:a63:69c7:0:b0:41c:590a:62dc with SMTP id
 e190-20020a6369c7000000b0041c590a62dcmr20512812pgc.388.1661272597844; 
 Tue, 23 Aug 2022 09:36:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902cec900b00172973d3cd9sm10853077plg.55.2022.08.23.09.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 09:36:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/iommu: optimize map/unmap
Date: Tue, 23 Aug 2022 09:37:19 -0700
Message-Id: <20220823163719.90399-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Using map_pages/unmap_pages cuts down on the # of pgtable walks needed
in the process of finding where to insert/remove an entry.  The end
result is ~5-10x faster than mapping a single page at a time.

v2: Rename iommu_pgsize(), drop obsolete comments, fix error handling
    in msm_iommu_pagetable_map()

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 101 +++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a54ed354578b..5577cea7c009 100644
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
@@ -29,23 +30,84 @@ static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 	return container_of(mmu, struct msm_iommu_pagetable, base);
 }
 
+/* based on iommu_pgsize() in iommu.c: */
+static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
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
 
-	/* Unmap the block one page at a time */
 	while (size) {
-		unmapped += ops->unmap(ops, iova, 4096, NULL);
-		iova += 4096;
-		size -= 4096;
+		size_t unmapped, pgsize, count;
+
+		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
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
@@ -54,7 +116,6 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
 	struct scatterlist *sg;
-	size_t mapped = 0;
 	u64 addr = iova;
 	unsigned int i;
 
@@ -62,17 +123,26 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
-		/* Map the block one page at a time */
 		while (size) {
-			if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
-				msm_iommu_pagetable_unmap(mmu, iova, mapped);
+			size_t pgsize, count, mapped = 0;
+			int ret;
+
+			pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
+
+			ret = ops->map_pages(ops, addr, phys, pgsize, count,
+					     prot, GFP_KERNEL, &mapped);
+
+			/* map_pages could fail after mapping some of the pages,
+			 * so update the counters before error handling.
+			 */
+			phys += mapped;
+			addr += mapped;
+			size -= mapped;
+
+			if (ret) {
+				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
 				return -EINVAL;
 			}
-
-			phys += 4096;
-			addr += 4096;
-			size -= 4096;
-			mapped += 4096;
 		}
 	}
 
@@ -207,6 +277,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
+	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
 
 	/*
-- 
2.37.2

