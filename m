Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673284A0394
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 23:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A0910E153;
	Fri, 28 Jan 2022 22:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609C810E153
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 22:24:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e2so13513460wra.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 14:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hVe4UGM2j/Oy64Jg/hvtQc5/6XvCQE0MorTi0mtS/Ds=;
 b=W3F350q2iKhIXPRYjvVIic+6s3eEFpaqacV2xPn9u66qn7+2DrE2FPkZpXRIxBmtMZ
 jNtEexEH83nzGAnDGKwUxcTyJZ8jiwNwd/YGwlbjerBlz/MDaesVdPB7SL1bjto9IEjk
 e4gL2p2/vPhNvmflqscW96FWWQHedYKlMNXOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hVe4UGM2j/Oy64Jg/hvtQc5/6XvCQE0MorTi0mtS/Ds=;
 b=KX6sKs6XBqOAOkBInlBKxY4mv+pHCuQvRZrcaJAd7OCQidrM9n1PdCOd9OLV+AuGv2
 XZxMrGsQfAnSdHIwPqm3fvjXEcJyZul9rOG0NwnpMeMywLc1cgf7mMj2pZvlhHMypZuR
 OYoxs+YVjPn8edMoN8e7PFJ5LkuhVgg7iACbMADyfJhAkhoygzSRMKax3sk+MG8b5kyg
 aSSjLH8G65m5inz0Ewd9F8otzI39WgCjliYY/XdKWPP23PEeaIxQOZv+gx9apXzaEnSr
 1qu22YHsILpVJCy9Sy2phIrdtrPAAjcaSWC821NzAlHLhmm6GF60ZPXG/NxAgLZXYeMn
 OdKQ==
X-Gm-Message-State: AOAM533eghry0HvHCf3lctkNPd/7NIDubVqCUMZbaVS1L+GsKaGUBJ/h
 f5H8Hjd4KKjY3HfDJlofp3b0tQ==
X-Google-Smtp-Source: ABdhPJywDTYxCw86x7CvarXOabJUVJ5FlChZcUX4YWLwW4hPs/xvTPNEnJnHVPNPMUYivkaA5MjK/A==
X-Received: by 2002:adf:fcd0:: with SMTP id f16mr8638555wrs.359.1643408667704; 
 Fri, 28 Jan 2022 14:24:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m64sm2913505wmm.31.2022.01.28.14.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 14:24:27 -0800 (PST)
Date: Fri, 28 Jan 2022 23:24:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
Message-ID: <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
Mail-Followup-To: Yong Wu <yong.wu@mediatek.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 James Wang <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, iommu@lists.linux-foundation.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
 Rob Clark <robdclark@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>
References: <20220128081101.27837-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128081101.27837-1-yong.wu@mediatek.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, James Wang <james.qian.wang@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 04:11:01PM +0800, Yong Wu wrote:
> The component requires the compare/release functions, there are so many
> copy in current kernel. Just define three common helpers for them.
> No functional change.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Base on v5.17-rc1
> ---
>  .../gpu/drm/arm/display/komeda/komeda_drv.c    |  5 -----
>  drivers/gpu/drm/arm/hdlcd_drv.c                |  7 +------
>  drivers/gpu/drm/armada/armada_drv.c            |  5 -----
>  drivers/gpu/drm/drm_of.c                       |  8 +-------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  7 -------
>  drivers/gpu/drm/exynos/exynos_drm_drv.c        |  5 -----
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  5 -----
>  drivers/gpu/drm/imx/imx-drm-core.c             |  4 ++--
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c      |  5 -----
>  drivers/gpu/drm/mcde/mcde_drv.c                |  7 +------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  5 -----
>  drivers/gpu/drm/meson/meson_drv.c              |  8 --------
>  drivers/gpu/drm/msm/msm_drv.c                  |  9 ---------
>  drivers/gpu/drm/omapdrm/dss/dss.c              |  8 +-------
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |  5 -----
>  drivers/gpu/drm/sti/sti_drv.c                  |  5 -----
>  drivers/gpu/drm/sun4i/sun4i_drv.c              |  9 ---------
>  drivers/gpu/drm/vc4/vc4_drv.c                  |  5 -----
>  drivers/iommu/mtk_iommu.h                      | 10 ----------
>  drivers/power/supply/ab8500_charger.c          |  8 +-------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  8 +-------
>  include/linux/component.h                      | 18 ++++++++++++++++++
>  sound/soc/codecs/wcd938x.c                     | 16 ++--------------

