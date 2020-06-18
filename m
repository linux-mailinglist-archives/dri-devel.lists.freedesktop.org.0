Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30F1FF767
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8F6EB8D;
	Thu, 18 Jun 2020 15:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE2D6EB82
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154037euoutp01fe749d83e352a6bdc914811e576085a5~ZrZ4EjJbB1845318453euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154037euoutp01fe749d83e352a6bdc914811e576085a5~ZrZ4EjJbB1845318453euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494837;
 bh=OvCxUp7SgRwr5TUCDUwK7Z+A0eC9Tek8fa3ny1UHTu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UkBISgi6YiNUIQdqFSI66G8LwRBlswfVHP7y03V3tK3e2RWMUSG3rvTZYKNR4aioI
 MYCBwQy3uStCNIuLwI51B8UZuUgqbwlM/EKsfbGmHyU+QFh6Sfq5zOTVKqqCWg4lG1
 OgysHNYAKghKY2wSvJDJ6BtE/cZBIBFKNfn8IPIE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200618154037eucas1p294cc10f6a9de9197d871fe4865ba2770~ZrZ3yMloI0608706087eucas1p2i;
 Thu, 18 Jun 2020 15:40:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AF.60.60698.5FA8BEE5; Thu, 18
 Jun 2020 16:40:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200618154036eucas1p2d98ca6915b554409e1f02114657680c0~ZrZ3dLwWS2502725027eucas1p2I;
 Thu, 18 Jun 2020 15:40:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200618154036eusmtrp176da250126154f0fe35847270b22b968~ZrZ3ckvAX2230622306eusmtrp1P;
 Thu, 18 Jun 2020 15:40:36 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-4d-5eeb8af5f443
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C3.F9.07950.4FA8BEE5; Thu, 18
 Jun 2020 16:40:36 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154036eusmtip12d9ee033aebbcd19d8922ddba869445d~ZrZ20Mxgp2806328063eusmtip1J;
 Thu, 18 Jun 2020 15:40:36 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 32/36] rapidio: fix common struct sg_table related issues
Date: Thu, 18 Jun 2020 17:39:53 +0200
Message-Id: <20200618153956.29558-33-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRzGeXfO2c7E6XEKvqgkLBIU1MSCA6bdJA/Rhz6EgpA58+T90uYs
 I1JMpeYUL5m2pIaI5l3n8JZ5S5tuOE3FS2leJpaZlne0sDbPtG+///M+z/v8z+HFEX47ZodH
 xCbQolhhtIBthjZ92NO5bktXgk7nLqFklm6ARS5UTiJkQ1EdRv5tykXIse2fbLKiqo9FKjq9
 yK2xeRap1I9j5GhbMZus6Z3hkAVDuwjZ/WsRu8Cjql9VA+rdjgKlWuUzHEr2Iw2jmnfmMGo2
 U82iGkuTqc8HeoTKnywH1NupFDaVraoE1KbyxHXzQLNzoXR0RCItcvcJNgtX7bYh8SP8+92q
 HE4KGLCUAi4OiTNw+HklJgVmOJ94A6B8qNM0bAGo0ZehzLAJYN/vUeQoMjD10eQqB3B1W8M6
 juj39lGji014QOmqlG1kGyIdwP4scyMjxBoL9m66GNmauAYnXi4BI6PEKbikNF7ExXmED2xY
 Wze1OcKq+q5D5hp0rTr9sBkSGg6ca6kAjMkXvm/J4jBsDb+rVSZ2gNp8GcoEHgM4r6vhMIMM
 wNHUIlPaC07r9g2r4ob1nGFdmzsjX4T768vAKEPCAk6uWjEfYAHzmgoRRubBJxl8xu0E5era
 49ru4RHT/hScyxwDzA/KBXCuT4nmAEf5/zIFAJXAlpaIY8JosWcsfc9NLIwRS2LD3G7HxSiB
 4U1pD9TbLaDjT0gPIHAgMOd9u7ESxMeEieKkmB4AcURgw7s0qA3i80KFSQ9oUdwtkSSaFvcA
 exwV2PI8S5Zv8okwYQIdRdPxtOjolIVz7VJAKjcyzfIg2bWgSBIsXJbkzHSpvDtKN+9mbzxM
 3B+/sujcib7ImDqLPWsuVNs7Vmd+Ov90IqG9urFk6U7Uo/76WSoyD2gUC8W+/r5VHY5u0zNd
 J1N7ra7WfAnwk3b7hzgEfN1TybasEwL9LnvTtlreRt7r2ukyJ5aPbXFA4KCsVYCKw4UeLohI
 LPwH0u7Izk8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7pful7HGay9oW3Re+4kk8WjVTeY
 LTbOWM9q8X/bRGaLK1/fs1msXH2UyWLBfmuLL1ceMllsenyN1eLyrjlsFmuP3GW3mHr+O7PF
 wQ9PWB14PdbMW8PosffbAhaPnbPusnv0vGlh9dj+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexpbvu5gLLglVHNwygb2B8SR/FyMnh4SAicTJmxdZuxi5OIQEljJKbJy8
 ihkiISNxcloDK4QtLPHnWhcbRNEnoKIlTWwgCTYBQ4mutxAJEYFORolp3R/ZQRxmgW9MEpOW
 3gKrEhbwkbg++xkjiM0ioCrxbNMpJhCbV8BOYuO7j1Dr5CVWbzgAZnMCxU8fbwVbLSRgK/H8
 QxvbBEa+BYwMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLjZtuxn1t2MHa9Cz7EKMDBqMTD
 +yLkdZwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAh01kVlKNDkfGNN5
 JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYmb766F24/vuazAm1
 GRM2srGtXWxc+nrCDttODfXr7yq+/lI+dvL2pJDbP42uCs06/kxWXeR0h/exjAsisZ69bLMX
 6Py3DmYI+5A7OUD27sbtdU3+50Nebix4YuK4XSHrYvudMxUOvlm6vs8zap6Z7GJa+rv5aofS
 cw7v19dbHr3i3uUV4fl5jxJLcUaioRZzUXEiADA6F3WxAgAA
X-CMS-MailID: 20200618154036eucas1p2d98ca6915b554409e1f02114657680c0
X-Msg-Generator: CA
X-RootMTR: 20200618154036eucas1p2d98ca6915b554409e1f02114657680c0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154036eucas1p2d98ca6915b554409e1f02114657680c0
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154036eucas1p2d98ca6915b554409e1f02114657680c0@eucas1p2.samsung.com>
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
index 451608e960a1..a33cc1b6beb2 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -573,8 +573,7 @@ static void dma_req_free(struct kref *ref)
 			refcount);
 	struct mport_cdev_priv *priv = req->priv;
 
-	dma_unmap_sg(req->dmach->device->dev,
-		     req->sgt.sgl, req->sgt.nents, req->dir);
+	dma_unmap_sgtable(req->dmach->device->dev, req->sgt, req->dir, 0);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
 		unpin_user_pages(req->page_list, req->nr_pages);
@@ -930,9 +929,8 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 				xfer->offset, xfer->length);
 	}
 
-	nents = dma_map_sg(chan->device->dev,
-			   req->sgt.sgl, req->sgt.nents, dir);
-	if (nents == 0) {
+	ret = dma_map_sgtable(chan->device->dev, req->sgt, dir, 0);
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
