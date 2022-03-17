Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958334DC496
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 12:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5053710E7C5;
	Thu, 17 Mar 2022 11:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E8110EB07
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 11:13:22 +0000 (UTC)
X-UUID: f6e97c494bc549c797e4bd02ce5cb0c3-20220317
X-UUID: f6e97c494bc549c797e4bd02ce5cb0c3-20220317
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1718858203; Thu, 17 Mar 2022 19:13:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 19:13:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 19:13:15 +0800
Message-ID: <235c5bca8da7118bad6bb5cb3c8cba6e022e4411.camel@mediatek.com>
Subject: Re: [PATCH v3,1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Thu, 17 Mar 2022 19:13:15 +0800
In-Reply-To: <1647503611-13144-2-git-send-email-xinlei.lee@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-2-git-send-email-xinlei.lee@mediatek.com>
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

Hello Xinlei,

Thanks for your patch, and there are something I want to know:

On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> Old sequence:
> 1. Pull the MIPI signal high
> 2. Delay & Dsi_reset
> 3. Set the dsi timing register
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> New sequence:
> 1. Set the dsi timing register
> 2. Pull the MIPI signal high
> 3. Delay & Dsi_reset
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 

Could you explain why you want to change original power on sequence?
From this commit message, I don't know why you want to do this.
If the reason is in cover letter, I think you should move them here.

> In the new sequence 2 & 3 & 4 will be moved to dsi_enbale in later
> patch.

I think this is no need to describe here.

BRs,
Rex
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

