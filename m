Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C982EDFF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 12:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992D10E47F;
	Tue, 16 Jan 2024 11:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6469010E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705405360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bo6gf18SH2bL+TPE+r/3plO3SeDnpw86MGw5k0EPWSY=;
 b=VuqY3lquW9QNj7ceA9cOEduZNrxzyk02SvaUQ4T3LN/1/0/qsyXgH0QPcpKzkPQ0NUdKTz
 zESRdsts9+QhB8eaz5KYARjypOAqkUxeS2UZ3sIyj7czoSYi+pK6GNeQPJYk+Pm6xUKFFR
 +D19gQfEI6byqBCibj6Czr/UG1GX1kw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-A4tNxv09P6SoTdeqZqtdvg-1; Tue, 16 Jan 2024 06:42:39 -0500
X-MC-Unique: A4tNxv09P6SoTdeqZqtdvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e6668d9e1so29636155e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 03:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705405358; x=1706010158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bo6gf18SH2bL+TPE+r/3plO3SeDnpw86MGw5k0EPWSY=;
 b=r2TkeySSMVa4Z17dyCUgpuINHRavNBWQsVv7BQpYXjJYsIg6r/G9PLAsb9jwgxhgAO
 4dQr0vegHCbUX0LiAfSu0YUWeXtcHf964YExY3b+4jlbcOAs+trohdhdV4/A7kX0i3Ae
 3aTrn8V0pGlqP28IQ8yedhPybhKr2phlNsykgJgt8cV1bKUjlQxEqq0KZhqZT3nLNP13
 sU+8F/NmLIJthkZdhkhLaf7PjvksWF1AiEDCCrb0ABJASbUqWS6c/8CBZ5ZMxgCFB0/O
 iV0hUqWugkRhuoWvnKlPya9RcT5Zmx46goLm0clIf3X6NGOF8WIJ0+n1IVQgbeD6b4ht
 Zo6w==
X-Gm-Message-State: AOJu0Yzy2o4eK34CDvqpo7Z8hVFzuQ0lTHTNJ64kW0ectFvwdB0oYwCM
 dLd1Pf8ugu1GhMoIqnXVnwbVx+6MWzIdvEMgoAqCjWvmWZjJ6w8Esgp6i+cat1dD46VKFZqUE8o
 QxXpM5I0tACpoDwkl9rnsVnbY4fHufAU7HHjt
X-Received: by 2002:a05:600c:474f:b0:40e:6ea5:cee5 with SMTP id
 w15-20020a05600c474f00b0040e6ea5cee5mr2442062wmo.29.1705405358337; 
 Tue, 16 Jan 2024 03:42:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH76WWyVg2QBb+mBb5+P7gGuQHXsDv4635EvKWqzGC4Q5n1eMvxyc+SOOLkzznXOirB3N1WpA==
X-Received: by 2002:a05:600c:474f:b0:40e:6ea5:cee5 with SMTP id
 w15-20020a05600c474f00b0040e6ea5cee5mr2442039wmo.29.1705405357958; 
 Tue, 16 Jan 2024 03:42:37 -0800 (PST)
Received: from toolbox ([2001:9e8:89b3:b200:db6a:6268:cfcb:644d])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b0040d5f466deesm18926543wmq.38.2024.01.16.03.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 03:42:37 -0800 (PST)
Date: Tue, 16 Jan 2024 12:42:35 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property
 as setting for userspace
Message-ID: <20240116114235.GA311990@toolbox>
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
MIME-Version: 1.0
In-Reply-To: <20240115160554.720247-3-andri@yngvason.is>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Werner Sembach <wse@tuxedocomputers.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote:
> From: Werner Sembach <wse@tuxedocomputers.com>
> 
> Add a new general drm property "force color format" which can be used
> by userspace to tell the graphics driver which color format to use.

I don't like the "force" in the name. This just selects the color
format, let's just call it "color format" then.

