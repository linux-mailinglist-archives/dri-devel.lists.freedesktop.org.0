Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E00B1CF03D
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9B56E8C0;
	Tue, 12 May 2020 09:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78086E8C4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090109euoutp010f55d88af7f031ae5bfba05d4a069d74~OPFiJYTFJ2628826288euoutp01C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090109euoutp010f55d88af7f031ae5bfba05d4a069d74~OPFiJYTFJ2628826288euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274069;
 bh=fKg/ncBxyiGPyUH3RJ1E4yz1JKJ/1T9KydymP0TT+PM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aZ5u6tZY6qkkvh3F/fmYIZIpYiH6qmq91o3gjAM729D0pln8IHo0gNV8dEuCALM/x
 +EP8LKlucIJ7/I+wODtHiPua0rXZHy/Qn9EGa5Xh8kqtweL4FeqTgA+QobmRAgNQoP
 FnKXnI1rm497u7v1DcRsnjYGtj8kmGkmprKxRISM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090109eucas1p2cb1cd23f05a0d9aa74a60a822a33246f~OPFh5vM1V2649026490eucas1p2O;
 Tue, 12 May 2020 09:01:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C5.57.61286.5D56ABE5; Tue, 12
 May 2020 10:01:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090108eucas1p2168167ab5e1de09df0d5def83f64dbfe~OPFhj_QxY0961809618eucas1p2g;
 Tue, 12 May 2020 09:01:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200512090108eusmtrp13342f109c85886acdaebe16bad3a603c~OPFhjSowN0183401834eusmtrp1O;
 Tue, 12 May 2020 09:01:08 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-4a-5eba65d5257d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.E2.07950.4D56ABE5; Tue, 12
 May 2020 10:01:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090108eusmtip13134325216fc7001a96c17dd7ae2781d~OPFhDc6Oi1352513525eusmtip1B;
 Tue, 12 May 2020 09:01:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/38] iommu: add generic helper for mapping sgtable objects
Date: Tue, 12 May 2020 11:00:23 +0200
Message-Id: <20200512090058.14910-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSayyVcRzu/97O63JOr8PmPxntLLUu7n14m0JbH94vjT50WRa95XXruJ0X
 pXWRuxMmah1qWCXCQXKIRi7pMEsNya25tmJDctiKkdcrfXue5/f8/s+z3/4kKq/ArcjgsChO
 FcYqFYQxVvv+90f7z1yDr5PmgQmd0d2J0C81lTi9XnsPpfuW5gn6RVk7Qhe+daPTHlVJaEPf
 OEJXT/bjdG/DY4LWvvsqoVt+TuGepsxUSz7ClOeXA6ZxuRBj6pbHcGb0rh5hXj27zQyvTaJM
 zkAxYN4MxhFMZk0pYBarbbxNzhsf9eeUwTGcytH9onHQamIaGvGDujarMeBxIEWmBiQJqcNQ
 3+aiBsaknCoB0KD9hojEAKBWd58QySKAE0WDqBoYbW5U6kYkApZTxQBqOsH2xlJCBSYMCMoZ
 qmfVhIAtqCQAOzJMBYxSDQjMS2AFbE6dggUrC5uPYpQdHGhawoRKUuoYXMv3FLNsYVlV86bF
 iHKHowWrmKg3SWB8h1TEJ6CmK2mrmzmc0ddIRGwNu3LSMaEbpBIAHO/WSkSSDmBvvAaILjc4
 0v2HEIJRaj+sbHAU5eNwPT6ZEE8kgwOzZmJ9GcyufYiKshSmJstF916Yp6/Yjm351LNVh4HZ
 E/24eJ52AMsnc7EsYJv3P6wQgFJgyUXzoYEc7xzGXXXg2VA+OizQ4XJ4aDXY+EVda/pfr8FS
 z6VWQJFAYSpNdan3leNsDB8b2gogiSospInBG5LUn429zqnC/VTRSo5vBbtITGEpdX0yfUFO
 BbJR3BWOi+BU/6YIaWQVB6rNrReO5Nrsbq+f9X6aFuJt6XcIywxIqcyxymWzznidxp1sYrI8
 4odGDo6d6ym6iWrTR8cdp2cKdOFzeNKQmT18HjnlsXPGY8QrTa+Unaxbn7O7Me9Ajre5+sj2
 lcgbfeyUzMrZ9ODIkFt7AnYUDhd/iVDqUgrufCjy+t6Mtk4rMD6IdT6Aqnj2LwODTK1BAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7pXUnfFGZxYZ2jRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t0Tl7A7vFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNWB
 x+PJwXlMHmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DL+tHQyF7wQqHg74wtrA2M7XxcjJ4eEgInE+q132LsYuTiEBJYySixu2cEIkZCRODmtgRXC
 Fpb4c62LDaLoE6PE3vO72EESbAKGEl1vIRIiAp2MEtO6P4KNYhY4wCTxqm072ChhAX+J+0+3
 gHWwCKhK3Nj3laWLkYODV8BW4t88B4gN8hKrNxxgBrE5Bewk7s//wwJiCwkUSjy6+pZlAiPf
 AkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIERsu3Yzy1Al78LPsQowMGoxMPbYbQzTog1
 say4MvcQowQHs5IIb0smUIg3JbGyKrUoP76oNCe1+BCjKdBNE5mlRJPzgdGbVxJvaGpobmFp
 aG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBsW5xX/OM8xHh2QH1i++vNLw7e3Xn
 KXHlovpHjaIBX/XrT09aUVSUqjDRbO2GxZVrm1uX6nl/f5ahsKhY+rbJy69hJlPOZsUGGhjo
 n1hhLyl5eN7tuwluxyw+Tv9iu6Z08cPXkQrKBd8uuKT//MxhsPHbv5SHNeZpgTs4a18yTOcz
 TsyqZFf+rsRSnJFoqMVcVJwIAOkrfu+mAgAA
X-CMS-MailID: 20200512090108eucas1p2168167ab5e1de09df0d5def83f64dbfe
X-Msg-Generator: CA
X-RootMTR: 20200512090108eucas1p2168167ab5e1de09df0d5def83f64dbfe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090108eucas1p2168167ab5e1de09df0d5def83f64dbfe
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090108eucas1p2168167ab5e1de09df0d5def83f64dbfe@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
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
entries, calling mapping functions with a wrong number of entries.

To avoid such issues, lets introduce a common wrapper operating directly
on the struct sg_table objects, which take care of the proper use of
the nents and orig_nents entries.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 include/linux/iommu.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7cfd2dd..ba662ba 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -478,6 +478,22 @@ extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
 
+/**
+ * iommu_map_sgtable - Map the given buffer to the IOMMU domain
+ * @domain:	The IOMMU domain to perfor
+ * @iova:	The start addrees to map the buffer
+ * @sgt:	The sg_table object describing the buffer
+ * @prot:	IOMMU protection bits
+ *
+ * Create a mapping at @iova for the buffer described by a scatterlist
+ * stored in the given sg_table object in the provided IOMMU domain.
+ */
+static inline size_t iommu_map_sgtable(struct iommu_domain *domain,
+			unsigned long iova, struct sg_table *sgt, int prot)
+{
+	return iommu_map_sg(domain, iova, sgt->sgl, sgt->orig_nents, prot);
+}
+
 extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
 extern void generic_iommu_put_resv_regions(struct device *dev,
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
