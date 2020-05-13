Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF461D1536
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA8A6EA47;
	Wed, 13 May 2020 13:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255706EA3D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133308euoutp0284fa7ff656360ee99b95c7e9c86f4ae5~OmcTEa2jm0033500335euoutp02L
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133308euoutp0284fa7ff656360ee99b95c7e9c86f4ae5~OmcTEa2jm0033500335euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376788;
 bh=Mjbyh+iQTRuFl9HtwwZ3v6z8vSYqD8ySlgpPSWbXFDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tvIQf03g+dutkSPuwwkERBYlgqYtcxDiqCF355S7zJ6HU+X0wgwNzGdOL+38R1WR+
 r7saMfk79otZap6tswiwUy0jPcUf+BEwHZOOj34pOH/fdwSXGu9L0HLrYzE2U6NZxw
 NA2MiCG3RUSTGctZpkHSAh4rThdpfM/fqWCRVY7c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133308eucas1p20456b16f876da2515028eb026479ed8a~OmcS3Oqe21007610076eucas1p2C;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CA.01.60679.417FBBE5; Wed, 13
 May 2020 14:33:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133308eucas1p205607f34ec3d6df747e21c9b27204ca3~OmcSdnmIZ2972529725eucas1p2A;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133308eusmtrp12932d33d008f5b798cdfa11df3ed421e~OmcSc7e_C1011910119eusmtrp1M;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-40-5ebbf71454f1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.1A.08375.417FBBE5; Wed, 13
 May 2020 14:33:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133307eusmtip1b986e910f71a45a9fed9722a4260d683~OmcReuEsu0693306933eusmtip1A;
 Wed, 13 May 2020 13:33:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/38] drm: msm: fix common struct sg_table related issues
Date: Wed, 13 May 2020 15:32:23 +0200
Message-Id: <20200513133245.6408-16-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzHfe+557ljTk/H5jv51VnWTyKzZ0NpszzrD1rLPxp6yjMsDnco
 asui8rPl1/yIyI/8jo4ph104XZKbxTqOG8IUMxrpoqnnPNR/r8/7835/Pt/vd18+IuxHrfgR
 4jhaIqYiRZgJt+PdL/Upi59dwafTtw4T2epBDvGqqAUl/nTkIMTYj1WMKF0cBkR94wCHqFB4
 EBtjsxxCNvcZJXIUwzxiVF6KEc1KHY9YfK5HiN61eZTQ5SmB9wGy6VkTIHs2K7hkZ4mOR77e
 nEHJ6UwVh2yrvkdO7swhZN54LSC7JpIxUiXX8sjH7Q2AXJfZXjINNPEMpSMjEmiJ89lrJuGV
 yflITL/D7RF9LpYMZmwygDEf4m4wq7ibZ2AhXgfgbJV/BjBheAPAlFQNyhbrAH6QpaD7CX1T
 MYdt1AJYU14K2DgT2R50MDCGu8CMlQzMwBb4AwDfZ5saAghegsCvfdu7DXPcH+palbthLn4E
 qmXViIEFuBdUrqTtbbODja1vd3VjRl+aUnANgyCu5cEv9T0Ya/KBmrZ1HsvmcEnVvsfWcCgv
 ay+QwlxO3cxjiywAR+8XAdblAafUW8wkPnO+Y7BF7szK5+GQuoxjkCFuBsdXDhpkhMHcjkKE
 lQUw7aGQdTvCEtXLf2t7Rz7tWUi40OjAvk8/gBOPLJ8Au5L/qyoAaACWdLw0KoyWuorpW05S
 KkoaLw5zuhEdJQPM1xraUW28AfLf1/sAzgciUwGh7QoWolSCNDGqD0A+IrIQ+LUwkiCUSkyi
 JdEhkvhIWtoHDvG5IkvBmcpvQUI8jIqjb9J0DC3Z73L4xlbJAPtoFE8Zaeq2iwYviBQL7gMe
 l13X0PDlhSlnGJfmW768UrDkHuBV4JmUR8V6F2o1DdadQUK7oGmvyXmvzGifytgXNbqLbk/v
 SvQ27X7riu9mq6Zm5iFKe/sxbVmqrUtAULq8O38CFfs6tl4xU3ACl2zP3bFJPHlUqTxRle13
 VcSVhlMuxxGJlPoLsEA2fFYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7oi33fHGRxcyG3Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLOc/PMlqsXH2UyWLBfmuLL1ceMllsenyN1WLi/rPsFpd3zWGzWHvkLrvF
 84U/mC0OfnjCanF38hFGB36PNfPWMHrs/baAxWPnrLvsHtu/PWD1uN99nMlj85J6j9v/HjN7
 TL6xnNFj980GNo/ju26xe/RtWcXo8XmTXABPlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYml
 nqGxeayVkamSvp1NSmpOZllqkb5dgl7GooYpzAWHlSsu/JjE1sD4QLaLkZNDQsBE4seamUxd
 jFwcQgJLGSWe/f3PApGQkTg5rYEVwhaW+HOtiw2i6BOjxPT9i8CK2AQMJbreQiREBDoZJaZ1
 f2QHcZgFljBL9E29xAZSJSzgKzF971mwDhYBVYlzm5Ywg9i8ArYSR952QK2Ql1i94QBYnBMo
 /urOfrB6IYF8ib2L97FNYORbwMiwilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzCWth37uXkH
 46WNwYcYBTgYlXh4LW7tjhNiTSwrrsw9xCjBwawkwuu3HijEm5JYWZValB9fVJqTWnyI0RTo
 qInMUqLJ+cA4zyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwDjt
 w6b9dTtEuT5X27NLemk0Lz/j3+Z9as/xPTvMMw68OHd026rWddt/LJgyRcVIeUngi5W1P+bs
 PqN08kk068rCWVXa31+8Z7D47znrjZlCjfhM0UOst8+VPE14GPrk1uKJ6ilaT9wz9IoZem6p
 h3cteTzlQHNm97xjlyLtbz2SqeJv+PzkTkuEEktxRqKhFnNRcSIAOb/LNLsCAAA=
