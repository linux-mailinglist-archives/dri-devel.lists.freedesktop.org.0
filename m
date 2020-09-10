Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13309264181
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECE689E11;
	Thu, 10 Sep 2020 09:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA98C89E11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:21:40 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id GIltkYuMnPTBMGIlukQbGe; Thu, 10 Sep 2020 11:21:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1599729699; bh=sUGEW/U5E0cvzvWuMOTakAeSmgZz++wx9LaBD4cbHO4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Z8eNIqrxHQeJbgvslk+iSbo8GaNpRZdwPvTEVQtfomRv2SEx7BakMAHfSvWl/IYMx
 HSVxiQeRpAGhD5+E4oTRDkIkeUQ3DETJCru1z+GcCTa6MwoNfrj2LxgrqX0aTw+LrP
 3LzDBLX4AJh4+ka9w2vyqXig764FUDCYBnKOJU7Zl5tvtFVLEYB5qLDDNiChkwqEcR
 kTRM55BoFwvdw37vVDZFPCROTWy+Fngv4h96C80AlHmzcpeKis2xCcW8Ohdo9FzQOO
 iFYeV0PwC+vx79lAk4V9Ta8VVBvLDB50eqMKFJc7fQ0YpCRub5/xO8MEkho+j3LcY4
 3RQAoBZRyvOnA==
Subject: Re: [PATCH v10 29/30] media: pci: fix common ALSA DMA-mapping related
 codes
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133511eucas1p2359dd080181340eb4f24b325e75a4c68@eucas1p2.samsung.com>
 <20200904131711.12950-30-m.szyprowski@samsung.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1215926b-d9d9-4dbe-4621-717151c41a45@xs4all.nl>
Date: Thu, 10 Sep 2020 11:21:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904131711.12950-30-m.szyprowski@samsung.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfG1kHPDqJjfReFCfxwg6VMaCSTVPGKLwVybyvVlhVzmrDjjVt+DkArAkO5encqdPow6Q0qfjZXmaTDKmUSKeGHv9Ejtdby7M2U4X4ifsI+PI/AHAXyHl
 SNPw3umupvyD3Y343QC2Syt5RRFMAQDuoZezMEPEANfS7jIX03Wc6Behr1MaQvwOH95z78xqkPU9cemwgEUXgASyvIs3OBlhUXmq2lMOX6VvE2CH8UAO+vrd
 1OaSQqw3lL9fmD4r4XyD4H5vitHINwbqctQYgPdpDFHXzs1zlTXnC58neuBm+3zoE9cpvZrhgAof0ztBZWVog7BgLXrxdV4C4UF+yLTpH3xMgh+ovVGyClH8
 0o7TK81EQZ842FXZWCwd/j6nCjx4zw46MKNFvd22IBx/2+AbskZvUJ4YkCqOnDaap9UmHG+PsJRjESghHBMzQxAMdJur195qs8tnZkuJm0kc2hgPsIIpbKJk
 v1U/xdSWzxKqy8xll0s8d2lOhwXvkrPZLfxubDI9ACooGPNhTt0pM2jjzs3DNBjKtlubO5R+9V6G92pT8WgZ1AWfMYWI+ptU2O9aJwejyGCLYuYzU/uQHx0X
 TWBzDPqB8A8SmaeMfGOXLKUVbvJBc0fgqEkXOB5vFo/STWKM1+QfB8Wiqp1h/Er0bjpTpRbjYuvdY2E/24LOVC5i9YSJAcKQl/z2lb0w4KJpbIXeXSHlGtC8
 N6LTmbX5h4Q=
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
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/09/2020 15:17, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
> numer of the created entries in the DMA address space. However the

numer -> number

> subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
> called with the original number of entries passed to dma_map_sg. The
> sg_table->nents in turn holds the result of the dma_map_sg call as stated
> in include/linux/scatterlist.h. Adapt the code to obey those rules.
> 
> While touching this code, update it to use the modern DMA_FROM_DEVICE
> definitions.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/pci/cx23885/cx23885-alsa.c | 4 ++--
>  drivers/media/pci/cx25821/cx25821-alsa.c | 4 ++--
>  drivers/media/pci/cx88/cx88-alsa.c       | 6 +++---
>  drivers/media/pci/saa7134/saa7134-alsa.c | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
> index df44ed7393a0..c797bff6eebb 100644
> --- a/drivers/media/pci/cx23885/cx23885-alsa.c
> +++ b/drivers/media/pci/cx23885/cx23885-alsa.c
> @@ -113,7 +113,7 @@ static int cx23885_alsa_dma_map(struct cx23885_audio_dev *dev)
>  	struct cx23885_audio_buffer *buf = dev->buf;
>  
>  	buf->sglen = dma_map_sg(&dev->pci->dev, buf->sglist,
> -			buf->nr_pages, PCI_DMA_FROMDEVICE);
> +			buf->nr_pages, DMA_FROM_DEVICE);
>  
>  	if (0 == buf->sglen) {
>  		pr_warn("%s: cx23885_alsa_map_sg failed\n", __func__);
> @@ -129,7 +129,7 @@ static int cx23885_alsa_dma_unmap(struct cx23885_audio_dev *dev)
>  	if (!buf->sglen)
>  		return 0;
>  
> -	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, DMA_FROM_DEVICE);
>  	buf->sglen = 0;
>  	return 0;
>  }
> diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
> index 301616426d8a..8da31c953b02 100644
> --- a/drivers/media/pci/cx25821/cx25821-alsa.c
> +++ b/drivers/media/pci/cx25821/cx25821-alsa.c
> @@ -177,7 +177,7 @@ static int cx25821_alsa_dma_map(struct cx25821_audio_dev *dev)
>  	struct cx25821_audio_buffer *buf = dev->buf;
>  
>  	buf->sglen = dma_map_sg(&dev->pci->dev, buf->sglist,
> -			buf->nr_pages, PCI_DMA_FROMDEVICE);
> +			buf->nr_pages, DMA_FROM_DEVICE);
>  
>  	if (0 == buf->sglen) {
>  		pr_warn("%s: cx25821_alsa_map_sg failed\n", __func__);
> @@ -193,7 +193,7 @@ static int cx25821_alsa_dma_unmap(struct cx25821_audio_dev *dev)
>  	if (!buf->sglen)
>  		return 0;
>  
> -	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, DMA_FROM_DEVICE);
>  	buf->sglen = 0;
>  	return 0;
>  }
> diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
> index 7d7aceecc985..d38633bc1330 100644
> --- a/drivers/media/pci/cx88/cx88-alsa.c
> +++ b/drivers/media/pci/cx88/cx88-alsa.c
> @@ -316,7 +316,7 @@ static int cx88_alsa_dma_map(struct cx88_audio_dev *dev)
>  	struct cx88_audio_buffer *buf = dev->buf;
>  
>  	buf->sglen = dma_map_sg(&dev->pci->dev, buf->sglist,
> -			buf->nr_pages, PCI_DMA_FROMDEVICE);
> +			buf->nr_pages, DMA_FROM_DEVICE);
>  
>  	if (buf->sglen == 0) {
>  		pr_warn("%s: cx88_alsa_map_sg failed\n", __func__);
> @@ -332,8 +332,8 @@ static int cx88_alsa_dma_unmap(struct cx88_audio_dev *dev)
>  	if (!buf->sglen)
>  		return 0;
>  
> -	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen,
> -		     PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages,
> +		     DMA_FROM_DEVICE);
>  	buf->sglen = 0;
>  	return 0;
>  }
> diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
> index 544ca57eee75..707ca77221dc 100644
> --- a/drivers/media/pci/saa7134/saa7134-alsa.c
> +++ b/drivers/media/pci/saa7134/saa7134-alsa.c
> @@ -297,7 +297,7 @@ static int saa7134_alsa_dma_map(struct saa7134_dev *dev)
>  	struct saa7134_dmasound *dma = &dev->dmasound;
>  
>  	dma->sglen = dma_map_sg(&dev->pci->dev, dma->sglist,
> -			dma->nr_pages, PCI_DMA_FROMDEVICE);
> +			dma->nr_pages, DMA_FROM_DEVICE);
>  
>  	if (0 == dma->sglen) {
>  		pr_warn("%s: saa7134_alsa_map_sg failed\n", __func__);
> @@ -313,7 +313,7 @@ static int saa7134_alsa_dma_unmap(struct saa7134_dev *dev)
>  	if (!dma->sglen)
>  		return 0;
>  
> -	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->sglen, PCI_DMA_FROMDEVICE);
> +	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->nr_pages, DMA_FROM_DEVICE);
>  	dma->sglen = 0;
>  	return 0;
>  }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
