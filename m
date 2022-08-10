Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DAC58F2F9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073C18BB35;
	Wed, 10 Aug 2022 19:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013F190F3A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=wzx94/ir+kA9NB3suUBAiyU2K9Maf5LwjgVOrSpmywE=;
 b=SgV0ug57UQvWyQ0CAB50uctIfsAa3Qx5ZjYXZ0kVCJdU5FPcPCQgnS3ekuRDKLYGVWFd5Mp1CAbD8
 T1ml8SDKyt43QHCTm9B/Yy3xcBCtfdtWRvi9F+3zFt27HvSM7EjtV4ud8OancJUE5KCceEAGx9F+2b
 aRSvXXFFvUojhBqbEK0xsO2IZJfeoTu+9o+NI4ktownKg5R8k4Bst8bMyVRUcw2M/mBaSgxC5Fj/Jt
 hkBUIChX1WZ1s7+Bubfp6o7JI9wwjWUHP1Wf3+OV0vs8Z7hye9luoR5kGkRzfyQJIDofOaIqRaXUlO
 koYQlLNEqnMiNANCgw9zBV8Q4bxBpUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=wzx94/ir+kA9NB3suUBAiyU2K9Maf5LwjgVOrSpmywE=;
 b=gxey+57RYRPIGOYjR/tFpEok3f409SSyNkSmfcq/rIb7oQVzAvVmjef5RAGthbtd8Ipnw6Dwqu2mF
 tQhdBiVDg==
X-HalOne-Cookie: a18d742ed085c070426e8cb847bf0d5b334118a0
X-HalOne-ID: 9ba0001f-18e1-11ed-be83-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 9ba0001f-18e1-11ed-be83-d0431ea8bb03;
 Wed, 10 Aug 2022 19:21:17 +0000 (UTC)
Date: Wed, 10 Aug 2022 21:21:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/probe-helper: Add
 drm_connector_helper_get_modes_static()
Message-ID: <YvQFLF49qVpCj0l7@ravnborg.org>
References: <20220810112053.19547-1-tzimmermann@suse.de>
 <20220810112053.19547-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810112053.19547-2-tzimmermann@suse.de>
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
Cc: david@lechnology.com, emma@anholt.net, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kamlesh.gurudasani@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Aug 10, 2022 at 01:20:50PM +0200, Thomas Zimmermann wrote:
> Add drm_connector_helper_get_modes_static(), which duplicates a single
> display mode for a connector. Convert drivers.

I like this helper!
There are a lot of panels that can benefit from the same helper.

The current users that are replaced do not do so, but some panels also
set:

        connector->display_info.bpc = 8;
        connector->display_info.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
        drm_display_info_set_bus_formats(&connector->display_info, &bus_format, 1);

I looked at a similar helper for panels once, but for panels I stopped
there as we then had to pass bpc, bus_format and bus_mode as arguments.
Maybe that is over-engineering things.

Someone that knows when we must pass bpc, bus_mode, bus_flags and when
not can maybe help here.

The current helper is fine as is, but I wonder if we can cover more
use cases with an extra helper.

It would also be nice to convert the panels that can use the new helper,
but that should be in a new patch and can be done later.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

