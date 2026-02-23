Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMHGJ6l9nGm6IQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:17:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D89F17991C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DAB10E3D9;
	Mon, 23 Feb 2026 16:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddmyODij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451FE10E167;
 Mon, 23 Feb 2026 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771863460; x=1803399460;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aOP5WIIIx6jXIgIj8fQMjIWqluDLQWnoK9OZpu0pAUA=;
 b=ddmyODijzubpkvS8B4GXP3bDhz6+cTMSL5fNHvx5CEfeQ0/sjCgDFMkq
 2nBOOGMESzDAOpgKtmIagfsfVJDWMq46PCR0q72bv9iKwv3B3cuBjowXL
 m3FGuJMlZPbkUPMBfEg0/sdtdszh6wHxSvkCvUAHn+qW1PaKo1DZLmtn+
 Z8M3vHThwNnOeNiRhDHc7QaxicYrW60tZMi3BAQ1EoQFNN5Uz5slNUDhB
 s183Rx2pfeegjxPGokCXRALOE1P0vqeOb/XwBluLgGWbtrdIZoUrKNm8v
 3GQnhcV3GMr+d8ib1EER31sTDh1va7d7vYnI9Drki9Tmd9+kGlNm3zP4v g==;
X-CSE-ConnectionGUID: hQ5uza29QWexf1kzbwByQA==
X-CSE-MsgGUID: at+TU5dpSoercxK29VLdcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72964232"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72964232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:17:38 -0800
X-CSE-ConnectionGUID: s+T+PQQsT0SyyRAKA4P4zw==
X-CSE-MsgGUID: bqNmgWIJTXepephYLIEsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215752862"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:17:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Andri Yngvason <andri@yngvason.is>,
 Werner Sembach <wse@tuxedocomputers.com>, Marius Vlad
 <marius.vlad@collabora.com>
Subject: Re: [PATCH v8 02/20] drm: Add new general DRM property "color format"
In-Reply-To: <20260216-color-format-v8-2-5722ce175dd5@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-2-5722ce175dd5@collabora.com>
Date: Mon, 23 Feb 2026 18:17:23 +0200
Message-ID: <3b5e5af4219671c5b4ffdcb09bd22679332244ac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxedocomputers.com:email,intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,yngvason.is:email]
X-Rspamd-Queue-Id: 4D89F17991C
X-Rspamd-Action: no action

