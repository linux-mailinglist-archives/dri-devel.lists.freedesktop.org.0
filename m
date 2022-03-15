Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E34D9389
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 06:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681410E294;
	Tue, 15 Mar 2022 05:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8AD10E294
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:08:23 +0000 (UTC)
X-UUID: 9311bec4a46d4d9884f1709a58a32ab7-20220315
X-UUID: 9311bec4a46d4d9884f1709a58a32ab7-20220315
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 678181283; Tue, 15 Mar 2022 13:08:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Mar 2022 13:08:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Mar 2022 13:08:14 +0800
Message-ID: <9ef2d9d33430c146c010d017678b37c5960e1316.camel@mediatek.com>
Subject: Re: [PATCH v15 20/22] drm/mediatek: add drm ovl_adaptor sub driver
 for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 15 Mar 2022 13:08:14 +0800
In-Reply-To: <20220311015506.11232-21-nancy.lin@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
 <20220311015506.11232-21-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 ++++------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 +++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 40 ++++++++++++-------
> --
>  4 files changed, 58 insertions(+), 32 deletions(-)
> 
> 

[snip]

> +
>  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] =
> {
>  	[MTK_DISP_AAL] = "aal",
>  	[MTK_DISP_BLS] = "bls",
> @@ -398,6 +411,7 @@ static const char * const
> mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>  	[MTK_DISP_OD] = "od",
>  	[MTK_DISP_OVL] = "ovl",
>  	[MTK_DISP_OVL_2L] = "ovl-2l",
> +	[MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
>  	[MTK_DISP_POSTMASK] = "postmask",
>  	[MTK_DISP_PWM] = "pwm",
>  	[MTK_DISP_RDMA] = "rdma",
> @@ -443,6 +457,7 @@ static const struct mtk_ddp_comp_match
> mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0,
> &ddp_ovl },
>  	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1,
> &ddp_ovl },
>  	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2,
> &ddp_ovl },
> +	[DDP_COMPONENT_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	
> 0, &ddp_ovl_adaptor },

I'm not sure this indent is align to other line or not. If aligned or
not aligned and modify other line to be aligned,

Reviewed-by: CK Hu <ck.hu@mediatek.com>


