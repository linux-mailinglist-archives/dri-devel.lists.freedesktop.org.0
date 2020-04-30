Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9141BFE6E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBCD6E915;
	Thu, 30 Apr 2020 14:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C926E915
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:35:16 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jUAHL-0000D2-Lw; Thu, 30 Apr 2020 16:35:07 +0200
Message-ID: <3895f202cf5919e41a56878a62f6d5259dea12d3.camel@pengutronix.de>
Subject: Re: [RFC PATCH 3/4] drm/etnaviv: Change order of enabling clocks to
 fix boot on i.MX8MM
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
Date: Thu, 30 Apr 2020 16:35:06 +0200
In-Reply-To: <20200430124602.14463-4-frieder.schrempf@kontron.de>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-4-frieder.schrempf@kontron.de>
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

Am Donnerstag, den 30.04.2020, 12:46 +0000 schrieb Schrempf Frieder:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> On some i.MX8MM devices the boot hangs when enabling the GPU clocks.
> Changing the order of clock initalization to
> 
> core -> shader -> bus -> reg
> 
> fixes the issue. This is the same order used in the imx platform code
> of the downstream GPU driver in the NXP kernel [1]. For the sake of
> consistency we also adjust the order of disabling the clocks to the
> reverse.
> 
> [1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c?h=imx_5.4.3_2.0.0#n1538

I don't see why the order of the clocks is important. Is this really a
GPU issue? As in: does a GPU access hang when enabling the clocks in
the wrong order? Or is this a clock driver issue with a clock access
hanging due to an upstream clock still being disabled?

Regards,
Lucas

> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 42 +++++++++++++--------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7b138d4dd068..424b2e5951f0 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1487,55 +1487,55 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
>  
> -	if (gpu->clk_reg) {
> -		ret = clk_prepare_enable(gpu->clk_reg);
> +	if (gpu->clk_core) {
> +		ret = clk_prepare_enable(gpu->clk_core);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	if (gpu->clk_bus) {
> -		ret = clk_prepare_enable(gpu->clk_bus);
> +	if (gpu->clk_shader) {
> +		ret = clk_prepare_enable(gpu->clk_shader);
>  		if (ret)
> -			goto disable_clk_reg;
> +			goto disable_clk_core;
>  	}
>  
> -	if (gpu->clk_core) {
> -		ret = clk_prepare_enable(gpu->clk_core);
> +	if (gpu->clk_bus) {
> +		ret = clk_prepare_enable(gpu->clk_bus);
>  		if (ret)
> -			goto disable_clk_bus;
> +			goto disable_clk_shader;
>  	}
>  
> -	if (gpu->clk_shader) {
> -		ret = clk_prepare_enable(gpu->clk_shader);
> +	if (gpu->clk_reg) {
> +		ret = clk_prepare_enable(gpu->clk_reg);
>  		if (ret)
> -			goto disable_clk_core;
> +			goto disable_clk_bus;
>  	}
>  
>  	return 0;
>  
> -disable_clk_core:
> -	if (gpu->clk_core)
> -		clk_disable_unprepare(gpu->clk_core);
>  disable_clk_bus:
>  	if (gpu->clk_bus)
>  		clk_disable_unprepare(gpu->clk_bus);
> -disable_clk_reg:
> -	if (gpu->clk_reg)
> -		clk_disable_unprepare(gpu->clk_reg);
> +disable_clk_shader:
> +	if (gpu->clk_shader)
> +		clk_disable_unprepare(gpu->clk_shader);
> +disable_clk_core:
> +	if (gpu->clk_core)
> +		clk_disable_unprepare(gpu->clk_core);
>  
>  	return ret;
>  }
>  
>  static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
>  {
> +	if (gpu->clk_reg)
> +		clk_disable_unprepare(gpu->clk_reg);
> +	if (gpu->clk_bus)
> +		clk_disable_unprepare(gpu->clk_bus);
>  	if (gpu->clk_shader)
>  		clk_disable_unprepare(gpu->clk_shader);
>  	if (gpu->clk_core)
>  		clk_disable_unprepare(gpu->clk_core);
> -	if (gpu->clk_bus)
> -		clk_disable_unprepare(gpu->clk_bus);
> -	if (gpu->clk_reg)
> -		clk_disable_unprepare(gpu->clk_reg);
>  
>  	return 0;
>  }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
