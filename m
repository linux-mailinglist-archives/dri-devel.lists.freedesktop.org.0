Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3F1CF048
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37106E8DC;
	Tue, 12 May 2020 09:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DEB6E8C0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090112euoutp01bd73a3214bcdb6ca58360d4715164aa6~OPFlayslf2630726307euoutp01F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090112euoutp01bd73a3214bcdb6ca58360d4715164aa6~OPFlayslf2630726307euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274073;
 bh=BRgXY8DAQgkV4MEkAUWetwCwPCvSLPCu5KcmIY9w/po=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NyUL83T9dhWY4BNm3sOoBsI6xEFaFokS1pDEsSzixI5SHT7BuOoZWCrk7Jgcx7t9+
 9ITL0pEGLXYZ37fNsjpezLVbfmmZ97E8LeX3oraG+omBKx4C686GnLfhFzbgfh0jlk
 FY4DOgUIXlIGDIlTry1dkDeyCFKbZgLYojwqtQKM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090112eucas1p1a11a92499467e439b1a3649ed62566f4~OPFlK9X8H1182411824eucas1p1o;
 Tue, 12 May 2020 09:01:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8B.57.61286.8D56ABE5; Tue, 12
 May 2020 10:01:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090112eucas1p225de9f54f7fd54346043fc8c31e7ea2d~OPFk1lRii2669826698eucas1p2O;
 Tue, 12 May 2020 09:01:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090112eusmtrp2893e0efbf19f422a833fd1f7611b3397~OPFk04noh0472504725eusmtrp2A;
 Tue, 12 May 2020 09:01:12 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-5d-5eba65d8900f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.35.08375.8D56ABE5; Tue, 12
 May 2020 10:01:12 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090111eusmtip1049335d0231ca430a55715e1f43aae66~OPFkSR6yt1352513525eusmtip1F;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/38] drm: etnaviv: fix common struct sg_table related
 issues
Date: Tue, 12 May 2020 11:00:29 +0200
Message-Id: <20200512090058.14910-9-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87o3UnfFGczdqGrRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLXTPusFusXH2UyWLBfmuLB3NvMll8ufKQyWLT42usFpd3zWGzWHvkLrvF
 wQ9PWB14PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR/9fA4++
 LasYPT5vkgvgjuKySUnNySxLLdK3S+DKeLyljaVgpWrFth+SDYyr5LsYOTkkBEwk3vz5wNbF
 yMUhJLCCUeLjkuPMEM4XRokjvUtZQaqEBD4zSrxcrgrT8fbROSaIouWMEptfPGOH67gwbycj
 SBWbgKFE19suNhBbRKCVUeJELw+IzSxwn0ni98ssEFtYIFjifscssA0sAqoSl2f8ZwaxeQVs
 JXbe/sEMsU1eYvWGA2A2p4CdxP35f1i6GDmA4ofYJa65Q5S4SMz6c4cJwhaWeHV8CzuELSPx
 f+d8sEMlBJoZJR6eW8sO4fQwSlxumsEIUWUtcefcLzaQocwCmhLrd+lDhB0l9l9fzwyxi0/i
 xltBiPP5JCZtmw4V5pXoaBOCqFaTmHV8HdzagxcuQV3vIfFh7Q5WSPAcZZS4+fM60wRG+VkI
 yxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITEmn/x3/tIPx66WkQ4wCHIxKPLwd
 RjvjhFgTy4orcw8xSnAwK4nwtmQChXhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliS
 mp2aWpBaBJNl4uCUamBU4V52qXV6t2v3FWUhS7/kHeHqH1UueGudCdjY/GqKyPYVGef2Lj71
 7rKl3oMdyyqnHPmg/OCoY3r0N+OQTXzGqQYvz9hymWs8V/H6feLm5gS7thn6G05M88lvbue+
 tKPC8MD866fjjePEOjcvyfWXra0zTXoffT1uxiL2v2qWOTnSphusDZYrsRRnJBpqMRcVJwIA
 aA/0ckUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7o3UnfFGUw5JmTRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLXTPusFusXH2UyWLBfmuLB3NvMll8ufKQyWLT42usFpd3zWGzWHvkLrvF
 wQ9PWB14PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR/9fA4++
 LasYPT5vkgvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DLeLyljaVgpWrFth+SDYyr5LsYOTkkBEwk3j46x9TFyMUhJLCUUeLz1Z/sEAkZiZPT
 GlghbGGJP9e62CCKPjFKLLnzkgkkwSZgKNH1FiIhItDJKDGt+yNYN7PAcyaJly36ILawQKDE
 rH2TwCaxCKhKXJ7xnxnE5hWwldh5+wczxAZ5idUbDoDZnAJ2Evfn/2EBsYUECiUeXX3LMoGR
 bwEjwypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAONl27OfmHYyXNgYfYhTgYFTi4e0w2hkn
 xJpYVlyZe4hRgoNZSYS3JRMoxJuSWFmVWpQfX1Sak1p8iNEU6KiJzFKiyfnAGM4riTc0NTS3
 sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cAYaqlhXR7mvX3LzHNiiSmKayft
 qRYR8ThorerwQ7o60iSE0V/2sg6X0lfNF3Uz/dlWb9oe/7lra9LGhshbWp0XZ8cJLeWbGKwR
 sWj7Yq2Z8yUl33PGzi2btddo8hy3dqZzea0yf/3nfxd6cOpt3rQt1cxJm9LWnft/aEqEyb7J
 S29V5t7VituvxFKckWioxVxUnAgAYmQcx6kCAAA=
X-CMS-MailID: 20200512090112eucas1p225de9f54f7fd54346043fc8c31e7ea2d
X-Msg-Generator: CA
X-RootMTR: 20200512090112eucas1p225de9f54f7fd54346043fc8c31e7ea2d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090112eucas1p225de9f54f7fd54346043fc8c31e7ea2d
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090112eucas1p225de9f54f7fd54346043fc8c31e7ea2d@eucas1p2.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 +++++-------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 13 +++----------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index dc9ef30..cc50c7b 100644
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
index 3607d34..13b1005 100644
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
