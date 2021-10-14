Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E036342DB80
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 16:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DCC6E2F2;
	Thu, 14 Oct 2021 14:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFBE6E2F2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:27:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62F1F1F44AD7
Subject: Re: [PATCH v11 15/16] drm/mediatek: add MERGE support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, hsinyi@chromium.org,
 fshao@chromium.org, moudy.ho@mediatek.com, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-16-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3e72dd1e-edf2-6d42-40e7-0c1c72749a20@collabora.com>
Date: Thu, 14 Oct 2021 16:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921155218.10387-16-jason-jh.lin@mediatek.com>
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

Il 21/09/21 17:52, jason-jh.lin ha scritto:
> Add MERGE engine file:
> MERGE module is used to merge two slice-per-line inputs
> into one side-by-side output.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> rebase on series [1]
> 
> [1] drm/mediatek: add support for mediatek SOC MT8192
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
> ---
>   drivers/gpu/drm/mediatek/Makefile           |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 239 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>   7 files changed, 269 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 29098d7c8307..a38e88e82d12 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -4,6 +4,7 @@ mediatek-drm-y := mtk_disp_aal.o \
>   		  mtk_disp_ccorr.o \
>   		  mtk_disp_color.o \
>   		  mtk_disp_gamma.o \
> +		  mtk_disp_merge.o \
>   		  mtk_disp_ovl.o \
>   		  mtk_disp_rdma.o \
>   		  mtk_drm_crtc.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 86c3068894b1..a33b13fe2b6e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -55,6 +55,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
>   void mtk_gamma_start(struct device *dev);
>   void mtk_gamma_stop(struct device *dev);
>   
> +int mtk_merge_clk_enable(struct device *dev);
> +void mtk_merge_clk_disable(struct device *dev);
> +void mtk_merge_config(struct device *dev, unsigned int width,
> +		      unsigned int height, unsigned int vrefresh,
> +		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start(struct device *dev);
> +void mtk_merge_stop(struct device *dev);
> +
>   void mtk_ovl_bgclr_in_on(struct device *dev);
>   void mtk_ovl_bgclr_in_off(struct device *dev);
>   void mtk_ovl_bypass_shadow(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> new file mode 100644
> index 000000000000..b05e1df79c3d
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_disp_drv.h"
> +
> +#define DISP_REG_MERGE_CTRL		0x000
> +#define MERGE_EN				1
> +#define DISP_REG_MERGE_CFG_0		0x010
> +#define DISP_REG_MERGE_CFG_4		0x020
> +#define DISP_REG_MERGE_CFG_10		0x038
> +/* no swap */
> +#define SWAP_MODE				0
> +#define FLD_SWAP_MODE				GENMASK(4, 0)
> +#define DISP_REG_MERGE_CFG_12		0x040
> +#define CFG_10_10_1PI_2PO_BUF_MODE		6
> +#define CFG_10_10_2PI_2PO_BUF_MODE		8
> +#define FLD_CFG_MERGE_MODE			GENMASK(4, 0)
> +#define DISP_REG_MERGE_CFG_24		0x070
> +#define DISP_REG_MERGE_CFG_25		0x074
> +#define DISP_REG_MERGE_CFG_36		0x0a0
> +#define ULTRA_EN				BIT(0)
> +#define PREULTRA_EN				BIT(4)
> +#define DISP_REG_MERGE_CFG_37		0x0a4
> +/* 0: Off, 1: SRAM0, 2: SRAM1, 3: SRAM0 + SRAM1 */
> +#define BUFFER_MODE				3
> +#define FLD_BUFFER_MODE				GENMASK(1, 0)
> +/*
> + * For the ultra and preultra settings, 6us ~ 9us is experience value
> + * and the maximum frequency of mmsys clock is 594MHz.
> + */
> +#define DISP_REG_MERGE_CFG_40		0x0b0
> +/* 6 us, 594M pixel/sec */
> +#define ULTRA_TH_LOW				(6 * 594)
> +/* 8 us, 594M pixel/sec */
> +#define ULTRA_TH_HIGH				(8 * 594)
> +#define FLD_ULTRA_TH_LOW			GENMASK(15, 0)
> +#define FLD_ULTRA_TH_HIGH			GENMASK(31, 16)
> +#define DISP_REG_MERGE_CFG_41		0x0b4
> +/* 8 us, 594M pixel/sec */
> +#define PREULTRA_TH_LOW				(8 * 594)
> +/* 9 us, 594M pixel/sec */
> +#define PREULTRA_TH_HIGH			(9 * 594)
> +#define FLD_PREULTRA_TH_LOW			GENMASK(15, 0)
> +#define FLD_PREULTRA_TH_HIGH			GENMASK(31, 16)
> +
> +struct mtk_disp_merge {
> +	void __iomem *regs;
> +	struct clk *clk;
> +	struct clk *async_clk;
> +	struct cmdq_client_reg		cmdq_reg;
> +	bool				fifo_en;
> +};
> +
> +void mtk_merge_start(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +}
> +
> +static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> +				   struct cmdq_pkt *cmdq_pkt)
> +{
> +	mtk_ddp_write(cmdq_pkt, ULTRA_EN | PREULTRA_EN,
> +		      &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_36);
> +
> +	mtk_ddp_write_mask(cmdq_pkt, BUFFER_MODE,
> +			   &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_37,
> +			   FLD_BUFFER_MODE);
> +
> +	mtk_ddp_write_mask(cmdq_pkt, ULTRA_TH_LOW | ULTRA_TH_HIGH << 16,
> +			   &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_40,
> +			   FLD_ULTRA_TH_LOW | FLD_ULTRA_TH_HIGH);
> +
> +	mtk_ddp_write_mask(cmdq_pkt, PREULTRA_TH_LOW | PREULTRA_TH_HIGH << 16,
> +			   &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_41,
> +			   FLD_PREULTRA_TH_LOW | FLD_PREULTRA_TH_HIGH);
> +}
> +
> +void mtk_merge_config(struct device *dev, unsigned int w,
> +		      unsigned int h, unsigned int vrefresh,
> +		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +	unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
> +
> +	if (!h || !w) {
> +		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, w, h);
> +		return;
> +	}
> +
> +	if (priv->fifo_en) {
> +		mtk_merge_fifo_setting(priv, cmdq_pkt);
> +		mode = CFG_10_10_2PI_2PO_BUF_MODE;
> +	}
> +
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CFG_0);
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CFG_4);
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CFG_24);
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CFG_25);
> +	mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->regs,
> +			   DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
> +	mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
> +			   DISP_REG_MERGE_CFG_12, FLD_CFG_MERGE_MODE);
> +}
> +
> +int mtk_merge_clk_enable(struct device *dev)
> +{
> +	int ret = 0;
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		pr_err("merge clk prepare enable failed\n");

If you failed to enable this clock, I take it as the hardware won't work or
won't work as expected, hence you should return a failure before trying to
call prepare_enable for async_clk.

> +	ret = clk_prepare_enable(priv->async_clk);
> +	if (ret)
> +		pr_err("async clk prepare enable failed\n");
> +

You should also return a failure here but, before that, you should clean up
the state by calling clk_disable_unprepare(priv->clk), or you will leave it
enabled, eventually getting a hardware fault later on (which may or may not
result in a board reboot), or other sorts of unexpected states.

At least, you will get issues with the refcount for "clk" and/or "async_clk".

Please fix that.

Also, please use dev_err or, more appropriately, DRM_ERROR instead or pr_err.

> +	return ret;
> +}
> +
> +void mtk_merge_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(priv->async_clk); > +	clk_disable_unprepare(priv->clk);
> +}
> +
> +static int mtk_disp_merge_bind(struct device *dev, struct device *master,
> +			       void *data)
> +{
> +	return 0;
> +}
> +
> +static void mtk_disp_merge_unbind(struct device *dev, struct device *master,
> +				  void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_merge_component_ops = {
> +	.bind	= mtk_disp_merge_bind,
> +	.unbind = mtk_disp_merge_unbind,
> +};
> +
> +static int mtk_disp_merge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct mtk_disp_merge *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regs)) {
> +		dev_err(dev, "failed to ioremap merge\n");
> +		return PTR_ERR(priv->regs);
> +	}
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "failed to get merge clk\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	priv->async_clk = of_clk_get(dev->of_node, 1);
> +	if (IS_ERR(priv->async_clk)) {
> +		ret = PTR_ERR(priv->async_clk);
> +		dev_dbg(dev, "No merge async clock: %d\n", ret);
> +		priv->async_clk = NULL;
> +	}
> +

You are using devm_clk_get for the first clock, of_clk_get for the second one:
what's the reason for that?

Also, async_clk seems to be optional... and there's the right API for you!
If you use devm_clk_get_optional(), you won't have to manually assign NULL
to priv->async_clk, as that's API handled... and you'll get a failure if
the return value is an error that's not -ENOENT (so, it'll fail if the clock
was declared in DT, but there was an error acquiring it).

Please use devm_clk_get_optional() here.


Regards,
- Angelo
