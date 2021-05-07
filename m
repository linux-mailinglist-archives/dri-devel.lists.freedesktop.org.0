Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F116376998
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 19:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9045A6E152;
	Fri,  7 May 2021 17:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64576E0EF;
 Fri,  7 May 2021 17:47:16 +0000 (UTC)
IronPort-SDR: obvkZVcM1wIE5k8Y8EAxCwazagTcbFA3bTLorLmAH8hbja8T8V4Mq9Sg6IeQMHBEQBoB5e1cik
 tXwoBHidLmgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="196762821"
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; d="scan'208";a="196762821"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 10:47:12 -0700
IronPort-SDR: iJD38hR8USPvAmB9wunSq0ygb53cZ01EEHBFHbI7+FN20N3f4O99slpUSAW+YzCgmmeZVJqH3a
 1ZlzczSYg3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; d="scan'208";a="465525152"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 07 May 2021 10:47:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 May 2021 20:47:08 +0300
Date: Fri, 7 May 2021 20:47:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v6 1/3] drm/i915/display: New function to avoid duplicate
 code in upcomming commits
Message-ID: <YJV9HA5IuQW+KWOf@intel.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
 <20210507084903.28877-1-wse@tuxedocomputers.com>
 <20210507084903.28877-2-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210507084903.28877-2-wse@tuxedocomputers.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 07, 2021 at 10:49:01AM +0200, Werner Sembach wrote:
> Moves some checks that later will be performed 2 times to an own function.
> This avoids duplicate code later on.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 41 ++++++++++++++---------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 46de56af33db..576d3d910d06 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1861,6 +1861,31 @@ static int intel_hdmi_port_clock(int clock, int bpc)
>  	return clock * bpc / 8;
>  }
>  
> +static enum drm_mode_status
> +intel_hdmi_mode_clock_valid(struct intel_hdmi *hdmi, int clock, bool has_hdmi_sink)
> +{
> +	struct drm_device *dev = intel_hdmi_to_dev(hdmi);
> +	struct drm_i915_private *dev_priv = to_i915(dev);
> +	enum drm_mode_status status;
> +
> +	/* check if we can do 8bpc */
> +	status = hdmi_port_clock_valid(hdmi, clock, true, has_hdmi_sink);
> +
> +	if (has_hdmi_sink) {
> +		/* if we can't do 8bpc we may still be able to do 12bpc */
> +		if (status != MODE_OK && !HAS_GMCH(dev_priv))
> +			status = hdmi_port_clock_valid(hdmi, clock * 3 / 2,

Seems we've lost intel_hdmi_port_clock() here somehow.

> +						       true, has_hdmi_sink);
> +
> +		/* if we can't do 8,12bpc we may still be able to do 10bpc */
> +		if (status != MODE_OK && INTEL_GEN(dev_priv) >= 11)
> +			status = hdmi_port_clock_valid(hdmi, clock * 5 / 4,

Also here.

> +						       true, has_hdmi_sink);
> +	}
> +
> +	return status;
> +}
> +
>  static enum drm_mode_status
>  intel_hdmi_mode_valid(struct drm_connector *connector,
>  		      struct drm_display_mode *mode)
> @@ -1891,21 +1916,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
>  	if (drm_mode_is_420_only(&connector->display_info, mode))
>  		clock /= 2;
>  
> -	/* check if we can do 8bpc */
> -	status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 8),
> -				       true, has_hdmi_sink);
> -
> -	if (has_hdmi_sink) {
> -		/* if we can't do 8bpc we may still be able to do 12bpc */
> -		if (status != MODE_OK && !HAS_GMCH(dev_priv))
> -			status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 12),
> -						       true, has_hdmi_sink);
> -
> -		/* if we can't do 8,12bpc we may still be able to do 10bpc */
> -		if (status != MODE_OK && DISPLAY_VER(dev_priv) >= 11)
> -			status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 10),
> -						       true, has_hdmi_sink);
> -	}
> +	status = intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
>  	if (status != MODE_OK)
>  		return status;
>  
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
