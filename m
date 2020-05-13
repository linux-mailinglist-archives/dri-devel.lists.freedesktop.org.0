Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9DD1D1531
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768466EA42;
	Wed, 13 May 2020 13:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7686EA2D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133306euoutp022904538865c76125e9e4d1165b91e49c~OmcQ9snW93223232232euoutp02s
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133306euoutp022904538865c76125e9e4d1165b91e49c~OmcQ9snW93223232232euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376786;
 bh=gZGVsSDcbwrljYEHVBEjPEV3W1/1ADc/2P3q0AYBce4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H8+uyPoiLwlb3LLCNjBZkYMvcq2apGQ2utb0ajKqzaHfnYsxj1W55ETtK7qiB+Ld+
 qUqqJbgqXT2JD9OvjxHx5bgizFOmDDMBkfCManSnuVpllS5JHkcOsbns/h97947dpa
 l3NPDt0diltZmNto47ouOM2UoWw84OTohfaGNcTY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133306eucas1p28688f5d44bb4367f2d155b5e4b7eb5e7~OmcQuEj1v1832718327eucas1p2V;
 Wed, 13 May 2020 13:33:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 94.D8.60698.217FBBE5; Wed, 13
 May 2020 14:33:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133305eucas1p15187ed8fa1e4af181cafa5c65ddab4cd~OmcQBXNLu2350623506eucas1p1C;
 Wed, 13 May 2020 13:33:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133305eusmtrp199c625ef01bb9c222eb86c8836b03bd5~OmcQAmRBa1011910119eusmtrp1G;
 Wed, 13 May 2020 13:33:05 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-c7-5ebbf712db37
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 59.37.07950.117FBBE5; Wed, 13
 May 2020 14:33:05 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133304eusmtip170a2c07de6cad9434cec876a3cc4adde~OmcPXpCC80693306933eusmtip1_;
 Wed, 13 May 2020 13:33:04 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/38] drm: lima: fix common struct sg_table related issues
Date: Wed, 13 May 2020 15:32:20 +0200
Message-Id: <20200513133245.6408-13-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7pC33fHGZxZLWrRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8XneJjaLL1ceMllsenyN1eLyrjlsFmuP3GW3OPjhCavF
 h7VfmRx4PdbMW8PosffbAhaPnbPusnts//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
 +rasYvT4vEkugDuKyyYlNSezLLVI3y6BK+N7Ux9jwXPpinUT2lgbGKeJdzFyckgImEi8e7uD
 pYuRi0NIYAWjxI19D5ggnC+MEjvXnGCGcD4zStxuuAdUxgHWsneTCER8OaPEsin9CB2v9rax
 gMxlEzCU6HrbxQZiiwi0Mkqc6OUBKWIWuMwkMf9oE1iRsECAxOYTS9hBbBYBVYndHw+xgmzg
 FbCV2NRdAHGfvMTqDQeYQWxOoPCrO/vBbpUQOMYu8WTdb2aIIheJQ1unQNnCEq+Ob2GHsGUk
 Tk/ugWpoZpR4eG4tO4TTwyhxuWkGI0SVtcSdc7/YQDYzC2hKrN+lDxF2lGhtuAT1Mp/EjbeC
 IGFmIHPStunMEGFeiY42IYhqNYlZx9fBrT144RLUOR4SR879ZIQE0GFGia3LVzFOYJSfhbBs
 ASPjKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMDUdPrf8a87GPf9STrEKMDBqMTD++D6
 7jgh1sSy4srcQ4wSHMxKIrx+64FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnN
 Tk0tSC2CyTJxcEo1MBbFS6S9m1bfWHE+6P/dL95Kr+UVy0Ikvj7XaxfiZlG+/O5A0qZfgpWf
 4n+7r1jCn/x1ip1UMrPVukI93qKH2792nrK8buCVmSfaZ1xtOXXSlLB5n3/Jm5c5y05S/SAu
 xDNtbvFrxm/nLRJ/m7ZUFhrOMO9QP6CZnb7ngelZviaxusApHHxmSizFGYmGWsxFxYkAwK2W
 fkkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7qC33fHGdxarWzRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8XneJjaLL1ceMllsenyN1eLyrjlsFmuP3GW3OPjhCavF
 h7VfmRx4PdbMW8PosffbAhaPnbPusnts//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
 +rasYvT4vEkugDtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL+N7Ux9jwXPpinUT2lgbGKeJdzFycEgImEjs3STSxcjFISSwlFFi/6rJzF2MnEBx
 GYmT0xpYIWxhiT/Xutggij4xSkw+1AZWxCZgKNH1FiIhItDJKDGt+yM7iMMscJtJ4szcCWBV
 wgJ+EntufmcCsVkEVCV2fzzECrKaV8BWYlN3AcQGeYnVGw6AlXMChV/d2c8CYgsJ5EvsXbyP
 bQIj3wJGhlWMIqmlxbnpucVGesWJucWleel6yfm5mxiBkbLt2M8tOxi73gUfYhTgYFTi4bW4
 tTtOiDWxrLgy9xCjBAezkgiv33qgEG9KYmVValF+fFFpTmrxIUZToJsmMkuJJucDozivJN7Q
 1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOjDEcLk+FOpv6nAjM2O0yb
 zzL7mtMs/bg7EZrXbn6Q3BjP9mnVzGpjwy7+Nw8TG9zy5bpP1H+dxbg5b5cno/X31kmCfjPj
 bkoFqP0XOvzJ+Fv1J0XfTrtTrbefySr+lve84bd/4lbbLxVNye6fls1deMRl5Xr5Y3Zna18e
 VFnnEPnoeiPPhF+VSizFGYmGWsxFxYkA3PtXr6oCAAA=
X-CMS-MailID: 20200513133305eucas1p15187ed8fa1e4af181cafa5c65ddab4cd
X-Msg-Generator: CA
X-RootMTR: 20200513133305eucas1p15187ed8fa1e4af181cafa5c65ddab4cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133305eucas1p15187ed8fa1e4af181cafa5c65ddab4cd
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133305eucas1p15187ed8fa1e4af181cafa5c65ddab4cd@eucas1p1.samsung.com>
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
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/lima/lima_gem.c | 11 ++++++++---
 drivers/gpu/drm/lima/lima_vm.c  |  5 ++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 5404e0d..cda43f6 100644
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
index 5b92fb8..2b2739a 100644
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
