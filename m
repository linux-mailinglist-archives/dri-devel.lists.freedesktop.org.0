Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5E25D9E6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF86E30C;
	Fri,  4 Sep 2020 13:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C8E6E2F8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133502euoutp0221081b72c15ad8e90046bd927bd8298d~xmAgEU-yi2949829498euoutp02B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133502euoutp0221081b72c15ad8e90046bd927bd8298d~xmAgEU-yi2949829498euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226502;
 bh=8L76JluA1DA+XDINuFmhMyh7/pZztphzaFRThYOm+6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uB9foU016qk8FbvUweGBohpwZ67IKdgcnzAyamJyQDWR2zzz58/gsLqNMgrQa3bPw
 WXA3p1F1JfsK6W8YjzcHIx4VL4bHsf/bwkhroIjxjUhVLv2dMnXeC+qLvKe0kxAktM
 VDSBqW5o7etTQhPLw6k3Fkt8WULdZtZ4leRiUuYc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133502eucas1p196b49998aab3c682956fb60b3d67d430~xmAf1G6TK0115901159eucas1p1q;
 Fri,  4 Sep 2020 13:35:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EF.01.06456.682425F5; Fri,  4
 Sep 2020 14:35:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133502eucas1p136e346bfdcd361d9e0320923f653d843~xmAfZ3mri2307423074eucas1p1T;
 Fri,  4 Sep 2020 13:35:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133502eusmtrp2422309161fdf1068ef9cd28c5980cdc3~xmAfZCW100977009770eusmtrp2M;
 Fri,  4 Sep 2020 13:35:02 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-48-5f52428624a8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FF.AE.06314.682425F5; Fri,  4
 Sep 2020 14:35:02 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133501eusmtip1619a515147b9ee7852a476c127af4056~xmAe2m8ar2113121131eusmtip1t;
 Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 14/30] drm: panfrost: fix common struct sg_table related
 issues
