Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A740D1EA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 05:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7572E6EA9C;
	Thu, 16 Sep 2021 03:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BB46EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 03:07:20 +0000 (UTC)
X-UUID: 118a83b17f3e47a8828ad8e8f4f66b7e-20210916
X-UUID: 118a83b17f3e47a8828ad8e8f4f66b7e-20210916
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 269446731; Thu, 16 Sep 2021 11:07:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 11:07:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 11:07:07 +0800
Message-ID: <f67fd64ba276177d1590829b83dd2fae43334495.camel@mediatek.com>
Subject: Re: [PATCH v5 08/16] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Rob Herring"
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 11:07:06 +0800
In-Reply-To: <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-9-nancy.lin@mediatek.com>
 <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Chun-Kuang,

Thanks for the review.

On Wed, 2021-09-08 at 00:29 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年9月6日 週一 下午3:15寫道：
> > 
> > Add cmdq support for mtk-mmsys config API.
> > The mmsys config register settings need to take effect with the
> > other
> > HW settings(like OVL_ADAPTOR...) at the same vblanking time.
> > 
> > If we use CPU to write the mmsys reg, we can't guarantee all the
> > settings can be written in the same vblanking time.
> > Cmdq is used for this purpose. We prepare all the related HW
> > settings
> > in one cmdq packet. The first command in the packet is "wait stream
> > done",
> > and then following with all the HW settings. After the cmdq packet
> > is
> > flush to GCE HW. The GCE waits for the "stream done event" to
> > coming
> > and then starts flushing all the HW settings. This can guarantee
> > all
> > the settings flush in the same vblanking.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-mmsys.c       | 28 +++++++++++++++++++++-
> > ----
> >  include/linux/soc/mediatek/mtk-mmsys.h |  6 +++++-
> >  2 files changed, 28 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 3a38b8269c71..060065501b8a 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -81,6 +81,7 @@ struct mtk_mmsys {
> >         const struct mtk_mmsys_driver_data *data;
> >         spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> >         struct reset_controller_dev rcdev;
> > +       struct cmdq_client_reg cmdq_base;
> >  };
> > 
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> > @@ -174,7 +175,7 @@ static const struct reset_control_ops
> > mtk_mmsys_reset_ops = {
> >  };
> > 
> >  void mtk_mmsys_ddp_config(struct device *dev, enum
> > mtk_mmsys_config_type config,
> > -                         u32 id, u32 val)
> > +                         u32 id, u32 val, struct cmdq_pkt
> > *cmdq_pkt)
> >  {
> >         struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >         const struct mtk_mmsys_config *mmsys_config = mmsys->data-
> > >config;
> > @@ -197,10 +198,20 @@ void mtk_mmsys_ddp_config(struct device *dev,
> > enum mtk_mmsys_config_type config,
> >         mask = mmsys_config[i].mask;
> >         reg_val = val << mmsys_config[i].shift;
> > 
> > -       u32 tmp = readl(mmsys->regs + offset);
> > -
> > -       tmp = (tmp & ~mask) | reg_val;
> > -       writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +       if (cmdq_pkt && mmsys->cmdq_base.size) {
> > +               cmdq_pkt_write_mask(cmdq_pkt, mmsys-
> > >cmdq_base.subsys,
> > +                                   mmsys->cmdq_base.offset +
> > offset, reg_val,
> > +                                   mask);
> > +       } else {
> > +#endif
> > +               u32 tmp = readl(mmsys->regs + offset);
> > +
> > +               tmp = (tmp & ~mask) | reg_val;
> > +               writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +       }
> > +#endif
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> > 
> > @@ -236,6 +247,13 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >         }
> > 
> >         mmsys->data = of_device_get_match_data(&pdev->dev);
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +       ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> 
> Define mediatek,gce-client-reg in binding document first.
> 
> Regards,
> Chun-Kuang.
> 
OK, I will add binding document in the next revision.

Regards,
Nancy Lin

> > +       if (ret)
> > +               dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > +#endif
> > +
> >         platform_set_drvdata(pdev, mmsys);
> > 
> >         clks = platform_device_register_data(&pdev->dev, mmsys-
> > >data->clk_driver,
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index ef2a6d9a834b..9705d242849a 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -6,6 +6,10 @@
> >  #ifndef __MTK_MMSYS_H
> >  #define __MTK_MMSYS_H
> > 
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> > +
> >  enum mtk_ddp_comp_id;
> >  struct device;
> > 
> > @@ -75,6 +79,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >                               enum mtk_ddp_comp_id next);
> > 
> >  void mtk_mmsys_ddp_config(struct device *dev, enum
> > mtk_mmsys_config_type config,
> > -                         u32 id, u32 val);
> > +                         u32 id, u32 val, struct cmdq_pkt
> > *cmdq_pkt);
> > 
> >  #endif /* __MTK_MMSYS_H */
> > --
> > 2.18.0
> > 

