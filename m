Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA74A3BE84
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C6C10E7DF;
	Wed, 19 Feb 2025 12:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BoFJwleh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1310E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739969362;
 bh=JtCFmUUtrIS/1k4JkzCecit2Kb9gJDSyTekDFBqRn5s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BoFJwlehHzLHswimyS6738I+f/x3tTiFvGkMWVEz+qn3QCdBvMUw+81CaryIEvLGa
 M1zQylEbDaQIkxPTakQ4n+OPp0Rk5Ss4JGZeJqsnhWdBvdtI21bfZ6qTVASRPSYaz6
 Z8wNjy+dXT5Jdamjzr9lCe4+oUqyOsubYjhpMYM/4gBbv3CYP1zUe5rp6CAJNeOKHx
 pGkTrTJvDynLRbfxmoWaMmAcuC2yGealIojDe+dbmtZgSRfgyjp2c6bklFVUa3D0H0
 hDWyInVFE5P2ne3wzPE8KoPJTojnhFPaqzlIkEfyx04Z4U/cNJHaywWnmkhn8ddfwE
 at8RWKN5fHTsg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 51BF917E14E7;
 Wed, 19 Feb 2025 13:49:21 +0100 (CET)
Message-ID: <779b0915-f0fa-46b6-8c5b-57745114252f@collabora.com>
Date: Wed, 19 Feb 2025 13:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/mediatek: Add CCORR component support for MT8196
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-2-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-2-jay.liu@mediatek.com>
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> Add CCORR component support for MT8196.
> 
> CCORR is a hardware module that optimizes the visual effects of
> images by adjusting the color matrix, enabling features such as
> night light.
> 
> The 8196 hardware platform includes two CCORR (Color Correction) units.
> However, the `mtk_ccorr_ctm_set` API only utilizes one of these units.
> To prevent the unused CCORR unit from inadvertently taking effect,
> we need to block it by adding mandatory_ccorr flag in the driver_data.
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>

This is yet another thing that can be resolved by using OF Graph for defining the
display pipeline: by using that, I don't see how can CCORR1 be used instead of
CCORR0, if the latter is in the pipeline, but not the former.

NACK.

Regards,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  3 ++-
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 16 ++++++++++++++++
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> index edc6417639e6..d7e230bac53e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -457,7 +457,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
>   	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
>   	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
>   	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
> -	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
> +	[DDP_COMPONENT_CCORR0]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
> +	[DDP_COMPONENT_CCORR1]		= { MTK_DISP_CCORR,		1, &ddp_ccorr },
>   	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
>   	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
>   	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 10d60d2c2a56..94e82b3fa2d8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -31,11 +31,13 @@
>   
>   struct mtk_disp_ccorr_data {
>   	u32 matrix_bits;
> +	enum mtk_ddp_comp_id mandatory_ccorr;
>   };
>   
>   struct mtk_disp_ccorr {
>   	struct clk *clk;
>   	void __iomem *regs;
> +	enum mtk_ddp_comp_id comp_id;
>   	struct cmdq_client_reg cmdq_reg;
>   	const struct mtk_disp_ccorr_data	*data;
>   };
> @@ -115,6 +117,9 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>   	if (!blob)
>   		return;
>   
> +	if (ccorr->comp_id != ccorr->data->mandatory_ccorr)
> +		return;
> +
>   	ctm = (struct drm_color_ctm *)blob->data;
>   	input = ctm->matrix;
>   
> @@ -154,6 +159,7 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct mtk_disp_ccorr *priv;
>   	int ret;
> +	enum mtk_ddp_comp_id comp_id;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -169,6 +175,14 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(priv->regs),
>   				     "failed to ioremap ccorr\n");
>   
> +	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_CCORR);
> +	if (comp_id < 0) {
> +		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> +		return comp_id;
> +	}
> +
> +	priv->comp_id = comp_id;
> +
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
>   	if (ret)
> @@ -192,10 +206,12 @@ static void mtk_disp_ccorr_remove(struct platform_device *pdev)
>   
>   static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
>   	.matrix_bits = 10,
> +	.mandatory_ccorr = DDP_COMPONENT_CCORR0,
>   };
>   
>   static const struct mtk_disp_ccorr_data mt8192_ccorr_driver_data = {
>   	.matrix_bits = 11,
> +	.mandatory_ccorr = DDP_COMPONENT_CCORR0,
>   };
>   
>   static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {

