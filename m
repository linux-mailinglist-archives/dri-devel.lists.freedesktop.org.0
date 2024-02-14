Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D9855236
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B3010E14C;
	Wed, 14 Feb 2024 18:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+8gsCkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32A10E090;
 Wed, 14 Feb 2024 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707935670; x=1739471670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rOnNQdH7oNbEkeS/0Lx5DM+c9aU2T0FkvK6qsYMvCdI=;
 b=n+8gsCkLJry47w4j/pQITUwkAIsP42bhWVahrXehtoRFYf456Y0sKfcs
 irK6YpQzrqrITmN9tyj1kfZXr6Pvb3VzSlE+RvlMwhAgqYuRVSUvSPg1v
 v5y1oG4wI9Rh6NOVvvxV1QenQlcGhs/Bm4zRXzh4+27+GmGk7Q8y3y2fv
 d+C/+YeHKPIpvkiYOrf42V0C5XAHoPvYzYK1YpCGfOUDCG4+gismyoUYv
 ZzXcqaUXZRdCs2cMzBoAakfBT9bE1wtBTnYZ6vjlJAOjQDg8ZIa+flvCv
 WyZ9rRJraPiOxut2G02aO2n9nfZ+NVnZt8a0Q56JQ7LJnycRM/K6diVab w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1872615"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1872615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369707"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369707"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:34:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Feb 2024 20:34:25 +0200
Date: Wed, 14 Feb 2024 20:34:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915/mst: add intel_dp_mst_disconnect()
Message-ID: <Zc0HsbQRvxJ2emwb@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <19287946420a86aaea54f3ee7ee8507978ea7c31.1707823736.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19287946420a86aaea54f3ee7ee8507978ea7c31.1707823736.git.jani.nikula@intel.com>
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

On Tue, Feb 13, 2024 at 01:31:00PM +0200, Jani Nikula wrote:
> Abstract the MST mode disconnect to a separate function.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 72e91322e310..7f97d5512a3e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4069,6 +4069,20 @@ intel_dp_mst_configure(struct intel_dp *intel_dp)
>  	intel_dp->mst_detect = DRM_DP_SST;
>  }
>  
> +static void
> +intel_dp_mst_disconnect(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +
> +	if (!intel_dp->is_mst)
> +		return;
> +
> +	drm_dbg_kms(&i915->drm, "MST device may have disappeared %d vs %d\n",
> +		    intel_dp->is_mst, intel_dp->mst_mgr.mst_state);
> +	intel_dp->is_mst = false;
> +	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
> +}
> +
>  static bool
>  intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)
>  {
> @@ -5721,15 +5735,7 @@ intel_dp_detect(struct drm_connector *connector,
>  		memset(intel_connector->dp.dsc_dpcd, 0, sizeof(intel_connector->dp.dsc_dpcd));
>  		intel_dp->psr.sink_panel_replay_support = false;
>  
> -		if (intel_dp->is_mst) {
> -			drm_dbg_kms(&dev_priv->drm,
> -				    "MST device may have disappeared %d vs %d\n",
> -				    intel_dp->is_mst,
> -				    intel_dp->mst_mgr.mst_state);
> -			intel_dp->is_mst = false;
> -			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> -							intel_dp->is_mst);
> -		}
> +		intel_dp_mst_disconnect(intel_dp);
>  
>  		goto out;
>  	}
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
