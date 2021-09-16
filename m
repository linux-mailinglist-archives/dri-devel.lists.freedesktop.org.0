Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C923540D1F8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 05:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706C16EA97;
	Thu, 16 Sep 2021 03:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834F6EAA5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 03:18:11 +0000 (UTC)
X-UUID: 26bbd7db2492464bae0964f7adb3831f-20210916
X-UUID: 26bbd7db2492464bae0964f7adb3831f-20210916
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1364745662; Thu, 16 Sep 2021 11:18:08 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 11:18:07 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 11:18:07 +0800
Message-ID: <5ef170ce3ffd9be2ad0f19bed3c468e1d0d5ae91.camel@mediatek.com>
Subject: Re: [PATCH v5 11/16] drm/mediatek: add display MDP RDMA support for
 MT8195
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
Date: Thu, 16 Sep 2021 11:18:07 +0800
In-Reply-To: <CAAOTY_8sHYb_EMqs5GH9YQU6CF_cu6280_3qNNS1TEcoKuRwQw@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-12-nancy.lin@mediatek.com>
 <CAAOTY_8sHYb_EMqs5GH9YQU6CF_cu6280_3qNNS1TEcoKuRwQw@mail.gmail.com>
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

On Thu, 2021-09-09 at 07:54 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年9月6日 週一 下午3:15寫道：
> > 
> > Add MDP_RDMA driver for MT8195. MDP_RDMA is the DMA engine of
> > the ovl_adaptor component.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/Makefile       |   3 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h |   7 +
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 301
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.h |  37 +++
> >  4 files changed, 347 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> > 
> > diff --git a/drivers/gpu/drm/mediatek/Makefile
> > b/drivers/gpu/drm/mediatek/Makefile
> > index a38e88e82d12..6e604a933ed0 100644
> > --- a/drivers/gpu/drm/mediatek/Makefile
> > +++ b/drivers/gpu/drm/mediatek/Makefile
> > @@ -13,7 +13,8 @@ mediatek-drm-y := mtk_disp_aal.o \
> >                   mtk_drm_gem.o \
> >                   mtk_drm_plane.o \
> >                   mtk_dsi.o \
> > -                 mtk_dpi.o
> > +                 mtk_dpi.o \
> > +                 mtk_mdp_rdma.o
> > 
> >  obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index a33b13fe2b6e..b3a372cab0bd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -8,6 +8,7 @@
> > 
> >  #include <linux/soc/mediatek/mtk-cmdq.h>
> >  #include "mtk_drm_plane.h"
> > +#include "mtk_mdp_rdma.h"
> > 
> >  int mtk_aal_clk_enable(struct device *dev);
> >  void mtk_aal_clk_disable(struct device *dev);
> > @@ -106,4 +107,10 @@ void mtk_rdma_enable_vblank(struct device
> > *dev,
> >                             void *vblank_cb_data);
> >  void mtk_rdma_disable_vblank(struct device *dev);
> > 
> > +int mtk_mdp_rdma_clk_enable(struct device *dev);
> > +void mtk_mdp_rdma_clk_disable(struct device *dev);
> > +void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt);
> > +void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt);
> > +void mtk_mdp_rdma_config(struct device *dev, struct
> > mtk_mdp_rdma_cfg *cfg,
> > +                        struct cmdq_pkt *cmdq_pkt);
> >  #endif
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > new file mode 100644
> > index 000000000000..052434d960b9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > @@ -0,0 +1,301 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + */
> > +
> > +#include <drm/drm_fourcc.h>
> > +#include <linux/clk.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> > +
> > +#include "mtk_drm_drv.h"
> > +#include "mtk_disp_drv.h"
> > +#include "mtk_mdp_rdma.h"
> > +
> > +#define
> > MDP_RDMA_EN                                            0x000
> > +       #define FLD_ROT_ENABLE                            BIT(0)
> 
> Maybe my description is not good, I like the style of rdma driver
> [1].
> 
> [1] 
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_disp_rdma.c?h=v5.14__;!!CTRNKA9wMg0ARbw!0WCmLLqZ2IclvjA-NLthJ-PGuByyzj_ImXoeNh2mvZ7Is9NFLTb37Pzr3jr4fK4j$
>  
> 
OK, I will change the alignment.

