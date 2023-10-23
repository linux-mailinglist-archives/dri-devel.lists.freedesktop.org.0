Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37717D2D0E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A095210E18E;
	Mon, 23 Oct 2023 08:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1511 seconds by postgrey-1.36 at gabe;
 Mon, 23 Oct 2023 08:44:51 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C5B10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 08:44:51 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39N81xYs016757; Mon, 23 Oct 2023 10:19:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=siHF/uCtPQkVMEwTMfpU+6+WpBxC4YUFN9WRzW275G0=; b=3b
 wDQ8rq7OApxq2/pW/zumNb4wjwj0O1xGH7BLTP5+kTYkqTFSdYDlFXUSI8Emrdro
 2WTiPC0GY/NL0+PTwWDnKPWrvxnsUGhALZTL2uzNFON/H9k7idjHDSyUNUwc3Kfr
 JrBzWWjJuSHN00dfMJwywS8U8j6E9IjrBqlm8rChXMOxE/rVZq0UFdF8K3ZNlmGg
 QWlUolfildhKK6hnVySgrdpZPm2apSV5w4GMZ/3Nxj/hrnMRhnq7ub9APgk5EIw3
 dvaFf6+DdViHnLd9QrF2+DU6YlM3seTiEwXzvxInT6kNfkg/nyRUmREteMTrq+yv
 iQzDzZv+Z5nP82pcfs4g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tv42fps6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Oct 2023 10:19:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3422D10002A;
 Mon, 23 Oct 2023 10:19:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 225CF2138C4;
 Mon, 23 Oct 2023 10:19:11 +0200 (CEST)
Received: from [10.252.24.200] (10.252.24.200) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 23 Oct
 2023 10:19:10 +0200
Message-ID: <8ec28237-8641-4c4c-b448-824ac01f313b@foss.st.com>
Date: Mon, 23 Oct 2023 10:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: Avoid use-after-free issues with crtc and plane
Content-Language: en-US
To: Katya Orlova <e.orlova@ispras.ru>, Yannick Fertre
 <yannick.fertre@foss.st.com>
References: <20231020102935.27634-1-e.orlova@ispras.ru>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231020102935.27634-1-e.orlova@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.24.200]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_06,2023-10-19_01,2023-05-22_02
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Katya,


Thanks for your submission.


Please see drivers/gpu/drm/cr

On 10/20/23 12:29, Katya Orlova wrote:
> ltdc_load() calls functions drm_crtc_init_with_planes() and
> drm_universal_plane_init(). These functions should not be called with
> parameters allocated with devm_kzalloc() to avoid use-after-free issues [1].

What about drmm_kzalloc() ? By doing so the drm device is properly destroyed
using DRM internals, rather than handling the allocation within the LTDC driver.

This way has two benefits IMHO : you don't have to implement the .destroy hook
for CRTC and planes and since the allocation is managed by the DRM framework it
is less likely to make resources allocation errors on future patches.


You would then have to use drmm_universal_plane_init() and
drmm_crtc_init_with_planes().

see include/drm/drm_plane.h:779 and drivers/gpu/drm/drm_crtc.c:409


Regards,

Raphaël Gallais-Pou

