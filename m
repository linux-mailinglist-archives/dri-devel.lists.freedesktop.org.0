Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81411828A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC766E83C;
	Tue, 10 Dec 2019 08:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9457B89DA4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 10:15:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C67AD28EDB5
Subject: Re: [resend PATCH v6 12/12] drm/mediatek: Add support for mmsys
 through a pdev
To: matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-13-matthias.bgg@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <96c850e0-9b12-a943-4e99-9aca7ce8ca8b@collabora.com>
Date: Mon, 9 Dec 2019 11:15:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-13-matthias.bgg@kernel.org>
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

Just one nit below and LGTM

On 7/12/19 23:47, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MMSYS subsystem includes clocks and drm components.
> This patch adds an initailization path through a platform device
> for the clock part, so that both drivers get probed from the same
> device tree compatible.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 210455e9f46c..5ada74d8d0c9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -186,6 +186,7 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.ext_path = mt2701_mtk_ddp_ext,
>  	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
>  	.shadow_register = true,
> +	.clk_drv_name = "clk-mt2701-mm",
>  };
>  
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
> @@ -195,6 +196,7 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>  	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
>  	.third_path = mt2712_mtk_ddp_third,
>  	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
> +	.clk_drv_name = "clk-mt2712-mm",
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> @@ -202,6 +204,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
>  	.ext_path = mt8173_mtk_ddp_ext,
>  	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
> +	.clk_drv_name = "clk-mt8173-mm",
>  };
>  
>  static int mtk_drm_kms_init(struct drm_device *drm)
> @@ -499,6 +502,24 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  	INIT_WORK(&private->commit.work, mtk_atomic_work);
>  	private->data = of_device_get_match_data(dev);
>  
> +	/*
> +	 * MMSYS includes apart from components management a block providing
> +	 * clocks for the subsystem. We probe this clock driver via a platform
> +	 * device.
> +	 */
> +	if (private->data->clk_drv_name) {
> +		private->clk_dev = platform_device_register_data(dev,
> +						private->data->clk_drv_name, -1,
> +						NULL, 0);

Replace -1 for PLATFORM_DEVID_NONE

> +
> +		if (IS_ERR(private->clk_dev)) {
> +			dev_err(dev, "failed to register %s platform device\n",
> +				private->data->clk_drv_name);
> +
> +			return PTR_ERR(private->clk_dev);
> +		}
> +	}
> +
>  	private->config_regs = syscon_node_to_regmap(dev->of_node);
>  	if (IS_ERR(private->config_regs))
>  		return PTR_ERR(private->config_regs);
> @@ -605,6 +626,9 @@ static int mtk_drm_remove(struct platform_device *pdev)
>  	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
>  		of_node_put(private->comp_node[i]);
>  
> +	if (private->clk_dev)
> +		platform_device_unregister(private->clk_dev);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 63a121577dcb..8fe9136adc38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -29,11 +29,13 @@ struct mtk_mmsys_driver_data {
>  	unsigned int third_len;
>  
>  	bool shadow_register;
> +	const char *clk_drv_name;
>  };
>  
>  struct mtk_drm_private {
>  	struct drm_device *drm;
>  	struct device *dma_dev;
> +	struct platform_device *clk_dev;
>  
>  	unsigned int num_pipes;
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
