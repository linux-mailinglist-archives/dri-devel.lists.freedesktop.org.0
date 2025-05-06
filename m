Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E164AAC514
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 15:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D1310E689;
	Tue,  6 May 2025 13:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0N924qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC87E10E689;
 Tue,  6 May 2025 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746536693; x=1778072693;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6U5I5RsNFuaLbFYwhq39Rwn+zbLTS5g6nFY43grLNgE=;
 b=h0N924qwF9Uvkw5ZMK8hNo0NHHiMPoM89NJj/0fplAaY4Ab4ep1J/GPY
 zLGCGvhsYP/E2Hp6v8zuv3oxRztmXJAw56J29YjXIzA+/4u4JjYK2QB6X
 JSsYguUMQC99BBjPMa2NyVnd7M7iG8VBAfSGF7NiIu/7HxQf1ER+/WCgF
 6dTJblAMmYq1OuEpUzicXG2y+KbgCRXc2Y+LOtFInndamMwdzH95ajzxo
 Ks8lgTmB91zrrsZzulu4QqLO/rXvC6ZA9vV39iwb4LipTbd692KxMKhI5
 N9dFO6eya6cjKhI4jIc3DyLzBczKkx8j7FdlqXY0ltpfuqjzMElAea8kW w==;
X-CSE-ConnectionGUID: +uaS/NcbRXOeHPiqAlE47A==
X-CSE-MsgGUID: flXlJ594TQO477HSMbZOPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48337399"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48337399"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:04:49 -0700
X-CSE-ConnectionGUID: 5yAz1KFXTMOftnTKBGkh3Q==
X-CSE-MsgGUID: 8Yh46J7rQlSvUqIlTF92ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136140580"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.221])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:04:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Gray <jsg@jsg.id.au>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pxp: fix non-optimised !CONFIG_DRM_I915_PXP build
In-Reply-To: <aBoDqgR_uxbK7SjU@largo.jsg.id.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241103110230.11035-1-jsg@jsg.id.au>
 <87msieghk7.fsf@intel.com> <aBoDqgR_uxbK7SjU@largo.jsg.id.au>
Date: Tue, 06 May 2025 16:04:45 +0300
Message-ID: <87wmatvqj6.fsf@intel.com>
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

On Tue, 06 May 2025, Jonathan Gray <jsg@jsg.id.au> wrote:
> On Tue, Nov 05, 2024 at 11:23:36AM +0200, Jani Nikula wrote:
>> On Sun, 03 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
>> > intel_pxp_gsccs_is_ready_for_sessions() is gated by CONFIG_DRM_I915_PXP
>> > but called from intel_pxp.c which isn't.  Provide a fallback inline
>> > function to fix the non-optimised build.
>> >
>> > Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
>> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
>> 
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> equivalent patch was merged and now queued for stable
> 7e21ea8149a0 ("drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'")

Oh, damn. I'm really sorry for first dropping the ball on your patch,
and then encountering another patch and forgetting one like that already
existed.

My bad, apologies.

BR,
Jani.

>
>> 
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
