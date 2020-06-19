Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730A2006BD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3426EC69;
	Fri, 19 Jun 2020 10:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371F86EC64
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:04 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103702euoutp0175030e444de6267f2fe2122e0f831a6a~Z66GyLxou1836618366euoutp01c
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103702euoutp0175030e444de6267f2fe2122e0f831a6a~Z66GyLxou1836618366euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563023;
 bh=ePXLHe/mfRhAa1xR5V0eqYUoM9rqbQC5MkvAEkUq1G0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZFhjTnVZaE2XiZnBCSspMbkgzH5Il+E9nD+ZVHohrLrsgoN1wSxJ79CrFMiz5g1yu
 mAS/0ZrNEkc9kXberoIVjTBNb8hD0AIYZGKbt6+AyHHuVrmv/VLa/3Zb/LL0ANN58U
 cWEfTHTnWTZlkF70igiCj8OxDOXj2GPA+SGbEadA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103702eucas1p14e7a598cf79bb058dee154e1946a2c9c~Z66GdCl0p0705907059eucas1p1E;
 Fri, 19 Jun 2020 10:37:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9F.8C.06318.E459CEE5; Fri, 19
 Jun 2020 11:37:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5~Z66F_rJ3n0704707047eucas1p1y;
 Fri, 19 Jun 2020 10:37:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103701eusmtrp1ccebd68058c16a8bf7a62b76bf5d0462~Z66F4Xp_60959609596eusmtrp1-;
 Fri, 19 Jun 2020 10:37:01 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-63-5eec954e7dc0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 98.0B.06017.D459CEE5; Fri, 19
 Jun 2020 11:37:01 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103701eusmtip230514ba84e3184c5dd6c231d8b83c417~Z66FMKCde3164531645eusmtip2W;
 Fri, 19 Jun 2020 10:37:01 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/36] drm: msm: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:13 +0200
Message-Id: <20200619103636.11974-14-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjmO2eXo7g6TdEPk6xpUUFesMtXhtkNTn8yqD8GmStPam1TNrUM
 ItEKm068UI0pZWVq3lObqZg5nTNk8zbNLNNlpeU1b5mJtnlm/Xve5/I+Lx8fgfOb2c5EuCSK
 lkqEIgHHlqVu/m3YdfLeWJCXMsUNKQxvMfRCWcpGK+o0HBnnJjkoa1gP0PNCLYay633RrNGE
 ofKhHjZKq9dzUVdNFgcVN/Vz0fDjBRw1TH1ho/6MJuC/nip6WASouvlsFlWt6udSVfODbGog
 SYdRFTk3qQ/LQziV0ZsHqNr3cRxKV9PHpVIqCwA1U77plN1Z24MhtCg8hpZ6+gXbhmV1VLAj
 VYJrqXotFgf0LnJgQ0ByNxzOLMbkwJbgk/kAlswmAYvAJ2cBzHwZyAgzAOaXaMBaIslgAIyQ
 B6Dq/mecGcyJ8YQ53OLikN5QPi7nWLADeRvAFoWdxYSTKhyOaP6sCvZkAFTmajALZpFbYXqj
 ZpXnkX4wvlpvrXOFhWVvVpfamPnRWw1syyJI9nHhu8FnGGM6BrsztFZsD3/oKrkMdoGtGcks
 JpAAoMlQzGWGZAC74pXWCl/40bBoribM9+2ApTWeDH0YKjuMXAsNyXWwd3yDhcbNMF39AGdo
 Hky8w2fc26BKV/KvtqG9E2cwBXvaFNYHTgMwPVnNSgWuqv9l2QAUACc6WiYOpWU+Evqqh0wo
 lkVLQj0uRojLgfl3tS7r5l6B10sXNIAkgMCON3JmNIjPFsbIYsUaAAlc4MA7om8N4vNChLHX
 aWnEeWm0iJZpwEaCJXDi+Tz5fo5Phgqj6Cs0HUlL11SMsHGOA3d1fZK+R8FdZUUFIalpg017
 pB5JXitfL4kCpy4rkVFuOjHtaNrcGzARNmU/Muc3HfGrYswdfdr/M+C0i58bZ8SxVfT0+EQk
 2Ku3cW9pzDrQZrf9m6GuwXtpcV+TUrvcreksNE5V1zYqDhVrJ2eq0v1Dmo+2CxO3LNwYyJ2f
 EeQIWLIwofdOXCoT/gW9h8I/WQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7q+U9/EGbw/Z2nRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLOc/PMlqsXH2UyWLBfmuLL1ceMllsenyN1WLi/rPsFpd3zWGzWHvkLrvF
 84U/mC0OfnjCanF38hFGB36PNfPWMHrs/baAxWPnrLvsHtu/PWD1uN99nMlj85J6j9v/HjN7
 TL6xnNFj980GNo/ju26xe/RtWcXo8XmTXABPlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYml
 nqGxeayVkamSvp1NSmpOZllqkb5dgl7GnIubWQtmKVVMOHuUqYHxrEwXIyeHhICJRPe5c4xd
 jFwcQgJLGSUmX/rKCJGQkTg5rYEVwhaW+HOtiw2i6BOjxMldD5lBEmwChhJdbyESIgKdjBLT
 uj+ygzjMAkuYJfqmXmIDqRIW8JXYffk7WAeLgKrEpMOHwOK8AnYSTTvPQq2Tl1i94QBYDSdQ
 /HXLQbDVQgK2EssXvGeewMi3gJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmAsbTv2c8sO
 xq53wYcYBTgYlXh4X4S8jhNiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZT
 oKMmMkuJJucD4zyvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOj
 23eX5T1rOq/pTc2681JoufTxmvWur2/Na2eUVjV0m239VKaf6Y8mg3gX011lacM5X4znh0yw
 /nNge0le9tVi/dRVFmdDr901nOay//X7ZU/OnDnQ9OX88Sl3xIz37s5XWsPO/NLe+Nqfz/Wh
 4QbxRdflt6VPdxVIvC1YefPk7/n3lVUPaWwTV2Ipzkg01GIuKk4EAHK7XDC7AgAA
X-CMS-MailID: 20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5
X-Msg-Generator: CA
X-RootMTR: 20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5@eucas1p1.samsung.com>
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
 drivers/gpu/drm/msm/msm_gem.c    | 13 +++++--------
 drivers/gpu/drm/msm/msm_gpummu.c | 14 ++++++--------
 drivers/gpu/drm/msm/msm_iommu.c  |  2 +-
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 38b0c0e1f83e..e0d5fd36ea8f 100644
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
index 310a31b05faa..319f06c28235 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -30,21 +30,19 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
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
index 3a381a9674c9..6c31e65834c6 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -36,7 +36,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
-	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
+	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
 	WARN_ON(!ret);
 
 	return (ret == len) ? 0 : -EINVAL;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
