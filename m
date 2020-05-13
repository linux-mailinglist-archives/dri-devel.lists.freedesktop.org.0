Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF01D1504
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C939D6E46B;
	Wed, 13 May 2020 13:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4F56EA28
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:32:59 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133258euoutp0188d91ecdf8a09c648f2744ce772f27d2~OmcI9QGSe2140621406euoutp016
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:32:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133258euoutp0188d91ecdf8a09c648f2744ce772f27d2~OmcI9QGSe2140621406euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376778;
 bh=rEuOT0GkB4NH8z/2RQ3JmrQOctEyWUqngf17Z20yogU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WMvhvwzNLVynKgBTBSLuwINUnXtn5tT+6fQycDVV3dYXnLZKm+/LJTYKwq3zPeH7R
 OIiTu235Nl+A+GMeevjqdxdF9Tz/Eo1Jad5Beqo8LU0vsdSBy+TGUT7jSgDv5cjXYf
 +GSKKXNKGSfvh+qYzKv17yzkL+imZlh6OMRj1cBY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133257eucas1p15b3d637e0f28f52bdec5bc4159d4c17d~OmcIwD4Lv2351423514eucas1p1q;
 Wed, 13 May 2020 13:32:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8D.F0.60679.907FBBE5; Wed, 13
 May 2020 14:32:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133257eucas1p1613a28a71a6c328c406397f7094534d1~OmcIe02ww2350623506eucas1p1r;
 Wed, 13 May 2020 13:32:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133257eusmtrp12c74a145da6bba144d7eaed5acf30040~OmcIckxwT0994509945eusmtrp1Y;
 Wed, 13 May 2020 13:32:57 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-1b-5ebbf7099305
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.0A.08375.907FBBE5; Wed, 13
 May 2020 14:32:57 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133256eusmtip19a0d0eff579afc1683a73c3191405caa~OmcH36lW33222032220eusmtip1y;
 Wed, 13 May 2020 13:32:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/38] scatterlist: add generic wrappers for iterating
 over sgtable objects
Date: Wed, 13 May 2020 15:32:09 +0200
Message-Id: <20200513133245.6408-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87qc33fHGRzZrG/Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGF14PZYM28N
 o8febwtYPLZ/e8Dqcb/7OJPH5iX1Hrf/PWb2mHxjOaPH7psNbB59W1YxenzeJBfAFcVlk5Ka
 k1mWWqRvl8CV0dH1l7Xgj2rFrDUfmRoYL8t1MXJySAiYSLxe1sbaxcjFISSwglHi7L/JbBDO
 F0aJxpWf2SGcz4wSNy/vYYJpWblpElRiOaPE61m7WOBaHj2YyQJSxSZgKNH1tosNxBYRaGWU
 ONHLA2IzC8xgkjj6uhTEFhZIkOib+wWonoODRUBV4swrdZAwr4CNxMdL+9khlslLrN5wgBnE
 5hSwlXh1Zz8LRHwTu8SDvQoQtovE2XU3oI4Tlnh1fAtUr4zE6ck9YLdJCDQzSjw8t5Ydwulh
 lLjcNIMRospa4s65X2wgRzALaEqs36UPEXaUuLnkOthtEgJ8EjfeCkKczycxadt0Zogwr0RH
 mxBEtZrErOPr4NYevHCJGcL2kHj45hw0eA8zSlx79oNxAqP8LIRlCxgZVzGKp5YW56anFhvl
 pZbrFSfmFpfmpesl5+duYgSmntP/jn/ZwbjrT9IhRgEORiUeXotbu+OEWBPLiitzDzFKcDAr
 ifD6rQcK8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwBjt
 t9Nva7zbt/9aZ7KmnupT/ML24tRiv/RHOa1xDFoqvn+Oy3/TW2p1tL1/zcKPgczam0v+ztn/
 4FOt6q2T5sZP1P68T3AIv/r6/bHck3M+5XTuUmR6xfc/bePNghV/T9zpjf9ZICDMuURUvE/k
 81s2bg+/S+F7n96Q38D/3if0P4Nm46F7e6OVWIozEg21mIuKEwGJ9dDgOQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4XV3O77vjDHY9lrboPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgitKzKcov
 LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL6Oj6y1rwR7Vi
 1pqPTA2Ml+W6GDk5JARMJFZumsTexcjFISSwlFHi5tP/zBAJGYmT0xpYIWxhiT/Xutggij4x
 Srx62soIkmATMJToeguREBHoZJSY1v0RbBSzwDwmiUUPD7GDVAkLxEnserUGqIODg0VAVeLM
 K3WQMK+AjcTHS/vZITbIS6zecABsM6eArcSrO/tZQGwhgXyJvYv3sU1g5FvAyLCKUSS1tDg3
 PbfYUK84Mbe4NC9dLzk/dxMjMBq2Hfu5eQfjpY3BhxgFOBiVeHgtbu2OE2JNLCuuzD3EKMHB
 rCTC67ceKMSbklhZlVqUH19UmpNafIjRFOimicxSosn5wEjNK4k3NDU0t7A0NDc2NzazUBLn
 7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAyDo178LD+0yFXZ1Hy9ZG9PvmW133DO9VKmEvYe/9
 MP/bwpZ//w99TvSevlQ0e+fhnfHNPALFChJ/nH0iJHzu7T9a3t08qfCY3/22vlJFk9T+CRPj
 Jokmaz5nu7I2Q2ECD+8H+0BmjZLFIl1R57haXoi9fRcTcurX4+XRMuqxy2qE5NyVgiuUWIoz
 Eg21mIuKEwGN63+5nAIAAA==
