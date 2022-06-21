Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C95531AB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68410E126;
	Tue, 21 Jun 2022 12:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48F10E404
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:11:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C5C1660174F;
 Tue, 21 Jun 2022 13:11:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655813496;
 bh=dC6Cka/wnzuoXgcsF5Re1vDryirHwCS+bCXD6WM3dSY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oB47A8A51mxo+Mmsmmqn0xA9oAsZRxKuqeKmM2bZbTJoNCRJXQYH+m4eXiIgEZpB8
 cadWQ2V1JNwI86NJJWRQIZlay1Kh0ZjA3I5HLGklRAOICgDvbmuwT2VHh6CRgiHjtQ
 GiPSkM2sdQoknLH+EHiOpIflmgQYSYTLaQLFpJW0ng8vxDdep7r8NCEqP5pF2dV/Pv
 msXBU4PFs2FD5vYCdO8vJJO7BTkygzdnJZIJyjRsIsvxTEL8k60qzklJ358iF9E5UL
 /QhdQGMiMlobYw/YKA8W4r/RA3zeSdnpXOcwXoXVBpPg1qwR1oBTgZz9SB8yDDVUoV
 yUpFbd1VQJVhA==
Message-ID: <96bc0fba-fee2-9663-4710-a62eb1e031e2@collabora.com>
Date: Tue, 21 Jun 2022 14:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 13/14] drm/mediatek: dpi: Add dp_intf support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-14-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-14-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - 4 pixels for one round for dp_intf while dpi is 1 pixel for one round.
>     Therefore, we add a new config "round_pixels" to control setting of

Okay, I like where this is going, but "round_pixels" explains itself like
"the pixels are round" (which doesn't make sense).

So... is this "4 pixels per iteration" (computation of 4 pixels per iteration),
or "outputs 4 pixels at a time"?
I can give you some ideas about a better name for this struct member, I think...
...something like "output_4pixel"?

Alternatively, we can do something even cleaner here:
u8 pixels_per_round;

...where we define it like...

static const struct mtk_dpi_conf mt8195_dpintf_conf = {
	.pixels_per_round = 4,
	..........
}

static const struct mtk_dpi_conf mt8192_conf = {
	.pixels_per_round = 1,
	.........
}

... and then, in function mtk_dpi_set_display_mode(), we would have something like

	/*

	 * Depending on the IP version, we may output a different amount

	 * of pixels for each (choose: round/iteration): divide the clock

	 * by this number and adjust the display porches accordingly.

	 */

    	vm.pixelclock = pll_rate / factor;

	vm.pixelclock /= dpi->conf->pixels_per_round;



	......



    	hsync.sync_width = vm.hsync_len / dpi->conf->pixels_per_round;

    	hsync.back_porch = vm.hback_porch / dpi->conf->pixels_per_round;

    	hsync.front_porch = vm.hfront_porch / dpi->conf->pixels_per_round;

This would also eliminate any need to check if the IP has 4 pixels per round
or if it has just 1, as in the latter case, we'd be dividing by 1 (hence, we
would not be dividing anything).

Do you like this solution? :-)

Cheers,
Angelo

>     pixel clock and timing parameter for dp_intf.
>   - Input of dp_intf is two pixels per round, so we add a new config
>     "input_2pixel" to control this.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jitao shi <jitao.shi@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c          | 62 +++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     | 12 ++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  3 +
>   5 files changed, 82 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index ef7f828a4b1e..e562f0d55cc2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,11 @@ struct mtk_dpi_yc_limit {
>    * @color_fmt_trans_support: Enable color format transfer.
>    * @support_direct_pin: Dpi can directly connect pins, and enable this config
>    *			to do this.
> + * @round_pixels: Dp_intf is 4 pixels for one round while dpi is one pixel for
> + *		  one round, so we need to enable this config for dp_intf to do
> + *		  corresponding settings.
> + * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable this
> + *		  config to enable this feature.
>    * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
>    *		    (no shift).
>    * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
> @@ -149,6 +154,8 @@ struct mtk_dpi_conf {
>   	bool swap_input_support;
>   	bool color_fmt_trans_support;
>   	bool support_direct_pin;
> +	bool round_pixels;
> +	bool input_2pixel;
>   	u32 dimension_mask;
>   	u32 hvsize_mask;
>   	u32 channel_swap_shift;
> @@ -560,6 +567,14 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   	pll_rate = clk_get_rate(dpi->tvd_clk);
>   
>   	vm.pixelclock = pll_rate / factor;
> +
> +	/*
> +	 * For dp_intf, we need to divide clock by 4 because it's
> +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> +	 */
> +	if (dpi->conf->round_pixels)
> +		vm.pixelclock /= 4;
> +
>   	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
>   	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
>   		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> @@ -581,6 +596,17 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   	hsync.sync_width = vm.hsync_len;
>   	hsync.back_porch = vm.hback_porch;
>   	hsync.front_porch = vm.hfront_porch;
> +
> +	/*
> +	 * For dp_intf, we need to divide everything by 4 because it's
> +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> +	 */
> +	if (dpi->conf->round_pixels) {
> +		hsync.sync_width = vm.hsync_len / 4;
> +		hsync.back_porch = vm.hback_porch / 4;
> +		hsync.front_porch = vm.hfront_porch / 4;
> +	}
> +
>   	hsync.shift_half_line = false;
>   	vsync_lodd.sync_width = vm.vsync_len;
>   	vsync_lodd.back_porch = vm.vback_porch;
> @@ -629,6 +655,10 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   		mtk_dpi_dual_edge(dpi);
>   		mtk_dpi_config_disable_edge(dpi);
>   	}
> +	if (dpi->conf->input_2pixel) {
> +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> +			     DPINTF_INPUT_2P_EN);
> +	}
>   	mtk_dpi_sw_reset(dpi, false);
>   
>   	return 0;
> @@ -869,6 +899,16 @@ static unsigned int mt8183_calculate_factor(int clock)
>   		return 2;
>   }
>   
> +static unsigned int mt8195_dpintf_calculate_factor(int clock)
> +{
> +	if (clock < 70000)
> +		return 4;
> +	else if (clock < 200000)
> +		return 2;
> +	else
> +		return 1;
> +}
> +
>   static const u32 mt8173_output_fmts[] = {
>   	MEDIA_BUS_FMT_RGB888_1X24,
>   };
> @@ -878,6 +918,11 @@ static const u32 mt8183_output_fmts[] = {
>   	MEDIA_BUS_FMT_RGB888_2X12_BE,
>   };
>   
> +static const u32 mt8195_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +};
> +
>   static const struct mtk_dpi_conf mt8173_conf = {
>   	.cal_factor = mt8173_calculate_factor,
>   	.reg_h_fre_con = 0xe0,
> @@ -943,6 +988,20 @@ static const struct mtk_dpi_conf mt8192_conf = {
>   	.csc_enable_bit = CSC_ENABLE,
>   };
>   
> +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.max_clock_khz = 600000,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.round_pixels = true,
> +	.input_2pixel = true,
> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +};
> +
>   static int mtk_dpi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1065,6 +1124,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
>   	{ .compatible = "mediatek,mt8192-dpi",
>   	  .data = &mt8192_conf,
>   	},
> +	{ .compatible = "mediatek,mt8195-dp-intf",
> +	  .data = &mt8195_dpintf_conf,
> +	},
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
