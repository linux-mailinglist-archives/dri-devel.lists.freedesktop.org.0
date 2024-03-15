Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918787C992
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 09:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F510FFC0;
	Fri, 15 Mar 2024 08:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbJfA7lJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9CF10FFC3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710489925; x=1742025925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TrRBinZzGLucal8rlgqc2RLz4DMh0sLsKis+qasbHo0=;
 b=KbJfA7lJfxnmBdoFRXy9PP74cArhbvQewJpJ+HQgzO+Y6tUdBanGweCc
 aBH/sI8DRVWgGN0jYiz9BQ7OtDwx1eEC5rHY6jkyadVif5ddyGEfoo7w2
 CnE9TybK1nEX6iNIu1PbezZnBi2Yyvr7GgczTZ03c0Gr7rs1oiA4HPU9D
 OQ+qo4d6H0Y0hAVoN0uMWJkf4jmkRSpwcGjANAzLw5G2ETw0BzLploZyp
 qp9jPcTuyJtupZtV7mSa5FzNtDeSWTEslXHp8+OdS4FX4owGm5KExWlU7
 uJLWUVumm4SWZN4pwXd7YTk7xLL+rhdm7jSdonDbNrjCVv0FfZvfZ1Kuc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5287404"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5287404"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="827780531"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="827780531"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 01:05:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 10:05:16 +0200
Date: Fri, 15 Mar 2024 10:05:16 +0200
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
Subject: Re: [PATCH v9 14/27] drm/connector: hdmi: Compute bpc and format
 automatically
Message-ID: <ZfQBPHoAvI1dquEY@intel.com>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
 <20240311-kms-hdmi-connector-state-v9-14-d45890323344@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311-kms-hdmi-connector-state-v9-14-d45890323344@kernel.org>
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

On Mon, Mar 11, 2024 at 03:49:42PM +0100, Maxime Ripard wrote:
> Now that we have all the infrastructure needed, we can add some code
> that will, for a given connector state and mode, compute the best output
> format and bpc.
> 
> The algorithm is equivalent to the one already found in i915 and vc4.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c          | 184 ++++++++++++++++++++-
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   |  25 ++-
>  2 files changed, 197 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 448b4a73d1c8..9f517599f117 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -29,10 +29,11 @@
>  #include <drm/drm_blend.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_writeback.h>
> @@ -660,10 +661,100 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
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
> +	if (vic == 1 && bpc != 8) {
> +		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);

Use of drm_dbg() for kms stuff is surprising.

> +		return false;
> +	}

I don't think we have this in i915. My original impression was that you
can use higher color depth if you can determine the sink capabilities,
but all sinks are required to accept 640x480@8bpc as a fallback.

but CTA-861-H says:
"5.4 Color Coding & Quantization
 Component Depth: The coding shall be N-bit, where N = 8, 10, 12, or 16
 bits/component — except in the case of the default 640x480 Video Timing 1,
 where the value of N shall be 8."

So that does seem to imply that you're supposed to use exactly 8bpc.
Though the word "default" in there is confusing. Are they specifically
using that to indicate that this is about the fallback behaviour, or
is it just indicating that it is a "default mode that always has to
be supported". Dunno. I guess no real harm in forcing 8bpc for 640x480
since no one is likely to use that for any high fidelity stuff.

