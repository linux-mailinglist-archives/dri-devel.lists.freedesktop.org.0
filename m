Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23D7723DE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793DF10E06D;
	Mon,  7 Aug 2023 12:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D232889D7F;
 Mon,  7 Aug 2023 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691411160; x=1722947160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z5Xn3wSmKkWX5JAPtWZEp/p5RR+TeRhb5M6LlS/C0sc=;
 b=N8BTII7d9f7Sw/yJcBJHvrMV31L7OppjonMO3ge524gnGMdLqXNn0KcC
 EYHlfdJIpbLRXU20JRZpbEAjfvh9ZkSPWbMuNrW8adE79+K9VSIzm9HmF
 sTlhufxmA6wA7jq6uieYTva2Oqim0sTSTkAQI54jJooWg4TUMi/EtGXmw
 642olf3Af5xjxsjsQXdQxg3NEFpIYsCO1xqFcGrxYVxZXZchXz/g9B+9T
 EtFYov0QUs8qpIeLR7oDBGi41YvBxQ3BQSAO8vhq4h09vgBOEY3QyPJy8
 nBF+EyH7HjNCFVGfYTCalx9ugS2mtPKl8TRrE/4PxXeoS1+TY5RXzLVri w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="369431011"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="369431011"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="800921165"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="800921165"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:25:58 -0700
Date: Mon, 7 Aug 2023 15:25:55 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 20/20] drm/i915/dp: Check if force_dsc_output_format is
 possible
Message-ID: <ZNDi0z9R7XXYq6HP@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-21-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-21-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:41:50AM +0530, Ankit Nautiyal wrote:
> Currently for testing an output format with DSC, we just force the
> output format, without checking if it can be supported.
> This also creates an issue where there is a PCON which might need to
> convert from forced output format to the format to sink format.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 30 +++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0299b378ba6e..1aee27c0fb55 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -935,16 +935,42 @@ dfp_can_convert_from_ycbcr444(struct intel_dp *intel_dp,
>  	return false;
>  }
>  
> +static bool
> +dfp_can_convert(struct intel_dp *intel_dp,
> +		enum intel_output_format output_format,
> +		enum intel_output_format sink_format)
> +{
> +	switch (output_format) {
> +	case INTEL_OUTPUT_FORMAT_RGB:
> +		return dfp_can_convert_from_rgb(intel_dp, sink_format);
> +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> +		return dfp_can_convert_from_ycbcr444(intel_dp, sink_format);
> +	default:
> +		MISSING_CASE(output_format);
> +		return false;
> +	}
> +
> +	return false;
> +}
> +
>  static enum intel_output_format
>  intel_dp_output_format(struct intel_connector *connector,
>  		       enum intel_output_format sink_format)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	enum intel_output_format force_dsc_output_format =
> +		intel_dp->force_dsc_output_format;
>  	enum intel_output_format output_format;
> +	if (force_dsc_output_format) {
> +		if (source_can_output(intel_dp, force_dsc_output_format) &&
> +		    (!drm_dp_is_branch(intel_dp->dpcd) ||
> +		     sink_format != force_dsc_output_format ||
> +		     dfp_can_convert(intel_dp, force_dsc_output_format, sink_format)))
> +			return force_dsc_output_format;
>  
> -	if (intel_dp->force_dsc_output_format)
> -		return intel_dp->force_dsc_output_format;
> +		drm_dbg_kms(&i915->drm, "Cannot force DSC output format\n");
> +	}
>  
>  	if (sink_format == INTEL_OUTPUT_FORMAT_RGB ||
>  	    dfp_can_convert_from_rgb(intel_dp, sink_format))
> -- 
> 2.40.1
> 
