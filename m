Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064C200671
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7C56EC63;
	Fri, 19 Jun 2020 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2866EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103659euoutp01802c3a231afd963af84a73f6550784a7~Z66DPc1zd1680716807euoutp01W
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103659euoutp01802c3a231afd963af84a73f6550784a7~Z66DPc1zd1680716807euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563019;
 bh=R1S3X25A6Vy5KJ2eK9141TIlg+VdgZzNSckapypyqH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lt69tp/4p1Co5VReO9bIKfQgjVZVQXMbWLWCykA3zo+W9S6KtB1Z1Zgq6ktBeOceR
 tsGTsI8LXXhnNBWk7o9fAmBRsePZ9sxK0XpaV4pxkPxj8bEuRJO9uHBqn1aXg1SpdG
 wpUey5DUbniWFIaYFyshuoKzEVD8kcEbYMkifXV0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103658eucas1p1d61897a1627eb9d0f3767ce51778d277~Z66C6ohlC0550605506eucas1p1l;
 Fri, 19 Jun 2020 10:36:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 41.9D.05997.A459CEE5; Fri, 19
 Jun 2020 11:36:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9~Z66CkPheM0705907059eucas1p1C;
 Fri, 19 Jun 2020 10:36:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103658eusmtrp1ee91374088728f3ad6501ac14183a27e~Z66CjlnGh0959609596eusmtrp11;
 Fri, 19 Jun 2020 10:36:58 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-d7-5eec954a139f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AE.DA.06314.A459CEE5; Fri, 19
 Jun 2020 11:36:58 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103657eusmtip2ec5cc91472375cc2dbda6f31e448626a~Z66B5Cvqu0229502295eusmtip2g;
 Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/36] drm: exynos: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:08 +0200
Message-Id: <20200619103636.11974-9-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87peU9/EGex8pmvRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllMuj+BxWLBfmuLL1ceMllsenyN1eLyrjlsFjPO72OyWHvkLrvF
 wQ9PWC1mTH7J5sDnsWbeGkaPvd8WsHhs//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
 +rasYvT4vEkugCuKyyYlNSezLLVI3y6BK+NG03Wmgm7hirOL37E1MDYIdDFycEgImEhMPiTb
 xcjJISSwglHiwG3dLkYuIPsLo0T31jcsEM5nRomuD0tYQapAGnoOdjJBJJYzSkz6/ZkZrqXp
 0n2wKjYBQ4mut11sILaIQCujxIleHpAiZoEOZolrE+czgiSEBYIklvxtZgKxWQRUJVYu/A1m
 8wrYSlx+P5EZYp28xOoNB8BsTgE7idctB1lBBkkIHGOXOLTnNwtEkYvEuo7J7BC2sMSr41ug
 bBmJ05N7WCAamhklHp5byw7h9DBKXG6awQhRZS1x59wvNlBwMAtoSqzfpQ8JGUeJrc2qECaf
 xI23giDFzEDmpG3TmSHCvBIdbUIQM9QkZh1fB7f14IVLUOd7SPw/OI0dEkATGSVWP1vNOIFR
 fhbCrgWMjKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzECE9Ppf8e/7GDc9SfpEKMAB6MS
 D++LkNdxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQ
 QHpiSWp2ampBahFMlomDU6qBkf0R770XmoatSnti86XdNghvK1QJOLL1Hi/LsedMWW0aHctv
 sX2S/viqXuRU4VwxHlVfCZ63Yd/Y+l/Ovq4Y8kxz94c2kUwZ1+hqiY+PZlwTO1K9wSTf8g9b
 ZXzgfNeHupn9AdM9l2b99Z0SYDyTYeKM/gPpjbf7nfJClXIbLu+Vvhz414pZiaU4I9FQi7mo
 OBEAgM9WwkgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7peU9/EGfzfImbRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllMuj+BxWLBfmuLL1ceMllsenyN1eLyrjlsFjPO72OyWHvkLrvF
 wQ9PWC1mTH7J5sDnsWbeGkaPvd8WsHhs//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
 +rasYvT4vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL+NG03Wmgm7hirOL37E1MDYIdDFyckgImEj0HOxk6mLk4hASWMoo8e31HEaIhIzE
 yWkNrBC2sMSfa11sEEWfGCUOLZgFlmATMJToeguREBHoZJSY1v2RHcRhFpjALHG/ZTXYKGGB
 AInWm1/ZQGwWAVWJlQt/M4HYvAK2EpffT2SGWCEvsXrDATCbU8BO4nXLQbANQkA1yxe8Z57A
 yLeAkWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYLRsO/Zz8w7GSxuDDzEKcDAq8fC+CHkd
 J8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAR01klhJNzgdGcl5JvKGp
 obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsbyi9YvP6xZmuazkC3uylP+
 kkX9ij8K13+4W7rM7QtHbkCXwxuGQ3WXX63pTFx+psn8s7nf1wM5WXdWTs5PbTzEMFflRd4+
 YV0dmUcrwnnsTon/V2HUnvNG6EG6QOLtH7o2Rq03Hm9YFbnvvYOraM4BvZfP2DtX/dyXY/d3
 y5/rbmcsrDaLr6lRYinOSDTUYi4qTgQAmL0rkqwCAAA=
X-CMS-MailID: 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9
X-Msg-Generator: CA
X-RootMTR: 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9@eucas1p1.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
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
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index fcee33a43aca..7014a8cd971a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -395,8 +395,8 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 		return;
 
 out:
-	dma_unmap_sg(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt->sgl,
-			g2d_userptr->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
+			  DMA_BIDIRECTIONAL, 0);
 
 	pages = frame_vector_pages(g2d_userptr->vec);
 	if (!IS_ERR(pages)) {
@@ -511,10 +511,10 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 
 	g2d_userptr->sgt = sgt;
 
-	if (!dma_map_sg(to_dma_dev(g2d->drm_dev), sgt->sgl, sgt->nents,
-				DMA_BIDIRECTIONAL)) {
+	ret = dma_map_sgtable(to_dma_dev(g2d->drm_dev), sgt,
+			      DMA_BIDIRECTIONAL, 0);
+	if (ret) {
 		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
-		ret = -ENOMEM;
 		goto err_sg_free_table;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