>  	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0,
> &ddp_postmask },
>  	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0,
> NULL },
>  	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1,
> NULL },
> @@ -548,12 +563,17 @@ int mtk_ddp_comp_init(struct device_node *node,
> struct mtk_ddp_comp *comp,
>  
>  	comp->id = comp_id;
>  	comp->funcs = mtk_ddp_matches[comp_id].funcs;
> -	comp_pdev = of_find_device_by_node(node);
> -	if (!comp_pdev) {
> -		DRM_INFO("Waiting for device %s\n", node->full_name);
> -		return -EPROBE_DEFER;
> +	/* Not all drm components have a DTS device node, such as
> ovl_adaptor,
> +	 * which is the drm bring up sub driver
> +	 */
> +	if (node) {
> +		comp_pdev = of_find_device_by_node(node);
> +		if (!comp_pdev) {
> +			DRM_INFO("Waiting for device %s\n", node-
> >full_name);
> +			return -EPROBE_DEFER;
> +		}
> +		comp->dev = &comp_pdev->dev;
>  	}
> -	comp->dev = &comp_pdev->dev;
>  
>  	/* Only DMA capable components need the LARB property */
>  	if (type == MTK_DISP_OVL ||
> @@ -573,6 +593,7 @@ int mtk_ddp_comp_init(struct device_node *node,
> struct mtk_ddp_comp *comp,
>  	    type == MTK_DISP_MERGE ||
>  	    type == MTK_DISP_OVL ||
>  	    type == MTK_DISP_OVL_2L ||
> +	    type == MTK_DISP_OVL_ADAPTOR ||
>  	    type == MTK_DISP_PWM ||
>  	    type == MTK_DISP_RDMA ||
>  	    type == MTK_DPI ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 4f7fae41c916..1862eba41c45 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_OD,
>  	MTK_DISP_OVL,
>  	MTK_DISP_OVL_2L,
> +	MTK_DISP_OVL_ADAPTOR,
>  	MTK_DISP_POSTMASK,
>  	MTK_DISP_PWM,
>  	MTK_DISP_RDMA,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index a05703843af2..99f37f8f6639 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -351,9 +351,7 @@ static int mtk_drm_kms_init(struct drm_device
> *drm)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
>  	struct mtk_drm_private *priv_n;
> -	struct platform_device *pdev;
> -	struct device_node *np = NULL;
> -	struct device *dma_dev;
> +	struct device *dma_dev = NULL;
>  	int ret, i, j;
>  
>  	ret = drmm_mode_config_init(drm);
> @@ -388,7 +386,6 @@ static int mtk_drm_kms_init(struct drm_device
> *drm)
>  	 *    different drm private data structures. Loop through crtc
> index to
>  	 *    create crtc from the main path and then ext_path and
> finally the
>  	 *    third path.
> -	 * 3. Use OVL device for all DMA memory allocations
>  	 */
>  	for (i = 0; i < MAX_CRTC; i++) {
>  		for (j = 0; j < private->data->mmsys_dev_num; j++) {
> @@ -400,9 +397,6 @@ static int mtk_drm_kms_init(struct drm_device
> *drm)
>  				if (ret)
>  					goto err_component_unbind;
>  
> -				if (!np)
> -					np = priv_n->comp_node[priv_n-
> >data->main_path[0]];
> -
>  				continue;
>  			} else if (i == 1 && priv_n->data->ext_len) {
>  				ret = mtk_drm_crtc_create(drm, priv_n-
> >data->ext_path,
> @@ -410,9 +404,6 @@ static int mtk_drm_kms_init(struct drm_device
> *drm)
>  				if (ret)
>  					goto err_component_unbind;
>  
> -				if (!np)
> -					np = priv_n->comp_node[priv_n-
> >data->ext_path[0]];
> -
>  				continue;
>  			} else if (i == 2 && priv_n->data->third_len) {
>  				ret = mtk_drm_crtc_create(drm, priv_n-
> >data->third_path,
> @@ -420,22 +411,19 @@ static int mtk_drm_kms_init(struct drm_device
> *drm)
>  				if (ret)
>  					goto err_component_unbind;
>  
> -				if (!np)
> -					np = priv_n->comp_node[priv_n-
> >data->third_path[0]];
> -
>  				continue;
>  			}
>  		}
>  	}
>  
> -	pdev = of_find_device_by_node(np);
> -	if (!pdev) {
> +	/* Use OVL device for all DMA memory allocations */
> +	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm,
> 0));
> +	if (!dma_dev) {
>  		ret = -ENODEV;
>  		dev_err(drm->dev, "Need at least one OVL device\n");
>  		goto err_component_unbind;
>  	}
>  
> -	dma_dev = &pdev->dev;
>  	for (i = 0; i < private->data->mmsys_dev_num; i++)
>  		private->all_drm_private[i]->dma_dev = dma_dev;
>  
> @@ -514,6 +502,11 @@ static int compare_of(struct device *dev, void
> *data)
>  	return dev->of_node == data;
>  }
>  
> +static int compare_dev(struct device *dev, void *data)
> +{
> +	return dev == (struct device *)data;
> +}
> +
>  static int mtk_drm_bind(struct device *dev)
>  {
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
> @@ -702,6 +695,7 @@ static int mtk_drm_probe(struct platform_device
> *pdev)
>  	struct mtk_drm_private *private;
>  	struct device_node *node;
>  	struct component_match *match = NULL;
> +	struct platform_device *ovl_adaptor;
>  	int ret;
>  	int i;
>  
> @@ -727,6 +721,18 @@ static int mtk_drm_probe(struct platform_device
> *pdev)
>  		return -ENODEV;
>  	}
>  
> +	/* Bringup ovl_adaptor */
> +	if (mtk_drm_find_mmsys_comp(private,
> DDP_COMPONENT_OVL_ADAPTOR)) {
> +		ovl_adaptor = platform_device_register_data(dev,
> "mediatek-disp-ovl-adaptor",
> +							    PLATFORM_DE
> VID_AUTO,
> +							    (void
> *)private->mmsys_dev,
> +							    sizeof(*pri
> vate->mmsys_dev));
> +		private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR].dev =
> &ovl_adaptor->dev;
> +		mtk_ddp_comp_init(NULL, &private-
> >ddp_comp[DDP_COMPONENT_OVL_ADAPTOR],
> +				  DDP_COMPONENT_OVL_ADAPTOR);
> +		component_match_add(dev, &match, compare_dev,
> &ovl_adaptor->dev);
> +	}
> +
>  	/* Iterate over sibling DISP function blocks */
>  	for_each_child_of_node(phandle->parent, node) {
>  		const struct of_device_id *of_id;
> @@ -780,6 +786,7 @@ static int mtk_drm_probe(struct platform_device
> *pdev)
>  		    comp_type == MTK_DISP_MERGE ||
>  		    comp_type == MTK_DISP_OVL ||
>  		    comp_type == MTK_DISP_OVL_2L ||
> +		    comp_type == MTK_DISP_OVL_ADAPTOR ||
>  		    comp_type == MTK_DISP_RDMA ||
>  		    comp_type == MTK_DPI ||
>  		    comp_type == MTK_DSI) {
> @@ -882,6 +889,7 @@ static struct platform_driver * const
> mtk_drm_drivers[] = {
>  	&mtk_disp_color_driver,
>  	&mtk_disp_gamma_driver,
>  	&mtk_disp_merge_driver,
> +	&mtk_disp_ovl_adaptor_driver,
>  	&mtk_disp_ovl_driver,
>  	&mtk_disp_rdma_driver,
>  	&mtk_dpi_driver,

