Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E968F25272C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAF66EA13;
	Wed, 26 Aug 2020 06:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C116EA12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063536euoutp029a741bad7ffa1b409e0c0bb2359722ec~uvet4wgzF1512715127euoutp02O
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063536euoutp029a741bad7ffa1b409e0c0bb2359722ec~uvet4wgzF1512715127euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423736;
 bh=O2c3Dg/Bmu5P4+TijqQ9XUF6ALcxyDRv7MgKZ032jSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/qwuC7c5fQA1QTZr3aESyteFU/hNQZBCP7URZGrgXy5K7WXQNbBAPUIrUyikfbT4
 IKJUFsI/NPjKPmCrmGkdKrRvGZyaJ1Sd3ApvXaAhie5e961jjz8SG18irc7ADPbw+4
 fv1Kxyi6bmNB/deEej+lGlI9UMoLbpXEVvZWJSOU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063536eucas1p2741f59a0cf7cf468363f1150636ccd2f~uvetjyZrL0402704027eucas1p2m;
 Wed, 26 Aug 2020 06:35:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D0.5D.06318.8B2064F5; Wed, 26
 Aug 2020 07:35:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2~uvetOUzT_0399203992eucas1p2Y;
 Wed, 26 Aug 2020 06:35:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063536eusmtrp162a36d6d92e08db6ac5cbf5729940a4d~uvetNua1W1091110911eusmtrp1X;
 Wed, 26 Aug 2020 06:35:36 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-df-5f4602b8400d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 23.D0.06314.8B2064F5; Wed, 26
 Aug 2020 07:35:36 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063535eusmtip2fbf9685e6d4915ac09421e3641e645a1~uvestpX-S0474104741eusmtip2U;
 Wed, 26 Aug 2020 06:35:35 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 14/32] drm: omapdrm: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:32:58 +0200
Message-Id: <20200826063316.23486-15-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+87Zzs7MyWka+9TIWhjYRfOCnDCkO4cIi+yfhNKVx0ttKpta
 KqEmRsx5VxIx02l5T10yh+JtaMuG5i1Rs1K0zGgZTo3StM0z7b/f+7zP874vHx+O8lVsBzw8
 IpqWRojEQsyKpX71++1RDXI+8Fhepj2Z3t+LkI0F9WxyQ52NkiPLCxhZVdODkCUdPuTSyDRC
 qmZG2eRwSxFG1nV/4JBdP2fZZP3TCeykNVVbXAuotpUSFtW8MsWmPqXpEOpleSL1fn0GpXLH
 KgDVOp6EURlN1YDSjTUjlFG19/LOAKsTwbQ4PJaWuvkGWYXVfEnhRBlt72UX3E8CSkIOuDgk
 vOCcZpotB1Y4n6gEMEnZizDFEoD5aoWlMAI4oFllbUU2GmpQplEB4GJpJ9iOTBiebbowwh3K
 DXLMzHZEKoCv063NJpTQIrAp9d2myZbwh8kLSo6ZWYQzXCh6zjYzj/CFxvx1wKxzgjUNnaiZ
 uSZdl5aJmQdBooUDZzY+W0xnYcPHIgvbwm+6Jg7De6A+V8FiAikATvfXcZhCAeDwgwJLwgdO
 9v8xjcVN97nA+hY3Rj4FlbpSjlmGhA0cM+wyy6gJc9SPUUbmwUcP+Yz7ICzUvdhe2zUwhDJM
 QXn6G8sLZQP4NWsIzQJOhf+XlQBQDQR0jEwSSss8I+i7rjKRRBYTEep6K1KiAqafpF/XLWtA
 +9pNLSBwILTmlWDnAvlsUawsTqIFEEeFdrzTffobfF6wKC6elkYGSmPEtEwLHHGWUMDzVM5f
 5xOhomj6Dk1H0dKtLoJzHZKAh/iA4xOu05Vld3WjRt/dsW9BxT9sc9ve26+pvPWSIJYu7hkc
 rewTZsWDuKmQMW7ZZEaV146UEI2TIPnC4FWF5qLAmzvP8f011/439HhGQJlnUF78eN7+tmL/
 td2rRYtijyPwO9cl9ZriTE+CMWY+x3n0h0E/kTibIPErnMZpIUsWJnI/hEplon9h6bMFRQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xe7o7mNziDXZ/Z7boPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrBarJ9/i82B
 x2PNvDWMHnu/LWDx2P7tAavH/e7jTB6bl9R73P73mNlj8o3ljB67bzawefRtWcXocfzGdiaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DJWP2tmL/gsXDFxRm0D4yKBLkZODgkBE4n/G1YzdzFycQgJLGWUmPBoHjNEQkbi5LQGVghb
 WOLPtS42iKJPQEX7r7CBJNgEDCW63kIkRAQ6GSWmdX9kB3GYBU4wSdzbO58RpEpYIFDi2cR5
 YKNYBFQl3s9ZBmbzCthJfJ76jxFihbzE6g0HwFZzAsWPd/eDbRASsJU4vXYG8wRGvgWMDKsY
 RVJLi3PTc4sN9YoTc4tL89L1kvNzNzECI2TbsZ+bdzBe2hh8iFGAg1GJh3cBm2u8EGtiWXFl
 7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgIdNZFZSjQ5Hxi9eSXxhqaG5haWhubG
 5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGK2eptUb3rzAHpS8hleh6EGE/9YHrTMP
 eZTm7DWVcVThujzVvYj5jtWdtxVTSp5rb6ter81xlsNoXpGT19oF+re/8cxbZaLSKVooonn/
 Y0hyvxPD9gVqzDwq87Zwri2fFu5369M3RalXkUZzZkS05Eb3FncstWTyt1vbG8SrrGNwal6s
 a9plJZbijERDLeai4kQAAhsJXqYCAAA=
X-CMS-MailID: 20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2
X-Msg-Generator: CA
X-RootMTR: 20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
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

Fix the code to refer to proper nents or orig_nents entries. This driver
checks for a buffer contiguity in DMA address space, so it should test
sg_table->nents entry.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index ff0c4b0c3fd0..a7a9a0afe2b6 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -48,7 +48,7 @@ struct omap_gem_object {
 	 *   OMAP_BO_MEM_DMA_API flag set)
 	 *
 	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
-	 *   if they are physically contiguous (when sgt->orig_nents == 1)
+	 *   if they are physically contiguous (when sgt->nents == 1)
 	 *
 	 * - buffers mapped through the TILER when dma_addr_cnt is not zero, in
 	 *   which case the DMA address points to the TILER aperture
@@ -1279,7 +1279,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 	union omap_gem_size gsize;
 
 	/* Without a DMM only physically contiguous buffers can be supported. */
-	if (sgt->orig_nents != 1 && !priv->has_dmm)
+	if (sgt->nents != 1 && !priv->has_dmm)
 		return ERR_PTR(-EINVAL);
 
 	gsize.bytes = PAGE_ALIGN(size);
@@ -1293,7 +1293,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 
 	omap_obj->sgt = sgt;
 
-	if (sgt->orig_nents == 1) {
+	if (sgt->nents == 1) {
 		omap_obj->dma_addr = sg_dma_address(sgt->sgl);
 	} else {
 		/* Create pages list from sgt */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
