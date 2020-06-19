Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0C200674
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC736EC62;
	Fri, 19 Jun 2020 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26A86EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:59 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103658euoutp02a0109488330957d09f8939a045d68d8e~Z66CjLSLe2372823728euoutp02F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103658euoutp02a0109488330957d09f8939a045d68d8e~Z66CjLSLe2372823728euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563018;
 bh=MqT40NSX2hFbmyPasraeZB6y//Q28ZVdzAVMaxtMZLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=onkEViGCCe7klnZYJdr4RgYiYdgtbnI2s5eY3aVD0sO3zusgjWboKsEXfNZSDnq/R
 4f9tL/aljHmc2B1PhNtUIqEPYrvNxIgdPx2SFH/A1CyZkFw/5vrwRv7XLJ2KmrJP+V
 S/rbQYEjln/Rso/up6avQ15ici0Erxtr4UDSIoHA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103658eucas1p2c25ebe9fc54f28de78255c4aa730e8ed~Z66CU9dYF1674516745eucas1p2C;
 Fri, 19 Jun 2020 10:36:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EA.9C.06456.A459CEE5; Fri, 19
 Jun 2020 11:36:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103657eucas1p24bff92408adbd4715130fb47595a6187~Z66B_hWgs2889328893eucas1p2o;
 Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103657eusmtrp12aaf4794c95a66b625cfb42468c75e8d~Z66B9zOeQ0949709497eusmtrp1-;
 Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-3e-5eec954a539f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.0B.06017.9459CEE5; Fri, 19
 Jun 2020 11:36:57 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103657eusmtip2ee81fdaa7e0013e93ca04a158343c4f7~Z66BPbOcj0244902449eusmtip2l;
 Fri, 19 Jun 2020 10:36:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/36] drm: exynos: use common helper for a scatterlist
 contiguity check
Date: Fri, 19 Jun 2020 12:36:07 +0200
Message-Id: <20200619103636.11974-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7peU9/EGRy9yGbRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllMuj+BxWLBfmuLL1ceMllsenyN1eLyrjlsFjPO72OyWHvkLrvF
 wQ9PWC1mTH7J5sDnsWbeGkaPvd8WsHhs//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
 +rasYvT4vEkugCuKyyYlNSezLLVI3y6BK+Pqwr8sBYe5K9a+PMTYwHiAs4uRg0NCwERi/RLz
 LkYuDiGBFYwSU69tZYRwvjBKfGzbygbhfGaUWHdoO3MXIydYR/uTlcwQieWMEr/2fWaBa1l/
 /xUrSBWbgKFE19suNhBbRKCVUeJELw9IEbNAB7PEtYnzGUESwgKxEnfnfGcHOYRFQFXi4gYZ
 kDCvgK3EoSd/2SC2yUus3nAAbDOngJ3E65aDrCBzJASOsUusXAcxR0LAReLS70/sELawxKvj
 W6BsGYnTk3tYIBqaGSUenlvLDuH0MEpcbpoB1W0tcefcLzaQK5gFNCXW79KHCDtK3Ph3ixES
 SnwSN94KgoSZgcxJ26YzQ4R5JTrahCCq1SRmHV8Ht/bghUvQ0PKQOHNvDjSAJjJK9LcvYZnA
 KD8LYdkCRsZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYganp9L/jn3Ywfr2UdIhRgINR
 iYfXIfx1nBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkr
 JJCeWJKanZpakFoEk2Xi4JRqYFQrqesUd77EsUeZuTK99unWH3J79T+YmwcJai1tcUgyuMl2
 UvaLms95kTYDSS620BqDJVmPcg+VTTtsL9670zJU8MYzqcPLF97/vdNRrXVvTp7lsr9zDy31
 frTbsHGX45y/6jLiVwTsnM8pNiqZvz47YflphXfXF3GtufnYtSrOMvUVu/MbOSWW4oxEQy3m
 ouJEAInmlHhJAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xe7qeU9/EGdzu0rToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwm3Z/AYrFgv7XFlysPmSw2Pb7GanF51xw2ixnn9zFZrD1yl93i
 4IcnrBYzJr9kc+DzWDNvDaPH3m8LWDy2f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+6bDWwe
 fVtWMXp83iQXwBWlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
 llqkb5egl3F14V+WgsPcFWtfHmJsYDzA2cXIySEhYCLR/mQlcxcjF4eQwFJGicU3OlghEjIS
 J6c1QNnCEn+udbFBFH1ilPg4+RxYgk3AUKLrLURCRKCTUWJa90d2EIdZYAKzxP2W1YwgVcIC
 0RKrP20B2sHBwSKgKnFxgwxImFfAVuLQk79sEBvkJVZvOMAMYnMK2Em8bjkItkAIqGb5gvfM
 Exj5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMlW3Hfm7Zwdj1LvgQowAHoxIP74uQ
 13FCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCnTTRGYp0eR8YBznlcQb
 mhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgnOS3Rf/WeS0J/o9Mis1S
 MYual2grzflV8llVcv67yLLi+Tfs2dmX2t4wZhCuPaX0964Ot3tFgka211Uxc9GiXbKN1+Jt
 N5yZfPOL+uUE7tudTAdm9G1rSWzfvrigo3bHhaK74pHPHrJp7FJKtV+kdTnP1CbNS9XDtc+h
 YOnyxzcm/z8W/jVUiaU4I9FQi7moOBEAH4+uvKsCAAA=
X-CMS-MailID: 20200619103657eucas1p24bff92408adbd4715130fb47595a6187
X-Msg-Generator: CA
X-RootMTR: 20200619103657eucas1p24bff92408adbd4715130fb47595a6187
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103657eucas1p24bff92408adbd4715130fb47595a6187
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103657eucas1p24bff92408adbd4715130fb47595a6187@eucas1p2.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use common helper for checking the contiguity of the imported dma-buf.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index efa476858db5..1716a023bca0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -431,27 +431,10 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 {
 	struct exynos_drm_gem *exynos_gem;
 
-	if (sgt->nents < 1)
+	/* check if the entries in the sg_table are contiguous */
+	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
+		DRM_ERROR("buffer chunks must be mapped contiguously");
 		return ERR_PTR(-EINVAL);
-
-	/*
-	 * Check if the provided buffer has been mapped as contiguous
-	 * into DMA address space.
-	 */
-	if (sgt->nents > 1) {
-		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
-		struct scatterlist *s;
-		unsigned int i;
-
-		for_each_sg(sgt->sgl, s, sgt->nents, i) {
-			if (!sg_dma_len(s))
-				break;
-			if (sg_dma_address(s) != next_addr) {
-				DRM_ERROR("buffer chunks must be mapped contiguously");
-				return ERR_PTR(-EINVAL);
-			}
-			next_addr = sg_dma_address(s) + sg_dma_len(s);
-		}
 	}
 
 	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
