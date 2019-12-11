Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60411BA70
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BB86EB9C;
	Wed, 11 Dec 2019 17:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836056EB97
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576085833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xR6weN0dPzhdiP4s7K4pNxqWY79pDPIoVOCRyfrZEu4=;
 b=L9JBwNhcvX9m/CQrtigH8ejsGuY3C7mfhogMmjzUeYc1bCvp1m4tr3lzt0MGtR0RGzHCPe
 CWN4MUOh9AA2tjz2FAJZelJvCdlnKFKHsRRvbfEN9n1ewbRYMgnk9hQgB6INSxkZmcn+hr
 8F2pvQoORmjye24MU5XlyamV7EbrsKE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-OZTK3FoOMBSJ1Dz4kOfVfg-1; Wed, 11 Dec 2019 12:36:06 -0500
Received: by mail-wr1-f70.google.com with SMTP id 90so10644240wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 09:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xR6weN0dPzhdiP4s7K4pNxqWY79pDPIoVOCRyfrZEu4=;
 b=sjuwFpmpgiqCcOrTaS3rMKpynAybB0ESLRc+nOej1HnrR94p+w9JfmVzteHxefC5PE
 YcwMpjfZnQw39qrMy/GIj6ji4Ibvs0nkqUeY5F1rXaMqLeIbp6cNL6ZYKmGNg6ftM9pk
 54E5Bmq8UcKD+9sTQ6HamZmw66T2sAqLcgakdGearbf7Y8Zp3L/Qctbg2m9zz42QEugT
 mmc+skJ11mHDjf5F2JrAPOxRFOG+pDog/JXFGyD14AQvW0rJPPfPAF5X3HVMXqnwby/7
 uNdymR7q+tGsSVC9gYcSDIPOywPmFKpNjFxlH9LJ1A8MaJTkHz0vWXf1Y8YexzzHpBrS
 T+Lg==
X-Gm-Message-State: APjAAAUyR4ujRv8YjdyLCn8j77Va6XRxUFk6Pw1lvi3+eEYf4TpFehPL
 bK1THAGnNV7WcJWqZJexwPqjbdl7YUTuiOAsO7HKk/85xkXmlt7fO7WFPq/x7wDBhMzlIpnydEh
 WeIVbK1bLTyidDy59T4/QwMybWrjR
X-Received: by 2002:adf:8297:: with SMTP id 23mr929660wrc.379.1576085765383;
 Wed, 11 Dec 2019 09:36:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxe3ghoKVJ4QuEAa1mD9TA5f4zjdLFzPOzxNFwKVGCO3JvbDRixx9MRdZ3gPXMadXLTsdvp1g==
X-Received: by 2002:adf:8297:: with SMTP id 23mr929626wrc.379.1576085765027;
 Wed, 11 Dec 2019 09:36:05 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id z185sm3031352wmg.20.2019.12.11.09.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 09:36:03 -0800 (PST)
Subject: Re: [PATCH v3 12/13] drm/connector: Split out orientation quirk
 detection (v2)
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20191118155134.30468-1-hdegoede@redhat.com>
 <20191118155134.30468-12-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fec29533-73ad-17c1-c842-02a6f14a991d@redhat.com>
Date: Wed, 11 Dec 2019 18:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118155134.30468-12-hdegoede@redhat.com>
Content-Language: en-US
X-MC-Unique: OZTK3FoOMBSJ1Dz4kOfVfg-1
X-Mimecast-Spam-Score: 0
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Can I get a review or Acked-by from someone for this patch please?

The other patches in this series all have acks and it would be nice if
I can push this to drm-misc-next...

Regards,

Hans

