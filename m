Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE161FF758
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B696EB81;
	Thu, 18 Jun 2020 15:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896F6E433
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154031euoutp017d4e4447b4eaafae65945b79c6f93da1~ZrZyQuGl11835418354euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154031euoutp017d4e4447b4eaafae65945b79c6f93da1~ZrZyQuGl11835418354euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494831;
 bh=KttQx/p+NwMYqZeVMMA/mdxDyA5P7MIUmLy+qtaSi8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lnh2Yj0aezq1/W1iVdiR1C+hQ088kbAiiypTZR6RAAW0KeRr3BAZhVJk2YZOgaEfa
 PGgD9rtrZmWJhLTX7/wA95tx46FWJd/x7/U34b3/+8auNofwwc9feeZtixKVj2RL5z
 Sd4b8hWriNDNEP5X20SLpWl/eBot0F6KyQWwR8GQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154031eucas1p1b2a5f82d438657ef26f917087674bb21~ZrZyFvvYn2141221412eucas1p1B;
 Thu, 18 Jun 2020 15:40:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 06.DE.60679.EEA8BEE5; Thu, 18
 Jun 2020 16:40:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200618154030eucas1p2f36e6ec52cea051fccedb1970f27bef9~ZrZxrWGHz2945829458eucas1p2s;
 Thu, 18 Jun 2020 15:40:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200618154030eusmtrp100e1d8b9d488d275259cad6d740c1947~ZrZxqp9xw2230622306eusmtrp1D;
 Thu, 18 Jun 2020 15:40:30 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-43-5eeb8aee6e4f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.E9.07950.EEA8BEE5; Thu, 18
 Jun 2020 16:40:30 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154029eusmtip14b193a12662698378a07245764c6f5b6~ZrZxCgcmM0742307423eusmtip1V;
 Thu, 18 Jun 2020 15:40:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 24/36] xen: gntdev: fix common struct sg_table related
 issues
Date: Thu, 18 Jun 2020 17:39:45 +0200
Message-Id: <20200618153956.29558-25-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTcRTH++3eu13NyW2a/rBQGCUVpan746JhJkGXHhQRRKHm0osz3bTN
 Z5SKNpP5SBNRRM1e+JrPrWWKppbNR77NfKam0sPMt6GJtXnV/vuc7znfcw6HgyO8RswC95UE
 0VKJ0J/PNkQ171c7jv1STHsc/7DmSCa2N7PI8oxSjOxKl6PkX00KQvYuz7LJgqJGFpn7xonM
 GrAnl3rHWWTFRB9G9lRlscnidyMcsn5uEiN/q1NZLsaUMkcJqJqVXJR6tTKGUaPxWhaleh5J
 DW1MIFRqfx6g3s71olT1QBSbmp8aRKkkdSGgStUfUWqxwvIS97rhCW/a3zeElto6exqKytvm
 WYEtZmGz6mo0Cqh5CmCAQ0IAc3RWPfOIfADnP51RAEMdLwH4omsaZYJFADuepWPbjsUFOYdJ
 5AGo1MSxdizZ6prNXmzCDipmFGw9mxJyAJsSjfRFCBGPwLTiws1WJsRlGN8fC/SMEgdhSsrP
 TeYSzrA8qQ9lxlnBorI6RM8GOr1VK8f0jSAxyIFPhtIQpug0fPh6hs2wCfyhVXMY3g9bUxNQ
 xhAD4Hh7MYcJEgDsic4ATJUTHG5f07lx3X6HYWmVLSOfgi9nhoFehoQx7J/Zo5cRHT7SpCOM
 zIVxsVuHtIaZ2pKdsfWd3VurUbB2ugxjLpQCYMJoCZIMrDL/D8sFoBCY08EysQ8ts5fQoTYy
 oVgWLPGx8QoQVwDdc7VuaJcqQdX6zQZA4IBvxP12ZdqDhwlDZOHiBgBxhG/KdW1r9eBxvYXh
 d2hpwA1psD8tawD7cJRvznV4+t2dR/gIg2g/mg6kpdtZFm5gEQXonnXRwtTcOeerXyQe7uGP
 LxzYvRoa4TB3zy3S3lLsd79TSXiV1gyJBPIxpWPMsqV4UTqpOOvabBbR7fUn7S7+VbDqMnJN
 ELZwaKnukudF6/p5T5+uZteVW7NVvkfdKgv25kcn396VLFLVkCreyc/2ti2Z4mxVkyCjtvxB
 c/7IeT4qEwntjiBSmfAftXBXYVgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7rvul7HGWy/oGjRe+4kk8XGGetZ
 LS5Ob2Wx+L9tIrPFla/v2SxWrj7KZLFgv7XFnJtGFl+uPGSy2PT4GqvF5V1z2CzWHrnLbnHw
 wxNWi+9bJjM58HmsmbeG0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNHj8IcrLB67
 bzaweXx8eovFo2/LKkaP9Vuusnh83iQXwBulZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqln
 aGwea2VkqqRvZ5OSmpNZllqkb5egl7Hx7EemglNiFe+37GZpYNwi1MXIySEhYCLx+VMrexcj
 F4eQwFJGiTXH57JBJGQkTk5rYIWwhSX+XOtigyj6xChx8MxXsCI2AUOJrrcQCRGBTkaJad0f
 wUYxC0xmlni2+joTSJWwQIDE7devwGwWAVWJiRPfMILYvAJ2Ehv7rrFArJCXWL3hADOIzQkU
 P328FWy1kICtxPMPbWwTGPkWMDKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIykbcd+btnB
 2PUu+BCjAAejEg/vi5DXcUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgK
 dNREZinR5HxglOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamCc
 KDxra4rLva77UmUNcVsEP6gwWTbl3PuU9mLf850yE7/2PTy6SMr/RfvpQ9o2h//t+umRdDja
 XCx4qk1fyAKFG0sOn8qZdTDnv9D1mLNPPySp+Gxdb7n4XNKXU1eW8Rznen3ih1f3Mq6sXWas
 LVNvzeJ3t/7AYFOgG77jUS+rokTIh6PdkRdWKrEUZyQaajEXFScCAHXemBa6AgAA
