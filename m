Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3A1FF75B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32BC6EB88;
	Thu, 18 Jun 2020 15:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBE96EB8B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154038euoutp01846d0d890d694c0a3925166e3df9cdd5~ZrZ5ZHDYE1835418354euoutp01e
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154038euoutp01846d0d890d694c0a3925166e3df9cdd5~ZrZ5ZHDYE1835418354euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494838;
 bh=kbdu9i1ky3V53J/j8HYin75jAIlE4fk1hTbkVYKJ63U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qtuJqSX50UehzTTehb30PiCIx/7WFPerqbtj5a/WEd3Sih0knMwnhxog6/KaQxkih
 a54qsCnhMRvbELXx8G2ZyLPb35Wscvh2tRUkB7owR5Vlvi5aZzWdbQUvIJ1bgGav+S
 7TNEjWVMGCmqTjl5dxLAEoZSWs350JfMJev2ITv8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200618154038eucas1p2121f339d68d5829bf83f6bc2eaab00c4~ZrZ5AnrD-0501005010eucas1p23;
 Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AC.DE.60679.6FA8BEE5; Thu, 18
 Jun 2020 16:40:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154038eucas1p18eae40b8fbf97a3e42abef8eb14da946~ZrZ4paTmk1755717557eucas1p1c;
 Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200618154038eusmtrp1756f89b0c0bcd84961a6999c354ec4e2~ZrZ4os9eH2230622306eusmtrp1S;
 Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-58-5eeb8af6a314
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 05.F9.07950.5FA8BEE5; Thu, 18
 Jun 2020 16:40:38 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154037eusmtip178c531fea8bb60f22dafd0aa787bb8a2~ZrZ4BqXtS0864308643eusmtip1P;
 Thu, 18 Jun 2020 15:40:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 34/36] media: pci: fix common ALSA DMA-mapping related codes
Date: Thu, 18 Jun 2020 17:39:55 +0200
Message-Id: <20200618153956.29558-35-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSaUhUURiGOXeb6+TEdTQ9WKRNZAu51o9Lhplo3D9BSZhELlNe1BwX5qqp
 VGqi6ehYKrghMUTkvo06mWYupGMOWaS4pC3ikLmh4QKWjnm9Lf+e873v973fORwSlTbhtmR4
 VCyrjJIrZIQY0/VtvHNcV80HuozOW9PqwTcI3Vhcj9PbujyUHl5bIujK6l6E1nS606vDUwit
 nR7B6aG2MoLOaWjB6drXn0T0M+0mQncvG3FPCVPzuAYwHesajNFWZRHM8/WvOPMlW48wTU+T
 mQnTNMoUjJUDpn08hWBym6sAs6I9eGnPNfHZEFYRHs8qnT2CxWHfil7gMQvWCS3zJjQFzFqq
 gBkJqdMwVT1KqICYlFIVABorahFekFKrAI6tKQRhBcCM7Q2gAuRux1RWkOApB/Cl8arg2fHX
 65pFvEBQrlC1qCJ4tqLSAexXm/MmlJpGoKZ+ZFewpC7D8q0MjGeMOgJz5+pQPkBCecCmsmPC
 dnawuqEL5dlsp2zQp+P8HEgNiGBmtgkTTN6wPX9YJLAlnNM3/+ED0FCQgwkNaQBODdaKhEMO
 gEP3i4HgcoeTgz8JPhmljsP6Nmfhludhx8AdAffCsUUL3ozuYL6uCBXKEpiZIRVmOMBSfd2/
 1O73H1CBGfirZgET3icPwA7jAP4I2JX+z9IAUAVs2DguMpTl3KLY206cPJKLiwp1uhkdqQU7
 X8lg0q+2grbNGz2AIoHMXPL9ynygFJfHc4mRPQCSqMxK4vXWECiVhMgTk1hldJAyTsFyPWA/
 iclsJKeezAZIqVB5LBvBsjGs8q+KkGa2KcB+IsT76EcbbtnbN90tl3VN04k3hxunnfM9/bPG
 77qkJXXlGUyNEX4larcz53zu3RrP8l/qxUXZmJ9xIcEzIDVFvVxh/yPaYgm5kO27ogh9WOx1
 /dDFmc7WLZ/DSfuCqZO6DK/C6hI22b5/cuaVY2VFiHt8ZU9Cb1+tAxQ/KPwsw7gwuesJVMnJ
 fwNiwzczRgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7rful7HGUxsZLToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZtGzYSurxdojd9ktlm36w2Rx
 8MMTVgdejzXz1jB67P22gMVj06pONo/t3x6wetzvPs7ksXlJvcftf4+ZPSbfWM7osftmA5tH
 35ZVjB6fN8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZTybvpO14I1YxdbX/5gbGF8KdzFycEgImEg87IzvYuTiEBJYyijxZuYX9i5GTqC4
 jMTJaQ2sELawxJ9rXWwQRZ8YJY7/OgCWYBMwlOh6C5EQEehklJjW/ZEdxGEWeM0k0bprDRtI
 lbCAv8Sy6dNYQGwWAVWJvlfrmEFW8wrYSWyeowGxQV5i9YYDzCA2J1D49PFWsAVCArYSzz+0
 sU1g5FvAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMFK2Hfu5ZQdj17vgQ4wCHIxKPLwv
 Ql7HCbEmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQTROZpUST84FRnFcS
 b2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbHTcLOqnGvFAz9L24U+
 S6e2xf889ZnD6/FF/lVHD12pe/kvNdryR3zwNsY5V7tc7PRP/wi1zxHXM//5rWMqd76FtdXK
 E62ivap5FVu10q+U3dznt8Sys+dZxrJV1i81HnRprK07ZH4qeEPVbW3vUyV50/5NOCDr2/Xm
 UZfInN9bWDJ8NE+nuCixFGckGmoxFxUnAgBltq+6qgIAAA==
X-CMS-MailID: 20200618154038eucas1p18eae40b8fbf97a3e42abef8eb14da946
X-Msg-Generator: CA
X-RootMTR: 20200618154038eucas1p18eae40b8fbf97a3e42abef8eb14da946
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154038eucas1p18eae40b8fbf97a3e42abef8eb14da946
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154038eucas1p18eae40b8fbf97a3e42abef8eb14da946@eucas1p1.samsung.com>
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

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c | 2 +-
 drivers/media/pci/cx88/cx88-alsa.c       | 2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index df44ed7393a0..3f366e4e4685 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -129,7 +129,7 @@ static int cx23885_alsa_dma_unmap(struct cx23885_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, PCI_DMA_FROMDEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 301616426d8a..c40304d33776 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -193,7 +193,7 @@ static int cx25821_alsa_dma_unmap(struct cx25821_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, PCI_DMA_FROMDEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 7d7aceecc985..3c6fe6ceb0b7 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -332,7 +332,7 @@ static int cx88_alsa_dma_unmap(struct cx88_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen,
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages,
 		     PCI_DMA_FROMDEVICE);
 	buf->sglen = 0;
 	return 0;
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index 544ca57eee75..398c47ff473d 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -313,7 +313,7 @@ static int saa7134_alsa_dma_unmap(struct saa7134_dev *dev)
 	if (!dma->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->nr_pages, PCI_DMA_FROMDEVICE);
 	dma->sglen = 0;
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
