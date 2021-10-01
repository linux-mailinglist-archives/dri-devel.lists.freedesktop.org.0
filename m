Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4941EB49
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 13:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320A76E517;
	Fri,  1 Oct 2021 11:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8216E517
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 11:00:14 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:dd31:3048:d332:54e2] (unknown
 [IPv6:2a02:810a:880:f54:dd31:3048:d332:54e2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 679911F4554A;
 Fri,  1 Oct 2021 12:00:12 +0100 (BST)
Subject: Re: [PATCH v10, 2/5] drm/mediatek: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jassi Brar <jassisinghbrar@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-3-yongqiang.niu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <fffdc65c-9c74-3183-f8cf-293134144042@collabora.com>
Date: Fri, 1 Oct 2021 13:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930155222.5861-3-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.09.21 17:52, Yongqiang Niu wrote:
> This patch add component POSTMASK.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   2 files changed, 73 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 4a2abcf3e5f9..89170ad825fd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -62,6 +62,12 @@
>   #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
>   #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
>   
> +#define DISP_POSTMASK_EN			0x0000
> +#define POSTMASK_EN					BIT(0)
> +#define DISP_POSTMASK_CFG			0x0020
> +#define POSTMASK_RELAY_MODE				BIT(0)
> +#define DISP_POSTMASK_SIZE			0x0030
> +
>   struct mtk_ddp_comp_dev {
>   	struct clk *clk;
>   	void __iomem *regs;
> @@ -214,6 +220,32 @@ static void mtk_dither_stop(struct device *dev)
>   	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
>   }
>   
> +static void mtk_postmask_config(struct device *dev, unsigned int w,
> +				unsigned int h, unsigned int vrefresh,
> +				unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_POSTMASK_SIZE);
> +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> +		      priv->regs, DISP_POSTMASK_CFG);
> +}
> +
> +static void mtk_postmask_start(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> +}
> +
> +static void mtk_postmask_stop(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> +}
> +
>   static const struct mtk_ddp_comp_funcs ddp_aal = {
>   	.clk_enable = mtk_aal_clk_enable,
>   	.clk_disable = mtk_aal_clk_disable,
> @@ -289,6 +321,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
>   	.bgclr_in_off = mtk_ovl_bgclr_in_off,
>   };
>   
> +static const struct mtk_ddp_comp_funcs ddp_postmask = {
> +	.clk_enable = mtk_ddp_clk_enable,
> +	.clk_disable = mtk_ddp_clk_disable,
> +	.config = mtk_postmask_config,
> +	.start = mtk_postmask_start,
> +	.stop = mtk_postmask_stop,
> +};
> +
>   static const struct mtk_ddp_comp_funcs ddp_rdma = {
>   	.clk_enable = mtk_rdma_clk_enable,
>   	.clk_disable = mtk_rdma_clk_disable,
> @@ -324,6 +364,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>   	[MTK_DISP_MUTEX] = "mutex",
>   	[MTK_DISP_OD] = "od",
>   	[MTK_DISP_BLS] = "bls",
> +	[MTK_DISP_POSTMASK] = "postmask",
>   };
>   
>   struct mtk_ddp_comp_match {
> @@ -333,36 +374,37 @@ struct mtk_ddp_comp_match {
>   };
>   
>   static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> -	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
> -	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
> -	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
> -	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> -	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
> -	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
> -	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
> -	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
> -	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
> -	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
> -	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
> -	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
> -	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
> -	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> -	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
> -	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
> -	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> -	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> -	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
> -	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> -	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
> -	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> -	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
> -	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> +	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
> +	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
> +	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
> +	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> +	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
> +	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
> +	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
> +	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
> +	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
> +	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
> +	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
> +	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
> +	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
> +	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> +	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
> +	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
> +	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },

Hi, I can't see where is DDP_COMPONENT_POSTMASK0 defined.

Thanks,
Dafna

> +	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
> +	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
> +	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
> +	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
> +	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> +	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
> +	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
>   };
>   
>   static bool mtk_drm_find_comp_in_ddp(struct device *dev,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..cd1dec6b4cdf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>   	MTK_DISP_UFOE,
>   	MTK_DSI,
>   	MTK_DPI,
> +	MTK_DISP_POSTMASK,
>   	MTK_DISP_PWM,
>   	MTK_DISP_MUTEX,
>   	MTK_DISP_OD,
> 
