Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31A1CF088
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430136E8F7;
	Tue, 12 May 2020 09:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4A76E8EC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090130euoutp025f86e60f94b0efd7c6969521e1cdfe7d~OPF1x6LK30453404534euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090130euoutp025f86e60f94b0efd7c6969521e1cdfe7d~OPF1x6LK30453404534euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274090;
 bh=iwqRA9IvBA5qQavTtN7IR44wij+dBMBZyJPEuCzIDiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b2ll6vqMSYmUcasvZ7VDmEXKlVWs8C+0jIarYXcSX/ot50IHeukwvnvpbPWXfzeQR
 bL2jCAkimTsh2szqRK6D9YhNkuey3uVV0cMo5nWN9nT0812r4lr3C4eI/f9FntFE77
 a49wlkFSmsGPPcqkE8mEpaHNqsmH48+H1WCV9YZQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090130eucas1p2897fb3e554831018d8d3e374c3c0d8e3~OPF1bW0cU2669826698eucas1p2q;
 Tue, 12 May 2020 09:01:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EA.32.60679.AE56ABE5; Tue, 12
 May 2020 10:01:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401~OPF1K2gSn0961809618eucas1p2x;
 Tue, 12 May 2020 09:01:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090129eusmtrp2483d9a5cf050f3efa891592bc516305d~OPF1KE-1n0472704727eusmtrp2b;
 Tue, 12 May 2020 09:01:29 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-e5-5eba65eab4c4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.55.08375.9E56ABE5; Tue, 12
 May 2020 10:01:29 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090129eusmtip182420fa16f115009ac06b2958ce7d00e~OPF0lpsRC1352513525eusmtip1S;
 Tue, 12 May 2020 09:01:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 37/38] media: pci: fix common ALSA DMA-mapping related codes
Date: Tue, 12 May 2020 11:00:57 +0200
Message-Id: <20200512090058.14910-37-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSaUhUURiGO3OXuS5j11HwaJIwaaCQW0E3FMmIuj/6kS2EQdaYN5Wc0WZc
 MqRGcx0X0sCN0ElEc0tnNJcp05F0UtPcMMXd8YcKmjZqaKI53sn+Pd/7vd95z/k4BMJvw+yI
 UHEkIxELwwS4KdrYtf39zDKjDnCvmSaozP5uDqXMr8Wo/cZshBrZ/IlTFVWdHGqwYAqlFG1e
 1MbIHIdS6UYxalj9Bqcy6j5gVM2XKS5VptrlUJq1BeyiBV1dVA3o1i0FSqsq03C6aWsWo2fS
 tRy6vvQFPbGnQ+jXY+WA/jguw+mshkpA61Un6Z5NPfe6+V1T7yAmLDSakbj5PDANmdBrsAg5
 fJquLERkYN1aDggCkudg67ijHJgSfPIdgD05kwhbbADYVbZoLPQAZm+lAjkwOZzQtSYBtlEO
 4PQnBXY0UiJbPHThpAeUr8hxA1uTSQB+zTQ3mBAyC4H1WfmHJivSD1bMpKEGRkkn+Kt3iWNg
 HukD1+V6hI1zgFV17YdscqDPFO+irD7Eha2TgSxfhoNKBZdlK7isbTCyPdxvKeYYgiH5EsC5
 /houW2QAOJyQb3yQF5zs38EN60BIZ1irdmM34wuXq2+zaAHHViwNZuQAcxrzEFbmwdRkPnvG
 aViofX+UqhkYMt6ehqvjjcZldQKo1/1BXgGHwv9ZCgAqgQ0TJRUFM1JPMRPjKhWKpFHiYNeH
 4SIVOPhWvXvajWag3g3sACQBBOY8d/eWAD4mjJbGijoAJBCBNS8x9EDiBQljnzGS8PuSqDBG
 2gFOEKjAhne2ZOkenwwWRjKPGSaCkfzrcggTOxmIk0WcP24Vovq2cIyfa/sk4bdNZF7KjSJd
 fptj+8C2WXOi02pf3C2ZpUv8zDVuclmpd5ZaQ8c/GnW+MjVBXvJP2UFK5ufRcovn/KvlyuSE
 PlWuL7z5WTsrrlGrF8HatJlfTIg/Xv2221PnWrB2qufOBXtsd6NjtEnkQ9v+2CIFqDRE6OGC
 SKTCv8NFiCtSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xu7ovU3fFGSy7YGzRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllcnHmXxWLBfmuLL1ceMllsenyN1eLyrjlsFj0btrJarD1yl91i
 2aY/TBYHPzxhdeDzWDNvDaPH3m8LWDw2repk89j+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k5zHqa+f2QN4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQybn8+yFrQJVHRvXEWcwPjR5EuRk4OCQETicd7Wxm7GLk4hASW
 Mkp0v5rAApGQkTg5rYEVwhaW+HOtiw2i6BOjxJ2z98CK2AQMJbreQiREBDoZJaZ1f2QHcZgF
 pjFLLGx8zgZSJSzgL7HmeA8TiM0ioCrx6fRLMJtXwE7iY9dnZogV8hKrNxwAszmB4vfn/wHb
 ICRQKPHo6luWCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG0LZjPzfvYLy0MfgQ
 owAHoxIPb4fRzjgh1sSy4srcQ4wSHMxKIrwtmUAh3pTEyqrUovz4otKc1OJDjKZAR01klhJN
 zgdGd15JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkZ9vWJFyWb3
 iMudHjO2Ltn8zmP3ogXLczyLpflsTvEevzptkR3DpTnOUrtb7i/LfDXrzN8pdpsntd7fJTn7
 bb1Rc6/jMytxp2dMW3bVRu++WdQx9+vK7Bdlm87fe32nkH+TdFpOb4Vl43zDqE23NQJ2Hncs
 +jTPoTb9ttdhs4UGOqYrLZfvShFSYinOSDTUYi4qTgQAgDAZQ7YCAAA=
X-CMS-MailID: 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401
X-Msg-Generator: CA
X-RootMTR: 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401@eucas1p2.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
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
