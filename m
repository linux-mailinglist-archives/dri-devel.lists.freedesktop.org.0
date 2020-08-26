Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790F2526F4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B8E6E9FC;
	Wed, 26 Aug 2020 06:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D216E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063531euoutp0150e3a94917c225b1da2f9e88f4906bcc~uveohj2w21717217172euoutp01U
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063531euoutp0150e3a94917c225b1da2f9e88f4906bcc~uveohj2w21717217172euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423731;
 bh=MLTIzGLHmLuIJnHj+Adg9SKUDC11YSwmiKdLszq3iCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LmlY53TrhhEU6wgotGvoi9XdweyrzfAkQA3zqJy0xytbiHOUFNIskPzidXwUb5MMV
 90smQ2A2bmaqSa0TbJTDofqLakkzfMSU0UDIF88vw0TZcL7DFyZLXHz3vM47YnpL+n
 x/wTLZOEau9qZb9mokrM1P8ANLszrLHql0DfeejY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063530eucas1p1b4a9291b5c881c397f252329d5e86a01~uveoPjGh71803218032eucas1p1B;
 Wed, 26 Aug 2020 06:35:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 6B.23.06456.2B2064F5; Wed, 26
 Aug 2020 07:35:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063530eucas1p16acb847d7da0ea734bef507688a76c5a~uvenzwsyP1480714807eucas1p1M;
 Wed, 26 Aug 2020 06:35:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063530eusmtrp1775c98cf9c19b8c950c08415962ada98~uvenzKLTE1091110911eusmtrp1H;
 Wed, 26 Aug 2020 06:35:30 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-b4-5f4602b2558b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E3.C0.06314.2B2064F5; Wed, 26
 Aug 2020 07:35:30 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063529eusmtip241d433663647e436868c4b94ea5d1e8b~uvenOKK330091500915eusmtip2E;
 Wed, 26 Aug 2020 06:35:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 05/32] drm: etnaviv: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:32:49 +0200
Message-Id: <20200826063316.23486-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURSGc2c604ItGQuRE0QwVVFI2OLCBLRRgmZMfHB5IJgoVpkASoG0
 gKJBGwkiUPYHCVFSC8ougpU1KhChLFoNoEJAAQERTUFkCyIgZQDfvnPO/9//3pMrwMXPCRtB
 cGgEqwiVhUhIc15l8/w75wrsmL/bG60DnWxoxejyrDKCXq5Mx+mumQmSrs3q49OFxU0YrXnl
 RQ886MHo6a5BjK4Y+kjQnbX3Sbr09Wc+3fBrmDgsYkpyShDzYlbDY6pmBwimP0mPMc/ybjG9
 S0M4k9mdj5i6HhXJpC66MSm6IsRMVdid3HTW/GAAGxIcxSpcpRfMgxYLSrHwuR3XJuua+CqU
 YpeIzARA7YOUhT5kYjFVgGBEfSoRma/wNILcfDXOFVMIJpNH8HXHp5aBtUE+gped4+SGZSyt
 mzSpSModEo2Jq2xFxSFoSRaaGKf6MVgYu2xiS+oMGBo0mIl51C7oN84SJhZRh6DgWyafS7OH
 4qf1q8lmlBT0SamrYUA18qHtp5bkRD6Q220kOLaEH3rdmtkW2jPVPM4Qi2DQUMrnCjWCzttZ
 iFN5QZ/hz8pJgpXrOUJZrSvXPgJ5H+KRqQ2UBXQbN3MPsICMyns41xbB3TtiTu0A2fonG7EN
 7zvWtsXAnKp3bVvpCGq+lKE0ZJ/9P0yDUBGyZiOV8kBW6R7KXnVRyuTKyNBAl0th8gq08pna
 l/S/q9FMx8VGRAmQRCjSkEf9xYQsShktb0QgwCVWIu+37efFogBZ9HVWEeaviAxhlY1oq4An
 sRbt1Y6dE1OBsgj2CsuGs4r1KSYws1EhFDtRPe+Z6uvr7CiN01FCdfUksH7awlF+6/DNhzfG
 E9jj+d/HXUt19fqZ+PIDGqOfEM3aFM40O+k9HlnmkI9P2BM1qt5YW38PW7nFFpu6ZWnAtirv
 GDd69HSRRYaXVbl2tIHP7nSrCjR4tlHagP17pit1uxO2+6in/n6NipHwlEEydydcoZT9A826
 B45IAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xe7qbmNziDc4v5rHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFrhl32C1Wrj7KZLFgv7XFg7k3mSy+XHnIZLHp8TVWi8u75rBZrD1yl93i
 4IcnrA68HmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo/+vgUff
 llWMHp83yQVwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehl/F2xlqngu3LFx91H2RsY++S6GDk5JARMJK6feMDcxcjFISSwlFHiw+ZF7BAJGYmT
 0xpYIWxhiT/Xutggij4xSix8thcswSZgKNH1FiIhItDJKDGt+yNYN7PAcyaJly36ILawQKDE
 nEnH2EBsFgFViftvv4E18wrYSqx4Nhlqm7zE6g0HmEFsTgE7iePd/WD1QkA1p9fOYJ7AyLeA
 kWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYKRsO/Zz8w7GSxuDDzEKcDAq8fAuYHONF2JN
 LCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgoyYyS4km5wOjOK8k3tDU0NzC
 0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6PQep5KsVNbJ58LXVxgW70sNdr1
 v9ad2gPNuz9KtMiv3Rkp8/KO1faD4rcNyh490WHYytUolLtLcPcaq9aQzavXfpQ/eev6hV9z
 pR/dWbPjwJz3O6McfJ4+mnX6aMwO5nRL04ucquLLJetCLr45sIQ9eq6XzrvHa0ou2MfXnrar
 S5oi7JnW6hynxFKckWioxVxUnAgAwZS1haoCAAA=
