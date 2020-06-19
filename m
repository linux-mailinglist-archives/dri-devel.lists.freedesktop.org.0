Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A022006BA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980266EC84;
	Fri, 19 Jun 2020 10:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D156EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103717euoutp027bac00ef82f467abf8ef0b5c698df617~Z66T93W7x2414024140euoutp02O
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103717euoutp027bac00ef82f467abf8ef0b5c698df617~Z66T93W7x2414024140euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563037;
 bh=mzLIyVTZpzYfnKpa4gX5M1szjJk3Wzuil/t51kYHhjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OgTkirsddpsb6k4dUnD21tj8nHE5nc9lB4wxDqLGxxLTxWioLXMEE0HdzVYxYd1jy
 bY1101TBRZ4M+qShbyUL0gYrbMSjVT9lrIZ/jQSBMuum+crCCspzE2EubeMXXT1D6q
 mi9y/rYTVvIbSaEl/KoXbQQaO1wL0Nxn/NHObi0s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103716eucas1p162a56c5b084f03b07a1e1f00fe2e53d7~Z66TgIjHe0704707047eucas1p1C;
 Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 20.AD.05997.C559CEE5; Fri, 19
 Jun 2020 11:37:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103716eucas1p1b7c50f7b421fb29829050b9355e3e644~Z66THeSaL0706007060eucas1p14;
 Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103716eusmtrp19beba6ed65a603a1c08b57cb53ea06b1~Z66TG3meQ1007310073eusmtrp1I;
 Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-12-5eec955c60c9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C9.1B.06017.C559CEE5; Fri, 19
 Jun 2020 11:37:16 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103715eusmtip298b27b150d32f56203c96b474d54e50a~Z66Sd2Ghv0111401114eusmtip2P;
 Fri, 19 Jun 2020 10:37:15 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 33/36] rapidio: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:33 +0200
Message-Id: <20200619103636.11974-34-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjm27nsuJydpuCHVsIiQclrEYc0yZA43SCoP5qXlh7vOtucZf5w
 6LRYGi0RdUhoCJrXvKSls1SsKeYUNZ2ppBmaec15wZma85j9e573fZ73efj4CETQhNkQEbHx
 jCRWFC3EeWj9p40eJ//suUBX/Ywdlanr5FDfS/UIVZ1bhVE79SqEGlhdxKlXZR85VMEHD2pl
 YIJD1UwOYlR/Yz5OVbSPcansnnWEal36gV3g0+UvygHdvFaA0u/UY1w6Y06B0Q1r4xj97YmW
 Q9cWJdMj25MInaUvBnTTsBynn9aVAtpQc/yGuR/PM4SJjkhgJC5ed3jhQ9OdnLgBwYNajRyT
 g67DSmBGQPIMXDcMcZSARwjIEgCbc8b3yQqAhpIanCUGAEe38rj/LLUNGxi7KAZQ2dENDixr
 hTOoSYWTblA5r8RN2IpMA7Aj09yEEXKBA9sNjiZsSV6DlcbNvasoeRLmbc7sXiUIPukF6zQo
 G2YHy163ICZstjueVbTuBUNSx4XbKW0IK/KBut40jMWW8Je2br/pUdiVlYGyhlQAJ3QVXJZk
 ANifkgtYlQcc1RlxUzJCOsCqRhd27A3fpGv2CkHSAurnj7D9LeDz+hyEHfPh43QBq7aHam3l
 QWxrb99+NRp+nZzdfywVgLmFy/gzYKf+H1YAQCmwZmTSmDBG6h7L3HeWimKkstgw52BxTA3Y
 /VJd29qVt6Dxz902QBJAaM7/eWs2UICJEqSJMW0AEojQin+xuytQwA8RJT5kJOIgiSyakbYB
 WwIVWvNPv5wJEJBhongmimHiGMm/LYcws5GDattB76lpK1wV1PIZr31/0789ams1NGl5RDzc
 qR5yvnxOvLy0Q/ks+vbhc4WeqCzclTjrpWpeKZMrkpNcnL4Izes3ppPpSHWrOO56ZLBDYWL0
 lXn7qUcJRQG/85e5J3gL7saGdn3CvaRL7orQqw3MqfOpt/0OtRwzNvsqHFI0QlQaLnJzRCRS
 0V/Z4WygTgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xe7oxU9/EGaw9y27Re+4kk8WjVTeY
 LTbOWM9q8X/bRGaLK1/fs1msXH2UyWLBfmuLL1ceMllsenyN1eLyrjlsFmuP3GW3mHr+O7PF
 wQ9PWB14PdbMW8PosffbAhaPnbPusnv0vGlh9dj+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexvXnJ5kKrghVbN7TwNrAeJq/i5GTQ0LARGLz9p+sXYxcHEICSxklFrxc
 xQKRkJE4Oa2BFcIWlvhzrYsNougTo8STqbeYQBJsAoYSXW8hEiICnYwS07o/soM4zALfmCQm
 Lb3FBlIlLOAjse7Xb3YQm0VAVWLm75dAYzk4eAXsJLbsgdomL7F6wwFmEJsTKPy65SDYZiEB
 W4nlC94zT2DkW8DIsIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwarYd+7llB2PXu+BDjAIc
 jEo8vC9CXscJsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBNE5mlRJPz
 gRGdVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB8ZDlDLNfl/Vb
 LtQHx95bLzf16aGWb5W6a0WSlVZslUqR8pv/5Hb7bqcoizWCWifeHBMJX20W/aD/fPwttzCt
 hOkxTxr+vbvBzjXntFpFSe2isLlnij9dsXbeHzhH6Olnx/7Luf2fuB3uHe2pnFD1p/pG/rSI
 G9bF2+frBTws8N81jU2HRzakQImlOCPRUIu5qDgRAL+/YhqwAgAA
X-CMS-MailID: 20200619103716eucas1p1b7c50f7b421fb29829050b9355e3e644
X-Msg-Generator: CA
X-RootMTR: 20200619103716eucas1p1b7c50f7b421fb29829050b9355e3e644
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103716eucas1p1b7c50f7b421fb29829050b9355e3e644
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103716eucas1p1b7c50f7b421fb29829050b9355e3e644@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Alexandre Bounine <alex.bou9@gmail.com>,
 Matt Porter <mporter@kernel.crashing.org>, Robin Murphy <robin.murphy@arm.com>,
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
---
 drivers/rapidio/devices/rio_mport_cdev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 451608e960a1..98c572627c8c 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -573,8 +573,7 @@ static void dma_req_free(struct kref *ref)
 			refcount);
 	struct mport_cdev_priv *priv = req->priv;
 
-	dma_unmap_sg(req->dmach->device->dev,
-		     req->sgt.sgl, req->sgt.nents, req->dir);
+	dma_unmap_sgtable(req->dmach->device->dev, &req->sgt, req->dir, 0);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
 		unpin_user_pages(req->page_list, req->nr_pages);
@@ -930,9 +929,8 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 				xfer->offset, xfer->length);
 	}
 
-	nents = dma_map_sg(chan->device->dev,
-			   req->sgt.sgl, req->sgt.nents, dir);
-	if (nents == 0) {
+	ret = dma_map_sgtable(chan->device->dev, &req->sgt, dir, 0);
+	if (ret) {
 		rmcd_error("Failed to map SG list");
 		ret = -EFAULT;
 		goto err_pg;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
