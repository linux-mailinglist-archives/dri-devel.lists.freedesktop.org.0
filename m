Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553325D9CB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB43F6E2B1;
	Fri,  4 Sep 2020 13:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A776E2AF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133456euoutp026b8380691e0c8c6c3b3866355ab45e43~xmAaMBL8Y2766327663euoutp02c
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133456euoutp026b8380691e0c8c6c3b3866355ab45e43~xmAaMBL8Y2766327663euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226496;
 bh=Hwqiv+wi6EaliyyHu0uh5wrGV0wOCUYXeK8yTHPh0nY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LlJ4iseeb3ujcK6HErsucm41pb0UnLHiwo2MIV7rfqpI6kpz9efBrZTRXhf9y/SNP
 eLUC+kCeNf36W/fo9buK3I93Q++Zxsz3LoWZ8gOt+LfQNT935I4Balge/VS+hMOrF+
 Tk47m8S6K744G1IZKbdTaV1dssakDvs/mWoa1pUA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133456eucas1p2fbc872f80f827d0b254fd7920b6a3bd8~xmAZ2NAux0694006940eucas1p2X;
 Fri,  4 Sep 2020 13:34:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B0.39.06318.082425F5; Fri,  4
 Sep 2020 14:34:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133455eucas1p24020a2d7f03e20199f08cfb944782d34~xmAZYsz3C1447714477eucas1p2M;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133455eusmtrp24f1d9e3543e5ea32b53b54afd5781212~xmAZYBgWL0905809058eusmtrp2V;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-87-5f524280de64
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2D.90.06017.F72425F5; Fri,  4
 Sep 2020 14:34:55 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133455eusmtip18c0a30f774a199f3cb8cbe61d5ad3f8b~xmAY2pwpD1941819418eusmtip1F;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 04/30] drm: armada: fix common struct sg_table related
 issues
Date: Fri,  4 Sep 2020 15:16:45 +0200
Message-Id: <20200904131711.12950-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7oNTkHxBi2T2Sx6z51kstg4Yz2r
 xf9tE5ktrnx9z2axcvVRJosF+60tvlx5yGSx6fE1VovLu+awWRyaupfRYu2Ru+wWBz88YXXg
 8Vgzbw2jx+VrF5k99n5bwOKx/dsDVo/73ceZPDYvqfe4/e8xs8fkG8sZPXbfbGDz6NuyitHj
 8ya5AO4oLpuU1JzMstQifbsEroxdXc4F32UqHt1cytTAeEG8i5GTQ0LAROLMzBNsXYwcHEIC
 Kxglvgt0MXIBmV8YJWZ1TWaGcD4zSpx7N5cRpuH9s1dMEInljBLLrrexw7W86HrHBlLFJmAo
 0fW2C8wWEWhllDjRywNSxCxwgEmi7d1rJpCEsECwxIyjc8DGsgioSrxsfAMW5xWwleiZOIUN
 Yp28xOoNB5hBbE4BO4mtM56wggySENjHLjF17xeoIheJJa8WQ90nLPHq+BZ2CFtG4v/O+UwQ
 Dc2MEg/PrWWHcHoYJS43zYDqsJa4c+4XOAiYBTQl1u/Shwg7SizvXsYKEpYQ4JO48VYQJMwM
 ZE7aNp0ZIswr0dEmBFGtJjHr+Dq4tQcvXGKGsD0kZj14xggJoYmMElu/HGCawCg/C2HZAkbG
 VYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIHp6PS/4193MO77k3SIUYCDUYmHl8E+KF6I
 NbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJITyxJzU5N
 LUgtgskycXBKNTCaF1dzWjm+X2GbP+937bXCSi2l00Iv27R996c8Xb1hamWck/vcpB9BodV+
 5Q0hRV5fTm+K47Ba/fvm/HPlq+bdXi4cGTtrS528FdeTl1+3/n/NeEupQ8tAfIp85G3nt4u5
 NPbs/t8kaabn52GpK2o/1+FXXfTrzIVCF0yMrU5bvP+0W2TedWUlluKMREMt5qLiRAA4FaYH
 QwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7r1TkHxBusualj0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hszg0dS+jxdojd9ktDn54wurA
 47Fm3hpGj8vXLjJ77P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAdxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJ
 ehm7upwLvstUPLq5lKmB8YJ4FyMnh4SAicT7Z6+Yuhi5OIQEljJK9E26zQ6RkJE4Oa2BFcIW
 lvhzrYsNougTo0TvlIPMIAk2AUOJrrcQCRGBTkaJad0f2UEcZoFjTBILf31kAakSFgiUmPT2
 KthYFgFViZeNb5hAbF4BW4meiVPYIFbIS6zecABsKqeAncTWGU/AVgsB1XyYs5hlAiPfAkaG
 VYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIERsu3Yzy07GLveBR9iFOBgVOLhZbAPihdiTSwr
 rsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToKMmMkuJJucDozevJN7Q1NDcwtLQ
 3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPjnG3Sl061i9TJz7MQlmDKFfy2w6vq
 d6Bb4qyzycue7F/E+UZmW559XVDDq2aVCY1xr18Yqy9f6x6pK3o8/+wu9z2+iZzF7g5fImrP
 iHId2SoeEba0JsVeZfOvu88PtH1XnVL5983OqIA3mktZMht2hy3P+l5VmGwlX8wVsMLu9twZ
 3HIZMy2VWIozEg21mIuKEwGA83SFpgIAAA==
