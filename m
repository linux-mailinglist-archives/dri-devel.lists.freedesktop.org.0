Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EBC1C3A1C
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD601899BB;
	Mon,  4 May 2020 12:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551DE89622
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125415euoutp018ca619d4a90dd0c7f2f6bb30a13870bc~L1GxDgvn_2849828498euoutp01z
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200504125415euoutp018ca619d4a90dd0c7f2f6bb30a13870bc~L1GxDgvn_2849828498euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596855;
 bh=CgrtVSLjUYP2yj+WYZS8YtjVR3okLNG4iQ8uCybjyW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d7jxQDzNYUHUtrKaRgyByMMc19VSsvRmRCV3d9QQI2OAsVaON2hfIBYhX0GG2Y2/K
 aa2I6wwhZ07xUt3PdQfNLBnC851Wmu5h+Bg/uyKczuMoeUnw1scPkKXU+nGqh4hX/B
 ZvPakp4h7HXRI845oJhTab4gmFbqtU1fnSAYYwTA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200504125414eucas1p2c3aae4ea1c2103b5760ec95eea53f9ea~L1GwyALRk2430824308eucas1p2b;
 Mon,  4 May 2020 12:54:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3C.61.61286.67010BE5; Mon,  4
 May 2020 13:54:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200504125414eucas1p1dc1cbef1c50f430b738e74129babb95b~L1Gwh8X-Z0159401594eucas1p1z;
 Mon,  4 May 2020 12:54:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200504125414eusmtrp20b6692c293467c88086dd55a1390bf8d~L1GwhTF9k2826928269eusmtrp2O;
 Mon,  4 May 2020 12:54:14 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-fb-5eb010767dad
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 18.69.08375.67010BE5; Mon,  4
 May 2020 13:54:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125413eusmtip2609c8cbb739a553efe3a313818bcfbd5~L1Gv1V8bS0350503505eusmtip2M;
 Mon,  4 May 2020 12:54:13 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/21] drm: lima: fix sg_table nents vs. orig_nents misuse
Date: Mon,  4 May 2020 14:53:45 +0200
Message-Id: <20200504125359.5678-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7djPc7plAhviDD4d1rboPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+DxvE5vFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNXi
 w9qvTA68HmvmrWH02PttAYvHzll32T22f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+6bDWwe
 fVtWMXp83iQXwB3FZZOSmpNZllqkb5fAlXGz6xhzwUyeijdbCxsY53J1MXJySAiYSJxb8IkF
 xBYSWMEo8XxmZhcjF5D9hVHi9fyfLBDOZ0aJSUsfsnUxcoB1LJueAhFfzijRuncOC1zH19sf
 2UFGsQkYSnS97WIDsUUEWhklTvTygBQxC1xmkph/tAlsn7CAv0TriadgDSwCqhINu66BxXkF
 bCQWNbezQ9wnL7F6wwFmkM2cArYSM3vVQeZICBxjlzh4YScLRI2LxLTP86DqhSVeHd8CZctI
 /N85nwmioZlR4uG5tewQTg+jxOWmGYwQVdYSd879AvuNWUBTYv0ufYiwo8TxjsMsEC/zSdx4
 KwgSZgYyJ22bzgwR5pXoaBOCqFaTmHV8HdzagxcuMUPYHhLXOpqhAXSYUeJ+UyPLBEb5WQjL
 FjAyrmIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMS6f/Hf+0g/HrpaRDjAIcjEo8vBGf
 18cJsSaWFVfmHmKU4GBWEuHd0QIU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6Yklq
 dmpqQWoRTJaJg1OqgXHWq78JkyIFc9Rbn8+fuu+M+R2Xad+rVPf3am7m/7f5jNu28w+8Ta2Z
 w5e7Wp52W/1oygtzsVnPyh+1/7vhtCf0SXH2zknHD7xbKS1/8caOO7sZFQ2W3V/sfWujv53d
 1ZzupRJrGfXU1h6NdQiMVpBnE3zL/O9G4crFHiECf+JZf9ftfHGevfOFEktxRqKhFnNRcSIA
 Dm1b60cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsVy+t/xe7plAhviDB52iFv0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfJ63ic3iy5WHTBabHl9jtbi8aw6bxdojd9ktDn54wmrx
 Ye1XJgdejzXz1jB67P22gMVj56y77B7bvz1g9bjffZzJY/OSeo/b/x4ze0y+sZzRY/fNBjaP
 vi2rGD0+b5IL4I7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcks
 Sy3St0vQy7jZdYy5YCZPxZuthQ2Mc7m6GDk4JARMJJZNT+li5OIQEljKKLGq9zxrFyMnUFxG
 4uS0BihbWOLPtS42EFtI4BOjRNfzMhCbTcBQoustSJyLQ0Sgk1FiWvdHdhCHWeA2k8SZuROY
 QaqEBXwlzj34DmazCKhKNOy6xgJi8wrYSCxqbmeH2CAvsXrDAWaQizgFbCVm9qpDLMuXuPv0
 H8sERr4FjAyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAqNk27Gfm3cwXtoYfIhRgINRiYc3
 4vP6OCHWxLLiytxDjBIczEoivDtagEK8KYmVValF+fFFpTmpxYcYTYFumsgsJZqcD4zgvJJ4
 Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjCx5xuZ/Qm56Z8n+ie+r
 MKnMrvNf79J5a5lEQWbizanRYYs+POhVZkv5fOv3xE9xudvD4tZXLlzlnbto4rLKH9eZWhh2
 vD/vtkPr359dOW5TjXc+nNzCX3rjTOHfAptDFUE/xQ5wLrpq0KB4W29uq6XxpX/ia/3nzeFa
 4OCUXCHGml8aMn3rFSWW4oxEQy3mouJEAKiP7iioAgAA
X-CMS-MailID: 20200504125414eucas1p1dc1cbef1c50f430b738e74129babb95b
X-Msg-Generator: CA
X-RootMTR: 20200504125414eucas1p1dc1cbef1c50f430b738e74129babb95b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125414eucas1p1dc1cbef1c50f430b738e74129babb95b
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125414eucas1p1dc1cbef1c50f430b738e74129babb95b@eucas1p1.samsung.com>
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
 drivers/gpu/drm/lima/lima_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 5404e0d..3edd2ff 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -70,7 +70,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 
 	if (bo->base.sgt) {
 		dma_unmap_sg(dev, bo->base.sgt->sgl,
-			     bo->base.sgt->nents, DMA_BIDIRECTIONAL);
+			     bo->base.sgt->orig_nents, DMA_BIDIRECTIONAL);
 		sg_free_table(bo->base.sgt);
 	} else {
 		bo->base.sgt = kmalloc(sizeof(*bo->base.sgt), GFP_KERNEL);
@@ -80,7 +80,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		}
 	}
 
-	dma_map_sg(dev, sgt.sgl, sgt.nents, DMA_BIDIRECTIONAL);
+	sgt.nents = dma_map_sg(dev, sgt.sgl, sgt.orig_nents, DMA_BIDIRECTIONAL);
 
 	*bo->base.sgt = sgt;
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
