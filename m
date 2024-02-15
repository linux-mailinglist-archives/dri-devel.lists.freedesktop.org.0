Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA788560C8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D917610E653;
	Thu, 15 Feb 2024 11:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WapOTuJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341E810E653
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707995200;
 bh=fTMk6kpGDD0am7FVybzJCZuM86RqERCd+fAxCEDkTH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WapOTuJMLSUvc3jt26olqTmyJloaIN0SXhbVHbpZ+5VugPrNtvoyf1WNNWLCCnFBa
 hghmVz3GJ8bs7QiZEjAxa3yZjdw2fkp6Mzq1Iuw5brCZjYYVUfvWF934B0SxifV7/6
 PNQPit8oMRaAyEI1uJ4kLdMdre2iMsp54AaCrlho2csFeZe6deH2eqeHcmjVom/1/w
 qfVe34pfH2+mEH8RJBFWCAaooq5lTbR9J3vb+011bcSJFCszSooLOgYnlsHomxkzo2
 /RAfT6SS/PS7qWGXfgcKqxni6mqbYZgcxpvcZVJZoMYlcEDVdr+epVC/IizhVX9WFc
 zXXlZO7RILYzQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 950BF3781144;
 Thu, 15 Feb 2024 11:06:39 +0000 (UTC)
Message-ID: <44529502-250b-4c8a-94c3-2c481d1385cf@collabora.com>
Date: Thu, 15 Feb 2024 12:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] drm/mediatek: Support CRC in display driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Sean Paul <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>,
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-11-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215101119.12629-11-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 15/02/24 11:11, Hsiao Chien Sung ha scritto:
> Register CRC related function pointers to support
> CRC retrieval.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 239 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  39 ++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   3 +
>   3 files changed, 281 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 14cf75fa217f9..6cb1ed419dee7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -68,6 +68,9 @@ struct mtk_drm_crtc {
>   	/* lock for display hardware access */
>   	struct mutex			hw_lock;
>   	bool				config_updating;
> +
> +	struct mtk_ddp_comp		*crc_provider;
> +	unsigned int			frames;
>   };
>   
>   struct mtk_crtc_state {
> @@ -635,6 +638,14 @@ static void mtk_crtc_ddp_irq(void *data)
>   	struct drm_crtc *crtc = data;
>   	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>   	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
> +
> +	/*
> +	 * crc providers should make sure the crc is always correct
> +	 * by resetting it in .crc_read()
> +	 */
> +	if (crtc->crc.opened)
> +		comp->funcs->crc_read(comp->dev);
>   
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> @@ -646,6 +657,24 @@ static void mtk_crtc_ddp_irq(void *data)
>   	if (!priv->data->shadow_register)
>   		mtk_crtc_ddp_config(crtc, NULL);
>   #endif
> +
> +	/*
> +	 * drm_crtc_add_crc_entry() could take more than 50ms to finish
> +	 * put it at the end of the isr
> +	 */
> +	if (crtc->crc.opened) {
> +		/*
> +		 * skip the first crc because the first frame is configured by
> +		 * mtk_crtc_ddp_hw_init() when atomic enable
> +		 */
> +		if (++mtk_crtc->frames > 1) {
> +			drm_crtc_add_crc_entry(crtc, true,
> +					       drm_crtc_vblank_count(crtc),
> +					       comp->funcs->crc_entry(comp->dev));
> +		}
> +	} else {
> +		mtk_crtc->frames = 0;
> +	}
>   	mtk_drm_finish_page_flip(mtk_crtc);
>   }
>   
> @@ -704,6 +733,40 @@ static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
>   	}
>   }
>   
> +static int mtk_drm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src)
> +{
> +	if (src && strcmp(src, "auto") != 0) {
> +		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
> +			  __func__, drm_crtc_index(crtc), src);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int mtk_drm_crtc_verify_crc_source(struct drm_crtc *crtc,
> +					  const char *src,
> +					  size_t *cnt)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
> +
> +	if (!comp) {
> +		DRM_ERROR("%s(crtc-%d): no crc provider\n",
> +			  __func__, drm_crtc_index(crtc));
> +		return -ENOENT;
> +	}
> +
> +	if (src && strcmp(src, "auto") != 0) {
> +		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
> +			  __func__, drm_crtc_index(crtc), src);
> +		return -EINVAL;
> +	}
> +
> +	*cnt = comp->funcs->crc_cnt(comp->dev);
> +
> +	return 0;
> +}
> +
>   int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>   			     struct mtk_plane_state *state)
>   {
> @@ -841,6 +904,8 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
>   	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
>   	.enable_vblank		= mtk_drm_crtc_enable_vblank,
>   	.disable_vblank		= mtk_drm_crtc_disable_vblank,
> +	.set_crc_source		= mtk_drm_crtc_set_crc_source,
> +	.verify_crc_source	= mtk_drm_crtc_verify_crc_source,
>   };
>   
>   static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> @@ -1033,6 +1098,11 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   
>   			if (comp->funcs->ctm_set)
>   				has_ctm = true;
> +
> +			if (comp->funcs->crc_cnt &&
> +			    comp->funcs->crc_entry &&
> +			    comp->funcs->crc_read)
> +				mtk_crtc->crc_provider = comp;
>   		}
>   
>   		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
> @@ -1137,3 +1207,172 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   
>   	return 0;
>   }
> +
> +void mtk_drm_crc_init(struct mtk_drm_crc *crc,
> +		      const u32 *crc_offset_table, size_t crc_count,
> +		      u32 reset_offset, u32 reset_mask)
> +{
> +	crc->ofs = crc_offset_table;
> +	crc->cnt = crc_count;
> +	crc->rst_ofs = reset_offset;
> +	crc->rst_msk = reset_mask;
> +	crc->va = kcalloc(crc->cnt, sizeof(*crc->va), GFP_KERNEL);
> +	if (!crc->va) {
> +		DRM_ERROR("failed to allocate memory for crc\n");
> +		crc->cnt = 0;
> +	}
> +}
> +
> +void mtk_drm_crc_read(struct mtk_drm_crc *crc, void __iomem *reg)
> +{

	u32 n; goes here

> +	if (!crc->cnt || !crc->ofs || !crc->va)
> +		return;
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	/* sync to see the most up-to-date copy of the DMA buffer */
> +	dma_sync_single_for_cpu(crc->cmdq_client.chan->mbox->dev,
> +				crc->pa, crc->cnt * sizeof(*crc->va),
> +				DMA_FROM_DEVICE);
> +#else
> +	/* read crc with cpu for the platforms without cmdq */
> +	{

then you don't need the braces.

Regards,
Angelo

