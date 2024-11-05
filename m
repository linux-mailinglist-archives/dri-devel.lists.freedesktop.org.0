Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043D9BC90E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 10:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E3510E53C;
	Tue,  5 Nov 2024 09:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Il/WSb0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDECE10E53C;
 Tue,  5 Nov 2024 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730798623; x=1762334623;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HrFfloj1xugxvZpzacbzjtJX6bmlKgbMu1czX0iKU1I=;
 b=Il/WSb0dB4YvICAaZ18qni6Bo6MlMNgB9n6vUo3qyD4oe4pnRhkiJcII
 8BJsl1ddjPgV1n1kUo722kiTlpPjgYIyv4Rzfi8BE8ptP2xq9b/mueXrz
 92uLNebtOOM/qnGhL2GHJiPEfM8R3qcA918kdF5ojIjPZlmKI4KnhNx6o
 ketjt2jGNJzhkzB33Fr/nBPUWibYFpzvLAhKVOxx6puWj9UXZitEBN3Qv
 x4qypBJ8fJDhbns6jlUFCwXnuBaumz5vtLPMvJNMSZJaXqbpESnopS4UZ
 PaQZRg0Mk5xhnSvfkda3elzGohmUgv6KfFLcdOQIyx8KeQeb1OJM5jkAn w==;
X-CSE-ConnectionGUID: vf7ex8G5TS6LHglLd71crw==
X-CSE-MsgGUID: VPMV3SqMRTSu9Aut4euZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41127044"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="41127044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 01:23:42 -0800
X-CSE-ConnectionGUID: 8B9n3gkNRmStzabaZMAj4w==
X-CSE-MsgGUID: u77hMLFGTZK0xzHjIsLsxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="114725940"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 01:23:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Gray <jsg@jsg.id.au>, alan.previn.teres.alexis@intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pxp: fix non-optimised !CONFIG_DRM_I915_PXP build
In-Reply-To: <20241103110230.11035-1-jsg@jsg.id.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241103110230.11035-1-jsg@jsg.id.au>
Date: Tue, 05 Nov 2024 11:23:36 +0200
Message-ID: <87msieghk7.fsf@intel.com>
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

On Sun, 03 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> intel_pxp_gsccs_is_ready_for_sessions() is gated by CONFIG_DRM_I915_PXP
> but called from intel_pxp.c which isn't.  Provide a fallback inline
> function to fix the non-optimised build.
>
> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
> Signed-off-by: Jonathan Gray <jsg@jsg.id.au>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index 9aae779c4da3..b93488e99685 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -16,26 +16,30 @@ struct intel_pxp;
>  #define GSC_PENDING_RETRY_PAUSE_MS 50
>  #define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_HECI_REPLY_LATENCY_MS + \
>  					 (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS))
>  
>  #ifdef CONFIG_DRM_I915_PXP
>  void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
>  int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
>  
>  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
>  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>  
>  #else
>  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
>  {
>  }
>  
>  static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
>  {
>  	return 0;
>  }
>  
> -#endif
> +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
> +{
> +	return false;
> +}
>  
> -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> +#endif
>  
>  #endif /*__INTEL_PXP_GSCCS_H__ */

-- 
Jani Nikula, Intel
