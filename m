Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5CD416B1B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 06:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322096E18F;
	Fri, 24 Sep 2021 04:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969766E18F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 04:59:43 +0000 (UTC)
X-UUID: 82d75b44544c446585d416dfa7d1d742-20210924
X-UUID: 82d75b44544c446585d416dfa7d1d742-20210924
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 24964835; Fri, 24 Sep 2021 12:59:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 12:59:37 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 12:59:37 +0800
Message-ID: <abee5fc6e06233001214d44a46db341687cec7b6.camel@mediatek.com>
Subject: Re: [PATCH v5 13/16] drm/mediatek: add ETHDR support for MT8195
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
Date: Fri, 24 Sep 2021 12:59:37 +0800
In-Reply-To: <CAAOTY_-MUv8Ey0MSFgdK6vuwrg2UaY52PQua=a9cSrZgRz+ZLQ@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-14-nancy.lin@mediatek.com>
 <CAAOTY_-MUv8Ey0MSFgdK6vuwrg2UaY52PQua=a9cSrZgRz+ZLQ@mail.gmail.com>
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

On Wed, 2021-09-22 at 08:09 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年9月6日 週一 下午3:15寫道：
> > 
> > ETHDR is a part of ovl_adaptor.
> > ETHDR is designed for HDR video and graphics conversion in the
> > external
> > display path. It handles multiple HDR input types and performs tone
> > mapping, color space/color format conversion, and then combine
> > different layers, output the required HDR or SDR signal to the
> > subsequent display path.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/Makefile    |   1 +
> >  drivers/gpu/drm/mediatek/mtk_ethdr.c | 424
> > +++++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_ethdr.h |  25 ++
> >  3 files changed, 450 insertions(+)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
> 
> [snip]
> 
> > +
> > +void mtk_ethdr_disable_vblank(struct device *dev)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +       unsigned long flags;
> > +
> > +       spin_lock_irqsave(&priv->lock, flags);
> > +       priv->vblank_cb = NULL;
> > +       priv->vblank_cb_data = NULL;
> > +       spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs +
> > MIX_INTEN);
> > +}
> > +
> > +static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
> > +{
> > +       struct mtk_ethdr *priv = dev_id;
> > +       unsigned long flags;
> > +
> > +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs +
> > MIX_INTSTA);
> > +
> > +       spin_lock_irqsave(&priv->lock, flags);
> > +       if (!priv->vblank_cb) {
> > +               spin_unlock_irqrestore(&priv->lock, flags);
> > +               return IRQ_NONE;
> > +       }
> > +
> > +       priv->vblank_cb(priv->vblank_cb_data);
> > +       spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
> > +                           struct mtk_plane_state *state,
> > +                           struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +       struct mtk_ethdr_comp *mixer = &priv-
> > >ethdr_comp[ETHDR_MIXER];
> > +       struct mtk_plane_pending_state *pending = &state->pending;
> > +       unsigned int offset = (pending->y << 16) | pending->x;
> 
> unsigned int offset = (pending->x & 1) << 31 |  pending->y << 16 |
> pending->x;
> 
> So you don't need x_offset_odd.
> 
OK, I will modify it.

