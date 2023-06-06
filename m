Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7F724992
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 18:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96E910E380;
	Tue,  6 Jun 2023 16:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203410E164;
 Tue,  6 Jun 2023 16:56:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C90360DC6;
 Tue,  6 Jun 2023 16:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703B7C433EF;
 Tue,  6 Jun 2023 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686070585;
 bh=BMLu36IUxc37ZvQrMJzCtwSNIiamnJhdBBXZkaVnkNE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Z7L6fecYO4lOQInrlHAHPHvFzV0S2X7Knd2LX16/DGrdNrKqwswkAC5UUeKvJlGgh
 Q2zuJ0K7PHz5erFPfNbK8OvphlZxXta+Fcr+mkj0AYnO2Zf0LtFbGHH9c/HxdW3aw6
 /JVC7skLOkxT5x6FSoGf/xVlwgK2oP7ZRiFs12rHNyRSun/4qA+cgsLvEKhtNa1Y6R
 q/7jUuJ4cUR9rfXThhWx6xl1x7acWupiy+x0upIxUKs3Lh1ieim3FuS2rxosAlt3Kf
 rkHUvtGV1frQTzXIQfYnJdfFvN+SlSot00cruDxOjH3Ga45dE4B8lMS+FQW+vPn/bV
 Jkfnj5sh8bnDg==
Date: Tue, 6 Jun 2023 11:56:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v7 7/7] drm/etnaviv: add support for the dma coherent
 device
Message-ID: <20230606165624.GA1127373@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230603105943.3042766-8-15330273260@189.cn>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 03, 2023 at 06:59:43PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> Loongson CPUs maintain cache coherency by hardware, which means that the
> data in the CPU cache is identical to the data in main system memory. As
> for the peripheral device, most of Loongson chips chose to define the
> peripherals as DMA coherent by default, device drivers do not need to
> maintain the coherency between a processor and an I/O device manually.
> 
> There are exceptions, for LS2K1000 SoC, part of peripheral device can be
> configured as dma non-coherent. But there is no released version of such
> firmware exist in the market. Peripherals of older ls2k1000 is also DMA
> non-conherent, but they are nearly outdated. So, those are trivial cases.

s/dma/DMA/
s/non-conherent/non-coherent/
s/ls2k1000/LS2K1000/

I guess when you say these are "trivial cases," you mean you don't
care about supporting those devices?

> Nevertheless, kernel space still need to do probe work, because vivante GPU
> IP has been integrated into various platform. Hence, this patch add runtime
> detection code to probe if a specific gpu is DMA coherent, If the answer is
> yes, we are going to utilize such features. On Loongson platfform, When a
> buffer is accesed by both the GPU and the CPU, The driver should prefer
> ETNA_BO_CACHED over ETNA_BO_WC.

s/gpu/GPU/
s/platfform/platform/
s/accesed/accessed/

I guess the only way to discover this coherency attribute is via the
DT "vivante,gc" property?  Seems a little weird but I'm really not a
DT person.

> This patch also add a new parameter: etnaviv_param_gpu_coherent, which
> allow userspace to know if such a feature is available. Because
> write-combined BO is still preferred in some case, especially where don't
> need CPU read, for example, uploading shader bin.
> ...

> +static struct device_node *etnaviv_of_first_available_node(void)
> +{
> +	struct device_node *core_node;
> +
> +	for_each_compatible_node(core_node, NULL, "vivante,gc") {
> +		if (!of_device_is_available(core_node))
> +			continue;
> +
> +		return core_node;
> +	}
> +
> +	return NULL;

Seems like this would be simpler as:

  for_each_compatible_node(core_node, NULL, "vivante,gc") {
    if (of_device_is_available(core_node))
      return core_node;
  }

  return NULL;

> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/dma-fence.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-map-ops.h>

It looks like this #include might not be needed?  You're only adding a
new reference to priv->dma_coherent, which looks like it was added to
etnaviv_drv.h.

>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -164,6 +165,10 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
>  		*value = gpu->identity.eco_id;
>  		break;
>  
> +	case ETNAVIV_PARAM_GPU_COHERENT:
> +		*value = priv->dma_coherent;
> +		break;
> +
>  	default:
>  		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
>  		return -EINVAL;
> @@ -1861,7 +1866,7 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
>  
>  	gpu->irq = irq;
>  
> -	dev_info(dev, "IRQ handler registered, irq = %d\n", irq);
> +	dev_info(dev, "irq(%d) handler registered\n", irq);

Looks possibly unnecessary, or at least unrelated to this patch.

>  	return 0;
>  }
