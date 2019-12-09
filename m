Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B9118263
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10FA89C14;
	Tue, 10 Dec 2019 08:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8A6E33F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 09:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 52C6028DB10
Subject: Re: [resend PATCH v6 04/12] drm: mediatek: Omit warning on probe
 defers
To: matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-5-matthias.bgg@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <48f9ec0c-1f1e-5a6c-283b-7efc4ce1bd5e@collabora.com>
Date: Mon, 9 Dec 2019 10:39:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-5-matthias.bgg@kernel.org>
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
> It can happen that the mmsys clock drivers aren't probed before the
> platform driver gets invoked. The platform driver used to print a warning
> that the driver failed to get the clocks. Omit this error on
> the defered probe path.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_color.c |  5 ++++-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c   |  5 ++++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |  5 ++++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c        | 12 +++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c    |  4 +++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c        |  8 ++++++--
>  drivers/gpu/drm/mediatek/mtk_hdmi.c       |  4 +++-
>  7 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> index 59de2a46aa49..8f0fc96ef7bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -118,7 +118,10 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
>  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
>  				&mtk_disp_color_funcs);
>  	if (ret) {
> -		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to initialize component: %d\n",
> +				ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 21851756c579..7487b0182c05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -285,7 +285,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
>  				&mtk_disp_ovl_funcs);
>  	if (ret) {
> -		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to initialize component: %d\n",
> +				ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 405afef31407..835ea8f8dab9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -287,7 +287,10 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
>  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
>  				&mtk_disp_rdma_funcs);
>  	if (ret) {
> -		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to initialize component: %d\n",
> +				ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index be6d95c5ff25..9ed32470ad02 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -700,21 +700,27 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  	dpi->engine_clk = devm_clk_get(dev, "engine");
>  	if (IS_ERR(dpi->engine_clk)) {
>  		ret = PTR_ERR(dpi->engine_clk);
> -		dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get engine clock: %d\n", ret);

This is only to print an error and I think that devm_clk_get will print a
warning if the clk is not found. I guess that you can just remove the dev_err
print logic, here and below.

In case there is an optional clock you could use devm_clk_get_optional, not sure
if there is any, though.

> +
>  		return ret;
>  	}
>  
>  	dpi->pixel_clk = devm_clk_get(dev, "pixel");
>  	if (IS_ERR(dpi->pixel_clk)) {
>  		ret = PTR_ERR(dpi->pixel_clk);
> -		dev_err(dev, "Failed to get pixel clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get pixel clock: %d\n", ret);
> +

ditto

>  		return ret;
>  	}
>  
>  	dpi->tvd_clk = devm_clk_get(dev, "pll");
>  	if (IS_ERR(dpi->tvd_clk)) {
>  		ret = PTR_ERR(dpi->tvd_clk);
> -		dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
> +

ditto

>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index b765181223e6..6054e2b675f9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -558,7 +558,9 @@ static int mtk_ddp_probe(struct platform_device *pdev)
>  
>  	ddp->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(ddp->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> +		if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get clock\n");
> +

ditto

>  		return PTR_ERR(ddp->clk);
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4332563df952..66d5b0fdd678 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1110,14 +1110,18 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  	dsi->engine_clk = devm_clk_get(dev, "engine");
>  	if (IS_ERR(dsi->engine_clk)) {
>  		ret = PTR_ERR(dsi->engine_clk);
> -		dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +

ditto

>  		return ret;
>  	}
>  
>  	dsi->digital_clk = devm_clk_get(dev, "digital");
>  	if (IS_ERR(dsi->digital_clk)) {
>  		ret = PTR_ERR(dsi->digital_clk);
> -		dev_err(dev, "Failed to get digital clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get digital clock: %d\n", ret);
> +

ditto

>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index ce91b61364eb..62f9ca2308ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1447,7 +1447,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>  
>  	ret = mtk_hdmi_get_all_clk(hdmi, np);
>  	if (ret) {
> -		dev_err(dev, "Failed to get clocks: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get clocks: %d\n", ret);
> +
>  		return ret;
>  	}
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
