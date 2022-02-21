Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630EE4BDA36
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D07410E4A0;
	Mon, 21 Feb 2022 14:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636D510E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:30:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3790D1F437A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453844;
 bh=FNOwiqQ/KP71DW3JZYaleITbg/KKUYV3qtTy/sQhpYA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=O0sNex8vtLXvYrEn0AGCj/JFqXd7DBrBnryyYPg4f4u3sIw7+lzYL2TLHMEDvqrJX
 Fok0/WjnD2CiD/rhv9wu1YnQw8PWhOBgHh+/LnGiclBDvoXgKpHvSMh+XyIUv9Bgz2
 gOm4MI20YKwosP/MnzXtGwzeKQLOs9X+vduH1rv4nIfcsLBMxB7pusyoO3PM0TIaSw
 p0LC/EDNE/pHaydudXnsq47RZVggB/5rqoxkbG6h/OjRCcm5yyaq0q5V/IjdtEA1NG
 4EJXVBVk9PGfO25dNL5Haw07G/fpGs7fp3AZQLErKkoOPb2w+j86e8geY8bOriJ3A/
 lPFpHbijByA6g==
Message-ID: <9b4e50fd-cfa2-542f-d16a-3771284eece7@collabora.com>
Date: Mon, 21 Feb 2022 15:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 13/19] drm/mediatek: dpi: Add dpintf support
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-14-granquet@baylibre.com>
Content-Language: en-US
In-Reply-To: <20220218145437.18563-14-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c          | 164 +++++++++++++++++---
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  38 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   8 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
>   include/linux/soc/mediatek/mtk-mmsys.h      |   2 +
>   6 files changed, 198 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index be99399faf1bb..c5639ada868f8 100644
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
> @@ -71,8 +79,10 @@ struct mtk_dpi {
>   	void __iomem *regs;
>   	struct device *dev;
>   	struct clk *engine_clk;
> +	struct clk *dpi_ck_cg;
>   	struct clk *pixel_clk;
>   	struct clk *tvd_clk;
> +	struct clk *pclk_src[5];
>   	int irq;
>   	struct drm_display_mode mode;
>   	const struct mtk_dpi_conf *conf;
> @@ -126,6 +136,7 @@ struct mtk_dpi_conf {
>   	const u32 *output_fmts;
>   	u32 num_output_fmts;
>   	bool is_ck_de_pol;
> +	bool is_dpintf;
>   	bool swap_input_support;
>   	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)
>   	u32 dimension_mask;
> @@ -384,6 +395,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
>   		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
>   }
>   
> +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
> +{
> +	u32 matrix_sel = 0;
> +
> +	switch (format) {
> +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> +	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> +	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> +	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> +	case MTK_DPI_COLOR_FORMAT_XV_YCC:
> +		if (dpi->mode.hdisplay <= 720)
> +			matrix_sel = 0x2;
> +		break;
> +	default:
> +		break;
> +	}
> +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
> +}
> +
>   static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>   					enum mtk_dpi_out_color_format format)
>   {
> @@ -391,6 +421,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>   	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
>   		mtk_dpi_config_yuv422_enable(dpi, false);
>   		mtk_dpi_config_csc_enable(dpi, true);
> +		mtk_dpi_matrix_sel(dpi, format);
>   		if (dpi->conf->swap_input_support)
>   			mtk_dpi_config_swap_input(dpi, false);
>   		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> @@ -398,6 +429,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>   		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
>   		mtk_dpi_config_yuv422_enable(dpi, true);
>   		mtk_dpi_config_csc_enable(dpi, true);
> +		mtk_dpi_matrix_sel(dpi, format);
>   		if (dpi->conf->swap_input_support)
>   			mtk_dpi_config_swap_input(dpi, true);
>   		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> @@ -438,6 +470,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>   	mtk_dpi_disable(dpi);
>   	clk_disable_unprepare(dpi->pixel_clk);
>   	clk_disable_unprepare(dpi->engine_clk);
> +	clk_disable_unprepare(dpi->dpi_ck_cg);
> +	clk_disable_unprepare(dpi->tvd_clk);
>   }
>   
>   static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> @@ -447,12 +481,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>   	if (++dpi->refcount != 1)
>   		return 0;
>   
> +	ret = clk_prepare_enable(dpi->tvd_clk);
> +	if (ret) {
> +		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> +		goto err_pixel;
> +	}
> +
>   	ret = clk_prepare_enable(dpi->engine_clk);
>   	if (ret) {
>   		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
>   		goto err_refcount;
>   	}
>   
> +	ret = clk_prepare_enable(dpi->dpi_ck_cg);
> +	if (ret) {
> +		dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
> +		goto err_ck_cg;
> +	}
> +
>   	ret = clk_prepare_enable(dpi->pixel_clk);
>   	if (ret) {
>   		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
> @@ -462,10 +508,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>   	if (dpi->pinctrl && dpi->pins_dpi)
>   		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
>   
> -	mtk_dpi_enable(dpi);
>   	return 0;
>   
>   err_pixel:
> +	clk_disable_unprepare(dpi->dpi_ck_cg);
> +err_ck_cg:
>   	clk_disable_unprepare(dpi->engine_clk);
>   err_refcount:
>   	dpi->refcount--;
> @@ -497,12 +544,21 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   	pll_rate = clk_get_rate(dpi->tvd_clk);
>   
>   	vm.pixelclock = pll_rate / factor;
> -	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> +	if (dpi->conf->is_dpintf) {
> +		if (factor == 1)
> +			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> +		else if (factor == 2)
> +			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]);
> +		else if (factor == 4)
> +			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]);
> +		else
> +			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> +	} else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> +		 (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
>   		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> -	else
> +	} else {
>   		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> -
> +	}
>   
>   	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
>   
> @@ -515,9 +571,15 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
>   	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
>   			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
> -	hsync.sync_width = vm.hsync_len;
> -	hsync.back_porch = vm.hback_porch;
> -	hsync.front_porch = vm.hfront_porch;
> +	if (dpi->conf->is_dpintf) {
> +		hsync.sync_width = vm.hsync_len / 4;
> +		hsync.back_porch = vm.hback_porch / 4;
> +		hsync.front_porch = vm.hfront_porch / 4;
> +	} else {
> +		hsync.sync_width = vm.hsync_len;
> +		hsync.back_porch = vm.hback_porch;
> +		hsync.front_porch = vm.hfront_porch;
> +	}

