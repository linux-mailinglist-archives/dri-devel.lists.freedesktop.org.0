Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA71C3A34
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055E6E3D6;
	Mon,  4 May 2020 12:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0160C6E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125422euoutp019c731dc8ae5afbcab4cdf1141eae656a~L1G4P88lf2860028600euoutp010
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200504125422euoutp019c731dc8ae5afbcab4cdf1141eae656a~L1G4P88lf2860028600euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596862;
 bh=CdIMVqjLfPbr2jLLEe0ZicEok9i2dnM6rwDKcvTWky4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ir4081WIHDNEdYLg4QQXat83GvNdWyMVsjjxIo5mgXBQP53jUk0lKnAd5fE0kKFVg
 CjqrOTI9r5hojh0X/vyA4mzZYMqM4XX/7uImsZWqVMvzUovGxJ7anG3cqoYuNgApH5
 /43k0WWV1UfNNxRPnkB8uwEN1mlbeFjiJ+1VqhHE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200504125422eucas1p2149cb7a79319eaa936ed12e8793cbc57~L1G38QOlQ0599805998eucas1p2E;
 Mon,  4 May 2020 12:54:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2B.12.60698.E7010BE5; Mon,  4
 May 2020 13:54:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200504125421eucas1p12d5bd93de51ec15b9287e2e3bd2e2ee5~L1G3XaE_01031810318eucas1p1S;
 Mon,  4 May 2020 12:54:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200504125421eusmtrp216a00ef14795ce4a4f976d14713b2fcb~L1G3Wwm592826928269eusmtrp2a;
 Mon,  4 May 2020 12:54:21 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-5e-5eb0107e57de
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2E.69.08375.D7010BE5; Mon,  4
 May 2020 13:54:21 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125420eusmtip2440b7ec9272cefcb94b6bd200d1a54f5~L1G2mAM_U0241702417eusmtip2J;
 Mon,  4 May 2020 12:54:20 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/21] drm: rcar-du: fix sg_table nents vs. orig_nents
 misuse
Date: Mon,  4 May 2020 14:53:55 +0200
Message-Id: <20200504125359.5678-17-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUgUURzHeTM7s6PtyrQaPiwUFjohzRScsKILmaigAyI6zDWH1XJVdtU8
 KBdN09WtLMH1wLay1ltbb8XyKDcTPBczc8kLPPDCC8pj23Gs/vt8v7/3e9/f7/EIVGTAHIiA
 oFBGHiQJFOPWvKrWXx0HH5Jl3oeGVmwpdUcbQr3XlGKUuSoVpYzLcziVX/gZobQfPamFvmRA
 JaXm8qkl4zBC6Uf7MKq3LhunUsoqMapychahij+Z+NQ7/RpCNc2PYSdIuiinCNANK1oenZWY
 gdH6giScrl4ZwuifyQaELs+NoX9sjKL0i34doOu/K3H6SUUBoBf1jhcF162P+jGBAeGM3OW4
 j7X/04J+fkibTYS6yoQqQY1ABawISLrDhMFkRAWsCRGZB2C3smtLLAHYWRuPcWIRwOyJDEuF
 2GzpKvFju0WkDsDp3EscWxryKoNZxklXqJpR4SzbkfEAflEL2HtQcg2Fs6MqjC3YkpfhePkI
 n2UeuRtqdA2bLCSPwUZjDuDGc4KFZY0om2tl8TPUezl7kg9LWqw4PgPnF0cQjm3hlKGCz/Eu
 aK59ubkMJOMAHO4o5nMiBcDeWM1WgCcc7PiNswEouR+W1rlw9kn4uDsTcPvawP6Z7ayNWvB5
 VTrK2UKYmCDiTu+BmYaSf7FNXT0oxzSsq+7ZesIWAIs6C3nPgFPm/zAtAAXAnglTyKSMwi2I
 ue+skMgUYUFS5zvBMj2wfK/2DcNyDfiw5tsMSAKIBcJri6XeIkwSroiUNQNIoGI7Yc0jiyX0
 k0RGMfLg2/KwQEbRDHYSPLG90O315C0RKZWEMvcYJoSR/60ihJWDEni0xGybMesdo7s6ByLO
 e5xavxoXoDZFv/L2CtEkZ+ncG30Cxq6UiHQP+kPfXoo7cnfG/oYpq301cfi0dv1NWv23OdVN
 wb5Is5dydVamHU01jEftyBcYTbr8KTMuNZK9PdkOGjx74KthfKH17Jiv9PCCz9j0uYp000Ra
 dGzd9AUxT+EvcT2AyhWSP1K+y29aAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xe7q1AhviDDZP1rPoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HStm9Gic+ISdosvVx4yWWx6fI3V4vKuOWwWPRu2slps
 ffmOyWLtkbvsFss2/WGyOPjhCauDgMeaeWsYPfZ+W8DiMbtjJqvHplWdbB7bvz1g9bjffZzJ
 Y/OSeo/b/x4ze0y+sZzRY/fNBjaPvi2rGD0+b5IL4InSsynKLy1JVcjILy6xVYo2tDDSM7S0
 0DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy+hfdYO94CRfRe+2u8wNjDt4uhg5OCQETCQu
 rEvpYuTiEBJYyihx6Mluxi5GTqC4jMTJaQ2sELawxJ9rXWwQRZ8YJZZeWsUGkmATMJToeguR
 EBHoZJSY1v2RHcRhFmhhkejZ+JgFpEpYIEBi4Z43YKNYBFQlZizfyw5i8wrYShy4Mg9qnbzE
 6g0HmEFO4gSKz+xVBwkLCeRL3H36j2UCI98CRoZVjCKppcW56bnFhnrFibnFpXnpesn5uZsY
 gRG17djPzTsYL20MPsQowMGoxMMb8Xl9nBBrYllxZe4hRgkOZiUR3h0tQCHelMTKqtSi/Pii
 0pzU4kOMpkA3TWSWEk3OB0Z7Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKY
 PiYOTqkGxh6nJYmc270/5ht+PfVCPdqINzb89e8zoflHU/3fnTmY2nbZYJHGllebRK4VNqUf
 /HpKY8uaN/rqhWcNr0ybMCvJbH7RnU0HJsaUX+2u2bpryfNz7xyy97jbsF+OuasntHXjOtHD
 J33be7dO/TPxxcslThGbLWRt+/ZZnlU6LOm+TvrvtudsK+8osRRnJBpqMRcVJwIAi1FBsr4C
 AAA=
X-CMS-MailID: 20200504125421eucas1p12d5bd93de51ec15b9287e2e3bd2e2ee5
X-Msg-Generator: CA
X-RootMTR: 20200504125421eucas1p12d5bd93de51ec15b9287e2e3bd2e2ee5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125421eucas1p12d5bd93de51ec15b9287e2e3bd2e2ee5
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125421eucas1p12d5bd93de51ec15b9287e2e3bd2e2ee5@eucas1p1.samsung.com>
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
 drivers/media/platform/vsp1/vsp1_drm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index a4a45d6..b54a30f 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -912,8 +912,9 @@ int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt)
 	 * skip cache sync. This will need to be revisited when support for
 	 * non-coherent buffers will be added to the DU driver.
 	 */
-	return dma_map_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	sgt->nents = dma_map_sg_attrs(vsp1->bus_master, sgt->sgl,
+			sgt->orig_nents, DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	return sgt->nents;
 }
 EXPORT_SYMBOL_GPL(vsp1_du_map_sg);
 
@@ -921,7 +922,7 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
-	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
+	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->orig_nents,
 			   DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
 }
 EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