> > +
> >        unsigned int mixer_pad_mode = MIXER_INx_MODE_BYPASS;
> > +       unsigned int alpha_con = 0;
> > +       unsigned int fmt = 0;
> > +       bool x_offset_odd = false;
> > +
> > +       dev_dbg(dev, "%s+ idx:%d", __func__, idx);
> > +
> > +       if (idx >= 4)
> > +               return;
> > +
> > +       if (!pending->enable) {
> > +               mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base,
> > mixer->regs, MIX_L_SRC_SIZE(idx));
> > +               mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_MODE,
> > +                                    idx + 1,
> > MIXER_INx_MODE_BYPASS, cmdq_pkt);
> > +               mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_BIWIDTH,
> > +                                    idx + 1, 0, cmdq_pkt);
> > +               return;
> > +       }
> > +
> > +       if (pending->x % 2) {
> > +               x_offset_odd = true;
> > +               mixer_pad_mode = MIXER_INx_MODE_EVEN_EXTEND;
> > +       }
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_MODE,
> > +                            idx + 1, mixer_pad_mode, cmdq_pkt);
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_BIWIDTH,
> > +                            idx + 1, pending->width / 2 - 1,
> > cmdq_pkt);
> > +
> > +       if (state->base.fb && state->base.fb->format->has_alpha) {
> > +               alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
> > +               mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_HDR_ALPHA_SEL,
> > +                                    idx + 1, 0, cmdq_pkt);
> > +       } else {
> > +               mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_HDR_ALPHA_SEL,
> > +                                    idx + 1, 1, cmdq_pkt);
> > +       }
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, idx + 1,
> > +                            DEFAULT_9BIT_ALPHA, cmdq_pkt);
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, idx + 1,
> > +                            DEFAULT_9BIT_ALPHA, cmdq_pkt);
> > +
> > +       mtk_ddp_write(cmdq_pkt, (pending->height << 16) | pending-
> > >width, &mixer->cmdq_base,
> 
> mtk_ddp_write(cmdq_pkt, pending->height << 16 | pending->width,
> &mixer->cmdq_base,
> 
OK.
> > +                     mixer->regs, MIX_L_SRC_SIZE(idx));
> > +       mtk_ddp_write(cmdq_pkt, (x_offset_odd << 31) | offset,
> > &mixer->cmdq_base,
> > +                     mixer->regs, MIX_L_SRC_OFFSET(idx));
> > +       mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base,
> > mixer->regs, MIX_L_SRC_CON(idx),
> > +                          0x1ff);
> > +       mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base,
> > mixer->regs, MIX_SRC_CON,
> > +                          BIT(idx));
> > +}
> > +
> > +void mtk_ethdr_config(struct device *dev, unsigned int w,
> > +                     unsigned int h, unsigned int vrefresh,
> > +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +       struct mtk_ethdr_comp *vdo_fe0 = &priv-
> > >ethdr_comp[ETHDR_VDO_FE0];
> > +       struct mtk_ethdr_comp *vdo_fe1 = &priv-
> > >ethdr_comp[ETHDR_VDO_FE1];
> > +       struct mtk_ethdr_comp *gfx_fe0 = &priv-
> > >ethdr_comp[ETHDR_GFX_FE0];
> > +       struct mtk_ethdr_comp *gfx_fe1 = &priv-
> > >ethdr_comp[ETHDR_GFX_FE1];
> > +       struct mtk_ethdr_comp *vdo_be = &priv-
> > >ethdr_comp[ETHDR_VDO_BE];
> > +       struct mtk_ethdr_comp *mixer = &priv-
> > >ethdr_comp[ETHDR_MIXER];
> > +
> > +       dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
> > +
> > +       mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL,
> > &vdo_fe0->cmdq_base,
> > +                     vdo_fe0->regs, HDR_VDO_FE_0804_HDR_DM_FE);
> > +
> > +       mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL,
> > &vdo_fe1->cmdq_base,
> > +                     vdo_fe1->regs, HDR_VDO_FE_0804_HDR_DM_FE);
> > +
> > +       mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL,
> > &gfx_fe0->cmdq_base,
> > +                     gfx_fe0->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
> > +
> > +       mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL,
> > &gfx_fe1->cmdq_base,
> > +                     gfx_fe1->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
> > +
> > +       mtk_ddp_write(cmdq_pkt, HDR_VDO_BE_0204_BYPASS_ALL,
> > &vdo_be->cmdq_base,
> > +                     vdo_be->regs, HDR_VDO_BE_0204_VDO_DM_BE);
> > +
> > +       mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer-
> > >cmdq_base, mixer->regs, MIX_FUNC_DCM0);
> > +       mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer-
> > >cmdq_base, mixer->regs, MIX_FUNC_DCM1);
> > +       mtk_ddp_write(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base,
> > mixer->regs, MIX_ROI_SIZE);
> 
> mtk_ddp_write(cmdq_pkt, h << 16 | w, &mixer->cmdq_base, mixer->regs,
> MIX_ROI_SIZE);
> 
OK.
> > +       mtk_ddp_write(cmdq_pkt, BGCLR_BLACK, &mixer->cmdq_base,
> > mixer->regs, MIX_ROI_BGCLR);
> > +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer-
> > >cmdq_base, mixer->regs,
> > +                     MIX_L_SRC_CON(0));
> > +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer-
> > >cmdq_base, mixer->regs,
> > +                     MIX_L_SRC_CON(1));
> > +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer-
> > >cmdq_base, mixer->regs,
> > +                     MIX_L_SRC_CON(2));
> > +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer-
> > >cmdq_base, mixer->regs,
> > +                     MIX_L_SRC_CON(3));
> > +       mtk_ddp_write(cmdq_pkt, 0x0, &mixer->cmdq_base, mixer-
> > >regs, MIX_L_SRC_SIZE(0));
> > +       mtk_ddp_write(cmdq_pkt, OUTPUT_NO_RND | SOURCE_RGB_SEL |
> > BACKGROUND_RELAY,
> > +                     &mixer->cmdq_base, mixer->regs,
> > MIX_DATAPATH_CON);
> > +       mtk_ddp_write_mask(cmdq_pkt, MIX_SRC_L0_EN, &mixer-
> > >cmdq_base, mixer->regs,
> > +                          MIX_SRC_CON, MIX_SRC_L0_EN);
> 
>        mtk_ddp_write_mask(cmdq_pkt, BIT(0), &mixer->cmdq_base,
> mixer->regs, MIX_SRC_CON,
>                           BIT(0));
> 
> Why do you enable layer 0?
> 
There are two modes in Mixer.
1. Background relay mode: all layers off
2. Normal mix mode: at least one layer on
The two modes of mixer have different timings for the back-end engine,
so switching between these two modes will cause the screen to jitter.
Default enable layer 0 and set it's region to zero, keep mixer in
normal mix mode.