I would propose the following, instead:

	hsync.sync_width = vm.hsync_len;
	hsync.back_porch = vm.hback_porch;
	hsync.front_porch = vm.hfront_porch;

	/*
	 * For DPINTF, we need to divide everything by 4 because of this,
	 * that and the other reason.
	 */
	if (dpi->conf->is_dpintf) {
		hsync.sync_width /= 4;
		hsync.back_porch /= 4;
		hsync.front_porch /= 4;
	}

>   	hsync.shift_half_line = false;
>   	vsync_lodd.sync_width = vm.vsync_len;
>   	vsync_lodd.back_porch = vm.vback_porch;
> @@ -559,13 +621,20 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>   	mtk_dpi_config_channel_limit(dpi);
>   	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>   	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>   	mtk_dpi_config_color_format(dpi, dpi->color_format);
> -	mtk_dpi_config_2n_h_fre(dpi);
> -	mtk_dpi_dual_edge(dpi);
> -	mtk_dpi_config_disable_edge(dpi);
> +	if (dpi->conf->is_dpintf) {
> +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> +			     DPINTF_INPUT_2P_EN);
> +	} else {
> +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> +		mtk_dpi_config_2n_h_fre(dpi);
> +		mtk_dpi_dual_edge(dpi);
> +		mtk_dpi_config_disable_edge(dpi);
> +	}
>   	mtk_dpi_sw_reset(dpi, false);
>   
> +	mtk_dpi_enable(dpi);
> +
>   	return 0;
>   }
>   
> @@ -608,7 +677,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   	u32 *input_fmts;
>   
>   	*num_input_fmts = 0;
> -

Why are you removing this line? imo, it's fine to have it.

