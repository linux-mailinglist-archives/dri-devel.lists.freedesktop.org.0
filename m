Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BD519711
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 07:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6A6112369;
	Wed,  4 May 2022 05:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A49F112369
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 05:55:52 +0000 (UTC)
X-UUID: ac8a019427be43758589a8fdfc4b49c0-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a2548c34-8eff-4f91-b937-f56411ebecfd, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:f98fa32f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ac8a019427be43758589a8fdfc4b49c0-20220504
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1933252297; Wed, 04 May 2022 13:55:46 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 13:55:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 13:55:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 13:55:45 +0800
Message-ID: <865a3f263b4c73a77b256311c2759b9eb9b4b123.camel@mediatek.com>
Subject: Re: [PATCH v19 12/25] soc: mediatek: add mtk-mutex support for
 mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Wed, 4 May 2022 13:55:45 +0800
In-Reply-To: <20220503102345.22817-13-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-13-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> Add mtk-mutex support for mt8195 vdosys1.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements
> which include MDP_RDMA0~7, MERGE0~3, and ETHDR.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 33
> ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 4721f0b74d9b..78197ebf5595 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -110,6 +110,24 @@
>  #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
>  #define MT8195_MUTEX_MOD_DISP_PWM0		27
>  
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	0
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	1
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	2
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	3
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	4
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	5
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	6
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	7
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	8
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	9
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	10
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	11
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	12
> +#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	18
> +#define MT8195_MUTEX_MOD_DISP1_DPI0		25
> +#define MT8195_MUTEX_MOD_DISP1_DPI1		26
> +#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		27
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -313,6 +331,21 @@ static const unsigned int
> mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
>  	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
>  	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
> +	[DDP_COMPONENT_MDP_RDMA0] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0,
> +	[DDP_COMPONENT_MDP_RDMA1] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA1,
> +	[DDP_COMPONENT_MDP_RDMA2] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA2,
> +	[DDP_COMPONENT_MDP_RDMA3] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA3,
> +	[DDP_COMPONENT_MDP_RDMA4] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA4,
> +	[DDP_COMPONENT_MDP_RDMA5] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA5,
> +	[DDP_COMPONENT_MDP_RDMA6] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA6,
> +	[DDP_COMPONENT_MDP_RDMA7] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA7,
> +	[DDP_COMPONENT_MERGE1] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE0,
> +	[DDP_COMPONENT_MERGE2] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE1,
> +	[DDP_COMPONENT_MERGE3] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE2,
> +	[DDP_COMPONENT_MERGE4] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE3,
> +	[DDP_COMPONENT_ETHDR_MIXER] =
> MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
> +	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
> +	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
>  };
>  
>  static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {

