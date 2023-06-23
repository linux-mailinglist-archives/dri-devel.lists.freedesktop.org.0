Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D973BBF6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650D010E665;
	Fri, 23 Jun 2023 15:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E01410E665
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:48:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2537838;
 Fri, 23 Jun 2023 17:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687535293;
 bh=Cr3j7aexa8WAwMgg62BIgmrQaZI/I4rntBTLf0+HXZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpWNvhhacBf+A8WJs9gyv74Jr9p44s/IY16c+DQN52/9VKy4HO0w9c7jllqLqlCta
 Pykv8MHiqfuxAQtKoYM+t7ilvAItnuKg8ncEpo34tnlYuKepli8UT0mSuZjNQGHS0h
 F1MrUzwGVq4iLP81BUTElR4uimh65gktAgAALBuc=
Date: Fri, 23 Jun 2023 18:48:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 18/39] drm: renesas: shmobile: Embed drm_device in
 shmob_drm_device
Message-ID: <20230623154848.GV2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <28a858c885713b3d64a531bbfa31efc3fffccc7d.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <28a858c885713b3d64a531bbfa31efc3fffccc7d.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:30AM +0200, Geert Uytterhoeven wrote:
> Embedding drm_device in shmob_drm_device allows us to use the DRM
> managed API to allocate both structures in one go, simplifying error
> handling.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 12 +++---
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 41 +++++++------------
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  2 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  | 16 ++++----
>  .../drm/renesas/shmobile/shmob_drm_plane.c    |  8 ++--
>  5 files changed, 34 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index bcdebbc9f8a7e299..26611440f7a12715 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -139,7 +139,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  	struct shmob_drm_device *sdev = crtc->dev->dev_private;
>  	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>  	const struct shmob_drm_format_info *format;
> -	struct drm_device *dev = sdev->ddev;
> +	struct drm_device *dev = &sdev->ddev;
>  	struct drm_plane *plane;
>  	u32 value;
>  	int ret;
> @@ -472,7 +472,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  
>  	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
>  
> -	primary = __drm_universal_plane_alloc(sdev->ddev, sizeof(*primary), 0,
> +	primary = __drm_universal_plane_alloc(&sdev->ddev, sizeof(*primary), 0,
>  					      0, &primary_plane_funcs,
>  					      modeset_formats,
>  					      ARRAY_SIZE(modeset_formats),
> @@ -481,7 +481,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	ret = drm_crtc_init_with_planes(sdev->ddev, crtc, primary, NULL,
> +	ret = drm_crtc_init_with_planes(&sdev->ddev, crtc, primary, NULL,
>  					&crtc_funcs, NULL);
>  	if (ret < 0) {
>  		drm_plane_cleanup(primary);
> @@ -557,7 +557,7 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>  
>  	encoder->possible_crtcs = 1;
>  
> -	ret = drm_simple_encoder_init(sdev->ddev, encoder,
> +	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
>  				      DRM_MODE_ENCODER_DPI);
>  	if (ret < 0)
>  		return ret;
> @@ -637,7 +637,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  	connector->display_info.width_mm = sdev->pdata->panel.width_mm;
>  	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
>  
> -	ret = drm_connector_init(sdev->ddev, connector, &connector_funcs,
> +	ret = drm_connector_init(&sdev->ddev, connector, &connector_funcs,
>  				 DRM_MODE_CONNECTOR_DPI);
>  	if (ret < 0)
>  		return ret;
> @@ -650,7 +650,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  
>  	drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
>  	drm_object_property_set_value(&connector->base,
> -		sdev->ddev->mode_config.dpms_property, DRM_MODE_DPMS_OFF);
> +		sdev->ddev.mode_config.dpms_property, DRM_MODE_DPMS_OFF);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index ece9aedde9b662d4..2b77af3a8c97ef8c 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -137,7 +137,7 @@ static int shmob_drm_pm_suspend(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
>  
> -	drm_kms_helper_poll_disable(sdev->ddev);
> +	drm_kms_helper_poll_disable(&sdev->ddev);
>  	shmob_drm_crtc_suspend(&sdev->crtc);
>  
>  	return 0;
> @@ -147,11 +147,11 @@ static int shmob_drm_pm_resume(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
>  
> -	drm_modeset_lock_all(sdev->ddev);
> +	drm_modeset_lock_all(&sdev->ddev);
>  	shmob_drm_crtc_resume(&sdev->crtc);
> -	drm_modeset_unlock_all(sdev->ddev);
> +	drm_modeset_unlock_all(&sdev->ddev);
>  
> -	drm_kms_helper_poll_enable(sdev->ddev);
> +	drm_kms_helper_poll_enable(&sdev->ddev);
>  	return 0;
>  }
>  
> @@ -165,12 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
>  static int shmob_drm_remove(struct platform_device *pdev)
>  {
>  	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
> -	struct drm_device *ddev = sdev->ddev;
> +	struct drm_device *ddev = &sdev->ddev;
>  
>  	drm_dev_unregister(ddev);
>  	drm_kms_helper_poll_fini(ddev);
> -	drm_dev_put(ddev);
> -
>  	return 0;
>  }
>  
> @@ -188,13 +186,15 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	}
>  
>  	/*
> -	 * Allocate and initialize the driver private data, I/O resources and
> -	 * clocks.
> +	 * Allocate and initialize the DRM device, driver private data, I/O
> +	 * resources and clocks.
>  	 */
> -	sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev), GFP_KERNEL);
> -	if (sdev == NULL)
> -		return -ENOMEM;
> +	sdev = devm_drm_dev_alloc(&pdev->dev, &shmob_drm_driver,
> +				  struct shmob_drm_device, ddev);
> +	if (IS_ERR(sdev))
> +		return PTR_ERR(sdev);
>  
> +	ddev = &sdev->ddev;
>  	sdev->dev = &pdev->dev;
>  	sdev->pdata = pdata;
>  	spin_lock_init(&sdev->irq_lock);
> @@ -217,20 +217,12 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Allocate and initialize the DRM device. */
> -	ddev = drm_dev_alloc(&shmob_drm_driver, &pdev->dev);
> -	if (IS_ERR(ddev))
> -		return PTR_ERR(ddev);
> -
> -	sdev->ddev = ddev;
>  	ddev->dev_private = sdev;
>  
>  	ret = shmob_drm_modeset_init(sdev);
> -	if (ret < 0) {
> -		dev_err_probe(&pdev->dev, ret,
> -			      "failed to initialize mode setting\n");
> -		goto err_free_drm_dev;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to initialize mode setting\n");
>  
>  	for (i = 0; i < 4; ++i) {
>  		ret = shmob_drm_plane_create(sdev, i);
> @@ -272,9 +264,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  err_modeset_cleanup:
>  	drm_kms_helper_poll_fini(ddev);
> -err_free_drm_dev:
> -	drm_dev_put(ddev);
> -
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> index 16d830168b2ada21..77bb0da48f37ace8 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> @@ -32,7 +32,7 @@ struct shmob_drm_device {
>  	unsigned int irq;
>  	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
>  
> -	struct drm_device *ddev;
> +	struct drm_device ddev;
>  
>  	struct shmob_drm_crtc crtc;
>  	struct drm_encoder encoder;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
> index 1a62e7f8a8a9e6df..20316907030b2789 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
> @@ -153,7 +153,7 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
>  {
>  	int ret;
>  
> -	ret = drmm_mode_config_init(sdev->ddev);
> +	ret = drmm_mode_config_init(&sdev->ddev);
>  	if (ret)
>  		return ret;
>  
> @@ -169,15 +169,15 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	drm_kms_helper_poll_init(sdev->ddev);
> +	drm_kms_helper_poll_init(&sdev->ddev);
>  
> -	sdev->ddev->mode_config.min_width = 0;
> -	sdev->ddev->mode_config.min_height = 0;
> -	sdev->ddev->mode_config.max_width = 4095;
> -	sdev->ddev->mode_config.max_height = 4095;
> -	sdev->ddev->mode_config.funcs = &shmob_drm_mode_config_funcs;
> +	sdev->ddev.mode_config.min_width = 0;
> +	sdev->ddev.mode_config.min_height = 0;
> +	sdev->ddev.mode_config.max_width = 4095;
> +	sdev->ddev.mode_config.max_height = 4095;
> +	sdev->ddev.mode_config.funcs = &shmob_drm_mode_config_funcs;
>  
> -	drm_helper_disable_unused_functions(sdev->ddev);
> +	drm_helper_disable_unused_functions(&sdev->ddev);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 1fb68b5fe915b8dc..17e66a018689f648 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -68,7 +68,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  		 splane->format->ldbbsifr;
>  
>  #define plane_reg_dump(sdev, splane, reg) \
> -	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
> +	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
>  		splane->index, #reg, \
>  		lcdc_read(sdev, reg(splane->index)), \
>  		lcdc_read(sdev, reg(splane->index) + LCDC_SIDE_B_OFFSET))
> @@ -81,7 +81,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  	plane_reg_dump(sdev, splane, LDBnBSACR);
>  
>  	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
> -	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
> +	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
>  		"LDBCR", lcdc_read(sdev, LDBCR));
>  
>  	lcdc_write(sdev, LDBnBSIFR(splane->index), format);
> @@ -103,7 +103,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  
>  	lcdc_write(sdev, LDBCR,
>  		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
> -	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
> +	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
>  		"LDBCR", lcdc_read(sdev, LDBCR));
>  
>  	plane_reg_dump(sdev, splane, LDBnBSIFR);
> @@ -198,7 +198,7 @@ int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
>  {
>  	struct shmob_drm_plane *splane;
>  
> -	splane = drmm_universal_plane_alloc(sdev->ddev, struct shmob_drm_plane,
> +	splane = drmm_universal_plane_alloc(&sdev->ddev, struct shmob_drm_plane,
>  					    plane, 1, &shmob_drm_plane_funcs,
>  					    formats, ARRAY_SIZE(formats), NULL,
>  					    DRM_PLANE_TYPE_OVERLAY, NULL);

-- 
Regards,

Laurent Pinchart
