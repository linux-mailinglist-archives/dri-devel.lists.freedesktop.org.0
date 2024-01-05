Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859238250B5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6710E568;
	Fri,  5 Jan 2024 09:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42D10E568
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:21:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 4052xVtj026982; Fri, 5 Jan 2024 10:21:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=vW8CYyGIP/vC0L2YTygi0W0H7YOr9Bs1QNabt8ZBU1M=; b=Tv
 qDL3NSqwEnMohCzDKfiJx/4bDSTntsHCmJ93nwH9C+miyfsS9+R9rbUPshYJtqX5
 LPD0N2PGDrqjjg/XxQbBx/BGH5+SfgNjOvlHRAZmSDYKDDD9agRoJxf1WQFWGemP
 bflaXuetxu030U1SxNqX4Wo2V66XtPgnYpiydlRl4UkV41/Jm8b9wDP4pK233w0h
 ySbV4rDlpZsu67A4bp03GO5hR1yCZQe3XjWVm3+sucXT7r6ehFChl+GD5ZgttqCU
 VVuoblEAcqoHXRzLfGDAh8i9APGuDKwjlS5d6QqV5ZTrOLJF5HfI4WIamAX0cp78
 9Y/TxhvmDDQPmueDN8Iw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9fd19g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 10:21:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 978ED10002A;
 Fri,  5 Jan 2024 10:21:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 830EE21861F;
 Fri,  5 Jan 2024 10:21:09 +0100 (CET)
Received: from [10.252.5.254] (10.252.5.254) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 10:21:09 +0100
Message-ID: <76b4dfd8-f8c2-41f1-96df-539b168f9e80@foss.st.com>
Date: Fri, 5 Jan 2024 10:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/stm: Avoid use-after-free issues with crtc and
 plane
