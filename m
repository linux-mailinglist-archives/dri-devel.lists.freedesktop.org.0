Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377308A6D6C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 16:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4368310F0CF;
	Tue, 16 Apr 2024 14:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6Lqod8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8610F0CF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713276587; x=1744812587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ojzOa7PwYri2Lph1vpvafrvjeVQgZz7o4ByRzv53LDQ=;
 b=S6Lqod8wk/H0CdQyh5LdJ/89c09gBwZFkYkUtUhrNWP1y4gafNVlIRax
 sI7F/w+Wx/duU5TlsaMd1Q2fbdNH8hjs7Sy5Y44igHPw448wS7TC4wslS
 y1o8xcHGb66aDt9F/aaTG79g/2ywigC7RUPlI+ea0VpstJDXe24UI/FyT
 DM+xpsHBmBKHKfda4JIPiTwiuZ1kNvHBMkpMUPxRGRDcgRhX/e8uThAC+
 kfjFO9V3z9PRKlAXYf9TTHjBWeAo4JGoJQLvcpEd3ujMDnnL2CZIDQ57x
 x2tnEGhxCj6/bduqiTb1mHu46FsO/Wjmh0l90FdQ/W1OjNPNoA9nuhicb A==;
X-CSE-ConnectionGUID: CrDrrwrrRqW5q3CuJOdX5A==
X-CSE-MsgGUID: iiGvdZBBS2aKN/L4ODUSvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9268391"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="9268391"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:09:46 -0700
X-CSE-ConnectionGUID: eAfTqTRwTKu5nLh4//PJXQ==
X-CSE-MsgGUID: i+B0PUP9T5awrB+Yrhqn2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22333147"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Apr 2024 07:09:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 16 Apr 2024 17:09:40 +0300
Date: Tue, 16 Apr 2024 17:09:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v11 19/28] drm/connector: hdmi: Add RGB Quantization
 Range to the connector state
Message-ID: <Zh6GpHL7k_mmsad_@intel.com>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
 <20240326-kms-hdmi-connector-state-v11-19-c5680ffcf261@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326-kms-hdmi-connector-state-v11-19-c5680ffcf261@kernel.org>
X-Patchwork-Hint: comment
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

On Tue, Mar 26, 2024 at 04:40:23PM +0100, Maxime Ripard wrote:
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  1 +
>  include/drm/drm_connector.h                     |  6 +++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index c844cbeb675b..e693fe51abf5 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -49,10 +49,37 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
>  		return NULL;
>  
>  	return &crtc_state->mode;
>  }
>  
> +static bool hdmi_is_full_range(const struct drm_connector *connector,
> +			       const struct drm_connector_state *conn_state)
> +{
> +	const struct drm_display_info *display = &connector->display_info;

We call this 'info' everywhere else.

> +	const struct drm_display_mode *mode =
> +		connector_state_get_mode(conn_state);
> +
> +	/*
> +	 * The Broadcast RGB property only applies to RGB format, and
> +	 * i915 just assumes limited range for YCbCr output, so let's
> +	 * just do the same.
> +	 */
> +	if (conn_state->hdmi.output_format != HDMI_COLORSPACE_RGB)
> +		return false;
> +
> +	if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
> +		return true;
> +
> +	if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
> +		return false;
> +
> +	if (!display->is_hdmi)
> +		return true;
> +
> +	return drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL ? true : false;

Pointless ?:

I'd probably use a switch statement to make
the whole thing a bit more clear.

I was pondering if we could also use this from i915. But
we'd have to turn the 'is_hdmi' part into a function
argument since we derive that from the current crtc state
rather than from the display info.

> +}
> +
>  static bool
>  sink_supports_format_bpc(const struct drm_connector *connector,
>  			 const struct drm_display_info *info,
>  			 const struct drm_display_mode *mode,
>  			 unsigned int format, unsigned int bpc)
> @@ -307,10 +334,12 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  		drm_atomic_get_new_connector_state(state, connector);
>  	const struct drm_display_mode *mode =
>  		connector_state_get_mode(new_conn_state);
>  	int ret;
>  
> +	new_conn_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_conn_state);
> +
>  	ret = hdmi_compute_config(connector, new_conn_state, mode);
>  	if (ret)
>  		return ret;
>  
>  	if (old_conn_state->hdmi.broadcast_rgb != new_conn_state->hdmi.broadcast_rgb ||
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3e57d98d8418..ec6c6beda5c9 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1145,10 +1145,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>  
>  	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
>  		drm_printf(p, "\tbroadcast_rgb=%s\n",
>  			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
> +		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
>  		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
>  		drm_printf(p, "\toutput_format=%s\n",
>  			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
>  		drm_printf(p, "\ttmds_char_rate=%llu\n", state->hdmi.tmds_char_rate);
>  	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a40eaf3a8ce4..f5e960e89de3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1068,10 +1068,16 @@ struct drm_connector_state {
>  		 * @broadcast_rgb: Connector property to pass the
>  		 * Broadcast RGB selection value.
>  		 */
>  		enum drm_hdmi_broadcast_rgb broadcast_rgb;
>  
> +		/**
> +		 * @is_full_range: Is the output supposed to use a full
> +		 * RGB Quantization Range or not?
> +		 */
> +		bool is_full_range;

I would say limited range is the exception so I would suggest
flagging that instead. Feels a bit weird to flag the normal
case. Maybe the name should also include 'rgb' to make it clear
it only applies to RGB.

> +
>  		/**
>  		 * @output_bpc: Bits per color channel to output.
>  		 */
>  		unsigned int output_bpc;
>  
> 
> -- 
> 2.44.0

-- 
Ville Syrjälä
Intel
