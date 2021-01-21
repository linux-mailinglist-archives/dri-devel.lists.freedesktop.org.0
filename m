Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655292FE58B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179296E8F3;
	Thu, 21 Jan 2021 08:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37B4D6E4E6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 00:57:04 +0000 (UTC)
X-UUID: 22c6d51bed8e4aa99b4d885bc1feef25-20210121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=/dP5wm6CNuyT3vNiZvx2XBt+dwobgLw/9qYKIOrg8ik=; 
 b=OOmc2G85TxC8uEk1Fl2aVq+AekcZa+jTtbWUb80KttH5NytDvFPRjycgTRblSK2zSZsTLxiMazGOsfxvlNEEkl0ZUq9WAY/1bwmAYB3wGNzd2GdO5nYX0Yp65D0nuhUmizfACO0qxg8Hihv31g10YngKmAtAPt/oHJkmcDFp3MM=;
X-UUID: 22c6d51bed8e4aa99b4d885bc1feef25-20210121
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1566242809; Thu, 21 Jan 2021 08:56:59 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Jan 2021 08:56:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 08:56:56 +0800
Message-ID: <1611190616.22801.6.camel@mhfsdcap03>
Subject: Re: [PATCH v4, 03/10] soc: mediatek: mmsys: move register operation
 into mmsys path select function
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Matthias Brugger <matthias.bgg@kernel.org>
Date: Thu, 21 Jan 2021 08:56:56 +0800
In-Reply-To: <YAiG0UIfZPCRhMYd@ziggy.stardust>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-4-git-send-email-yongqiang.niu@mediatek.com>
 <YAiG0UIfZPCRhMYd@ziggy.stardust>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-01-20 at 20:38 +0100, Matthias Brugger wrote:
> On Tue, Jan 05, 2021 at 11:06:26AM +0800, Yongqiang Niu wrote:
> > move register operation into mmsys path select function
> 
> Why do you want to do that. It seems the register access pattern is the
> same for all SoCs so far supported, so I don't see the need to duplicate
> the code in every SoC.
> 
> Regards,
> Matthias

mt2701 and mt8173 ovl mout en already different.
mt2701 ovl mout en register offset is 0x30
mt8173 olv mout en register offset is 0x40

only the use case is different;
mt2701 ovl->color0
mt8173 ovl->rmda0
there make different define for this different.

#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040

#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030

for the future mt8183, ovl mout en register offset will change to
0xf00

this is only one different sample, there will be more and more
different, so we add this patch for different soc


> 
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 140 +++++++++++++++++----------------
> >  1 file changed, 71 insertions(+), 69 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > index 6c03282..64c8030 100644
> > --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > @@ -106,141 +106,161 @@ struct mtk_mmsys {
> >  	.clk_driver = "clk-mt8183-mm",
> >  };
> >  
> > -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > -					  enum mtk_ddp_comp_id next,
> > -					  unsigned int *addr)
> > +static void mtk_mmsys_ddp_mout_en(void __iomem *config_regs,
> > +				  enum mtk_ddp_comp_id cur,
> > +				  enum mtk_ddp_comp_id next,
> > +				  bool enable)
> >  {
> > -	unsigned int value;
> > +	unsigned int addr, value, reg;
> >  
> >  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> >  		value = OVL0_MOUT_EN_COLOR0;
> >  	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> >  		value = OVL_MOUT_EN_RDMA;
> >  	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> >  		value = OD_MOUT_EN_RDMA0;
> >  	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> >  		value = UFOE_MOUT_EN_DSI0;
> >  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> >  		value = OVL1_MOUT_EN_COLOR1;
> >  	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> > -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> >  		value = GAMMA_MOUT_EN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> > -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> >  		value = OD1_MOUT_EN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DPI0;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DPI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DSI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DSI2;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DSI3;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI2;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI3;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DPI0;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DPI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DPI0;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DPI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DSI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DSI2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DSI3;
> >  	} else {
> >  		value = 0;
> >  	}
> >  
> > -	return value;
> > +	if (value) {
> > +		reg = readl_relaxed(config_regs + addr);
> > +
> > +		if (enable)
> > +			reg |= value;
> > +		else
> > +			reg &= ~value;
> > +
> > +		writel_relaxed(reg, config_regs + addr);
> > +	}
> >  }
> >  
> > -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > -					 enum mtk_ddp_comp_id next,
> > -					 unsigned int *addr)
> > +static void mtk_mmsys_ddp_sel_in(void __iomem *config_regs,
> > +				 enum mtk_ddp_comp_id cur,
> > +				 enum mtk_ddp_comp_id next,
> > +				 bool enable)
> >  {
> > -	unsigned int value;
> > +	unsigned int addr, value, reg;
> >  
> >  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> >  		value = COLOR0_SEL_IN_OVL0;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI0_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI1_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI0_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI1_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI2_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI3_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI0_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI1_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI0_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI1_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI2_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI3_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> >  		value = COLOR1_SEL_IN_OVL1;
> >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSI_SEL;
> > +		addr = DISP_REG_CONFIG_DSI_SEL;
> >  		value = DSI_SEL_IN_BLS;
> >  	} else {
> >  		value = 0;
> >  	}
> >  
> > -	return value;
> > +	if (value) {
> > +		reg = readl_relaxed(config_regs + addr);
> > +
> > +		if (enable)
> > +			reg |= value;
> > +		else
> > +			reg &= ~value;
> > +
> > +		writel_relaxed(reg, config_regs + addr);
> > +	}
> >  }
> >  
> >  static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> > @@ -265,21 +285,12 @@ void mtk_mmsys_ddp_connect(struct device *dev,
> >  			   enum mtk_ddp_comp_id next)
> >  {
> >  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > -	unsigned int addr, value, reg;
> >  
> > -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) | value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, true);
> >  
> >  	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
> >  
> > -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) | value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, true);
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >  
> > @@ -288,19 +299,10 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >  			      enum mtk_ddp_comp_id next)
> >  {
> >  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > -	unsigned int addr, value, reg;
> >  
> > -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, false);
> >  
> > -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, false);
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >  
> > -- 
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
