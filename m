Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB325D9DB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132916E2E2;
	Fri,  4 Sep 2020 13:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73CB6E2CC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133459euoutp02a0d838ee3690fb8128635b86e1f6e1f9~xmAc-D7s82842328423euoutp021
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133459euoutp02a0d838ee3690fb8128635b86e1f6e1f9~xmAc-D7s82842328423euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226499;
 bh=3Uytyvwzt4UX7mjIW5nSX3tNMM/3bhp/av3KF6qTx7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JBSuL7NubkrcjNXKGlK1SWSLBip5jqffvSXuM2kJx9djp6c19frfhE7vOzwrPzroK
 hxr3JZQe/KDLRfiO+bBXzXh5eiskaiKMsPPy1eoyYeKOlvy2E5vL05/FmItWX6XMj5
 lE/NLAkDiGmB9lK6DkEHsCUyHef+8TiwPSuBD4XM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133459eucas1p2470f372354f9d14efb1f5ba50c609de8~xmAcvLAz-1449414494eucas1p2h;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id F3.39.06318.382425F5; Fri,  4
 Sep 2020 14:34:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133459eucas1p106f61f640aa6d0007e42708a0fd15fb8~xmAcgU37M0118801188eucas1p1x;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133459eusmtrp24fd3aa68a19ba87587796d059123d3bb~xmAcfl8-B0905809058eusmtrp2d;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-92-5f524283b496
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C9.AE.06314.282425F5; Fri,  4
 Sep 2020 14:34:59 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133458eusmtip1782a93cbfe5f9ff8a3a93f879c981a30~xmAb9D7GT1624216242eusmtip1m;
 Fri,  4 Sep 2020 13:34:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/30] drm: lima: fix common struct sg_table related issues
Date: Fri,  4 Sep 2020 15:16:50 +0200
Message-Id: <20200904131711.12950-10-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87rNTkHxBrOPCFr0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfJ63ic3iy5WHTBabHl9jtbi8aw6bxdojd9ktDn54wmrx
 Ye1XJgdejzXz1jB67P22gMVj56y77B7bvz1g9bjffZzJY/OSeo/b/x4ze0y+sZzRY/fNBjaP
 vi2rGD0+b5IL4I7isklJzcksSy3St0vgyjjw/D9jwT2piveHQhoY54l1MXJySAiYSByb/J2t
 i5GLQ0hgBaPEz+YudpCEkMAXRonb29UgEp8ZJT4em84M07H2yQd2iMRyRol7bW1QDlDHladd
 YFVsAoYSXW+72EBsEYFWRokTvTwgRcwCl5kk5h9tYgFJCAsESnxfcZwVxGYRUJXo+b0ZzOYV
 sJP4vukMG8Q6eYnVGw6ADeUEim+d8YQVZJCEwCF2ialXbrNAFLlIrPjwgRHCFpZ4dXwLO4Qt
 I/F/53wmiIZmRomH59ayQzg9jBKXm2ZAdVhL3Dn3C2gdB9B9mhLrd+lDhB0lZj7axQQSlhDg
 k7jxVhAkzAxkTtoGCguQMK9ER5sQRLWaxKzj6+DWHrxwCRpcHhK77z9lhYTQREaJ8y+PM05g
 lJ+FsGwBI+MqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwNR0+t/xrzsY9/1JOsQowMGo
 xMPLYB8UL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYK
 CaQnlqRmp6YWpBbBZJk4OKUaGDmVLvHNyu6c8bdJY+7GnseMrR1mXa1ikt6lDxt7gtvfaM73
 fZHYH3PbokzO0Oct376r+iLauyts6z+03u6eoX3fT2SGPqu5+ZodpifMN5wpn82XbWmlOrX5
 xJ2fIqsV9zMasbxUN+15q+G8a3Xy4bcxJ+43n6z6VJmne9DEdu1H/Yym82fNlFiKMxINtZiL
 ihMBRXeVJEkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7rNTkHxBh3zmCx6z51kstg4Yz2r
 xf9tE5ktrnx9z2axcvVRJosF+60tPs/bxGbx5cpDJotNj6+xWlzeNYfNYu2Ru+wWBz88YbX4
 sPYrkwOvx5p5axg99n5bwOKxc9Zddo/t3x6wetzvPs7ksXlJvcftf4+ZPSbfWM7osftmA5tH
 35ZVjB6fN8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZRx4/p+x4J5UxftDIQ2M88S6GDk5JARMJNY++cDexcjFISSwlFFiR8s1doiEjMTJ
 aQ2sELawxJ9rXWwQRZ8YJW6/ussMkmATMJToeguREBHoZJSY1v0RbBSzwG0miTNzJ4BVCQv4
 S2z6+YgFxGYRUJXo+b0ZbCyvgJ3E901n2CBWyEus3nAArJ4TKL51xhOwGiEBW4kPcxazTGDk
 W8DIsIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwVrYd+7l5B+OljcGHGAU4GJV4eBnsg+KF
 WBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOioicxSosn5wDjOK4k3NDU0
 t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAmHD0QH/Nbbvv8pIvqvezas+z
 TzS/fiTdl8f+Xl/hbf7f5duiLvufFpEQju2c77zLI+lEfMzvZs3kTpYDc4XkZ6yymbRIwr8j
 9u+ie15iWiEuMf6ii1tdBE4lWzFouk3eYKFp6f75DfP691u/MbsbPnQsKOd40nxGbMXxvzdj
 26oLdjz/qWenxFKckWioxVxUnAgAfw5IIqsCAAA=