but I have a few comments in the following.

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c     | 20 +--------------
>  drivers/gpu/drm/drm_probe_helper.c | 40 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/repaper.c     | 16 +-----------
>  drivers/gpu/drm/tiny/simpledrm.c   | 18 +-------------
>  include/drm/drm_probe_helper.h     |  3 +++
>  5 files changed, 46 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 84abc3920b57..b67ec9a5cda9 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -415,26 +415,8 @@ EXPORT_SYMBOL(mipi_dbi_pipe_disable);
>  static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
> -	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_duplicate(connector->dev, &dbidev->mode);
> -	if (!mode) {
> -		DRM_ERROR("Failed to duplicate mode\n");
> -		return 0;
> -	}
> -
> -	if (mode->name[0] == '\0')
> -		drm_mode_set_name(mode);
> -
> -	mode->type |= DRM_MODE_TYPE_PREFERRED;
> -	drm_mode_probed_add(connector, mode);
> -
> -	if (mode->width_mm) {
> -		connector->display_info.width_mm = mode->width_mm;
> -		connector->display_info.height_mm = mode->height_mm;
> -	}
> -
> -	return 1;
> +	return drm_connector_helper_get_modes_static(connector, &dbidev->mode);
>  }
>  
>  static const struct drm_connector_helper_funcs mipi_dbi_connector_hfuncs = {
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index bb427c5a4f1f..809187377e4e 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1050,6 +1050,46 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
>  
> +/**
> + * drm_connector_helper_get_modes_static - Duplicates a display mode for a connector
The hw mode is duplicated so maybe name it ..._modes_hw()?

But I dunno.. Naming is hard.

> + * @connector: the connector
> + * @hw_mode: the display hardware's mode
> + *
> + * This function duplicates a display modes for a connector. Drivers for hardware
> + * that only supports a single mode can use this function in there connector's
                                                                their? 
> + * get_modes helper.
> + *
> + * Returns:
> + * The number of created modes.
> + */
> +int drm_connector_helper_get_modes_static(struct drm_connector *connector,
> +					  const struct drm_display_mode *hw_mode)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(dev, hw_mode);
> +	if (!mode) {
> +		drm_err(dev, "Failed to duplicate mode " DRM_MODE_FMT "\n",
> +			DRM_MODE_ARG(hw_mode));
> +		return 0;
> +	}
> +
> +	if (mode->name[0] == '\0')
> +		drm_mode_set_name(mode);
Hmm, so we rely that it was set to something relevant before. I guess
that's OK.
> +
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	if (mode->width_mm)
> +		connector->display_info.width_mm = mode->width_mm;
> +	if (mode->height_mm)
> +		connector->display_info.height_mm = mode->height_mm;
> +
> +	return 1;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_get_modes_static);
> +
>  /**
>   * drm_connector_helper_get_modes - Read EDID and update connector.
>   * @connector: The connector
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index c4c1be3ac0b8..855968fd46af 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -839,22 +839,8 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
>  static int repaper_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct repaper_epd *epd = drm_to_epd(connector->dev);
> -	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_duplicate(connector->dev, epd->mode);
> -	if (!mode) {
> -		DRM_ERROR("Failed to duplicate mode\n");
> -		return 0;
> -	}
> -
> -	drm_mode_set_name(mode);
> -	mode->type |= DRM_MODE_TYPE_PREFERRED;
> -	drm_mode_probed_add(connector, mode);
> -
> -	connector->display_info.width_mm = mode->width_mm;
> -	connector->display_info.height_mm = mode->height_mm;
> -
> -	return 1;
> +	return drm_connector_helper_get_modes_static(connector, epd->mode);
>  }
>  
>  static const struct drm_connector_helper_funcs repaper_connector_hfuncs = {
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index a81f91814595..2d5b56c4a77d 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -620,24 +620,8 @@ static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
>  static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
>  {
>  	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
> -	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
> -	if (!mode)
> -		return 0;
> -
> -	if (mode->name[0] == '\0')
> -		drm_mode_set_name(mode);
> -
> -	mode->type |= DRM_MODE_TYPE_PREFERRED;
> -	drm_mode_probed_add(connector, mode);
> -
> -	if (mode->width_mm)
> -		connector->display_info.width_mm = mode->width_mm;
> -	if (mode->height_mm)
> -		connector->display_info.height_mm = mode->height_mm;
> -
> -	return 1;
> +	return drm_connector_helper_get_modes_static(connector, &sdev->mode);
>  }
>  
>  static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 8075e02aa865..5a883ee9fc32 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -7,6 +7,7 @@
>  
>  struct drm_connector;
>  struct drm_device;
> +struct drm_display_mode;
>  struct drm_modeset_acquire_ctx;
>  
>  int drm_helper_probe_single_connector_modes(struct drm_connector
> @@ -27,6 +28,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
>  bool drm_kms_helper_is_poll_worker(void);
>  
>  int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
> +int drm_connector_helper_get_modes_static(struct drm_connector *connector,
> +					  const struct drm_display_mode *hw_mode);
>  int drm_connector_helper_get_modes(struct drm_connector *connector);
>  
>  #endif
> -- 
> 2.37.1
