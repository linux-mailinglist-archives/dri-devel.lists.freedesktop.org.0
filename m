Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFB368A5F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 03:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597286EB18;
	Fri, 23 Apr 2021 01:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A65C6EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 01:30:06 +0000 (UTC)
X-UUID: 978b514e859449d0ae0616db152677d0-20210423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uPI3I76ev2hEGW8ViAx+aH2J2P8PkgKs+WekwKZHjwA=; 
 b=fvJFxGoKt/dhGUV0b8f8Due0px808hgWCEMSykyNinpn2PL597pXqsUgLI2x9LCfmAPs917ZKksRVKYKN4ivN5pbA2bruXSfBVoU39F2CazwFF2tmq+LctxoKEYceE3DOmyIASNP5JWYWO/Fkt1QCfaV8G/S5VgteMY3sp7WRHw=;
X-UUID: 978b514e859449d0ae0616db152677d0-20210423
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1278433265; Fri, 23 Apr 2021 09:30:00 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Apr 2021 09:29:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Apr 2021 09:29:41 +0800
Message-ID: <1619141381.28327.8.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: clear pending flag when cmdq packet is done.
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 23 Apr 2021 09:29:41 +0800
In-Reply-To: <20210422111004.1338867-1-hsinyi@chromium.org>
References: <20210422111004.1338867-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Dennis YC
 Hsieh <dennis-yc.hsieh@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-yi:

On Thu, 2021-04-22 at 19:10 +0800, Hsin-Yi Wang wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> In cmdq mode, packet may be flushed before it is executed, so
> the pending flag should be cleared after cmdq packet is done.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 56 +++++++++++++++++++++---
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  2 files changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 40df2c823187..051bf0eb00d3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -224,6 +224,45 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct cmdq_cb_data data)
>  {
> +	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
> +	struct mtk_drm_crtc *mtk_crtc = (struct mtk_drm_crtc *)pkt->crtc;
> +	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
> +	unsigned int i;
> +
> +	if (data.sta == CMDQ_CB_ERROR)

I prefer use standard error status instead of proprietary one, so I send
a patch [1]. I would like this patch depend on [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210314233323.23377-2-chunkuang.hu@kernel.org/

> +		goto destroy_pkt;
> +
> +	if (state->pending_config) {
> +		state->pending_config = false;
> +	}
> +
> +	if (mtk_crtc->pending_planes) {
> +		for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +			struct drm_plane *plane = &mtk_crtc->planes[i];
> +			struct mtk_plane_state *plane_state;
> +
> +			plane_state = to_mtk_plane_state(plane->state);
> +
> +			if (plane_state->pending.config)
> +				plane_state->pending.config = false;
> +		}
> +		mtk_crtc->pending_planes = false;
> +	}
> +
> +	if (mtk_crtc->pending_async_planes) {
> +		for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +			struct drm_plane *plane = &mtk_crtc->planes[i];
> +			struct mtk_plane_state *plane_state;
> +
> +			plane_state = to_mtk_plane_state(plane->state);
> +
> +			if (plane_state->pending.async_config)
> +				plane_state->pending.async_config = false;
> +		}
> +		mtk_crtc->pending_async_planes = false;
> +	}
> +
> +destroy_pkt:
>  	cmdq_pkt_destroy(data.data);
>  }
>  #endif
> @@ -377,8 +416,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
>  				    state->pending_height,
>  				    state->pending_vrefresh, 0,
>  				    cmdq_handle);
> -
> -		state->pending_config = false;
> +		if (!cmdq_handle)
> +			state->pending_config = false;
>  	}
>  
>  	if (mtk_crtc->pending_planes) {
> @@ -398,9 +437,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
>  				mtk_ddp_comp_layer_config(comp, local_layer,
>  							  plane_state,
>  							  cmdq_handle);
> -			plane_state->pending.config = false;
> +			if (!cmdq_handle)
> +				plane_state->pending.config = false;
>  		}
> -		mtk_crtc->pending_planes = false;
> +		if (!cmdq_handle)
> +			mtk_crtc->pending_planes = false;
>  	}
>  
>  	if (mtk_crtc->pending_async_planes) {
> @@ -420,9 +461,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
>  				mtk_ddp_comp_layer_config(comp, local_layer,
>  							  plane_state,
>  							  cmdq_handle);
> -			plane_state->pending.async_config = false;
> +			if (!cmdq_handle)
> +				plane_state->pending.async_config = false;
>  		}
> -		mtk_crtc->pending_async_planes = false;
> +		if (!cmdq_handle)
> +			mtk_crtc->pending_async_planes = false;
>  	}
>  }
>  
> @@ -475,6 +518,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
>  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>  		mtk_crtc_ddp_config(crtc, cmdq_handle);
>  		cmdq_pkt_finalize(cmdq_handle);
> +		cmdq_handle->crtc = mtk_crtc;
>  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
>  	}
>  #endif
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index d5a983d65f05..c06b14ec03e5 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -90,6 +90,7 @@ struct cmdq_pkt {
>  	struct cmdq_task_cb	cb;
>  	struct cmdq_task_cb	async_cb;
>  	void			*cl;
> +	void			*crtc;

Not all client need crtc, so I would like to use another structure to
include cmdq_pkt and crtc and cast that structure to cmdq_pkt. I have a
plan to use mailbox rx_callback instead of cmdq_task_cb [2] (not
upstreamed yet), and it is an example that crtc include cmdq_pkt. To
upstream [2] would take a long time, you could choose to depend on [2]
or not.

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq&id=2c3289b1550ea1105a02750928df738753ddf8e1

Regards,
CK

>  };
>  
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
