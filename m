Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133964CF1C0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 07:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4D410E1A1;
	Mon,  7 Mar 2022 06:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7DA10E1A1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 06:20:19 +0000 (UTC)
X-UUID: 3dc6487c3a4940988437c9dc0914bc58-20220307
X-UUID: 3dc6487c3a4940988437c9dc0914bc58-20220307
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1218814292; Mon, 07 Mar 2022 14:20:13 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 14:20:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 14:20:11 +0800
Message-ID: <0f62b5ad6bca65ea79fb25014651e0ad40e79957.camel@mediatek.com>
Subject: Re: [PATCH v12 19/23] drm/mediatek: add dma dev get function
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
Date: Mon, 7 Mar 2022 14:20:12 +0800
In-Reply-To: <20220222100741.30138-20-nancy.lin@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-20-nancy.lin@mediatek.com>
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

On Tue, 2022-02-22 at 18:07 +0800, Nancy.Lin wrote:
> This is a preparation for adding support for the ovl_adaptor sub
> driver
> Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
> dma_dev_get function for getting representative dma dev in
> ovl_adaptor.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 +++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d661edf7e0fe..77af71ad65f8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -59,6 +59,7 @@ struct mtk_drm_crtc {
>  #endif
>  
>  	struct device			*mmsys_dev;
> +	struct device			*dma_dev;
>  	struct mtk_mutex		*mutex;
>  	unsigned int			ddp_comp_nr;
>  	struct mtk_ddp_comp		**ddp_comp;
> @@ -846,6 +847,13 @@ static int mtk_drm_crtc_init_comp_planes(struct
> drm_device *drm_dev,
>  	return 0;
>  }
>  
> +struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	return mtk_crtc->dma_dev;
> +}
> +
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			const enum mtk_ddp_comp_id *path, unsigned int
> path_len)
>  {
> @@ -931,6 +939,13 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  			return ret;
>  	}
>  
> +	/*
> +	 * Default to use the first component as the dma dev.
> +	 * In the case of ovl_adaptor sub driver, it needs to use the
> +	 * dma_dev_get function to get representative dma dev.
> +	 */
> +	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv-
> >ddp_comp[path[0]]);
> +
>  	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index cb9a36c48d4f..f5a6e80c5265 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -22,5 +22,6 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc,
> struct drm_plane *plane,
>  			     struct mtk_plane_state *state);
>  void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct
> drm_plane *plane,
>  			       struct drm_atomic_state *plane_state);
> +struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc);
>  
>  #endif /* MTK_DRM_CRTC_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 221e2e3a3c8d..4f7fae41c916 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -68,6 +68,7 @@ struct mtk_ddp_comp_funcs {
>  	void (*bgclr_in_off)(struct device *dev);
>  	void (*ctm_set)(struct device *dev,
>  			struct drm_crtc_state *state);
> +	struct device * (*dma_dev_get)(struct device *dev);
>  };
>  
>  struct mtk_ddp_comp {
> @@ -188,6 +189,13 @@ static inline void mtk_ddp_ctm_set(struct
> mtk_ddp_comp *comp,
>  		comp->funcs->ctm_set(comp->dev, state);
>  }
>  
> +static inline struct device *mtk_ddp_comp_dma_dev_get(struct
> mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->dma_dev_get)
> +		return comp->funcs->dma_dev_get(comp->dev);
> +	return comp->dev;
> +}
> +
>  int mtk_ddp_comp_get_id(struct device_node *node,
>  			enum mtk_ddp_comp_type comp_type);
>  unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device
> *drm,

