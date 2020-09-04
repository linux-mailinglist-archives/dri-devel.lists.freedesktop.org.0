Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F625D9F6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC866E33C;
	Fri,  4 Sep 2020 13:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBFD6E312
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133509euoutp01b6198928cefee19e7f392e16b59d9da6~xmAl-e26r0721507215euoutp01r
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133509euoutp01b6198928cefee19e7f392e16b59d9da6~xmAl-e26r0721507215euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226509;
 bh=65zQC7AbXs+h4Aa/SkiEZNz20G0ZAx6H0WtGo6ycvZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bf2fKFShGlm+pfJSXUQUVICSDo6soEQGaqsqijd6BS3x595gzQh6G3n1AxUNaSZdE
 gPBTN2wR0xDgGTEqemJTwhpp4nVEXQs26Muj9ip/D0jT/hfO3sEdgeaBFOv9YNn3TI
 tOjE+yhY8fuIKZpjL613A+pZI/Vr96D5TyllYAOY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133508eucas1p21f933737a416c70575a6bc8994670007~xmAljtcol0781307813eucas1p2-;
 Fri,  4 Sep 2020 13:35:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 39.11.06456.C82425F5; Fri,  4
 Sep 2020 14:35:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133508eucas1p144e8c20b098912e8bf275642f2c709e6~xmAlI3sXS2307023070eucas1p1W;
 Fri,  4 Sep 2020 13:35:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200904133508eusmtrp18a48b753c6c81394e3d104bf3cf3a8ea~xmAlIKVZ40766507665eusmtrp1K;
 Fri,  4 Sep 2020 13:35:08 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-5d-5f52428c4fa2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CA.BE.06314.C82425F5; Fri,  4
 Sep 2020 14:35:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133507eusmtip16507aff28a627187d88af93e208665b5~xmAke9p3K1624216242eusmtip1t;
 Fri,  4 Sep 2020 13:35:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 24/30] drm: rcar-du: fix common struct sg_table related
 issues
