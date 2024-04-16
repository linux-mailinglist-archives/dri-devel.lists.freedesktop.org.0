Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018558A6CCA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21C210F967;
	Tue, 16 Apr 2024 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8DGBmgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB26610F0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713275465; x=1744811465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0w4Qc7WXMLbaRzifUCliR1koxDw/02VJz+GXV0lhkDc=;
 b=g8DGBmgMlBqfJTeP0sSOktZeWZ5BqBKVB22+5sdDKakNn1HIp++/n1oS
 dJWgVfbrgZVoXk31bjhLbeM5xHJe1HNPa+xlIcpV0MU/I7QfgsZ/E2j95
 XFuH96eBLVcmnuMjMNKV989RldtuWocXmnP2GhoCCAZBBcc2XkGdKZCoW
 qyfhiUsKSg1mGFIlab5sUPIW5p/JTrSWTpfMjUQW8zINvoNUZggiUrrPQ
 9HDMKG5AM6s38kXVy8wn1jytbrK/aS57iIx06OJJDdOegp1dRhFp0bbub
 jbYYXZ+1DWtaBoKG3ZpxtkcjltwVCSfuejPldulUAHUgrxYdLMGDQhOLe g==;
X-CSE-ConnectionGUID: iu5WV4ShTPmxbYbY92xfLQ==
X-CSE-MsgGUID: YGtIJNFuTAizXO82Fy7uhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8824660"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8824660"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:51:04 -0700
X-CSE-ConnectionGUID: c+JjeaBqTCWC77Oty0dwcw==
X-CSE-MsgGUID: Tagd3zvzR26QEzV5CtxoYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22331130"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Apr 2024 06:50:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 16 Apr 2024 16:50:58 +0300
Date: Tue, 16 Apr 2024 16:50:58 +0300
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
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v11 15/28] drm/connector: hdmi: Compute bpc and format
 automatically
Message-ID: <Zh6CQhD-2Yl5LUVb@intel.com>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
 <20240326-kms-hdmi-connector-state-v11-15-c5680ffcf261@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326-kms-hdmi-connector-state-v11-15-c5680ffcf261@kernel.org>
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

On Tue, Mar 26, 2024 at 04:40:19PM +0100, Maxime Ripard wrote:
> Now that we have all the infrastructure needed, we can add some code
> that will, for a given connector state and mode, compute the best output
> format and bpc.
> 
> The algorithm is equivalent to the one already found in i915 and vc4.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 197 ++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
>  2 files changed, 210 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 063421835dba..b9bc0fb027ea 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -1,9 +1,11 @@
>  // SPDX-License-Identifier: MIT
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_print.h>
>  
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
>  
>  /**
> @@ -46,10 +48,110 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
>  		return NULL;
>  
>  	return &crtc_state->mode;
>  }
>  
> +static bool
> +sink_supports_format_bpc(const struct drm_connector *connector,
> +			 const struct drm_display_info *info,
> +			 const struct drm_display_mode *mode,
> +			 unsigned int format, unsigned int bpc)
> +{
> +	struct drm_device *dev = connector->dev;
> +	u8 vic = drm_match_cea_mode(mode);
> +
> +	/*
> +	 * CTA-861-F, section 5.4 - Color Coding & Quantization states
> +	 * that the bpc must be 8, 10, 12 or 16 except for the default
> +	 * 640x480 VIC1 where the value must be 8.
> +	 *
> +	 * The definition of default here is ambiguous but the spec
> +	 * refers to VIC1 being the default timing in several occasions
> +	 * so our understanding is that for the default timing (ie,
> +	 * VIC1), the bpc must be 8.
> +	 */
> +	if (vic == 1 && bpc != 8) {
> +		drm_dbg_kms(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
> +		return false;
> +	}
> +
> +	if (!info->is_hdmi &&
> +	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
> +		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> +		return false;
> +	}
> +
> +	if (!(connector->hdmi.supported_formats & BIT(format))) {

These are the capabilities of the souce I take it?

> +		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
> +			    drm_hdmi_connector_get_output_format_name(format));
> +		return false;
> +	}
> +
> +	switch (format) {
> +	case HDMI_COLORSPACE_RGB:
> +		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
> +			return false;

and this is the sink.

Maybe we should use the same bits for both? Anyways, that seems like
material for a followup series.

> +
> +		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
> +			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
> +			return false;
> +		}
> +
> +		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
> +			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
> +			return false;
> +		}
> +
> +		drm_dbg_kms(dev, "RGB format supported in that configuration.\n");
> +
> +		return true;
> +
> +	case HDMI_COLORSPACE_YUV422:
> +		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
> +			drm_dbg_kms(dev, "Sink doesn't support YUV422.\n");
> +			return false;
> +		}
> +
> +		if (bpc != 12) {
> +			drm_dbg_kms(dev, "YUV422 only supports 12 bpc.\n");
> +			return false;
> +		}

Did something change around here from the last time?

