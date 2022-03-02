Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4394CA051
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90610F1D7;
	Wed,  2 Mar 2022 09:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C116D10F1D6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:07:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9E1911F44B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646212063;
 bh=Ztnm82SiYGhB+IIBhUFDj5KSeiwqthDaJ6+SaFW7jDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KUqKDdi13sQCl89F9qY+zjLPxgs5aT4gvYm7hQTXhX6TFcjaXTQIejpmoLInjKlKA
 1lze8Z9sdtK/kXRrpL4WgcxMkKmQ6jh06gyczXHxKFlD7nci9SKb2zUs8vUNvu0TlX
 pjOank8TIJwP8xfwXQcpWdKYWulNOfHAVel6b+EnHQiYhkmjvgxO+dNN2YrYSxRF29
 1Zfnp4baunep0BjAasY4ZGsC4KivL339GlTHSRq/UX97qfW3/oYGX/Qi7b1WDUmPhk
 DnD9adkT3EOWlj0VrhKOe1/gBzEiWV3G/SIRWkEeh7gGOQ7bOXT6lphhTRCv/KnsqK
 /29lgW0vzuN0A==
Message-ID: <6db20053-71dc-d0e3-aac9-de5da1d7ba9e@collabora.com>
Date: Wed, 2 Mar 2022 10:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1,2/3] drm/mediatek: Add TOPCKGEN select mux control
 dpi_clk
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
 <1645782833-27875-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645782833-27875-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/02/22 10:53, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi_clk is controlled by the mux selected
> by TOPCKGEN and APMIXEDSYS can support small resolution.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Hello Xinlei,

as it was pointed out by reviewers in the MT8195 DisplayPort series, that is
adding the same logic that you are proposing in this patch, the clock parent
selection should be performed by the clock drivers, I'd say in the callback
.set_rate_and_parent(), and not by the mtk_dpi driver.

Please fix this in the proper drivers (clocks!) instead.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 38 ++++++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4554e2de1430..bad686817e29 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
>   	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
>   };
>   
> +enum TVDPLL_CLK {
> +	TVDPLL_PLL = 0,
> +	TVDPLL_D2 = 2,
> +	TVDPLL_D4 = 4,
> +	TVDPLL_D8 = 8,
> +	TVDPLL_D16 = 16,
> +};
> +
>   struct mtk_dpi {
>   	struct drm_encoder encoder;
>   	struct drm_bridge bridge;
> @@ -73,6 +81,7 @@ struct mtk_dpi {
>   	struct clk *engine_clk;
>   	struct clk *pixel_clk;
>   	struct clk *tvd_clk;
> +	struct clk *pclk_src[5];
>   	int irq;
>   	struct drm_display_mode mode;
>   	const struct mtk_dpi_conf *conf;
> @@ -459,6 +468,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   	struct videomode vm = { 0 };
>   	unsigned long pll_rate;
>   	unsigned int factor;
> +	struct clk *clksrc = NULL;
>   
>   	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
>   	factor = dpi->conf->cal_factor(mode->clock);
> @@ -473,11 +483,26 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   
>   	vm.pixelclock = pll_rate / factor;
>   	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> -		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> -	else
> -		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> +	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
> +		if (factor == 8)
> +			clksrc = dpi->pclk_src[2];
> +		else if (factor == 4)
> +			clksrc = dpi->pclk_src[1];
> +		else
> +			clksrc = dpi->pclk_src[1];
> +		}
> +	else {
> +		if (factor == 8)
> +			clksrc = dpi->pclk_src[3];
> +		else if (factor == 4)
> +			clksrc = dpi->pclk_src[2];
> +		else
> +			clksrc = dpi->pclk_src[2];
> +	}
>   
> +	clk_prepare_enable(dpi->pixel_clk);
> +	clk_set_parent(dpi->pixel_clk, clksrc);
> +	clk_disable_unprepare(dpi->pixel_clk);
>   
>   	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
>   
> @@ -893,6 +918,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	dpi->pclk_src[1] = devm_clk_get_optional(dev, "tvdpll_d2");
> +	dpi->pclk_src[2] = devm_clk_get_optional(dev, "tvdpll_d4");
> +	dpi->pclk_src[3] = devm_clk_get_optional(dev, "tvdpll_d8");
> +	dpi->pclk_src[4] = devm_clk_get_optional(dev, "tvdpll_d16");
> +
>   	dpi->irq = platform_get_irq(pdev, 0);
>   	if (dpi->irq <= 0)
>   		return -EINVAL;

