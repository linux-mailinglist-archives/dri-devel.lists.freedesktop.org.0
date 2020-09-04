Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EBF25D9C6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3B46E2B6;
	Fri,  4 Sep 2020 13:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7B36E2A0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133454euoutp017f1d61e2482f94f823cfacb1b636d288~xmAYbbzIU0639206392euoutp01w
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133454euoutp017f1d61e2482f94f823cfacb1b636d288~xmAYbbzIU0639206392euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226494;
 bh=DWq6LmZ0ATgtYmKUPxgWsvuOg8eDX7IcdgSJLFqpVMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ix0N6t2msNQg/KrboEEWeSvN2FMjGx7BOQlnJJtwjhrQ2C+jxI7bG7Ni74fj+Mjzc
 YTOgmURnsTciCW6V8Mg3HjDY+Bo7eIVa9F5kR4X6YTtR9CmOH9DVWO5NhLK7bOW/Hs
 P/V5zDryNMRZq7nPBgjkskoqnHaPFN1Msp5QIsTI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133454eucas1p1b6537e563b069b7e52f9053b287f6c78~xmAYNhaAt1679216792eucas1p1Z;
 Fri,  4 Sep 2020 13:34:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 66.01.06456.E72425F5; Fri,  4
 Sep 2020 14:34:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133453eucas1p2266abd01467aea6af137eba9fa6af9c1~xmAXvLUsY0781307813eucas1p2o;
 Fri,  4 Sep 2020 13:34:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133453eusmtrp2366004d0f5092987f509efd37f5116bb~xmAXugCB90905809058eusmtrp2R;
 Fri,  4 Sep 2020 13:34:53 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-26-5f52427e049a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.90.06017.D72425F5; Fri,  4
 Sep 2020 14:34:53 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133453eusmtip16524db2d11f15eb60f77980c48d36a1f~xmAXHqyT91944019440eusmtip1f;
 Fri,  4 Sep 2020 13:34:53 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 01/30] drm: prime: add common helper to check
 scatterlist contiguity
