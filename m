Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A61984732B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE210EB06;
	Fri,  2 Feb 2024 15:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlTxufE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6653210E813;
 Fri,  2 Feb 2024 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706887826; x=1738423826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0mHxORDr38O9nKHM/zJWGh2u7vyAfg4btxVzicEv4Nc=;
 b=PlTxufE+7jnJ1Gt8CcGimRgpUI6LvnZSGVovL4ySmWIPEYfyjQ83XQ7F
 3zRNkC54x3NWseXpl1AvZU+IbCpNHHqGrv/ZHzpklsQppjtn6dfhKzHwX
 ZBdCpZO7ovGJzEXx7iz70xXu6ZUcuVic5wWxYGSWsyYtwnNMJqU5lY+0L
 7BIabA3/NpKfePLAD53m2Sxqz1J40Ox1Y44ggqWevHrGZlTNtEkRMf018
 n6hi+wDVwFDHQlng8sAqS9pdHpFA8/lsMFV4zGVWQLmZ+XCsmhQuO/8ZW
 5K8Q9f0ikDDaxbmv6IrycOstuXjMlzr4PtmWJwLmHQ0qpufdaobXxZNx5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11276599"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="11276599"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="37529209"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:30:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCHv2 2/2] drm/i915/display/dp: 128/132b DP-capable with SST
In-Reply-To: <20240131102344.1671929-2-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240131102344.1671929-1-arun.r.murthy@intel.com>
 <20240131102344.1671929-2-arun.r.murthy@intel.com>
Date: Fri, 02 Feb 2024 17:30:20 +0200
Message-ID: <87r0hueveb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 31 Jan 2024, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> With a value of '0' read from MSTM_CAP register MST to be enabled.
> DP2.1 SCR updates the spec for 128/132b DP capable supporting only one
> stream and not supporting single stream sideband MSG.
> The underlying protocol will be MST to enable use of MTP.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 9ff0cbd9c0df..05722f10cdd7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4037,9 +4037,15 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  
>  	if (!intel_dp_mst_source_support(intel_dp))
>  		return;
> -
> -	intel_dp->is_mst = sink_can_mst &&
> -		i915->display.params.enable_dp_mst;
> +	/*
> +	 * Even if dpcd reg MSTM_CAP is 0, if the sink supports UHBR rates then
> +	 * DP2.1 can be enabled with underlying protocol using MST for MTP
> +	 * TODO: Need to accommodate MSTM_CAP bit[0]=0, bit[1]=1 condition, i.e
> +	 * one stream with single stream sideband msg.
> +	 */
> +	intel_dp->is_mst = (sink_can_mst || (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] &
> +					     DP_CAP_ANSI_128B132B)) &&
> +			    i915->display.params.enable_dp_mst;

Based on testing with the specific display in question, it looks like
this works because the display, while having DP_MSTM_CAP == 0, does
actually support sideband messaging. Which is unexpected.

This means a display that has DP_MSTM_CAP == 0 that actually does not
support sideband messaging, which is expected, will get a black screen
with this patch.

This was the conclusion when I discussed this with Ville and Imre.

Related to this, I've posted a series to enable MST mode for 128b/132b
displays that support single-stream with sideband messaging [1]. It
obviously does not directly help here, as that requires DP_MSTM_CAP ==
2. It might be possible to quirk the one display to use that. Maybe. The
alternative is actually implementing 128b/132b single-stream w/o
sideband messaging using our regular SST paths.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/129468/


>  
>  	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
>  					intel_dp->is_mst);

-- 
Jani Nikula, Intel
