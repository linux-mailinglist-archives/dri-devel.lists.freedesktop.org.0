Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590A1CF044
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06346E8DD;
	Tue, 12 May 2020 09:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAAA6E8D0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:12 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090110euoutp01c1b0020729da28920eaaf10f2a8b2d32~OPFjbCgN22349823498euoutp01d
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090110euoutp01c1b0020729da28920eaaf10f2a8b2d32~OPFjbCgN22349823498euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274070;
 bh=t1TaQgpPlpOIeKcwYlj/Jy3bwLtL+hlc4iLjXxC2ons=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bac/bfje5MudJwWouURUYalxT2vnDh/c+d80HW3udmtrsgRUwan8deeSExaqLmALa
 nLlkvfLLqLJlGAQcX1Dwgyprb8Uobwty+pRuCYxanweDurfEeNnQ2ph/+mJqoHy02s
 aa04+3VkgIZ9TnXXvtrYTZ0o8kG7nVQ4Q7VINWvY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090110eucas1p1cabc5748153cf2472ef7c15eb199c85b~OPFjE_waF2839628396eucas1p1u;
 Tue, 12 May 2020 09:01:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F7.57.61286.6D56ABE5; Tue, 12
 May 2020 10:01:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090110eucas1p1fdf69509f401e425c45e958430a99b65~OPFityUFr1182811828eucas1p1v;
 Tue, 12 May 2020 09:01:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090110eusmtrp24b11072e269222a224b0da020ae635db~OPFitBH8S0472704727eusmtrp23;
 Tue, 12 May 2020 09:01:10 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-50-5eba65d65066
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C5.35.08375.5D56ABE5; Tue, 12
 May 2020 10:01:09 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090109eusmtip14c63f12fe5b3b587c7213e8f5c8431fa~OPFiGnKy71352813528eusmtip1C;
 Tue, 12 May 2020 09:01:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/38] drm: prime: use sgtable iterators in
 drm_prime_sg_to_page_addr_arrays()
Date: Tue, 12 May 2020 11:00:25 +0200
Message-Id: <20200512090058.14910-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djP87rXUnfFGXxfKGXRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o7hsUlJzMstSi/TtErgyuic2sRdsEq14PvcYYwPj
 UsEuRk4OCQETida5F1m7GLk4hARWMEp09exlhHC+MEr83PSGDcL5zCgx88Y9li5GDrCWnwti
 QbqFBJYzSuzvDIZr2P3zACtIgk3AUKLrbRcbiC0i0MoocaKXB6SIWWABs8TPz22MIAlhgWSJ
 R5962UFsFgFVid1nQRZwcvAK2EpsuPKXCeI+eYnVGw4wg9icAnYS9+f/YQEZJCFwjV3i4rIj
 LBBFLhIf775mh7CFJV4d3wJly0j83zmfCaKhmVHi4bm17BBOD6PE5aYZjBBV1hJ3zv1iA/mN
 WUBTYv0ufYiwo0TLjNfMEC/zSdx4Cw4wZiBz0rbpUGFeiY42IYhqNYlZx9fBrT144RIzhO0h
 seLzFmj4HmWU2DFjFuMERvlZCMsWMDKuYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECExa
 p/8d/7SD8eulpEOMAhyMSjy8HUY744RYE8uKK3MPMUpwMCuJ8LZkAoV4UxIrq1KL8uOLSnNS
 iw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgSTZeLglGpgNDc4dkSZYeXr464u21+s6rkyuWXN
 yqMKha/SD4briP841vI9/GJTbm53dfXhmSY22wv9OT7dtpWa5tyWWq0xd+7UBhuRPVde3ol5
 2tt4LXc2L+/1Q+WL7t4vknu3/jjD1cYl341mv5GplZ0U1byjTutf4JSJG/UPzn9r+dxuQv7+
 zTdEonw705RYijMSDbWYi4oTATJVDspWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7pXU3fFGUz6ZGPRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
 zWOtjEyV9O1sUlJzMstSi/TtEvQyuic2sRdsEq14PvcYYwPjUsEuRg4OCQETiZ8LYrsYuTiE
 BJYySkyY/p+pi5ETKC4jcXJaAyuELSzx51oXG0TRJ0aJSxtes4Ak2AQMJbreQiREBDoZJaZ1
 f2QHcZgFVjBLvNo3F6xKWCBR4lDDerCxLAKqErvP3gOL8wrYSmy48hdqnbzE6g0HmEFsTgE7
 ifvz/4DVCAkUSjy6+pZlAiPfAkaGVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIFRtO3Yz807
 GC9tDD7EKMDBqMTD22G0M06INbGsuDL3EKMEB7OSCG9LJlCINyWxsiq1KD++qDQntfgQoynQ
 UROZpUST84ERnlcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbG2
 XK6mLZrJwNfKWf23+iMZ3deO8nYvY5Ltpd0ZeRX3e012PvdmljjDhxXBzhl3ZRVKr35ry2da
 9+PzjEfNxuc4b/36J7v4c8is+kppB49Ztzc+2dhhZZ0VdvXqz1MhF/4ye84zvLlioXj16+Ct
 8hX3OfKdAtNjogLtb0h3PLBxNb0gfXytqhJLcUaioRZzUXEiALsfSue4AgAA