Date: Fri,  4 Sep 2020 15:16:42 +0200
Message-Id: <20200904131711.12950-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSfSyUcRzvd8/z3D1uTk/H5heW7VY2bcjKeiSKaT1/9EeZPxqiK88w7tid
 k7fyViev0cscs3Oa8p4czksqjI7MS5g0lUR/MFbusB2N7jxH/32+n5fv57vffjjCH8Ds8Chx
 PC0RC2MEbC6q+WAYdbnnFxB2qmeQIAtGh1hks6IJI3c1xQg5tfGbTdbWD7BI1Xsvcn1qnkWq
 F6YxcrKrnE029n/jkJVrbSgpz3mJkb1/FjGydaUYu2hFNSgbAPV2U4VS6rocNtW++QOjlEPX
 qLk8LYtqqUqjZncWEOrJTDWg3nxJZ1OFrXWAahlOofTqY1d5Qdzz4XRMVAItcfO5yY3sN2jR
 uHKHRJ3uESsdVNjmAgscEmdg1kAekgu4OJ+oAXCoKhswwzqAhpUas6IHsKOxlLMfebrajDJC
 NYA7GVr0IKJf2kVMLjbhDnNXc9kmbEM8AHCwwNJkQggVAg16OTAJ1kQQ/KzuQk0YJU7A4rbp
 vQCP8IbqhVWMqXOE9a979pZaED6wTbGImRZBYpoD9ZNz5pv84bv7Y4DB1nBZ22rmHeBuZwWL
 CWQBOD/ayGGGfAAnMxXmhBf8OrplrMaN9znDpi43hvaFf9fa92hIWMGZ1SMmGjHCx5oShKF5
 8KGcz7idYJn21UFt7/gEwmAK9s5OmR+1GMBSVQkoAo5l/8tUANQBW1omFUXQUncxfcdVKhRJ
 ZeII19uxIjUwfq7hHa2uA2xM3OoDBA4ElrxDFwLC+JgwQZok6gMQRwQ2PL+R4VA+L1yYlExL
 YsMkshha2gfscVRgyzv9fOkGn4gQxtPRNB1HS/ZVFm5hlw6I7ECF0hnJ8N4Mqdj1UHLLjubL
 169wLynzNbXY2U8a2TlOzrKurdNeFK31q3zxU5GRKujeThlI2v4oCb68PC6yGw+numNGvosT
 0xzii6zSrmOuzwJ9fH9xyns9kj0lLu0nCkNlsce7DqeGDIq3ujGep3eZf/Ddscxg920nfqwA
 lUYK3U8iEqnwH7S5qJ9YAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7q1TkHxBjf2mFr0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xcKPW1ks2jqXsVoc
 /PCE1WLLm4msDnwea+atYfTY+20Bi8emVZ1sHtu/PWD1mHcy0ON+93Emj81L6j1u/3vM7DH5
 xnJGj903G9g8+rasYvTYfLra4/MmuQDeKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj
 81grI1MlfTublNSczLLUIn27BL2MIz+PsxTMkan49KmfqYFxvngXIyeHhICJxJS3G1m6GLk4
 hASWMkp0TO5ihUjISJyc1gBlC0v8udbFBlH0iVFiwrQljCAJNgFDia63EAkRgU5GiWndH9lB
 HGaBFcwSr/bNZQGpEhaIkNjUfx5sFIuAqsTErdfYQGxeAVuJTY/fQq2Ql1i94QAziM0pYCex
 dcYTsLgQUM2HOYtZJjDyLWBkWMUoklpanJueW2ykV5yYW1yal66XnJ+7iREYR9uO/dyyg7Hr
 XfAhRgEORiUeXgb7oHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BTpq
 IrOUaHI+MMbzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwbr2R
 +9vtUkjG95v7rA4Inr97csLkipf1bAVVu30edHMpGK9urv53iOPuuSqzJO7Zl7guL3Soe+mZ
 tuGB/60vedGWp03lHnRZzc42sXDuub7QZvJFK9X+k2f+zDG9Nffclhi2jZzXDk2qua3+hD/8
 CIvdjetWDsleSXd/G9ysEtLdN8fZ8sqpa0osxRmJhlrMRcWJAEfVXn65AgAA
X-CMS-MailID: 20200904133453eucas1p2266abd01467aea6af137eba9fa6af9c1
X-Msg-Generator: CA
X-RootMTR: 20200904133453eucas1p2266abd01467aea6af137eba9fa6af9c1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133453eucas1p2266abd01467aea6af137eba9fa6af9c1
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133453eucas1p2266abd01467aea6af137eba9fa6af9c1@eucas1p2.samsung.com>
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
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 23 +++------------------
 drivers/gpu/drm/drm_prime.c          | 31 ++++++++++++++++++++++++++++
 include/drm/drm_prime.h              |  2 ++
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 822edeadbab3..59b9ca207b42 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -471,26 +471,9 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
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
index 1693aa7c14b5..4ed5ed1f078c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -825,6 +825,37 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
 }
 EXPORT_SYMBOL(drm_prime_pages_to_sg);
 
+/**
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
+	struct scatterlist *sg;
+	unsigned long size = 0;
+	int i;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		unsigned int len = sg_dma_len(sg);
+
+		if (!len)
+			break;
+		if (sg_dma_address(sg) != expected)
+			break;
+		expected += len;
+		size += len;
+	}
+	return size;
+}
+EXPORT_SYMBOL(drm_prime_get_contiguous_size);
+
 /**
  * drm_gem_prime_export - helper library implementation of the export callback
  * @obj: GEM object to export
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 9af7422b44cf..47ef11614627 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -92,6 +92,8 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags);
 
+unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
+
 /* helper functions for importing */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 						struct dma_buf *dma_buf,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
