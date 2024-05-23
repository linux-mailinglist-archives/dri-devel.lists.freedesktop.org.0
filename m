Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D682F8CD01D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEA210E9D3;
	Thu, 23 May 2024 10:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RVtDdNNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E7C10EA55
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:15:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51fdc9af005so11191172e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459304; x=1717064104; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9QM5VzG76QHcCqcCe0wnilEYwkFQSlzi+agUdhNJ33A=;
 b=RVtDdNNseh+tPvJ3qDjsZC50oIqMJk6Qsforpt0Sde/lfPlf4J2+d7ivOloTy4tGBQ
 Tm5IiXyC5s3w3V2wPZfvuSN/qkSJw6aczxyhcPbpEHg8ch6o6yyyT/NCAnQmswy9YXNR
 nbq8NrztYYHGH/FQ4nogA0Hguj2RxJ5jxzeBx0uxJFXHzPhjJ67Z0rHgqNllrs5KBade
 iV+D5KcjgdunU6daR+cLkJ/eQJMQpUKXwYH5MK7ZgOlcORMki7kLVXDXmr+t3qrBnBAf
 8ybJbjylT2E27PDO8fWQF8lag59b/zaTekCojE6N03P5GJVbpNKJSBoPvTCTqaU3erd3
 FGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459304; x=1717064104;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9QM5VzG76QHcCqcCe0wnilEYwkFQSlzi+agUdhNJ33A=;
 b=spBCUV5h/Ih34DiZfUS+XhuCOBER8nsWu5ISYwOqiFbakg0Vfe4XgIZBPhfI3tfkJJ
 G4476ErdIxqeZtI1eG1VI2oZMUj4CLY9+S2w1mZM8BceaWes4VQPSB24qRFoadmVG1QG
 F074YqDRGhS9H7Vz51DgkXupmorE8ZxBLwLAWplv58DFJdan49+qXdqQUQGBUGeGX4ik
 IZhOsRXCtQ1668vu2v/ZqKI9savdX8wBtrUbE/BLSgyI6KiT3j5KOEdzER5r/hSUF1qA
 gYNy4ERL4eWGxrAuNxkamm+rEeOSY0WmWr4/jHm1VSLo9ncx2/KIG3FIaQRRlnvdg/8x
 iE5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqsHAK6Qbhhz0bJNIgCqVm4nUAaV8fYasXdLgS6Mevzla7u+qMg/CcaMFTizMONjqyyYU+ksUOp9hCZYm9dtireM3ebj2CM0nZC+s27Yg8
X-Gm-Message-State: AOJu0YzR0kgTUBn6tQQiQ2+NlhWBpsIPgZTQV2Iy9b05WP0oIEPscrv3
 DjyUb8u9F9QT+PJuQONDv1cgMzC65Wr4NwOMlXZVk7fCnj4XkVfLr3fLm6bzDSw=
X-Google-Smtp-Source: AGHT+IFqFUUscVGR4pTWOYTK8QhbkEvk/NnBZ8osOoAj1j6Q5OEEzJWbkn/agprLrWF0VJh5udjbWw==
X-Received: by 2002:a19:6a0c:0:b0:51d:9291:6945 with SMTP id
 2adb3069b0e04-526c0b5dbbcmr3664728e87.44.1716459304484; 
 Thu, 23 May 2024 03:15:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52753dd576bsm390832e87.108.2024.05.23.03.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:15:03 -0700 (PDT)
Date: Thu, 23 May 2024 13:15:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 15/28] drm/connector: hdmi: Compute bpc and format
 automatically
Message-ID: <utfnjwl42bhkol6ppp5el4rcbk2uyr4eet5um6v3mce6orfeyi@47ocf53ycmnt>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-15-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-15-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:48PM +0200, Maxime Ripard wrote:
> Now that we have all the infrastructure needed, we can add some code
> that will, for a given connector state and mode, compute the best output
> format and bpc.
> 
> The algorithm is equivalent to the one already found in i915 and vc4.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 205 ++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
>  2 files changed, 218 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 063421835dba..93cb30dba86e 100644
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
> @@ -46,10 +48,118 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
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
> +		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
> +			    drm_hdmi_connector_get_output_format_name(format));
> +		return false;
> +	}
> +
> +	switch (format) {
> +	case HDMI_COLORSPACE_RGB:
> +		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
> +
> +		/*
> +		 * In some cases, like when the EDID readout fails, or
> +		 * is not an HDMI compliant EDID for some reason, the
> +		 * color_formats field will be blank and not report any
> +		 * format supported. In such a case, assume that RGB is
> +		 * supported so we can keep things going and light up
> +		 * the display.
> +		 */
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
> +			drm_warn(dev, "HDMI Sink doesn't support RGB, something's wrong.\n");
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

Maybe I'm misunderstanding the spec for YUV 4:2:2

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

So for 4:2:0 this code will always return false? I think a dev_dbg /
todo / comment would be nice. There is a todo later on, but it is in a
different code block.

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
> @@ -90,10 +200,101 @@ hdmi_compute_clock(const struct drm_connector *connector,
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
> @@ -113,13 +314,11 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
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
> 2.45.0
> 

-- 
With best wishes
Dmitry