> > +
> > +#define
> > MDP_RDMA_RESET                                         0x008
> > +
> > +#define
> > MDP_RDMA_CON                                           0x020
> > +       #define FLD_OUTPUT_10B                            BIT(5)
> > +       #define FLD_SIMPLE_MODE                           BIT(4)
> > +
> > +#define
> > MDP_RDMA_GMCIF_CON                                     0x028
> > +       #define FLD_COMMAND_DIV                           BIT(0)
> > +       #define FLD_EXT_PREULTRA_EN                       BIT(3)
> > +       #define
> > FLD_RD_REQ_TYPE                           GENMASK(7, 4)
> > +               #define VAL_RD_REQ_TYPE_BURST_8_ACCESS    7
> > +       #define
> > FLD_ULTRA_EN                              GENMASK(13, 12)
> > +               #define VAL_ULTRA_EN_ENABLE               1
> > +       #define
> > FLD_PRE_ULTRA_EN                          GENMASK(17, 16)
> > +               #define VAL_PRE_ULTRA_EN_ENABLE           1
> > +       #define FLD_EXT_ULTRA_EN                          BIT(18)
> > +
> > +#define
> > MDP_RDMA_SRC_CON                                       0x030
> > +       #define FLD_OUTPUT_ARGB                           BIT(25)
> > +       #define
> > FLD_BIT_NUMBER                            GENMASK(19, 18)
> > +       #define FLD_UNIFORM_CONFIG                        BIT(17)
> > +       #define FLD_SWAP                                  BIT(14)
> > +       #define
> > FLD_SRC_FORMAT                            GENMASK(3, 0)
> > +
> > +#define
> > MDP_RDMA_COMP_CON                                      0x038
> > +       #define FLD_AFBC_EN                               BIT(22)
> > +       #define FLD_AFBC_YUV_TRANSFORM                    BIT(21)
> > +       #define FLD_UFBDC_EN                              BIT(12)
> > +
> > +#define
> > MDP_RDMA_MF_BKGD_SIZE_IN_BYTE                          0x060
> > +       #define
> > FLD_MF_BKGD_WB                            GENMASK(22, 0)
> > +
> > +#define
> > MDP_RDMA_MF_SRC_SIZE                                   0x070
> > +       #define
> > FLD_MF_SRC_H                              GENMASK(30, 16)
> > +       #define
> > FLD_MF_SRC_W                              GENMASK(14, 0)
> > +
> > +#define
> > MDP_RDMA_MF_CLIP_SIZE                                  0x078
> > +       #define
> > FLD_MF_CLIP_H                             GENMASK(30, 16)
> > +       #define
> > FLD_MF_CLIP_W                             GENMASK(14, 0)
> > +
> > +#define
> > MDP_RDMA_TARGET_LINE                                   0x0a0
> > +       #define
> > FLD_LINE_THRESHOLD                        GENMASK(31, 17)
> > +       #define FLD_TARGET_LINE_EN                        BIT(16)
> > +
> > +#define
> > MDP_RDMA_SRC_OFFSET_0                                  0x118
> > +       #define
> > FLD_SRC_OFFSET_0                          GENMASK(31, 0)
> > +
> > +#define
> > MDP_RDMA_TRANSFORM_0                                   0x200
> > +       #define
> > FLD_INT_MATRIX_SEL                        GENMASK(27, 23)
> > +       #define FLD_TRANS_EN                              BIT(16)
> > +
> > +#define
> > MDP_RDMA_SRC_BASE_0                                    0xf00
> > +       #define
> > FLD_SRC_BASE_0                            GENMASK(31, 0)
> > +
> > +#define RDMA_INPUT_SWAP                BIT(14)
> > +#define RDMA_INPUT_10BIT       BIT(18)
> > +
> > +enum rdma_format {
> > +       RDMA_INPUT_FORMAT_RGB565 = 0,
> > +       RDMA_INPUT_FORMAT_RGB888 = 1,
> > +       RDMA_INPUT_FORMAT_RGBA8888 = 2,
> > +       RDMA_INPUT_FORMAT_ARGB8888 = 3,
> > +       RDMA_INPUT_FORMAT_UYVY = 4,
> > +       RDMA_INPUT_FORMAT_YUY2 = 5,
> > +       RDMA_INPUT_FORMAT_Y8 = 7,
> > +       RDMA_INPUT_FORMAT_YV12 = 8,
> > +       RDMA_INPUT_FORMAT_UYVY_3PL = 9,
> > +       RDMA_INPUT_FORMAT_NV12 = 12,
> > +       RDMA_INPUT_FORMAT_UYVY_2PL = 13,
> > +       RDMA_INPUT_FORMAT_Y410 = 14
> > +};
> > +
> > +struct mtk_mdp_rdma {
> > +       void __iomem *regs;
> > +       struct clk *clk;
> > +       struct cmdq_client_reg          cmdq_reg;
> > +};
> > +
> > +static unsigned int rdma_fmt_convert(unsigned int fmt)
> > +{
> > +       switch (fmt) {
> > +       default:
> > +       case DRM_FORMAT_RGB565:
> > +               return RDMA_INPUT_FORMAT_RGB565;
> > +       case DRM_FORMAT_BGR565:
> > +               return RDMA_INPUT_FORMAT_RGB565 | RDMA_INPUT_SWAP;
> > +       case DRM_FORMAT_RGB888:
> > +               return RDMA_INPUT_FORMAT_RGB888;
> > +       case DRM_FORMAT_BGR888:
> > +               return RDMA_INPUT_FORMAT_RGB888 | RDMA_INPUT_SWAP;
> > +       case DRM_FORMAT_RGBX8888:
> > +       case DRM_FORMAT_RGBA8888:
> > +               return RDMA_INPUT_FORMAT_ARGB8888;
> > +       case DRM_FORMAT_BGRX8888:
> > +       case DRM_FORMAT_BGRA8888:
> > +               return RDMA_INPUT_FORMAT_ARGB8888 |
> > RDMA_INPUT_SWAP;
> > +       case DRM_FORMAT_XRGB8888:
> > +       case DRM_FORMAT_ARGB8888:
> > +               return RDMA_INPUT_FORMAT_RGBA8888;
> > +       case DRM_FORMAT_XBGR8888:
> > +       case DRM_FORMAT_ABGR8888:
> > +               return RDMA_INPUT_FORMAT_RGBA8888 |
> > RDMA_INPUT_SWAP;
> > +       case DRM_FORMAT_ABGR2101010:
> > +               return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP
> > |
> > +                               RDMA_INPUT_10BIT;
> > +       case DRM_FORMAT_ARGB2101010:
> > +               return RDMA_INPUT_FORMAT_RGBA8888 |
> > RDMA_INPUT_10BIT;
> > +       case DRM_FORMAT_RGBA1010102:
> > +               return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP
> > |
> > +                               RDMA_INPUT_10BIT;
> > +       case DRM_FORMAT_BGRA1010102:
> > +               return RDMA_INPUT_FORMAT_ARGB8888 |
> > RDMA_INPUT_10BIT;
> > +       case DRM_FORMAT_UYVY:
> > +               return RDMA_INPUT_FORMAT_UYVY;
> > +       case DRM_FORMAT_YUYV:
> > +               return RDMA_INPUT_FORMAT_YUY2;
> > +       }
> > +}
> > +
> > +static void mtk_mdp_rdma_fifo_config(struct device *dev, struct
> > cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_mdp_rdma *priv = dev_get_drvdata(dev);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, FLD_EXT_ULTRA_EN |
> > VAL_PRE_ULTRA_EN_ENABLE << 16 |
> > +                          VAL_ULTRA_EN_ENABLE << 12 |
> > VAL_RD_REQ_TYPE_BURST_8_ACCESS << 4 |
> > +                          FLD_EXT_PREULTRA_EN | FLD_COMMAND_DIV,
> > &priv->cmdq_reg,
> > +                          priv->regs, MDP_RDMA_GMCIF_CON,
> > FLD_EXT_ULTRA_EN |
> > +                          FLD_PRE_ULTRA_EN | FLD_ULTRA_EN |
> > FLD_RD_REQ_TYPE |
> > +                          FLD_EXT_PREULTRA_EN | FLD_COMMAND_DIV);
> > +}
> > +
> > +void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt)
> > +{
> > +       struct mtk_mdp_rdma *priv = dev_get_drvdata(dev);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, FLD_ROT_ENABLE, &priv-
> > >cmdq_reg,
> > +                          priv->regs, MDP_RDMA_EN,
> > FLD_ROT_ENABLE);
> > +}
> > +
> > +void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt)
> > +{
> > +       struct mtk_mdp_rdma *priv = dev_get_drvdata(dev);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg,
> > +                          priv->regs, MDP_RDMA_EN,
> > FLD_ROT_ENABLE);
> > +       mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> > MDP_RDMA_RESET);
> > +       mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> > MDP_RDMA_RESET);
> > +}
> > +
> > +void mtk_mdp_rdma_config(struct device *dev, struct
> > mtk_mdp_rdma_cfg *cfg,
> > +                        struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_mdp_rdma *priv = dev_get_drvdata(dev);
> > +       const struct drm_format_info *fmt_info =
> > drm_format_info(cfg->fmt);
> > +       unsigned int src_pitch_y = cfg->pitch;
> > +       unsigned int bpp_y = fmt_info->cpp[0] * 8;
> > +       unsigned int offset_y = 0;
> > +
> > +       mtk_mdp_rdma_fifo_config(dev, cmdq_pkt);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, FLD_UNIFORM_CONFIG, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_SRC_CON, FLD_UNIFORM_CONFIG);
> > +       mtk_ddp_write_mask(cmdq_pkt, rdma_fmt_convert(cfg->fmt),
> > &priv->cmdq_reg, priv->regs,
> > +                          MDP_RDMA_SRC_CON, FLD_SWAP |
> > FLD_SRC_FORMAT | FLD_BIT_NUMBER);
> > +
> > +       if (!cfg->csc_enable && fmt_info->has_alpha)
> > +               mtk_ddp_write_mask(cmdq_pkt, FLD_OUTPUT_ARGB,
> > &priv->cmdq_reg,
> > +                                  priv->regs, MDP_RDMA_SRC_CON,
> > FLD_OUTPUT_ARGB);
> > +       else
> > +               mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg,
> > priv->regs,
> > +                                  MDP_RDMA_SRC_CON,
> > FLD_OUTPUT_ARGB);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg,
> > priv->regs,
> > +                          MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, &priv->cmdq_reg,
> > priv->regs,
> > +                          MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
> > FLD_MF_BKGD_WB);
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv-
> > >regs, MDP_RDMA_COMP_CON,
> > +                          FLD_AFBC_YUV_TRANSFORM | FLD_UFBDC_EN |
> > FLD_AFBC_EN);
> > +       mtk_ddp_write_mask(cmdq_pkt, FLD_OUTPUT_10B, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_CON, FLD_OUTPUT_10B);
> > +       mtk_ddp_write_mask(cmdq_pkt, FLD_SIMPLE_MODE, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_CON, FLD_SIMPLE_MODE);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->csc_enable << 16, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_TRANSFORM_0, FLD_TRANS_EN);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->profile << 23, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_TRANSFORM_0,
> > FLD_INT_MATRIX_SEL);
> > +
> > +       offset_y  = (cfg->x_left * bpp_y >> 3) + cfg->y_top *
> > src_pitch_y;
> > +
> > +       mtk_ddp_write_mask(cmdq_pkt, offset_y, &priv->cmdq_reg,
> > priv->regs,
> > +                          MDP_RDMA_SRC_OFFSET_0,
> > FLD_SRC_OFFSET_0);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->width, &priv->cmdq_reg,
> > priv->regs,
> > +                          MDP_RDMA_MF_SRC_SIZE, FLD_MF_SRC_W);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->height << 16, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_MF_SRC_SIZE, FLD_MF_SRC_H);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->width, &priv->cmdq_reg,
> > priv->regs,
> > +                          MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_W);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->height << 16, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
> > +       mtk_ddp_write_mask(cmdq_pkt, cfg->height << 17, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_TARGET_LINE,
> > FLD_LINE_THRESHOLD);
> > +       mtk_ddp_write_mask(cmdq_pkt, FLD_TARGET_LINE_EN, &priv-
> > >cmdq_reg, priv->regs,
> > +                          MDP_RDMA_TARGET_LINE,
> > FLD_TARGET_LINE_EN);
> 
> Why enable target line?

