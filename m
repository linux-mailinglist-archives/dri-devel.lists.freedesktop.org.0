Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C149D353
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2B10E762;
	Wed, 26 Jan 2022 20:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758AD10E37A;
 Wed, 26 Jan 2022 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643228277; x=1674764277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Px7bGrSNO1jdMUTNY9lxWTwrOx1GoXaFfYCtoHz8Ac=;
 b=QnnOLhs3YFSp2/p/abHsAkNWHykMeb2rf8PVrWl2aq+ztUZanulOZDbc
 GL1K8k/XMmdgiyHqokGJVTX/QsmX+CTqIoPlB9eHjBc1RstdefDFa9Ary
 TrNZ87f2SEq6zYBhrtFJOvZ7Xq1vwsMIOxmy9Z+AgbdPSnprmvHtQpo4E
 TSjjvUuQUd54Fo/EddEFkT5mkwdem3LkDq1fqn8z77SpaXW8ALW3TcbzK
 qCyR5hI+p1pyt/+7UKQ20KBjX9mBTKsEgzEHHwx3nNw43EcS/TQ0rWRTj
 opoS1n1F3rnErY/Xd+7aGXy7T9ezB2cQteqobnL5I3qtmAgAvJ4AC9EnL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226619767"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="226619767"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:17:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="480010677"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:17:56 -0800
Date: Wed, 26 Jan 2022 12:12:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/4] drm/i915/guc: Cancel requests immediately
Message-ID: <20220126201213.GA19165@jons-linux-dev-box>
References: <20220124150157.15758-1-matthew.brost@intel.com>
 <20220124150157.15758-3-matthew.brost@intel.com>
 <5c436bf7-0ed6-83b6-6061-fdc73d4cc081@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c436bf7-0ed6-83b6-6061-fdc73d4cc081@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 10:58:46AM -0800, John Harrison wrote:
> On 1/24/2022 07:01, Matthew Brost wrote:
> > Change the preemption timeout to the smallest possible value (1 us) when
> > disabling scheduling to cancel a request and restore it after
> > cancellation. This not only cancels the request as fast as possible, it
> > fixes a bug where the preemption timeout is 0 which results in the
> > schedule disable hanging forever.
> Shouldn't there be an 'if' in the above statement? The pre-emption timeout
> is not normally zero.
>

Yes. Will reword.
 
> > 
> > Reported-by: Jani Saarinen <jani.saarinen@intel.com>
> > Fixes: 62eaf0ae217d4 ("drm/i915/guc: Support request cancellation")
> > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/4960
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context_types.h |  5 ++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 46 +++++++++++--------
> >   2 files changed, 31 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 30cd81ad8911a..730998823dbea 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -198,6 +198,11 @@ struct intel_context {
> >   		 * each priority bucket
> >   		 */
> >   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
> > +		/**
> > +		 * @preemption_timeout: preemption timeout of the context, used
> > +		 * to restore this value after request cancellation
> > +		 */
> > +		u32 preemption_timeout;
> >   	} guc_state;
> >   	struct {
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 3918f1be114fa..966947c450253 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2147,7 +2147,8 @@ static inline u32 get_children_join_value(struct intel_context *ce,
> >   	return __get_parent_scratch(ce)->join[child_index].semaphore;
> >   }
> > -static void guc_context_policy_init(struct intel_engine_cs *engine,
> > +static void guc_context_policy_init(struct intel_context *ce,
> > +				    struct intel_engine_cs *engine,
> >   				    struct guc_lrc_desc *desc)
> Shouldn't engine be before ce? The more general structure usually goes
> first.
> 

Sure. Fix fix this in the next rev.

Matt

> John.
> 
> >   {
> >   	desc->policy_flags = 0;
> > @@ -2157,7 +2158,8 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
> >   	/* NB: For both of these, zero means disabled. */
> >   	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
> > -	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> > +	ce->guc_state.preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> > +	desc->preemption_timeout = ce->guc_state.preemption_timeout;
> >   }
> >   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> > @@ -2193,7 +2195,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   	desc->hw_context_desc = ce->lrc.lrca;
> >   	desc->priority = ce->guc_state.prio;
> >   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > -	guc_context_policy_init(engine, desc);
> > +	guc_context_policy_init(ce, engine, desc);
> >   	/*
> >   	 * If context is a parent, we need to register a process descriptor
> > @@ -2226,7 +2228,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   			desc->hw_context_desc = child->lrc.lrca;
> >   			desc->priority = ce->guc_state.prio;
> >   			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > -			guc_context_policy_init(engine, desc);
> > +			guc_context_policy_init(child, engine, desc);
> >   		}
> >   		clear_children_join_go_memory(ce);
> > @@ -2409,6 +2411,19 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
> >   	return ce->guc_id.id;
> >   }
> > +static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> > +						 u16 guc_id,
> > +						 u32 preemption_timeout)
> > +{
> > +	u32 action[] = {
> > +		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> > +		guc_id,
> > +		preemption_timeout
> > +	};
> > +
> > +	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > +}
> > +
> >   static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> >   {
> >   	struct intel_guc *guc = ce_to_guc(ce);
> > @@ -2442,8 +2457,10 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> >   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > -	with_intel_runtime_pm(runtime_pm, wakeref)
> > +	with_intel_runtime_pm(runtime_pm, wakeref) {
> > +		__guc_context_set_preemption_timeout(guc, guc_id, 1);
> >   		__guc_context_sched_disable(guc, ce, guc_id);
> > +	}
> >   	return &ce->guc_state.blocked;
> >   }
> > @@ -2492,8 +2509,10 @@ static void guc_context_unblock(struct intel_context *ce)
> >   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > -	if (enable) {
> > -		with_intel_runtime_pm(runtime_pm, wakeref)
> > +	with_intel_runtime_pm(runtime_pm, wakeref) {
> > +		__guc_context_set_preemption_timeout(guc, ce->guc_id.id,
> > +						     ce->guc_state.preemption_timeout);
> > +		if (enable)
> >   			__guc_context_sched_enable(guc, ce);
> >   	}
> >   }
> > @@ -2521,19 +2540,6 @@ static void guc_context_cancel_request(struct intel_context *ce,
> >   	}
> >   }
> > -static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> > -						 u16 guc_id,
> > -						 u32 preemption_timeout)
> > -{
> > -	u32 action[] = {
> > -		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> > -		guc_id,
> > -		preemption_timeout
> > -	};
> > -
> > -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > -}
> > -
> >   static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> >   {
> >   	struct intel_guc *guc = ce_to_guc(ce);
> 
