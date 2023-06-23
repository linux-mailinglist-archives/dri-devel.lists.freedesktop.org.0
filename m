Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B673BCCA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA3A10E679;
	Fri, 23 Jun 2023 16:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2436510E679
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:39:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6F33440;
 Fri, 23 Jun 2023 18:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687538355;
 bh=XqmTIZlH3lB//uuFxHSBx3U7rk96tMdbubcB9xG35Bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sNIAGVaJzAYOXqycaK/fuiw7F1N1h+g1Yf5DY23mLhTVMa+MZqWu/PrtAqfDs0srN
 bPkbp8hrPbUZbz6ox3gw13uoTp22vnwSJsIumkF4X4Jsf10vqqj0t+Uv5Apv/LlNBw
 WVzXxxYlgxnCXP6nAF6MKVIiMr+JKby0g9xBlUsU=
Date: Fri, 23 Jun 2023 19:39:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 23/39] drm: renesas: shmobile: Move interface handling to
 connector setup
Message-ID: <20230623163950.GA2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <0032f38b474a8ff63a7cdfdbc8b73766c3561729.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0032f38b474a8ff63a7cdfdbc8b73766c3561729.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:35AM +0200, Geert Uytterhoeven wrote:
> Move legacy interface handling to the connector setup code.
> Set up bus_flags and bus_formats in display_info according to the
> bus format and panel information from platform data, to make it more
> similar with DT-based connector/bridge/panel setup.
> This will allows us to use the same LCD interface setup code for both

s/allows/allow/