> +
> +		drm_dbg_kms(dev, "YUV422 format supported in that configuration.\n");
> +
> +		return true;
> +
> +	case HDMI_COLORSPACE_YUV444:
> +		drm_dbg_kms(dev, "YUV444 format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
> +			drm_dbg_kms(dev, "Sink doesn't support YUV444.\n");
> +			return false;
> +		}
> +
> +		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
> +			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
> +			return false;
> +		}
> +
> +		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
> +			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
> +			return false;
> +		}
> +
> +		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static enum drm_mode_status
>  hdmi_clock_valid(const struct drm_connector *connector,
>  		 const struct drm_display_mode *mode,
>  		 unsigned long long clock)
>  {
> @@ -90,10 +192,101 @@ hdmi_compute_clock(const struct drm_connector *connector,
>  	conn_state->hdmi.tmds_char_rate = clock;
>  
>  	return 0;
>  }
>  
> +static bool
> +hdmi_try_format_bpc(const struct drm_connector *connector,
> +		    struct drm_connector_state *conn_state,
> +		    const struct drm_display_mode *mode,
> +		    unsigned int bpc, enum hdmi_colorspace fmt)
> +{
> +	const struct drm_display_info *info = &connector->display_info;
> +	struct drm_device *dev = connector->dev;
> +	int ret;
> +
> +	drm_dbg_kms(dev, "Trying %s output format\n",
> +		    drm_hdmi_connector_get_output_format_name(fmt));
> +
> +	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
> +		drm_dbg_kms(dev, "%s output format not supported with %u bpc\n",
> +			    drm_hdmi_connector_get_output_format_name(fmt),
> +			    bpc);
> +		return false;
> +	}
> +
> +	ret = hdmi_compute_clock(connector, conn_state, mode, bpc, fmt);
> +	if (ret) {
> +		drm_dbg_kms(dev, "Couldn't compute clock for %s output format and %u bpc\n",
> +			    drm_hdmi_connector_get_output_format_name(fmt),
> +			    bpc);
> +		return false;
> +	}
> +
> +	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
> +		    drm_hdmi_connector_get_output_format_name(fmt),
> +		    bpc, conn_state->hdmi.tmds_char_rate);
> +
> +	return true;
> +}
> +
> +static int
> +hdmi_compute_format(const struct drm_connector *connector,
> +		    struct drm_connector_state *conn_state,
> +		    const struct drm_display_mode *mode,
> +		    unsigned int bpc)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	/*
> +	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> +	 * devices, for modes that only support YCbCr420.
> +	 */
> +	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
> +		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
> +		return 0;
> +	}
> +
> +	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
> +
> +	return -EINVAL;
> +}
> +
> +static int
> +hdmi_compute_config(const struct drm_connector *connector,
> +		    struct drm_connector_state *conn_state,
> +		    const struct drm_display_mode *mode)
> +{
> +	struct drm_device *dev = connector->dev;
> +	unsigned int max_bpc = clamp_t(unsigned int,
> +				       conn_state->max_bpc,
> +				       8, connector->max_bpc);
> +	unsigned int bpc;
> +	int ret;
> +
> +	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
> +		drm_dbg_kms(dev, "Trying with a %d bpc output\n", bpc);
> +
> +		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
> +		if (ret)
> +			continue;
> +
> +		conn_state->hdmi.output_bpc = bpc;
> +
> +		drm_dbg_kms(dev,
> +			    "Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
> +			    mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
> +			    conn_state->hdmi.output_bpc,
> +			    drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
> +			    conn_state->hdmi.tmds_char_rate);
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /**
>   * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
>   * @connector: DRM Connector
>   * @state: the DRM State object
>   *
> @@ -113,13 +306,11 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  		drm_atomic_get_new_connector_state(state, connector);
>  	const struct drm_display_mode *mode =
>  		connector_state_get_mode(new_conn_state);
>  	int ret;
>  
> -	ret = hdmi_compute_clock(connector, new_conn_state, mode,
> -				 new_conn_state->hdmi.output_bpc,
> -				 new_conn_state->hdmi.output_format);
> +	ret = hdmi_compute_config(connector, new_conn_state, mode);
>  	if (ret)
>  		return ret;
>  
>  	if (old_conn_state->hdmi.output_bpc != new_conn_state->hdmi.output_bpc ||
>  	    old_conn_state->hdmi.output_format != new_conn_state->hdmi.output_format) {
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index ead998a691e7..a49a544d7b49 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -70,13 +70,10 @@ static int light_up_connector(struct kunit *test,
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>  
>  	conn_state = drm_atomic_get_connector_state(state, connector);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
>  
> -	conn_state->hdmi.output_bpc = connector->max_bpc;
> -	conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
> -
>  	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	crtc_state = drm_atomic_get_crtc_state(state, crtc);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> @@ -251,14 +248,19 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
>  	priv = drm_atomic_helper_connector_hdmi_init(test,
>  						     BIT(HDMI_COLORSPACE_RGB),
>  						     10);
>  	KUNIT_ASSERT_NOT_NULL(test, priv);
>  
> +	conn = &priv->connector;
> +	ret = set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
>  	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
> -	conn = &priv->connector;
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
> @@ -272,15 +274,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
>  
>  	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
>  
> -	new_conn_state->hdmi.output_bpc = 8;
> +	new_conn_state->max_requested_bpc = 8;
>  
>  	KUNIT_ASSERT_NE(test,
> -			old_conn_state->hdmi.output_bpc,
> -			new_conn_state->hdmi.output_bpc);
> +			old_conn_state->max_requested_bpc,
> +			new_conn_state->max_requested_bpc);
>  
>  	ret = drm_atomic_check_only(state);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> @@ -320,14 +322,19 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
>  	priv = drm_atomic_helper_connector_hdmi_init(test,
>  						     BIT(HDMI_COLORSPACE_RGB),
>  						     10);
>  	KUNIT_ASSERT_NOT_NULL(test, priv);
>  
> +	conn = &priv->connector;
> +	ret = set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
>  	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
> -	conn = &priv->connector;
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
> @@ -670,11 +677,11 @@ static void drm_test_check_format_value(struct kunit *test)
>  						     8);
>  	KUNIT_ASSERT_NOT_NULL(test, priv);
>  
>  	conn = &priv->connector;
>  	conn_state = conn->state;
> -	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, 0);
>  }
>  
>  /*
>   * Test that the value of the output format property out of reset is set
>   * to 0, and will be computed at atomic_check time.
> 
> -- 
> 2.44.0

-- 
Ville Syrjälä
Intel
