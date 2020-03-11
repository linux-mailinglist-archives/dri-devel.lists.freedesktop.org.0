Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD71812F9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 09:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED9B6E92D;
	Wed, 11 Mar 2020 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C4A6E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 00:50:31 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 70780AEF95;
 Wed, 11 Mar 2020 08:50:28 +0800 (CST)
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.218] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P14890T140219091904256S1583887826225228_; 
 Wed, 11 Mar 2020 08:50:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d9bd4a5379d2fb92977a3930dacc3a0a>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Split bind() into probe() and
 real bind()
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <CGME20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f@eucas1p1.samsung.com>
 <20200310103427.26048-1-m.szyprowski@samsung.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <d9b9580b-7a9d-a3b0-5753-dffcad473a48@rock-chips.com>
Date: Wed, 11 Mar 2020 08:50:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310103427.26048-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:32:41 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Jingoo Han <jingoohan1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/20 6:34 PM, Marek Szyprowski wrote:
> Analogix_dp driver acquires all its resources in the ->bind() callback,
> what is a bit against the component driver based approach, where the
> driver initialization is split into a probe(), where all resources are
> gathered, and a bind(), where all objects are created and a compound
> driver is initialized.
>
> Extract all the resource related operations to analogix_dp_probe() and
> analogix_dp_remove(), then call them before/after registration of the
> device components from the main Exynos DP and Rockchip DP drivers. Also
> move the plat_data initialization to the probe() to make it available for
> the analogix_dp_probe() function.
>
> This fixes the multiple calls to the bind() of the DRM compound driver
> when the DP PHY driver is not yet loaded/probed:
>
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops [exynosdrm])
> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops [exynosdrm])
> exynos-dp 145b0000.dp-controller: no DP phy configured
> exynos-drm exynos-drm: failed to bind 145b0000.dp-controller (ops exynos_dp_ops [exynosdrm]): -517
> exynos-drm exynos-drm: master bind failed: -517
> ...
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 14450000.mixer (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 145b0000.dp-controller (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_enable [exynosdrm])
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> Console: switching to colour frame buffer device 170x48
> exynos-drm exynos-drm: fb0: exynosdrmfb frame buffer device
> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
> ...
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Acked-by: Andy Yan <andy.yan@rock-chips.com>

> ---
> v2:
> - moved plat_data initialization to exynos_dp_probe/rockchip_dp_probe as
>    pointed by Andy Yan
> ---
>   .../drm/bridge/analogix/analogix_dp_core.c    | 33 +++++++++++------
>   drivers/gpu/drm/exynos/exynos_dp.c            | 29 ++++++++-------
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 36 ++++++++++---------
>   include/drm/bridge/analogix_dp.h              |  5 +--
>   4 files changed, 61 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9ded2cef57dd..76736fb8ed94 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1652,8 +1652,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>   }
>   
>   struct analogix_dp_device *
> -analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
> -		 struct analogix_dp_plat_data *plat_data)
> +analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct analogix_dp_device *dp;
> @@ -1756,22 +1755,30 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>   					irq_flags, "analogix-dp", dp);
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to request irq\n");
> -		goto err_disable_pm_runtime;
> +		return ERR_PTR(ret);
>   	}
>   	disable_irq(dp->irq);
>   
> +	return dp;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_probe);
> +
> +int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> +{
> +	int ret;
> +
>   	dp->drm_dev = drm_dev;
>   	dp->encoder = dp->plat_data->encoder;
>   
>   	dp->aux.name = "DP-AUX";
>   	dp->aux.transfer = analogix_dpaux_transfer;
> -	dp->aux.dev = &pdev->dev;
> +	dp->aux.dev = dp->dev;
>   
>   	ret = drm_dp_aux_register(&dp->aux);
>   	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
>   
> -	pm_runtime_enable(dev);
> +	pm_runtime_enable(dp->dev);
>   
>   	ret = analogix_dp_create_bridge(drm_dev, dp);
>   	if (ret) {
> @@ -1779,13 +1786,12 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>   		goto err_disable_pm_runtime;
>   	}
>   
> -	return dp;
> +	return 0;
>   
>   err_disable_pm_runtime:
> +	pm_runtime_disable(dp->dev);
>   
> -	pm_runtime_disable(dev);
> -
> -	return ERR_PTR(ret);
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(analogix_dp_bind);
>   
> @@ -1802,10 +1808,15 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>   
>   	drm_dp_aux_unregister(&dp->aux);
>   	pm_runtime_disable(dp->dev);
> -	clk_disable_unprepare(dp->clock);
>   }
>   EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>   
> +void analogix_dp_remove(struct analogix_dp_device *dp)
> +{
> +	clk_disable_unprepare(dp->clock);
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_remove);
> +
>   #ifdef CONFIG_PM
>   int analogix_dp_suspend(struct analogix_dp_device *dp)
>   {
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index d23d3502ca91..5ee090691390 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -159,15 +159,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>   	struct drm_device *drm_dev = data;
>   	int ret;
>   
> -	dp->dev = dev;
>   	dp->drm_dev = drm_dev;
>   
> -	dp->plat_data.dev_type = EXYNOS_DP;
> -	dp->plat_data.power_on_start = exynos_dp_poweron;
> -	dp->plat_data.power_off = exynos_dp_poweroff;
> -	dp->plat_data.attach = exynos_dp_bridge_attach;
> -	dp->plat_data.get_modes = exynos_dp_get_modes;
> -
>   	if (!dp->plat_data.panel && !dp->ptn_bridge) {
>   		ret = exynos_dp_dt_parse_panel(dp);
>   		if (ret)
> @@ -185,13 +178,11 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>   
>   	dp->plat_data.encoder = encoder;
>   
> -	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
> -	if (IS_ERR(dp->adp)) {
> +	ret = analogix_dp_bind(dp->adp, dp->drm_dev);
> +	if (ret)
>   		dp->encoder.funcs->destroy(&dp->encoder);
> -		return PTR_ERR(dp->adp);
> -	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void exynos_dp_unbind(struct device *dev, struct device *master,
> @@ -222,6 +213,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
>   	if (!dp)
>   		return -ENOMEM;
>   
> +	dp->dev = dev;
>   	/*
>   	 * We just use the drvdata until driver run into component
>   	 * add function, and then we would set drvdata to null, so
> @@ -247,16 +239,29 @@ static int exynos_dp_probe(struct platform_device *pdev)
>   
>   	/* The remote port can be either a panel or a bridge */
>   	dp->plat_data.panel = panel;
> +	dp->plat_data.dev_type = EXYNOS_DP;
> +	dp->plat_data.power_on_start = exynos_dp_poweron;
> +	dp->plat_data.power_off = exynos_dp_poweroff;
> +	dp->plat_data.attach = exynos_dp_bridge_attach;
> +	dp->plat_data.get_modes = exynos_dp_get_modes;
>   	dp->plat_data.skip_connector = !!bridge;
> +
>   	dp->ptn_bridge = bridge;
>   
>   out:
> +	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
> +	if (IS_ERR(dp->adp))
> +		return PTR_ERR(dp->adp);
> +
>   	return component_add(&pdev->dev, &exynos_dp_ops);
>   }
>   
>   static int exynos_dp_remove(struct platform_device *pdev)
>   {
> +	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
> +
>   	component_del(&pdev->dev, &exynos_dp_ops);
> +	analogix_dp_remove(dp->adp);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index f38f5e113c6b..ce98c08aa8b4 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -325,15 +325,9 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>   			    void *data)
>   {
>   	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
> -	const struct rockchip_dp_chip_data *dp_data;
>   	struct drm_device *drm_dev = data;
>   	int ret;
>   
> -	dp_data = of_device_get_match_data(dev);
> -	if (!dp_data)
> -		return -ENODEV;
> -
> -	dp->data = dp_data;
>   	dp->drm_dev = drm_dev;
>   
>   	ret = rockchip_dp_drm_create_encoder(dp);
> @@ -344,16 +338,9 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>   
>   	dp->plat_data.encoder = &dp->encoder;
>   
> -	dp->plat_data.dev_type = dp->data->chip_type;
> -	dp->plat_data.power_on_start = rockchip_dp_poweron_start;
> -	dp->plat_data.power_off = rockchip_dp_powerdown;
> -	dp->plat_data.get_modes = rockchip_dp_get_modes;
> -
> -	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
> -	if (IS_ERR(dp->adp)) {
> -		ret = PTR_ERR(dp->adp);
> +	ret = analogix_dp_bind(dp->adp, drm_dev);
> +	if (ret)
>   		goto err_cleanup_encoder;
> -	}
>   
>   	return 0;
>   err_cleanup_encoder:
> @@ -368,8 +355,6 @@ static void rockchip_dp_unbind(struct device *dev, struct device *master,
>   
>   	analogix_dp_unbind(dp->adp);
>   	dp->encoder.funcs->destroy(&dp->encoder);
> -
> -	dp->adp = ERR_PTR(-ENODEV);
>   }
>   
>   static const struct component_ops rockchip_dp_component_ops = {
> @@ -380,10 +365,15 @@ static const struct component_ops rockchip_dp_component_ops = {
>   static int rockchip_dp_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	const struct rockchip_dp_chip_data *dp_data;
>   	struct drm_panel *panel = NULL;
>   	struct rockchip_dp_device *dp;
>   	int ret;
>   
> +	dp_data = of_device_get_match_data(dev);
> +	if (!dp_data)
> +		return -ENODEV;
> +
>   	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>   	if (ret < 0)
>   		return ret;
> @@ -394,7 +384,12 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>   
>   	dp->dev = dev;
>   	dp->adp = ERR_PTR(-ENODEV);
> +	dp->data = dp_data;
>   	dp->plat_data.panel = panel;
> +	dp->plat_data.dev_type = dp->data->chip_type;
> +	dp->plat_data.power_on_start = rockchip_dp_poweron_start;
> +	dp->plat_data.power_off = rockchip_dp_powerdown;
> +	dp->plat_data.get_modes = rockchip_dp_get_modes;
>   
>   	ret = rockchip_dp_of_probe(dp);
>   	if (ret < 0)
> @@ -402,12 +397,19 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, dp);
>   
> +	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
> +	if (IS_ERR(dp->adp))
> +		return PTR_ERR(dp->adp);
> +
>   	return component_add(dev, &rockchip_dp_component_ops);
>   }
>   
>   static int rockchip_dp_remove(struct platform_device *pdev)
>   {
> +	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
> +
>   	component_del(&pdev->dev, &rockchip_dp_component_ops);
> +	analogix_dp_remove(dp->adp);
>   
>   	return 0;
>   }
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 7aa2f93da49c..b0dcc07334a1 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -42,9 +42,10 @@ int analogix_dp_resume(struct analogix_dp_device *dp);
>   int analogix_dp_suspend(struct analogix_dp_device *dp);
>   
>   struct analogix_dp_device *
> -analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
> -		 struct analogix_dp_plat_data *plat_data);
> +analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
> +int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
>   void analogix_dp_unbind(struct analogix_dp_device *dp);
> +void analogix_dp_remove(struct analogix_dp_device *dp);
>   
>   int analogix_dp_start_crc(struct drm_connector *connector);
>   int analogix_dp_stop_crc(struct drm_connector *connector);


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