X-CMS-MailID: 20200512090110eucas1p1fdf69509f401e425c45e958430a99b65
X-Msg-Generator: CA
X-RootMTR: 20200512090110eucas1p1fdf69509f401e425c45e958430a99b65
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090110eucas1p1fdf69509f401e425c45e958430a99b65
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090110eucas1p1fdf69509f401e425c45e958430a99b65@eucas1p1.samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the current hand-crafted code for extracting pages and DMA
addresses from the given scatterlist by the much more robust
code based on the generic scatterlist iterators and recently
introduced sg_table-based wrappers. The resulting code is simple and
easy to understand, so the comment describing the old code is no
longer needed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/drm_prime.c | 47 ++++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1d2e5fe..dfdf4d4 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -985,45 +985,26 @@ struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 				     dma_addr_t *addrs, int max_entries)
 {
-	unsigned count;
-	struct scatterlist *sg;
-	struct page *page;
-	u32 page_len, page_index;
-	dma_addr_t addr;
-	u32 dma_len, dma_index;
+	struct sg_dma_page_iter dma_iter;
+	struct sg_page_iter page_iter;
+	struct page **p = pages;
+	dma_addr_t *a = addrs;
 
-	/*
-	 * Scatterlist elements contains both pages and DMA addresses, but
-	 * one shoud not assume 1:1 relation between them. The sg->length is
-	 * the size of the physical memory chunk described by the sg->page,
-	 * while sg_dma_len(sg) is the size of the DMA (IO virtual) chunk
-	 * described by the sg_dma_address(sg).
-	 */
-	page_index = 0;
-	dma_index = 0;
-	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
-		page_len = sg->length;
-		page = sg_page(sg);
-		dma_len = sg_dma_len(sg);
-		addr = sg_dma_address(sg);
-
-		while (pages && page_len > 0) {
-			if (WARN_ON(page_index >= max_entries))
+	if (pages) {
+		for_each_sgtable_page(sgt, &page_iter, 0) {
+			if (p - pages >= max_entries)
 				return -1;
-			pages[page_index] = page;
-			page++;
-			page_len -= PAGE_SIZE;
-			page_index++;
+			*p++ = sg_page_iter_page(&page_iter);
 		}
-		while (addrs && dma_len > 0) {
-			if (WARN_ON(dma_index >= max_entries))
+	}
+	if (addrs) {
+		for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
+			if (a - addrs >= max_entries)
 				return -1;
-			addrs[dma_index] = addr;
-			addr += PAGE_SIZE;
-			dma_len -= PAGE_SIZE;
-			dma_index++;
+			*a++ = sg_page_iter_dma_address(&dma_iter);
 		}
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_prime_sg_to_page_addr_arrays);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