Content-Language: en-US
To: Katya Orlova <e.orlova@ispras.ru>
References: <20231124100415.21713-1-e.orlova@ispras.ru>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231124100415.21713-1-e.orlova@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.5.254]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_04,2024-01-05_01,2023-05-22_02
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/24/23 11:04, Katya Orlova wrote:
> ltdc_load() calls functions drm_crtc_init_with_planes(),
> drm_universal_plane_init() and drm_encoder_init(). These functions
> should not be called with parameters allocated with devm_kzalloc()
> to avoid use-after-free issues [1].
>
> Use allocations managed by the DRM framework.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> [1]
> https://lore.kernel.org/lkml/u366i76e3qhh3ra5oxrtngjtm2u5lterkekcz6y2jkndhuxzli@diujon4h7qwb/
>
> Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
> ---
> v2: use allocations managed by the DRM as
> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> suggested.
> Also add a fix for encoder.
>  drivers/gpu/drm/stm/drv.c  |  3 +-
>  drivers/gpu/drm/stm/ltdc.c | 68 +++++++++-----------------------------
>  2 files changed, 18 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index e8523abef27a..152bec2c0238 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_module.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_managed.h>
>  
>  #include "ltdc.h"
>  
> @@ -75,7 +76,7 @@ static int drv_load(struct drm_device *ddev)
>  
>  	DRM_DEBUG("%s\n", __func__);
>  
> -	ldev = devm_kzalloc(ddev->dev, sizeof(*ldev), GFP_KERNEL);
> +	ldev = drmm_kzalloc(ddev, sizeof(*ldev), GFP_KERNEL);
>  	if (!ldev)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5576fdae4962..02a7c8375f44 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_managed.h>
>  
>  #include <video/videomode.h>
>  
> @@ -1199,7 +1200,6 @@ static void ltdc_crtc_atomic_print_state(struct drm_printer *p,
>  }
>  
>  static const struct drm_crtc_funcs ltdc_crtc_funcs = {
> -	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.reset = drm_atomic_helper_crtc_reset,
> @@ -1212,7 +1212,6 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
>  };
>  
>  static const struct drm_crtc_funcs ltdc_crtc_with_crc_support_funcs = {
> -	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.reset = drm_atomic_helper_crtc_reset,
> @@ -1545,7 +1544,6 @@ static void ltdc_plane_atomic_print_state(struct drm_printer *p,
>  static const struct drm_plane_funcs ltdc_plane_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = drm_plane_cleanup,
>  	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> @@ -1572,7 +1570,6 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  	const u64 *modifiers = ltdc_format_modifiers;
>  	u32 lofs = index * LAY_OFS;
>  	u32 val;
> -	int ret;
>  
>  	/* Allocate the biggest size according to supported color formats */
>  	formats = devm_kzalloc(dev, (ldev->caps.pix_fmt_nb +
> @@ -1613,14 +1610,10 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  		}
>  	}
>  
> -	plane = devm_kzalloc(dev, sizeof(*plane), GFP_KERNEL);
> -	if (!plane)
> -		return NULL;
> -
> -	ret = drm_universal_plane_init(ddev, plane, possible_crtcs,
> -				       &ltdc_plane_funcs, formats, nb_fmt,
> -				       modifiers, type, NULL);
> -	if (ret < 0)
> +	plane = drmm_universal_plane_alloc(ddev, struct drm_plane, dev,
> +				       possible_crtcs, &ltdc_plane_funcs, formats, nb_fmt,
> +				       modifiers, type, NULL);

Hi Katya,

Thanks for your submission, and sorry for the delay.


There is several alignment style problems, such as the lines above.

You can use "--strict" option with checkpatch script to show you all the faulty
alignment before sending a patch.


Other than that this patch looks pretty good to me.

Regards,

Raphaël

> +	if (IS_ERR(plane))
>  		return NULL;
>  
>  	if (ldev->caps.ycbcr_input) {
> @@ -1643,15 +1636,6 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  	return plane;
>  }
>  
> -static void ltdc_plane_destroy_all(struct drm_device *ddev)
> -{
> -	struct drm_plane *plane, *plane_temp;
> -
> -	list_for_each_entry_safe(plane, plane_temp,
> -				 &ddev->mode_config.plane_list, head)
> -		drm_plane_cleanup(plane);
> -}
> -
>  static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>  {
>  	struct ltdc_device *ldev = ddev->dev_private;
> @@ -1677,14 +1661,14 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>  
>  	/* Init CRTC according to its hardware features */
>  	if (ldev->caps.crc)
> -		ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> +		ret = drmm_crtc_init_with_planes(ddev, crtc, primary, NULL,
>  						&ltdc_crtc_with_crc_support_funcs, NULL);
>  	else
> -		ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> +		ret = drmm_crtc_init_with_planes(ddev, crtc, primary, NULL,
>  						&ltdc_crtc_funcs, NULL);
>  	if (ret) {
>  		DRM_ERROR("Can not initialize CRTC\n");
> -		goto cleanup;
> +		return ret;
>  	}
>  
>  	drm_crtc_helper_add(crtc, &ltdc_crtc_helper_funcs);
> @@ -1698,9 +1682,8 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>  	for (i = 1; i < ldev->caps.nb_layers; i++) {
>  		overlay = ltdc_plane_create(ddev, DRM_PLANE_TYPE_OVERLAY, i);
>  		if (!overlay) {
> -			ret = -ENOMEM;
>  			DRM_ERROR("Can not create overlay plane %d\n", i);
> -			goto cleanup;
> +			return -ENOMEM;
>  		}
>  		if (ldev->caps.dynamic_zorder)
>  			drm_plane_create_zpos_property(overlay, i, 0, ldev->caps.nb_layers - 1);
> @@ -1713,10 +1696,6 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>  	}
>  
>  	return 0;
> -
> -cleanup:
> -	ltdc_plane_destroy_all(ddev);
> -	return ret;
>  }
>  
>  static void ltdc_encoder_disable(struct drm_encoder *encoder)
> @@ -1776,23 +1755,19 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
>  	struct drm_encoder *encoder;
>  	int ret;
>  
> -	encoder = devm_kzalloc(ddev->dev, sizeof(*encoder), GFP_KERNEL);
> -	if (!encoder)
> -		return -ENOMEM;
> +	encoder = drmm_simple_encoder_alloc(ddev, struct drm_encoder, dev,
> +										DRM_MODE_ENCODER_DPI);
Nit: bad alignment.
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
>  
>  	encoder->possible_crtcs = CRTC_MASK;
>  	encoder->possible_clones = 0;	/* No cloning support */
>  
> -	drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
> -
>  	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
>  
>  	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			drm_encoder_cleanup(encoder);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
>  
> @@ -1962,8 +1937,7 @@ int ltdc_load(struct drm_device *ddev)
>  			goto err;
>  
>  		if (panel) {
> -			bridge = drm_panel_bridge_add_typed(panel,
> -							    DRM_MODE_CONNECTOR_DPI);
> +			bridge = drmm_panel_bridge_add(ddev, panel);
>  			if (IS_ERR(bridge)) {
>  				DRM_ERROR("panel-bridge endpoint %d\n", i);
>  				ret = PTR_ERR(bridge);
> @@ -2045,7 +2019,7 @@ int ltdc_load(struct drm_device *ddev)
>  		}
>  	}
>  
> -	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> +	crtc = drmm_kzalloc(ddev, sizeof(*crtc), GFP_KERNEL);
>  	if (!crtc) {
>  		DRM_ERROR("Failed to allocate crtc\n");
>  		ret = -ENOMEM;
> @@ -2072,8 +2046,6 @@ int ltdc_load(struct drm_device *ddev)
>  
>  	return 0;
>  err:
> -	for (i = 0; i < nb_endpoints; i++)
> -		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
>  
>  	clk_disable_unprepare(ldev->pixel_clk);
>  
> @@ -2082,16 +2054,8 @@ int ltdc_load(struct drm_device *ddev)
>  
>  void ltdc_unload(struct drm_device *ddev)
>  {
> -	struct device *dev = ddev->dev;
> -	int nb_endpoints, i;
> -
>  	DRM_DEBUG_DRIVER("\n");
>  
> -	nb_endpoints = of_graph_get_endpoint_count(dev->of_node);
> -
> -	for (i = 0; i < nb_endpoints; i++)
> -		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
> -
>  	pm_runtime_disable(ddev->dev);
>  }
>  
