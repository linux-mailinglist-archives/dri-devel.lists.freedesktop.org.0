Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0684A8CD3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 20:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC5510E132;
	Thu,  3 Feb 2022 19:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25010E132
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 19:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643918360; x=1675454360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9AgOFS9t0k/InE65iLrWzS5ChKAwLCtEE7+fSoYBy1s=;
 b=Fc8qQAqixkAJtZT8ffO7EwwC2JwM+7omeHkAR8sm/YBW9h+4BgRIoWEd
 Y5GXmt07f6DU5x5hqgFG2J7jU0+DA1lf6YiErzIPPWq0aEo1+/IJH9lFW
 FVNRsMibUiQ0osfnwGw/IO9kxZKkorUxXR6KeDK5cLW8BVjlVTDtA0K/C
 FrBG1zJIUO9QI4pc3jIgbnyNgPDZPy9j8Bi1NNht/J5UisjtCuMjhsZTy
 0JsCdmbaBQX0UOHWEJRJe2ZPpWc6Qp9J7Mq7UrU5KtWmqSETLUyCFWlRG
 wUR0lqYJx75M4z4cQEyzXhjHbZF/GQt+zhPHKMOhf46jexs3J201nzI8R A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="235641057"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="235641057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 11:59:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="538892420"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 03 Feb 2022 11:59:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Feb 2022 21:59:15 +0200
Date: Thu, 3 Feb 2022 21:59:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 2/6] drm/vc4: hdmi: Move clock calculation into its
 own function
Message-ID: <Yfw0EwaI9OqS6keP@intel.com>
References: <20220127141021.302482-1-maxime@cerno.tech>
 <20220127141021.302482-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127141021.302482-3-maxime@cerno.tech>
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

On Thu, Jan 27, 2022 at 03:10:17PM +0100, Maxime Ripard wrote:
> The code to compute our clock rate for a given setup will be called in
> multiple places in the next patches, so let's create a separate function
> for it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 49 +++++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 105911644b02..a1fa37ad350d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1274,6 +1274,35 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
>  	return MODE_OK;
>  }
>  
> +static unsigned long long
> +vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
> +				    unsigned int bpc)
> +{
> +	unsigned long long clock = mode->clock * 1000;
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		clock = clock * 2;
> +
> +	return clock * bpc / 8;

div_u64()/etc.?

> +}
> +
> +static int
> +vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
> +			       struct vc4_hdmi_connector_state *vc4_state,
> +			       const struct drm_display_mode *mode,
> +			       unsigned int bpc)
> +{
> +	unsigned long long clock;
> +
> +	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
> +	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
> +		return -EINVAL;
> +
> +	vc4_state->pixel_rate = clock;

This thing seems a bit confused between pixels vs. TMDS characters.
Either that or some/all of the pixel_clock/rate things are just
misnamed?

> +
> +	return 0;
> +}
> +
>  #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
>  #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
>  
> @@ -1286,6 +1315,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>  	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>  	unsigned long long pixel_rate = mode->clock * 1000;
>  	unsigned long long tmds_rate;
> +	int ret;
>  
>  	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
>  	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> @@ -1306,21 +1336,10 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>  		pixel_rate = mode->clock * 1000;
>  	}
>  
> -	if (conn_state->max_bpc == 12) {
> -		pixel_rate = pixel_rate * 150;
> -		do_div(pixel_rate, 100);
> -	} else if (conn_state->max_bpc == 10) {
> -		pixel_rate = pixel_rate * 125;
> -		do_div(pixel_rate, 100);
> -	}
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		pixel_rate = pixel_rate * 2;
> -
> -	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
> -		return -EINVAL;
> -
> -	vc4_state->pixel_rate = pixel_rate;
> +	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
> +					     conn_state->max_bpc);
> +	if (ret)
> +		return ret;
>  
>  	return 0;
>  }
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
