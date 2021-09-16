Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A428340D1C1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 04:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC146EA93;
	Thu, 16 Sep 2021 02:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A69C6EA93
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:51:23 +0000 (UTC)
X-UUID: 8fd52dd9c2c34f739b8823885c0ab749-20210916
X-UUID: 8fd52dd9c2c34f739b8823885c0ab749-20210916
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1386424549; Thu, 16 Sep 2021 10:51:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 10:51:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 10:51:07 +0800
Message-ID: <dc2b882b49078251c8a90708a6231ec38c4aaa94.camel@mediatek.com>
Subject: Re: [PATCH v5 09/16] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 10:51:08 +0800
In-Reply-To: <d93c6866fb8a6e9bebf3b3ed6959e2c3abaf647d.camel@pengutronix.de>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-10-nancy.lin@mediatek.com>
 <d93c6866fb8a6e9bebf3b3ed6959e2c3abaf647d.camel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Philipp,

Thanks for the review.

On Mon, 2021-09-06 at 09:29 +0200, Philipp Zabel wrote:
> Hi Nancy,
> 
> On Mon, 2021-09-06 at 15:15 +0800, Nancy.Lin wrote:
> > MT8195 vdosys1 has more than 32 reset bits and a different reset
> > base
> > than other chips. Modify mmsys for support 64 bit and different
> > reset
> > base.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> >  drivers/soc/mediatek/mtk-mmsys.c    | 15 ++++++++++++---
> >  drivers/soc/mediatek/mtk-mmsys.h    |  1 +
> >  3 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 648baaec112b..f67801c42fd9 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -123,6 +123,7 @@
> >  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> >  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 <<
> > 0)
> >  
> > +#define MT8195_VDO1_SW0_RST_B           0x1d0
> >  #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> >  #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
> >  #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 060065501b8a..97cb26339ef6 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -18,6 +18,8 @@
> >  #include "mt8365-mmsys.h"
> >  #include "mt8195-mmsys.h"
> >  
> > +#define MMSYS_SW_RESET_PER_REG 32
> > +
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt2701-mm",
> >  	.routes = mmsys_default_routing_table,
> > @@ -48,12 +50,14 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >  	.clk_driver = "clk-mt8173-mm",
> >  	.routes = mmsys_default_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> > +	.sw_reset_start = MMSYS_SW0_RST_B,
> >  };
> >  
> >  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt8183-mm",
> >  	.routes = mmsys_mt8183_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> > +	.sw_reset_start = MMSYS_SW0_RST_B,
> >  };
> >  
> >  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data
> > = {
> > @@ -74,6 +78,7 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >  	.config = mmsys_mt8195_config_table,
> >  	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
> > +	.sw_reset_start = MT8195_VDO1_SW0_RST_B,
> >  };
> >  
> >  struct mtk_mmsys {
> > @@ -126,19 +131,23 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >  {
> >  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >  	unsigned long flags;
> > +	u32 offset;
> >  	u32 reg;
> >  	int i;
> >  
> > +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > +	id = id % MMSYS_SW_RESET_PER_REG;
> > +
> >  	spin_lock_irqsave(&mmsys->lock, flags);
> >  
> > -	reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> > +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw_reset_start +
> > offset);
> >  
> >  	if (assert)
> >  		reg &= ~BIT(id);
> >  	else
> >  		reg |= BIT(id);
> >  
> > -	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> > +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw_reset_start +
> > offset);
> >  
> >  	spin_unlock_irqrestore(&mmsys->lock, flags);
> >  
> > @@ -237,7 +246,7 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >  	spin_lock_init(&mmsys->lock);
> >  
> >  	mmsys->rcdev.owner = THIS_MODULE;
> > -	mmsys->rcdev.nr_resets = 32;
> > +	mmsys->rcdev.nr_resets = 64;
> 
> If only MT8195 vdosys1 has more than 32 reset bits, this should be
> kept
> at 32 for the others.
> 
> regards

OK, I will modify it in the next revision.
> Philipp