Seems like a neat idea. Please add kerneldoc for the new functions you're
adding (bonus point for an example in there) and make sure it all renders
correctly in

$ make htmldoc

Also please split up the patch series per-driver and add the maintainers
to each patches' Cc: list. With that I think this should be ready for
merging.

Cheers, Daniel

>  23 files changed, 28 insertions(+), 144 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index e7933930a657..fe5b97107417 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -92,11 +92,6 @@ static const struct component_master_ops komeda_master_ops = {
>  	.unbind	= komeda_unbind,
>  };
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static void komeda_add_slave(struct device *master,
>  			     struct component_match **match,
>  			     struct device_node *np,
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 479c2422a2e0..36d84c439df8 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -372,11 +372,6 @@ static const struct component_master_ops hdlcd_master_ops = {
>  	.unbind		= hdlcd_drm_unbind,
>  };
>  
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int hdlcd_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -387,7 +382,7 @@ static int hdlcd_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
>  
> -	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> +	drm_of_component_match_add(&pdev->dev, &match, compare_of, port);
>  	of_node_put(port);
>  
>  	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 8e3e98f13db4..9edc4912c1a0 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -177,11 +177,6 @@ static void armada_drm_unbind(struct device *dev)
>  	drm_mm_takedown(&priv->linear);
>  }
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int compare_dev_name(struct device *dev, void *data)
>  {
>  	const char *name = data;
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 59d368ea006b..f958f48f8ba4 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -18,11 +18,6 @@
>   * properties.
>   */
>  
> -static void drm_release_of(struct device *dev, void *data)
> -{
> -	of_node_put(data);
> -}
> -
>  /**
>   * drm_of_crtc_port_mask - find the mask of a registered CRTC by port OF node
>   * @dev: DRM device
> @@ -94,8 +89,7 @@ void drm_of_component_match_add(struct device *master,
>  				struct device_node *node)
>  {
>  	of_node_get(node);
> -	component_match_add_release(master, matchptr, drm_release_of,
> -				    compare, node);
> +	component_match_add_release(master, matchptr, release_of, compare, node);
>  }
>  EXPORT_SYMBOL_GPL(drm_of_component_match_add);
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 0b756ecb1bc2..15351e26ab00 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -574,13 +574,6 @@ static const struct component_master_ops etnaviv_master_ops = {
>  	.unbind = etnaviv_unbind,
>  };
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	struct device_node *np = data;
> -
> -	return dev->of_node == np;
> -}
> -
>  static int compare_str(struct device *dev, void *data)
>  {
>  	return !strcmp(dev_name(dev), data);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 9743b6b17447..97f6bc69bee3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -212,11 +212,6 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
>  	}
>  };
>  
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev == (struct device *)data;
> -}
> -
>  static struct component_match *exynos_drm_match_add(struct device *dev)
>  {
>  	struct component_match *match = NULL;
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 98ae9a48f3fe..8cc6e13e46af 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -203,11 +203,6 @@ static int kirin_drm_kms_init(struct drm_device *dev,
>  	return ret;
>  }
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int kirin_drm_kms_cleanup(struct drm_device *dev)
>  {
>  	drm_kms_helper_poll_fini(dev);
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index cb685fe2039b..11b5c0fae045 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -176,7 +176,7 @@ static const struct drm_driver imx_drm_driver = {
>  	.patchlevel		= 0,
>  };
>  
> -static int compare_of(struct device *dev, void *data)
> +static int imx_compare_of(struct device *dev, void *data)
>  {
>  	struct device_node *np = data;
>  
> @@ -286,7 +286,7 @@ static const struct component_master_ops imx_drm_ops = {
>  
>  static int imx_drm_platform_probe(struct platform_device *pdev)
>  {
> -	int ret = drm_of_component_probe(&pdev->dev, compare_of, &imx_drm_ops);
> +	int ret = drm_of_component_probe(&pdev->dev, imx_compare_of, &imx_drm_ops);
>  
>  	if (!ret)
>  		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index b4943a56be09..194abab14ffe 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1322,11 +1322,6 @@ static int ingenic_drm_bind_with_components(struct device *dev)
>  	return ingenic_drm_bind(dev, true);
>  }
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static void ingenic_drm_unbind(struct device *dev)
>  {
>  	struct ingenic_drm *priv = dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index 5b5afc6aaf8e..015690b6d308 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -265,11 +265,6 @@ static struct platform_driver *const mcde_component_drivers[] = {
>  	&mcde_dsi_driver,
>  };
>  
> -static int mcde_compare_dev(struct device *dev, void *data)
> -{
> -	return dev == data;
> -}
> -
>  static int mcde_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -399,7 +394,7 @@ static int mcde_probe(struct platform_device *pdev)
>  
>  		while ((d = platform_find_device_by_driver(p, drv))) {
>  			put_device(p);
> -			component_match_add(dev, &match, mcde_compare_dev, d);
> +			component_match_add(dev, &match, compare_dev, d);
>  			p = d;
>  		}
>  		put_device(p);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 56ff8c57ef8f..72586983ec1d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -369,11 +369,6 @@ static const struct drm_driver mtk_drm_driver = {
>  	.minor = DRIVER_MINOR,
>  };
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int mtk_drm_bind(struct device *dev)
>  {
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 80f1d439841a..b68631d16eb3 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -423,14 +423,6 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
>  	return drm_mode_config_helper_resume(priv->drm);
>  }
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	DRM_DEBUG_DRIVER("Comparing of node %pOF with %pOF\n",
> -			 dev->of_node, data);
> -
> -	return dev->of_node == data;
> -}
> -
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ad35a5d94053..6250327b1eda 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1173,15 +1173,6 @@ static const struct dev_pm_ops msm_pm_ops = {
>   * Componentized driver support:
>   */
>  
> -/*
> - * NOTE: duplication of the same code as exynos or imx (or probably any other).
> - * so probably some room for some helpers
> - */
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /*
>   * Identify what components need to be added by parsing what remote-endpoints
>   * our MDP output ports are connected to. In the case of LVDS on MDP4, there
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 69b3e15b9356..5216000c7657 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1344,12 +1344,6 @@ static const struct component_master_ops dss_component_ops = {
>  	.unbind = dss_unbind,
>  };
>  
> -static int dss_component_compare(struct device *dev, void *data)
> -{
> -	struct device *child = data;
> -	return dev == child;
> -}
> -
>  struct dss_component_match_data {
>  	struct device *dev;
>  	struct component_match **match;
> @@ -1379,7 +1373,7 @@ static int dss_add_child_component(struct device *dev, void *data)
>  		return device_for_each_child(dev, cmatch,
>  					     dss_add_child_component);
>  
> -	component_match_add(cmatch->dev, match, dss_component_compare, dev);
> +	component_match_add(cmatch->dev, match, compare_dev, dev);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index bec207de4544..276e41168bd0 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -290,11 +290,6 @@ int rockchip_drm_endpoint_is_subdriver(struct device_node *ep)
>  	return false;
>  }
>  
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev == (struct device *)data;
> -}
> -
>  static void rockchip_drm_match_remove(struct device *dev)
>  {
>  	struct device_link *link;
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index c7efb43b83ee..3c3294c2100d 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -144,11 +144,6 @@ static const struct drm_driver sti_driver = {
>  	.minor = DRIVER_MINOR,
>  };
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int sti_init(struct drm_device *ddev)
>  {
>  	struct sti_private *private;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index b630614b3d72..de26c1448486 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -201,15 +201,6 @@ static bool sun4i_drv_node_is_tcon_top(struct device_node *node)
>  		!!of_match_node(sun8i_tcon_top_of_table, node);
>  }
>  
> -static int compare_of(struct device *dev, void *data)
> -{
> -	DRM_DEBUG_DRIVER("Comparing of node %pOF with %pOF\n",
> -			 dev->of_node,
> -			 data);
> -
> -	return dev->of_node == data;
> -}
> -
>  /*
>   * The encoder drivers use drm_of_find_possible_crtcs to get upstream
>   * crtcs from the device tree using of_graph. For the results to be
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 16abc3a3d601..43474107a4f2 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -187,11 +187,6 @@ static struct drm_driver vc4_drm_driver = {
>  	.patchlevel = DRIVER_PATCHLEVEL,
>  };
>  
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev == data;
> -}
> -
>  static void vc4_match_add_drivers(struct device *dev,
>  				  struct component_match **match,
>  				  struct platform_driver *const *drivers,
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index f81fa8862ed0..b742432220c5 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -84,16 +84,6 @@ struct mtk_iommu_data {
>  	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
>  };
>  
> -static inline int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
> -static inline void release_of(struct device *dev, void *data)
> -{
> -	of_node_put(data);
> -}
> -
>  static inline int mtk_iommu_bind(struct device *dev)
>  {
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
> diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply/ab8500_charger.c
> index ce074c018dcb..248dfd8aec19 100644
> --- a/drivers/power/supply/ab8500_charger.c
> +++ b/drivers/power/supply/ab8500_charger.c
> @@ -3414,11 +3414,6 @@ static struct platform_driver *const ab8500_charger_component_drivers[] = {
>  	&ab8500_chargalg_driver,
>  };
>  
> -static int ab8500_charger_compare_dev(struct device *dev, void *data)
> -{
> -	return dev == data;
> -}
> -
>  static int ab8500_charger_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -3657,8 +3652,7 @@ static int ab8500_charger_probe(struct platform_device *pdev)
>  
>  		while ((d = platform_find_device_by_driver(p, drv))) {
>  			put_device(p);
> -			component_match_add(dev, &match,
> -					    ab8500_charger_compare_dev, d);
> +			component_match_add(dev, &match, compare_dev, d);
>  			p = d;
>  		}
>  		put_device(p);
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> index a6b1c1598040..328aa5d86f1a 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -1193,12 +1193,6 @@ static const struct component_master_ops dss_component_ops = {
>  	.unbind = dss_unbind,
>  };
>  
> -static int dss_component_compare(struct device *dev, void *data)
> -{
> -	struct device *child = data;
> -	return dev == child;
> -}
> -
>  static int dss_add_child_component(struct device *dev, void *data)
>  {
>  	struct component_match **match = data;
> @@ -1212,7 +1206,7 @@ static int dss_add_child_component(struct device *dev, void *data)
>  	if (strstr(dev_name(dev), "rfbi"))
>  		return 0;
>  
> -	component_match_add(dev->parent, match, dss_component_compare, dev);
> +	component_match_add(dev->parent, match, compare_dev, dev);
>  
>  	return 0;
>  }
> diff --git a/include/linux/component.h b/include/linux/component.h
> index 16de18f473d7..5a7468ea827c 100644
> --- a/include/linux/component.h
> +++ b/include/linux/component.h
> @@ -2,6 +2,8 @@
>  #ifndef COMPONENT_H
>  #define COMPONENT_H
>  
> +#include <linux/device.h>
> +#include <linux/of.h>
>  #include <linux/stddef.h>
>  
>  
> @@ -82,6 +84,22 @@ struct component_master_ops {
>  	void (*unbind)(struct device *master);
>  };
>  
> +/* A set common helpers for compare/release functions */
> +static inline int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +static inline void release_of(struct device *dev, void *data)
> +{
> +	of_node_put(data);
> +}
> +
> +static inline int compare_dev(struct device *dev, void *data)
> +{
> +	return dev == data;
> +}
> +
>  void component_master_del(struct device *,
>  	const struct component_master_ops *);
>  
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index eff200a07d9f..992132cbfb9f 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -4417,16 +4417,6 @@ static const struct component_master_ops wcd938x_comp_ops = {
>  	.unbind = wcd938x_unbind,
>  };
>  
> -static int wcd938x_compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
> -static void wcd938x_release_of(struct device *dev, void *data)
> -{
> -	of_node_put(data);
> -}
> -
>  static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>  					struct device *dev,
>  					struct component_match **matchptr)
> @@ -4442,8 +4432,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>  	}
>  
>  	of_node_get(wcd938x->rxnode);
> -	component_match_add_release(dev, matchptr, wcd938x_release_of,
> -				    wcd938x_compare_of,	wcd938x->rxnode);
> +	component_match_add_release(dev, matchptr, release_of, compare_of, wcd938x->rxnode);
>  
>  	wcd938x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
>  	if (!wcd938x->txnode) {
> @@ -4451,8 +4440,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>  		return -ENODEV;
>  	}
>  	of_node_get(wcd938x->txnode);
> -	component_match_add_release(dev, matchptr, wcd938x_release_of,
> -				    wcd938x_compare_of,	wcd938x->txnode);
> +	component_match_add_release(dev, matchptr, release_of, compare_of, wcd938x->txnode);
>  	return 0;
>  }
>  
> -- 
> 2.18.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
