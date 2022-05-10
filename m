Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F97520E3B
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 09:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4781E10F382;
	Tue, 10 May 2022 07:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF5F10F382;
 Tue, 10 May 2022 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652166086; x=1683702086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8fMQfibhWn+/PWK+ghSqUWsuPCgzCOP7F6tpzYibKnQ=;
 b=Kk0633Ajms2lMWceEI/icVTdM4bkeXmif4UOEjcWBGAHzE8EE9xpDp2W
 QmG1/Kb6dFh2Mq6QjpkWD6HgJBYNfeQ0Y1VayZ1DjplisT2ajUg09fHiw
 34Pv9NgR2sk9+IsoqkB1CD1Lx4I7HTivXHPWrMv1qz+zHPAWI1ek+XvTL
 vKe/KGl2ZKaGu09BFAZNtyWcNgdkJZbInJFXBbMuv8Z/HCK+7/BGnLYXu
 Wqv9/3ntVb1h6F/l5yk8wczys+Mxns8GfRejKDnpQlAqdEgeApgZ2K9u/
 Pvjl+2ETIkyZU55abIG5uVLVvvQ856TiWvETamLOBfUVKvMyY81GfyIMB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355710999"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="355710999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 00:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="570541051"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga007.fm.intel.com with SMTP; 10 May 2022 00:01:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 May 2022 10:01:21 +0300
Date: Tue, 10 May 2022 10:01:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/hdmi: Prune unsupported modes as per
 HDMI2.1 spec
Message-ID: <YnoNwZU0QtPMj51B@intel.com>
References: <20220509093130.3511032-1-ankit.k.nautiyal@intel.com>
 <20220509093130.3511032-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509093130.3511032-3-ankit.k.nautiyal@intel.com>
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

On Mon, May 09, 2022 at 03:01:30PM +0530, Ankit Nautiyal wrote:
> As per Sec 7.8.1 of HDMI2.1 spec, sources that support modes:
> 4K100, 4K120, 8K50, 8K60 must support these modes in at least one of
> the below formats:
> i) uncompressed FRL, 420 format and min of 10 bpc, or
> ii) compressed FRL, 444 format and min of 10 bpc.
> 
> Since FRL and DSC are not supported natively with HDMI, the above
> modes must be pruned as per the spec, and is a requirement for the
> HDMI2.1 compliance test.
> 
> This patch adds a condition to check for the modes with clock
> requirement more than 2376 MHz (1188 MHz with 420 format),
> and prune them if none of the above two formats are supported.

Wy are we trying to pass HDMI-2.1 tests on a device that
doesn't even support HDMI-2.1? 

> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 48 +++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 1ae09431f53a..2ee1262f6427 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1940,6 +1940,44 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *connector,
>  	}
>  }
>  
> +/*
> + * HDMI2.1 Sec7.8.1
> + * Support requirement for 4K100, 4K120, 8K50, and 8K60.
> + *
> + * The modes with timings same as above modes are supported only with min of 10 bpc
> + * along with:
> + *
> + * i) 444 format only with FRL mode support with DSC
> + * ii) 420 format only with FRL mode without DSC.
> + */
> +static bool
> +intel_hdmi21_bpc_possible(struct drm_connector *connector,
> +			  int clock, int bpc, bool ycbcr420_output,
> +			  bool frl, bool dsc)
> +{
> +	const struct drm_display_info *info = &connector->display_info;
> +	const struct drm_hdmi_info *hdmi = &info->hdmi;
> +
> +	int pixel_clock = ycbcr420_output ? clock * 2 : clock;
> +
> +	if (pixel_clock < 2376000)
> +		return true;
> +
> +	if (!frl)
> +		return false;
> +
> +	if (dsc && bpc > hdmi->dsc_cap.bpc_supported)
> +		return false;
> +
> +	if (!ycbcr420_output && !dsc)
> +		return false;
> +
> +	if (bpc < 10)
> +		return false;
> +
> +	return true;
> +}
> +
>  static enum drm_mode_status
>  intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>  			    bool has_hdmi_sink, bool ycbcr420_output)
> @@ -1948,6 +1986,13 @@ intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>  	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
>  	enum drm_mode_status status = MODE_OK;
>  	int bpc;
> +	bool frl, dsc;
> +
> +	/*
> +	 * FRL and DSC not supported for HDMI from source as of now.
> +	 */
> +	frl = false;
> +	dsc = false;
>  
>  	/*
>  	 * Try all color depths since valid port clock range
> @@ -1963,6 +2008,9 @@ intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>  		if (!intel_hdmi_sink_bpc_possible(connector, bpc, has_hdmi_sink, ycbcr420_output))
>  			continue;
>  
> +		if (!intel_hdmi21_bpc_possible(connector, clock, bpc, ycbcr420_output, frl, dsc))
> +			continue;
> +
>  		status = hdmi_port_clock_valid(hdmi, tmds_clock, true, has_hdmi_sink);
>  		if (status == MODE_OK)
>  			return MODE_OK;
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
