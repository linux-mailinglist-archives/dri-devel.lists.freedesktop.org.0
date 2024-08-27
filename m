Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DF9609DF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 14:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E94610E2FB;
	Tue, 27 Aug 2024 12:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D26A910E2FB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 12:19:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D0DCDA7;
 Tue, 27 Aug 2024 05:19:43 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 185FF3F762;
 Tue, 27 Aug 2024 05:19:14 -0700 (PDT)
Message-ID: <92ebdc16-7938-462a-bb0e-4d5d368c5eb1@arm.com>
Date: Tue, 27 Aug 2024 13:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] scsi: check that busses support the DMA API before
 setting dma parameters
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org
References: <20240824034925.1163244-1-hch@lst.de>
 <20240824034925.1163244-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240824034925.1163244-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2024 4:49 am, Christoph Hellwig wrote:
> We'll start throwing warnings soon when dma_set_seg_boundary and
> dma_set_max_seg_size are called on devices for buses that don't fully
> support the DMA API.  Prepare for that by making the calls in the SCSI
> midlayer conditional.

Just thinking ahead, might it be worth a logical "are SG segment limits 
relevant?" wrapper around the dev->dma_parms reference? Not a big deal 
for now if we think this site is the only user, so either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/scsi/scsi_lib.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 3958a6d14bf457..7f0394c4492033 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -1988,8 +1988,15 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
>   	if (shost->no_highmem)
>   		lim->features |= BLK_FEAT_BOUNCE_HIGH;
>   
> -	dma_set_seg_boundary(dev, shost->dma_boundary);
> -	dma_set_max_seg_size(dev, shost->max_segment_size);
> +	/*
> +	 * Propagate the DMA formation properties to the dma-mapping layer as
> +	 * a courtesy service to the LLDDs.  This needs to check that the buses
> +	 * actually support the DMA API first, though.
> +	 */
> +	if (dev->dma_parms) {
> +		dma_set_seg_boundary(dev, shost->dma_boundary);
> +		dma_set_max_seg_size(dev, shost->max_segment_size);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(scsi_init_limits);
>   
