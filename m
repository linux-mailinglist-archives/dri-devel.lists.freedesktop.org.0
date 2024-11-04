Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CE59BB67A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 14:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5EA10E3E8;
	Mon,  4 Nov 2024 13:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrVfVaGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD25D10E2BF;
 Mon,  4 Nov 2024 13:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730727635; x=1762263635;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QxmywQEfCsn8GZ6MvznZbVutwDiCCNU4hqA7Zb+ojng=;
 b=LrVfVaGTvZqsP9co79YETneIIJ7OrjUT8IzB2DHyel2uXk3QNNVVP9jP
 4E9FWPrFPNYX2MQTFjdaa5txy+yf1zzyBJZDrZrOLgN0khybvejbtAIet
 mBvrdJ09o3VCJ8zU8GdyYb2cijE1cmTOgt8/4iDNSwUdjTfJnnHN8DScc
 Se7imNAi3WRWbgYwJtAyhU9PYehkz5+t1Idz9ceul4+ipbe06RldJpvtG
 Z9Wk2lY78a+qPFp/PPreVOGxspO4qzf2tiCcRXir+IRNL80NNGzgS8kA+
 irsQXXQeJeQuRn2XwzPYkSdmAdF6vd3oneIXQOM2rglpfN1pxuaHbxpse g==;
X-CSE-ConnectionGUID: dVEEqFOtQXGshiD3c7GVzg==
X-CSE-MsgGUID: Ki1u7kRnSqimy4N8NSkdaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41794894"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="41794894"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 05:40:34 -0800
X-CSE-ConnectionGUID: TjihC+fLROyR5R5tUPrrVA==
X-CSE-MsgGUID: 1ySYuZ8ZQxuhVYP21YTyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="84003595"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 05:40:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Gray <jsg@jsg.id.au>
Cc: alan.previn.teres.alexis@intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pxp: fix non-optimised !CONFIG_DRM_I915_PXP build
In-Reply-To: <ZyizusZMV_HhFJtH@largo.jsg.id.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241103110230.11035-1-jsg@jsg.id.au>
 <87r07ri9rn.fsf@intel.com> <ZyizusZMV_HhFJtH@largo.jsg.id.au>
Date: Mon, 04 Nov 2024 15:40:28 +0200
Message-ID: <87ed3ri0c3.fsf@intel.com>
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

On Mon, 04 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> On Mon, Nov 04, 2024 at 12:16:44PM +0200, Jani Nikula wrote:
>> On Sun, 03 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
>> > intel_pxp_gsccs_is_ready_for_sessions() is gated by CONFIG_DRM_I915_PXP
>> > but called from intel_pxp.c which isn't.  Provide a fallback inline
>> > function to fix the non-optimised build.
>> 
>> What does this have to do with optimization? Isn't the build just plain
>> broken for PXP=n?
>
> With clang/lld 16 on OpenBSD with PXP=n, intel_pxp.o with -O0 has an
> undefined reference to intel_pxp_gsccs_is_ready_for_sessions,
> with -O1 and -O2 it doesn't and the kernel links.

Right, so it can determine intel_pxp_get_readiness_status() is basically
a nop for PXP=n.

BR,
Jani.


>
>> 
>> BR,
>> Jani.
>> 
>> 
>> >
>> > Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
>> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
>> > ---
>> >  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
>> >  1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>> > index 9aae779c4da3..b93488e99685 100644
>> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>> > @@ -16,26 +16,30 @@ struct intel_pxp;
>> >  #define GSC_PENDING_RETRY_PAUSE_MS 50
>> >  #define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_HECI_REPLY_LATENCY_MS + \
>> >  					 (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS))
>> >  
>> >  #ifdef CONFIG_DRM_I915_PXP
>> >  void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
>> >  int intel_pxp_gsccs_init(struct intel_pxp *pxp);
>> > +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
>> >  
>> >  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
>> >  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>> >  
>> >  #else
>> >  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
>> >  {
>> >  }
>> >  
>> >  static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
>> >  {
>> >  	return 0;
>> >  }
>> >  
>> > -#endif
>> > +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
>> > +{
>> > +	return false;
>> > +}
>> >  
>> > -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
>> > +#endif
>> >  
>> >  #endif /*__INTEL_PXP_GSCCS_H__ */
>> 
>> -- 
>> Jani Nikula, Intel
>> 

-- 
Jani Nikula, Intel
