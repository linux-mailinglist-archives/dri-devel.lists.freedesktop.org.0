Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092B306CB4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 06:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453C89350;
	Thu, 28 Jan 2021 05:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AD6D89350
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:22:01 +0000 (UTC)
X-UUID: 05fcc12e37534f9cb16e399a4f9711de-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/pktXs/wn5J8yEqVNUEYeMaMl9r2rAFdxrOGFNkrSkM=; 
 b=PnpzPdTiKCQQ9b5/3OgTqMV9ORINQgqGAqCTy4LLr5UEMBQHbr5TMQ0olJbQ5hz1k4dzvUKCgV34ujgXZkiPq5Pq0jevpt5Enz+PoeyvK21ym/rxM9BIYlBk4neJmh1GUw0DDfLA3aFtibMgxjAInF6DVAAu7eo8bmgp8F9yBhI=;
X-UUID: 05fcc12e37534f9cb16e399a4f9711de-20210128
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2109424651; Thu, 28 Jan 2021 13:21:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 13:21:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 13:21:50 +0800
Message-ID: <1611811310.25395.4.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/9] drm/mediatek: generalize mtk_dither_set() function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 13:21:50 +0800
In-Reply-To: <CAJMQK-jeBBsxZ1RnFJfT5ouNJsBwEkLbZ_+6T+VUFZ_xDQ7rpQ@mail.gmail.com>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-5-hsinyi@chromium.org>
 <1611808753.19104.2.camel@mtksdaap41>
 <CAJMQK-jeBBsxZ1RnFJfT5ouNJsBwEkLbZ_+6T+VUFZ_xDQ7rpQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 80E37F9612338877016C51274D77713CD38E07D9BF6559E650938D31C7674E2C2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David
 Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-01-28 at 13:09 +0800, Hsin-Yi Wang wrote:
> On Thu, Jan 28, 2021 at 12:39 PM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Hsin-Yi:
> >
> > On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > > There may be data structure other than mtk_ddp_comp_dev that would call
> > > mtk_dither_set(), so use regs as parameter instead of device.
> >
> > You does not change the interface of mtk_dither_set(). You move the
> > common part in mtk_dither_set() to a new function which could be called
> > by another caller.
> >
> > Regards,
> > CK.
> >
> Current mtk_dither_set() cast dev data to struct mtk_ddp_comp_dev. But
> mtk_disp_gamma in next patch would also call this function. But it's
> dev data is struct mtk_disp_gamma, which is different, so we can't
> cast to mtk_ddp_comp_dev. I separate the necessary parameters (regs,
> cmdq_reg) out, so both component dither and gamma can both call this
> separated function.

I know this. This patch looks good to me but the description would
confuse me.From the description, it seems that you modify the interface
of mtk_dither_set(). So please modify the description to be more clear.

Regards,
CK

> 
> This is similar to the mtk_gamma_set_common() in the next patch, which
> gamma and aal both used.
> 
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++++
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 25 +++++++++++++--------
> > >  2 files changed, 20 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > index 46d199b7b4a29..c50d5fc9fd349 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > @@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
> > >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > >  void mtk_color_start(struct device *dev);
> > >
> > > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +                        unsigned int bpc, unsigned int CFG,
> > > +                        struct cmdq_pkt *cmdq_pkt);
> > > +
> > >  void mtk_dpi_start(struct device *dev);
> > >  void mtk_dpi_stop(struct device *dev);
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > index 7b5293429426d..53d25823a37cc 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > @@ -151,33 +151,40 @@ static void mtk_ddp_clk_disable(struct device *dev)
> > >       clk_disable_unprepare(priv->clk);
> > >  }
> > >
> > > -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > > -                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > > -{
> > > -     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > >
> > > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +                        unsigned int bpc, unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > > +{
> > >       /* If bpc equal to 0, the dithering function didn't be enabled */
> > >       if (bpc == 0)
> > >               return;
> > >
> > >       if (bpc >= MTK_MIN_BPC) {
> > > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
> > > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
> > > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> > > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
> > >               mtk_ddp_write(cmdq_pkt,
> > >                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > >                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > >                             DITHER_NEW_BIT_MODE,
> > > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
> > > +                           cmdq_reg, regs, DISP_DITHER_15);
> > >               mtk_ddp_write(cmdq_pkt,
> > >                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > >                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > >                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > >                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
> > > -             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
> > > +                           cmdq_reg, regs, DISP_DITHER_16);
> > > +             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, cmdq_reg, regs, CFG);
> > >       }
> > >  }
> > >
> > > +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > > +                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > > +{
> > > +     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > +
> > > +     mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, CFG, cmdq_pkt);
> > > +}
> > > +
> > >  static void mtk_od_config(struct device *dev, unsigned int w,
> > >                         unsigned int h, unsigned int vrefresh,
> > >                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> >
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
