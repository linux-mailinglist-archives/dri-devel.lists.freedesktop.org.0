Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD165FFA2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 12:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF3910E00D;
	Fri,  6 Jan 2023 11:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0462510E00D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J886v4J/EW6dqdSq/tvO/h26eqhFQD1X9G4rcAW/GZg=; b=Qq1kqGvyd2iR8hYceYkyJejT9h
 w6jRiihHltZPyNfk0i/XSG2aUdedzsw678/hTBuBPrVcYVCo4GisGqj+W6hy8OvQzuW/bnwAloX9H
 WqTTRu2GMcgyqxX7BPZoGmVPJ1c5Jz979ONaRmmiJYXfLRcXe2n7l5TAlfytN3rp2RPg5/AEPIsWV
 G9DxkK0wKwr/Bo3c7QcYeMhsI9M31PLvgbVwD0jnso8THz8H8JEL6PoyaGdIrRgl0a2gFy8bUMhnf
 3nOEHYd9W6SdSBab7/hAgwmEUj5DX5olArAZBqGtNLfViONWq4TX9onhhHbUrqoGdiOIp4mIJR2jV
 63d8VPdQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pDl4I-000np6-IQ; Fri, 06 Jan 2023 12:39:26 +0100
Message-ID: <29bba036-129b-445b-41d0-118051a80480@igalia.com>
Date: Fri, 6 Jan 2023 08:39:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] drm/fb-helper: Replace bpp/depth parameter by color
 mode
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, steev@kali.org, 
 dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20230106112324.22055-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230106112324.22055-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/6/23 08:23, Thomas Zimmermann wrote:
> Replace the combination of bpp and depth with a single color-mode
> argument. Handle special cases in simpledrm and ofdrm. Hard-code
> XRGB8888 as fallback format for cases where no given format works.
> 
> The color-mode argument accepts the same values as the kernel's video
> parameter. These are mostly bpp values between 1 and 32. The exceptions
> are 15, which has a color depth of 15 and a bpp value of 16; and 32,
> which has a color depth of 24 and a bpp value of 32.
> 
> v4:
> 	* add back lost test for bpp_specified (Maira)
> 	* add Fixes tag (Daniel)
> v3:
> 	* fix ofdrm build (Maxime)
> v2:
> 	* minimize changes (Daniel)
> 	* use drm_driver_legacy_fb_format() (Daniel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Tested-by: Maíra Canal <mcanal@igalia.com> # vc4 and vkms

Thanks for taking care of this!

Best Regards,
- Maíra Canal

> Fixes: 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format selection")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/drm_fb_helper.c  | 42 ++++++++++++++++++--------------
>   drivers/gpu/drm/tiny/ofdrm.c     |  7 +++++-
>   drivers/gpu/drm/tiny/simpledrm.c |  7 +++++-
>   3 files changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 1369ca4ae39b..427631706128 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1756,24 +1756,21 @@ static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const
>   	return DRM_FORMAT_INVALID;
>   }
>   
> -static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helper,
> -						  const uint32_t *formats, size_t format_count,
> -						  const struct drm_cmdline_mode *cmdline_mode)
> +static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_helper,
> +						     const uint32_t *formats, size_t format_count,
> +						     unsigned int color_mode)
>   {
>   	struct drm_device *dev = fb_helper->dev;
>   	uint32_t bpp, depth;
>   
> -	if (!cmdline_mode->bpp_specified)
> -		return DRM_FORMAT_INVALID;
> -
> -	switch (cmdline_mode->bpp) {
> +	switch (color_mode) {
>   	case 1:
>   	case 2:
>   	case 4:
>   	case 8:
>   	case 16:
>   	case 24:
> -		bpp = depth = cmdline_mode->bpp;
> +		bpp = depth = color_mode;
>   		break;
>   	case 15:
>   		bpp = 16;
> @@ -1784,7 +1781,7 @@ static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helpe
>   		depth = 24;
>   		break;
>   	default:
> -		drm_info(dev, "unsupported bpp value of %d\n", cmdline_mode->bpp);
> +		drm_info(dev, "unsupported color mode of %d\n", color_mode);
>   		return DRM_FORMAT_INVALID;
>   	}
>   
> @@ -1817,10 +1814,13 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
>   		drm_client_for_each_connector_iter(connector, &conn_iter) {
>   			struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
>   
> -			surface_format = drm_fb_helper_find_cmdline_format(fb_helper,
> -									   plane->format_types,
> -									   plane->format_count,
> -									   cmdline_mode);
> +			if (!cmdline_mode->bpp_specified)
> +				continue;
> +
> +			surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
> +									      plane->format_types,
> +									      plane->format_count,
> +									      cmdline_mode->bpp);
>   			if (surface_format != DRM_FORMAT_INVALID)
>   				break; /* found supported format */
>   		}
> @@ -1829,17 +1829,23 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
>   		if (surface_format != DRM_FORMAT_INVALID)
>   			break; /* found supported format */
>   
> -		/* try preferred bpp/depth */
> -		surface_format = drm_fb_helper_find_format(fb_helper, plane->format_types,
> -							   plane->format_count, preferred_bpp,
> -							   dev->mode_config.preferred_depth);
> +		/* try preferred color mode */
> +		surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
> +								      plane->format_types,
> +								      plane->format_count,
> +								      preferred_bpp);
>   		if (surface_format != DRM_FORMAT_INVALID)
>   			break; /* found supported format */
>   	}
>   
>   	if (surface_format == DRM_FORMAT_INVALID) {
> +		/*
> +		 * If none of the given color modes works, fall back
> +		 * to XRGB8888. Drivers are expected to provide this
> +		 * format for compatibility with legacy applications.
> +		 */
>   		drm_warn(dev, "No compatible format found\n");
> -		return -EAGAIN;
> +		surface_format = drm_driver_legacy_fb_format(dev, 32, 24);
>   	}
>   
>   	info = drm_format_info(surface_format);
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 39c5fd463fec..6e349ca42485 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -1352,6 +1352,7 @@ static int ofdrm_probe(struct platform_device *pdev)
>   {
>   	struct ofdrm_device *odev;
>   	struct drm_device *dev;
> +	unsigned int color_mode;
>   	int ret;
>   
>   	odev = ofdrm_device_create(&ofdrm_driver, pdev);
> @@ -1363,7 +1364,11 @@ static int ofdrm_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	drm_fbdev_generic_setup(dev, drm_format_info_bpp(odev->format, 0));
> +	color_mode = drm_format_info_bpp(odev->format, 0);
> +	if (color_mode == 16)
> +		color_mode = odev->format->depth; // can be 15 or 16
> +
> +	drm_fbdev_generic_setup(dev, color_mode);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 7355617f38d3..f658b99c796a 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -802,6 +802,7 @@ static int simpledrm_probe(struct platform_device *pdev)
>   {
>   	struct simpledrm_device *sdev;
>   	struct drm_device *dev;
> +	unsigned int color_mode;
>   	int ret;
>   
>   	sdev = simpledrm_device_create(&simpledrm_driver, pdev);
> @@ -813,7 +814,11 @@ static int simpledrm_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	drm_fbdev_generic_setup(dev, drm_format_info_bpp(sdev->format, 0));
> +	color_mode = drm_format_info_bpp(sdev->format, 0);
> +	if (color_mode == 16)
> +		color_mode = sdev->format->depth; // can be 15 or 16
> +
> +	drm_fbdev_generic_setup(dev, color_mode);
>   
>   	return 0;
>   }
