Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50251C50F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F696E5A0;
	Tue,  5 May 2020 08:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2E86E57A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084638euoutp02af41e5f14f3efb7132e8bdcc6822c0ae~MFX3I_MKf2636226362euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200505084638euoutp02af41e5f14f3efb7132e8bdcc6822c0ae~MFX3I_MKf2636226362euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668398;
 bh=IYleu1TD92dIEWVtvs80X8f4Hh3zY8IGoKg3d/K8K5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jRuuBaalKiD4DX2IGTa8cxnoXFXe3YHgUYZydy7VPXLpKjuJp0QPpm1z2w62k3ghn
 czLHPhMB/dgRPYevjGu2rzsst0COdTh4/LmGZszX7AyXGircLBVhZlfOCGfkEUjT5I
 NVID7tYOQUxEwAg3U8s0Bxj//TqT475NPoPDEDwg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200505084638eucas1p2f64e6e9e159f32f6a5075d0f6fe56f6d~MFX22A1302337523375eucas1p2A;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8B.CF.61286.EE721BE5; Tue,  5
 May 2020 09:46:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084637eucas1p2c6d4b880698e8db97a8a9468692befe1~MFX2ekOHW1058410584eucas1p26;
 Tue,  5 May 2020 08:46:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084637eusmtrp10bd85c1ae40dc41b984d18a142bc75ac~MFX2d2rLe0969509695eusmtrp1D;
 Tue,  5 May 2020 08:46:37 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-bd-5eb127ee01b8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.24.08375.DE721BE5; Tue,  5
 May 2020 09:46:37 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084637eusmtip141ccbb722e7764196913fe16c0e77997~MFX15Hfo30686606866eusmtip1O;
 Tue,  5 May 2020 08:46:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/25] rapidio: fix common struct sg_table related issues
Date: Tue,  5 May 2020 10:46:12 +0200
Message-Id: <20200505084614.30424-23-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURSGvTOd6bQwOBQSrkUhKVEjRpbowyQoLvFhTHwwPhg0EagygrEt
 0AIC0YALRmohFFBI3dAoSymyyKIsURBathRDRUEhgiUSCRQEZNEIMhnAt+/85/z3Pzm5BCpp
 wKTERVUcq1bJFTJcLKg1L1n3OHZWhgYUZhN0hrUDob8Z+1G6Mr8co1dq9Sj94dcUTpeUtiF0
 wZsgeu7DCEJX2T9itK3+AU6XtQ4J6bs9CyjdPD2KHSIZ0yMTYJrmCwTMa8OQkNFN3MSYuvlh
 jPl6x4IwL5+lMF+W7SiT018EmIaBVJzJrDYCZrbK64TzGfH+CFZxMYFV+weHi6NKyvRIzMDm
 RGPHe0EqyCa1QERAah+0P+xEtUBMSKhiAEeL0hG+mAOw/ZoD8MUsgAZ9Dli35P19gvGNIgCN
 5nxswzJzP0vITeFUINROanGO3am01bcynDlGKQcCW2d9OXajjkNdbgnGsYDaDhduTqwyQZBU
 MDTVKfgwb1ha8RblWLQq23sHcS4LUlYhfFRvWtvoKPxTnC7k2Q2OW6rXeCvsytEJeMMNAEes
 ZUK+0AFou56/5g6Cg9bfOJeMUrtgeb0/Lx+G5oxPAk6GlAvsn3Tl93eB2bV5KC+T8PYtCT+9
 AxosLzZim9/3ojwzcGB0Eufv0wZgdWOXMAt4G/6HFQBgBB5svEYZyWoCVexlP41cqYlXRfqd
 j1ZWgdUv1bVsmXkFfvWeawEUAWTOZMhseagEkydokpQtABKozJ0sXKwIlZAR8qRkVh0dpo5X
 sJoW4EkIZB7k3qc/zkqoSHkce4llY1j1ehchRNJUkHY6V7psqEECpizG/oJ3WZFOGfknF50W
 leHHbLHTxiM9rpUhK+pun7jdeF8MXS8VdXvKXMY6pVUHyfHG2APft91P2rJpJibM4WU2xw43
 6bW24SV9YtqFku4+YcSpz95jRlOEqKUh4Pm9K/YaWebj9p8Y2WhL9mlN2X1VN+awygSaKHmg
 L6rWyP8BKu1GI04DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xu7pv1TfGGez/qWPRe+4kk8WjVTeY
 LTbOWM9q8X/bRGaLK1/fs1msXH2UyWLBfmuLL1ceMllsenyN1eLyrjlsFmuP3GW3mHr+O7PF
 wQ9PWB14PdbMW8PosffbAhaPnbPusnv0vGlh9dj+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexsq1E5kKbvJXrDp5gaWBcRJvFyMnh4SAicT0vwtZuxi5OIQEljJKdF49
 wgKRkJE4Oa2BFcIWlvhzrYsNougTo8T19ulMIAk2AUOJrrcQCRGBTkaJad0f2UEcZoFvTBKT
 lt5iA6kSFvCR6JmyEmwUi4CqxPeWN0A2BwevgJ3Emu05EBvkJVZvOMAMYnMChR9fugPWKiRQ
 KPHh/HfWCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRGzbZjPzfvYLy0MfgQowAH
 oxIPb8Tn9XFCrIllxZW5hxglOJiVRHiX/dgQJ8SbklhZlVqUH19UmpNafIjRFOimicxSosn5
 wIjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAKC9wImTvmqdq
 Nscb4zNXJJnoSZze5/Sp9sWs13vCzu732OT2WH3ZlD3M73YeOhycIV/gdLHzc9fXtBmHP69M
 untffKl6a7JX46etvcrcznymB9g72s5JHvR4+/wXr87v23MdHIwYf1tVGpwJW7vOMM6pfet7
 U4PMFoMaoweRSrdvmTy/n2ejpcRSnJFoqMVcVJwIAEZ4Vb+wAgAA
X-CMS-MailID: 20200505084637eucas1p2c6d4b880698e8db97a8a9468692befe1
X-Msg-Generator: CA
X-RootMTR: 20200505084637eucas1p2c6d4b880698e8db97a8a9468692befe1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084637eucas1p2c6d4b880698e8db97a8a9468692befe1
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084637eucas1p2c6d4b880698e8db97a8a9468692befe1@eucas1p2.samsung.com>
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
 drivers/rapidio/devices/rio_mport_cdev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 4029637..df7dba8 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -574,8 +574,7 @@ static void dma_req_free(struct kref *ref)
 	struct mport_cdev_priv *priv = req->priv;
 	unsigned int i;
 
-	dma_unmap_sg(req->dmach->device->dev,
-		     req->sgt.sgl, req->sgt.nents, req->dir);
+	dma_unmap_sgtable(req->dmach->device->dev, req->sgt, req->dir);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
 		for (i = 0; i < req->nr_pages; i++)
@@ -927,9 +926,8 @@ static int do_dma_request(struct mport_dma_req *req,
 				xfer->offset, xfer->length);
 	}
 
-	nents = dma_map_sg(chan->device->dev,
-			   req->sgt.sgl, req->sgt.nents, dir);
-	if (nents == 0) {
+	ret = dma_map_sgtable(chan->device->dev, req->sgt, dir);
+	if (ret) {
 		rmcd_error("Failed to map SG list");
 		ret = -EFAULT;
 		goto err_pg;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
