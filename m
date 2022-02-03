Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FB4A8CF2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7FB10E556;
	Thu,  3 Feb 2022 20:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893510E556
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 20:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643918847; x=1675454847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EWy6BTQRChRmoBF4fZs3b3Oe/qxlakKPx/JA1htGMos=;
 b=JIqr0FkANcYeGLgfy5C9ZmbHdEd964PgbAPBg2Jtmey96u0cJYL6bztm
 EkEfTPCL8gmCsaokyhsA5eubAZI2BtOKv3cj2bh/14/9yT2yM09dhfTV9
 zTG/xzXY/e2TwIUwKndsasnXMjaifMnVwWmz4yH2G4dqecV/mbcA9KcgL
 QmmuG4ALOywbmC6z2oAVw39S8htWEUHikHJmi/Ykkc2SYlhjFqhkjnO9s
 I7+kPoq01GyJAmA9O+b+LuGYQoxH84T2m00eL9F19r+ZuiZ9nE58blvuf
 SXsEe/ldcCg7Jd+dR4wPKLSX+zhhtBmyH8T7W6Mn4KjvA9/ybbxM4KTOB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248193370"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="248193370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="535327708"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 03 Feb 2022 12:07:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Feb 2022 22:07:22 +0200
Date: Thu, 3 Feb 2022 22:07:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 6/6] drm/vc4: hdmi: Support HDMI YUV output
Message-ID: <Yfw1+r99ZsLQcrm8@intel.com>
References: <20220127141021.302482-1-maxime@cerno.tech>
 <20220127141021.302482-7-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127141021.302482-7-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 03:10:21PM +0100, Maxime Ripard wrote:
> +/*
> + * Conversion between Full Range RGB and Full Range YUV444 using the
> + * BT.709 Colorspace
> + *
> + * [ -0.117208 -0.394207  0.511416  128 ]
> + * [  0.511416 -0.464524 -0.046891  128 ]
> + * [  0.212639  0.715169  0.072192  0   ]
> + *
> + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> + */
> +static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709[3][4] = {

I think YCbCr output is supposed to be limited range. Or at least 
that was the case with DP. For HDMI/CTA IIRC the spec is super
unclear/confusing when it talks about the YCC quantizaton range
stuff. 

Currently i915 will only do limited range BT.709 YCbCr output.

> +	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
> +	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
> +	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
> +};
> +
>  static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
>  				    const u16 coeffs[3][4])
>  {
<snip>
> @@ -1323,11 +1534,56 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
>  	return 0;
>  }
>  
> +static int
> +vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
> +				struct vc4_hdmi_connector_state *vc4_state,
> +				const struct drm_display_mode *mode,
> +				unsigned int bpc)
> +{
> +	struct drm_device *dev = vc4_hdmi->connector.dev;
> +	const struct drm_connector *connector = &vc4_hdmi->connector;
> +	const struct drm_display_info *info = &connector->display_info;
> +	unsigned int format;
> +
> +	drm_dbg(dev, "Trying with an RGB output\n");
> +
> +	format = VC4_HDMI_OUTPUT_RGB;
> +	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
> +		int ret;
> +
> +		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
> +						     mode, bpc, format);
> +		if (!ret) {
> +			vc4_state->output_format = format;
> +			return 0;
> +		}
> +	}

You seem to have the bpc vs. format selection in the opposite order to
i915. We try to exhaust all RGB color depths first, and only then fall
back to YCbCr 4:2:0. The automagic YCbCr 4:2:0 fallback is only
really there because without it you may not be able to light up the
display at all (at least if you want the higher resolutions).

With the current i915 logic 4:2:2 doesn't make any sense since it has 
the same requirements as 8bpc RGB. Hence we don't even implement
YCbCr 4:2:2 (also hw didn't have it until recently). There has
occasionally been some talk about introducing a new property
to give the user explicit control over this stuff. If/when that
happens I guess we might want to revisit the 4:2:2 situation for
i915.

> +
> +	drm_dbg(dev, "Failed, Trying with an YUV422 output\n");
> +
> +	format = VC4_HDMI_OUTPUT_YUV422;
> +	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
> +		int ret;
> +
> +		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
> +						     mode, bpc, format);
> +		if (!ret) {
> +			vc4_state->output_format = format;
> +			return 0;
> +		}
> +	}
> +
> +	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
> +
> +	return -EINVAL;
> +}
> +

-- 
Ville Syrjälä
Intel
