Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5531D1511
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F55E6EA2E;
	Wed, 13 May 2020 13:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03996EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133259euoutp01960dee88749ae2b0ffb5f7db3233530d~OmcKdL8ih2146121461euoutp011
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:32:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133259euoutp01960dee88749ae2b0ffb5f7db3233530d~OmcKdL8ih2146121461euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376779;
 bh=jaNdX2aJTFsRpUX29VfIto14HjpaD6l+ox1EVZ7cX2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gh5UyUJZdbT4fmfJAizmyXQ5nWBC0xbfm8weh+K1+lZ3T+LfPOCgtIyTnFO8OrYxU
 IUsaurRXnxf+m7xGi7iFZxsogkRhJVOYhFFCeFyMoHVBND73L2TkP5mhioADk3OcY/
 4po8ry5w7cADjw6lsnn9oiIvVNMhyTQPEAs5S8ZE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133259eucas1p2818fb6d2768faf81ec6dbb912e61afaf~OmcKGU44v1009510095eucas1p27;
 Wed, 13 May 2020 13:32:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B2.C5.61286.B07FBBE5; Wed, 13
 May 2020 14:32:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133258eucas1p1eba6e0ced0c749655f028206d5f84b7a~OmcJxzEQx0874908749eucas1p1W;
 Wed, 13 May 2020 13:32:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133258eusmtrp1fd7bd53644225fb7e2283a8cb47db7b5~OmcJweEPK0994509945eusmtrp1c;
 Wed, 13 May 2020 13:32:58 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-2f-5ebbf70b24b7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DC.27.07950.A07FBBE5; Wed, 13
 May 2020 14:32:58 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133258eusmtip172311bd51bf138cd3fe3bd47bfeadb30~OmcJC-20L2932629326eusmtip1b;
 Wed, 13 May 2020 13:32:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/38] drm: prime: add common helper to check scatterlist
 contiguity
Date: Wed, 13 May 2020 15:32:11 +0200
Message-Id: <20200513133245.6408-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeyyVcRjud77L+Y4c+zosv0mx02ppi0Tr2+iitfZZ1uS/2siHb1jOYecg
 8gdLGccllykz6VDL7XByHNSRO52wUciQlHSZ2yi3Ueh8PtV/z/s8z/s+7969BCJpx2yIUHkk
 q5AzYVLcDK17tdZ7bPdqg9/x6jQLKr23S0BV52kxaqsuC6EGl+dxqqyiU0Cpm92opcEJAaWb
 HMKoAUMBTlV2fBBSRT9qUSop5SlGtS58wSj9bBZ2zoLWFGoA3biiRmldeQpO1698wujCriv0
 x1SjgK55Ek+/35xE6JzhEkA3jCTgdIa+HNA1PXH0ou6At/iamXsQGxYazSqczvibhXQPlKAR
 DbYx37+WChOA0VoFCAKSrjBjWqQCZoSELAVwrNOAqIDIVCwBuJxpwQuLABpatEJO4BryOyaF
 vFACYGfPOMIXpo7fQ/dRzoWTzlA1p8I5bEXeBfB1ujlnQkg1AtcWkwAnWJJX4UJZ/fZYlDwE
 XxZqMQ6LSXeYOlMg4OPsYMWzlu2dRORpOD3WjHKDIDkqhDMjWRhvugB1s1k7+1nCaaN+B9vC
 npy0nYZEACd6K4V8kQbgwO08wLvc4FjvOs6dAyEdoNbgxNMecO5dE+CvZAGH5/ZwNGKC2XUP
 EJ4Ww+QkCe8+DPONVf9iW9/0IzymYWJ7FcpfqB3At8WleCawy/8fpgagHFizUUpZMKt0lrM3
 HZWMTBklD3YMDJfpgOm1ejaNP5+D5f6ANkASQGoupkYb/CQYE62MlbUBSCBSK/FlrYkSBzGx
 t1hF+HVFVBirbAP7CFRqLXYpnvKVkMFMJHuDZSNYxV9VQIhsEoBP4v4WKoVxGNqKqW1M/9U1
 dqKq/fJD3yh7RrCXPFlsn9unDqgv8xevnu/zSne5py+a8z67Udnm4TPlsL45/Pig3sv9YrCl
 uavNPDaV46mraop9FB53qj52OPXzzK7M5BeSom8akYtGrjni6WI9fqkyuTs+N9Bgt7iRfWeo
 TuacIEWVIYzzUUShZP4AF1lGHVYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7pc33fHGZzZaGTRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
 zWOtjEyV9O1sUlJzMstSi/TtEvQyTl1ezlKwW6bi+dMV7A2Mx8W7GDk5JARMJGYdeczexcjF
 ISSwlFFiyvn97BAJGYmT0xpYIWxhiT/Xutggij4xStyYuIwJJMEmYCjR9RYiISLQySgxrfsj
 2ChmgRXMEq/2zWUBqRIWCJf4v2UJM4jNIqAqsWfeerCxvAI2Et2v5zBBrJCXWL3hAFgNp4Ct
 xKs7+8F6hQTyJfYu3sc2gZFvASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMA42nbs55Yd
 jF3vgg8xCnAwKvHwWtzaHSfEmlhWXJl7iFGCg1lJhNdvPVCINyWxsiq1KD++qDQntfgQoynQ
 UROZpUST84ExnlcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgXGN
 jcHkaUdvfBT6Ejxv997jWb+WnH7DNeVkrXS6e88f70keBtMN1574aCzOfa9PmH27teX9paeL
 lUQikrZusdBheOX4/EY1k6iWzSz9Gne1F9V2e344KV5bszHh27k32zkNlHYkm0Q6pJ9J8sw6
 47TWp/V72KkpP5r0nL2VPSNaxWd7q8tyPFdiKc5INNRiLipOBAALtjL0uQIAAA==
