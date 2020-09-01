Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F98259FEE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 22:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED92D6E2D1;
	Tue,  1 Sep 2020 20:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABE526E2D1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 20:24:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BAF91063;
 Tue,  1 Sep 2020 13:24:49 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C94E3F66F;
 Tue,  1 Sep 2020 13:24:47 -0700 (PDT)
Subject: Re: [PATCH v9 31/32] media: pci: fix common ALSA DMA-mapping related
 codes
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063629eucas1p1a3c9c93e281b4c432a6d9940e734e3c4@eucas1p1.samsung.com>
 <20200826063316.23486-32-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <925232f3-7371-c7eb-ad31-4b041cbbca4f@arm.com>
Date: Tue, 1 Sep 2020 21:24:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-32-m.szyprowski@samsung.com>
Content-Language: en-GB
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
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-26 07:33, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
> numer of the created entries in the DMA address space. However the
> subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
> called with the original number of entries passed to dma_map_sg. The
> sg_table->nents in turn holds the result of the dma_map_sg call as stated
> in include/linux/scatterlist.h. Adapt the code to obey those rules.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/pci/cx23885/cx23885-alsa.c | 2 +-
>   drivers/media/pci/cx25821/cx25821-alsa.c | 2 +-
>   drivers/media/pci/cx88/cx88-alsa.c       | 2 +-
>   drivers/media/pci/saa7134/saa7134-alsa.c | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
> index df44ed7393a0..3f366e4e4685 100644
> --- a/drivers/media/pci/cx23885/cx23885-alsa.c
> +++ b/drivers/media/pci/cx23885/cx23885-alsa.c
> @@ -129,7 +129,7 @@ static int cx23885_alsa_dma_unmap(struct cx23885_audio_dev *dev)
>   	if (!buf->sglen)
>   		return 0;
>   
> -	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, PCI_DMA_FROMDEVICE);

If we're touching these lines anyway, we should update them to use the 
modern DMA_FROM_DEVICE definitions too.

Robin.

>   	buf->sglen = 0;
>   	return 0;
>   }
> diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
> index 301616426d8a..c40304d33776 100644
> --- a/drivers/media/pci/cx25821/cx25821-alsa.c
> +++ b/drivers/media/pci/cx25821/cx25821-alsa.c
> @@ -193,7 +193,7 @@ static int cx25821_alsa_dma_unmap(struct cx25821_audio_dev *dev)
>   	if (!buf->sglen)
>   		return 0;
>   
> -	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, PCI_DMA_FROMDEVICE);
>   	buf->sglen = 0;
>   	return 0;
>   }
> diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
> index 7d7aceecc985..3c6fe6ceb0b7 100644
> --- a/drivers/media/pci/cx88/cx88-alsa.c
> +++ b/drivers/media/pci/cx88/cx88-alsa.c
> @@ -332,7 +332,7 @@ static int cx88_alsa_dma_unmap(struct cx88_audio_dev *dev)
>   	if (!buf->sglen)
>   		return 0;
>   
> -	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen,
> +	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages,
>   		     PCI_DMA_FROMDEVICE);
>   	buf->sglen = 0;
>   	return 0;
> diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
> index 544ca57eee75..398c47ff473d 100644
> --- a/drivers/media/pci/saa7134/saa7134-alsa.c
> +++ b/drivers/media/pci/saa7134/saa7134-alsa.c
> @@ -313,7 +313,7 @@ static int saa7134_alsa_dma_unmap(struct saa7134_dev *dev)
>   	if (!dma->sglen)
>   		return 0;
>   
> -	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->sglen, PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->nr_pages, PCI_DMA_FROMDEVICE);
>   	dma->sglen = 0;
>   	return 0;
>   }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
