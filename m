Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A1454084
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 06:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722FE6E1FB;
	Wed, 17 Nov 2021 05:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B76E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 05:59:09 +0000 (UTC)
X-UUID: 6aff644d754c4e49849af327d126d49e-20211117
X-UUID: 6aff644d754c4e49849af327d126d49e-20211117
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 303530506; Wed, 17 Nov 2021 13:59:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 17 Nov 2021 13:59:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Nov 2021 13:59:03 +0800
Message-ID: <629baf7a8b2942b12f28c65cd44b37ec01e73307.camel@mediatek.com>
Subject: Re: [PATCH v7 19/20] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 17 Nov 2021 13:58:58 +0800
In-Reply-To: <CAAOTY_8OBL=btK8yHnn-_LDQS-_mCHDhFnZyPBrcNw2TnR_iog@mail.gmail.com>
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-20-nancy.lin@mediatek.com>
 <CAAOTY_8OBL=btK8yHnn-_LDQS-_mCHDhFnZyPBrcNw2TnR_iog@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David
 Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thanks for the review.

On Thu, 2021-11-11 at 07:44 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年10月29日 週五 下午3:52寫道：
> > 
> > MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> > The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> > only one drm driver register as the drm device.
> > Each drm driver binds its own component. The last bind drm driver
> > allocates and registers the drm device to drm core.
> > Each crtc path is created with the corresponding drm driver data.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 301 ++++++++++++++++++
> > ------
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   9 +-
> >  4 files changed, 249 insertions(+), 88 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index ea285795776f..25580106a2c4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -846,21 +846,28 @@ static int
> > mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
> >  }
> > 
> >  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > -                       const enum mtk_ddp_comp_id *path, unsigned
> > int path_len)
> > +                       const enum mtk_ddp_comp_id *path, unsigned
> > int path_len,
> > +                       int priv_data_index)
> >  {
> >         struct mtk_drm_private *priv = drm_dev->dev_private;
> >         struct device *dev = drm_dev->dev;
> >         struct mtk_drm_crtc *mtk_crtc;
> >         unsigned int num_comp_planes = 0;
> > -       int pipe = priv->num_pipes;
> >         int ret;
> >         int i;
> >         bool has_ctm = false;
> >         uint gamma_lut_size = 0;
> > +       struct drm_crtc *tmp;
> > +       int crtc_i = 0;
> > 
> >         if (!path)
> >                 return 0;
> > 
> > +       priv = priv->all_drm_private[priv_data_index];
> > +
> > +       drm_for_each_crtc(tmp, drm_dev)
> > +               crtc_i++;
> > +
> >         for (i = 0; i < path_len; i++) {
> >                 enum mtk_ddp_comp_id comp_id = path[i];
> >                 struct device_node *node;
> > @@ -872,7 +879,7 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >                 if (!node) {
> >                         dev_info(dev,
> >                                  "Not creating crtc %d because
> > component %d is disabled or missing\n",
> > -                                pipe, comp_id);
> > +                                crtc_i, comp_id);
> >                         return 0;
> >                 }
> > 
> > @@ -925,29 +932,28 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> > 
> >         for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> >                 ret = mtk_drm_crtc_init_comp_planes(drm_dev,
> > mtk_crtc, i,
> > -                                                   pipe);
> > +                                                   crtc_i);
> >                 if (ret)
> >                         return ret;
> >         }
> > 
> > -       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> > +       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, crtc_i);
> >         if (ret < 0)
> >                 return ret;
> > 
> >         if (gamma_lut_size)
> >                 drm_mode_crtc_set_gamma_size(&mtk_crtc->base,
> > gamma_lut_size);
> >         drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm,
> > gamma_lut_size);
> > -       priv->num_pipes++;
> >         mutex_init(&mtk_crtc->hw_lock);
> > 
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +       i = (priv->data->mmsys_dev_num > 1) ? 0 :
> > drm_crtc_index(&mtk_crtc->base);
> 
> I think even though mmsys_dev_num > 1, each mmsys could have more
> than one crtc.
> 
OK, I will refine the logic. 

> >         mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
> >         mtk_crtc->cmdq_client.client.tx_block = false;
> >         mtk_crtc->cmdq_client.client.knows_txdone = true;
> >         mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
> >         mtk_crtc->cmdq_client.chan =
> > -                       mbox_request_channel(&mtk_crtc-
> > >cmdq_client.client,
> > -                                            drm_crtc_index(&mtk_cr
> > tc->base));
> > +                       mbox_request_channel(&mtk_crtc-
> > >cmdq_client.client, i);
> >         if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
> >                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox
> > client, writing register by CPU now\n",
> >                         drm_crtc_index(&mtk_crtc->base));
> > @@ -957,7 +963,7 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >         if (mtk_crtc->cmdq_client.chan) {
> >                 ret = of_property_read_u32_index(priv->mutex_node,
> >                                                  "mediatek,gce-
> > events",
> > -                                                drm_crtc_index(&mt
> > k_crtc->base),
> > +                                                i,
> >                                                  &mtk_crtc-
> > >cmdq_event);
> >                 if (ret) {
> >                         dev_dbg(dev, "mtk_crtc %d failed to get
> > mediatek,gce-events property\n",
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > index cb9a36c48d4f..a57eb12d7c05 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > @@ -17,7 +17,8 @@
> >  void mtk_drm_crtc_commit(struct drm_crtc *crtc);
> >  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >                         const enum mtk_ddp_comp_id *path,
> > -                       unsigned int path_len);
> > +                       unsigned int path_len,
> > +                       int priv_data_index);
> >  int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct
> > drm_plane *plane,
> >                              struct mtk_plane_state *state);
> >  void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct
> > drm_plane *plane,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 274a5bb10851..eedf10ed30c8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -196,6 +196,8 @@ static const struct mtk_mmsys_driver_data
> > mt2701_mmsys_driver_data = {
> >         .ext_path = mt2701_mtk_ddp_ext,
> >         .ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
> >         .shadow_register = true,
> > +       .mmsys_id = 0,
> 
> global variable is initialized to zero, so remove this.
> 
OK
> > +       .mmsys_dev_num = 1,
> >  };
> > 
> 
> [snip]
> 
> > +
> > +static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private
> > *private, int comp_id)
> > +{
> > +       const struct mtk_mmsys_driver_data *drv_data = private-
> > >data;
> > +       int i;
> > +
> > +       if (drv_data->mmsys_dev_num == 1)
> > +               return true;
> > +
> > +       if (drv_data->main_path)
> > +               for (i = 0; i < drv_data->main_len; i++)
> > +                       if (drv_data->main_path[i] == comp_id)
> > +                               return true;
> > +
> > +       if (drv_data->ext_path)
> > +               for (i = 0; i < drv_data->ext_len; i++)
> > +                       if (drv_data->ext_path[i] == comp_id)
> > +                               return true;
> > +
> > +       if (drv_data->third_path)
> > +               for (i = 0; i < drv_data->third_len; i++)
> > +                       if (drv_data->third_path[i] == comp_id)
> > +                               return true;
> > +
> > +       return false;
> > +}
> > +
> >  static int mtk_drm_kms_init(struct drm_device *drm)
> >  {
> >         struct mtk_drm_private *private = drm->dev_private;
> > +       struct mtk_drm_private *priv_n;
> >         struct platform_device *pdev;
> > -       struct device_node *np;
> > +       struct device_node *np = NULL;
> >         struct device *dma_dev;
> > -       int ret;
> > -
> > -       if (!iommu_present(&platform_bus_type))
> > -               return -EPROBE_DEFER;
> > -
> > -       pdev = of_find_device_by_node(private->mutex_node);
> > -       if (!pdev) {
> > -               dev_err(drm->dev, "Waiting for disp-mutex device
> > %pOF\n",
> > -                       private->mutex_node);
> > -               of_node_put(private->mutex_node);
> > -               return -EPROBE_DEFER;
> > -       }
> > -       private->mutex_dev = &pdev->dev;
> > +       int ret, i, j;
> > 
> >         ret = drmm_mode_config_init(drm);
> >         if (ret)
> > @@ -283,33 +384,57 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >         drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
> >         drm->mode_config.helper_private =
> > &mtk_drm_mode_config_helpers;
> > 
> > -       ret = component_bind_all(drm->dev, drm);
> > -       if (ret)
> > -               goto put_mutex_dev;
> > +       for (i = 0; i < private->data->mmsys_dev_num; i++) {
> > +               drm->dev_private = private->all_drm_private[i];
> > +               ret = component_bind_all(private-
> > >all_drm_private[i]->dev, drm);
> > +               if (ret)
> > +                       goto put_mutex_dev;
> > +       }
> > 
> >         /*
> >          * We currently support two fixed data streams, each
> > optional,
> >          * and each statically assigned to a crtc:
> >          * OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0 ...
> >          */
> > -       ret = mtk_drm_crtc_create(drm, private->data->main_path,
> > -                                 private->data->main_len);
> > -       if (ret < 0)
> > -               goto err_component_unbind;
> > -       /* ... and OVL1 -> COLOR1 -> GAMMA -> RDMA1 -> DPI0. */
> > -       ret = mtk_drm_crtc_create(drm, private->data->ext_path,
> > -                                 private->data->ext_len);
> > -       if (ret < 0)
> > -               goto err_component_unbind;
> > -
> > -       ret = mtk_drm_crtc_create(drm, private->data->third_path,
> > -                                 private->data->third_len);
> > -       if (ret < 0)
> > -               goto err_component_unbind;
> > +       for (i = 0; i < MAX_CRTC; i++) {
> 
> I think the i-for-loop is redundant.
> 
The i-for-loop is aimed to create crtc in the original order.
For multi mmsys architecture, crtc path data are located in different 
drm private data strucutes. Loop through crtc index to
create crtc from the main path and then ext_path and finally the
third path. I will add a comment in the code fragment.

> > +               for (j = 0; j < private->data->mmsys_dev_num; j++)
> > {
> > +                       priv_n = private->all_drm_private[j];
> > +
> > +                       if (i == 0 && priv_n->data->main_len) {
> > +                               ret = mtk_drm_crtc_create(drm,
> > priv_n->data->main_path,
> > +                                                         priv_n-
> > >data->main_len, j);
> > +                               if (ret)
> > +                                       goto err_component_unbind;
> > +
> > +                               if (!np)
> > +                                       np = priv_n-
> > >comp_node[priv_n->data->main_path[0]];
> > +
> > +                               continue;
> > +                       } else if (i == 1 && priv_n->data->ext_len) 
> > {
> > +                               ret = mtk_drm_crtc_create(drm,
> > priv_n->data->ext_path,
> > +                                                         priv_n-
> > >data->ext_len, j);
> > +                               if (ret)
> > +                                       goto err_component_unbind;
> > +
> > +                               if (!np)
> > +                                       np = priv_n-
> > >comp_node[priv_n->data->ext_path[0]];
> > +
> > +                               continue;
> > +                       } else if (i == 2 && priv_n->data-
> > >third_len) {
> > +                               ret = mtk_drm_crtc_create(drm,
> > priv_n->data->third_path,
> > +                                                         priv_n-
> > >data->third_len, j);
> > +                               if (ret)
> > +                                       goto err_component_unbind;
> > +
> > +                               if (!np)
> > +                                       np = priv_n-
> > >comp_node[priv_n->data->third_path[0]];
> 
> Here assume that all mmsys use the same iommu (maybe in some SoC each
> mmsys use different iommu), so add comment for this.
> 
Originally there is a comment below, I will move it to the top.
     =>/* Use OVL device for all DMA memory allocations */
> > +
> > +                               continue;
> > +                       }
> > +               }
> > +       }
> > 
> >         /* Use OVL device for all DMA memory allocations */
> > -       np = private->comp_node[private->data->main_path[0]] ?:
> > -            private->comp_node[private->data->ext_path[0]];
> >         pdev = of_find_device_by_node(np);
> >         if (!pdev) {
> >                 ret = -ENODEV;
> > @@ -318,7 +443,8 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >         }
> > 
> >         dma_dev = &pdev->dev;
> > -       private->dma_dev = dma_dev;
> > +       for (i = 0; i < private->data->mmsys_dev_num; i++)
> > +               private->all_drm_private[i]->dma_dev = dma_dev;
> > 
> >         /*
> >          * Configure the DMA segment size to make sure we get
> > contiguous IOVA
> > @@ -340,9 +466,12 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >         return 0;
> > 
> >  err_component_unbind:
> > -       component_unbind_all(drm->dev, drm);
> > +       for (i = 0; i < private->data->mmsys_dev_num; i++)
> > +               component_unbind_all(private->all_drm_private[i]-
> > >dev, drm);
> >  put_mutex_dev:
> > -       put_device(private->mutex_dev);
> > +       for (i = 0; i < private->data->mmsys_dev_num; i++)
> > +               put_device(private->all_drm_private[i]->mutex_dev);
> > +
> >         return ret;
> >  }
> > 
> > @@ -395,15 +524,36 @@ static int compare_of(struct device *dev,
> > void *data)
> >  static int mtk_drm_bind(struct device *dev)
> >  {
> >         struct mtk_drm_private *private = dev_get_drvdata(dev);
> > +       struct platform_device *pdev;
> >         struct drm_device *drm;
> > -       int ret;
> > +       int ret, i;
> > +
> > +       if (!iommu_present(&platform_bus_type))
> > +               return -EPROBE_DEFER;
> > +
> > +       pdev = of_find_device_by_node(private->mutex_node);
> > +       if (!pdev) {
> > +               dev_err(dev, "Waiting for disp-mutex device
> > %pOF\n",
> > +                       private->mutex_node);
> > +               of_node_put(private->mutex_node);
> > +               return -EPROBE_DEFER;
> > +       }
> > +
> > +       private->mutex_dev = &pdev->dev;
> > +       private->mtk_drm_bound = true;
> > +       private->dev = dev;
> > +
> > +       if (!mtk_drm_get_all_drm_priv(dev))
> > +               return 0;
> > 
> >         drm = drm_dev_alloc(&mtk_drm_driver, dev);
> >         if (IS_ERR(drm))
> >                 return PTR_ERR(drm);
> > 
> > -       drm->dev_private = private;
> > -       private->drm = drm;
> > +       private->drm_master = true;
> > +               drm->dev_private = private;
> 
> indent.

OK
> 
> > +       for (i = 0; i < private->data->mmsys_dev_num; i++)
> > +               private->all_drm_private[i]->drm = drm;
> > 
> >         ret = mtk_drm_kms_init(drm);
> >         if (ret < 0)
> > @@ -428,10 +578,14 @@ static void mtk_drm_unbind(struct device
> > *dev)
> >  {
> >         struct mtk_drm_private *private = dev_get_drvdata(dev);
> > 
> > -       drm_dev_unregister(private->drm);
> > -       mtk_drm_kms_deinit(private->drm);
> > -       drm_dev_put(private->drm);
> > -       private->num_pipes = 0;
> > +       /* for multi mmsys dev, unregister drm dev in mmsys master
> > */
> > +       if (private->data->mmsys_id == 0) {
> 
> The master mmsys register drm device, why mmsys 0 unregister drm
> device?
> 
I will change to use mmsys master to unregister drm.

> > +               drm_dev_unregister(private->drm);
> > +               mtk_drm_kms_deinit(private->drm);
> > +               drm_dev_put(private->drm);
> > +       }
> > +       private->mtk_drm_bound = false;
> > +       private->drm_master = false;
> >         private->drm = NULL;
> >  }
> > 
> > @@ -546,54 +700,40 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >         { }
> >  };
> > 
> > -static const struct of_device_id mtk_drm_of_ids[] = {
> > -       { .compatible = "mediatek,mt2701-mmsys",
> > -         .data = &mt2701_mmsys_driver_data},
> > -       { .compatible = "mediatek,mt7623-mmsys",
> > -         .data = &mt7623_mmsys_driver_data},
> > -       { .compatible = "mediatek,mt2712-mmsys",
> > -         .data = &mt2712_mmsys_driver_data},
> > -       { .compatible = "mediatek,mt8167-mmsys",
> > -         .data = &mt8167_mmsys_driver_data},
> > -       { .compatible = "mediatek,mt8173-mmsys",
> > -         .data = &mt8173_mmsys_driver_data},
> > -       { .compatible = "mediatek,mt8183-mmsys",
> > -         .data = &mt8183_mmsys_driver_data},
> > -       { .compatible = "mediatek,mt8192-mmsys",
> > -         .data = &mt8192_mmsys_driver_data},
> > -       {.compatible = "mediatek,mt8195-vdosys0",
> > -         .data = &mt8195_vdosys0_driver_data},
> > -       { }
> > -};
> > -MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> > -
> >  static int mtk_drm_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> >         struct device_node *phandle = dev->parent->of_node;
> >         const struct of_device_id *of_id;
> > +       const struct mtk_mmsys_driver_data *drv_data;
> >         struct mtk_drm_private *private;
> >         struct device_node *node;
> >         struct component_match *match = NULL;
> >         int ret;
> >         int i;
> > 
> > +       of_id = of_match_node(mtk_drm_of_ids, phandle);
> > +       if (!of_id)
> > +               return -ENODEV;
> > +
> > +       drv_data = of_id->data;
> >         private = devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
> >         if (!private)
> >                 return -ENOMEM;
> > 
> > +       private->all_drm_private = devm_kmalloc_array(dev,
> > drv_data->mmsys_dev_num,
> > +                                                     sizeof(*priva
> > te->all_drm_private),
> > +                                                     GFP_KERNEL);
> > +       if (!private->all_drm_private)
> > +               return -ENOMEM;
> > +
> > +       private->data = drv_data;
> >         private->mmsys_dev = dev->parent;
> >         if (!private->mmsys_dev) {
> >                 dev_err(dev, "Failed to get MMSYS device\n");
> >                 return -ENODEV;
> >         }
> > 
> > -       of_id = of_match_node(mtk_drm_of_ids, phandle);
> > -       if (!of_id)
> > -               return -ENODEV;
> > -
> > -       private->data = of_id->data;
> > -
> >         /* Iterate over sibling DISP function blocks */
> >         for_each_child_of_node(phandle->parent, node) {
> >                 const struct of_device_id *of_id;
> > @@ -613,7 +753,13 @@ static int mtk_drm_probe(struct
> > platform_device *pdev)
> >                 comp_type = (enum mtk_ddp_comp_type)of_id->data;
> > 
> >                 if (comp_type == MTK_DISP_MUTEX) {
> > -                       private->mutex_node = of_node_get(node);
> > +                       int id;
> > +
> > +                       id = of_alias_get_id(node, "mutex");
> > +                       if (id < 0 || id == drv_data->mmsys_id) {
> > +                               private->mutex_node =
> > of_node_get(node);
> > +                               dev_dbg(dev, "get mutex for mmsys
> > %d", drv_data->mmsys_id);
> > +                       }
> >                         continue;
> >                 }
> > 
> > @@ -624,6 +770,9 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >                         continue;
> >                 }
> > 
> > +               if (!mtk_drm_find_mmsys_comp(private, comp_id))
> > +                       continue;
> 
> Without this, this patch still work. So remove this. If you still
> want
> this modification, separate this to another patch.
> 
> Regards,
> Chun-Kuang.
> 

This is necessary for multi mmsys. Each drm can only collect it's own
path component.
> > +
> >                 private->comp_node[comp_id] = of_node_get(node);
> > 
> >                 /*TOriginally there is a comment below, I will move
> > it to the top