> > +
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0,
> > +                            w / 2, cmdq_pkt);
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
> > +                            h, cmdq_pkt);
> > +       mtk_mmsys_ddp_config(priv->mmsys_dev,
> > MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, 0, cmdq_pkt);
> > +}
> > +
> > +void mtk_ethdr_start(struct device *dev)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +       struct mtk_ethdr_comp *mixer = &priv-
> > >ethdr_comp[ETHDR_MIXER];
> > +
> > +       writel(1, mixer->regs + MIX_EN);
> > +}
> > +
> > +void mtk_ethdr_stop(struct device *dev)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +       struct mtk_ethdr_comp *mixer = &priv-
> > >ethdr_comp[ETHDR_MIXER];
> > +
> > +       writel(0, mixer->regs + MIX_EN);
> > +       writel(1, mixer->regs + MIX_RST);
> > +       reset_control_reset(devm_reset_control_array_get(dev, true,
> > true));
> > +       writel(0, mixer->regs + MIX_RST);
> > +}
> > +
> > +int mtk_ethdr_clk_enable(struct device *dev)
> > +{
> > +       int ret;
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +
> > +       ret = clk_bulk_prepare_enable(ETHDR_CLK_NUM, priv-
> > >ethdr_clk);
> > +       if (ret)
> > +               dev_err(dev,
> > +                       "ethdr_clk prepare enable failed\n");
> > +       return ret;
> > +}
> > +
> > +void mtk_ethdr_clk_disable(struct device *dev)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +
> > +       clk_bulk_disable_unprepare(ETHDR_CLK_NUM, priv->ethdr_clk);
> > +}
> > +
> > +static int mtk_ethdr_bind(struct device *dev, struct device
> > *master,
> > +                         void *data)
> > +{
> > +       struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +       struct platform_device *ovl_adaptor;
> > +       struct drm_device *drm_dev = data;
> > +       struct mtk_drm_private *drm_private = drm_dev->dev_private;
> > +
> > +       priv->mmsys_dev = drm_private->mmsys_dev;
> > +
> > +       /* Bring up ovl adaptor rdma and merge */
> > +       ovl_adaptor = platform_device_register_data(dev, "mediatek-
> > disp-ovl-adaptor",
> > +                                                   PLATFORM_DEVID_
> > NONE, (void *)priv->mmsys_dev,
> > +                                                   sizeof(*priv-
> > >mmsys_dev));
> 
> I would like that mtk drm driver bring up ovl adaptor and ovl adaptor
> bring up ethdr, rdma and merge. In another SoC, edhdr may be not
> related to ovl.
> 
> Regards,
> Chun-Kuang.
> 
OK. I will change to use drm driver to bring up ovl_adaptor.

Regards,
Nancy Lin

> > +       if (IS_ERR(ovl_adaptor))
> > +               return PTR_ERR(ovl_adaptor);
> > +
> > +       priv->ovl_adaptor_dev = &ovl_adaptor->dev;
> > +
> > +       return 0;
> > +}
> > +
> > +static void mtk_ethdr_unbind(struct device *dev, struct device
> > *master, void *data)
> > +{
> > +}
> > +
> > +static const struct component_ops mtk_ethdr_component_ops = {
> > +       .bind   = mtk_ethdr_bind,
> > +       .unbind = mtk_ethdr_unbind,
> > +};
> > +