> Possible options are:
>     - auto (default/current behaviour)
>     - rgb
>     - ycbcr444
>     - ycbcr422 (supported by neither amdgpu or i915)
>     - ycbcr420
> 
> In theory the auto option should choose the best available option for the
> current setup, but because of bad internal conversion some monitors look
> better with rgb and some with ycbcr444.
> 
> Also, because of bad shielded connectors and/or cables, it might be
> preferable to use the less bandwidth heavy ycbcr422 and ycbcr420 formats
> for a signal that is less susceptible to interference.
> 
> In the future, automatic color calibration for screens might also depend on
> this option being available.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Tested-by: Andri Yngvason <andri@yngvason.is>
> ---
> 
> Changes in v2:
>  - Renamed to "force color format" from "preferred color format"
>  - Removed Reported-by pointing to invalid email address
> 
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>  drivers/gpu/drm/drm_connector.c     | 48 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 16 ++++++++++
>  4 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 39ef0a6addeba..1dabd164c4f09 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -707,6 +707,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			if (old_connector_state->max_requested_bpc !=
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed = true;
> +
> +			if (old_connector_state->force_color_format !=
> +			    new_connector_state->force_color_format)
> +				new_crtc_state->connectors_changed = true;
>  		}
>  
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d49..e45949bf4615f 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->max_requested_bpc = val;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
> +	} else if (property == connector->force_color_format_property) {
> +		state->force_color_format = val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -859,6 +861,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->max_requested_bpc;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
> +	} else if (property == connector->force_color_format_property) {
> +		*val = state->force_color_format;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae9..e0535e58b4535 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1061,6 +1061,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
>  	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>  };
>  
> +static const struct drm_prop_enum_list drm_force_color_format_enum_list[] = {
> +	{ 0, "auto" },
> +	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> +	{ DRM_COLOR_FORMAT_YCBCR444, "ycbcr444" },
> +	{ DRM_COLOR_FORMAT_YCBCR422, "ycbcr422" },
> +	{ DRM_COLOR_FORMAT_YCBCR420, "ycbcr420" },
> +};
> +
>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>  		 drm_dp_subconnector_enum_list)
>  
> @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * force color format:
> + *	This property is used by userspace to change the used color format. When
> + *	used the driver will use the selected format if valid for the hardware,

All properties are always "used", they just can have different values.
You probably want to talk about the auto mode here.

> + *	sink, and current resolution and refresh rate combination. Drivers to

If valid? So when a value is not actually supported user space can still
set it? What happens then? How should user space figure out if the
driver and the sink support the format?

For the Colorspace prop, the kernel just exposes all formats it supports
(independent of the sink) and then makes it the job of user space to
figure out if the sink supports it.

The same could be done here. Property value is exposed if the driver
supports it in general, commits can fail if the driver can't support it
for a specific commit because e.g. the resolution or refresh rate. User
space must look at the EDID/DisplayID/mode to figure out the supported
format for the sink.

> + *	use the function drm_connector_attach_force_color_format_property()
> + *	to create and attach the property to the connector during
> + *	initialization. Possible values are "auto", "rgb", "ycbcr444",
> + *	"ycbcr422", and "ycbcr420".
> + *
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2457,6 +2474,37 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>  
> +/**
> + * drm_connector_attach_force_color_format_property - attach "force color format" property
> + * @connector: connector to attach force color format property on.
> + *
> + * This is used to add support for selecting a color format on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_force_color_format_property(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->force_color_format_property) {
> +		prop = drm_property_create_enum(dev, 0, "force color format",
> +						drm_force_color_format_enum_list,
> +						ARRAY_SIZE(drm_force_color_format_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->force_color_format_property = prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->force_color_format = 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_force_color_format_property);
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f4..9830e7c09c0ba 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1026,6 +1026,14 @@ struct drm_connector_state {
>  	 */
>  	enum drm_privacy_screen_status privacy_screen_sw_state;
>  
> +	/**
> +	 * @force_color_format: Property set by userspace to tell the GPU
> +	 * driver which color format to use. It only gets applied if hardware,
> +	 * meaning both the computer and the monitor, and the driver support the
> +	 * given format at the current resolution and refresh rate.
> +	 */
> +	u32 force_color_format;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1699,6 +1707,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *privacy_screen_hw_state_property;
>  
> +	/**
> +	 * @force_color_format_property: Default connector property for the
> +	 * force color format to be driven out of the connector.
> +	 */
> +	struct drm_property *force_color_format_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -2053,6 +2067,8 @@ void drm_connector_attach_privacy_screen_provider(
>  	struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>  
> +int drm_connector_attach_force_color_format_property(struct drm_connector *connector);
> +
>  /**
>   * struct drm_tile_group - Tile group metadata
>   * @refcount: reference count
> -- 
> 2.43.0
> 

