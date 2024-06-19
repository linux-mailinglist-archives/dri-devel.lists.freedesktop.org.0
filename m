Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8475290E7E6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA06B10EB9D;
	Wed, 19 Jun 2024 10:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyOHsP8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FF210EB9D;
 Wed, 19 Jun 2024 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718791814; x=1750327814;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=6HsULT971CnhbER/x6o6Rz2fa4VJ8Fsuq5aHMMj6VAk=;
 b=NyOHsP8YLj0hwTXNU5J5snuqxQ+Cct6zmPP6SKUDeU2K5iwd1OF0jlY+
 i4aD2IOrPd3xKVzgyBb9LIWMtQYixm/BgwjkA+N2AZPzh+LjV3saGz3Xt
 KUi1yhuacAsyHF99fwVfu64vC+PKUsiEu/nlx2MVzjYkCAoc4uQ98lWGa
 jlzqmQd5UdVyoOK00+6MwKuGNpD17xzqXP7JlG3ah4t00re04VX+e55fu
 y+1iu5JkndMKixmcdZG1dIfq0vs7dCvNzTrMQ8w6C5l4a8kpRUXyTe3TP
 yyPwv5CxxJPs+V/JvWm8/0GAURTxPjndViGrfXHq7atpI4vVmyKBRMrTO A==;
X-CSE-ConnectionGUID: /ekwU32iQlaPibLGgyKBUw==
X-CSE-MsgGUID: WLeixkYDQhatt4cW0RFPsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19593037"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="19593037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:10:14 -0700
X-CSE-ConnectionGUID: qZ4Lxp6kQMq848F9vemRIg==
X-CSE-MsgGUID: kry7SYqWSV6AMKJC6IAZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46415663"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:10:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm: Add helpers for x16 fixed point values
In-Reply-To: <20240614173911.3743172-2-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240614173911.3743172-1-imre.deak@intel.com>
 <20240614173911.3743172-2-imre.deak@intel.com>
Date: Wed, 19 Jun 2024 13:10:09 +0300
Message-ID: <87cyodfdku.fsf@intel.com>
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

On Fri, 14 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> Add helpers to convert between x16 fixed point and integer/fraction
> values. Also add the format/argument macros required to printk x16
> fixed point variables.
>
> These are needed by later patches dumping the Display Stream Compression
> configuration in DRM core and in the i915 driver to replace the
> corresponding bpp_x16 helpers defined locally in the driver.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c |  5 +++--
>  include/drm/drm_fixed.h                 | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 79a615667aab1..806f9c9764995 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -35,6 +35,7 @@
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_fixed.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_panel.h>
> @@ -4151,9 +4152,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  	int symbol_cycles;
>  
>  	if (lane_count == 0 || hactive == 0 || bpp_x16 == 0) {
> -		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 %d.%04d\n",
> +		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 " DRM_X16_FMT "\n",
>  			      lane_count, hactive,
> -			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
> +			      DRM_X16_ARGS(bpp_x16));
>  		return 0;
>  	}
>  
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 81572d32db0c2..0fe2a7f50d54e 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -214,4 +214,27 @@ static inline s64 drm_fixp_exp(s64 x)
>  	return sum;
>  }
>  
> +static inline int drm_x16_from_int(int val_int)
> +{
> +	return val_int << 4;
> +}
> +
> +static inline int drm_x16_to_int(int val_x16)
> +{
> +	return val_x16 >> 4;
> +}
> +
> +static inline int drm_x16_to_int_roundup(int val_x16)
> +{
> +	return (val_x16 + 0xf) >> 4;
> +}
> +
> +static inline int drm_x16_to_frac(int val_x16)
> +{
> +	return val_x16 & 0xf;
> +}

Sad trombone about the completely different naming scheme compared to
the rest of the file.

Not saying the existing naming is great, but neither is this. And
there's no way to unify except by renaming *both* afterwards.

We could devise a scheme now that could be used for the existing stuff
later, without renaming the new stuff.

*shrug*

BR,
Jani.



> +
> +#define DRM_X16_FMT		"%d.%04d"
> +#define DRM_X16_ARGS(val_x16)	drm_x16_to_int(val_x16), (drm_x16_to_frac(val_x16) * 625)
> +
>  #endif

-- 
Jani Nikula, Intel
