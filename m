Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19D1CF066
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124586E8EE;
	Tue, 12 May 2020 09:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942736E8DE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:24 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090123euoutp013ce36f4c38c2308d3c15b995ad0c6bd0~OPFu794fy2629726297euoutp01f
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090123euoutp013ce36f4c38c2308d3c15b995ad0c6bd0~OPFu794fy2629726297euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274083;
 bh=4XCLDjcTmVzIeuA5W79fINov16Hwxa67M3axrKJlg5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qqt9va7KXcvyHsvHFH7dczvmNz5WtokcU2BHawMRahRjGAkN1cga2UfogO4gSvrB6
 IMvbd9GiunVJs9TjCRJEltLwz+4jTjQ9D3gHn4fTs0DMAsgeNKs6oMGvVy54PBGS+Z
 vvuNtzWLoSYs84SH+IuAjToQIxNknHqA/7mWbr1I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090122eucas1p261bda11ecce3f0986a08dd7a66c45daf~OPFuqO2qs2664426644eucas1p2e;
 Tue, 12 May 2020 09:01:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F0.32.60679.2E56ABE5; Tue, 12
 May 2020 10:01:22 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090122eucas1p155db33deb51b4bbc34c0a012e4a7361d~OPFuY736x1182811828eucas1p1H;
 Tue, 12 May 2020 09:01:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200512090122eusmtrp1cda9124151a91853171a8b98db77cc03~OPFuYOyYf0188101881eusmtrp1U;
 Tue, 12 May 2020 09:01:22 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-c2-5eba65e22014
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E1.03.07950.2E56ABE5; Tue, 12
 May 2020 10:01:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090121eusmtip12477076dd64f37cd14e4b1fc4ce7b421~OPFtwX24C1181011810eusmtip1q;
 Tue, 12 May 2020 09:01:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 26/38] drm: vmwgfx: fix common struct sg_table related
 issues
Date: Tue, 12 May 2020 11:00:46 +0200
Message-Id: <20200512090058.14910-26-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87qPUnfFGcx/bGLRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVq8OXKM0eLyrjlsFmuP3GW3OPjhCavF
 51PH2Bx4PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR9+WVYwe
 nzfJebyb/5YtgDuKyyYlNSezLLVI3y6BK+PVnXfMBackKq7/lWxgPCbSxcjJISFgItH7dxtT
 FyMXh5DACkaJ5ysbGCGcL4wSx7eeY4NwPjNKtO9oBSrjAGtparaFiC9nlNh/6wsTXEfrhE1s
 IHPZBAwlut52gdkiAq2MEid6eUCKmAX+MUlM/juLCSQhLBAk0bRiK1gRi4CqxOuvl1hANvAK
 2EncvCoBcZ+8xOoNB5hBbE6g8P35f1hA5kgIHGOXaL14hRmiyEXib083G4QtLPHq+BZ2CFtG
 4vTkHqiGZkaJh+fWskM4PYwSl5tmMEJUWUvcOfeLDWQzs4CmxPpd+hBhR4n/e7cxQ7zMJ3Hj
 rSBImBnInLRtOlSYV6KjTQiiWk1i1vF1cGsPXrgEdZqHxIXlP9ghAXQUGFpnnzJPYJSfhbBs
 ASPjKkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMDEdPrf8S87GHf9STrEKMDBqMTDa2Cw
 M06INbGsuDL3EKMEB7OSCG9LJlCINyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZ
 qakFqUUwWSYOTqkGxu0rL01OXKw/u7Pg9zTVgJ5YpQCticcev3tbaPyh+NPvE2vWmb5+Njfp
 kHF1XO/pt5xB5euFub8qLP37funWBIPMulkhdrkf2vxay/3fGHO0pMxXXnjh/cLL2+Kfclx9
 +/7Zf8tTvm+ii/ldZlol9FYxzRVsPG7HusBzlu259avvLj2oNEfL9L4SS3FGoqEWc1FxIgBg
 0/iQSAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7qPUnfFGUzqkbPoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC3eHDnGaHF51xw2i7VH7rJbHPzwhNXi
 86ljbA68HmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkPN7Nf8sWwB2lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
 llqkb5egl/HqzjvmglMSFdf/SjYwHhPpYuTgkBAwkWhqtu1i5OIQEljKKNFwq4Wpi5ETKC4j
 cXJaAyuELSzx51oXG0TRJ0aJO/sfMYIk2AQMJbreQiREBDoZJaZ1f2QHcZgFWpgl9r75xwZS
 JSwQIPF54h2wUSwCqhKvv15iAVnNK2AncfOqBMQGeYnVGw4wg9icQOH78/+wgNhCAoUSj66+
 ZZnAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYJxsO/Zzyw7GrnfBhxgFOBiVeHg7
 jHbGCbEmlhVX5h5ilOBgVhLhbckECvGmJFZWpRblxxeV5qQWH2I0BbppIrOUaHI+MIbzSuIN
 TQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwnmV5v4r/mf1+p/j319+n
 bZnOlp++b1m+6VTH+0a2m302vnn/eOc05b8Sh2z5pk/8EjFrvsnadGPP25WHFusVH2BSNY8x
 OvBigw67oP/cNH2elacuhwur/Iro3CLic0Oq3qVIsWjdL6GoUP25M/eYT9jAbV48+esdiwcu
 6TesNmjEP5POP1x3WImlOCPRUIu5qDgRAJndOeSpAgAA
X-CMS-MailID: 20200512090122eucas1p155db33deb51b4bbc34c0a012e4a7361d
X-Msg-Generator: CA
X-RootMTR: 20200512090122eucas1p155db33deb51b4bbc34c0a012e4a7361d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090122eucas1p155db33deb51b4bbc34c0a012e4a7361d
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090122eucas1p155db33deb51b4bbc34c0a012e4a7361d@eucas1p1.samsung.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
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
Acked-by: Roland Scheidegger <sroland@vmware.com>
---
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bf0bc46..49ed6ad 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -362,8 +362,7 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
 
-	dma_unmap_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.nents,
-		DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(dev, vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
 	vmw_tt->sgt.nents = vmw_tt->sgt.orig_nents;
 }
 
@@ -383,16 +382,8 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 static int vmw_ttm_map_for_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
-	int ret;
-
-	ret = dma_map_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.orig_nents,
-			 DMA_BIDIRECTIONAL);
-	if (unlikely(ret == 0))
-		return -ENOMEM;
 
-	vmw_tt->sgt.nents = ret;
-
-	return 0;
+	return dma_map_sgtable(dev, vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 /**
@@ -449,10 +440,10 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			goto out_sg_alloc_fail;
 
-		if (vsgt->num_pages > vmw_tt->sgt.nents) {
+		if (vsgt->num_pages > vmw_tt->sgt.orig_nents) {
 			uint64_t over_alloc =
 				sgl_size * (vsgt->num_pages -
-					    vmw_tt->sgt.nents);
+					    vmw_tt->sgt.orig_nents);
 
 			ttm_mem_global_free(glob, over_alloc);
 			vmw_tt->sg_alloc_size -= over_alloc;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