X-CMS-MailID: 20200513133258eucas1p1eba6e0ced0c749655f028206d5f84b7a
X-Msg-Generator: CA
X-RootMTR: 20200513133258eucas1p1eba6e0ced0c749655f028206d5f84b7a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133258eucas1p1eba6e0ced0c749655f028206d5f84b7a
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133258eucas1p1eba6e0ced0c749655f028206d5f84b7a@eucas1p1.samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is a common operation done by DRM drivers to check the contiguity
of the DMA-mapped buffer described by a scatterlist in the
sg_table object. Let's add a common helper for this operation.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 23 +++--------------------
 drivers/gpu/drm/drm_prime.c          | 26 ++++++++++++++++++++++++++
 include/drm/drm_prime.h              |  2 ++
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 12e98fb..9f2d13e 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -471,26 +471,9 @@ struct drm_gem_object *
 {
 	struct drm_gem_cma_object *cma_obj;
 
-	if (sgt->nents != 1) {
-		/* check if the entries in the sg_table are contiguous */
-		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
-		struct scatterlist *s;
-		unsigned int i;
-
-		for_each_sg(sgt->sgl, s, sgt->nents, i) {
-			/*
-			 * sg_dma_address(s) is only valid for entries
-			 * that have sg_dma_len(s) != 0
-			 */
-			if (!sg_dma_len(s))
-				continue;
-
-			if (sg_dma_address(s) != next_addr)
-				return ERR_PTR(-EINVAL);
-
-			next_addr = sg_dma_address(s) + sg_dma_len(s);
-		}
-	}
+	/* check if the entries in the sg_table are contiguous */
+	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size)
+		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
 	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 282774e..1d2e5fe 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -826,6 +826,32 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
 EXPORT_SYMBOL(drm_prime_pages_to_sg);
 
 /**
+ * drm_prime_get_contiguous_size - returns the contiguous size of the buffer
+ * @sgt: sg_table describing the buffer to check
+ *
+ * This helper calculates the contiguous size in the DMA address space
+ * of the the buffer described by the provided sg_table.
+ *
+ * This is useful for implementing
+ * &drm_gem_object_funcs.gem_prime_import_sg_table.
+ */
+unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
+{
+	dma_addr_t expected = sg_dma_address(sgt->sgl);
+	struct sg_dma_page_iter dma_iter;
+	unsigned long size = 0;
+
+	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
+		if (sg_page_iter_dma_address(&dma_iter) != expected)
+			break;
+		expected += PAGE_SIZE;
+		size += PAGE_SIZE;
+	}
+	return size;
+}
+EXPORT_SYMBOL(drm_prime_get_contiguous_size);
+
+/**
  * drm_gem_prime_export - helper library implementation of the export callback
  * @obj: GEM object to export
  * @flags: flags like DRM_CLOEXEC and DRM_RDWR
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 9af7422..47ef116 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -92,6 +92,8 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags);
 
+unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
+
 /* helper functions for importing */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 						struct dma_buf *dma_buf,
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
