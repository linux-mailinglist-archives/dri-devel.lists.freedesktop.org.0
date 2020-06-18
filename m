Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F41FF744
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217846EB7A;
	Thu, 18 Jun 2020 15:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446CD6EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154024euoutp0157d1409f70cfd659a8fb84657bcab7a1~ZrZrkbNfx1835418354euoutp01D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154024euoutp0157d1409f70cfd659a8fb84657bcab7a1~ZrZrkbNfx1835418354euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494824;
 bh=ePXLHe/mfRhAa1xR5V0eqYUoM9rqbQC5MkvAEkUq1G0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ATZDW8CYehNxGSzbUJe/C9zxb730GeyAY8blPLMTAkUQw8+mjXebd+89tBpnPB9b3
 n2sps0AktumKgyQTmF29QcGU5ZGQxEyMcMt9cLAE7Bx/gSGYhBjBtGHxExc97Q6fBC
 dlhukTmGBFmFLgXSKgngsqhRb5gLzX94JR/NhpXo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200618154023eucas1p2c76353986edc8fa47f500f6958cd6ff9~ZrZrXy-wd0500605006eucas1p2v;
 Thu, 18 Jun 2020 15:40:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E0.DE.60679.7EA8BEE5; Thu, 18
 Jun 2020 16:40:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154023eucas1p1613c9cd68f360fdcdaed7adf9d5abf93~ZrZqsjD1q1755717557eucas1p1I;
 Thu, 18 Jun 2020 15:40:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154023eusmtrp2a3565a5ca2c08fe56a160f1ec7cc0fee~ZrZqr24EP0399203992eusmtrp2Z;
 Thu, 18 Jun 2020 15:40:23 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-32-5eeb8ae78786
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7A.EE.08375.6EA8BEE5; Thu, 18
 Jun 2020 16:40:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154022eusmtip17c625ab9615396284a89154a2f9a6468~ZrZp7-JR90742307423eusmtip1R;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/36] drm: msm: fix common struct sg_table related issues
Date: Thu, 18 Jun 2020 17:39:34 +0200
Message-Id: <20200618153956.29558-14-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe1BMYRjG59uz59JOy2kz+SRldjCTW8KMQzIYl2PG0Bj/YMSho2J3NedU
 2qYhJWNWpcsIqyFEd7E1XValVrU12aSarEshmspOMhXSmrKnE/77vc/zvO873zsfgSieoe5E
 qCac5TSMSonJpGWNv16s6NfZAleN/VxOJbU2S6jH14tRaqosFaE6vw9jVGa/BVB5BQ0SKuup
 HzXW+VFCGT51oVTqUwtOdRgzMaqovhun+u+MI1Tdt88o1Z1eDzbPpgtvFQK6+keWlK7Ud+N0
 +Y8PKP3+sllCl2Sfo99OfkLodGsOoJ+8jsVos/ENTieX5gN61OAZ4HxQtjGIVYVGspzPpqOy
 kMyXJWiYXhmVYmmQxAKLhw4QBCTXwpvNWh1wIhRkLoC9hT4ijwGYXXdWB2QOHgWwsX0cCIaQ
 bx20S0QjB8C+6nu4WDg6HuisqJDCSF+oG9JhAs8hEwBsSnIWQgipR+CAyT5tuJJ7YW99yvRY
 KbkYXit4Ps1ychO8MGyTiuu8YMGjWkRgJ4feYk5AhUGQ7MFhQkPNTGgbvDBVhYjsCr+YS3GR
 PeBU5W2J2BAP4MfWIlwsEgHsiLs+8yI/+K51AhOugZDesNjoI8pbYF9OGyYeaRa0DrkIMuLA
 tLJriCjL4aWLCjG9BOrND/+trWtrn4nQsDLRSzxQKoC2K10gBXjp/+/KAiAfzGUjeHUwy6/W
 sGdW8oyaj9AErzx+Wm0Ajq/VMmkeqwDG38dMgCSA0lk+sN8WqECZSF6rNgFIIMo58q2WlkCF
 PIjRRrPc6SNchIrlTWA+IVXOla+5O3hYQQYz4ewplg1jub+uhHByjwUxV5tenVNrksNr8u1J
 0btUGa4B8w5NSBdweRs3VPy+cQDZ6V5Qxa3IfuiivWl9Fddw8s7FhfF7yjHSvq7Hc2DRSA5y
 X8/4p60fBbFRU18zKFOMoWJ3L4ufCPbOtaXvcJN2l2p9oruIwYzztXxccY/b9pGQSa99lf54
 2qPkpGWhSikfwvguRTie+QOgax04VgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7rPul7HGbzstrboPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFnOdnGS1Wrj7KZLFgv7XFlysPmSw2Pb7GajFx/1l2i8u75rBZrD1yl93i
 +cIfzBYHPzxhtbg7+QijA7/HmnlrGD32flvA4rFz1l12j+3fHrB63O8+zuSxeUm9x+1/j5k9
 Jt9Yzuix+2YDm8fxXbfYPfq2rGL0+LxJLoAnSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRS
 z9DYPNbKyFRJ384mJTUnsyy1SN8uQS9jzsXNrAWzlComnD3K1MB4VqaLkZNDQsBE4tzL30wg
 tpDAUkaJNdPDIeIyEienNbBC2MISf651sXUxcgHVfGKUmDXtMQtIgk3AUKLrLURCRKCTUWJa
 90d2EIdZYAmzRN/US0AZDg5hAV+JV/1sIA0sAqoS01efYQSxeQXsJFrev2aB2CAvsXrDAWYQ
 mxMofvp4KyvERbYSzz+0sU1g5FvAyLCKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMI62Hfu5
 eQfjpY3BhxgFOBiVeHhfhLyOE2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEh
 RlOgoyYyS4km5wNjPK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dU
 A2Pzbd6pahNm3yq6ylW46XDBYUWPz3WREvfdjzBObXPwSlPq7nZ4xzJZ65Gv/6K2VVqz5knG
 LE+8Pv0k7+81jKX/WHgt/yzzvqD5aH7LhLLdLWdS5Lnbn8efaa1jDvv8+ELxet7I6QdimFc3
 ng+t3BCRe8Bg/5vt867m7RfmMJ/yuHrPPpk7+3YpsRRnJBpqMRcVJwIA7lJ9zrkCAAA=
X-CMS-MailID: 20200618154023eucas1p1613c9cd68f360fdcdaed7adf9d5abf93
X-Msg-Generator: CA
X-RootMTR: 20200618154023eucas1p1613c9cd68f360fdcdaed7adf9d5abf93
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154023eucas1p1613c9cd68f360fdcdaed7adf9d5abf93
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154023eucas1p1613c9cd68f360fdcdaed7adf9d5abf93@eucas1p1.samsung.com>
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
