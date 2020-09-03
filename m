Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124DA25C224
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 16:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802386E03B;
	Thu,  3 Sep 2020 14:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2940A6E03B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 14:05:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D3F8113E;
 Thu,  3 Sep 2020 07:05:22 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B36173F71F;
 Thu,  3 Sep 2020 07:05:21 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Set DMA max segment size
To: Robin Murphy <robin.murphy@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com
References: <04371bc36512076b7feee07f854e56b80675d953.1599141563.git.robin.murphy@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b36daadb-cddb-8412-af58-58bb4be0fa55@arm.com>
Date: Thu, 3 Sep 2020 15:05:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04371bc36512076b7feee07f854e56b80675d953.1599141563.git.robin.murphy@arm.com>
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/09/2020 14:59, Robin Murphy wrote:
> Since all we do with scatterlists is map them in the MMU, we don't have
> any hardware constraints on how they're laid out. Let the DMA layer know
> so it won't warn when DMA API debugging is enabled.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f2c1ddc41a9b..9a5c85a7d341 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -343,6 +343,7 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>   
>   	dma_set_mask_and_coherent(pfdev->dev,
>   		DMA_BIT_MASK(FIELD_GET(0xff00, pfdev->features.mmu_features)));
> +	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
>   
>   	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
>   	if (irq <= 0)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
