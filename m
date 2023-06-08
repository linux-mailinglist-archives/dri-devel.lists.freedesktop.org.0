Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3CE728647
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 19:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB98710E5FB;
	Thu,  8 Jun 2023 17:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6919610E5FB;
 Thu,  8 Jun 2023 17:25:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C37B64FD5;
 Thu,  8 Jun 2023 17:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30C7C433EF;
 Thu,  8 Jun 2023 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686245137;
 bh=ZaATAOm8boNxX2ZuQ1VyIMIjUgKnsaHEY03tgyAn5Fw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=vKNx49YDI6kEpnIIUbxKde9/CNVTPbqdrWmLKd42Cc4KH+4kNzuz8CAM9bo/LR/nI
 EnV/hZdteDwrbFj0vEwvNq3hG82QfwrgXDbaEWPAWCO2IfbVgN3VEoWtJw989UBu1s
 7c+4tz0UinNSdNCIqpjpyRTAJgHVEiHQxJxeWFg/y2tS00o7g0vL84/eT/uekAR4r4
 wGhZV/L2b+k8rm8JX7NYDuCbtY2Zu4qone3JtPjN2F1NGdkC0ME3KsrJxGtXb24UFp
 RmO/xdXzT2gsqWmfVXQafhXf8KVNR5HZ5hF6nIUBJA5DTQqD6mJH1aPco1vzRuynB8
 Waaan6Ehhr7WQ==
Date: Thu, 8 Jun 2023 12:25:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v8 1/8] drm/etnaviv: add a dedicated function to register
 an irq handler
Message-ID: <20230608172535.GA1207045@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607105551.568639-2-15330273260@189.cn>
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

On Wed, Jun 07, 2023 at 06:55:44PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> Because getting IRQ from a device is platform-dependent, PCI devices have
> different methods for getting an IRQ. This patch is a preparation patch to
> extend the driver for the PCI device support.
> 
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 34 ++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index de8c9894967c..b9c12d3145a2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1817,6 +1817,29 @@ static const struct of_device_id etnaviv_gpu_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
>  
> +static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
> +{
> +	struct device *dev = gpu->dev;
> +	int err;
> +
> +	if (irq < 0) {
> +		dev_err(dev, "failed to get irq: %d\n", irq);

Isn't this message redundant because platform_get_irq() already
emitted a message for this case?

> +		return irq;
> +	}
> +
> +	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
> +	if (err) {
> +		dev_err(dev, "failed to request irq %u: %d\n", irq, err);
> +		return err;
> +	}
> +
> +	gpu->irq = irq;
> +
> +	dev_info(dev, "irq(%d) handler registered\n", irq);
> +
> +	return 0;
> +}
> +
>  static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1837,16 +1860,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  		return PTR_ERR(gpu->mmio);
>  
>  	/* Get Interrupt: */
> -	gpu->irq = platform_get_irq(pdev, 0);
> -	if (gpu->irq < 0)
> -		return gpu->irq;
> -
> -	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> -			       dev_name(gpu->dev), gpu);
> -	if (err) {
> -		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
> +	err = etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
> +	if (err)
>  		return err;
> -	}
>  
>  	/* Get Clocks: */
>  	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
> -- 
> 2.25.1
> 
