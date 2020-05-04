Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D31C3A23
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C177D899E9;
	Mon,  4 May 2020 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45168899E9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125416euoutp0241c825c2cc199b58f05c60bf52fbee90~L1Gy33P4r1839718397euoutp02s
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200504125416euoutp0241c825c2cc199b58f05c60bf52fbee90~L1Gy33P4r1839718397euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596857;
 bh=4gYupzc/UJMgmHWpPu2pQvg0evsLFhb5hvvpEtLWtk4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TBa2bsb5mbktXySJBoleq/q280OjjLCbSxWdW6KDVoGNlN9O2MF2vqs+Sv1m99jbG
 24gENpjKKpMGXZLz8ZD0LlsLcCW4jw+5T7QGtK+lXZsVgWmElToPyeeHKKI0YOZA/x
 ad+5M/JLVaFOPnk/OWEBBY9K7gVQ01GRLSuJzKqs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200504125416eucas1p2f417af8300199cd00291584432cff973~L1GyhfFMd2227522275eucas1p2m;
 Mon,  4 May 2020 12:54:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EB.D2.60679.87010BE5; Mon,  4
 May 2020 13:54:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200504125415eucas1p1eea125ce87eec4e7c2e2dcc75f965896~L1Gx8x-ai1176711767eucas1p1S;
 Mon,  4 May 2020 12:54:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200504125415eusmtrp1ab58d44cf2acebca7c2c1109419622b6~L1Gx8GCL92470624706eusmtrp1i;
 Mon,  4 May 2020 12:54:15 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-a4-5eb01078b33a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 87.06.07950.77010BE5; Mon,  4
 May 2020 13:54:15 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125415eusmtip2131813f4a891672552b948480ffbdf1e~L1GxNGVje0350403504eusmtip26;
 Mon,  4 May 2020 12:54:15 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/21] drm: panfrost: fix sg_table nents vs. orig_nents
 misuse
Date: Mon,  4 May 2020 14:53:47 +0200
Message-Id: <20200504125359.5678-9-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeyyVYRzHPee9nJc5ehzKM7lsZ4vVFpE/3o1aNavX+qeWtWpL3niH5bbz
 Oi5tSoQcjnGUJDUrzfVECCHnOC4nMZXblOT6D5tuLkkuOb3ov+/3+3y++/7+eChMqiNsqZDw
 KE4ezobKSDO8rvP3u4OxsMrvUG6HI63q7RLRvX3pBP0ir5KgN+qyMXpg8RtJl5Z3iOhCrSe9
 MDAhoqunhgi6v7GApDXto2J6o7lBTLd+nyboW+2bbKamjzy2i6l4XAGYhtEiwLxeKsSZ6rI0
 kqlfGieYsXSDiKkpusmMrE9hTM5wMWCaPiaQTGZtGWDmqx3OmF8y8wrkQkOiObnrUX+z4D+1
 lpHNu2ILmsrxBLBurgSmFIIeqEQ5CJTAjJLCEoAG5ztFglkAaC2xBxPMPEAV469E2xXDz+It
 qhggnX4O26l0TqqAkSKhG1LOKUmjtobJAL1R/RvEoA5D4x27lUBMWcFzqM3XmOJwH0rpWhUb
 tQR6oay0EUzYckTlVbpNTVGm8Ah6oHI2LiH4SYx0Hxa3GG809Khl6zYrNGuoFQvaDnXnZOBC
 IQmgiV6NWDAZAPUn5gGB8kSfe1dI4wIG96PKRlchPo5Se7QiY4ygBRqesxSut0DquvuYEEvQ
 nRSpQDuhfMPzndnW931bCIOe3XMxxlLYBlBODZ8FHPP/TxUCUAZsOAUfFsTx7uFcjAvPhvGK
 8CCXgIiwarD5r7rXDQsNoHH1qh5ACsjMJRfmK/2kBBvNx4XpAaIwmbWk4fZmJAlk465z8ogr
 ckUox+vBXgqX2UgOP5m5LIVBbBR3jeMiOfn2q4gytU0AyVnqsvjc0FGP1BF/K9Zbkeh48cRT
 3L6pcd3V12kPUZdU4LPiaeFWZTJZcuPXSG7acn5rocPosnqhFjNxidGWVHQOmbyFPia5J1UT
 +FhkKd2e4a6YnrhrP3t6zrflfL3/w5k+3Zev2oDseD0R4fxSPcR6ZZ3ysNOc1f6QFUvWZDgf
 zLodwOQ8+xeC4Ld/UwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xe7rlAhviDFatsLDoPXeSyeLcpW5W
 i40z1rNa/N82kdniytf3bBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxdojd9kt/u/ZwW5x
 8MMTVovGI0C1fWsvsTnwe6yZt4bRY8fdJYwee78tYPHYtKqTzWP7twesHve7jzN5bF5S73H7
 32Nmj8k3ljN67L7ZwObRt2UVo8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqG
 xuaxVkamSvp2NimpOZllqUX6dgl6Gb+3CBbs4a+Ys3s1SwPjP54uRk4OCQETieOfljN1MXJx
 CAksZZS4dP8aK0RCRuLktAYoW1jiz7UuNoiiT4wS13vusYEk2AQMJbreQiREBDoZJaZ1f2QH
 cZgFTjFL3Jh9DaxKWCBQou/VbmYQm0VAVaLt5B92EJtXwEZiQudtZogV8hKrNxwAsjk4OAVs
 JWb2qoOEhQTyJe4+/ccygZFvASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMA42nbs55Yd
 jF3vgg8xCnAwKvHwbvi6Pk6INbGsuDL3EKMEB7OSCO+OFqAQb0piZVVqUX58UWlOavEhRlOg
 myYyS4km5wNjPK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+P2
 iveW57ieMcw8fWVp9oGzgWJCmbadnKztN8Rrnbzm9U4+43cvyK7scvAr+ecsnJYm15q8nee/
 tNBb4fLE/ehGT97Td/Y+13t5ojR4yylhpYt/05/n/8rfcuu5Kqfsnk0B7pMapXLOrK558Ypj
 XYfsoY3PeF8aMfYy3ZwefHKOptJeuw/rIwyUWIozEg21mIuKEwGkmqhquQIAAA==
X-CMS-MailID: 20200504125415eucas1p1eea125ce87eec4e7c2e2dcc75f965896
X-Msg-Generator: CA
X-RootMTR: 20200504125415eucas1p1eea125ce87eec4e7c2e2dcc75f965896
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125415eucas1p1eea125ce87eec4e7c2e2dcc75f965896
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125415eucas1p1eea125ce87eec4e7c2e2dcc75f965896@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v2 00/21] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/4/373
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 3 ++-
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 17b654e..22fec7c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -42,7 +42,8 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 		for (i = 0; i < n_sgt; i++) {
 			if (bo->sgts[i].sgl) {
 				dma_unmap_sg(pfdev->dev, bo->sgts[i].sgl,
-					     bo->sgts[i].nents, DMA_BIDIRECTIONAL);
+					     bo->sgts[i].orig_nents,
+					     DMA_BIDIRECTIONAL);
 				sg_free_table(&bo->sgts[i]);
 			}
 		}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index ed28aeb..2d9b1f9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -517,7 +517,9 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	if (ret)
 		goto err_pages;
 
-	if (!dma_map_sg(pfdev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL)) {
+	sgt->nents = dma_map_sg(pfdev->dev, sgt->sgl, sgt->orig_nents,
+				DMA_BIDIRECTIONAL);
+	if (!sgt->nents) {
 		ret = -EINVAL;
 		goto err_map;
 	}
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
