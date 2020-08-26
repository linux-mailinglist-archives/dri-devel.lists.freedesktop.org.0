Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545152526FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777476EA01;
	Wed, 26 Aug 2020 06:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDF36E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063532euoutp02dc4e18915a964d66bbe45cf0f6eb45c5~uvep4ufuu1514215142euoutp02C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063532euoutp02dc4e18915a964d66bbe45cf0f6eb45c5~uvep4ufuu1514215142euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423732;
 bh=QOEXRl2z3ozWMJXcJ/ZYCIy/nZzMSXSHvZvf61p4Upk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=otI7hKyrp9QAT1M0nCbWLr+8NOuOyLyNGATXpd18lfpTWZi5aCepmg0+XsQcCTDT4
 rjzEX0Eh8iMt8I0vfci8NAPF0plt7BCwMgoFRFKE9XAZsKP+U0bGwEqbFY45+zlxeY
 /zN/g5Zj8v8Lk92FEqR89BqeJLUhdgpt1nWq5xYI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063532eucas1p1c5382498e35b316d615de0e68e361b34~uveplMohD1475914759eucas1p1c;
 Wed, 26 Aug 2020 06:35:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4E.23.06456.4B2064F5; Wed, 26
 Aug 2020 07:35:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063531eucas1p18dbb3c42b2ecc490360e7a75cf579af6~uvepRc1_b1289512895eucas1p1c;
 Wed, 26 Aug 2020 06:35:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063531eusmtrp2c6ddecca99882a01b52665c1a9eb88cd~uvepQuhRj0466204662eusmtrp2E;
 Wed, 26 Aug 2020 06:35:31 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-ba-5f4602b47c75
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.43.06017.3B2064F5; Wed, 26
 Aug 2020 07:35:31 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063531eusmtip2f1c4e657ba9c308fbe715b9adb179fcb~uveogjcW30302303023eusmtip2v;
 Wed, 26 Aug 2020 06:35:30 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/32] drm: exynos: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:32:51 +0200
Message-Id: <20200826063316.23486-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSbUhTYRTHeXbv7u6Wi9sUfLBIGCQkqJkKT1r2Hhe/FFEfzNSmXlTUKbtq
 6Yc0xV7mu5JOUTOxVr7kXMPSynJoU0SnzsJQM9HA+V46sUhr86p9+53/Of/nfzg8JCbp5zuR
 0fJERiGXxUoJEd7y8ZfRTce7EHpE3y5Euf09PNSsauKjvy2FGBq2LBHoeX0XDxVNFOCo+r0f
 mvk6iKP8qTkMGY0aAerLmBeg1eFJHtJOfeYjU1sFgVTGdh5q7BwXoI7laT5SFZuJUxK6oaoB
 0O/WqnFaW/eAoF+tfePTE9kGHv2yNo0e3ZzC6OIRNaDffEkn6DxdHaBXtAcv7bkmOh7BxEYn
 MwoP/xuiqJJZ3wSz/a0O/QiRDkyUEghJSHlD80wJUAIRKaGeAdhVose4YhXAso0ffK5YAfBt
 TSuxY/n0ZF5gYwmlBtDQQO061gcMuK1BUJ5QuaDcMjhQWQB259rZhjBKjcPK+g2+rWFPXYZl
 rXpgY5w6BLNU6i0WUyfgkCZ/O80Z1ms+YDYWUv7QkG3TRVbdLICmzCWMGzoHO8fGAcf2cNag
 E3B8AP5tfcTjDJkATvY3CrgiB0BThmrb4QfH+n9bnyWt+x2GTW0enHwaLj9Wb8mQ2gtHFvbZ
 ZMyKRS2lGCeL4f27Em7aBZYbXuzGdgwMba9Gw7mVWZy7ViGAxXnXC4Bz+f+sagDqgCOTxMZF
 MqynnLnpzsri2CR5pHt4fJwWWH9Z76bh52tgGQrTA4oEUjtxNXE+VMKXJbMpcXoASUzqID7T
 1xsiEUfIUlIZRXyoIimWYfVgP4lLHcVeNeZgCRUpS2RiGCaBUex0eaTQKR0kZi6WWi56OTd6
 OJpuh9dOLhMxbFts6uLz4CxYoR0tzbH4PXV7VuSSXqzMs7MfvDoZlq2w3A26X+95cnPGoFv1
 PnY2YHipuUYu7J7/c289cM5SyVQ44GnDf64GHhX63HF76HMlmjBOpy40hPT4a8SayIDoKr04
 nKlzfRRU+d1XirNRMk9XTMHK/gG2sci0YQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7qbmdziDf6/1LPoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwm3Z/AYrFgv7XFi3sXWSz6H79mtjh/fgO7xdmmN+wWX648ZLLY
 9Pgaq8XlXXPYLGac38dksfbIXXaLgx+esFrMmPySzUHIY828NYwee78tYPHYtKqTzWP7twes
 Hve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObRt2UVo8fnTXIB3FF6NkX5pSWpChn5xSW2StGG
 FkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GdNeWRW8FK44eOgGWwPjZYEuRk4O
 CQETiatL37B3MXJxCAksZZSYc2MiK0RCRuLktAYoW1jiz7UuNoiiT4wSm+4dYQNJsAkYSnS9
 hUiICHQySkzr/gg2illgM4vEv/VP2EGqhAUCJG7eW8cIYrMIqEq0zlgOZvMK2Epc2tDPBrFC
 XmL1hgPMIDangJ3E8W6IuBBQzem1M5gnMPItYGRYxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJ
 ERhd24793LKDsetd8CFGAQ5GJR7eBWyu8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqP
 LyrNSS0+xGgKdNREZinR5Hxg5OeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgt
 gulj4uCUamA8/TJbhenpigjJYq8dZaFh1TN26PBVPxesZzBLVCiuum94W8pg88v37A3ruiW7
 N+5TnFa96mboqxrzbW/uSH2bH3fpI8Mux8m7Os5zzT3758Hmmam3frKkP4laeFhM1zbhw3Jz
 EwkbneJnsx3/XZx438/DXvTiB7nPWlf2dMnsYasrsjlVmHVUiaU4I9FQi7moOBEAUhc//sQC
 AAA=
X-CMS-MailID: 20200826063531eucas1p18dbb3c42b2ecc490360e7a75cf579af6
X-Msg-Generator: CA
X-RootMTR: 20200826063531eucas1p18dbb3c42b2ecc490360e7a75cf579af6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063531eucas1p18dbb3c42b2ecc490360e7a75cf579af6
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063531eucas1p18dbb3c42b2ecc490360e7a75cf579af6@eucas1p1.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
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
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by : Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 03be31427181..967a5cdc120e 100644
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
