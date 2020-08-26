Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7AA252725
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C06EA0E;
	Wed, 26 Aug 2020 06:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4D76E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:42 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063540euoutp022ae1112841e3aa82cd14c9f195024fb8~uvexwWXsR1512715127euoutp02a
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063540euoutp022ae1112841e3aa82cd14c9f195024fb8~uvexwWXsR1512715127euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423740;
 bh=naP6ucUWW5FZL0KW8+0ryHT0w1+loIDMeEz9E+UFX2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q8vjf+Ki+VuZHDP4yt6Aji6ys6uCLYVFRUl1lizsOa1zdZK38b6n7oUyOYR1CDvHD
 6KNoaKkbIwX7q2QLiNHjx626M21PzNTtwgn3+0tGvu9wsNUVdTnOvLi2JOq1ygvr4C
 iFRepK0HV/EQHYprG/jwRLjIa0HjsgYUTFBKQT00=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063540eucas1p1fa771d0d12a16019b38b6781139b76f3~uvexkORMn1942019420eucas1p12;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 38.33.06456.CB2064F5; Wed, 26
 Aug 2020 07:35:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063540eucas1p2e9f9f9133322205269e50fd01bf64bcc~uvexO8El00398703987eucas1p2j;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063540eusmtrp142d1b05208bb0883fcd3f873e0393449~uvexORqk51091110911eusmtrp1g;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-d4-5f4602bcd9ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2B.D0.06314.CB2064F5; Wed, 26
 Aug 2020 07:35:40 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063539eusmtip271a55f25d7314543ff4ee5312e504022~uvewhmrp22993829938eusmtip2j;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 21/32] drm: vmwgfx: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:33:05 +0200
Message-Id: <20200826063316.23486-22-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTURzn3Neu5uQ2hZ00EkZmBb5I6pIhaVoXUojwS6LZ0ssU5yabWtaH
 hqXWdOYrUlEzEcxtpk1T0cpHuhnz1RSxMkw0SHFa+QizrM2b9u33PL//h0OiglbcjUyUpbIK
 mVgqIhyxVuPGsPcL5Gys351SL1oz/Aahn5U24vSf1kKUHl9bJuh6XT9CV3cF0qvjMwhtmJ3A
 6cU+I6DHOioIuqHvI4/u+TqH07p7waf5jL5KD5iX69UY07b+CWemc00I01x7i/mwNYsyxZN1
 gOl8pyKY/BYtYFYMB5ilR1biwp4ox1PxrDQxnVX4Bl1xTNCWjOIpBcLr0/pBXAVqXNTAgYRU
 ABwZ6uCpgSMpoJ4A2P56COHIKoCVZXqUIysAvq/4TOxU2n4ZcM6oA1A9pcN2K5v9DxB7iqD8
 odqq3m64UlkADmic7CGU+o1Ay2wRbjdcqItwtqQetWOM8oS5qnZgx3wqCI7NzWDcnAfUNXVv
 Zxxsuin3PmF/CFJGHizS1eJcKBQa+1v+3ecCF0wtPA7vh+biPIwr3AZwZriBx5E8AMcySwGX
 CoRTwz9tbdJ23xHY2OHLycFw5e0Gbpch5QwnrXvtMmqDRa0PUU7mw7vZAi59CJabnu7O9oxa
 UA4zsNOytj0koAoBzF6ILQAe5f+3qgHQAiGbpkyWsEp/GXvNRylOVqbJJD5x8mQDsP0m85bp
 eztYs1ztBRQJRE78aiIsVoCL05UZyb0AkqjIlR8yZL4s4MeLM26wCnmsIk3KKnuBO4mJhPxj
 NfMxAkoiTmWTWDaFVey4COngpgLSruyk/PAIPMLQPLF0Yl+hsydmCY0SDjLC+sPn/QPbvT0S
 AlzdDQ6rxKsvPapv5WavmpyyH3SEuaonO7MpLmU5yVee5TcSGRYefS5RI93w04TEWKPPtFnc
 unUnnw9oJfrNcp5KnnTQytvscHPPvXSh8vh8ZNXi/KAx53HLzT4RpkwQ+x9FFUrxX7oNnXhJ
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xe7p7mNziDR79EbToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC3eHDnGaHF51xw2i7VH7rJbHPzwhNVi
 daejA6/HmnlrGD32flvA4rH92wNWj/vdx5k8Ni+p97j97zGzx+Qbyxk9dt9sYPPo27KK0ePz
 JjmPd/PfsgVwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehlrJpygbVggnjF/TVnWBsYFwl3MXJySAiYSGz/s4m1i5GLQ0hgKaPEmmXTWSASMhIn
 pzWwQtjCEn+udbFBFH1ilNj06CIjSIJNwFCi6y1EQkSgk1FiWvdHdpAEs0Azs8T5l7UgtrBA
 gMSkhY+ZQGwWAVWJ7oYdYM28AnYSl588hNomL7F6wwFmEJsTKH68u58NxBYSsJU4vXYG8wRG
 vgWMDKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECI2XbsZ+bdzBe2hh8iFGAg1GJh3cBm2u8
 EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgIdNZFZSjQ5HxjFeSXxhqaG
 5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGPVXlHy5cNBhUY9xp81XBks9
 22cT/i6Y+/vQV9stGjmPZBfe2HGvb8/XmdevFlt8veC1a9507/I6lcvTWJtSBRMmNZ5sfe4l
 Oeuco9M+xT4zvcciRs2K/5vmX159Y//iJXOTHaNvTZ5hxjlhnfSzrHOLat80X7Y7Pq3GuHiH
 0/Y7gjE5Zo6mZ2yUWIozEg21mIuKEwFTiCgyqgIAAA==
X-CMS-MailID: 20200826063540eucas1p2e9f9f9133322205269e50fd01bf64bcc
X-Msg-Generator: CA
X-RootMTR: 20200826063540eucas1p2e9f9f9133322205269e50fd01bf64bcc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063540eucas1p2e9f9f9133322205269e50fd01bf64bcc
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063540eucas1p2e9f9f9133322205269e50fd01bf64bcc@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
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
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index ab524ab3b0b4..f2f2bff1eedf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -362,8 +362,7 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
 
-	dma_unmap_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.nents,
-		DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(dev, &vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
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
+	return dma_map_sgtable(dev, &vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
