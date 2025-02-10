Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E9A2F52C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 18:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB50210E5D1;
	Mon, 10 Feb 2025 17:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UDcVjMX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708FD10E5D1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:25:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1455DA41C75;
 Mon, 10 Feb 2025 17:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D818C4CEE9;
 Mon, 10 Feb 2025 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739208319;
 bh=ATfMmIVQUtizYRtKO7eBYnjIZDmUdv/DHgsiIDhlXYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UDcVjMX+ZfTwiJl6BjjE71qXxZI4HKCdmqXo9wE5Y+U6FrblPTgzZ1lni9V+xlmdn
 cbTsy9AlxZT9gnhg+/Htd/n+0NsHnZYlQEThr8rda1MhkYi6nsyAa98V7r2FrWDwIC
 Y8eumau3YL8CxR4A3mildMq+D0trEY2jOyQ59GjPbK3CNmXszaGDoti76DXcF7dmRf
 DyH5Lh652kl8wsHu0CHw8fYWES+d+4+nrDssVrn7nsfCrC5E4phuxjvNAawwgHY1oC
 7Cu7ie5Y0PEbn9G4tFW42SZeUuyW9Cul19AX50sNKvYW0SPmaQ6DSkrQegw8qjB6dk
 1WDE1x05fisPQ==
Date: Mon, 10 Feb 2025 17:25:13 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH 2/3] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS
 display
Message-ID: <20250210172513.GH1868108@google.com>
References: <20241121092308.130328-1-manikandan.m@microchip.com>
 <20241121092308.130328-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121092308.130328-2-manikandan.m@microchip.com>
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

On Thu, 21 Nov 2024, Manikandan Muralidharan wrote:

> The XLCDC IP supports DSI, parallel RGB and LVDS Display.
> sys_clk(Generic clock) is used for DSI and Parallel RGB displays;
> And LVDS PLL is used with LVDS displays.
> obtain anyone of the clocks for the LCD to operate

Maybe say something about this being a fall-back strategy.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/mfd/atmel-hlcdc.c       | 16 ++++++++++++++--
>  include/linux/mfd/atmel-hlcdc.h |  1 +
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 4c4e35d404f3..60b0b766459e 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -108,10 +108,22 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
>  		return PTR_ERR(hlcdc->periph_clk);
>  	}
>  
> +	/*
> +	 * Obtain one of the main clocks (GCK / LVDS PLL) required by the
> +	 * LCD to function,
> +	 * GCK for Parallel RGB and MIPI displays;
> +	 * LVDS PLL for LVDS displays.
> +	 */
> +	hlcdc->sys_clk = NULL;
> +	hlcdc->lvds_pll_clk = NULL;

Since, devm_kzalloc() is used to allocate this memory space, these are
already NULL.

>  	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
>  	if (IS_ERR(hlcdc->sys_clk)) {
> -		dev_err(dev, "failed to get system clock\n");
> -		return PTR_ERR(hlcdc->sys_clk);
> +		dev_dbg(dev, "failed to get system clock\n");

This should be a dev_warn().

May be add some more information.

"failed to get system clock, trying xyz instead"

'\n' here.

> +		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
> +		if (IS_ERR(hlcdc->lvds_pll_clk)) {
> +			dev_err(dev, "failed to get LVDS PLL clock\n");
> +			return PTR_ERR(hlcdc->lvds_pll_clk);
> +		}
>  	}
>  
>  	hlcdc->slow_clk = devm_clk_get(dev, "slow_clk");
> diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
> index 80d675a03b39..07c2081867fd 100644
> --- a/include/linux/mfd/atmel-hlcdc.h
> +++ b/include/linux/mfd/atmel-hlcdc.h
> @@ -75,6 +75,7 @@
>   */
>  struct atmel_hlcdc {
>  	struct regmap *regmap;
> +	struct clk *lvds_pll_clk;
>  	struct clk *periph_clk;
>  	struct clk *sys_clk;
>  	struct clk *slow_clk;
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]
