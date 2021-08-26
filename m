Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7F3F8A9D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 17:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2636E873;
	Thu, 26 Aug 2021 15:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E9226E872;
 Thu, 26 Aug 2021 15:00:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D46F31B;
 Thu, 26 Aug 2021 08:00:24 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 635F03F66F;
 Thu, 26 Aug 2021 08:00:22 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual
 device
To: Michael Walle <michael@walle.cc>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-3-michael@walle.cc>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <df806090-8a21-33e8-1e01-bd03b6ed64cf@arm.com>
Date: Thu, 26 Aug 2021 16:00:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826121006.685257-3-michael@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 2021-08-26 13:10, Michael Walle wrote:
> The DMA configuration of the virtual device is inherited from the first
> actual etnaviv device. Unfortunately, this doesn't work with an IOMMU:
> 
> [    5.191008] Failed to set up IOMMU for device (null); retaining platform DMA ops
> 
> This is because there is no associated iommu_group with the device. The
> group is set in iommu_group_add_device() which is eventually called by
> device_add() via the platform bus:
>    device_add()
>      blocking_notifier_call_chain()
>        iommu_bus_notifier()
>          iommu_probe_device()
>            __iommu_probe_device()
>              iommu_group_get_for_dev()
>                iommu_group_add_device()
> 
> Move of_dma_configure() into the probe function, which is called after
> device_add(). Normally, the platform code will already call it itself
> if .of_node is set. Unfortunately, this isn't the case here.
> 
> Also move the dma mask assignemnts to probe() to keep all DMA related
> settings together.

I assume the driver must already keep track of the real GPU platform 
device in order to map registers, request interrupts, etc. correctly - 
can't it also correctly use that device for DMA API calls and avoid the 
need for these shenanigans altogether?

FYI, IOMMU configuration is really supposed to *only* run at 
add_device() time as above - the fact that it's currently hooked in to 
be retriggered by of_dma_configure() on DT platforms actually turns out 
to lead to various issues within the IOMMU API, and the plan to change 
that is slowly climbing up my to-do list.

Robin.

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 2509b3e85709..ff6425f6ebad 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -589,6 +589,7 @@ static int compare_str(struct device *dev, void *data)
>   static int etnaviv_pdev_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct device_node *first_node = NULL;
>   	struct component_match *match = NULL;
>   
>   	if (!dev->platform_data) {
> @@ -598,6 +599,9 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>   			if (!of_device_is_available(core_node))
>   				continue;
>   
> +			if (!first_node)
> +				first_node = core_node;
> +
>   			drm_of_component_match_add(&pdev->dev, &match,
>   						   compare_of, core_node);
>   		}
> @@ -609,6 +613,17 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>   			component_match_add(dev, &match, compare_str, names[i]);
>   	}
>   
> +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> +	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> +
> +	/*
> +	 * Apply the same DMA configuration to the virtual etnaviv
> +	 * device as the GPU we found. This assumes that all Vivante
> +	 * GPUs in the system share the same DMA constraints.
> +	 */
> +	if (first_node)
> +		of_dma_configure(&pdev->dev, first_node, true);
> +
>   	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
>   }
>   
> @@ -659,15 +674,6 @@ static int __init etnaviv_init(void)
>   			of_node_put(np);
>   			goto unregister_platform_driver;
>   		}
> -		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> -		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> -
> -		/*
> -		 * Apply the same DMA configuration to the virtual etnaviv
> -		 * device as the GPU we found. This assumes that all Vivante
> -		 * GPUs in the system share the same DMA constraints.
> -		 */
> -		of_dma_configure(&pdev->dev, np, true);
>   
>   		ret = platform_device_add(pdev);
>   		if (ret) {
> 
