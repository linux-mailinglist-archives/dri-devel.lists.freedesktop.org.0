Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA825D9FC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059A16EA33;
	Fri,  4 Sep 2020 13:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E366EA32
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133512euoutp01ac10253f2ca8ff1f0f1941fe85b80226~xmAo5Jjgl0722107221euoutp013
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133512euoutp01ac10253f2ca8ff1f0f1941fe85b80226~xmAo5Jjgl0722107221euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226512;
 bh=j4NMsIUYeDhNT1iU/BYbUagBybluyVnGEfDAwzBqQE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o++PUbGo65XuYr4Q/r3BVGYNCcIOxMj8GySOSY+HO8EOzP9v1w/pAc5WcdmU9HdL2
 aiY8x2pGDHL8A/9gVxR2NbMKnyCtx6U2SaKAc2hMBlqdQoNj9xWwJcNuSBPhgOWjOd
 LKPsfCGbW8JLiqWg+YF+tB65pRNXalLN/cji0nsc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133511eucas1p2d486263c794f51fdb8ea88600fe1e5fd~xmAoilL9n0781807818eucas1p2F;
 Fri,  4 Sep 2020 13:35:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.11.06456.F82425F5; Fri,  4
 Sep 2020 14:35:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133511eucas1p2359dd080181340eb4f24b325e75a4c68~xmAoO9OKM0143201432eucas1p2w;
 Fri,  4 Sep 2020 13:35:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200904133511eusmtrp1fbe17ff149b4a75ba401f69bbb75685f~xmAoN7VnX0766507665eusmtrp1T;
 Fri,  4 Sep 2020 13:35:11 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-67-5f52428f70ed
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FE.BE.06314.F82425F5; Fri,  4
 Sep 2020 14:35:11 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133511eusmtip1461f7ad71c971aeb5f97e8bdefea381d~xmAnrZiyY2113121131eusmtip1w;
 Fri,  4 Sep 2020 13:35:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 29/30] media: pci: fix common ALSA DMA-mapping related
 codes
Date: Fri,  4 Sep 2020 15:17:10 +0200
Message-Id: <20200904131711.12950-30-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0gUURTGvfPYHVcnplXwpqmwoFGUuvRgSjETsYmEwighMF1zUMsXu65l
 Qi4+y1eZVGKhUpqt63N9pmRq6mZLYmqmlemmWRlm+MIeWjuO1n+/853v3O/cyyVQcQNuTYRF
 xrDySFm4RCDCGrp/9O665ukb4KJvpems3h6Ersmrwuk/DTkoPbg4K6DVmi6ELnriSi8MGhBa
 OzGE0wPNdwV0ZnU9Tld0jgrpB9rfCN3+fRL3IJnygnLAPF4qwhht2VUB07g0jjNjGTqEqS1O
 YN6uTqBM7nApYFpGVAImu64MMPNau+Nmp0VuwWx4WCwrd3YPFIV+TCvBo79KLg5NJyMqYLBN
 B6YEpPbAT7e0GMdi6iGAGh3J8wKAPfp96UBk5HkAq/MMYGNgfKwP5RulAFa+HxbwhXFitlAl
 5FwCSgrTZ9IFHFtSKQA+yzLnTCg1gcCiqqG1hgXlC8f6tGuMUQ4waTkD55ik3OEHdT3Cx9lD
 TXUbyrGpUa/Pm8S5gyDVIYRVv5Ix3uQFNfeH1tkCTuvqhDxvhfrcTIwfSALQ0Fsh5ItMAAcS
 89Zv5Arf9f40rkEY99sOq5qdefkQbDNwWxBG3gSHZzZzMmrEGw23UV4m4ZVUMe92hPm6yn+x
 7X39KM8MnEtMAfwL5QCorx1GrwP7/P9hRQCUAStWqYgIYRXSSPaCk0IWoVBGhjidjYrQAuNv
 0q/q5prAYn9QB6AIIDEnTQ76BohxWawiLqIDQAKVWJKeL/RnxGSwLO4SK48KkCvDWUUHsCEw
 iRW5+94XfzEVIothz7NsNCvf6CKEqbUKeMeXPH20N/ROss9imnqWbBW6Kw+nnRJKo7xefpuC
 fs6tbiMnVMjJpuX9r/2njtYjIrOszphtVE3j85WdxVM33wTK7AZ8tHEFn3sqR+Mxl65zJTZ+
 6mMO/oza+7LHK+WBINsjji1xQr8FaFIHUgtV2SM+WxLKkkykYegK0R3rKMEUoTLpDlSukP0F
 K0nh7UkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7r9TkHxBm3z1Sx6z51kstg4Yz2r
 xf9tE5ktrnx9z2axcvVRJosF+60tvlx5yGSx6fE1VovLu+awWfRs2MpqsfbIXXaLZZv+MFkc
 /PCE1YHXY828NYwee78tYPHYtKqTzWP7twesHve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObR
 t2UVo8fnTXIB3FF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZll
 qUX6dgl6GU/bl7IWvFaquPaqhamB8aFsFyMnh4SAicSD+xeYuxi5OIQEljJKfLoxkREiISNx
 cloDK4QtLPHnWhcbRNEnRolJ33vAEmwChhJdbyESIgKdjBLTuj+ygzjMAq+ZJFp3rWEDqRIW
 CJDoP72CBcRmEVCVaP7RDdbNK2An8WjlViaIFfISqzccYAaxOYHiW2c8AasRErCV+DBnMcsE
 Rr4FjAyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAqNl27Gfm3cwXtoYfIhRgINRiYeXwT4o
 Xog1say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BjprILCWanA+M5LySeENT
 Q3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxNJ32f+OflBO5yNA77EG2U
 N63XytFiBtcn7sqs3e9idBgY3M9Lv7/j0FKUXu987phmvmcm0/1ZCdzzfnAnnpl4+JN6erKI
 8Y33vjVZOb9zXR/6uUw/WVC2+aqjlYKMv+SyNdl2R3NEfn5O6T+3g1s9vfuh2YvpC7f+DNk4
 r/gyz/5XYky/GpRYijMSDbWYi4oTAeT7s9WsAgAA
