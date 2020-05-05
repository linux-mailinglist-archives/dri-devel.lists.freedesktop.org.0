Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20711C50DA
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020B56E56D;
	Tue,  5 May 2020 08:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560DF6E197
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:30 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084629euoutp021005c4a8e83bc44c3432ab7c4657923e~MFXuRYsht2636626366euoutp02O
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200505084629euoutp021005c4a8e83bc44c3432ab7c4657923e~MFXuRYsht2636626366euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668389;
 bh=xPwJRFqsif6uJjjNuHyROIzOPdK+duY7ColGxC6nucs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G9UHlukd1x3QXIz9jQInL/zynQO20tPZ8SYygUFapqSjoV43PtAvMqjwas/q13VtR
 1o3J350x+REX1/K6uDYOkkMj58bY8Ts7lyI51/EFqyjN84+EcGzWZ8ps0viA82dPEL
 g+RJct1FZyan/uUt7Zq2j7u8PmO/eKFJ0aU7+4gI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200505084628eucas1p2e6d9d80ae7c77b138e29685007474ce4~MFXuBbCHp2338223382eucas1p26;
 Tue,  5 May 2020 08:46:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4B.32.60679.4E721BE5; Tue,  5
 May 2020 09:46:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084628eucas1p2c87aae2f471b716675559debbf680c46~MFXttSlL42338223382eucas1p25;
 Tue,  5 May 2020 08:46:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084628eusmtrp17da6bec83a3598d7c2c2340783bb97ea~MFXtsna2U0942509425eusmtrp1_;
 Tue,  5 May 2020 08:46:28 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-38-5eb127e4be29
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 16.21.07950.4E721BE5; Tue,  5
 May 2020 09:46:28 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084627eusmtip15d51d655f7ea4491834ab348c4aebb6b~MFXtLhWHI0521305213eusmtip1B;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/25] drm: lima: fix common struct sg_table related issues
Date: Tue,  5 May 2020 10:45:57 +0200
Message-Id: <20200505084614.30424-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+c7Zzo7T6WlKflgoDEoUUmcRB7x0wT8OBGElFELaKU9Tc3Oc
 qWWBTkPNqWVZaiJmUt7nZV6biDqcKyQzldC85A1hgmipQyW0zaP23+99vuf53vd7+XBU3MF3
 w2MUCQyroOMkmJDXPrA9dGbRsznCL9/iTeYNfUHI5uJGPrnX/hIlxzZXMbKmzoiQ5T0B5HqZ
 DiM3xuYQUrfwg0+O6ksxUts/LSD71hb55Jp2E7koourL6gHVbSnnUZ9KpgVUh2WWT/3KMSFU
 y4dUanJ3AaUKxqsA1TWhxqjnrbWAWte5h9qHCwOjmLiYJIb1Db4jjJ6frOYrC50ezY7qgBqM
 OWiAHQ6Jc7DX+BPRACEuJqoB3FwuBFyxAeDan3kBV6wD2JVpAYeR6vbvPBuLiSoAa3fvHyWy
 dl7vmzBCCjUrGszGLkQGgJ/zHGwmlBhF4Dtj+n7amQiFs/061MY84hTMLP62r4uIIFjU/5XH
 dfOAdU29+x47IhgujExhtosgMSCAaVn1B6YQ2FnehXHsDJdNrQKOT8LBglweF3gK4NyQVsAV
 uQCOphcfPCgATg3tWNO4dT4v2Kj35eRLsHU5W2CTIeEIx1eO2WTUiq/ai1BOFsFnmWLOfRqW
 mBqO2vYNj6AcU9CsNaDchozWNWbsIfnAo+R/s3IAaoErk6iSyxiVv4J56KOi5apEhcznXrxc
 B6zfaXDXtNEJ9H/vGgCBA4mD6NZ6Y4SYTyepkuUGAHFU4iKq3GqKEIui6OTHDBsfySbGMSoD
 OIHzJK6isxXm22JCRicwDxhGybCHpwhu56YGN97HXjM5tWSmhdkNpKbNOHdKj5vxAFfWk/6Y
 3zYBt52cNPbXPeb0gUuRITm/0zwGYv2yUuxLey6z41jlzTDzXo1yiR1uerPQ8Fa2qnW82lyh
 3NYlaWmv7CDvmZRCRXjredOLJ+qeRkWuv+XCUnGkWbo1X38FKeh+31bkPimW8FTRtNQbZVX0
 PyYwgkBKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7pP1DfGGfT/E7PoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+DxvE5vFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNXi
 w9qvTA68HmvmrWH02PttAYvHzll32T22f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+6bDWwe
 fVtWMXp83iQXwB2lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
 llqkb5egl/Ho9grWgmn8FQ8ub2JsYLzC08XIySEhYCKxYttFli5GLg4hgaWMEgvvTWeBSMhI
 nJzWwAphC0v8udbFBlH0iVHi9d8rbCAJNgFDia63EAkRgU5GiWndH9lBHGaB20wSZ+ZOYAap
 Ehbwk3gz9TDYKBYBVYm2GefBVvAK2EpMP3IWap28xOoNB8DqOQXsJB5fugO2QUigUOLD+e+s
 Exj5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMlm3Hfm7Zwdj1LvgQowAHoxIP74av
 6+OEWBPLiitzDzFKcDArifAu+7EhTog3JbGyKrUoP76oNCe1+BCjKdBRE5mlRJPzgZGcVxJv
 aGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBceeCJq5nT17F9/AnKJjG
 L6y8tjFAUiyh/WtYpuOq1qNXC//Frsk/q8zrMp3n07r3qw0Xv2O4PF97/xEle/nil14iRpKt
 s/Tu2x87XnHL/pm+80aRWwGzZ36/LbSA4Uzyh6uKTmIbOtI/NCmk7JgWqRPs0Zr4r18vJlM3
 1lJN8LOYbKhNUpGoEktxRqKhFnNRcSIAx1ExtawCAAA=
X-CMS-MailID: 20200505084628eucas1p2c87aae2f471b716675559debbf680c46
X-Msg-Generator: CA
X-RootMTR: 20200505084628eucas1p2c87aae2f471b716675559debbf680c46
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084628eucas1p2c87aae2f471b716675559debbf680c46
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084628eucas1p2c87aae2f471b716675559debbf680c46@eucas1p2.samsung.com>
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
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/gpu/drm/lima/lima_gem.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 5404e0d..fca359d 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -69,8 +69,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		return ret;
 
 	if (bo->base.sgt) {
-		dma_unmap_sg(dev, bo->base.sgt->sgl,
-			     bo->base.sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(dev, bo->base.sgt, DMA_BIDIRECTIONAL);
 		sg_free_table(bo->base.sgt);
 	} else {
 		bo->base.sgt = kmalloc(sizeof(*bo->base.sgt), GFP_KERNEL);
@@ -80,7 +79,13 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		}
 	}
 
-	dma_map_sg(dev, sgt.sgl, sgt.nents, DMA_BIDIRECTIONAL);
+	ret = dma_map_sgtable(dev, &sgt, DMA_BIDIRECTIONAL);
+	if (ret) {
+		sg_free_table(&sgt);
+		kfree(bo->base.sgt);
+		bo->base.sgt = NULL;
+		return ret;
+	}
 
 	*bo->base.sgt = sgt;
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
