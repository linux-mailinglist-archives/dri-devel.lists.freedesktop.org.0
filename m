Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1B464E34
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3096E5BF;
	Wed,  1 Dec 2021 12:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E41E66E5BF;
 Wed,  1 Dec 2021 12:50:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 156311477;
 Wed,  1 Dec 2021 04:50:22 -0800 (PST)
Received: from [10.57.34.58] (unknown [10.57.34.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69C663F694;
 Wed,  1 Dec 2021 04:50:20 -0800 (PST)
Message-ID: <25915a21-57f2-adbd-cfc2-1a2bc2a1a5e7@arm.com>
Date: Wed, 1 Dec 2021 12:50:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
Content-Language: en-GB
To: Michael Walle <michael@walle.cc>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210907164945.2309815-1-michael@walle.cc>
 <20210907164945.2309815-4-michael@walle.cc>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20210907164945.2309815-4-michael@walle.cc>
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
Cc: David Airlie <airlied@linux.ie>, Marek Vasut <marek.vasut@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Lukas F . Hartmann" <lukas@mntre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry I missed this earlier...

On 2021-09-07 17:49, Michael Walle wrote:
> The STLB and the first command buffer (which is used to set up the TLBs)
> has a 32 bit size restriction in hardware. There seems to be no way to
> specify addresses larger than 32 bit. Keep it simple and restict the
> addresses to the lower 4 GiB range for all coherent DMA memory
> allocations.
> 
> Please note, that platform_device_alloc() will initialize dev->dma_mask
> to point to pdev->platform_dma_mask, thus dma_set_mask() will work as
> expected.
> 
> While at it, move the dma_mask setup code to the of_dma_configure() to
> keep all the DMA setup code next to each other.
> 
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 54eb653ca295..0b756ecb1bc2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -613,6 +613,24 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>   			component_match_add(dev, &match, compare_str, names[i]);
>   	}
>   
> +	/*
> +	 * PTA and MTLB can have 40 bit base addresses, but
> +	 * unfortunately, an entry in the MTLB can only point to a
> +	 * 32 bit base address of a STLB. Moreover, to initialize the
> +	 * MMU we need a command buffer with a 32 bit address because
> +	 * without an MMU there is only an indentity mapping between
> +	 * the internal 32 bit addresses and the bus addresses.
> +	 *
> +	 * To make things easy, we set the dma_coherent_mask to 32
> +	 * bit to make sure we are allocating the command buffers and
> +	 * TLBs in the lower 4 GiB address space.
> +	 */
> +	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
> +	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {

Since AFAICS you're not changing the default dma_mask pointer to point 
to some storage other than the coherent mask, the dma_set_mask() call 
effectively does nothing and both masks will end up reading back as 32 bits.

Robin.

> +		dev_dbg(&pdev->dev, "No suitable DMA available\n");
> +		return -ENODEV;
> +	}
> +
>   	/*
>   	 * Apply the same DMA configuration to the virtual etnaviv
>   	 * device as the GPU we found. This assumes that all Vivante
> @@ -671,8 +689,6 @@ static int __init etnaviv_init(void)
>   			of_node_put(np);
>   			goto unregister_platform_driver;
>   		}
> -		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> -		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
>   
>   		ret = platform_device_add(pdev);
>   		if (ret) {
> 
