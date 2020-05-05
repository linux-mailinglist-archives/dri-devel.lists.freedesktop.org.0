Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010EA1C50F6
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DB36E5A3;
	Tue,  5 May 2020 08:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58EC6E59F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084639euoutp014636efa3bf63cbaf9bbd1876fc228793~MFX4HHOsW0374903749euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084639euoutp014636efa3bf63cbaf9bbd1876fc228793~MFX4HHOsW0374903749euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668399;
 bh=2O1dDvBYCdh6BPLh387jv2UbKzqeI6gCytCumofPH4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XA/QgjysUxHcGWz9IvJh5dw/hVYOAhN47VJujHy+fR1sZHonbvdVZgjHwDONvJGEq
 /nQTH3s4RJ33VRWmBdTgzLN0NeBdocxvM8Un1Lt2lm/P1p3j2boG8lt+301vNjz0bt
 /D43D815rQEDEjCNXkvgTLpsvgqAkvlFL0630tgE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084639eucas1p173a8284f2be074a153c2404e7f655dbd~MFX33JwHZ2423024230eucas1p1K;
 Tue,  5 May 2020 08:46:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 27.11.60698.FE721BE5; Tue,  5
 May 2020 09:46:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084638eucas1p2d4add214063543248d81c0977e3f1823~MFX3e70vA0589305893eucas1p2K;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084638eusmtrp100d54f7ca6d5967537629b8f97c7a226~MFX3eOdJ50942509425eusmtrp1e;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-57-5eb127ef2573
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F3.31.07950.EE721BE5; Tue,  5
 May 2020 09:46:38 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084638eusmtip135ec21b69c87a6f86b3072ab66aaeb78~MFX27jDnJ0686606866eusmtip1P;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 25/25] media: pci: fix common ALSA DMA-mapping related codes
Date: Tue,  5 May 2020 10:46:14 +0200
Message-Id: <20200505084614.30424-25-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRju27nsODY5TcEPC42BiV10YuQhSwqMDkSQ/ekiLaceVHJTdtTS
 kCxZ5LxkWnlJxMQ0ndfNSyheNvKWubyhRoqa/khLlOY0RbTNo/bveZ/3ed7n4eMjELEBcyYi
 lbGMSimPkuACtKl7w3R62b1eJh3+bU9lmPp4VH1eLUbtNL1EqFHLMk5VaLt41FD+FEoVd/hR
 q6OzPEo3N4ZRIy2FOJVe14hR1Z+m+FSZbotHGVbmsYv2dFVRFaDb1opRWleZitPNazMYPZ3W
 w6P1pY/p79tzCJ0zUQ7o1m/JOJ3ZUAlos86F/mwx868L7wjOhzFRkfGMyss/WBAxMG5CY8ad
 Hhb3qdFk0OGoAXYEJM/AhYplXAMEhJj8AOCv6SaEG1YBLB1o4XGDGcAn71Z4+5afmWOAW5QD
 uP6mDT+wzPa2YjYVTnpDzZIGt2FHUg1gb4bQJkLITATqM/OAbeFABsLuxfbdsyjpBi2vu1Eb
 FpH+cOvPGsLFuUJtXecutrPyc8OTu2mQHObD5IwZnBMFwNEN857BAS72NPA5fBT256SjnCHF
 Ws9UzeeGdABHnnI1IOkHJ02b1kuEtZ8HrG3x4uhLcLC7j2+jIWkPJ5YO22jECrObchGOFsHn
 z8Sc+jgs6Kk5iDUMDu9JaKhuceUeqAtAfaMOzQKuBf+zigGoBE5MHKsIZ1gfJfPAk5Ur2Dhl
 uGdotEIHrB+rf7vH8hG0b4UYAUkAiVB0y1wrE2PyeDZBYQSQQCSOorK/dTKxKEyekMioou+p
 4qIY1giOEKjESeRTsnBXTIbLY5n7DBPDqPa3PMLOORmkCGtuT92kjilrcoKMuOmKzzVPbLXh
 kCLplODVSkCrtNV9KWvW14EudJsLufHoi/QHcdZuJzyNFKpj00yBlhfaXEN2c2LGquFykTa6
 flCqye+sKFyfz52v0yddOCfzGJK+vZpSEvy+Pn3B/NV3M5RNHRHKnF2IzeD45bCgk0YJykbI
 vU8gKlb+DzuMqDFUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7rv1DfGGdy6ZGrRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllcnHmXxWLBfmuLL1ceMllsenyN1eLyrjlsFj0btrJarD1yl91i
 2aY/TBYHPzxhdeDzWDNvDaPH3m8LWDw2repk89j+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k5zHqa+f2QN4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQyzl4/x1JwXbxiwclWlgbG/SJdjJwcEgImEi/6rjGC2EICSxkl
 5jRXQ8RlJE5Oa2CFsIUl/lzrYuti5AKq+cQocab/DQtIgk3AUKLrLURCRKCTUWJa90d2EIdZ
 YBqzxMLG50AZDg5hAX+JrjtuIA0sAqoSX6ceA2vmFbCT+PPpGzPEBnmJ1RsOgNmcQPHHl+6w
 QVxUKPHh/HfWCYx8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRGz7ZjP7fsYOx6F3yI
 UYCDUYmHd8PX9XFCrIllxZW5hxglOJiVRHiX/dgQJ8SbklhZlVqUH19UmpNafIjRFOioicxS
 osn5wMjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA6N0Yt7zI
 OdP+vit/V94TgaYHBw/y8z1MeNvfLKL97+ZM/VpH2/Kb4fMi33H3Pvpw6fU1E2lvQ743ryd9
 4HhyXLW60anTeX3X4ewMBXHpqcafGY3SLLm3hO+5ImIg0/vbdyGrG5NK3rUehcRJbx4xGWcZ
 CK6enSEjFDvlrwAnm7Tzup2MV6cosRRnJBpqMRcVJwIAa5fl0bQCAAA=
X-CMS-MailID: 20200505084638eucas1p2d4add214063543248d81c0977e3f1823
X-Msg-Generator: CA
X-RootMTR: 20200505084638eucas1p2d4add214063543248d81c0977e3f1823
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084638eucas1p2d4add214063543248d81c0977e3f1823
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084638eucas1p2d4add214063543248d81c0977e3f1823@eucas1p2.samsung.com>
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c | 2 +-
 drivers/media/pci/cx88/cx88-alsa.c       | 2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index df44ed7..3f366e4 100644
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
index 3016164..c40304d 100644
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
index 7d7acee..3c6fe6c 100644
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
index 544ca57..398c47f 100644
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
