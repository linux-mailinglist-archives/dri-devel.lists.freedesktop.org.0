Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291F25272D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6A6EA12;
	Wed, 26 Aug 2020 06:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DFF6EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063543euoutp02fd041f6463d8f760c44291ec2fcfa62e~uve0DaHT31510015100euoutp02i
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063543euoutp02fd041f6463d8f760c44291ec2fcfa62e~uve0DaHT31510015100euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423743;
 bh=65zQC7AbXs+h4Aa/SkiEZNz20G0ZAx6H0WtGo6ycvZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dWT52Awlm4gqVLEp3kqywxwyfq+KCqGD1SBaKoi62kPVnoJLqMmOoaiZ0vnKwqhPu
 Ef/UA+iAIig00CbIV2BuTE52Rng4/bc9ozquGfx9rpXDlXXHjCo/1HImpj+C7A5W4i
 XoTGfxgWLlgbBm8LKzMNsBtKE/wDI93IKlIsjOC4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063543eucas1p2e8bc6be839b341278d16e475eefc6b3c~uvezyXUaX0399203992eucas1p2f;
 Wed, 26 Aug 2020 06:35:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 06.5D.06318.FB2064F5; Wed, 26
 Aug 2020 07:35:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063542eucas1p18d9d201e3e26c08d26c3ea2a2b2a079d~uvezeH2E71480714807eucas1p1Z;
 Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063542eusmtrp1e1d9331ff012d41c9f223c8a3c4086a6~uvezdcq9M1091110911eusmtrp1j;
 Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-f6-5f4602bf1578
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AD.D0.06314.EB2064F5; Wed, 26
 Aug 2020 07:35:42 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063542eusmtip2f037eb45b2c2c16bde5d8b2a0311e40f~uvey005km0474104741eusmtip2X;
 Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 25/32] drm: rcar-du: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:33:09 +0200
Message-Id: <20200826063316.23486-26-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djP87r7mdziDVYtY7HoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HStm9Gic+ISdosvVx4yWWx6fI3V4vKuOWwWPRu2slps
 ffmOyWLtkbvsFss2/WGyOPjhCauDgMeaeWsYPfZ+W8DiMbtjJqvHplWdbB7bvz1g9bjffZzJ
 Y/OSeo/b/x4ze0y+sZzRY/fNBjaPvi2rGD0+b5IL4InisklJzcksSy3St0vgythy9TpbwX+J
 illf/jA2MP4S6WLk5JAQMJH4++0YSxcjF4eQwApGiXk/57FCOF8YJR7s+MYM4XxmlDj/7gA7
 TMuhJ21QVcsZJc4d/8cI17LodicTSBWbgKFE19suNhBbRKCVUeJELw+IzSzwh1li+hx7EFtY
 IFhi5penzCA2i4CqROPyfrBeXgE7ifNTJkNtk5dYveEAWA0nUPx4dz8byDIJgUfsErubHzNB
 FLlIfJs3F8oWlnh1fAtUs4zE6ck9LBANzYwSD8+tZYdwehglLjfNYISospa4c+4X0FgOoPM0
 Jdbv0ocIO0o0NvaDhSUE+CRuvBWEeIBPYtK26cwQYV6JjjYhiGo1iVnH18GtPXjhEjOE7SHx
 6fUeaGhNZJTYuegW+wRG+VkIyxYwMq5iFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITGKn
 /x3/uoNx35+kQ4wCHIxKPLwL2FzjhVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqT
 WnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QDY+DD53pOjau0I3R3KehO3Gi/cmvN
 Jfvrn/sPO3p3HNHufmO+NOBNzl3j6T739vnn6xkxbwy9cOJMd9ThCr2rbds9AjL/lP9bKTLz
 YCX3vPPcW249n/1PeJbt1ms6vheP+i6zLgi6d+fgn85pk2sjhL2iNcNabLbqTLs2KTXR0cB0
 +U5GHjufPUosxRmJhlrMRcWJAIGwLuZeAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7r7mNziDXbM17PoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HStm9Gic+ISdosvVx4yWWx6fI3V4vKuOWwWPRu2slps
 ffmOyWLtkbvsFss2/WGyOPjhCauDgMeaeWsYPfZ+W8DiMbtjJqvHplWdbB7bvz1g9bjffZzJ
 Y/OSeo/b/x4ze0y+sZzRY/fNBjaPvi2rGD0+b5IL4InSsynKLy1JVcjILy6xVYo2tDDSM7S0
 0DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy9hy9TpbwX+Jillf/jA2MP4S6WLk5JAQMJE4
 9KSNtYuRi0NIYCmjxJTXl1ghEjISJ6c1QNnCEn+udbFBFH1ilOi4cZENJMEmYCjR9RYiISLQ
 ySgxrfsjO4jDLNDCIvHh00MWkCphgUCJzZvvgNksAqoSjcv7mUBsXgE7ifNTJrNDrJCXWL3h
 ADOIzQkUP97dD7ZBSMBW4vTaGcwTGPkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyq
 bcd+bt7BeGlj8CFGAQ5GJR7eBWyu8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrN
 SS0+xGgKdNREZinR5HxgxOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj
 4uCUamAsq9GY/iv5FEOEuETKrfkR3FsOxredcPsVE5/eWOxzZbdLdp5POL/WlOba/q9XUl/d
 PX2xY4bPt0cbdaYeMXcqXrjklUQi35mg3Xellj29V1Z3RMEiPXa188cetoO8i5jMstTu/Lwy
 qfnt21/2m/dMCVhyWcI/aYXdu5gylctpZ14lVvyezG+nxFKckWioxVxUnAgAjcMSzsACAAA=
X-CMS-MailID: 20200826063542eucas1p18d9d201e3e26c08d26c3ea2a2b2a079d
X-Msg-Generator: CA
X-RootMTR: 20200826063542eucas1p18d9d201e3e26c08d26c3ea2a2b2a079d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063542eucas1p18d9d201e3e26c08d26c3ea2a2b2a079d
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063542eucas1p18d9d201e3e26c08d26c3ea2a2b2a079d@eucas1p1.samsung.com>
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