> legacy and DT-based systems.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 123 +++++++++++++++---
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  49 -------
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |   3 +-
>  3 files changed, 109 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 5328910ebe09c832..28a70536693f7788 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_crtc.h>
> @@ -66,15 +67,65 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->crtc;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
> -	enum display_flags dpy_flags = sdev->connector.mode->flags;
> +	const struct drm_display_info *info = &sdev->connector->display_info;
>  	const struct drm_display_mode *mode = &crtc->mode;
>  	u32 value;
>  
> -	value = sdev->ldmt1r
> -	      | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : LDMT1R_VPOL)
> -	      | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : LDMT1R_HPOL)
> -	      | ((dpy_flags & DISPLAY_FLAGS_PIXDATA_POSEDGE) ? LDMT1R_DWPOL : 0)
> -	      | ((dpy_flags & DISPLAY_FLAGS_DE_LOW) ? LDMT1R_DIPOL : 0);
> +	if (!info->num_bus_formats || !info->bus_formats) {
> +		dev_warn(sdev->dev, "No bus format reported, using RGB888\n");
> +		value = LDMT1R_MIFTYP_RGB24;
> +	} else {
> +		switch (info->bus_formats[0]) {
> +		case MEDIA_BUS_FMT_RGB888_3X8:
> +			value = LDMT1R_MIFTYP_RGB8;
> +			break;
> +
> +		case MEDIA_BUS_FMT_RGB666_2X9_BE:
> +			value = LDMT1R_MIFTYP_RGB9;
> +			break;
> +
> +		case MEDIA_BUS_FMT_RGB888_2X12_BE:
> +			value = LDMT1R_MIFTYP_RGB12A;
> +			break;
> +
> +		case MEDIA_BUS_FMT_RGB444_1X12:
> +			value = LDMT1R_MIFTYP_RGB12B;
> +			break;
> +
> +		case MEDIA_BUS_FMT_RGB565_1X16:
> +			value = LDMT1R_MIFTYP_RGB16;
> +			break;
> +
> +		case MEDIA_BUS_FMT_RGB666_1X18:
> +			value = LDMT1R_MIFTYP_RGB18;
> +			break;
> +
> +		case MEDIA_BUS_FMT_RGB888_1X24:
> +			value = LDMT1R_MIFTYP_RGB24;
> +			break;
> +
> +		case MEDIA_BUS_FMT_UYVY8_1X16:
> +			value = LDMT1R_MIFTYP_YCBCR;
> +			break;
> +
> +		default:
> +			dev_warn(sdev->dev,
> +				 "unsupported bus format 0x%x, using RGB888\n",
> +				 info->bus_formats[0]);
> +			value = LDMT1R_MIFTYP_RGB24;
> +			break;
> +		}

It's a bit annoying to lose the ability to validate the bus format at
probe time. Can it be kept. I'm also OK with restoring it later in the
series if it gets in the way of the conversion, in which case a mention
in the commit message would be nice.

> +	}
> +
> +	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> +		value |= LDMT1R_DWPOL;
> +	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
> +		value |= LDMT1R_DIPOL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		value |= LDMT1R_VPOL;
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		value |= LDMT1R_HPOL;
>  
>  	lcdc_write(sdev, LDMT1R, value);
>  
> @@ -512,7 +563,7 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>  {
>  	struct drm_device *dev = encoder->dev;
>  	struct shmob_drm_device *sdev = to_shmob_device(dev);
> -	struct drm_connector *connector = &sdev->connector.connector;
> +	struct drm_connector *connector = sdev->connector;
>  	const struct drm_display_mode *panel_mode;
>  
>  	if (list_empty(&connector->modes)) {
> @@ -614,6 +665,8 @@ static void shmob_drm_connector_destroy(struct drm_connector *connector)
>  {
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
> +
> +	kfree(connector);
>  }
>  
>  static const struct drm_connector_funcs connector_funcs = {
> @@ -622,26 +675,64 @@ static const struct drm_connector_funcs connector_funcs = {
>  	.destroy = shmob_drm_connector_destroy,
>  };
>  
> -int shmob_drm_connector_create(struct shmob_drm_device *sdev,
> -			       struct drm_encoder *encoder)
> +static struct drm_connector *
> +shmob_drm_connector_init(struct shmob_drm_device *sdev,
> +			 struct drm_encoder *encoder)
>  {
> -	struct shmob_drm_connector *scon = &sdev->connector;
> -	struct drm_connector *connector = &scon->connector;
> +	struct shmob_drm_connector *scon;
> +	struct drm_connector *connector;
> +	struct drm_display_info *info;
>  	int ret;
>  
> +	scon = kzalloc(sizeof(*scon), GFP_KERNEL);
> +	if (!scon)
> +		return ERR_PTR(-ENOMEM);
> +
> +	connector = &scon->connector;
> +	info = &connector->display_info;
> +	info->width_mm = sdev->pdata->panel.width_mm;
> +	info->height_mm = sdev->pdata->panel.height_mm;
> +
>  	scon->encoder = encoder;
>  	scon->mode = &sdev->pdata->panel.mode;
>  
> -	connector->display_info.width_mm = sdev->pdata->panel.width_mm;
> -	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
> +	if (scon->mode->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
> +		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> +	if (scon->mode->flags & DISPLAY_FLAGS_DE_LOW)
> +		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;

Could you please keep the initialization of the info fields grouped
together ? You can move the initialization of scon->encoder and
scon->mode just after connector.

> +
> +	ret = drm_display_info_set_bus_formats(info,
> +					       &sdev->pdata->iface.bus_fmt, 1);
> +	if (ret < 0) {
> +		kfree(scon);
> +		return ERR_PTR(ret);
> +	}
>  
>  	ret = drm_connector_init(&sdev->ddev, connector, &connector_funcs,
>  				 DRM_MODE_CONNECTOR_DPI);
> -	if (ret < 0)
> -		return ret;
> +	if (ret < 0) {
> +		kfree(scon);
> +		return ERR_PTR(ret);
> +	}
>  
>  	drm_connector_helper_add(connector, &connector_helper_funcs);
>  
> +	return connector;
> +}
> +
> +int shmob_drm_connector_create(struct shmob_drm_device *sdev,
> +			       struct drm_encoder *encoder)
> +{
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	connector = shmob_drm_connector_init(sdev, encoder);
> +	if (IS_ERR(connector)) {
> +		dev_err(sdev->dev, "failed to created connector: %pe\n",
> +			connector);
> +		return PTR_ERR(connector);
> +	}
> +
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret < 0)
>  		goto error;
> @@ -650,6 +741,8 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  	drm_object_property_set_value(&connector->base,
>  		sdev->ddev.mode_config.dpms_property, DRM_MODE_DPMS_OFF);
>  
> +	sdev->connector = connector;
> +
>  	return 0;
>  
>  error:
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index e5be0ae99bd970be..c15ebbe74cac501f 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -9,7 +9,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/io.h>
> -#include <linux/media-bus-format.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -33,50 +32,6 @@
>   * Hardware initialization
>   */
>  
> -static int shmob_drm_init_interface(struct shmob_drm_device *sdev)
> -{
> -	switch (sdev->pdata->iface.bus_fmt) {
> -	case MEDIA_BUS_FMT_RGB888_3X8:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB8;
> -		break;
> -
> -	case MEDIA_BUS_FMT_RGB666_2X9_BE:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB9;
> -		break;
> -
> -	case MEDIA_BUS_FMT_RGB888_2X12_BE:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB12A;
> -		break;
> -
> -	case MEDIA_BUS_FMT_RGB444_1X12:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB12B;
> -		break;
> -
> -	case MEDIA_BUS_FMT_RGB565_1X16:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB16;
> -		break;
> -
> -	case MEDIA_BUS_FMT_RGB666_1X18:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB18;
> -		break;
> -
> -	case MEDIA_BUS_FMT_RGB888_1X24:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_RGB24;
> -		break;
> -
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		sdev->ldmt1r = LDMT1R_MIFTYP_YCBCR;
> -		break;
> -
> -	default:
> -		dev_err(sdev->dev, "invalid bus format 0x%x\n",
> -			sdev->pdata->iface.bus_fmt);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
>  				  enum shmob_drm_clk_source clksrc)
>  {
> @@ -235,10 +190,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = shmob_drm_init_interface(sdev);
> -	if (ret < 0)
> -		return ret;
> -
>  	ret = shmob_drm_modeset_init(sdev);
>  	if (ret < 0)
>  		return dev_err_probe(&pdev->dev, ret,
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> index 5e55ba7a207865bd..18907e5ace51c681 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> @@ -27,7 +27,6 @@ struct shmob_drm_device {
>  	void __iomem *mmio;
>  	struct clk *clock;
>  	u32 lddckr;
> -	u32 ldmt1r;
>  
>  	unsigned int irq;
>  	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
> @@ -36,7 +35,7 @@ struct shmob_drm_device {
>  
>  	struct shmob_drm_crtc crtc;
>  	struct drm_encoder encoder;
> -	struct shmob_drm_connector connector;
> +	struct drm_connector *connector;
>  };
>  
>  static inline struct shmob_drm_device *to_shmob_device(struct drm_device *dev)

-- 
Regards,

Laurent Pinchart
