Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BB605085
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A410E051;
	Wed, 19 Oct 2022 19:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5CC10E051;
 Wed, 19 Oct 2022 19:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666208167; x=1697744167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gZB/GY6//sUmGaJp2Ij2hqDFcvNmjUwGmIKpPm4Ke+M=;
 b=UDyk1L2P43i1npdi44FQyNBsgtnRtAyzsI1gFhkWiDMBIbePxSgQJrPI
 Z/vU+ARG4OHIaXJsHhrhh7B016iRoZoM6YXqkeo5OfkcX8tPUM5+7sYkt
 aUglKIxsMSWQuN5e6sCxckL6yzn9ghXfmqc5qXmWYY1B9etnI9j0KMaC+
 AmTkP7Uk+YZHTMEVwjEGyPHu2+2Kss+ei5WTGeOTRrgxAOrc0rlR5Hs9Q
 BI/bpZRSgHryh9ZOwBO36+BN0ksUT9FJg2ITBQh18JyekOTl4osRasN6A
 kv8jzzTu9ehkdPi9PjmP6qagQ1K+mPBoleHZMwpJJXIca79c9lB+bZ9QC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306503365"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306503365"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="874587406"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="874587406"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga006.fm.intel.com with SMTP; 19 Oct 2022 12:36:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:36:03 +0300
Date: Wed, 19 Oct 2022 22:36:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 02/15] drm/i915/hdmi: stop using connector->override_edid
Message-ID: <Y1BRo6fmQgozJO6V@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <98759771776c57e31c1e673dca651d2892738f63.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98759771776c57e31c1e673dca651d2892738f63.1665496046.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 04:49:36PM +0300, Jani Nikula wrote:
> The connector->override_edid flag is strictly for EDID override debugfs
> management, and drivers have no business using it.
> 
> The check for override_edid was added in commit 301906290553 ("drm/i915:
> Ignore TMDS clock limit for DP++ when EDID override is set") to
> facilitate mode list cross-checking against modes in override EDID when
> the connector in question isn't even connected. The dual mode detect
> fallback would do VBT based limiting in this case.
> 
> Instead of override EDID, check for connector forcing in the fallback.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index a332eaac86cd..878a65c887f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2374,10 +2374,8 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
>  	 * if the port is a dual mode capable DP port.
>  	 */
>  	if (type == DRM_DP_DUAL_MODE_UNKNOWN) {
> -		/* An overridden EDID imply that we want this port for testing.
> -		 * Make sure not to set limits for that port.
> -		 */
> -		if (!connector->override_edid &&
> +		if (connector->force != DRM_FORCE_ON &&
> +		    connector->force != DRM_FORCE_ON_DIGITAL &&

I don't think we can get here with force==OFF, so could simply to just
if (!connector->force && ...

which might even be less confusing either way. At least I'm getting
confused thinking we'd want to assume the presence of the adaptor
with force==OFF.

>  		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
>  			drm_dbg_kms(&dev_priv->drm,
>  				    "Assuming DP dual mode adaptor presence based on VBT\n");
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
