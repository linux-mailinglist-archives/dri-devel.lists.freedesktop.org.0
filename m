Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A7252740
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E966EA28;
	Wed, 26 Aug 2020 06:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401289CE1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063546euoutp0132f98fafd92d447478cfafbb627f5d3b~uve3HP5xi2036820368euoutp01V
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063546euoutp0132f98fafd92d447478cfafbb627f5d3b~uve3HP5xi2036820368euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423746;
 bh=i9tfBl9XK1ZIcmVNmOj760Z4Av4MmZkmEeWSykU107Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MDWa/v2UN64kd/Pdh2+Eqeqoqxov2kLfJNAWiAuYfPUDZdGsjK6rzp0jDh/Ieviln
 FTtvqfiaz8SXSMsHICUOsl47/oAzIj4oVOeTnycj3hrxaX9nk4J4vuowAU11CNovOv
 MRLIevFWqldfH/vPZ87AN+jaPiLfdmm0deNKsdu8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063546eucas1p248e3327a2574966e6260f8ea4243a18c~uve27uU5X0403504035eucas1p2_;
 Wed, 26 Aug 2020 06:35:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 59.BD.05997.2C2064F5; Wed, 26
 Aug 2020 07:35:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063546eucas1p268558dcd08ac9b43843f9f5e23da227d~uve2fzbFv0398703987eucas1p2r;
 Wed, 26 Aug 2020 06:35:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063546eusmtrp1324e39600c0b1709cb7b91c674f0a758~uve2fFvRB1167511675eusmtrp1M;
 Wed, 26 Aug 2020 06:35:46 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-ed-5f4602c23e0d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.E0.06314.1C2064F5; Wed, 26
 Aug 2020 07:35:45 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063545eusmtip2148831d8e511c634dd22bec68983ea60~uve14XvZb0092300923eusmtip2U;
 Wed, 26 Aug 2020 06:35:45 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 30/32] samples: vfio-mdev/mbochs: fix common struct
 sg_table related issues
Date: Wed, 26 Aug 2020 08:33:14 +0200
Message-Id: <20200826063316.23486-31-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87qHmNziDT68kLXoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2mDO10GLL6bmMFl+uPGSy2PT4GqvF5V1z2CzWHrnLbnHw
 wxNWB16PNfPWMHrs/baAxWP7twesHve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObR2/yOzaNv
 yypGj8+b5AK4o7hsUlJzMstSi/TtErgyfm/bxF6wRLDi1o78BsaNfF2MnBwSAiYSbe2XGbsY
 uTiEBFYwSnx/tZYFwvnCKHHnxE4WkCohgc+MEp++x8N0rO9bDdWxnFGid9d0JriOM1fmMoNU
 sQkYSnS97WIDsUUEWhklTvTygBQxC1xjknj79x1rFyMHh7BAgsSnV6kgNSwCqhLPph8C6+UV
 sJOY1/qIDWKbvMTqDQfA4pxA8ePd/VDxfewSO4/EQNguEnfetjFC2MISr45vYYewZSROT+4B
 e0dCoJlR4uG5tewQTg+jxOWmGVAd1hJ3zv1iAzmIWUBTYv0ufYiwo0T3uknMIGEJAT6JG28F
 QcLMQOakbdOhwrwSHW1CENVqErOOr4Nbe/DCJWYI20Oie+N5Nkj4TGSUeDP9IfMERvlZCMsW
 MDKuYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECExKp/8d/7KDcdefpEOMAhyMSjy8C9hc
 44VYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU
 7NTUgtQimCwTB6dUA+OU74IBMS0vucr3ZHVH7+uVTr/jXntVNFgm02oxx793fImpnqG6U+9d
 nXLmWK0Cd1/XLLNPN7RVfHZLvj188cKthwerP+04vObfls4Xz0yyUwraz23gsP6T2K9V7Vjt
 vNJp3+8+s5yO9+F+rHIymgFcyzy1tIv/Fb07a1S6v2N+wExW7m2BHEosxRmJhlrMRcWJAKtM
 O5tGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xe7oHmdziDb6vtbToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2mDO10GLL6bmMFl+uPGSy2PT4GqvF5V1z2CzWHrnLbnHw
 wxNWB16PNfPWMHrs/baAxWP7twesHve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObR2/yOzaNv
 yypGj8+b5AK4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
 i/TtEvQyfm/bxF6wRLDi1o78BsaNfF2MnBwSAiYS6/tWM3YxcnEICSxllPj5aSIrREJG4uS0
 BihbWOLPtS42iKJPjBKHf19jB0mwCRhKdL2FSIgIdDJKTOv+CJZgFrjHJLF3nR+ILSwQJ/Gi
 /ysbiM0ioCrxbPohZhCbV8BOYl7rIzaIDfISqzccAItzAsWPd/eDxYUEbCVOr53BPIGRbwEj
 wypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAONl27OfmHYyXNgYfYhTgYFTi4V3A5hovxJpY
 VlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOMpkBHTWSWEk3OB8ZwXkm8oamhuYWl
 obmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRsu2U4X6kaYfvvde3DRTdfW1pKJj
 l2V3bww7cEX3+YmKl0rMtrNUezkDopax21noP7DjmaHGtro+5aG64EVHpZfTQtITnsZH2mzy
 DCqQmsTD6HZt0cTgpAtaNzdGlxSt3+reNuf2Y8MfLVczbF8tnp4c8cMk0EhskYlH7ZJPbQdC
 XHfadyrdVWIpzkg01GIuKk4EAOSPyuupAgAA
X-CMS-MailID: 20200826063546eucas1p268558dcd08ac9b43843f9f5e23da227d
X-Msg-Generator: CA
X-RootMTR: 20200826063546eucas1p268558dcd08ac9b43843f9f5e23da227d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063546eucas1p268558dcd08ac9b43843f9f5e23da227d
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063546eucas1p268558dcd08ac9b43843f9f5e23da227d@eucas1p2.samsung.com>
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
Cc: kvm@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Kirti Wankhede <kwankhede@nvidia.com>,
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

While touching this code, also add missing call to dma_unmap_sgtable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 samples/vfio-mdev/mbochs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 3cc5e5921682..e03068917273 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -846,7 +846,7 @@ static struct sg_table *mbochs_map_dmabuf(struct dma_buf_attachment *at,
 	if (sg_alloc_table_from_pages(sg, dmabuf->pages, dmabuf->pagecount,
 				      0, dmabuf->mode.size, GFP_KERNEL) < 0)
 		goto err2;
-	if (!dma_map_sg(at->dev, sg->sgl, sg->nents, direction))
+	if (dma_map_sgtable(at->dev, sg, direction, 0))
 		goto err3;
 
 	return sg;
@@ -868,6 +868,7 @@ static void mbochs_unmap_dmabuf(struct dma_buf_attachment *at,
 
 	dev_dbg(dev, "%s: %d\n", __func__, dmabuf->id);
 
+	dma_unmap_sgtable(at->dev, sg, direction, 0);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
