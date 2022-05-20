Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C552E2F8
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 05:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101BF11AE4A;
	Fri, 20 May 2022 03:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588811AE4A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 03:16:47 +0000 (UTC)
X-UUID: 47cab836a08545368238e1f151768730-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:e9a855ad-0a6d-421f-a7e9-6ec088449316, OB:0,
 LO
 B:20,IP:0,URL:5,TC:0,Content:14,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:64
X-CID-INFO: VERSION:1.1.5, REQID:e9a855ad-0a6d-421f-a7e9-6ec088449316, OB:0,
 LOB:
 20,IP:0,URL:5,TC:0,Content:14,EDM:0,RT:0,SF:45,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:64
X-CID-META: VersionHash:2a19b09, CLOUDID:04d0f179-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:f8a408ea6a3f,Recheck:0,SF:28|17|19|48,TC:nil,Content:3,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: 47cab836a08545368238e1f151768730-20220520
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735188894; Fri, 20 May 2022 11:16:42 +0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 11:16:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 11:16:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 11:16:40 +0800
Message-ID: <a65669e0f66bc61490abcaa733a85cecd40200ce.camel@mediatek.com>
Subject: Re: [PATCH v7,1/4] drm/mediatek: Modify dsi funcs to atomic operations
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Fri, 20 May 2022 11:16:40 +0800
In-Reply-To: <1653012007-11854-2-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-2-git-send-email-xinlei.lee@mediatek.com>
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-05-20 at 10:00 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Because .enable & .disable are deprecated.
> Use .atomic_enable & .atomic_disable instead.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bd3f5b485085..f880136cec09 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -763,14 +763,16 @@ static void mtk_dsi_bridge_mode_set(struct
> drm_bridge *bridge,
>  	drm_display_mode_to_videomode(adjusted, &dsi->vm);
>  }
>  
> -static void mtk_dsi_bridge_disable(struct drm_bridge *bridge)
> +static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state
> *old_bridge_state)
>  {
>  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>  
>  	mtk_output_dsi_disable(dsi);
>  }
>  
> -static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
> +static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state
> *old_bridge_state)
>  {
>  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>  
> @@ -779,8 +781,8 @@ static void mtk_dsi_bridge_enable(struct
> drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
> -	.disable = mtk_dsi_bridge_disable,
> -	.enable = mtk_dsi_bridge_enable,
> +	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> +	.atomic_enable = mtk_dsi_bridge_atomic_enable,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

