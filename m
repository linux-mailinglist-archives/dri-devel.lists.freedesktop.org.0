Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00E829B82
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 14:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA9D10E309;
	Wed, 10 Jan 2024 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5E010E5E7;
 Wed, 10 Jan 2024 13:39:38 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B9B3D2FC0057;
 Wed, 10 Jan 2024 14:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1704893977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBr8Ca6T6pj462sAdOhvmla4yehDm43kFrOCFOhWR1Y=;
 b=gVo2F6g+ftVSYC2ja0jm3fxua0sVpmkTiKLfrSHyAOrY+XXctIu7qXUbkFlFlWXjqK/Fc1
 uYJro0xKbuZckVlyENB1J8JodhKUWjW/2AtMfinRHk3eeTLCMWYQjowChFgzx4Fn/cXsD7
 TYwdrGPxRaL43cqyTrME63S25KScnyE=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <adb11c46-aa5e-4389-8757-5bbc627eff69@tuxedocomputers.com>
Date: Wed, 10 Jan 2024 14:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
Content-Language: en-US
To: Andri Yngvason <andri@yngvason.is>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-3-andri@yngvason.is>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20240109181104.1670304-3-andri@yngvason.is>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 09.01.24 um 19:10 schrieb Andri Yngvason:
> From: Werner Sembach <wse@tuxedocomputers.com>
>
> Add a new general drm property "active color format" which can be used by
> graphic drivers to report the used color format back to userspace.
>
> There was no way to check which color format got actually used on a given
> monitor. To surely predict this, one must know the exact capabilities of
> the monitor, the GPU, and the connection used and what the default
> behaviour of the used driver is (e.g. amdgpu prefers YCbCr 4:4:4 while i915
> prefers RGB). This property helps eliminating the guessing on this point.
>
> In the future, automatic color calibration for screens might also depend on
> this information being available.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Tested-by: Andri Yngvason <andri@yngvason.is>

One suggestion from back then was, instead picking out singular properties like 
"active color format", to just expose whatever the last HDMI or DP metadata 
block(s)/frame(s) that was sent over the display wire was to userspace and 
accompanying it with a parsing script.

Question: Does the driver really actually know what the GPU is ultimatively 
sending out the wire, or is that decided by a final firmware blob we have no 
info about?

Greetings

Werner

> ---
>   drivers/gpu/drm/drm_connector.c | 63 +++++++++++++++++++++++++++++++++
>   include/drm/drm_connector.h     | 10 ++++++
>   2 files changed, 73 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index c3725086f4132..30d62e505d188 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1061,6 +1061,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
>   	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>   };
>   
> +static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
> +	{ 0, "not applicable" },
> +	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> +	{ DRM_COLOR_FORMAT_YCBCR444, "ycbcr444" },
> +	{ DRM_COLOR_FORMAT_YCBCR422, "ycbcr422" },
> +	{ DRM_COLOR_FORMAT_YCBCR420, "ycbcr420" },
> +};
> +
>   DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>   		 drm_dp_subconnector_enum_list)
>   
> @@ -1390,6 +1398,15 @@ static const u32 dp_colorspaces =
>    *	drm_connector_attach_max_bpc_property() to create and attach the
>    *	property to the connector during initialization.
>    *
> + * active color format:
> + *	This read-only property tells userspace the color format actually used
> + *	by the hardware display engine "on the cable" on a connector. The chosen
> + *	value depends on hardware capabilities, both display engine and
> + *	connected monitor. Drivers shall use
> + *	drm_connector_attach_active_color_format_property() to install this
> + *	property. Possible values are "not applicable", "rgb", "ycbcr444",
> + *	"ycbcr422", and "ycbcr420".
> + *
>    * Connectors also have one standardized atomic property:
>    *
>    * CRTC_ID:
> @@ -2451,6 +2468,52 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>   }
>   EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>   
> +/**
> + * drm_connector_attach_active_color_format_property - attach "active color format" property
> + * @connector: connector to attach active color format property on.
> + *
> + * This is used to check the applied color format on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_active_color_format_property(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->active_color_format_property) {
> +		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "active color format",
> +						drm_active_color_format_enum_list,
> +						ARRAY_SIZE(drm_active_color_format_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_color_format_property = prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_color_format_property);
> +
> +/**
> + * drm_connector_set_active_color_format_property - sets the active color format property for a
> + * connector
> + * @connector: drm connector
> + * @active_color_format: color format for the connector currently active "on the cable"
> + *
> + * Should be used by atomic drivers to update the active color format over a connector.
> + */
> +void drm_connector_set_active_color_format_property(struct drm_connector *connector,
> +						    u32 active_color_format)
> +{
> +	drm_object_property_set_value(&connector->base, connector->active_color_format_property,
> +				      active_color_format);
> +}
> +EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
> +
>   /**
>    * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>    * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f4..9ae73cfdceeb1 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1699,6 +1699,12 @@ struct drm_connector {
>   	 */
>   	struct drm_property *privacy_screen_hw_state_property;
>   
> +	/**
> +	 * @active_color_format_property: Default connector property for the
> +	 * active color format to be driven out of the connector.
> +	 */
> +	struct drm_property *active_color_format_property;
> +
>   #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>   #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>   #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -2053,6 +2059,10 @@ void drm_connector_attach_privacy_screen_provider(
>   	struct drm_connector *connector, struct drm_privacy_screen *priv);
>   void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>   
> +int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
> +void drm_connector_set_active_color_format_property(struct drm_connector *connector,
> +						    u32 active_color_format);
> +
>   /**
>    * struct drm_tile_group - Tile group metadata
>    * @refcount: reference count
