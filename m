Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88D5196ED
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 07:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A987112269;
	Wed,  4 May 2022 05:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1648112269
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 05:35:00 +0000 (UTC)
X-UUID: 295dcb6cf1b94b7ea316e9462aec47c8-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:64bbb472-0d8b-47b6-905f-a3ff4e9cec35, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:d1dea22f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 295dcb6cf1b94b7ea316e9462aec47c8-20220504
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1356474658; Wed, 04 May 2022 13:34:56 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 13:34:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 13:34:54 +0800
Message-ID: <fbb00a6eceb2e6136d3095e43c6623ccc5f2ca37.camel@mediatek.com>
Subject: Re: [PATCH v19 09/25] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Wed, 4 May 2022 13:34:54 +0800
In-Reply-To: <20220503102345.22817-10-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-10-nancy.lin@mediatek.com>
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
> Add mmsys for support 64 reset bits. It is a preparation for MT8195
> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> 
> 1. Add the number of reset bits in mmsys private data
> 2. move the whole "reset register code section" behind the
> "get mmsys->data" code section for getting the num_resets in mmsys-
> >data.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 38 ++++++++++++++++++++--------
> ----
>  drivers/soc/mediatek/mtk-mmsys.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index cd92db3d36fa..6600185dd9a4 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,8 @@
>  #include "mt8195-mmsys.h"
>  #include "mt8365-mmsys.h"
>  
> +#define MMSYS_SW_RESET_PER_REG 32
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt2701-mm",
>  	.routes = mmsys_default_routing_table,
> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> mt8173_mmsys_driver_data = {
>  	.routes = mmsys_default_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> mt8183_mmsys_driver_data = {
>  	.routes = mmsys_mt8183_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> mt8186_mmsys_driver_data = {
>  	.routes = mmsys_mt8186_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> @@ -284,13 +289,18 @@ static int mtk_mmsys_reset_update(struct
> reset_controller_dev *rcdev, unsigned l
>  {
>  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> rcdev);
>  	unsigned long flags;
> +	u32 offset;
> +
> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id = id % MMSYS_SW_RESET_PER_REG;
>  
>  	spin_lock_irqsave(&mmsys->lock, flags);
>  
>  	if (assert)
> -		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), 0, NULL);
> +		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset
> + offset, BIT(id), 0, NULL);
>  	else
> -		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), BIT(id), NULL);
> +		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset
> + offset, BIT(id), BIT(id),
> +				    NULL);
>  
>  	spin_unlock_irqrestore(&mmsys->lock, flags);
>  
> @@ -347,18 +357,6 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  
> -	spin_lock_init(&mmsys->lock);
> -
> -	mmsys->rcdev.owner = THIS_MODULE;
> -	mmsys->rcdev.nr_resets = 32;
> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> -	mmsys->rcdev.of_node = pdev->dev.of_node;
> -	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> >rcdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Couldn't register mmsys reset
> controller: %d\n", ret);
> -		return ret;
> -	}
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		dev_err(dev, "Couldn't get mmsys resource\n");
> @@ -380,6 +378,18 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		mmsys->data = match_data->drv_data[0];
>  	}
>  
> +	spin_lock_init(&mmsys->lock);
> +
> +	mmsys->rcdev.owner = THIS_MODULE;
> +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> +	mmsys->rcdev.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> >rcdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't register mmsys reset
> controller: %d\n", ret);
> +		return ret;
> +	}
> +
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
>  	if (ret)
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> b/drivers/soc/mediatek/mtk-mmsys.h
> index f01ba206481d..20a271b80b3b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
>  	const u16 sw0_rst_offset;
> +	const u32 num_resets;
>  };
>  
>  struct mtk_mmsys_match_data {

