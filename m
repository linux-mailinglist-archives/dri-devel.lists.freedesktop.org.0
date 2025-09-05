Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE8B46148
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 19:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF40D10EC1A;
	Fri,  5 Sep 2025 17:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rQBydLb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E96F10EC1A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 17:56:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 45C451A0DD4;
 Fri,  5 Sep 2025 17:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F08E96060B;
 Fri,  5 Sep 2025 17:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E8D5102F0DB1; 
 Fri,  5 Sep 2025 19:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757094995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=4EenHyiB0mTfkyc539bYZDw4tPazSVsEFO2F1cH3E9A=;
 b=rQBydLb56B4wx6jEf2cHEf70+pOZXXjX6oB34+CSTLraZdQU5Uov9YDfi5afcUYo6F+V3N
 U3z5wr74jKLyZOnStdi/DeyBDK1rfeyLaLJVEFH3EglcnPEPzdIPlMS3cbFUsRnmh4os0D
 oqg/kos40cc+9FsXyUiCFtHy8sYHi9j26pWIE/qCaHX72GRUhNFGedTRQjE8hG9ciT2ZJJ
 TtDk1A86hHD7xzmeSF7PrjKxgqEQUB6EkwryAmOyGasBjNXgaVZw4prEUjPfORHZpcxpIs
 wLGIeq0Wyqt9Nac0vHP9xk7PXGJODkLs3Hl9uNiNLGsiOM7WpX65L0DVwYIuSQ==
Message-ID: <22a8894a-6eb9-4f7a-b485-6259c3abc300@bootlin.com>
Date: Fri, 5 Sep 2025 19:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/5] drm/mediatek: Support post-blend colorops for
 gamma and ctm
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-3-a9446d4aca82@collabora.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-3-a9446d4aca82@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 22/08/2025 à 20:36, Nícolas F. R. A. Prado a écrit :
> Allow configuring the gamma and ccorr blocks through the post-blend
> color pipeline API instead of the GAMMA_LUT and CTM properties.
> 
> In order to achieve this, initialize the color pipeline property and
> colorops on the CRTC based on the DDP components available in the CRTC
> path. Then introduce a struct mtk_drm_colorop that extends drm_colorop
> and tracks the mtk_ddp_comp that implements it in hardware, and include
> new ddp_comp helper functions for setting gamma and ctm through the new
> API. These helpers will then be called during commit flush for every
> updated colorop if the DRM client supports the post-blend color pipeline
> API.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_crtc.c     | 211 +++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
>   2 files changed, 208 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
> index bc7527542fdc6fb89fc36794cee7d6dc26f7dcce..80ed061de1af31916d814f29f9111973cffd10dd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -82,6 +82,12 @@ struct mtk_crtc_state {
>   	unsigned int			pending_vrefresh;
>   };
>   
> +struct mtk_drm_colorop {
> +	struct drm_colorop colorop;
> +	struct mtk_ddp_comp *comp;
> +	uint32_t data_id;
> +};
> +

@Alex: This is exactly a case where I think the current 
drm_colorop_pipeline_destroy will break.

>   static inline struct mtk_crtc *to_mtk_crtc(struct drm_crtc *c)
>   {
>   	return container_of(c, struct mtk_crtc, base);
> @@ -92,6 +98,11 @@ static inline struct mtk_crtc_state *to_mtk_crtc_state(struct drm_crtc_state *s)
>   	return container_of(s, struct mtk_crtc_state, base);
>   }
>   
> +static inline struct mtk_drm_colorop *to_mtk_colorop(struct drm_colorop *colorop)
> +{
> +	return container_of(colorop, struct mtk_drm_colorop, colorop);
> +}
> +
>   static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
>   {
>   	struct drm_crtc *crtc = &mtk_crtc->base;
> @@ -125,6 +136,19 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
>   	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
>   }
>   
> +static void mtk_drm_colorop_pipeline_destroy(struct drm_device *dev)
> +{
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_colorop *colorop, *next;
> +	struct mtk_drm_colorop *mtk_colorop;
> +
> +	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
> +		drm_colorop_cleanup(colorop);
> +		mtk_colorop = to_mtk_colorop(colorop);
> +		kfree(mtk_colorop);
> +	}
> +}
> +
>   static void mtk_crtc_destroy(struct drm_crtc *crtc)
>   {
>   	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
> @@ -146,6 +170,8 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
>   		mtk_ddp_comp_unregister_vblank_cb(comp);
>   	}
>   
> +	mtk_drm_colorop_pipeline_destroy(crtc->dev);
> +
>   	drm_crtc_cleanup(crtc);
>   }
>   
> @@ -854,20 +880,103 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
>   	}
>   }
>   
> +static bool colorop_data_update_flush_status(struct drm_colorop_state *colorop_state)
> +{
> +	struct drm_colorop *colorop = colorop_state->colorop;
> +	struct mtk_drm_colorop *mtk_colorop = to_mtk_colorop(colorop);
> +	struct drm_property_blob *data_blob = colorop_state->data;
> +	uint32_t data_id = colorop_state->bypass ? 0 : data_blob->base.id;
> +	bool needs_flush = mtk_colorop->data_id != data_id;
> +
> +	mtk_colorop->data_id = data_id;
> +
> +	return needs_flush;
> +}
> +
> +static void mtk_crtc_ddp_comp_apply_colorop(struct drm_colorop_state *colorop_state)
> +{
> +	struct drm_colorop *colorop = colorop_state->colorop;
> +	struct mtk_drm_colorop *mtk_colorop = to_mtk_colorop(colorop);
> +	struct drm_property_blob *data_blob = colorop_state->data;
> +	struct mtk_ddp_comp *ddp_comp = mtk_colorop->comp;
> +	struct drm_color_ctm_3x4 *ctm = NULL;
> +	struct drm_color_lut32 *lut = NULL;
> +
> +	switch (colorop->type) {
> +	case DRM_COLOROP_1D_LUT:
> +		if (!colorop_data_update_flush_status(colorop_state))
> +			return;
> +
> +		if (!colorop_state->bypass)
> +			lut = (struct drm_color_lut32 *)data_blob->data;
> +
> +		ddp_comp->funcs->gamma_set_color_pipeline(ddp_comp->dev, lut);
> +		break;
> +	case DRM_COLOROP_CTM_3X4:
> +		if (!colorop_data_update_flush_status(colorop_state))
> +			return;
> +
> +		if (!colorop_state->bypass)
> +			ctm = (struct drm_color_ctm_3x4 *)data_blob->data;
> +
> +		ddp_comp->funcs->ctm_set_color_pipeline(ddp_comp->dev, ctm);
> +		break;
> +	default:
> +		/* If this happens the driver is broken */
> +		drm_WARN(colorop->dev, 1,
> +			 "Trying to atomic flush COLOROP of type unsupported by driver: %d\n",
> +			 colorop->type);
> +		break;
> +	}
> +}
> +
>   static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
>   				  struct drm_atomic_state *state)
>   {
>   	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct drm_colorop_state *new_colorop_state;
> +	struct drm_colorop *colorop;
>   	int i;
>   
> -	if (crtc->state->color_mgmt_changed)
> -		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> -			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
> -			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
> -		}
> +	if (state->post_blend_color_pipeline) {
> +		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i)
> +			mtk_crtc_ddp_comp_apply_colorop(new_colorop_state);
> +	} else {
> +		if (crtc->state->color_mgmt_changed)
> +			for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +				mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
> +				mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
> +			}
> +	}
>   	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
>   }
>   
> +static int mtk_crtc_atomic_check(struct drm_crtc *crtc,
> +				 struct drm_atomic_state *state)
> +{
> +	struct drm_colorop_state *new_colorop_state;
> +	struct drm_colorop *colorop;
> +	int i;
> +
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		switch (colorop->type) {
> +		case DRM_COLOROP_1D_LUT:
> +		case DRM_COLOROP_CTM_3X4:
> +			if (!new_colorop_state->bypass && !new_colorop_state->data) {
> +				drm_dbg_atomic(crtc->dev,
> +					       "Missing required DATA property for COLOROP:%d\n",
> +					       colorop->base.id);
> +				return -EINVAL;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct drm_crtc_funcs mtk_crtc_funcs = {
>   	.set_config		= drm_atomic_helper_set_config,
>   	.page_flip		= drm_atomic_helper_page_flip,
> @@ -885,6 +994,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>   	.mode_valid	= mtk_crtc_mode_valid,
>   	.atomic_begin	= mtk_crtc_atomic_begin,
>   	.atomic_flush	= mtk_crtc_atomic_flush,
> +	.atomic_check   = mtk_crtc_atomic_check,
>   	.atomic_enable	= mtk_crtc_atomic_enable,
>   	.atomic_disable	= mtk_crtc_atomic_disable,
>   };
> @@ -987,6 +1097,95 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc)
>   	return mtk_crtc->dma_dev;
>   }
>   
> +#define MAX_COLOR_PIPELINE_OPS 2
> +#define MAX_COLOR_PIPELINES 1
> +
> +static int mtk_colorop_init(struct mtk_crtc *mtk_crtc,
> +			    struct mtk_drm_colorop *mtk_colorop,
> +			    struct mtk_ddp_comp *ddp_comp)
> +{
> +	struct drm_colorop *colorop = &mtk_colorop->colorop;
> +	int ret = 0;
> +
> +	if (ddp_comp->funcs->gamma_set_color_pipeline) {
> +		unsigned int lut_sz = mtk_ddp_gamma_get_lut_size(ddp_comp);
> +
> +		ret = drm_crtc_colorop_curve_1d_lut_init(mtk_crtc->base.dev, colorop,
> +							 &mtk_crtc->base,
> +							 lut_sz,
> +							 DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +							 DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	} else if (ddp_comp->funcs->ctm_set_color_pipeline) {
> +		ret = drm_crtc_colorop_ctm_3x4_init(mtk_crtc->base.dev,
> +						    colorop,
> +						    &mtk_crtc->base,
> +						    DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	}
> +
> +	mtk_colorop->comp = ddp_comp;
> +
> +	return ret;
> +}
> +
> +static int mtk_crtc_init_post_blend_color_pipeline(struct mtk_crtc *mtk_crtc,
> +						   unsigned int gamma_lut_size)
> +{
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> +	struct mtk_drm_colorop *mtk_colorop;
> +	unsigned int num_pipelines = 0;
> +	unsigned int op_idx = 0;
> +	int ret;
> +
> +	memset(ops, 0, sizeof(ops));
> +
> +	for (unsigned int i = 0;
> +	     i < mtk_crtc->ddp_comp_nr && op_idx < MAX_COLOR_PIPELINE_OPS;
> +	     i++) {
> +		struct mtk_ddp_comp *ddp_comp = mtk_crtc->ddp_comp[i];
> +
> +		if (!(ddp_comp->funcs->gamma_set_color_pipeline ||
> +		      ddp_comp->funcs->ctm_set_color_pipeline))
> +			continue;
> +
> +		mtk_colorop = kzalloc(sizeof(struct mtk_drm_colorop), GFP_KERNEL);
> +		if (!mtk_colorop) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ops[op_idx] = &mtk_colorop->colorop;
> +
> +		ret = mtk_colorop_init(mtk_crtc, mtk_colorop, ddp_comp);
> +		if (ret)
> +			goto cleanup;
> +
> +		if (op_idx > 0)
> +			drm_colorop_set_next_property(ops[op_idx-1], ops[op_idx]);
> +
> +		op_idx++;
> +	}
> +
> +	if (op_idx > 0) {
> +		pipelines[0].type = ops[0]->base.id;
> +		pipelines[0].name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
> +		num_pipelines = 1;
> +	}
> +
> +	/* Create COLOR_PIPELINE property and attach */
> +	drm_crtc_create_color_pipeline_property(&mtk_crtc->base, pipelines, num_pipelines);
> +
> +	return 0;
> +
> +cleanup:
> +	if (ret == -ENOMEM)
> +		drm_err(mtk_crtc->base.dev, "KMS: Failed to allocate colorop\n");
> +
> +	mtk_drm_colorop_pipeline_destroy(mtk_crtc->base.dev);
> +
> +	return ret;
> +}
> +
>   int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
>   		    unsigned int path_len, int priv_data_index,
>   		    const struct mtk_drm_route *conn_routes,
> @@ -1103,6 +1302,8 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
>   	if (ret < 0)
>   		return ret;
>   
> +	mtk_crtc_init_post_blend_color_pipeline(mtk_crtc, gamma_lut_size);
> +
>   	if (gamma_lut_size)
>   		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
>   	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> index 7289b3dcf22f22f344016beee0c7c144cf7b93c8..554c3cc8ad7b266b8b8eee74ceb8f7383fe2f8df 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> @@ -75,10 +75,12 @@ struct mtk_ddp_comp_funcs {
>   	unsigned int (*gamma_get_lut_size)(struct device *dev);
>   	void (*gamma_set)(struct device *dev,
>   			  struct drm_crtc_state *state);
> +	void (*gamma_set_color_pipeline)(struct device *dev, struct drm_color_lut32 *lut);
>   	void (*bgclr_in_on)(struct device *dev);
>   	void (*bgclr_in_off)(struct device *dev);
>   	void (*ctm_set)(struct device *dev,
>   			struct drm_crtc_state *state);
> +	void (*ctm_set_color_pipeline)(struct device *dev, struct drm_color_ctm_3x4 *ctm);
>   	struct device * (*dma_dev_get)(struct device *dev);
>   	u32 (*get_blend_modes)(struct device *dev);
>   	const u32 *(*get_formats)(struct device *dev);
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