X-CMS-MailID: 20200904133511eucas1p2359dd080181340eb4f24b325e75a4c68
X-Msg-Generator: CA
X-RootMTR: 20200904133511eucas1p2359dd080181340eb4f24b325e75a4c68
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133511eucas1p2359dd080181340eb4f24b325e75a4c68
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133511eucas1p2359dd080181340eb4f24b325e75a4c68@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

While touching this code, update it to use the modern DMA_FROM_DEVICE
definitions.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 4 ++--
 drivers/media/pci/cx25821/cx25821-alsa.c | 4 ++--
 drivers/media/pci/cx88/cx88-alsa.c       | 6 +++---
 drivers/media/pci/saa7134/saa7134-alsa.c | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index df44ed7393a0..c797bff6eebb 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -113,7 +113,7 @@ static int cx23885_alsa_dma_map(struct cx23885_audio_dev *dev)
 	struct cx23885_audio_buffer *buf = dev->buf;
 
 	buf->sglen = dma_map_sg(&dev->pci->dev, buf->sglist,
-			buf->nr_pages, PCI_DMA_FROMDEVICE);
+			buf->nr_pages, DMA_FROM_DEVICE);
 
 	if (0 == buf->sglen) {
 		pr_warn("%s: cx23885_alsa_map_sg failed\n", __func__);
@@ -129,7 +129,7 @@ static int cx23885_alsa_dma_unmap(struct cx23885_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, DMA_FROM_DEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 301616426d8a..8da31c953b02 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -177,7 +177,7 @@ static int cx25821_alsa_dma_map(struct cx25821_audio_dev *dev)
 	struct cx25821_audio_buffer *buf = dev->buf;
 
 	buf->sglen = dma_map_sg(&dev->pci->dev, buf->sglist,
-			buf->nr_pages, PCI_DMA_FROMDEVICE);
+			buf->nr_pages, DMA_FROM_DEVICE);
 
 	if (0 == buf->sglen) {
 		pr_warn("%s: cx25821_alsa_map_sg failed\n", __func__);
@@ -193,7 +193,7 @@ static int cx25821_alsa_dma_unmap(struct cx25821_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, DMA_FROM_DEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 7d7aceecc985..d38633bc1330 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -316,7 +316,7 @@ static int cx88_alsa_dma_map(struct cx88_audio_dev *dev)
 	struct cx88_audio_buffer *buf = dev->buf;
 
 	buf->sglen = dma_map_sg(&dev->pci->dev, buf->sglist,
-			buf->nr_pages, PCI_DMA_FROMDEVICE);
+			buf->nr_pages, DMA_FROM_DEVICE);
 
 	if (buf->sglen == 0) {
 		pr_warn("%s: cx88_alsa_map_sg failed\n", __func__);
@@ -332,8 +332,8 @@ static int cx88_alsa_dma_unmap(struct cx88_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen,
-		     PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages,
+		     DMA_FROM_DEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index 544ca57eee75..707ca77221dc 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -297,7 +297,7 @@ static int saa7134_alsa_dma_map(struct saa7134_dev *dev)
 	struct saa7134_dmasound *dma = &dev->dmasound;
 
 	dma->sglen = dma_map_sg(&dev->pci->dev, dma->sglist,
-			dma->nr_pages, PCI_DMA_FROMDEVICE);
+			dma->nr_pages, DMA_FROM_DEVICE);
 
 	if (0 == dma->sglen) {
 		pr_warn("%s: saa7134_alsa_map_sg failed\n", __func__);
@@ -313,7 +313,7 @@ static int saa7134_alsa_dma_unmap(struct saa7134_dev *dev)
 	if (!dma->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->nr_pages, DMA_FROM_DEVICE);
 	dma->sglen = 0;
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
