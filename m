Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE7728664
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 19:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF3410E5FE;
	Thu,  8 Jun 2023 17:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFF310E5FE;
 Thu,  8 Jun 2023 17:32:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4989364C98;
 Thu,  8 Jun 2023 17:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82203C433D2;
 Thu,  8 Jun 2023 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686245564;
 bh=9pSHIKmpleefHxtGguaaooqKIkgzxLhqomz+9DI+SdY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=B4p4zzAL+tFEVx0n54Y5PAT+tyazEj9bP16Ck71X9kbDLAim/wHHwT9/8sKlHqZRv
 4kc2feFR284iUQVMZsQh+MuYOkJzapetY0ZDfg+ZLh6FOWBfCzj6zm3f6EaNxoKeNW
 XU+/KJGJwNu0RVNpjR2eXk815M6etlYXLyK66e5JsSU3XO+j86a/OQkDbVcFSMueCI
 1fdQc/vlOzhqNkHP2AtJx+uvmkE1UJ2S5B1zFEsTyRnl0PccI+OGCm8zi3EElk/fl8
 qh/uISCNyY6oDi9BSfPk7ZcjOWC11degePdEO5/sPRXv8COv3h8+9syaQJwcByjmI8
 qldhWlyTCrdFQ==
Date: Thu, 8 Jun 2023 12:32:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v8 6/8] drm/etnaviv: add driver support for the PCI devices
Message-ID: <20230608173243.GA1207429@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607105551.568639-7-15330273260@189.cn>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 06:55:49PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> This patch adds PCI driver support on top of what we already have. Take
> the GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device
> driver. There is only one GPU core for the GC1000 in the LS7A1000 and
> LS2K1000. Therefore, component frameworks can be avoided.

> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +#include "etnaviv_pci_drv.h"
> +#endif

With trivial stubs for etnaviv_register_pci_driver() and
etnaviv_unregister_pci_driver(), I think you could get rid of all
these #ifdefs.

> +void etnaviv_drm_unbind(struct device *dev, bool component)
>  {
>  	struct etnaviv_drm_private *priv = etna_private_ptr;
>  	struct drm_device *drm = priv->drm;
> @@ -746,6 +750,12 @@ static int __init etnaviv_init(void)
>  	if (ret != 0)
>  		goto unregister_gpu_driver;
>  
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +	ret = etnaviv_register_pci_driver();
> +	if (ret != 0)
> +		goto unregister_platform_driver;
> +#endif
> +
>  	/*
>  	 * If the DT contains at least one available GPU device, instantiate
>  	 * the DRM platform device.
> @@ -763,7 +773,7 @@ static int __init etnaviv_init(void)
>  		break;
>  	}
>  
> -	return 0;
> +	return ret;
>  
>  unregister_platform_driver:
>  	platform_driver_unregister(&etnaviv_platform_driver);
> @@ -778,6 +788,10 @@ static void __exit etnaviv_exit(void)
>  	etnaviv_destroy_platform_device(&etnaviv_platform_device);
>  	platform_driver_unregister(&etnaviv_platform_driver);
>  	platform_driver_unregister(&etnaviv_gpu_driver);
> +
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +	etnaviv_unregister_pci_driver();
> +#endif

> +static const struct pci_device_id etnaviv_pci_id_lists[] = {
> +	{PCI_VENDOR_ID_LOONGSON, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> +	{PCI_VENDOR_ID_LOONGSON, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},

PCI_VDEVICE()

Bjorn
