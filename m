Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6D215CFA6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 03:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70B6F8AE;
	Fri, 14 Feb 2020 02:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [216.200.240.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021F6E053
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 02:02:59 +0000 (UTC)
X-UUID: bd4dd24d56574b39878d2be9792b1aaf-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5kuuBKwpTdX0p4HJiRAoqn7HWcPfUW5EtfpYL3ZhCNs=; 
 b=t2l4dAhY+2Fng+4k5/ovqJsy1gYRA9OXtImVPDXaON1Zp4etcAr0r9Hc3MJF869tohF8vm+gODwMd25Ugs0Yx8wW0RWQ4/ob0R9niL7MhYVk34jMBD4vOKE4X7BpJrrI3e3idHell2kQKZQ0OK62kSJTGWZwtzvqdlcheRkHu00=;
X-UUID: bd4dd24d56574b39878d2be9792b1aaf-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1788984706; Thu, 13 Feb 2020 18:02:50 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 17:53:01 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 09:52:11 +0800
Message-ID: <1581645161.22833.6.camel@mtksdaap41>
Subject: Re: [PATCH v7 11/13] clk: mediatek: mt8183: switch mmsys to
 platform device probing
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Fri, 14 Feb 2020 09:52:41 +0800
In-Reply-To: <20200213201953.15268-12-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-12-matthias.bgg@kernel.org>
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
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
 drinkcat@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

On Thu, 2020-02-13 at 21:19 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
> Changes in v7:
> - free clk_data->clks as well
> - get rid of private data structure
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/clk/mediatek/clk-mt8183-mm.c | 30 ++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
> index 720c696b506d..7576cd231be3 100644
> --- a/drivers/clk/mediatek/clk-mt8183-mm.c
> +++ b/drivers/clk/mediatek/clk-mt8183-mm.c
> @@ -3,8 +3,10 @@
>  // Copyright (c) 2018 MediaTek Inc.
>  // Author: Weiyi Lu <weiyi.lu@mediatek.com>
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
> @@ -85,27 +87,35 @@ static const struct mtk_gate mm_clks[] = {
>  static int clk_mt8183_mm_probe(struct platform_device *pdev)
>  {
>  	struct clk_onecell_data *clk_data;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +
> +	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);

I think this is redundant.

> +	if (!clk_data)
> +		return -ENOMEM;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	platform_set_drvdata(pdev, clk_data);
>  
> -	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			clk_data);
> +	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
>  
>  	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  }
>  
> -static const struct of_device_id of_match_clk_mt8183_mm[] = {
> -	{ .compatible = "mediatek,mt8183-mmsys", },
> -	{}
> -};
> +static int clk_mt8183_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	kfree(clk_data->clks);
> +	kfree(clk_data);

These two statement looks like a reverse of mtk_alloc_clk_data() and
exist in many files. It is worth to have a function (maybe
mtk_free_clk_data()) to do this.

In addition, should we undo what is done in clk_mt8183_mm_probe() such
as mtk_clk_register_gates() and of_clk_add_provider()?

Regards,
CK

> +
> +	return 0;
> +}
>  
>  static struct platform_driver clk_mt8183_mm_drv = {
>  	.probe = clk_mt8183_mm_probe,
> +	.remove = clk_mt8183_mm_remove,
>  	.driver = {
>  		.name = "clk-mt8183-mm",
> -		.of_match_table = of_match_clk_mt8183_mm,
>  	},
>  };
> -
> -builtin_platform_driver(clk_mt8183_mm_drv);
> +module_platform_driver(clk_mt8183_mm_drv);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