X-CMS-MailID: 20200904133455eucas1p24020a2d7f03e20199f08cfb944782d34
X-Msg-Generator: CA
X-RootMTR: 20200904133455eucas1p24020a2d7f03e20199f08cfb944782d34
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133455eucas1p24020a2d7f03e20199f08cfb944782d34
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133455eucas1p24020a2d7f03e20199f08cfb944782d34@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
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
 drivers/gpu/drm/armada/armada_gem.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 8005614d2e6b..a63008ce284d 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -379,7 +379,7 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 	struct armada_gem_object *dobj = drm_to_armada_gem(obj);
 	struct scatterlist *sg;
 	struct sg_table *sgt;
-	int i, num;
+	int i;
 
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt)
@@ -395,22 +395,18 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 
 		mapping = dobj->obj.filp->f_mapping;
 
-		for_each_sg(sgt->sgl, sg, count, i) {
+		for_each_sgtable_sg(sgt, sg, i) {
 			struct page *page;
 
 			page = shmem_read_mapping_page(mapping, i);
-			if (IS_ERR(page)) {
-				num = i;
+			if (IS_ERR(page))
 				goto release;
-			}
 
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		}
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0) {
-			num = sgt->nents;
+		if (dma_map_sgtable(attach->dev, sgt, dir, 0))
 			goto release;
-		}
 	} else if (dobj->page) {
 		/* Single contiguous page */
 		if (sg_alloc_table(sgt, 1, GFP_KERNEL))
@@ -418,7 +414,7 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 
 		sg_set_page(sgt->sgl, dobj->page, dobj->obj.size, 0);
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+		if (dma_map_sgtable(attach->dev, sgt, dir, 0))
 			goto free_table;
 	} else if (dobj->linear) {
 		/* Single contiguous physical region - no struct page */
@@ -432,8 +428,9 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 	return sgt;
 
  release:
-	for_each_sg(sgt->sgl, sg, num, i)
-		put_page(sg_page(sg));
+	for_each_sgtable_sg(sgt, sg, i)
+		if (sg_page(sg))
+			put_page(sg_page(sg));
  free_table:
 	sg_free_table(sgt);
  free_sgt:
@@ -449,11 +446,12 @@ static void armada_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	int i;
 
 	if (!dobj->linear)
-		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
 
 	if (dobj->obj.filp) {
 		struct scatterlist *sg;
-		for_each_sg(sgt->sgl, sg, sgt->nents, i)
+
+		for_each_sgtable_sg(sgt, sg, i)
 			put_page(sg_page(sg));
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