On Mon, 16 Feb 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> From: Andri Yngvason <andri@yngvason.is>
>
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
>
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
>
> Drivers should advertise from this list which formats they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  11 +++
>  drivers/gpu/drm/drm_connector.c     | 150 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 116 ++++++++++++++++++++++++++--
>  4 files changed, 277 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d422f79b96db..d7e902ce5d2d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			if (old_connector_state->max_requested_bpc !=
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed = true;
> +
> +			if (old_connector_state->color_format !=
> +			    new_connector_state->color_format)
> +				new_crtc_state->connectors_changed = true;
> +
>  		}
>  
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index dc013a22bf26..907dd3374533 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -931,6 +931,15 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->privacy_screen_sw_state = val;
>  	} else if (property == connector->broadcast_rgb_property) {
>  		state->hdmi.broadcast_rgb = val;
> +	} else if (property == connector->color_format_property) {
> +		if (val >= DRM_COLOR_FORMAT_ENUM_NUM) {
> +			drm_dbg_atomic(connector->dev,
> +				       "[CONNECTOR:%d:%s] unknown color format %llu\n",
> +				       connector->base.id, connector->name, val);
> +			return -EINVAL;
> +		}
> +
> +		state->color_format = val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -1016,6 +1025,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->privacy_screen_sw_state;
>  	} else if (property == connector->broadcast_rgb_property) {
>  		*val = state->hdmi.broadcast_rgb;
> +	} else if (property == connector->color_format_property) {
> +		*val = state->color_format;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index aec05adbc889..4d85add60d92 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1359,6 +1359,32 @@ static const char * const colorspace_names[] = {
>  	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
>  };
>  
> +/**
> + * drm_get_color_format_name - return a string for color format
> + * @color_fmt: color format to return the name of
> + *
> + * Returns a string constant matching the format's name, or NULL if no match
> + * is found.
> + */
> +const char *drm_get_color_format_name(enum drm_color_format_enum color_fmt)
> +{
> +	switch (color_fmt) {
> +	case DRM_COLOR_FORMAT_ENUM_AUTO:
> +		return "AUTO";
> +	case DRM_COLOR_FORMAT_ENUM_RGB444:
> +		return "RGB";
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR444:
> +		return "YUV 4:4:4";
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR422:
> +		return "YUV 4:2:2";
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR420:
> +		return "YUV 4:2:0";
> +	default:
> +		return NULL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_get_color_format_name);
> +
>  /**
>   * drm_get_colorspace_name - return a string for color encoding
>   * @colorspace: color space to compute name of
> @@ -1388,6 +1414,20 @@ static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
>  	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
>  
> +/* already bit-shifted */
> +static const u32 hdmi_colorformats =
> +	DRM_COLOR_FORMAT_RGB444 |
> +	DRM_COLOR_FORMAT_YCBCR444 |
> +	DRM_COLOR_FORMAT_YCBCR422 |
> +	DRM_COLOR_FORMAT_YCBCR420;
> +
> +/* already bit-shifted */
> +static const u32 dp_colorformats =
> +	DRM_COLOR_FORMAT_RGB444 |
> +	DRM_COLOR_FORMAT_YCBCR444 |
> +	DRM_COLOR_FORMAT_YCBCR422 |
> +	DRM_COLOR_FORMAT_YCBCR420;
> +
>  /*
>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
>   * Format Table 2-120
> @@ -2649,6 +2689,97 @@ int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>  
> +/**
> + * drm_mode_create_color_format_property - create color format property
> + * @connector: connector to create the color format property on
> + * @supported_color_formats: bitmask of &enum drm_color_format values the
> + *                           connector supports
> + *
> + * Called by a driver to create a color format property. Must be attached to
> + * the desired connector afterwards.
> + *
> + * @supported_color_formats should only include color formats the connector
> + * type can actually support.
> + *
> + * Returns:
> + * 0 on success, negative errno on error
> + */
> +int drm_mode_create_color_format_property(struct drm_connector *connector,
> +					  u32 supported_color_formats)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_prop_enum_list enum_list[DRM_COLOR_FORMAT_ENUM_NUM];
> +	enum drm_color_format_enum fmt_e;
> +	unsigned int len = 1;
> +	unsigned int i = 1;
> +	u32 fmt;
> +
> +	if (connector->color_format_property)
> +		return 0;
> +
> +	if (!supported_color_formats) {
> +		drm_err(dev, "No supported color formats provided on [CONNECTOR:%d:%s]\n",
> +			connector->base.id, connector->name);
> +		return -EINVAL;
> +	}
> +
> +	if (supported_color_formats & ~DRM_COLOR_FORMAT_ALL) {
> +		drm_err(dev, "Unknown color formats provided on [CONNECTOR:%d:%s]\n",
> +			connector->base.id, connector->name);
> +		return -EINVAL;
> +	}
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_HDMIA:
> +	case DRM_MODE_CONNECTOR_HDMIB:
> +		if (supported_color_formats & ~hdmi_colorformats) {
> +			drm_err(dev, "Color formats not allowed for HDMI on [CONNECTOR:%d:%s]\n",
> +				connector->base.id, connector->name);
> +			return -EINVAL;
> +		}
> +		break;
> +	case DRM_MODE_CONNECTOR_DisplayPort:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		if (supported_color_formats & ~dp_colorformats) {
> +			drm_err(dev, "Color formats not allowed for DP on [CONNECTOR:%d:%s]\n",
> +				connector->base.id, connector->name);
> +			return -EINVAL;
> +		}
> +		break;
> +	}
> +
> +	enum_list[0].name = drm_get_color_format_name(DRM_COLOR_FORMAT_ENUM_AUTO);
> +	enum_list[0].type = DRM_COLOR_FORMAT_ENUM_AUTO;
> +
> +	while (supported_color_formats) {

Please consider making supported_color_formats an unsigned long, and
using for_each_set_bit(). It makes everything below much easier.

> +		fmt = BIT(i - 1);
> +		if (supported_color_formats & fmt) {
> +			supported_color_formats ^= fmt;
> +			fmt_e = drm_color_format_to_enum(fmt);

This function doesn't exist yet, breaking bisectability. But I think
this idea of two "domains" for color format is getting out of hand. See
comments below. IMO drm_color_format_to_enum() should not be added
anyway.

I think the right option is to only use the enums, and then use those as
bit numbers where masks are needed.

> +			if (fmt_e != DRM_COLOR_FORMAT_ENUM_INVALID) {
> +				enum_list[len].name = drm_get_color_format_name(fmt_e);
> +				enum_list[len].type = fmt_e;
> +				len++;
> +			} else {
> +				drm_warn(dev,
> +					 "Unknown supported format 0x%x on [CONNECTOR:%d:%s]\n",
> +					 fmt, connector->base.id, connector->name);
> +			}

This is just unnecessary complications from the two domains.

> +		}
> +		i++;
> +	}
> +
> +	connector->color_format_property =
> +		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
> +					 enum_list, len);
> +
> +	if (!connector->color_format_property)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_color_format_property);
> +
>  /**
>   * drm_mode_create_dp_colorspace_property - create dp colorspace property
>   * @connector: connector to create the Colorspace property on.
> @@ -2866,6 +2997,25 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>  
> +/**
> + * drm_connector_attach_color_format_property - attach "force color format" property
> + * @connector: connector to attach force color format property on.
> + *
> + * This is used to add support for selecting a color format on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_color_format_property(struct drm_connector *connector)
> +{
> +	struct drm_property *prop = connector->color_format_property;
> +
> +	drm_object_attach_property(&connector->base, prop, DRM_COLOR_FORMAT_ENUM_AUTO);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_color_format_property);
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index c18be8c19de0..18bd875b6918 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -556,6 +556,97 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
>  
> +/**
> + * enum drm_color_format_enum - color model description
> + *
> + * This enum is a high-level description of the component makeup of the image
> + * data. It says nothing about how the components are ordered or how many bits
> + * they take up (i.e. is unlike MEDIA_BUS_FMT\_ or DRM_FORMAT\_), but
> + * describes the type of components (Luminance-Chrominance vs. RGB) and the
> + * sub-sampling.
> + *
> + * &enum drm_color_format_enum makes statements about the same attribute of
> + * an image as the DRM_COLOR_FORMAT\_ bitfields do. Its purpose is to inform
> + * choices made by display protocol specific implementations when it comes to
> + * translating it to e.g. &enum hdmi_colorspace or &enum dp_pixelformat, both
> + * of which also describe the same attribute of the image at the same level of
> + * specificity.
> + *
> + * In precise terms, this enum describes a color model. It makes no statements
> + * about the primaries, gamma, or current phase of the moon used in conversion
> + * from one to the other. Furthermore, it also makes no statements about the
> + * order of components (e.g. RGB vs. BGR), their depth in bits, or their binary
> + * packing.
> + */
> +enum drm_color_format_enum {

The enum name should not have "enum" in it. That's just not a style
that's being used.

> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_AUTO: The choice of format is left up to the
> +	 * display protocol implementation. All implementations of the same
> +	 * display protocol (e.g. HDMI) are supposed to behave the same way,
> +	 * though display protocols may choose to behave differently compared to
> +	 * each other (e.g. HDMI's "AUTO" does not have to match DP's "AUTO").
> +	 *
> +	 * Implementations may rely on @DRM_COLOR_FORMAT_ENUM_AUTO to be falsy.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_AUTO = 0,

Ditto for the enumeration names, no ENUM in them please.

> +
> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_RGB444: Image components are encoded as RGB
> +	 * values of equal resolution.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_RGB444,
> +
> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_YCBCR444: Image components are encoded as
> +	 * luminance and chrominance of equal resolution.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_YCBCR444,
> +
> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_YCBCR422: Image components are encoded as
> +	 * luminance and chrominance with the chrominance components having half
> +	 * the horizontal resolution.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_YCBCR422,
> +
> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_YCBCR420: Image components are encoded as
> +	 * luminance and chrominance with the chrominance components having half
> +	 * the horizontal and vertical resolution.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_YCBCR420,
> +
> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_NUM: The number of valid color format values
> +	 * in this enum. Itself not a valid color format.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_NUM,
> +
> +	/**
> +	 * @DRM_COLOR_FORMAT_ENUM_INVALID: Error return value for conversion
> +	 * functions encountering unexpected inputs.
> +	 */
> +	DRM_COLOR_FORMAT_ENUM_INVALID = -EINVAL,

Please don't hide negative error codes inside enums. If you need to
return one from a function, please return the negative error code
directly instead.

> +};
> +
> +/*
> + * Constants for specifying bit masks for e.g. providing a list of supported
> + * color formats as a single integer.
> + */
> +#define DRM_COLOR_FORMAT_RGB444		BIT(0)
> +#define DRM_COLOR_FORMAT_YCBCR444	BIT(1)
> +#define DRM_COLOR_FORMAT_YCBCR422	BIT(2)
> +#define DRM_COLOR_FORMAT_YCBCR420	BIT(3)