Date: Fri,  4 Sep 2020 15:17:05 +0200
Message-Id: <20200904131711.12950-25-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURiFuZ3OdCiUDIXIDRhIGjUgYVNjroGA4pJRHzTEF00UiwyLQiEt
 IPCgaFGhgGGJoRRiAAlo2cuiQghLhKIoIlQEBWUTAoLImrDLOKhv3//fc3Lyn1wSE7fj1mSw
 LIKRy6QhEkLIr21b6XRK9vbxdZ1bsEcpna95qFJdjqOt2jQMGZZmCfSsuJWHchvd0XxvEkCJ
 aQUCtGgY5iHdaC+OeupyCJRcUYOjmsmfPFT6alCACnXrPNT8aww/StElj0sA3bCcy6ezE7Jw
 WqdNJOjny0M4/S1Jz6OrCm7TXzZHMTqjrwjQ9f1xBP2wWgvoBZ3tedNLQg9/JiQ4ipG7eF4V
 BlV//ESEb8FozeI6iAOrlipAkpA6BOPnCRUQkmLqKYDTldl8blgEsD5+UKACxtvDAoCT7ddZ
 Zg2afC3GiYoANKwpd0Tbjo6JWJYJyg2qZlQEy5bUPQDbU0xZxqh1DGbmeLFsQV2AmSs5f7x8
 ai8caRv/wyLKE75Xl/K5MDtYXNGEsWy8va9Rj+FsMKS+CqC2cBNwohOweEa/wxZwSl8t4Hg3
 7MhI5nMGJYDDnaUCbkgGsOeuesfhDgc6Vwm2DIxygOV1Ltz6GPxcXs7jOjKDfTPm3AFmML02
 E+PWIphwX8yp90GNvuxfbHNXN8YxDRtaR3caTQOwq0wpSAV2mv9huQBogRUTqQgNZBRuMuam
 s0IaqoiUBTpfCwvVge3/1bGpn38Blrr9WgBFAompyMjLx1eMS6MUMaEtAJKYxFLk/a7jiljk
 L42JZeRhvvLIEEbRAmxIvsRKdDB/8rKYCpRGMDcYJpyR/33lkcbWcSDQ6bufW8CbW5qRYZMs
 bb6ywuRt3sjcmothV8Ap/cUHR5KmbGY38ozKhoq9jOfP3uk/be+1x3zgQyPwdrWLafKQbVDT
 h50nDLZj69Lu/HGmoSth2PCyRHhgdSo65VyqWum7WbrkaIOU6Rs/+oeqhA4h0SczHm0VPXGU
 NRK1RmeOS/iKIKnbfkyukP4Gp6V1LFsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7o9TkHxBhMeCVr0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLrWzWjROXEJu8WXKw+ZLDY9vsZqcXnXHDaLng1bWS22
 vnzHZLH2yF12i2Wb/jBZHPzwhNVBwGPNvDWMHnu/LWDxmN0xk9Vj06pONo/t3x6wetzvPs7k
 sXlJvcftf4+ZPSbfWM7osftmA5tH35ZVjB6fN8kF8ETp2RTll5akKmTkF5fYKkUbWhjpGVpa
 6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWy5ep2t4L9ExawvfxgbGH+JdDFyckgImEjM
 WrSKuYuRi0NIYCmjxP3981ggEjISJ6c1sELYwhJ/rnWxQRR9YpQ4MP8yO0iCTcBQoustREJE
 oJNRYlr3R3YQh1mghUXiw6eHYKOEBYIk5uxaA9bBIqAq8ejYMzCbV8BO4vyMtVDr5CVWbzjA
 DGJzAsW3zngCtlpIwFbiw5zFLBMY+RYwMqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjKpt
 x35u3sF4aWPwIUYBDkYlHl4G+6B4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleak
 Fh9iNAU6aiKzlGhyPjDi80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFx
 cEo1MNZ2fNoken3nzGv7OBJblzuXN728X7mVo1n3qbRX2noma/v2UyfPH4ifz3nNW1zax+BT
 KxNP2vzURPMjdpyXJ3YpfIgJO133+0Zg6xKmE4n+ivL5T5hsQuoKe92zb26OPVq3LXNh65nc
 b6FJ279YLDJmCb0Zrb5PJGu5Sva9tzqXMn7ptT3iVWIpzkg01GIuKk4EAHzI3KjAAgAA
X-CMS-MailID: 20200904133508eucas1p144e8c20b098912e8bf275642f2c709e6
X-Msg-Generator: CA
X-RootMTR: 20200904133508eucas1p144e8c20b098912e8bf275642f2c709e6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133508eucas1p144e8c20b098912e8bf275642f2c709e6
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133508eucas1p144e8c20b098912e8bf275642f2c709e6@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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

dma_map_sgtable() function returns zero or an error code, so adjust the
return value check for the vsp1_du_map_sg() function.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 3 +--
 drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..a27bff999649 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -197,9 +197,8 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			goto fail;
 
 		ret = vsp1_du_map_sg(vsp->vsp, sgt);
-		if (!ret) {
+		if (ret) {
 			sg_free_table(sgt);
-			ret = -ENOMEM;
 			goto fail;
 		}
 	}
diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index a4a45d68a6ef..86d5e3f4b1ff 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -912,8 +912,8 @@ int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt)
 	 * skip cache sync. This will need to be revisited when support for
 	 * non-coherent buffers will be added to the DU driver.
 	 */
-	return dma_map_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	return dma_map_sgtable(vsp1->bus_master, sgt, DMA_TO_DEVICE,
+			       DMA_ATTR_SKIP_CPU_SYNC);
 }
 EXPORT_SYMBOL_GPL(vsp1_du_map_sg);
 
@@ -921,8 +921,8 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
-	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-			   DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(vsp1->bus_master, sgt, DMA_TO_DEVICE,
+			  DMA_ATTR_SKIP_CPU_SYNC);
 }
 EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
