Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C914FD2AF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6093C10E497;
	Tue, 12 Apr 2022 07:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8E10EB5F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:37:55 +0000 (UTC)
X-UUID: a112a8e74bcc4e8cafd2fe0dbea82415-20220412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0009f623-99a6-4f2d-b87c-b7bf1ad04e0d, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:14,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:59
X-CID-INFO: VERSION:1.1.4, REQID:0009f623-99a6-4f2d-b87c-b7bf1ad04e0d, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:14,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:59
X-CID-META: VersionHash:faefae9, CLOUDID:d549dea8-d103-4e36-82b9-b0e86991b3df,
 C
 OID:6db2902810e7,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:3,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: a112a8e74bcc4e8cafd2fe0dbea82415-20220412
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 204760330; Tue, 12 Apr 2022 15:37:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Apr 2022 15:37:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 15:37:48 +0800
Message-ID: <db475c5f8ff801ca0e48d89f5257de491f173b0b.camel@mediatek.com>
Subject: Re: [PATCH v4,1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Tue, 12 Apr 2022 15:37:48 +0800
In-Reply-To: <1649644308-8455-2-git-send-email-xinlei.lee@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-2-git-send-email-xinlei.lee@mediatek.com>
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

On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> Old sequence:
> 1. Pull the MIPI signal high
> 2. Delay & Dsi_reset
> 3. Set the dsi timing register
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> The sequence after patching is:
> 1. Set the dsi timing register
> 2. Pull the MIPI signal high
> 3. Delay & Dsi_reset
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ccb0511b9cd5..262c027d8c2f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -649,14 +649,14 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	mtk_dsi_reset_engine(dsi);
>  	mtk_dsi_phy_timconfig(dsi);
>  
> -	mtk_dsi_rxtx_control(dsi);
> -	usleep_range(30, 100);
> -	mtk_dsi_reset_dphy(dsi);
>  	mtk_dsi_ps_control_vact(dsi);
>  	mtk_dsi_set_vm_cmd(dsi);
>  	mtk_dsi_config_vdo_timing(dsi);
>  	mtk_dsi_set_interrupt_enable(dsi);
>  
> +	mtk_dsi_rxtx_control(dsi);
> +	usleep_range(30, 100);
> +	mtk_dsi_reset_dphy(dsi);
>  	mtk_dsi_clk_ulp_mode_leave(dsi);
>  	mtk_dsi_lane0_ulp_mode_leave(dsi);
>  	mtk_dsi_clk_hs_mode(dsi, 0);

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

