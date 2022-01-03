Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2D482F31
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 10:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A64A89745;
	Mon,  3 Jan 2022 09:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7906F89745
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:04:04 +0000 (UTC)
X-UUID: f73eb5fa8c73437e83b7accdc330b725-20220103
X-UUID: f73eb5fa8c73437e83b7accdc330b725-20220103
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 320865777; Mon, 03 Jan 2022 17:03:58 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 3 Jan 2022 17:03:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 17:03:57 +0800
Message-ID: <9ea6439ba4e7cc73c2bba7899eacee37173683bc.camel@mediatek.com>
Subject: Re: [PATCH v10 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
Date: Mon, 3 Jan 2022 17:03:57 +0800
In-Reply-To: <20211208024426.15595-20-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
 <20211208024426.15595-20-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Wed, 2021-12-08 at 10:44 +0800, Nancy.Lin wrote:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 300 ++++++++++++++++++--
> ----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  10 +-
>  4 files changed, 246 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d661edf7e0fe..fe2871aca859 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -847,21 +847,28 @@ static int mtk_drm_crtc_init_comp_planes(struct
> drm_device *drm_dev,
>  }
>  
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> -			const enum mtk_ddp_comp_id *path, unsigned int
> path_len)
> +			const enum mtk_ddp_comp_id *path, unsigned int
> path_len,
> +			int priv_data_index)
>  {
>  	struct mtk_drm_private *priv = drm_dev->dev_private;
>  	struct device *dev = drm_dev->dev;
>  	struct mtk_drm_crtc *mtk_crtc;
>  	unsigned int num_comp_planes = 0;
> -	int pipe = priv->num_pipes;
>  	int ret;
>  	int i;
>  	bool has_ctm = false;
>  	uint gamma_lut_size = 0;
> +	struct drm_crtc *tmp;
> +	int crtc_i = 0;
>  
>  	if (!path)
>  		return 0;
>  
> +	priv = priv->all_drm_private[priv_data_index];
> +
> +	drm_for_each_crtc(tmp, drm_dev)
> +		crtc_i++;
> +
>  	for (i = 0; i < path_len; i++) {
>  		enum mtk_ddp_comp_id comp_id = path[i];
>  		struct device_node *node;
> @@ -873,7 +880,7 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  		if (!node) {
>  			dev_info(dev,
>  				 "Not creating crtc %d because
> component %d is disabled or missing\n",
> -				 pipe, comp_id);
> +				 crtc_i, comp_id);
>  			return 0;
>  		}
>  
> @@ -926,29 +933,28 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc,
> i,
> -						    pipe);
> +						    crtc_i);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, crtc_i);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (gamma_lut_size)
>  		drm_mode_crtc_set_gamma_size(&mtk_crtc->base,
> gamma_lut_size);
>  	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm,
> gamma_lut_size);
> -	priv->num_pipes++;
>  	mutex_init(&mtk_crtc->hw_lock);
>  
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	i = (priv->data->mbox_index) ? priv->data-
> >mbox_index[drm_crtc_index(&mtk_crtc->base)] : 0;
>  	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
>  	mtk_crtc->cmdq_client.client.tx_block = false;
>  	mtk_crtc->cmdq_client.client.knows_txdone = true;
>  	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
>  	mtk_crtc->cmdq_client.chan =
> -			mbox_request_channel(&mtk_crtc-
> >cmdq_client.client,
> -					     drm_crtc_index(&mtk_crtc-
> >base));
> +			mbox_request_channel(&mtk_crtc-
> >cmdq_client.client, i);

I really do not understand how does i work. Could you give an example
of the i value for mt8173 crtc0, mt8173 crtc1, and all mt8195 crtcs.

>  	if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
>  		dev_dbg(dev, "mtk_crtc %d failed to create mailbox
> client, writing register by CPU now\n",
>  			drm_crtc_index(&mtk_crtc->base));
> @@ -958,7 +964,7 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  	if (mtk_crtc->cmdq_client.chan) {
>  		ret = of_property_read_u32_index(priv->mutex_node,
>  						 "mediatek,gce-events",
> -						 drm_crtc_index(&mtk_cr
> tc->base),
> +						 i,
>  						 &mtk_crtc-
> >cmdq_event);
>  		if (ret) {
>  			dev_dbg(dev, "mtk_crtc %d failed to get
> mediatek,gce-events property\n",
> 

[snip]

>  
>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data
> = {
>  	.main_path = mt8195_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> +	.mmsys_dev_num = 2,

After this patch, vdosys0 would not work. So set this to 1 in this
patch, and set this to 2 in the mt8195 vdosys1 patch.

Regards,
CK

>  };
>  
> 