X-CMS-MailID: 20200618154030eucas1p2f36e6ec52cea051fccedb1970f27bef9
X-Msg-Generator: CA
X-RootMTR: 20200618154030eucas1p2f36e6ec52cea051fccedb1970f27bef9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154030eucas1p2f36e6ec52cea051fccedb1970f27bef9
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154030eucas1p2f36e6ec52cea051fccedb1970f27bef9@eucas1p2.samsung.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Juergen Gross <jgross@suse.com> 
---
 drivers/xen/gntdev-dmabuf.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 75d3bb948bf3..ba6cad871568 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -247,10 +247,9 @@ static void dmabuf_exp_ops_detach(struct dma_buf *dma_buf,
 
 		if (sgt) {
 			if (gntdev_dmabuf_attach->dir != DMA_NONE)
-				dma_unmap_sg_attrs(attach->dev, sgt->sgl,
-						   sgt->nents,
-						   gntdev_dmabuf_attach->dir,
-						   DMA_ATTR_SKIP_CPU_SYNC);
+				dma_unmap_sgtable(attach->dev, sgt,
+						  gntdev_dmabuf_attach->dir,
+						  DMA_ATTR_SKIP_CPU_SYNC);
 			sg_free_table(sgt);
 		}
 
@@ -288,8 +287,8 @@ dmabuf_exp_ops_map_dma_buf(struct dma_buf_attachment *attach,
 	sgt = dmabuf_pages_to_sgt(gntdev_dmabuf->pages,
 				  gntdev_dmabuf->nr_pages);
 	if (!IS_ERR(sgt)) {
-		if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-				      DMA_ATTR_SKIP_CPU_SYNC)) {
+		if (dma_map_sgtable(attach->dev, sgt, dir,
+				    DMA_ATTR_SKIP_CPU_SYNC)) {
 			sg_free_table(sgt);
 			kfree(sgt);
 			sgt = ERR_PTR(-ENOMEM);
@@ -625,7 +624,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	/* Now convert sgt to array of pages and check for page validity. */
 	i = 0;
-	for_each_sg_page(sgt->sgl, &sg_iter, sgt->nents, 0) {
+	for_each_sgtable_page(sgt, &sg_iter, 0) {
 		struct page *page = sg_page_iter_page(&sg_iter);
 		/*
 		 * Check if page is valid: this can happen if we are given
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