X-CMS-MailID: 20200513133308eucas1p205607f34ec3d6df747e21c9b27204ca3
X-Msg-Generator: CA
X-RootMTR: 20200513133308eucas1p205607f34ec3d6df747e21c9b27204ca3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133308eucas1p205607f34ec3d6df747e21c9b27204ca3
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133308eucas1p205607f34ec3d6df747e21c9b27204ca3@eucas1p2.samsung.com>
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
Cc: freedreno@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/msm/msm_gem.c    | 13 +++++--------
 drivers/gpu/drm/msm/msm_gpummu.c | 14 ++++++--------
 drivers/gpu/drm/msm/msm_iommu.c  |  2 +-
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79f..6318c20 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -53,11 +53,10 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
 	struct device *dev = msm_obj->base.dev->dev;
 
 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_sync_sgtable_for_device(dev, msm_obj->sgt,
+					    DMA_BIDIRECTIONAL);
 	} else {
-		dma_map_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
 	}
 }
 
@@ -66,11 +65,9 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
 	struct device *dev = msm_obj->base.dev->dev;
 
 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_sync_sgtable_for_cpu(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
 	} else {
-		dma_unmap_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 34980d8..5d8da4d 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -35,21 +35,19 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 {
 	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
-	struct scatterlist *sg;
+	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
-	unsigned i, j;
 
 	if (prot & IOMMU_WRITE)
 		prot_bits |= 1;
 	if (prot & IOMMU_READ)
 		prot_bits |= 2;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
-		dma_addr_t addr = sg->dma_address;
-		for (j = 0; j < sg->length / GPUMMU_PAGE_SIZE; j++, idx++) {
-			gpummu->table[idx] = addr | prot_bits;
-			addr += GPUMMU_PAGE_SIZE;
-		}
+	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
+		dma_addr_t addr = sg_page_iter_dma_address(&dma_iter);
+
+		BUILD_BUG_ON(GPUMMU_PAGE_SIZE != PAGE_SIZE);
+		gpummu->table[idx++] = addr | prot_bits;
 	}
 
 	/* we can improve by deferring flush for multiple map() */
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index ad58cfe..d322b39 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -43,7 +43,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
-	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
+	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
 	WARN_ON(!ret);
 
 	return (ret == len) ? 0 : -EINVAL;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