Date: Fri,  4 Sep 2020 15:16:55 +0200
Message-Id: <20200904131711.12950-15-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzH+95zzw83T3sc8k0/rKuUWmTFnjCV9cez9UeNVGuLjnuGOcfu
 EKqh1hUiv1ayyqWLOnfoki40v39EHWF2JSujNjVpfi2t0T2e6L/X9/15fb6fz777Eoi4HnUm
 ohTxrFIhlUswkbC2Y8G8Rx0QGLrXUriNzja/FtBPi6pQeqk2D6EH56Yw+klFu4DWNPrSs4Oj
 Ato4NoTSA3V3MdrQNoLTSw0mnG7+OY7SOYZ+7BDJ6O/rAWMa0QLm1bxGyBh1GRjzYv4zynzK
 6hQwz7SpzPDiGMIUWMoBU/8+DWNyanSAmTFuPm57RuQnY+VRiazSw/+cKLKvtBeNewOTtLfM
 eBrocsgENgSk9sOMknKEYzH1GMCyNCoTiKw8C2DpRAXGH2YAbP2hQ1c6Cr5MCvlCOYBLw13Y
 akvhnY5lC6M8YeZkJsaxA3UVwK5sW05CqHEBtPwyWCWCsKeCYUajK+cIqe2wudUg4Jik/GFf
 XjHGT3OBFdVNy/vZWPPnReModw+kunHY9mBKyEtHoKZ7COfZHn7rrPnHG+HSyxIB33AFwFGz
 AecPNwAcuFwEeMsXfjT/xriNEMoNVtV58PFh2P6uUcjFkFoLLZN2XIxYMb/2NsLHJLyuFvO2
 KyzurFwd29zXj/DMwOo/s4B/oDwANa1deC5wKf4/TAOADjixCaqYCFblqWDPu6ukMaoERYR7
 eGyMEVi/VM9i57QJzPWHtQCKABJbcs3BwFAxKk1UJce0AEggEgcy4G1PiJiUSZNTWGVsqDJB
 zqpawAZCKHEi95VOnBVTEdJ4Nppl41jlSlVA2DingfR1yqzvascUWpSEX2rPze6+KHsE7k3r
 b5bJprN6vKrsgG+ItoBwUZxKOHDUGXr6fK3IbTgdt8P32qYTlR/qfYZsXNfnp0Yf260IMqvx
 nfiU94UAPyRkZouerFQshMtleuKhaaDpZLBXNWPcSvYaTWGOQbUTbnVyb3VejSFdIlRFSj13
 IUqV9C8azGD4TgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsVy+t/xu7ptTkHxBqc6OS16z51kstg4Yz2r
 xf9tE5ktrnx9z2axcvVRJosF+60tvlx5yGSx6fE1VovLu+awWaw9cpfd4v+eHewWBz88YbXo
 W3uJzYHXY828NYweO+4uYfTY+20Bi8emVZ1sHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj
 980GNo++LasYPT5vkgvgidKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLuLDoPGvBGYmKJdPOsTcwnhDpYuTkkBAwkZj89C0LiC0ksJRR4vZlIYi4
 jMTJaQ2sELawxJ9rXWxdjFxANZ8YJWZ/3c8EkmATMJToeguREBHoZJSY1v2RHSTBLPCGSeLS
 1QgQW1ggWOJ4z1uwBhYBVYmDh9eC2bwCdhIXJs5ig9ggL7F6wwFmEJsTKL51xhNWiItsJT7M
 WcwygZFvASPDKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMCY2Xbs5+YdjJc2Bh9iFOBgVOLh
 ZbAPihdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToKMmMkuJJucD4zmv
 JN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOj+x7W9iezA08x5Ezi
 XP/vTJ28hVAi32SBF2/i0iZ+FmayMfuWw3XZ8elPZy2J/yYKpRG79n8L6vc+dnNF6q39V94z
 cHEsVpq8c1Jsyo4H7/K5wwsOb1xzZ3P/nzuHyl7+vWaxMub27eSTQgvWme1bqnfcoedeS3SI
 9aMDdfnWdh3OUYn2tgvUlFiKMxINtZiLihMBUqF+Ua8CAAA=
X-CMS-MailID: 20200904133502eucas1p136e346bfdcd361d9e0320923f653d843
X-Msg-Generator: CA
X-RootMTR: 20200904133502eucas1p136e346bfdcd361d9e0320923f653d843
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133502eucas1p136e346bfdcd361d9e0320923f653d843
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133502eucas1p136e346bfdcd361d9e0320923f653d843@eucas1p1.samsung.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
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
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 33355dd302f1..1a6cea0e0bd7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -41,8 +41,8 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 
 		for (i = 0; i < n_sgt; i++) {
 			if (bo->sgts[i].sgl) {
-				dma_unmap_sg(pfdev->dev, bo->sgts[i].sgl,
-					     bo->sgts[i].nents, DMA_BIDIRECTIONAL);
+				dma_unmap_sgtable(pfdev->dev, &bo->sgts[i],
+						  DMA_BIDIRECTIONAL, 0);
 				sg_free_table(&bo->sgts[i]);
 			}
 		}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e8f7b11352d2..776448c527ea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -253,7 +253,7 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
 	u64 start_iova = iova;
 
-	for_each_sg(sgt->sgl, sgl, sgt->nents, count) {
+	for_each_sgtable_dma_sg(sgt, sgl, count) {
 		unsigned long paddr = sg_dma_address(sgl);
 		size_t len = sg_dma_len(sgl);
 
@@ -517,10 +517,9 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	if (ret)
 		goto err_pages;
 
-	if (!dma_map_sg(pfdev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL)) {
-		ret = -EINVAL;
+	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
 		goto err_map;
-	}
 
 	mmu_map_sg(pfdev, bomapping->mmu, addr,
 		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