On 18-11-2019 16:51, Hans de Goede wrote:
> From: Derek Basehore <dbasehore@chromium.org>
> 
> Not every platform needs quirk detection for panel orientation, so
> split the drm_connector_init_panel_orientation_property into two
> functions. One for platforms without the need for quirks, and the
> other for platforms that need quirks.
> 
> Hans de Goede (changes in v2):
> 
> Rename the function from drm_connector_init_panel_orientation_property
> to drm_connector_set_panel_orientation[_with_quirk] and pass in the
> panel-orientation to set.
> 
> Beside the rename, also make the function set the passed in value
> only once, if the value was set before (to a value other then
> DRM_MODE_PANEL_ORIENTATION_UNKNOWN) make any further set calls a no-op.
> 
> This change is preparation for allowing the user to override the
> panel-orientation for any connector from the kernel commandline.
> When the panel-orientation is overridden this way, then we must ignore
> the panel-orientation detection done by the driver.
> 
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/gpu/drm/drm_connector.c         | 74 ++++++++++++++++++-------
>   drivers/gpu/drm/i915/display/icl_dsi.c  |  5 +-
>   drivers/gpu/drm/i915/display/intel_dp.c |  9 ++-
>   drivers/gpu/drm/i915/display/vlv_dsi.c  |  5 +-
>   include/drm/drm_connector.h             |  9 ++-
>   5 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 4c766624b20d..40a985c411a6 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1114,7 +1114,8 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>    *	coordinates, so if userspace rotates the picture to adjust for
>    *	the orientation it must also apply the same transformation to the
>    *	touchscreen input coordinates. This property is initialized by calling
> - *	drm_connector_init_panel_orientation_property().
> + *	drm_connector_set_panel_orientation() or
> + *	drm_connector_set_panel_orientation_with_quirk()
>    *
>    * scaling mode:
>    *	This property defines how a non-native mode is upscaled to the native
> @@ -1986,38 +1987,41 @@ void drm_connector_set_vrr_capable_property(
>   EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>   
>   /**
> - * drm_connector_init_panel_orientation_property -
> - *	initialize the connecters panel_orientation property
> - * @connector: connector for which to init the panel-orientation property.
> - * @width: width in pixels of the panel, used for panel quirk detection
> - * @height: height in pixels of the panel, used for panel quirk detection
> + * drm_connector_set_panel_orientation - sets the connecter's panel_orientation
> + * @connector: connector for which to set the panel-orientation property.
> + * @panel_orientation: drm_panel_orientation value to set
> + *
> + * This function sets the connector's panel_orientation and attaches
> + * a "panel orientation" property to the connector.
>    *
> - * This function should only be called for built-in panels, after setting
> - * connector->display_info.panel_orientation first (if known).
> + * Calling this function on a connector where the panel_orientation has
> + * already been set is a no-op (e.g. the orientation has been overridden with
> + * a kernel commandline option).
>    *
> - * This function will check for platform specific (e.g. DMI based) quirks
> - * overriding display_info.panel_orientation first, then if panel_orientation
> - * is not DRM_MODE_PANEL_ORIENTATION_UNKNOWN it will attach the
> - * "panel orientation" property to the connector.
> + * It is allowed to call this function with a panel_orientation of
> + * DRM_MODE_PANEL_ORIENTATION_UNKNOWN, in which case it is a no-op.
>    *
>    * Returns:
>    * Zero on success, negative errno on failure.
>    */
> -int drm_connector_init_panel_orientation_property(
> -	struct drm_connector *connector, int width, int height)
> +int drm_connector_set_panel_orientation(
> +	struct drm_connector *connector,
> +	enum drm_panel_orientation panel_orientation)
>   {
>   	struct drm_device *dev = connector->dev;
>   	struct drm_display_info *info = &connector->display_info;
>   	struct drm_property *prop;
> -	int orientation_quirk;
>   
> -	orientation_quirk = drm_get_panel_orientation_quirk(width, height);
> -	if (orientation_quirk != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> -		info->panel_orientation = orientation_quirk;
> +	/* Already set? */
> +	if (info->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> +		return 0;
>   
> -	if (info->panel_orientation == DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> +	/* Don't attach the property if the orientation is unknown */
> +	if (panel_orientation == DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
>   		return 0;
>   
> +	info->panel_orientation = panel_orientation;
> +
>   	prop = dev->mode_config.panel_orientation_property;
>   	if (!prop) {
>   		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> @@ -2034,7 +2038,37 @@ int drm_connector_init_panel_orientation_property(
>   				   info->panel_orientation);
>   	return 0;
>   }
> -EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
> +EXPORT_SYMBOL(drm_connector_set_panel_orientation);
> +
> +/**
> + * drm_connector_set_panel_orientation_with_quirk -
> + *	set the connecter's panel_orientation after checking for quirks
> + * @connector: connector for which to init the panel-orientation property.
> + * @panel_orientation: drm_panel_orientation value to set
> + * @width: width in pixels of the panel, used for panel quirk detection
> + * @height: height in pixels of the panel, used for panel quirk detection
> + *
> + * Like drm_connector_set_panel_orientation(), but with a check for platform
> + * specific (e.g. DMI based) quirks overriding the passed in panel_orientation.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_set_panel_orientation_with_quirk(
> +	struct drm_connector *connector,
> +	enum drm_panel_orientation panel_orientation,
> +	int width, int height)
> +{
> +	int orientation_quirk;
> +
> +	orientation_quirk = drm_get_panel_orientation_quirk(width, height);
> +	if (orientation_quirk != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> +		panel_orientation = orientation_quirk;
> +
> +	return drm_connector_set_panel_orientation(connector,
> +						   panel_orientation);
> +}
> +EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>   
>   int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>   				    struct drm_property *property,
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index 6e398c33a524..8cd51cf67d02 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1536,9 +1536,8 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
>   
>   	connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>   
> -	connector->base.display_info.panel_orientation =
> -			intel_dsi_get_panel_orientation(connector);
> -	drm_connector_init_panel_orientation_property(&connector->base,
> +	drm_connector_set_panel_orientation_with_quirk(&connector->base,
> +				intel_dsi_get_panel_orientation(connector),
>   				connector->panel.fixed_mode->hdisplay,
>   				connector->panel.fixed_mode->vdisplay);
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 9b15ac4f2fb6..7be7a55f8772 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7091,9 +7091,12 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>   	intel_connector->panel.backlight.power = intel_edp_backlight_power;
>   	intel_panel_setup_backlight(connector, pipe);
>   
> -	if (fixed_mode)
> -		drm_connector_init_panel_orientation_property(
> -			connector, fixed_mode->hdisplay, fixed_mode->vdisplay);
> +	if (fixed_mode) {
> +		/* We do not know the orientation, but their might be a quirk */
> +		drm_connector_set_panel_orientation_with_quirk(connector,
> +				DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
> +				fixed_mode->hdisplay, fixed_mode->vdisplay);
> +	}
>   
>   	return true;
>   
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index a71b22bdd95b..fbb9b942ed90 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1632,10 +1632,9 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
>   
>   		connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>   
> -		connector->base.display_info.panel_orientation =
> -			vlv_dsi_get_panel_orientation(connector);
> -		drm_connector_init_panel_orientation_property(
> +		drm_connector_set_panel_orientation_with_quirk(
>   				&connector->base,
> +				vlv_dsi_get_panel_orientation(connector),
>   				connector->panel.fixed_mode->hdisplay,
>   				connector->panel.fixed_mode->vdisplay);
>   	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3fbcf7d3fcaf..f7f02f58f5a7 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1547,8 +1547,13 @@ void drm_connector_set_link_status_property(struct drm_connector *connector,
>   					    uint64_t link_status);
>   void drm_connector_set_vrr_capable_property(
>   		struct drm_connector *connector, bool capable);
> -int drm_connector_init_panel_orientation_property(
> -	struct drm_connector *connector, int width, int height);
> +int drm_connector_set_panel_orientation(
> +	struct drm_connector *connector,
> +	enum drm_panel_orientation panel_orientation);
> +int drm_connector_set_panel_orientation_with_quirk(
> +	struct drm_connector *connector,
> +	enum drm_panel_orientation panel_orientation,
> +	int width, int height);
>   int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>   					  int min, int max);
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
