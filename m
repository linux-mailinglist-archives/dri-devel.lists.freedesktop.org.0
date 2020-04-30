Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF901BFE57
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29886E914;
	Thu, 30 Apr 2020 14:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FD86E914
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:32:40 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jUAEo-0008MV-Bh; Thu, 30 Apr 2020 16:32:30 +0200
Message-ID: <5e1f804c4c27927d10b2283747c1cae6606abe7c.camel@pengutronix.de>
Subject: Re: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe
 time on i.MX8MM
From: Lucas Stach <l.stach@pengutronix.de>
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Adam Ford
 <aford173@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, Fabio
 Estevam <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Li
 Jun <jun.li@nxp.com>,  NXP Linux Team <linux-imx@nxp.com>, Peng Fan
 <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "S.j. Wang"
 <shengjiu.wang@nxp.com>
Date: Thu, 30 Apr 2020 16:32:27 +0200
In-Reply-To: <20200430124602.14463-2-frieder.schrempf@kontron.de>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-2-frieder.schrempf@kontron.de>
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder,

Am Donnerstag, den 30.04.2020, 12:46 +0000 schrieb Schrempf Frieder:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> On i.MX8MM there is an interrupt getting triggered immediately after
> requesting the IRQ, which leads to a stall as the handler accesses
> the GPU registers whithout the clock being enabled.
> 
> Enabling the clocks briefly seems to clear the IRQ state, so we do
> this before requesting the IRQ.

This is most likely caused by improper power-up sequencing. Normally
the GPC will trigger a hardware reset of the modules inside a power
domain when the domain is powered on. This requires the clocks to be
running at this point, as those resets are synchronous, so need clock
pulses to propagate through the hardware.

From what I see the i.MX8MM is still missing the power domain
controller integration, but I'm pretty confident that this problem
should be solved in the power domain code, instead of the GPU driver.

Regards,
Lucas

> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 29 ++++++++++++++++++++-----
> --
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index a31eeff2b297..23877c1f150a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1775,13 +1775,6 @@ static int etnaviv_gpu_platform_probe(struct
> platform_device *pdev)
>  		return gpu->irq;
>  	}
>  
> -	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> -			       dev_name(gpu->dev), gpu);
> -	if (err) {
> -		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, 
> err);
> -		return err;
> -	}
> -
>  	/* Get Clocks: */
>  	gpu->clk_reg = devm_clk_get(&pdev->dev, "reg");
>  	DBG("clk_reg: %p", gpu->clk_reg);
> @@ -1805,6 +1798,28 @@ static int etnaviv_gpu_platform_probe(struct
> platform_device *pdev)
>  		gpu->clk_shader = NULL;
>  	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
>  
> +	/*
> +	 * On i.MX8MM there is an interrupt getting triggered
> immediately
> +	 * after requesting the IRQ, which leads to a stall as the
> handler
> +	 * accesses the GPU registers whithout the clock being enabled.
> +	 * Enabling the clocks briefly seems to clear the IRQ state, so
> we do
> +	 * this here before requesting the IRQ.
> +	 */
> +	err = etnaviv_gpu_clk_enable(gpu);
> +	if (err)
> +		return err;
> +
> +	err = etnaviv_gpu_clk_disable(gpu);
> +	if (err)
> +		return err;
> +
> +	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> +			       dev_name(gpu->dev), gpu);
> +	if (err) {
> +		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, 
> err);
> +		return err;
> +	}
> +
>  	/* TODO: figure out max mapped size */
>  	dev_set_drvdata(dev, gpu);
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
