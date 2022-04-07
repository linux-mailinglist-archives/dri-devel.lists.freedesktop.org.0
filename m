Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CB4F6F72
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 03:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4410E1B5;
	Thu,  7 Apr 2022 01:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AC310E1B5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 01:09:36 +0000 (UTC)
X-UUID: af5dd61db108415185c4fae63894b6b3-20220407
X-UUID: af5dd61db108415185c4fae63894b6b3-20220407
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1937445679; Thu, 07 Apr 2022 09:09:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 09:09:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 09:09:29 +0800
Message-ID: <fc73b7f102ba6451e16ab55af091748405bcc5de.camel@mediatek.com>
Subject: Re: [PATCH V2] drm/mediatek: Add vblank register/unregister
 callback functions
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>
Date: Thu, 7 Apr 2022 09:09:29 +0800
In-Reply-To: <20220321072320.15019-1-rex-bc.chen@mediatek.com>
References: <20220321072320.15019-1-rex-bc.chen@mediatek.com>
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
Cc: airlied@linux.ie, jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@google.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Mon, 2022-03-21 at 15:23 +0800, Rex-BC Chen wrote:
> We encountered a kernel panic issue that callback data will be NULL
> when
> it's using in ovl irq handler. There is a timing issue between
> mtk_disp_ovl_irq_handler() and mtk_ovl_disable_vblank().
> 
> To resolve this issue, we use the flow to register/unregister vblank
> cb:
> - Register callback function and callback data when crtc creates.
> - Unregister callback function and callback data when crtc destroies.
> 
> With this solution, we can assure callback data will not be NULL when
> vblank is disable.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Fixes: 9b0704988b15 ("drm/mediatek: Register vblank callback
> function")
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 
> ----
> V2:
> 1. Change title to "Add vblank register/unregister callback
> functions".
> ----
> 
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 16 +++++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 22 ++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 20 +++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 14 +++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 29 ++++++++++++++++---
> --
>  6 files changed, 80 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 86c3068894b1..974462831133 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -76,9 +76,11 @@ void mtk_ovl_layer_off(struct device *dev,
> unsigned int idx,
>  void mtk_ovl_start(struct device *dev);
>  void mtk_ovl_stop(struct device *dev);
>  unsigned int mtk_ovl_supported_rotations(struct device *dev);
> -void mtk_ovl_enable_vblank(struct device *dev,
> -			   void (*vblank_cb)(void *),
> -			   void *vblank_cb_data);
> +void mtk_ovl_register_vblank_cb(struct device *dev,
> +				void (*vblank_cb)(void *),
> +				void *vblank_cb_data);
> +void mtk_ovl_unregister_vblank_cb(struct device *dev);
> +void mtk_ovl_enable_vblank(struct device *dev);
>  void mtk_ovl_disable_vblank(struct device *dev);
>  
>  void mtk_rdma_bypass_shadow(struct device *dev);
> @@ -93,9 +95,11 @@ void mtk_rdma_layer_config(struct device *dev,
> unsigned int idx,
>  			   struct cmdq_pkt *cmdq_pkt);
>  void mtk_rdma_start(struct device *dev);
>  void mtk_rdma_stop(struct device *dev);
> -void mtk_rdma_enable_vblank(struct device *dev,
> -			    void (*vblank_cb)(void *),
> -			    void *vblank_cb_data);
> +void mtk_rdma_register_vblank_cb(struct device *dev,
> +				 void (*vblank_cb)(void *),
> +				 void *vblank_cb_data);
> +void mtk_rdma_unregister_vblank_cb(struct device *dev);
> +void mtk_rdma_enable_vblank(struct device *dev);
>  void mtk_rdma_disable_vblank(struct device *dev);
>  
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2146299e5f52..1fa1bbac9f9c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -96,14 +96,28 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int
> irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -void mtk_ovl_enable_vblank(struct device *dev,
> -			   void (*vblank_cb)(void *),
> -			   void *vblank_cb_data)
> +void mtk_ovl_register_vblank_cb(struct device *dev,
> +				void (*vblank_cb)(void *),
> +				void *vblank_cb_data)
>  {
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
>  	ovl->vblank_cb = vblank_cb;
>  	ovl->vblank_cb_data = vblank_cb_data;
> +}
> +
> +void mtk_ovl_unregister_vblank_cb(struct device *dev)
> +{
> +	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> +
> +	ovl->vblank_cb = NULL;
> +	ovl->vblank_cb_data = NULL;
> +}
> +
> +void mtk_ovl_enable_vblank(struct device *dev)
> +{
> +	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> +
>  	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
>  	writel_relaxed(OVL_FME_CPL_INT, ovl->regs +
> DISP_REG_OVL_INTEN);
>  }
> @@ -112,8 +126,6 @@ void mtk_ovl_disable_vblank(struct device *dev)
>  {
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
> -	ovl->vblank_cb = NULL;
> -	ovl->vblank_cb_data = NULL;
>  	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index d41a3970b944..943780fc7bf6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -94,24 +94,32 @@ static void rdma_update_bits(struct device *dev,
> unsigned int reg,
>  	writel(tmp, rdma->regs + reg);
>  }
>  
> -void mtk_rdma_enable_vblank(struct device *dev,
> -			    void (*vblank_cb)(void *),
> -			    void *vblank_cb_data)
> +void mtk_rdma_register_vblank_cb(struct device *dev,
> +				 void (*vblank_cb)(void *),
> +				 void *vblank_cb_data)
>  {
>  	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
>  
>  	rdma->vblank_cb = vblank_cb;
>  	rdma->vblank_cb_data = vblank_cb_data;
> -	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE,
> RDMA_FRAME_END_INT,
> -			 RDMA_FRAME_END_INT);
>  }
>  
> -void mtk_rdma_disable_vblank(struct device *dev)
> +void mtk_rdma_unregister_vblank_cb(struct device *dev)
>  {
>  	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
>  
>  	rdma->vblank_cb = NULL;
>  	rdma->vblank_cb_data = NULL;
> +}
> +
> +void mtk_rdma_enable_vblank(struct device *dev)
> +{
> +	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE,
> RDMA_FRAME_END_INT,
> +			 RDMA_FRAME_END_INT);
> +}
> +
> +void mtk_rdma_disable_vblank(struct device *dev)
> +{
>  	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE,
> RDMA_FRAME_END_INT, 0);
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d661edf7e0fe..e42a9bfa0ecb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -152,6 +152,7 @@ static void mtk_drm_cmdq_pkt_destroy(struct
> cmdq_pkt *pkt)
>  static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
>  {
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	int i;
>  
>  	mtk_mutex_put(mtk_crtc->mutex);
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> @@ -162,6 +163,14 @@ static void mtk_drm_crtc_destroy(struct drm_crtc
> *crtc)
>  		mtk_crtc->cmdq_client.chan = NULL;
>  	}
>  #endif
> +
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +		struct mtk_ddp_comp *comp;
> +
> +		comp = mtk_crtc->ddp_comp[i];
> +		mtk_ddp_comp_unregister_vblank_cb(comp);
> +	}
> +
>  	drm_crtc_cleanup(crtc);
>  }
>  
> @@ -616,7 +625,7 @@ static int mtk_drm_crtc_enable_vblank(struct
> drm_crtc *crtc)
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
>  
> -	mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc-
> >base);
> +	mtk_ddp_comp_enable_vblank(comp);
>  
>  	return 0;
>  }
> @@ -916,6 +925,9 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  			if (comp->funcs->ctm_set)
>  				has_ctm = true;
>  		}
> +
> +		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
> +						&mtk_crtc->base);
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index b4b682bc1991..028cf76b9531 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -297,6 +297,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =
> {
>  	.config = mtk_ovl_config,
>  	.start = mtk_ovl_start,
>  	.stop = mtk_ovl_stop,
> +	.register_vblank_cb = mtk_ovl_register_vblank_cb,
> +	.unregister_vblank_cb = mtk_ovl_unregister_vblank_cb,
>  	.enable_vblank = mtk_ovl_enable_vblank,
>  	.disable_vblank = mtk_ovl_disable_vblank,
>  	.supported_rotations = mtk_ovl_supported_rotations,
> @@ -321,6 +323,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma =
> {
>  	.config = mtk_rdma_config,
>  	.start = mtk_rdma_start,
>  	.stop = mtk_rdma_stop,
> +	.register_vblank_cb = mtk_rdma_register_vblank_cb,
> +	.unregister_vblank_cb = mtk_rdma_unregister_vblank_cb,
>  	.enable_vblank = mtk_rdma_enable_vblank,
>  	.disable_vblank = mtk_rdma_disable_vblank,
>  	.layer_nr = mtk_rdma_layer_nr,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 4c6a98662305..b83f24cb045f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -48,9 +48,11 @@ struct mtk_ddp_comp_funcs {
>  		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  	void (*start)(struct device *dev);
>  	void (*stop)(struct device *dev);
> -	void (*enable_vblank)(struct device *dev,
> -			      void (*vblank_cb)(void *),
> -			      void *vblank_cb_data);
> +	void (*register_vblank_cb)(struct device *dev,
> +				   void (*vblank_cb)(void *),
> +				   void *vblank_cb_data);
> +	void (*unregister_vblank_cb)(struct device *dev);
> +	void (*enable_vblank)(struct device *dev);
>  	void (*disable_vblank)(struct device *dev);
>  	unsigned int (*supported_rotations)(struct device *dev);
>  	unsigned int (*layer_nr)(struct device *dev);
> @@ -111,12 +113,25 @@ static inline void mtk_ddp_comp_stop(struct
> mtk_ddp_comp *comp)
>  		comp->funcs->stop(comp->dev);
>  }
>  
> -static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp
> *comp,
> -					      void (*vblank_cb)(void
> *),
> -					      void *vblank_cb_data)
> +static inline void mtk_ddp_comp_register_vblank_cb(struct
> mtk_ddp_comp *comp,
> +						   void
> (*vblank_cb)(void *),
> +						   void
> *vblank_cb_data)
> +{
> +	if (comp->funcs && comp->funcs->register_vblank_cb)
> +		comp->funcs->register_vblank_cb(comp->dev, vblank_cb,
> +						vblank_cb_data);
> +}
> +
> +static inline void mtk_ddp_comp_unregister_vblank_cb(struct
> mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->unregister_vblank_cb)
> +		comp->funcs->unregister_vblank_cb(comp->dev);
> +}
> +
> +static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp
> *comp)
>  {
>  	if (comp->funcs && comp->funcs->enable_vblank)
> -		comp->funcs->enable_vblank(comp->dev, vblank_cb,
> vblank_cb_data);
> +		comp->funcs->enable_vblank(comp->dev);
>  }
>  
>  static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp
> *comp)

