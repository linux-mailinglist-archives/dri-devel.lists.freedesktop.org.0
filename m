Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2860AEB8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052A110E832;
	Mon, 24 Oct 2022 15:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A0310E832;
 Mon, 24 Oct 2022 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666624421; x=1698160421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iFeLFNET0Ta7jStcv1CJ8Om7AqxEAv1QCGwHljro1jU=;
 b=CWU42BoP/VCGaaUMuHsOuxL9k/v2McCPaT46AiTIHhl0t2pOGUjJZUB2
 AxJr154zTdE1/cpbqFQOVMAc8v+Ogm0bM0yre2e4ko3fb0SwkhRviUf0O
 3Lgq97CpWdNwK4borTTOxkrdRbx2l1mlJtwLzere7SdMUSRsFV9Poda3P
 RdunXn3635sKgBUpNie/6o5YBJcV3ZnZHPGt9QA5pH7W3oPlbxqxHnGtg
 PA0CdOaYnJqURr0X+wXMBrDGt0nrZNOmRLktANljWk3CK4EvglIVy4lqZ
 iQcYrLdFXdhh5bhW38zWbtRmEaenTyhFnE2pCUZdEzaWBgocEkRcFlPb9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306174764"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="306174764"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 08:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736446365"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="736446365"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 24 Oct 2022 08:13:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Oct 2022 18:13:37 +0300
Date: Mon, 24 Oct 2022 18:13:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 02/16] drm/i915/hdmi: stop using
 connector->override_edid
Message-ID: <Y1aroUDytxF716ck@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
 <c8b45867cf37134ab40be23e22825ca45adc6041.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8b45867cf37134ab40be23e22825ca45adc6041.1666614699.git.jani.nikula@intel.com>
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

On Mon, Oct 24, 2022 at 03:33:30PM +0300, Jani Nikula wrote:
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
> v2: Simply use !connector->force (Ville)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index a332eaac86cd..02f8374ea51f 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2374,10 +2374,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
>  	 * if the port is a dual mode capable DP port.
>  	 */
>  	if (type == DRM_DP_DUAL_MODE_UNKNOWN) {
> -		/* An overridden EDID imply that we want this port for testing.
> -		 * Make sure not to set limits for that port.
> -		 */
> -		if (!connector->override_edid &&
> +		if (!connector->force &&
>  		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
>  			drm_dbg_kms(&dev_priv->drm,
>  				    "Assuming DP dual mode adaptor presence based on VBT\n");
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
