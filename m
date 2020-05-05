Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645801C50ED
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6336E591;
	Tue,  5 May 2020 08:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892E76E581
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084633euoutp01c409f0e1168ba58e841fa2a3f40df819~MFXyKex9z0319103191euoutp01x
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084633euoutp01c409f0e1168ba58e841fa2a3f40df819~MFXyKex9z0319103191euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668393;
 bh=Txgn9hnhGeUmFxJHwhLtat+o9WmdJXFs27FJOQhki+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pjrpRI05HrCJJ1MVisR+hVG3sevSoMdZqcSMXoqh7sx3kTSeumbuw0bdQzhQl7Eq1
 INTJ+/Ip1FvOfI3yz9utMPmgdNnTVXPRn2ObZ3UNIPtz9CmBavubWgLZF4QxSt42VY
 iuoWi2OSGNoE7Qo49LDCpfLKJP2O4ixLcT8dZ5Cc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200505084632eucas1p2f773ae8b6ee1cfb0d83b128d41d732ec~MFXx_MDk40589305893eucas1p2G;
 Tue,  5 May 2020 08:46:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.32.60679.8E721BE5; Tue,  5
 May 2020 09:46:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084632eucas1p231212e9cea88e755da8eaf1fb012d2c6~MFXxtJVWN1348713487eucas1p2Y;
 Tue,  5 May 2020 08:46:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084632eusmtrp19f6cd394ccc3bafa11d1d506307d9e5c~MFXxnuoHk0942309423eusmtrp1e;
 Tue,  5 May 2020 08:46:32 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-46-5eb127e8f794
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EA.14.08375.8E721BE5; Tue,  5
 May 2020 09:46:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084631eusmtip146cf05a90e8510094663b002af942cae~MFXxCbuYK0106101061eusmtip18;
 Tue,  5 May 2020 08:46:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/25] drm: vmwgfx: fix common struct sg_table related
 issues
Date: Tue,  5 May 2020 10:46:04 +0200
Message-Id: <20200505084614.30424-15-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUgUYRzlm5mdHc2taZX8sEjcKFHwKv+YNKxUaKQCkSLtsDYd1FoPdr0p
 MqWD9cBVcUXMxMr71tYLMa/1olXUzMzKTQs114xV8TbXMfvvvfd77/sdfATKV3BMiICgUEYc
 JBQJcH1MoVzps5oyr/S2bR5xoBJV3QhVmVHOobYUMpQaWvyNU4XFHQiV0+xILQypEapqYphD
 zbYrATXYkIVTpe1fuFTL/CSH0vYo8XM8uiS7BNBNSzkYXbs0zqG/xXcidPXrR/TnzQmUTh3J
 B3TjpxicTqopArS26ig991KDu++7rn/GlxEFhDNiG6c7+v69mu9oyJxhZFrCGicGvCelQI+A
 pD2cm2zDpECf4JMFANanZeAsWQDwa1cSlyVaAKeWqxEpIHYiHWu2rJ4P4OKzLGQv8UMzCnTv
 4qQdlGqkuA4bkU8A7Eo00JlQchOBqRuZiK5gSHrAZnnejgkjj8NXH+ZRHeaRTrAwW85lBzSF
 xRXvdnS9bX1iYGxnPkj2cKHsZwHGmlyhWr3EYbEhnOms2Q0fgb2pCRgbiANQrSrlsiQBwMHY
 DMC6HOGYahXXLYeSFrC8wYaVz8PkokSc3Xk/HNEc1MnoNkxRyFFW5sHnT/ms+wTM7Czba9vS
 P7BroWFt4zX2QB0A9s/K8WRgmvm/Vw4ARcCYCZME+jGSk0FMhLVEGCgJC/Kz9gkOrALbv6l3
 s3OhDjSs320FJAEEBjxPbbk3nyMMl0QFtgJIoAIjXt5yhTef5yuMimbEwbfFYSJG0goOE5jA
 mHcqd/oWn/QThjL3GSaEEf+rIoSeSQwwUnoR6e5WxwpPX5C5Zc28Vb3hypDhSovasi2z9NgX
 Bzyu+NjfTFWBwW7kbKRbesShxz5+0x4KYb3LH/OLmjJ7S4SqN37gmTt6+erGQ9dLWNe6UqSM
 GJdPCyzirEQpzqvNzk3a8F8JWw73WiIVXjdW4j7GxS/1zdS31bkMR9eYCTCJv9DOEhVLhH8B
 gsmbzUkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7ov1DfGGfw8oWDRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVq8OXKM0eLyrjlsFmuP3GW3OPjhCavF
 51PH2Bx4PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR9+WVYwe
 nzfJebyb/5YtgDtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL+P020fMBe+EK6b0/GZtYDwr0MXIwSEhYCJx9LdBFyMXh5DAUkaJM8u7WLsYOYHi
 MhInpzVA2cISf651sUEUfWKUeLD3ERNIgk3AUKLrLURCRKCTUWJa90d2EIdZoIVZYu+bf2wg
 K4QFAiRO7k4CaWARUJVYfPUDM4jNK2AnsXLedHaIDfISqzccAItzAsUfX7rDBmILCRRKfDj/
 nXUCI98CRoZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgZGy7djPzTsYL20MPsQowMGoxMMb
 8Xl9nBBrYllxZe4hRgkOZiUR3mU/NsQJ8aYkVlalFuXHF5XmpBYfYjQFOmois5Rocj4wivNK
 4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTByfuZ60+i4tuir1ZpN
 s99FKZatjPrX/NNoRWGmRdH0ifveHpDaVsfy23xJJ99S0e1yBU+e7rs5TZe3Vm5BS6SQ72cN
 21fbf0eWZT585t7iXye5T9CieNrECw5vL9Tcmbp+/xfWL7zCH9y69x1tEjtzQ/aI57x9S91i
 she4y1YbnHqvsWlmTuUSJZbijERDLeai4kQAPqcqVaoCAAA=
X-CMS-MailID: 20200505084632eucas1p231212e9cea88e755da8eaf1fb012d2c6
X-Msg-Generator: CA
X-RootMTR: 20200505084632eucas1p231212e9cea88e755da8eaf1fb012d2c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084632eucas1p231212e9cea88e755da8eaf1fb012d2c6
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084632eucas1p231212e9cea88e755da8eaf1fb012d2c6@eucas1p2.samsung.com>
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

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bf0bc46..e50ae8b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -362,8 +362,7 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
 
-	dma_unmap_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.nents,
-		DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(dev, vmw_tt->sgt, DMA_BIDIRECTIONAL);
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
+	return dma_map_sgtable(dev, vmw_tt->sgt, DMA_BIDIRECTIONAL);
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
