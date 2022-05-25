Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3575334CE
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 03:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD44E10E0F4;
	Wed, 25 May 2022 01:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFFC10E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 01:40:38 +0000 (UTC)
X-UUID: e56487e752064495a040109dce418dbb-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:51c6442a-f7bb-4eaa-be1b-5cd552073914, OB:10,
 L
 OB:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:50
X-CID-INFO: VERSION:1.1.5, REQID:51c6442a-f7bb-4eaa-be1b-5cd552073914, OB:10,
 LOB
 :0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:50
X-CID-META: VersionHash:2a19b09, CLOUDID:d2c31ab8-3c45-407b-8f66-25095432a27a,
 C
 OID:4f79718f65cf,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: e56487e752064495a040109dce418dbb-20220525
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2115371326; Wed, 25 May 2022 09:40:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 25 May 2022 09:40:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 25 May 2022 09:40:32 +0800
Message-ID: <35d23d9ffd1d804fc3253d192f7de3eaebf3fcff.camel@mediatek.com>
Subject: Re: [PATCH v7, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Wed, 25 May 2022 09:40:32 +0800
In-Reply-To: <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

On Fri, 2022-05-20 at 10:00 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of "Use the drm_panel_bridge API",
> the poweron/poweroff of dsi is extracted from enable/disable and
> defined as new funcs (atomic_pre_enable/atomic_post_disable).
> 
> Since dsi_poweron is moved from dsi_enable to pre_enable function, in
> order to avoid poweron failure, the operation of dsi register fails
> to
> cause bus hang. Therefore, the protection mechanism is added to the
> dsi_enable function.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++---------
> --
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index f880136cec09..d9a6b928dba8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> *dsi)
>  	if (--dsi->refcount != 0)
>  		return;
>  
> -	/*
> -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> -	 * mtk_dsi_stop() should be called after
> mtk_drm_crtc_atomic_disable(),
> -	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> irq.
> -	 * mtk_dsi_start() needs to be called in
> mtk_output_dsi_enable(),
> -	 * after dsi is fully set.
> -	 */
> -	mtk_dsi_stop(dsi);
> -
> -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>  	mtk_dsi_reset_engine(dsi);
>  	mtk_dsi_lane0_ulp_mode_enter(dsi);
>  	mtk_dsi_clk_ulp_mode_enter(dsi);
> @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> *dsi)
>  
>  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>  {
> -	int ret;
> -
>  	if (dsi->enabled)
>  		return;
>  
> -	ret = mtk_dsi_poweron(dsi);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to power on dsi\n");
> -		return;
> -	}
> -
>  	mtk_dsi_set_mode(dsi);
>  	mtk_dsi_clk_hs_mode(dsi, 1);
>  
> @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct
> mtk_dsi *dsi)
>  	if (!dsi->enabled)
>  		return;
>  
> -	mtk_dsi_poweroff(dsi);
> +	/*
> +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> +	 * mtk_dsi_stop() should be called after
> mtk_drm_crtc_atomic_disable(),
> +	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> irq.
> +	 * mtk_dsi_start() needs to be called in
> mtk_output_dsi_enable(),
> +	 * after dsi is fully set.
> +	 */
> +	mtk_dsi_stop(dsi);
> +
> +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>  
>  	dsi->enabled = false;
>  }
> @@ -776,13 +767,37 @@ static void mtk_dsi_bridge_atomic_enable(struct
> drm_bridge *bridge,
>  {
>  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>  
> +	if (dsi->refcount == 0)
> +		return;
> +
>  	mtk_output_dsi_enable(dsi);
>  }
>  
> +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge
> *bridge,
> +					     struct drm_bridge_state
> *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	ret = mtk_dsi_poweron(dsi);
> +	if (ret < 0)
> +		DRM_ERROR("failed to power on dsi\n");
> +}
> +
> +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge
> *bridge,
> +					       struct drm_bridge_state
> *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	mtk_dsi_poweroff(dsi);
> +}
> +
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
>  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
>  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  

