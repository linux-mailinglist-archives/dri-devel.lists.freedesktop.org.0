Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB514E374F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 04:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF6610E4FB;
	Tue, 22 Mar 2022 03:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466F10E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 03:13:39 +0000 (UTC)
X-UUID: 843bd33b12e94a4ca2d13e7dad2390ee-20220322
X-UUID: 843bd33b12e94a4ca2d13e7dad2390ee-20220322
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 536648539; Tue, 22 Mar 2022 11:13:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 11:13:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 11:13:06 +0800
Message-ID: <17ed6c2a5f40cabd8e39097213811a2149c37c90.camel@mediatek.com>
Subject: Re: [PATCH v16 05/22] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 22 Mar 2022 11:13:06 +0800
In-Reply-To: <20220318142009.2796-6-nancy.lin@mediatek.com>
References: <20220318142009.2796-1-nancy.lin@mediatek.com>
 <20220318142009.2796-6-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Fri, 2022-03-18 at 22:19 +0800, Nancy.Lin wrote:
> Add mmsys config API. The config API is used for config mmsys reg.
> Some mmsys regs need to be setting according to the HW engine binding
> to the mmsys simultaneously.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 62
> ++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 34 ++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.h       | 10 +++++
>  include/linux/soc/mediatek/mtk-mmsys.h | 16 +++++++
>  4 files changed, 122 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> index 369fb0aab56d..8b7adbd22919 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -139,6 +139,21 @@
>  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> 0xf68
>  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> 0
>  
> +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> +#define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
> +#define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> +#define MT8195_VDO1_MERGE3_ASYNC_CFG_WD	0xe60
> +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
> +#define MT8195_VDO1_HDR_TOP_CFG		0xd00
> +#define MT8195_VDO1_MIXER_IN1_ALPHA	0xd30
> +#define MT8195_VDO1_MIXER_IN2_ALPHA	0xd34
> +#define MT8195_VDO1_MIXER_IN3_ALPHA	0xd38
> +#define MT8195_VDO1_MIXER_IN4_ALPHA	0xd3c
> +#define MT8195_VDO1_MIXER_IN1_PAD	0xd40
> +#define MT8195_VDO1_MIXER_IN2_PAD	0xd44
> +#define MT8195_VDO1_MIXER_IN3_PAD	0xd48
> +#define MT8195_VDO1_MIXER_IN4_PAD	0xd4c
> +
>  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] =
> {
>  	{
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> @@ -263,4 +278,51 @@ static const struct mtk_mmsys_routes
> mmsys_mt8195_routing_table[] = {
>  	}
>  };
>  
> +/*
> + * mtk_mmsys_config table is used for config mmsys reg in runtime.
> + * MMSYS_CONFIG_MERGE_ASYNC_WIDTH: config merge async width
> + * MMSYS_CONFIG_MERGE_ASYNC_HEIGHT: config merge async height
> + * MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH: config hdr_be async width
> + * MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT: config hdr_be async height
> + * MMSYS_CONFIG_MIXER_IN_ALPHA_ODD: config mixer odd channel 9bit
> alpha value
> + * MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN: config mixer even channel 9bit
> alpha value
> + * MMSYS_CONFIG_MIXER_IN_CH_SWAP: config mixer input RGB channel
> swap
> + * MMSYS_CONFIG_HDR_ALPHA_SEL: config alpha source
> + * MMSYS_CONFIG_MIXER_IN_MODE: config mixer pad mode(bypass/even
> extend mode)
> + * MMSYS_CONFIG_MIXER_IN_BIWIDTH: config mixer pad width. formula:
> width / 2 - 1
> + */
> +static const struct mtk_mmsys_config mmsys_mt8195_config_table[] = {
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 0,
> MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 0,
> MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 1,
> MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 1,
> MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 2,
> MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 2,
> MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 3,
> MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 3,
> MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(29, 16), 16},

I would like a function to set these value

mtk_mmsys_merge_async_config(int idx, int width, int height)

and describe what does the term 'async' mean.

> +	{ MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0,
> MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
> MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(29, 16), 16},

mtk_mmsys_hdr_confing(int be_width, int be_height, bool alpha_en)

> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 1,
> MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 1,
> MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 2,
> MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 2,
> MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 3,
> MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 3,
> MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 4,
> MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 4,
> MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, MT8195_VDO1_MIXER_IN4_PAD,
> GENMASK(4, 4), 4},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 1, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(20, 20), 20},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 2, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(21, 21), 21},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 3, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(22, 22), 22},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 4, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(23, 23), 23},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 1, MT8195_VDO1_MIXER_IN1_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 2, MT8195_VDO1_MIXER_IN2_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 3, MT8195_VDO1_MIXER_IN3_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 4, MT8195_VDO1_MIXER_IN4_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 1, MT8195_VDO1_MIXER_IN1_PAD,
> GENMASK(31, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 2, MT8195_VDO1_MIXER_IN2_PAD,
> GENMASK(31, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 3, MT8195_VDO1_MIXER_IN3_PAD,
> GENMASK(31, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 4, MT8195_VDO1_MIXER_IN4_PAD,
> GENMASK(31, 16), 16},

mtk_mmsys_mixer_in_config(int idx, u16 alpha, bool channel_swap, u8
mode, u32 biwidth)

Regards,
CK

> +};
> +
>  #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 0b77624cf6ca..6dd68483012c 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -83,6 +83,8 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys1_driver_data = {
>  	.clk_driver = "clk-mt8195-vdo1",
>  	.routes = mmsys_mt8195_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +	.config = mmsys_mt8195_config_table,
> +	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =
> {
> @@ -187,6 +189,38 @@ static const struct reset_control_ops
> mtk_mmsys_reset_ops = {
>  	.reset = mtk_mmsys_reset,
>  };
>  
> +void mtk_mmsys_ddp_config(struct device *dev, enum
> mtk_mmsys_config_type config,
> +			  u32 id, u32 val)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_config *mmsys_config = mmsys->data-
> >config;
> +	u32 reg_val;
> +	u32 mask;
> +	u32 offset;
> +	int i;
> +	u32 tmp;
> +
> +	if (!mmsys->data->num_configs)
> +		return;
> +
> +	for (i = 0; i < mmsys->data->num_configs; i++)
> +		if (config == mmsys_config[i].config && id ==
> mmsys_config[i].id)
> +			break;
> +
> +	if (i == mmsys->data->num_configs)
> +		return;
> +
> +	offset = mmsys_config[i].addr;
> +	mask = mmsys_config[i].mask;
> +	reg_val = val << mmsys_config[i].shift;
> +
> +	tmp = readl(mmsys->regs + offset);
> +
> +	tmp = (tmp & ~mask) | reg_val;
> +	writel(tmp, mmsys->regs + offset);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> +
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> b/drivers/soc/mediatek/mtk-mmsys.h
> index 77f37f8c715b..78c7069bac0e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -86,11 +86,21 @@ struct mtk_mmsys_routes {
>  	u32 val;
>  };
>  
> +struct mtk_mmsys_config {
> +	enum mtk_mmsys_config_type config;
> +	u32 id;
> +	u32 addr;
> +	u32 mask;
> +	u32 shift;
> +};
> +
>  struct mtk_mmsys_driver_data {
>  	const char *clk_driver;
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
>  	const u16 sw0_rst_offset;
> +	const struct mtk_mmsys_config *config;
> +	const unsigned int num_configs;
>  };
>  
>  /*
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index eaf7f7345519..b2d2310d7e7a 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -56,6 +56,19 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_ID_MAX,
>  };
>  
> +enum mtk_mmsys_config_type {
> +	MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
> +	MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
> +	MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH,
> +	MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT,
> +	MMSYS_CONFIG_HDR_ALPHA_SEL,
> +	MMSYS_CONFIG_MIXER_IN_ALPHA_ODD,
> +	MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN,
> +	MMSYS_CONFIG_MIXER_IN_CH_SWAP,
> +	MMSYS_CONFIG_MIXER_IN_MODE,
> +	MMSYS_CONFIG_MIXER_IN_BIWIDTH,
> +};
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>  			   enum mtk_ddp_comp_id cur,
>  			   enum mtk_ddp_comp_id next);
> @@ -64,4 +77,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
>  
> +void mtk_mmsys_ddp_config(struct device *dev, enum
> mtk_mmsys_config_type config,
> +			  u32 id, u32 val);
> +
>  #endif /* __MTK_MMSYS_H */