>
> The patch replaces managed resource allocations with regular ones.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> [1]
> https://lore.kernel.org/lkml/u366i76e3qhh3ra5oxrtngjtm2u5lterkekcz6y2jkndhuxzli@diujon4h7qwb/
>
> Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
> ---
>  drivers/gpu/drm/stm/drv.c  | 11 ++++--
>  drivers/gpu/drm/stm/ltdc.c | 72 ++++++++++++++++++++++++++------------
>  2 files changed, 58 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index cb4404b3ce62..409f26d3e400 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -74,7 +74,7 @@ static int drv_load(struct drm_device *ddev)
>  
>  	DRM_DEBUG("%s\n", __func__);
>  
> -	ldev = devm_kzalloc(ddev->dev, sizeof(*ldev), GFP_KERNEL);
> +	ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
>  	if (!ldev)
>  		return -ENOMEM;
>  
> @@ -82,7 +82,7 @@ static int drv_load(struct drm_device *ddev)
>  
>  	ret = drmm_mode_config_init(ddev);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	/*
>  	 * set max width and height as default value.
> @@ -98,7 +98,7 @@ static int drv_load(struct drm_device *ddev)
>  
>  	ret = ltdc_load(ddev);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	drm_mode_config_reset(ddev);
>  	drm_kms_helper_poll_init(ddev);
> @@ -106,6 +106,9 @@ static int drv_load(struct drm_device *ddev)
>  	platform_set_drvdata(pdev, ddev);
>  
>  	return 0;
> +err:
> +	kfree(ldev);
> +	return ret;
>  }
>  
>  static void drv_unload(struct drm_device *ddev)
> @@ -114,6 +117,8 @@ static void drv_unload(struct drm_device *ddev)
>  
>  	drm_kms_helper_poll_fini(ddev);
>  	ltdc_unload(ddev);
> +	kfree(ddev->dev_private);
> +	ddev->dev_private = NULL;
>  }
>  
>  static __maybe_unused int drv_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index b8be4c1db423..ec3bc3637a63 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1120,6 +1120,12 @@ static const struct drm_crtc_helper_funcs ltdc_crtc_helper_funcs = {
>  	.get_scanout_position = ltdc_crtc_get_scanout_position,
>  };
>  
> +static void ltdc_crtc_destroy(struct drm_crtc *crtc)
> +{
> +	drm_crtc_cleanup(crtc);
> +	kfree(crtc);
> +}
> +
>  static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> @@ -1200,7 +1206,7 @@ static void ltdc_crtc_atomic_print_state(struct drm_printer *p,
>  }
>  
>  static const struct drm_crtc_funcs ltdc_crtc_funcs = {
> -	.destroy = drm_crtc_cleanup,
> +	.destroy = ltdc_crtc_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.reset = drm_atomic_helper_crtc_reset,
> @@ -1213,7 +1219,7 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
>  };
>  
>  static const struct drm_crtc_funcs ltdc_crtc_with_crc_support_funcs = {
> -	.destroy = drm_crtc_cleanup,
> +	.destroy = ltdc_crtc_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.reset = drm_atomic_helper_crtc_reset,
> @@ -1543,10 +1549,16 @@ static void ltdc_plane_atomic_print_state(struct drm_printer *p,
>  	fpsi->counter = 0;
>  }
>  
> +static void ltdc_plane_destroy(struct drm_plane *plane)
> +{
> +	drm_plane_cleanup(plane);
> +	kfree(plane);
> +}
> +
>  static const struct drm_plane_funcs ltdc_plane_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = drm_plane_cleanup,
> +	.destroy = ltdc_plane_destroy,
>  	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> @@ -1565,7 +1577,6 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  {
>  	unsigned long possible_crtcs = CRTC_MASK;
>  	struct ltdc_device *ldev = ddev->dev_private;
> -	struct device *dev = ddev->dev;
>  	struct drm_plane *plane;
>  	unsigned int i, nb_fmt = 0;
>  	u32 *formats;
> @@ -1576,7 +1587,7 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  	int ret;
>  
>  	/* Allocate the biggest size according to supported color formats */
> -	formats = devm_kzalloc(dev, (ldev->caps.pix_fmt_nb +
> +	formats = kzalloc((ldev->caps.pix_fmt_nb +
>  			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_cp) +
>  			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp) +
>  			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp)) *
> @@ -1614,15 +1625,20 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  		}
>  	}
>  
> -	plane = devm_kzalloc(dev, sizeof(*plane), GFP_KERNEL);
> -	if (!plane)
> +	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
> +	if (!plane) {
> +		kfree(formats);
>  		return NULL;
> +	}
>  
>  	ret = drm_universal_plane_init(ddev, plane, possible_crtcs,
>  				       &ltdc_plane_funcs, formats, nb_fmt,
>  				       modifiers, type, NULL);
> -	if (ret < 0)
> +	kfree(formats);
> +	if (ret < 0) {
> +		kfree(plane);
>  		return NULL;
> +	}
>  
>  	if (ldev->caps.ycbcr_input) {
>  		if (val & (LXCR_C1R_YIA | LXCR_C1R_YSPA | LXCR_C1R_YFPA))
> @@ -1650,7 +1666,7 @@ static void ltdc_plane_destroy_all(struct drm_device *ddev)
>  
>  	list_for_each_entry_safe(plane, plane_temp,
>  				 &ddev->mode_config.plane_list, head)
> -		drm_plane_cleanup(plane);
> +		ltdc_plane_destroy(plane);
>  }
>  
>  static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
> @@ -1936,7 +1952,7 @@ int ltdc_load(struct drm_device *ddev)
>  	if (!nb_endpoints)
>  		return -ENODEV;
>  
> -	ldev->pixel_clk = devm_clk_get(dev, "lcd");
> +	ldev->pixel_clk = clk_get(dev, "lcd");
>  	if (IS_ERR(ldev->pixel_clk)) {
>  		if (PTR_ERR(ldev->pixel_clk) != -EPROBE_DEFER)
>  			DRM_ERROR("Unable to get lcd clock\n");
> @@ -1982,7 +1998,7 @@ int ltdc_load(struct drm_device *ddev)
>  		}
>  	}
>  
> -	rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	rstc = reset_control_get_exclusive(dev, NULL);
>  
>  	mutex_init(&ldev->err_lock);
>  
> @@ -1993,25 +2009,25 @@ int ltdc_load(struct drm_device *ddev)
>  	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ldev->regs = devm_ioremap_resource(dev, res);
> +	ldev->regs = ioremap(res->start, resource_size(res));
>  	if (IS_ERR(ldev->regs)) {
>  		DRM_ERROR("Unable to get ltdc registers\n");
>  		ret = PTR_ERR(ldev->regs);
>  		goto err;
>  	}
>  
> -	ldev->regmap = devm_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
> +	ldev->regmap = regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
>  	if (IS_ERR(ldev->regmap)) {
>  		DRM_ERROR("Unable to regmap ltdc registers\n");
>  		ret = PTR_ERR(ldev->regmap);
> -		goto err;
> +		goto err_iounmap;
>  	}
>  
>  	ret = ltdc_get_caps(ddev);
>  	if (ret) {
>  		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
>  			  ldev->caps.hw_version);
> -		goto err;
> +		goto err_regmap_exit;
>  	}
>  
>  	/* Disable interrupts */
> @@ -2034,49 +2050,57 @@ int ltdc_load(struct drm_device *ddev)
>  		irq = platform_get_irq(pdev, i);
>  		if (irq < 0) {
>  			ret = irq;
> -			goto err;
> +			goto err_regmap_exit;
>  		}
>  
> -		ret = devm_request_threaded_irq(dev, irq, ltdc_irq,
> +		ret = request_threaded_irq(irq, ltdc_irq,
>  						ltdc_irq_thread, IRQF_ONESHOT,
>  						dev_name(dev), ddev);
>  		if (ret) {
>  			DRM_ERROR("Failed to register LTDC interrupt\n");
> -			goto err;
> +			goto err_regmap_exit;
>  		}
>  	}
>  
> -	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> +	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
>  	if (!crtc) {
>  		DRM_ERROR("Failed to allocate crtc\n");
>  		ret = -ENOMEM;
> -		goto err;
> +		goto err_regmap_exit;
>  	}
>  
>  	ret = ltdc_crtc_init(ddev, crtc);
>  	if (ret) {
>  		DRM_ERROR("Failed to init crtc\n");
> -		goto err;
> +		goto free_crtc;
>  	}
>  
>  	ret = drm_vblank_init(ddev, NB_CRTC);
>  	if (ret) {
>  		DRM_ERROR("Failed calling drm_vblank_init()\n");
> -		goto err;
> +		goto free_crtc;
>  	}
>  
>  	clk_disable_unprepare(ldev->pixel_clk);
> +	clk_put(ldev->pixel_clk);
>  
>  	pinctrl_pm_select_sleep_state(ddev->dev);
>  
>  	pm_runtime_enable(ddev->dev);
>  
>  	return 0;
> +free_crtc:
> +	kfree(crtc);
> +err_regmap_exit:
> +	regmap_exit(ldev->regmap);
> +err_iounmap:
> +	iounmap(ldev->regs);
>  err:
>  	for (i = 0; i < nb_endpoints; i++)
>  		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
>  
>  	clk_disable_unprepare(ldev->pixel_clk);
> +	clk_put(ldev->pixel_clk);
>  
>  	return ret;
>  }
> @@ -2084,6 +2108,7 @@ int ltdc_load(struct drm_device *ddev)
>  void ltdc_unload(struct drm_device *ddev)
>  {
>  	struct device *dev = ddev->dev;
> +	struct ltdc_device *ldev = ddev->dev_private;
>  	int nb_endpoints, i;
>  
>  	DRM_DEBUG_DRIVER("\n");
> @@ -2094,6 +2119,9 @@ void ltdc_unload(struct drm_device *ddev)
>  		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
>  
>  	pm_runtime_disable(ddev->dev);
> +
> +	regmap_exit(ldev->regmap);
> +	iounmap(ldev->regs);
>  }
>  
>  MODULE_AUTHOR("Philippe Cornu <philippe.cornu@st.com>");