X-CMS-MailID: 20200904133459eucas1p106f61f640aa6d0007e42708a0fd15fb8
X-Msg-Generator: CA
X-RootMTR: 20200904133459eucas1p106f61f640aa6d0007e42708a0fd15fb8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133459eucas1p106f61f640aa6d0007e42708a0fd15fb8
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133459eucas1p106f61f640aa6d0007e42708a0fd15fb8@eucas1p1.samsung.com>
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
Cc: lima@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
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
Reviewed-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_gem.c | 11 ++++++++---
 drivers/gpu/drm/lima/lima_vm.c  |  5 ++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 155f2b4b4030..11223fe348df 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -69,8 +69,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		return ret;
 
 	if (bo->base.sgt) {
-		dma_unmap_sg(dev, bo->base.sgt->sgl,
-			     bo->base.sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
 		sg_free_table(bo->base.sgt);
 	} else {
 		bo->base.sgt = kmalloc(sizeof(*bo->base.sgt), GFP_KERNEL);
@@ -80,7 +79,13 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		}
 	}
 
-	dma_map_sg(dev, sgt.sgl, sgt.nents, DMA_BIDIRECTIONAL);
+	ret = dma_map_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret) {
+		sg_free_table(&sgt);
+		kfree(bo->base.sgt);
+		bo->base.sgt = NULL;
+		return ret;
+	}
 
 	*bo->base.sgt = sgt;
 
diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index 5b92fb82674a..2b2739adc7f5 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -124,7 +124,7 @@ int lima_vm_bo_add(struct lima_vm *vm, struct lima_bo *bo, bool create)
 	if (err)
 		goto err_out1;
 
-	for_each_sg_dma_page(bo->base.sgt->sgl, &sg_iter, bo->base.sgt->nents, 0) {
+	for_each_sgtable_dma_page(bo->base.sgt, &sg_iter, 0) {
 		err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter),
 				       bo_va->node.start + offset);
 		if (err)
@@ -298,8 +298,7 @@ int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
 	mutex_lock(&vm->lock);
 
 	base = bo_va->node.start + (pageoff << PAGE_SHIFT);
-	for_each_sg_dma_page(bo->base.sgt->sgl, &sg_iter,
-			     bo->base.sgt->nents, pageoff) {
+	for_each_sgtable_dma_page(bo->base.sgt, &sg_iter, pageoff) {
 		err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter),
 				       base + offset);
 		if (err)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