>   	input_fmts = kcalloc(1, sizeof(*input_fmts),
>   			     GFP_KERNEL);
>   	if (!input_fmts)
> @@ -634,15 +702,18 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
>   		if (dpi->conf->num_output_fmts)
>   			out_bus_format = dpi->conf->output_fmts[0];
>   
> -	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> -		bridge_state->input_bus_cfg.format,
> -		bridge_state->output_bus_cfg.format);
> +	dev_info(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> +		 bridge_state->input_bus_cfg.format,
> +		 bridge_state->output_bus_cfg.format);

This is definitely debugging information, and has to be kept as such.

>   
>   	dpi->output_fmt = out_bus_format;
>   	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
>   	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>   	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> +		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> +	else
> +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
>   
>   	return 0;
>   }
> @@ -687,7 +758,7 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
>   {
>   	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>   
> -	if (mode->clock > dpi->conf->max_clock_khz)
> +	if (dpi->conf->max_clock_khz && mode->clock > dpi->conf->max_clock_khz)
>   		return MODE_CLOCK_HIGH;
>   
>   	return MODE_OK;
> @@ -801,6 +872,16 @@ static unsigned int mt8183_calculate_factor(int clock)
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
> @@ -810,6 +891,12 @@ static const u32 mt8183_output_fmts[] = {
>   	MEDIA_BUS_FMT_RGB888_2X12_BE,
>   };
>   
> +static const u32 mt8195_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_YUV8_1X24,
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +};
> +
>   static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
>   	.c_bottom = 0x0010,
>   	.c_top = 0x0FE0,
> @@ -817,6 +904,13 @@ static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
>   	.y_top = 0x0FE0,
>   };
>   
> +static const struct mtk_dpi_yc_limit mtk_dpintf_limit = {
> +	.c_bottom = 0x0000,
> +	.c_top = 0xFFF,
> +	.y_bottom = 0x0000,
> +	.y_top = 0xFFF,
> +};
> +
>   static const struct mtk_dpi_conf mt8173_conf = {
>   	.cal_factor = mt8173_calculate_factor,
>   	.reg_h_fre_con = 0xe0,
> @@ -882,6 +976,19 @@ static const struct mtk_dpi_conf mt8192_conf = {
>   	.limit = &mtk_dpi_limit,
>   };
>   
> +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.is_dpintf = true,
> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +	.limit = &mtk_dpintf_limit,
> +};
> +
>   static int mtk_dpi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -929,7 +1036,18 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>   	if (IS_ERR(dpi->engine_clk)) {
>   		ret = PTR_ERR(dpi->engine_clk);
>   		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +			dev_err(dev, "Failed to get engine clock: %d\n",
> +				ret);

Why are you breaking this line? It fits! :)

> +
> +		return ret;
> +	}
> +
> +	dpi->dpi_ck_cg = devm_clk_get_optional(dev, "ck_cg");
> +	if (IS_ERR(dpi->dpi_ck_cg)) {
> +		ret = PTR_ERR(dpi->dpi_ck_cg);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get dpi ck cg clock: %d\n",
> +				ret);

ditto

>   
>   		return ret;
>   	}
> @@ -952,6 +1070,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	dpi->pclk_src[1] = devm_clk_get(dev, "TVDPLL_D2");
> +	dpi->pclk_src[2] = devm_clk_get(dev, "TVDPLL_D4");
> +	dpi->pclk_src[3] = devm_clk_get(dev, "TVDPLL_D8");
> +	dpi->pclk_src[4] = devm_clk_get(dev, "TVDPLL_D16");

	if (dpi->conf->is_dpintf) {
		dpi->pclk_src[1] = devm_clk_get(.....);
		if (IS_ERR(dpi->pclk_src[1]))
			return dpi->pclk_src[1];

		dpi->pclk_src[2] = ..... (blahblah, etc)
	}

or, you can also do (but I'm undecided on that)

	if (dpi->conf->is_dpintf) {
		for (........) {
			dpi->pclk_src[...........
			if (IS_ERR....)
				return .....
		}
	}

It's your choice.... as long as you correctly error-check these calls.

Thanks,
Angelo
