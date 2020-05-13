Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F821D1507
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B4F6E175;
	Wed, 13 May 2020 13:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CF76EA2D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133258euoutp02e7358a1cad440e29a149320b3f0cbc31~OmcJ03sed3219432194euoutp02f
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:32:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133258euoutp02e7358a1cad440e29a149320b3f0cbc31~OmcJ03sed3219432194euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376779;
 bh=go833WUtGUeqjr8CAsYYWkYRfn1VEMrgJZsdzy8T3MA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tw8DR1CxzmmioRVEjwMGsmPWEczJRDYl/V2JEis9/oEpnSu49riaq4pZ6yxVGCLxr
 Fn3T6J/oeWJrr29Z9Tt7t0xXggiiJO3YmSfCxaYG6CacJhTFLDW96HINEqOcfjSOQY
 cXPjHFesq3BOSrb0iYZ+xg5h/SpDG3rTcSE6uLZI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133258eucas1p17e5a2056843358c9468b6e2009d7d017~OmcJWZvTN2633226332eucas1p1S;
 Wed, 13 May 2020 13:32:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2F.B5.61286.A07FBBE5; Wed, 13
 May 2020 14:32:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133258eucas1p2e8ffb90e5553c12419a5af5261b48f5e~OmcJDlZlr2029120291eucas1p2K;
 Wed, 13 May 2020 13:32:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133258eusmtrp121b121d239c04a654273b78d6838b65e~OmcJCQ68X0994509945eusmtrp1b;
 Wed, 13 May 2020 13:32:58 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-2c-5ebbf70a69aa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.0A.08375.A07FBBE5; Wed, 13
 May 2020 14:32:58 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133257eusmtip155e8eb76c7cbe871b510eca19afc02e9~OmcIcHLlI2465024650eusmtip1-;
 Wed, 13 May 2020 13:32:57 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/38] iommu: add generic helper for mapping sgtable objects
Date: Wed, 13 May 2020 15:32:10 +0200
Message-Id: <20200513133245.6408-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+XZ2OS5np2n5YpI1MtPISwYd8kKByPnDQiO6kdbKg0re2JyX
 IvKCVvNCukSbJkNy3u+yxJWbszI1RNRE0zJvVIYoXjFM2zxq//2+530envf7+HBMWMexwcMi
 Y2hJpDhcxOWzNR/Wek7yV7VBrvIkIDN7OllkfX4th9zUZGPkwPIclyyvfM8iVToP8mlBHY9c
 GhhnkQ2Tgxyyv6WQS1a/+8oj2+anOOfMqam2IhZVVVSFqLcrKjb1euU7hxpL72BRja8eUSMb
 kxilGCpFlHY4kUtlNVUgarHhkP+eG3zPYDo8LJaWuHjf5ofKU7tRdJIwvvNlFysRZe2VIzMc
 iNMwXZKJmVhIlCHInbgsR3wjLyFILZ/iMYNFBBlKt51Aq26Ix5hKEWheqNFuok2djkwuLuEG
 8lk518RWRCqCj5nmJsaIFhYoU8QmtiQCoGRkcMvPJuxhorJ+q01AeMLzxGwu02YHlXX6rfXM
 CC+YGdWxTWVAGHiQUzyNGJMP1KinMIYtYaajicewLXQrMrYDKQjGe6p5zCEDQX9y/nbaA0Z7
 /hjrcON6jlDb4sLI52FQ85htkoGwgKHZfcwFLCBHk4cxsgCepAkZ9zFQdtTs1rb19m2vQ0GZ
 ooHDPFA7gmFFI/cZslP+L1MhVIGsaZk0IoSWukXScc5ScYRUFhnifDcqogEZ/1H3RsdCM1ru
 u2NABI5E5gLyizZIyBHHShMiDAhwTGQluFhrlATB4oT7tCTqlkQWTksN6CDOFlkL3It/BQqJ
 EHEMfY+mo2nJzpSFm9kkoqPDY2HtTrahtmbXL/hf6Z39YW8+rc8OcFC4H35T+jnwgDZe7Yj7
 n1F66yU+quObAvX66kWe70rzULJvWquH66l1699HWisDO6/q/XIe2O1HMd8w3azfJ4trf2Vr
 jgv8ed9C3aXOLtubc5LcOM8CPd9Fe0L108HF8PBsvKFA7pUnYktDxW5OmEQq/gd4pfHwQwMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7pc33fHGey/z2rRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t0Tl7A7vFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNWB
 x+PJwXlMHmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DK6Wk8zFjQKVZyce4qpgbGPv4uRk0NCwERi3/4b7F2MXBxCAksZJZrWdTFCJGQkTk5rYIWw
 hSX+XOtigyj6xCixbfd0JpAEm4ChRNdbiISIQCejxLTuj2CjmAUOMEm8atsONIqDQ1jAX+L5
 TleQBhYBVYlHqzeyg9i8AjYSUxomskFskJdYveEAM4jNKWAr8erOfhYQW0ggX2Lv4n1sExj5
 FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMkG3Hfm7ewXhpY/AhRgEORiUeXotbu+OE
 WBPLiitzDzFKcDArifD6rQcK8aYkVlalFuXHF5XmpBYfYjQFOmois5Rocj4wevNK4g1NDc0t
 LA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTCKvL/34oqn4lyT63EZR1R+bf+6
 eJ7wdVFVC8nnfe5Hn60y1vcwYK2bz/lgyaQVqnM7j1/48lj5eFL7sgUFQbsEv3NY+DULz7Bx
 iWja5rsz+kb4tqoFzNI3YjT/VH6dpnRv56Jtn6Njvy55ItZbapFieUr85JYDBowvNWpZp7Q9
 YUisfqcd5v9ViaU4I9FQi7moOBEAy3gjmqYCAAA=
X-CMS-MailID: 20200513133258eucas1p2e8ffb90e5553c12419a5af5261b48f5e
X-Msg-Generator: CA
X-RootMTR: 20200513133258eucas1p2e8ffb90e5553c12419a5af5261b48f5e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133258eucas1p2e8ffb90e5553c12419a5af5261b48f5e
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133258eucas1p2e8ffb90e5553c12419a5af5261b48f5e@eucas1p2.samsung.com>
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com> 
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 include/linux/iommu.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7cfd2dd..5bed18a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -478,6 +478,22 @@ extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
 
+/**
+ * iommu_map_sgtable - Map the given buffer to the IOMMU domain
+ * @domain:	The IOMMU domain to perform the mapping
+ * @iova:	The start address to map the buffer
+ * @sgt:	The sg_table object describing the buffer
+ * @prot:	IOMMU protection bits
+ *
+ * Creates a mapping at @iova for the buffer described by a scatterlist
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
