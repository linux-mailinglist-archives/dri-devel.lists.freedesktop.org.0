Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D766B25D9E9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D039E6E343;
	Fri,  4 Sep 2020 13:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9F6E2BE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:03 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133501euoutp02733900b343e05aa2b4292ca9f5a01438~xmAfMePFC2889528895euoutp02d
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133501euoutp02733900b343e05aa2b4292ca9f5a01438~xmAfMePFC2889528895euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226501;
 bh=FFKEnEGLYycFGem4Izu1WZx/1I5qbSi6HYCqSDcVLTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VZ1TT17EL6mA7Z2DSGeVyLpiSIIJYM541K7L6b9OZXr3kqDw5gtbU+zGEcqUFeAVT
 EkWk3bgWuhvUkMxjUFDS3HVe8G7HVmYGT8hytR/acDV2/U2rGZraz/OeRT1nJmmpE2
 WZxATmv7PI3yTWM3IlhliOkMuPitQ4XQNMsj5Dwk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133501eucas1p2529f0bc87c0af4baebd81f9e3a264781~xmAewqEbQ1446814468eucas1p2f;
 Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D7.66.05997.582425F5; Fri,  4
 Sep 2020 14:35:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133501eucas1p2a2bc13658bf8433a10fcb8d5a173d57a~xmAeW9WOJ1447814478eucas1p2k;
 Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133501eusmtrp2f6963a47e96a1e719bc7222b3c1b5da4~xmAeWIaL40977009770eusmtrp2F;
 Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-5d-5f5242850e4c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.AE.06314.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133500eusmtip1774ac3ba3b0b581411835ea2c5a7ac96~xmAduhpK11924719247eusmtip1c;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 12/30] drm: msm: fix common struct sg_table related issues
Date: Fri,  4 Sep 2020 15:16:53 +0200
Message-Id: <20200904131711.12950-13-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURSGuZ0uQ0NlLBiuiJI0SqJRlsrDJCgqLplEFMQHg0ahygQItJAW
 EDBR0KCmgmEJ2gAKgoBssu8CUpBKkIoCsg77IhpiDRWFIth2UN/++//fueeek4si/DaWNRoo
 CSOlElGwgM1l1nSsvD8Q5+bl4/h1ZDueoO5k4OWKUha+UZOE4H0/vrHxjPlugBcUvWHgWS0u
 uLZvkoFXTH9i4Ukt3Ry8tyGDjZe0Uxx8/tkvBG/VzLBwKqUdHDUnip8WA6JpOYtJ1KdRHKJ2
 eYJFjD9QMYjK57eIkfVphEgZzAdE41AMm1A1DHOIh1WFgFiq2OVpdpF7yI8MDowgpQ6uvtyA
 uWENCKUEkc2KGSQGrNnIgSkKMWf4RXWPLQdclI+9ALBsro5tCPiYFsDOeGc6WAKQymliyAFq
 rEgtsKaZfADfrp6nGT3fT00xDAEbc4LyRbnxIkssTg8lmBkgBEtD4GelzhhYYJ4wZ15jLGBi
 e2ByeZdR8zBXODb6nUk/zxYWlb1GDNpU71crZliGiyA2xoHpmvRN6AR89aEWobWFfp4qDq1t
 4EZ9JoMuuAPgpLqEQx/iAey9rQA05QJH1atsw2wItheWNjjQ9jE4UJjHokfeAgcXtxpsRC+T
 ax4jtM2D9+/yadoOpqle/mvb2vNxEyFg/sQZekFJ+j0Ml3MSgW3a/15ZABQCKzJcJvYnZUIJ
 ed1eJhLLwiX+9tdCxBVA/7W61lXaOtCwdlUJMBQIzHgmR7x8+CxRhCxKrAQQRQSWPLfurit8
 np8oKpqUhvhIw4NJmRLsQJkCK97B7IXLfMxfFEYGkWQoKf2bMlBT6xjgGLvTPC+0OcVsQCfs
 eXeh09k16FxiP2/hrDA5EuROw9nDyGJjBDOxd4nyqtLZKQU6b+9V99FTYBbkru8OGso8bbLf
 sm1Yx/XomJKkxt5UaG9QZJwW83V31ERfGhfyVx6lHK+uXHriN1jg/TsIocQeOW4/MbXw5Ei2
 pC1zm4ApCxA57UOkMtEfgA/Lx1YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7qtTkHxBhtFLHrPnWSy2DhjPavF
 /20TmS2ufH3PZjHn+VlGi5WrjzJZLNhvbfHlykMmi02Pr7FaTNx/lt3i8q45bBZrj9xlt3i+
 8AezxcEPT1gt7k4+wujA77Fm3hpGj73fFrB47Jx1l91j+7cHrB73u48zeWxeUu9x+99jZo/J
 N5Yzeuy+2cDmcXzXLXaPvi2rGD0+b5IL4InSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
 NDaPtTIyVdK3s0lJzcksSy3St0vQy3h26wNjwV2lin0znjA3MP6R6WLk4JAQMJGYulKqi5GL
 Q0hgKaPEgrs/2bsYOYHiMhInpzWwQtjCEn+udbFBFH1ilNj/4xFYEZuAoUTXW4iEiEAno8S0
 7o/sIA6zwBJmib6pl9hAqoQF/CQ+HzoBNopFQFVi0sbTTCA2r4CdxL07H1kgVshLrN5wgBnE
 5gSKb53xBKxeSMBW4sOcxSwTGPkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyjbcd+
 bt7BeGlj8CFGAQ5GJR5eBvugeCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYf
 YjQFOmois5Rocj4wxvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBK
 NTDaPevftdRdViYiOkde6ppRfqLLrF4Bu1/n1D06U69u599whKe18IvqhjilvFNVnMd4t7xd
 7MQqbXm/K7DrB4Pk7X2nRe8s8L+z07Fz/tzED99veK0UcNgsfj01XeykJk/f1O2mcbUWl2NW
 yT05uKD/SkDYAplPYX8MHr2cdcin8TtfWfek/H4lluKMREMt5qLiRAAN31+euQIAAA==
X-CMS-MailID: 20200904133501eucas1p2a2bc13658bf8433a10fcb8d5a173d57a
X-Msg-Generator: CA
X-RootMTR: 20200904133501eucas1p2a2bc13658bf8433a10fcb8d5a173d57a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133501eucas1p2a2bc13658bf8433a10fcb8d5a173d57a
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133501eucas1p2a2bc13658bf8433a10fcb8d5a173d57a@eucas1p2.samsung.com>
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
Acked-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c    | 13 +++++--------
 drivers/gpu/drm/msm/msm_gpummu.c | 15 +++++++--------
 drivers/gpu/drm/msm/msm_iommu.c  |  2 +-
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b2f49152b4d4..8c7ae812b813 100644
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
index 310a31b05faa..53a7348476a1 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -30,21 +30,20 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
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
+		int i;
+
+		for (i = 0; i < PAGE_SIZE; i += GPUMMU_PAGE_SIZE)
+			gpummu->table[idx++] = (addr + i) | prot_bits;
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
