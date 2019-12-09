Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06911828D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D58F6E83F;
	Tue, 10 Dec 2019 08:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7BE6E379
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 10:01:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A9E2C28BA5C
Subject: Re: [resend PATCH v6 08/12] clk: mediatek: mt6779: switch mmsys to
 platform device probing
To: matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-9-matthias.bgg@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ef75d3d2-7a2d-5b68-ad0a-ffdf1da4bab9@collabora.com>
Date: Mon, 9 Dec 2019 11:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-9-matthias.bgg@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

On 7/12/19 23:47, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
> 
> Singed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/clk/mediatek/clk-mt6779-mm.c | 41 +++++++++++++++++++---------

And the same comment from previous patch. The comment applies to patches until 11.

>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
> index fb5fbb8e3e41..439ec460c166 100644
> --- a/drivers/clk/mediatek/clk-mt6779-mm.c
> +++ b/drivers/clk/mediatek/clk-mt6779-mm.c
> @@ -4,13 +4,19 @@
>   * Author: Wendell Lin <wendell.lin@mediatek.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
>  #include <dt-bindings/clock/mt6779-clk.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>  
> +struct clk_mt6779_mm_priv {
> +	struct clk_onecell_data *clk_data;
> +};
> +
>  static const struct mtk_gate_regs mm0_cg_regs = {
>  	.set_ofs = 0x0104,
>  	.clr_ofs = 0x0108,
> @@ -84,30 +90,39 @@ static const struct mtk_gate mm_clks[] = {
>  	GATE_MM1(CLK_MM_DISP_OVL_FBDC, "mm_disp_ovl_fbdc", "mm_sel", 16),
>  };
>  
> -static const struct of_device_id of_match_clk_mt6779_mm[] = {
> -	{ .compatible = "mediatek,mt6779-mmsys", },
> -	{}
> -};
> -
>  static int clk_mt6779_mm_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct clk_mt6779_mm_priv *private;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +
> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
>  
> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	platform_set_drvdata(pdev, private);
>  
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			       clk_data);
> +			       private->clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	return of_clk_add_provider(node, of_clk_src_onecell_get,
> +						private->clk_data);
> +}
> +
> +static int clk_mt6779_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_mt6779_mm_priv *private = platform_get_drvdata(pdev);
> +
> +	kfree(private->clk_data);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver clk_mt6779_mm_drv = {
>  	.probe = clk_mt6779_mm_probe,
> +	.remove = clk_mt6779_mm_remove,
>  	.driver = {
>  		.name = "clk-mt6779-mm",
> -		.of_match_table = of_match_clk_mt6779_mm,
>  	},
>  };
> -
> -builtin_platform_driver(clk_mt6779_mm_drv);
> +module_platform_driver(clk_mt6779_mm_drv);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