> +
> +	if (!info->is_hdmi &&
> +	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
> +		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> +		return false;
> +	}
> +
> +	if (!(connector->hdmi.supported_formats & BIT(format))) {
> +		drm_dbg(dev, "%s format unsupported by the connector.\n",
> +			drm_hdmi_connector_get_output_format_name(format));
> +		return false;
> +	}
> +
> +	switch (format) {
> +	case HDMI_COLORSPACE_RGB:
> +		drm_dbg(dev, "RGB Format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
> +			return false;
> +
> +		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
> +			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
> +			return false;
> +		}
> +
> +		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
> +			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
> +			return false;
> +		}
> +
> +		drm_dbg(dev, "RGB format supported in that configuration.\n");
> +
> +		return true;
> +
> +	case HDMI_COLORSPACE_YUV422:
> +		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
> +			drm_dbg(dev, "Sink doesn't support YUV422.\n");
> +			return false;
> +		}
> +
> +		if (bpc != 12) {
> +			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
> +			return false;
> +		}
> +
> +		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
> +
> +		return true;
> +
> +	case HDMI_COLORSPACE_YUV444:
> +		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
> +			drm_dbg(dev, "Sink doesn't support YUV444.\n");
> +			return false;
> +		}
> +
> +		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
> +			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
> +			return false;
> +		}
> +
> +		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
> +			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
> +			return false;
> +		}
> +
> +		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
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
> @@ -704,10 +795,99 @@ hdmi_compute_clock(const struct drm_connector *connector,
>  	state->hdmi.tmds_char_rate = clock;
>  
>  	return 0;
>  }
>  
> +static bool
> +hdmi_try_format_bpc(const struct drm_connector *connector,
> +		    struct drm_connector_state *state,

"state" is IMO not a great naming choice. It forces you to go and
look up the definition whenever you're not sure what 'state' actually
is when reading the code. 

Als at some point you may want to plumb different kinds of states
into these, or just switch to passing in the whole drm_atomic_state.

So I recommend using more specific names for the different kinds of
states (eg. "crtc_state"/"conn_state"/etc.) everywhere.

> +		    const struct drm_display_mode *mode,
> +		    unsigned int bpc, enum hdmi_colorspace fmt)
> +{
> +	const struct drm_display_info *info = &connector->display_info;
> +	struct drm_device *dev = connector->dev;
> +	int ret;
> +
> +	drm_dbg(dev, "Trying %s output format\n",
> +		drm_hdmi_connector_get_output_format_name(fmt));
> +
> +	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
> +		drm_dbg(dev, "%s output format not supported with %u bpc\n",
> +			drm_hdmi_connector_get_output_format_name(fmt), bpc);
> +		return false;
> +	}
> +
> +	ret = hdmi_compute_clock(connector, state, mode, bpc, fmt);
> +	if (ret) {
> +		drm_dbg(dev, "Couldn't compute clock for %s output format and %u bpc\n",
> +			drm_hdmi_connector_get_output_format_name(fmt), bpc);
> +		return false;
> +	}
> +
> +	drm_dbg(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
> +		drm_hdmi_connector_get_output_format_name(fmt), bpc, state->hdmi.tmds_char_rate);
> +
> +	return true;
> +}
> +
> +static int
> +hdmi_compute_format(const struct drm_connector *connector,
> +		    struct drm_connector_state *state,
> +		    const struct drm_display_mode *mode,
> +		    unsigned int bpc)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	if (hdmi_try_format_bpc(connector, state, mode, bpc, HDMI_COLORSPACE_RGB)) {
> +		state->hdmi.output_format = HDMI_COLORSPACE_RGB;
> +		return 0;
> +	}
> +
> +	if (hdmi_try_format_bpc(connector, state, mode, bpc, HDMI_COLORSPACE_YUV422)) {
> +		state->hdmi.output_format = HDMI_COLORSPACE_YUV422;
> +		return 0;
> +	}

Looks like you're preferring YCbCr 4:2:2 over RGB 8bpc. Not sure
if that's a good tradeoff to make.

In i915 we don't currently expose 4:2:2 at all because it doesn't
help in getting a working display, and we have no uapi for the
user to force it if they really want 4:2:2 over RGB.

> +
> +	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
> +
> +	return -EINVAL;
> +}
> +
> +static int
> +hdmi_compute_config(const struct drm_connector *connector,
> +		    struct drm_connector_state *state,
> +		    const struct drm_display_mode *mode)
> +{
> +	struct drm_device *dev = connector->dev;
> +	unsigned int max_bpc = clamp_t(unsigned int,
> +				       state->max_bpc,
> +				       8, connector->max_bpc);
> +	unsigned int bpc;
> +	int ret;
> +
> +	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
> +		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
> +
> +		ret = hdmi_compute_format(connector, state, mode, bpc);

Hmm. Actually I'm not sure your 4:2:2 stuff even works since you 
check for bpc==12 in there and only call this based on the max_bpc.
I'm not convinced max_bpc would actually be 12 for a sink that
supports YCbCr 4:2:2 but not 12bpc RGB.

> +		if (ret)
> +			continue;
> +
> +		state->hdmi.output_bpc = bpc;
> +
> +		drm_dbg(dev,
> +			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
> +			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
> +			state->hdmi.output_bpc,
> +			drm_hdmi_connector_get_output_format_name(state->hdmi.output_format),
> +			state->hdmi.tmds_char_rate);
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
> @@ -727,13 +907,11 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  		drm_atomic_get_new_connector_state(state, connector);
>  	const struct drm_display_mode *mode =
>  		connector_state_get_mode(new_state);
>  	int ret;
>  
> -	ret = hdmi_compute_clock(connector, new_state, mode,
> -				 new_state->hdmi.output_bpc,
> -				 new_state->hdmi.output_format);
> +	ret = hdmi_compute_config(connector, new_state, mode);
>  	if (ret)
>  		return ret;
>  
>  	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>  	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> index 5a8750153510..f010fde0eb69 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -68,13 +68,10 @@ static int light_up_connector(struct kunit *test,
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
> @@ -249,14 +246,19 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
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
> @@ -270,15 +272,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
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
> @@ -318,14 +320,19 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
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
> @@ -668,11 +675,11 @@ static void drm_test_check_format_value(struct kunit *test)
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
> 2.43.2

-- 
Ville Syrjälä
Intel
