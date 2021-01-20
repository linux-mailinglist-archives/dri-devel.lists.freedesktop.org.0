Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C3C2FD9CF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 20:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92BB6E43C;
	Wed, 20 Jan 2021 19:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7073F6E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 19:39:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B55233FC;
 Wed, 20 Jan 2021 19:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611171544;
 bh=Tr2T1TG9tH71c/1ys9tyq2uBeh81YP3UeML3plQAmIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZrW845pr/ITVJyxjj4fDh9JwByEgLUfdl5TM+XfPCQrAGblH0OzKliXP5e2bmItyA
 SIL56R6cY179f2qcNITl5yKhJGMGfP6/bjqRgrqv9A4/u8rQfc5Hijc1Re918XekRp
 nsftWh5ToO2WGP2jmHpoJvb+6DD8Pg/NuZ/DqSUZCqz1FNC0IAoogl3A3mekTGN1tk
 VVYH9GHLKEYFx6vKBKcm8pq4x63kTZs6oPJPlVBUyIqrQDsgMGzRbn5CJel6R63yCR
 cCBprk0r5v/1S5jK/1b4vWeFnEgOS/OGcVeXIUXT470qwE1R7Dvhrrg0Cal4jX7pRN
 Ai3Uc0oQ+6hVw==
Date: Wed, 20 Jan 2021 20:38:57 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v4, 03/10] soc: mediatek: mmsys: move register operation
 into mmsys path select function
Message-ID: <YAiG0UIfZPCRhMYd@ziggy.stardust>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-4-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609815993-22744-4-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 11:06:26AM +0800, Yongqiang Niu wrote:
> move register operation into mmsys path select function

Why do you want to do that. It seems the register access pattern is the
same for all SoCs so far supported, so I don't see the need to duplicate
the code in every SoC.

Regards,
Matthias

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 140 +++++++++++++++++----------------
>  1 file changed, 71 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> index 6c03282..64c8030 100644
> --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> @@ -106,141 +106,161 @@ struct mtk_mmsys {
>  	.clk_driver = "clk-mt8183-mm",
>  };
>  
> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> -					  enum mtk_ddp_comp_id next,
> -					  unsigned int *addr)
> +static void mtk_mmsys_ddp_mout_en(void __iomem *config_regs,
> +				  enum mtk_ddp_comp_id cur,
> +				  enum mtk_ddp_comp_id next,
> +				  bool enable)
>  {
> -	unsigned int value;
> +	unsigned int addr, value, reg;
>  
>  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>  		value = OVL0_MOUT_EN_COLOR0;
>  	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>  		value = OVL_MOUT_EN_RDMA;
>  	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>  		value = OD_MOUT_EN_RDMA0;
>  	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>  		value = UFOE_MOUT_EN_DSI0;
>  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>  		value = OVL1_MOUT_EN_COLOR1;
>  	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>  		value = GAMMA_MOUT_EN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>  		value = OD1_MOUT_EN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>  		value = RDMA0_SOUT_DPI0;
>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>  		value = RDMA0_SOUT_DPI1;
>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>  		value = RDMA0_SOUT_DSI1;
>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>  		value = RDMA0_SOUT_DSI2;
>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>  		value = RDMA0_SOUT_DSI3;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>  		value = RDMA1_SOUT_DSI1;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>  		value = RDMA1_SOUT_DSI2;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>  		value = RDMA1_SOUT_DSI3;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>  		value = RDMA1_SOUT_DPI0;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>  		value = RDMA1_SOUT_DPI1;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>  		value = RDMA2_SOUT_DPI0;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>  		value = RDMA2_SOUT_DPI1;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>  		value = RDMA2_SOUT_DSI1;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>  		value = RDMA2_SOUT_DSI2;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>  		value = RDMA2_SOUT_DSI3;
>  	} else {
>  		value = 0;
>  	}
>  
> -	return value;
> +	if (value) {
> +		reg = readl_relaxed(config_regs + addr);
> +
> +		if (enable)
> +			reg |= value;
> +		else
> +			reg &= ~value;
> +
> +		writel_relaxed(reg, config_regs + addr);
> +	}
>  }
>  
> -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> -					 enum mtk_ddp_comp_id next,
> -					 unsigned int *addr)
> +static void mtk_mmsys_ddp_sel_in(void __iomem *config_regs,
> +				 enum mtk_ddp_comp_id cur,
> +				 enum mtk_ddp_comp_id next,
> +				 bool enable)
>  {
> -	unsigned int value;
> +	unsigned int addr, value, reg;
>  
>  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> +		addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>  		value = COLOR0_SEL_IN_OVL0;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>  		value = DPI0_SEL_IN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>  		value = DPI1_SEL_IN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>  		value = DSI0_SEL_IN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>  		value = DSI1_SEL_IN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>  		value = DSI2_SEL_IN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>  		value = DSI3_SEL_IN_RDMA1;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>  		value = DPI0_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>  		value = DPI1_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>  		value = DSI0_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>  		value = DSI1_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>  		value = DSI2_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>  		value = DSI3_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> +		addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>  		value = COLOR1_SEL_IN_OVL1;
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DSI_SEL;
> +		addr = DISP_REG_CONFIG_DSI_SEL;
>  		value = DSI_SEL_IN_BLS;
>  	} else {
>  		value = 0;
>  	}
>  
> -	return value;
> +	if (value) {
> +		reg = readl_relaxed(config_regs + addr);
> +
> +		if (enable)
> +			reg |= value;
> +		else
> +			reg &= ~value;
> +
> +		writel_relaxed(reg, config_regs + addr);
> +	}
>  }
>  
>  static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> @@ -265,21 +285,12 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>  			   enum mtk_ddp_comp_id next)
>  {
>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> -	unsigned int addr, value, reg;
>  
> -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(mmsys->regs + addr) | value;
> -		writel_relaxed(reg, mmsys->regs + addr);
> -	}
> +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, true);
>  
>  	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
>  
> -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(mmsys->regs + addr) | value;
> -		writel_relaxed(reg, mmsys->regs + addr);
> -	}
> +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, true);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>  
> @@ -288,19 +299,10 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id next)
>  {
>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> -	unsigned int addr, value, reg;
>  
> -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
> -		writel_relaxed(reg, mmsys->regs + addr);
> -	}
> +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, false);
>  
> -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
> -		writel_relaxed(reg, mmsys->regs + addr);
> -	}
> +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, false);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> -- 
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
