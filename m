Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605244B0A5E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6383910E7AF;
	Thu, 10 Feb 2022 10:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA8110E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644488259; x=1676024259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lEjRgBQRqfdaizTpLmFl1JGFw/IxDXTv+IVq7PXE1L0=;
 b=dksuPboGLxjcJt0+uJ29WZsirTL3SoHI59yY6n6k/CxzXIZyfZq+U+7e
 76JiLeV/DlvvfvW7Jwt+oBTc9ATGVkSNwVzZjGjsoY3W9wW5k8qNABfXN
 kEyRKI1DfmTz4ybGEEo7nZDzUUZLi4RCRDKgFg+6+Q7PDLanGpWAhwZhA
 eATAa0Wgs1SRa10CSGQMXQas83xpiDK2G/v3EhT72LG2PVNBcnoA0ePKQ
 7+X7eLoIozd2PgRjrHHfxRQNFM/lYchBbDzC0l8FTCUAn8EGKVZ5GCZ4p
 BEHKHiP02iKoacP6HHg0x7k2Rl7ilUiFGyOpaAhb47X6Es86dkk6INaEi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249666682"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="249666682"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="537260901"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 10 Feb 2022 02:17:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 12:17:20 +0200
Date: Thu, 10 Feb 2022 12:17:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 6/6] drm/vc4: hdmi: Support HDMI YUV output
Message-ID: <YgTmMPc4VkM17/xn@intel.com>
References: <20220127141021.302482-1-maxime@cerno.tech>
 <20220127141021.302482-7-maxime@cerno.tech>
 <Yfw1+r99ZsLQcrm8@intel.com>
 <20220210100343.dbmdmhsvchhpgaj6@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220210100343.dbmdmhsvchhpgaj6@houat>
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

On Thu, Feb 10, 2022 at 11:03:43AM +0100, Maxime Ripard wrote:
> On Thu, Feb 03, 2022 at 10:07:22PM +0200, Ville Syrjälä wrote:
> > On Thu, Jan 27, 2022 at 03:10:21PM +0100, Maxime Ripard wrote:
> > > +/*
> > > + * Conversion between Full Range RGB and Full Range YUV444 using the
> > > + * BT.709 Colorspace
> > > + *
> > > + * [ -0.117208 -0.394207  0.511416  128 ]
> > > + * [  0.511416 -0.464524 -0.046891  128 ]
> > > + * [  0.212639  0.715169  0.072192  0   ]
> > > + *
> > > + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> > > + */
> > > +static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709[3][4] = {
> > 
> > I think YCbCr output is supposed to be limited range. Or at least 
> > that was the case with DP. For HDMI/CTA IIRC the spec is super
> > unclear/confusing when it talks about the YCC quantizaton range
> > stuff. 
> > 
> > Currently i915 will only do limited range BT.709 YCbCr output.
> 
> Indeed I haven't been able to find anything in the spec, so I'll just
> drop it, if only to remain consistent across drivers.
> 
> > > +	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
> > > +	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
> > > +	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
> > > +};
> > > +
> > >  static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
> > >  				    const u16 coeffs[3][4])
> > >  {
> > <snip>
> > > @@ -1323,11 +1534,56 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
> > >  	return 0;
> > >  }
> > >  
> > > +static int
> > > +vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
> > > +				struct vc4_hdmi_connector_state *vc4_state,
> > > +				const struct drm_display_mode *mode,
> > > +				unsigned int bpc)
> > > +{
> > > +	struct drm_device *dev = vc4_hdmi->connector.dev;
> > > +	const struct drm_connector *connector = &vc4_hdmi->connector;
> > > +	const struct drm_display_info *info = &connector->display_info;
> > > +	unsigned int format;
> > > +
> > > +	drm_dbg(dev, "Trying with an RGB output\n");
> > > +
> > > +	format = VC4_HDMI_OUTPUT_RGB;
> > > +	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
> > > +		int ret;
> > > +
> > > +		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
> > > +						     mode, bpc, format);
> > > +		if (!ret) {
> > > +			vc4_state->output_format = format;
> > > +			return 0;
> > > +		}
> > > +	}
> > 
> > You seem to have the bpc vs. format selection in the opposite order to
> > i915. We try to exhaust all RGB color depths first, and only then fall
> > back to YCbCr 4:2:0. The automagic YCbCr 4:2:0 fallback is only
> > really there because without it you may not be able to light up the
> > display at all (at least if you want the higher resolutions).
> > 
> > With the current i915 logic 4:2:2 doesn't make any sense since it has 
> > the same requirements as 8bpc RGB. Hence we don't even implement
> > YCbCr 4:2:2 (also hw didn't have it until recently).
> 
> Our use-case is slightly different, but the basic idea is the same:
> since we support from 8 to 12 bpc, an output to YUV422 output can prove
> useful if we are reading a 12 bpc content and we don't have the
> bandwidth to use RGB.
> 
> Thus, when we have a max_bpc of 12, we try RGB and YUV422, if none of
> them work we try RGB in 10 and 8 bpc.
> 
> This is indeed a bit different than i915, but it doesn't seem
> fundamentally different to me.

I guess as long as the user gets a semi-correct picture it's
mostly irrelevant.

But at least on i915 gamma correction becomes harder on certain
platforms (GLK) if we do YCbCr output since the LUT is after
the CSC matrix :( Pretty sure we don't handle that case in any
kind of sane way atm. So that's another reason why we prefer
RGB over YCbCr.

-- 
Ville Syrjälä
Intel
