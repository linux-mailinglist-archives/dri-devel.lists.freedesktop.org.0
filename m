Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BA4936FD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AA010E8EA;
	Wed, 19 Jan 2022 09:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F163110E8EA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:15:37 +0000 (UTC)
X-UUID: 81dcc299fc7240a2ac7cee9a2512f88e-20220119
X-UUID: 81dcc299fc7240a2ac7cee9a2512f88e-20220119
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1842463282; Wed, 19 Jan 2022 17:15:32 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 17:15:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 17:15:32 +0800
Message-ID: <d94c32869633e1341e5fd17ab17f5b5358f590e8.camel@mediatek.com>
Subject: Re: [PATCH v7 5/8] drm/mediatek: dpi: Add dpintf support
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Wed, 19 Jan 2022 17:15:31 +0800
In-Reply-To: <20211217150854.2081-6-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-6-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Markus
 Schneider-Pargmann <msp@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

On Fri, 2021-12-17 at 16:08 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is
> similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - Some features/functional components are not available for dpintf
>    which are now excluded from code execution once is_dpintf is set
>  - dpintf can and needs to choose between different clockdividers
> based
>    on the clockspeed. This is done by choosing a different clock
> parent.
>  - There are two additional clocks that need to be managed. These are
>    only set for dpintf and will be set to NULL if not supplied. The
>    clk_* calls handle these as normal clocks then.
>  - Some register contents differ slightly between the two components.
> To
>    work around this I added register bits/masks with a DPINTF_ prefix
>    and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 304 ++++++++++++++++
> ----
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  38 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
>  include/linux/soc/mediatek/mtk-mmsys.h      |   2 +
>  6 files changed, 299 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4554e2de14309..fbc43ea4049b9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
>  	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
>  };
>  
> +enum TVDPLL_CLK {
> +	TVDPLL_PLL = 0,
> +	TVDPLL_D2 = 2,
> +	TVDPLL_D4 = 4,
> +	TVDPLL_D8 = 8,
> +	TVDPLL_D16 = 16,
> +};
> +
>  struct mtk_dpi {
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
> @@ -71,8 +79,10 @@ struct mtk_dpi {
>  	void __iomem *regs;
>  	struct device *dev;
>  	struct clk *engine_clk;
> +	struct clk *dpi_ck_cg;
>  	struct clk *pixel_clk;
>  	struct clk *tvd_clk;
> +	struct clk *pclk_src[5];
>  	int irq;
>  	struct drm_display_mode mode;
>  	const struct mtk_dpi_conf *conf;
> @@ -125,6 +135,18 @@ struct mtk_dpi_conf {
>  	bool edge_sel_en;
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
> +	bool is_ck_de_pol;

Seperate is_ck_de_pol to an independent patch.

> +	bool is_dpintf;

Ditto for is_dpintf. And I would like change the name to what this
actually do.

> +	bool csc_support;

Ditto for csc_support.

> +	bool swap_input_support;

Ditto for swap_input_support.

> +	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH 

/* ... */

> (no shift)
> +	u32 dimension_mask;

Ditto for dimension_mask.

> +	// Mask used for HSIZE and VSIZE (no shift)
> +	u32 hvsize_mask;

Ditto for hvsize_mask.

> +	u32 channel_swap_shift;

Ditto for channel_swap_shift.

> +	u32 yuv422_en_bit;

Ditto for yuv422_en_bit.

> +	u32 csc_enable_bit;

Ditto for csc_enable_bit.

> +	const struct mtk_dpi_yc_limit *limit;

Ditto for limit.

>  };
>  
>  
> +
> +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.is_dpintf = true,
> +	.csc_support = true,

For every SoC, csc_support is true. Why do we need csc_support?

Regards,
CK

> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +	.limit = &mtk_dpintf_limit,
>  };
>  
>  

