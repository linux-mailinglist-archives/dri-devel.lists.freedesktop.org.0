Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5D2006A9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0536EC7A;
	Fri, 19 Jun 2020 10:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546A86EC64
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103708euoutp012aca650a521f27292de6edecdf4265b5~Z66LiJw_21836618366euoutp01m
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103708euoutp012aca650a521f27292de6edecdf4265b5~Z66LiJw_21836618366euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563028;
 bh=8SvVp249TnvdrtsN3cK9UiYXaHvxLMtfidsvZb7ATx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b1Wdkpq+JIblCQRw0qXRGt3mS9BZo2a/ReU5QmvbHi/a0jCQ65YtLya3w0o8m/xOl
 0eXikTM1BKm856HX3uCO1AmBQHqtGNHANIL0BhSLS8Oy5C08i8C2v5AyIpG8HpnT18
 M6duv+nelaH8q5RF2CubXX6ge0coGctBgp212FHI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103707eucas1p229112886057d02323b32397966e0c5de~Z66LSoZF72889328893eucas1p20;
 Fri, 19 Jun 2020 10:37:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 57.9D.05997.3559CEE5; Fri, 19
 Jun 2020 11:37:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103707eucas1p1cdb34a10d5657bdd62fdf51fb7bf0146~Z66K3G1eI3246032460eucas1p1i;
 Fri, 19 Jun 2020 10:37:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103707eusmtrp17ea3e63d377e6d12e2717cc67c41c936~Z66K2WSIT0959609596eusmtrp1O;
 Fri, 19 Jun 2020 10:37:07 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-f1-5eec95530cff
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C7.EA.06314.3559CEE5; Fri, 19
 Jun 2020 11:37:07 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103706eusmtip2b2e007b640dda940d7a846dcb13a18a4~Z66KPSNT-0247402474eusmtip2d;
 Fri, 19 Jun 2020 10:37:06 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 21/36] drm: v3d: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:21 +0200
Message-Id: <20200619103636.11974-22-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7rBU9/EGRy+rGXRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLA42XGS1Wrj7KZLFgv7XFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNWB
 x6Pp/TE2jzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAdxRXDYpqTmZZalF+nYJXBkfD75hLVgkUjH36gLGBsZ3Al2MnBwSAiYSkzsOsncxcnEI
 CaxglFj+/xobhPOFUaLz+zlGkCohgc+MEifWxsJ07Lu5jwmiaDmjxOUDu5jgOjbPX8wGUsUm
 YCjR9bYLzBYRaAXq7uUBKWIW2MkksahzD9BYDg5hAX+Je/fEQWpYBFQlPs/uZAGxeQXsJFYs
 PsAMsU1eYvUGCJsTKP665SAryBwJgV3sEld33WeBKHKRWDLnLDuELSzx6vgWKFtG4vTkHhaI
 hmZGiYfn1rJDOD1AdzfNYISospa4c+4XG8hFzAKaEut36UOEHSX2ztnNBBKWEOCTuPFWECTM
 DGRO2jadGSLMK9HRJgRRrSYx6/g6uLUHL1yCut9DYv76JhZIAE1klJg57zXLBEb5WQjLFjAy
 rmIUTy0tzk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMSKf/Hf+yg3HXn6RDjAIcjEo8vC9CXscJ
 sSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6Yklqdmp
 qQWpRTBZJg5OqQbGgIv2xf/WhDvu5/i1Yvasfd73uG/P3yb8fL8Jp8olcUkJxvkzTrHPOG46
 p4ptmqnjhifTK+o0vp361RfzW3Ky1Pz7yzNmnsqONA1RcbGrmMQoNf2Eta/RraSDJ+O8U59n
 Ss2b7ev+Z7N8rVFe+yfbl+3bX6z/In3tgHVDGOMX3WtW+sL80T5+SizFGYmGWsxFxYkA8zKQ
 LUQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xe7rBU9/EGXQ+4bfoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFgcbLjBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxdojd9ktDn54wurA
 49H0/hibx5p5axg99n5bwOKx/dsDVo/73ceZPDYvqfe4/e8xs8fkG8sZPXbfbGDz6NuyitHj
 8ya5AO4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsE
 vYyPB9+wFiwSqZh7dQFjA+M7gS5GTg4JAROJfTf3MXUxcnEICSxllGi4+4wZIiEjcXJaAyuE
 LSzx51oXG0TRJ0aJq5cvgSXYBAwlut5CJEQEOhklpnV/ZAdxmAX2M0lcPnKKHaRKWMBXYseX
 12AdLAKqEp9nd7KA2LwCdhIrFh+AWicvsXoDhM0JFH/dchCsXkjAVmL5gvfMExj5FjAyrGIU
 SS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMkW3Hfm7ewXhpY/AhRgEORiUe3hchr+OEWBPLiitz
 DzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOioicxSosn5wPjNK4k3NDU0t7A0NDc2
 NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAKPPsX5vr5MdFyT/LlXZObF50ub9ww8p9
 5b2ZkwRP3xbfuXVZ8oE17swXFrXr6iyNe3b1rBa3mrJgwPSZkVeFY+rMry7X/DXxl8SZzn61
 P1zRb8/mfj3v/W7TvFa/LeyFbmdUylRElD5c8BP7IKOyL0AoY8o95lC7U3wrO8svMZ0TSzhS
 LbXhqxJLcUaioRZzUXEiAOtTM2+nAgAA
X-CMS-MailID: 20200619103707eucas1p1cdb34a10d5657bdd62fdf51fb7bf0146
X-Msg-Generator: CA
X-RootMTR: 20200619103707eucas1p1cdb34a10d5657bdd62fdf51fb7bf0146
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103707eucas1p1cdb34a10d5657bdd62fdf51fb7bf0146
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103707eucas1p1cdb34a10d5657bdd62fdf51fb7bf0146@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
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
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_mmu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 3b81ea28c0bb..5a453532901f 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -90,18 +90,17 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
 	u32 page = bo->node.start;
 	u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
-	unsigned int count;
-	struct scatterlist *sgl;
+	struct sg_dma_page_iter dma_iter;
 
-	for_each_sg(shmem_obj->sgt->sgl, sgl, shmem_obj->sgt->nents, count) {
-		u32 page_address = sg_dma_address(sgl) >> V3D_MMU_PAGE_SHIFT;
+	for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
+		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
+		u32 page_address = dma_addr >> V3D_MMU_PAGE_SHIFT;
 		u32 pte = page_prot | page_address;
 		u32 i;
 
-		BUG_ON(page_address + (sg_dma_len(sgl) >> V3D_MMU_PAGE_SHIFT) >=
+		BUG_ON(page_address + (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT) >=
 		       BIT(24));
-
-		for (i = 0; i < sg_dma_len(sgl) >> V3D_MMU_PAGE_SHIFT; i++)
+		for (i = 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT; i++)
 			v3d->pt[page++] = pte + i;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
