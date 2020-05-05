Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2875A1C50D7
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6077689D9B;
	Tue,  5 May 2020 08:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2476E558
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084627euoutp02dc629940174cccb281f2289646c7894d~MFXtTegln2638126381euoutp02E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200505084627euoutp02dc629940174cccb281f2289646c7894d~MFXtTegln2638126381euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668388;
 bh=smP0MqC10gkGUsqZ8FO+WM7ssHhztI08IUYBhFg1Gms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dnWYXk7pNLW4nAWdQhAv06D0Zh6dFRLsNRbQnkybhMmdvQfmrqZx82fi9NZxV62nq
 XjtAak0CVkAGun9KD41WLExMmymzo3VLMexGbau7mWKNvfrRMx7Eo+X6SCVovjtA0i
 gxFEQkiOnd1/YffDhUWe2N9240/8FsELvn884uMg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084627eucas1p16fb638775da4293e682737af349058d9~MFXs_3_wM1830218302eucas1p1J;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D1.CF.61286.3E721BE5; Tue,  5
 May 2020 09:46:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084627eucas1p119c77fbf28532627f27382efc51b0aaa~MFXssRhHQ1830218302eucas1p1H;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084627eusmtrp10c9da49bd6926c2c2da3fe2b52dc42a6~MFXsrjgJk0942309423eusmtrp1P;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-9b-5eb127e32c26
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D3.14.08375.3E721BE5; Tue,  5
 May 2020 09:46:27 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084626eusmtip16cfbd7c9a086f9c1c9c8da7309eeacb0~MFXr-vkJj0580805808eusmtip16;
 Tue,  5 May 2020 08:46:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/25] drm: exynos: fix common struct sg_table related
 issues
Date: Tue,  5 May 2020 10:45:55 +0200
Message-Id: <20200505084614.30424-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSbUgTYRznubudt+HqmoYPGiqLkiQ1yw8HliX44YigkKKQsmYeKjqVzflW
 1Eo0mxpTMYel2BA1312yxEqnqLOGs1R0qaljOjKyJJ2pkLXzrL793v78/s+fh0BFnTxPIiE5
 jZElS5LEuADTD26OBNj82qOPLU4cpIrMbxGqXdPKo37ri1Fq3PEdp543DiBUyZwao6p7QqnP
 sx8wam3cilA62wSPGut6ilOakW6Eau7/5EL1rizwKE3pEn5mL91U1QToN+vVGP1yfZ5HzxUY
 EfpFzV16etuG0qWWOkC/+qjE6UcdDYBe1XlfEEQJTsYySQnpjCwo7IYg3lAmSVWTmfZKO1CC
 SaEKEAQkQ+BmdaAKCAgRWQ9gSf8QUAG+k6w5ifYoZ6wC2Dj5eMdgB6x2JY8z6gAcdrQgHHFO
 tK4pETaFk8FQtazCWexO5gI4VOTKhlBSh8KCSi3KdruRkdC0GMFmMPIQ1NY+Q1ksJE9Bu3oY
 5dp8YGObYQfzyTBoG53BOd3sAk3fAjkcAQcNlRiH3eAXY4cLhw9AU2khxvZCMgdAq7nZhSOF
 AI7d1+y+JxTOmLdwdiGUPAJbu4I4ORzmbP/CuBvtgZblfayMOmGJvhzlZCHMzxNx6cOwwtjy
 r7b3/eju+jTMteQA7j4DABpqNhA18Kn4X1YNQAPwYBRyaRwjD05mMgLlEqlckRwXeDNFqgPO
 /2TaNv7oBI7RmD5AEkDsKryy2hot4knS5VnSPgAJVOwurN1oixYJYyVZ2Yws5bpMkcTI+4AX
 gYk9hCe0S9dEZJwkjUlkmFRG9tdFCL6nEkj5inMe0uykSkfGQ966qOxSdH1OjKJZ62YWlD/J
 ZI5r8u6l93uFRYWf/jlWu72V2J/vJ+wFPYNR6uk7726/Jld8HasL2d3EbMxGUNzS/geXxyOk
 dWbR1SlvU7HV99b416huXYFlShPizj87FTAsM0bqE+Zz24ICqhQX/Wc058WYPF4S7I/K5JI/
 MctFXEsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsVy+t/xu7qP1TfGGUxcyWPRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllMuj+BxWLBfmuLF/cuslh8ufKQyWLT42usFpd3zWGzmHF+H5PF
 2iN32S0OfnjCajFj8ks2B36PNfPWMHrs/baAxWP7twesHve7jzN5bF5S73H732Nmj8k3ljN6
 7L7ZwObRt2UVo8fnTXIBXFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2
 NimpOZllqUX6dgl6GQemJhZMEKh4NvcZYwPjdd4uRk4OCQETiYfPGlhBbCGBpYwSH/+IQ8Rl
 JE5Og4hLCAhL/LnWxdbFyAVU84lR4t/MNrAEm4ChRNdbiISIQCejxLTuj+wgDrPAHmaJJ+/O
 s4FUCQsESOx/dJsZxGYRUJVYtGwhmM0rYCvxbMJZZogV8hKrNxwAszkF7CQeX7rDBnFSocSH
 899ZJzDyLWBkWMUoklpanJueW2yoV5yYW1yal66XnJ+7iREYM9uO/dy8g/HSxuBDjAIcjEo8
 vBGf18cJsSaWFVfmHmKU4GBWEuFd9mNDnBBvSmJlVWpRfnxRaU5q8SFGU6CjJjJLiSbnA+M5
 ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDo/bf+M/L5l4945jW
 /nRS2P9nt+3tUgJjO+27p57UWOc3M21Si89fFpGub4wey5MdnKIN7pkdeVM+k3vxi9/yP/a8
 6L17QqVmicqxNb8j9PdHiEYz7ne//90vePWbC7mau5Zx2fltNoywdeu1STq+cdpV72sav24c
 Vvtj//FNd7FiTc2TPZtCfiuxFGckGmoxFxUnAgCt+I6OrwIAAA==
X-CMS-MailID: 20200505084627eucas1p119c77fbf28532627f27382efc51b0aaa
X-Msg-Generator: CA
X-RootMTR: 20200505084627eucas1p119c77fbf28532627f27382efc51b0aaa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084627eucas1p119c77fbf28532627f27382efc51b0aaa
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084627eucas1p119c77fbf28532627f27382efc51b0aaa@eucas1p1.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
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
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index fcee33a..6a655d3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -395,8 +395,8 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 		return;
 
 out:
-	dma_unmap_sg(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt->sgl,
-			g2d_userptr->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
+			  DMA_BIDIRECTIONAL);
 
 	pages = frame_vector_pages(g2d_userptr->vec);
 	if (!IS_ERR(pages)) {
@@ -511,10 +511,9 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 
 	g2d_userptr->sgt = sgt;
 
-	if (!dma_map_sg(to_dma_dev(g2d->drm_dev), sgt->sgl, sgt->nents,
-				DMA_BIDIRECTIONAL)) {
+	ret = dma_map_sgtable(to_dma_dev(g2d->drm_dev), sgt, DMA_BIDIRECTIONAL);
+	if (ret) {
 		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
-		ret = -ENOMEM;
 		goto err_sg_free_table;
 	}
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