X-CMS-MailID: 20200826063530eucas1p16acb847d7da0ea734bef507688a76c5a
X-Msg-Generator: CA
X-RootMTR: 20200826063530eucas1p16acb847d7da0ea734bef507688a76c5a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063530eucas1p16acb847d7da0ea734bef507688a76c5a
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063530eucas1p16acb847d7da0ea734bef507688a76c5a@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
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
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 +++++-------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 13 +++----------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index f06e19e7be04..eaf1949bc2e4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -27,7 +27,7 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 	 * because display controller, GPU, etc. are not coherent.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_map_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		dma_map_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
@@ -51,7 +51,7 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
 	 * discard those writes.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_unmap_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 /* called with etnaviv_obj->lock held */
@@ -404,9 +404,8 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 	}
 
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
-		dma_sync_sg_for_cpu(dev->dev, etnaviv_obj->sgt->sgl,
-				    etnaviv_obj->sgt->nents,
-				    etnaviv_op_to_dma_dir(op));
+		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
+					 etnaviv_op_to_dma_dir(op));
 		etnaviv_obj->last_cpu_prep_op = op;
 	}
 
@@ -421,8 +420,7 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
 		/* fini without a prep is almost certainly a userspace error */
 		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
-		dma_sync_sg_for_device(dev->dev, etnaviv_obj->sgt->sgl,
-			etnaviv_obj->sgt->nents,
+		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
 			etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
 		etnaviv_obj->last_cpu_prep_op = 0;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 3607d348c298..13b100553a0b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -79,7 +79,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 	if (!context || !sgt)
 		return -EINVAL;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_dma_sg(sgt, sg, i) {
 		u32 pa = sg_dma_address(sg) - sg->offset;
 		size_t bytes = sg_dma_len(sg) + sg->offset;
 
@@ -95,14 +95,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 	return 0;
 
 fail:
-	da = iova;
-
-	for_each_sg(sgt->sgl, sg, i, j) {
-		size_t bytes = sg_dma_len(sg) + sg->offset;
-
-		etnaviv_context_unmap(context, da, bytes);
-		da += bytes;
-	}
+	etnaviv_context_unmap(context, iova, da - iova);
 	return ret;
 }
 
@@ -113,7 +106,7 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
 	unsigned int da = iova;
 	int i;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_dma_sg(sgt, sg, i) {
 		size_t bytes = sg_dma_len(sg) + sg->offset;
 
 		etnaviv_context_unmap(context, da, bytes);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