The MDP_RDMA gce event is not used, I will remove it in the next
revision.
> 
> > +}
> > +
> > +int mtk_mdp_rdma_clk_enable(struct device *dev)
> > +{
> > +       struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
> > +
> > +       pm_runtime_get_sync(dev);
> > +       clk_prepare_enable(rdma->clk);
> > +       return 0;
> > +}
> > +
> > +void mtk_mdp_rdma_clk_disable(struct device *dev)
> > +{
> > +       struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
> > +
> > +       clk_disable_unprepare(rdma->clk);
> > +       pm_runtime_put(dev);
> > +}
> > +
> > +static int mtk_mdp_rdma_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct resource *res;
> > +       struct mtk_mdp_rdma *priv;
> > +       int ret = 0;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       priv->regs = devm_ioremap_resource(dev, res);
> > +       if (IS_ERR(priv->regs)) {
> > +               dev_err(dev, "failed to ioremap rdma\n");
> > +               return PTR_ERR(priv->regs);
> > +       }
> > +
> > +       priv->clk = devm_clk_get(dev, NULL);
> > +       if (IS_ERR(priv->clk)) {
> > +               dev_err(dev, "failed to get rdma clk\n");
> > +               return PTR_ERR(priv->clk);
> > +       }
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +       ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> > +       if (ret)
> > +               dev_dbg(dev, "get mediatek,gce-client-reg
> > fail!\n");
> > +#endif
> > +       platform_set_drvdata(pdev, priv);
> > +
> > +       pm_runtime_enable(dev);
> > +       return ret;
> > +}
> > +
> > +static int mtk_mdp_rdma_remove(struct platform_device *pdev)
> > +{
> > +       pm_runtime_disable(&pdev->dev);
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id mtk_mdp_rdma_driver_dt_match[] =
> > {
> > +       { .compatible = "mediatek,mt8195-vdo1-rdma", },
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_mdp_rdma_driver_dt_match);
> > +
> > +struct platform_driver mtk_mdp_rdma_driver = {
> > +       .probe = mtk_mdp_rdma_probe,
> > +       .remove = mtk_mdp_rdma_remove,
> > +       .driver = {
> > +               .name = "mediatek-mdp-rdma",
> > +               .owner = THIS_MODULE,
> > +               .of_match_table = mtk_mdp_rdma_driver_dt_match,
> > +       },
> > +};
> > +module_platform_driver(mtk_mdp_rdma_driver);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> > b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> > new file mode 100644
> > index 000000000000..df8e28f0e3a4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + */
> > +
> > +#ifndef __MTK_MDP_RDMA_H__
> > +#define __MTK_MDP_RDMA_H__
> > +
> > +enum mtk_mdp_rdma_profile {
> > +       RDMA_CSC_RGB_TO_JPEG = 0,
> > +       RDMA_CSC_RGB_TO_FULL709 = 1,
> > +       RDMA_CSC_RGB_TO_BT601 = 2,
> > +       RDMA_CSC_RGB_TO_BT709 = 3,
> > +       RDMA_CSC_JPEG_TO_RGB = 4,
> > +       RDMA_CSC_FULL709_TO_RGB = 5,
> > +       RDMA_CSC_BT601_TO_RGB = 6,
> > +       RDMA_CSC_BT709_TO_RGB = 7,
> > +       RDMA_CSC_JPEG_TO_BT601 = 8,
> > +       RDMA_CSC_JPEG_TO_BT709 = 9,
> > +       RDMA_CSC_BT601_TO_JPEG = 10,
> > +       RDMA_CSC_BT709_TO_BT601 = 11,
> > +       RDMA_CSC_BT601_TO_BT709 = 12
> 
> It seems that this is the register definition. If this definition is
> changed in next SoC, how to define this value?
> Maybe we could pass the drm_color_encoding and drm_color_range
> information for YUV format, and let rdma do the translation in this
> driver.
> 
> Regards,
> Chun-Kuang.
> 
OK, I will remove the enum and let the rdma do the translation.

Regards,
Nancy Lin
> > +};
> > +
> > +struct mtk_mdp_rdma_cfg {
> > +       enum mtk_mdp_rdma_profile profile;
> > +       unsigned int pitch;
> > +       unsigned int addr0;
> > +       unsigned int width;
> > +       unsigned int height;
> > +       unsigned int x_left;
> > +       unsigned int y_top;
> > +       bool csc_enable;
> > +       int fmt;
> > +};
> > +
> > +#endif // __MTK_MDP_RDMA_H__
> > --
> > 2.18.0
> > 

