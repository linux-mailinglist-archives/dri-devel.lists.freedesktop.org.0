Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06B1D154D
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009A86EA39;
	Wed, 13 May 2020 13:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7106EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:20 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133318euoutp02f4a1609ff827c7f9320deacee9729066~OmccXFn2n0033500335euoutp02d
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133318euoutp02f4a1609ff827c7f9320deacee9729066~OmccXFn2n0033500335euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376798;
 bh=AxGGVJLijPFiHE3rcUgd9YRtIvAhv59oZIwHxAuU5VQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P059hpzehMjRaj8DFVU3S0RC72BFcEfv0oLb66oESdCC6y4a159c1ggWbCh4t2lf5
 sA3fEJtl4HgT2c8TGoZ3N0GNdLjyBVBaGY8RW+N8DTqSPACyM19M2U2+HWLAgAtufF
 GkrWLlq0Ds5OUvlfpei0nBRL/TgPpy7txmBLb80Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133318eucas1p256fff13241ad0b0efd432f88d4503660~OmccBUuO91009610096eucas1p2P;
 Wed, 13 May 2020 13:33:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 61.E8.60698.E17FBBE5; Wed, 13
 May 2020 14:33:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133317eucas1p27aead4025db2da13e5b7c3e14a7cd79d~OmcbevO8n1009510095eucas1p2M;
 Wed, 13 May 2020 13:33:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133317eusmtrp1c3a89fc45d96779f5cb8f8ed9477e74f~Omcbd-LdP1049110491eusmtrp1c;
 Wed, 13 May 2020 13:33:17 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-f3-5ebbf71ef101
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.47.07950.D17FBBE5; Wed, 13
 May 2020 14:33:17 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133317eusmtip1806f251d176c137ac006a6346916eb1b~OmcatiawH0693306933eusmtip1I;
 Wed, 13 May 2020 13:33:17 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 29/38] drm: rcar-du: fix common struct sg_table related
 issues
Date: Wed, 13 May 2020 15:32:36 +0200
Message-Id: <20200513133245.6408-29-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+85tx7XFaV38stJY9ygvzOCgXSnihHQBISLKXHnUSqduWimE
 o5jUvKAWWCpiGmXeplOnuMq0UtNakdeh5mXqTCnNy8qY1tYx++/3PO/z8rx8fCQqasKdyEuy
 SFYuk4aICT6mq5817HL+ofdz/212pBMNbxG69L4Gp3/rUlC6dWacoJ8WvEHo7BpverI9HtB3
 Uh7x6OnWfoTWmtpxuqU6k6ATSipwuuLLN4Quet3Dox9rrQhdOzGIH6CYwqxCwDy3ZGNMxu0H
 OKPNv0MwlZY+nOmNb0CYskexTNe8CWXudj4BjN6oJJik8nzATGmdTwrO8PcEsCGXrrJyt33+
 /OCM2UEkfHzN9bniZEwJjKvUwIGElCc056pwNeCTIioPwLaaAoIT0wB+zzXyODEF4JB5Dvm3
 8nnQjHKDJwBWJtWDxZVm/WtgTxGUB1R/VRN2XkmpAGxMFNgZpawoTMvcb+cVlC9U9yTidsao
 zXBgpNyWJ0khtRcOP/PgylxgQclL1M4ONnu0uwazd0FqgAcnzd0LFx2GI7kfFngFHG0o53G8
 DjbfTVhYuAVgv6GIx4kEAFtu3gdcyht2G379bUap7VBT7cbZB+F77QRmtyG1DHZ+Xc7dvwym
 6tJQzhbC23EiLr0FpjcUL9bWfvyEcszA0YlUjHufVwCWDXTxkoFL+v+ybADygSMbpQgNYhUS
 GXvNVSENVUTJglwvhoVqge2HNc83zFSBF9YLdYAigVgg7OvQ+4lw6VVFdGgdgCQqXik8rrFZ
 wgBpdAwrDzsvjwphFXVgLYmJHYWSnC/nRFSQNJK9wrLhrPzfFCEdnJTg6LbCZI38nXaJ0aLy
 Uvm36XbfO0+srjFa0w96KQ+Mx5kOmy77VB3aOTuZOcQ//thnQ2xcWlpS38MbJaePCF0kljWe
 Tc8DT+XUW9wjIqeO9cmm9V6CE2M/ayURPXm7Z3rXb1zSmZFnHb5ytidm6VhHqSzQ7Nu6Se9/
 sjF961xxVsBFMaYIlnrsQOUK6R8rqz3eXQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7qy33fHGdxsMbPoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HStm9Gic+ISdosvVx4yWWx6fI3V4vKuOWwWPRu2slps
 ffmOyWLtkbvsFss2/WGyOPjhCauDgMeaeWsYPfZ+W8DiMbtjJqvHplWdbB7bvz1g9bjffZzJ
 Y/OSeo/b/x4ze0y+sZzRY/fNBjaPvi2rGD0+b5IL4InSsynKLy1JVcjILy6xVYo2tDDSM7S0
 0DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy5j98wlTwXvJir/rJrA0MN4U7WLk5JAQMJG4
 9+Q5cxcjF4eQwFJGiV2fpjBDJGQkTk5rYIWwhSX+XOtigyj6xChxs3kNG0iCTcBQoustREJE
 oJNRYlr3R3YQh1mghUXiw6eHLCBVwgKBEtt/TAQbyyKgKvHoxRagDg4OXgFbiWd7DCE2yEus
 3nAArIQTKPzqzn6wViGBfIm9i/exTWDkW8DIsIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMw
 prYd+7llB2PXu+BDjAIcjEo8vBa3dscJsSaWFVfmHmKU4GBWEuH1Ww8U4k1JrKxKLcqPLyrN
 SS0+xGgKdNNEZinR5HxgvOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj
 4uCUamAsfB+pVv3A2GGfnsrm3kPb/7w4tr3gS3lyfZool0LcbMuLHEcSJu57HL68PXvxWxe7
 5xeeBLi/OrBrD8dKjmnLJ3s8aLhy9WDTiknTU0+ziu0Je/3q44/Gg0sDuuoOqDTZ1d7ybO3Z
 +l2rqd/70ppT964HalTpzGNpuu/V+fJTzLUVh6/Gb/v4W4mlOCPRUIu5qDgRAHMWcbK/AgAA
X-CMS-MailID: 20200513133317eucas1p27aead4025db2da13e5b7c3e14a7cd79d
X-Msg-Generator: CA
X-RootMTR: 20200513133317eucas1p27aead4025db2da13e5b7c3e14a7cd79d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133317eucas1p27aead4025db2da13e5b7c3e14a7cd79d
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133317eucas1p27aead4025db2da13e5b7c3e14a7cd79d@eucas1p2.samsung.com>
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
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 3 +--
 drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 5e4faf2..2fc1816 100644
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
index a4a45d6..86d5e3f 100644
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