I don't think we should define both enum and mask. One or the
other. Moreover, now you have two independent definitions for the same
thing, with nothing to ensure they keep matching. It's a bug waiting to
happen.

I think the problem is that they were originally defined as bits even
though most places actually use them as single values only. It's
confusing. It would probably have been better to just use enums and
BIT(DRM_COLOR_FORMAT_*) where a mask is needed.

Maybe that's what should be done as the first step anyway.

> +
> +/*
> + * Mask of all DRM_COLOR_FORMAT\_ constants. When adding new color formats,
> + * they must be part of this define.
> + */
> +#define DRM_COLOR_FORMAT_ALL	(DRM_COLOR_FORMAT_RGB444   | \
> +				 DRM_COLOR_FORMAT_YCBCR444 | \
> +				 DRM_COLOR_FORMAT_YCBCR422 | \
> +				 DRM_COLOR_FORMAT_YCBCR420)
> +
>  /**
>   * enum drm_bus_flags - bus_flags info for &drm_display_info
>   *
> @@ -699,11 +790,6 @@ struct drm_display_info {
>  	 */
>  	enum subpixel_order subpixel_order;
>  
> -#define DRM_COLOR_FORMAT_RGB444		(1<<0)
> -#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
> -#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
> -#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
> -
>  	/**
>  	 * @panel_orientation: Read only connector property for built-in panels,
>  	 * indicating the orientation of the panel vs the device's casing.
> @@ -1107,6 +1193,13 @@ struct drm_connector_state {
>  	 */
>  	enum drm_colorspace colorspace;
>  
> +	/**
> +	 * @color_format: State variable for Connector property to request
> +	 * color format change on Sink. This is most commonly used to switch
> +	 * between RGB to YUV and vice-versa.
> +	 */
> +	enum drm_color_format_enum color_format;
> +
>  	/**
>  	 * @writeback_job: Writeback job for writeback connectors
>  	 *
> @@ -2105,6 +2198,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *colorspace_property;
>  
> +	/**
> +	 * @color_format_property: Connector property to set the suitable
> +	 * color format supported by the sink.
> +	 */
> +	struct drm_property *color_format_property;
> +
>  	/**
>  	 * @path_blob_ptr:
>  	 *
> @@ -2507,6 +2606,9 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
>  int drm_mode_create_content_type_property(struct drm_device *dev);
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
>  
> +int drm_mode_create_color_format_property(struct drm_connector *connector,
> +					  u32 supported_color_formats);
> +
>  int drm_connector_set_path_property(struct drm_connector *connector,
>  				    const char *path);
>  int drm_connector_set_tile_property(struct drm_connector *connector);
> @@ -2588,6 +2690,10 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
>  					struct drm_encoder *encoder);
>  const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
>  
> +int drm_connector_attach_color_format_property(struct drm_connector *connector);
> +
> +const char *drm_get_color_format_name(enum drm_color_format_enum color_fmt);
> +
>  /**
>   * drm_for_each_connector_iter - connector_list iterator macro
>   * @connector: &struct drm_connector pointer used as cursor

-- 
Jani Nikula, Intel