X-CMS-MailID: 20200513133257eucas1p1613a28a71a6c328c406397f7094534d1
X-Msg-Generator: CA
X-RootMTR: 20200513133257eucas1p1613a28a71a6c328c406397f7094534d1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133257eucas1p1613a28a71a6c328c406397f7094534d1
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133257eucas1p1613a28a71a6c328c406397f7094534d1@eucas1p1.samsung.com>
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

struct sg_table is a common structure used for describing a memory
buffer. It consists of a scatterlist with memory pages and DMA addresses
(sgl entry), as well as the number of scatterlist entries: CPU pages
(orig_nents entry) and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling the scatterlist iterating functions with a wrong number
of the entries.

To avoid such issues, lets introduce a common wrappers operating directly
on the struct sg_table objects, which take care of the proper use of
the nents and orig_nents entries.

While touching this, lets clarify some ambiguities in the comments for
the existing for_each helpers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com> 
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 include/linux/scatterlist.h | 50 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6eec50f..4f922af 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -151,6 +151,20 @@ static inline void sg_set_buf(struct scatterlist *sg, const void *buf,
 #define for_each_sg(sglist, sg, nr, __i)	\
 	for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
 
+/*
+ * Loop over each sg element in the given sg_table object.
+ */
+#define for_each_sgtable_sg(sgt, sg, i)		\
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i)
+
+/*
+ * Loop over each sg element in the given *DMA mapped* sg_table object.
+ * Please use sg_dma_address(sg) and sg_dma_len(sg) to extract DMA addresses
+ * of the each element.
+ */
+#define for_each_sgtable_dma_sg(sgt, sg, i)	\
+	for_each_sg(sgt->sgl, sg, sgt->nents, i)
+
 /**
  * sg_chain - Chain two sglists together
  * @prv:	First scatterlist
@@ -401,9 +415,10 @@ static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
  * @sglist:	sglist to iterate over
  * @piter:	page iterator to hold current page, sg, sg_pgoffset
  * @nents:	maximum number of sg entries to iterate over
- * @pgoffset:	starting page offset
+ * @pgoffset:	starting page offset (in pages)
  *
  * Callers may use sg_page_iter_page() to get each page pointer.
+ * In each loop it operates on PAGE_SIZE unit.
  */
 #define for_each_sg_page(sglist, piter, nents, pgoffset)		   \
 	for (__sg_page_iter_start((piter), (sglist), (nents), (pgoffset)); \
@@ -412,18 +427,47 @@ static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
 /**
  * for_each_sg_dma_page - iterate over the pages of the given sg list
  * @sglist:	sglist to iterate over
- * @dma_iter:	page iterator to hold current page
+ * @dma_iter:	DMA page iterator to hold current page
  * @dma_nents:	maximum number of sg entries to iterate over, this is the value
  *              returned from dma_map_sg
- * @pgoffset:	starting page offset
+ * @pgoffset:	starting page offset (in pages)
  *
  * Callers may use sg_page_iter_dma_address() to get each page's DMA address.
+ * In each loop it operates on PAGE_SIZE unit.
  */
 #define for_each_sg_dma_page(sglist, dma_iter, dma_nents, pgoffset)            \
 	for (__sg_page_iter_start(&(dma_iter)->base, sglist, dma_nents,        \
 				  pgoffset);                                   \
 	     __sg_page_iter_dma_next(dma_iter);)
 
+/**
+ * for_each_sgtable_page - iterate over all pages in the sg_table object
+ * @sgt:	sg_table object to iterate over
+ * @piter:	page iterator to hold current page
+ * @pgoffset:	starting page offset (in pages)
+ *
+ * Iterates over the all memory pages in the buffer described by
+ * a scatterlist stored in the given sg_table object.
+ * See also for_each_sg_page(). In each loop it operates on PAGE_SIZE unit.
+ */
+#define for_each_sgtable_page(sgt, piter, pgoffset)	\
+	for_each_sg_page(sgt->sgl, piter, sgt->orig_nents, pgoffset)
+
+/**
+ * for_each_sgtable_dma_page - iterate over the DMA mapped sg_table object
+ * @sgt:	sg_table object to iterate over
+ * @dma_iter:	DMA page iterator to hold current page
+ * @pgoffset:	starting page offset (in pages)
+ *
+ * Iterates over the all DMA mapped pages in the buffer described by
+ * a scatterlist stored in the given sg_table object.
+ * See also for_each_sg_dma_page(). In each loop it operates on PAGE_SIZE
+ * unit.
+ */
+#define for_each_sgtable_dma_page(sgt, dma_iter, pgoffset)	\
+	for_each_sg_dma_page(sgt->sgl, dma_iter, sgt->nents, pgoffset)
+
+
 /*
  * Mapping sg iterator
  *
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
