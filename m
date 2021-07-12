Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565A3C626E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 20:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AA389402;
	Mon, 12 Jul 2021 18:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E50089402;
 Mon, 12 Jul 2021 18:10:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197303511"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="197303511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:10:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="412664964"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.125.18])
 ([10.209.125.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:10:40 -0700
Subject: Re: [PATCH 25/47] drm/i915: Add intel_context tracing
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-26-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <fd3fddd9-f2e8-f56d-b81e-f80704f7f453@intel.com>
Date: Mon, 12 Jul 2021 11:10:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/2021 00:04, Matthew Brost wrote:
> Add intel_context tracing. These trace points are particular helpful
> when debugging the GuC firmware and can be enabled via
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS kernel config option.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   6 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  14 ++
>   drivers/gpu/drm/i915/i915_trace.h             | 148 +++++++++++++++++-
>   3 files changed, 166 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 7f97753ab164..b24a1b7a3f88 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -8,6 +8,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_globals.h"
> +#include "i915_trace.h"
>   
>   #include "intel_context.h"
>   #include "intel_engine.h"
> @@ -28,6 +29,7 @@ static void rcu_context_free(struct rcu_head *rcu)
>   {
>   	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
>   
> +	trace_intel_context_free(ce);
>   	kmem_cache_free(global.slab_ce, ce);
>   }
>   
> @@ -46,6 +48,7 @@ intel_context_create(struct intel_engine_cs *engine)
>   		return ERR_PTR(-ENOMEM);
>   
>   	intel_context_init(ce, engine);
> +	trace_intel_context_create(ce);
>   	return ce;
>   }
>   
> @@ -268,6 +271,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>   
>   	GEM_BUG_ON(!intel_context_is_pinned(ce)); /* no overflow! */
>   
> +	trace_intel_context_do_pin(ce);
> +
>   err_unlock:
>   	mutex_unlock(&ce->pin_mutex);
>   err_post_unpin:
> @@ -323,6 +328,7 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub)
>   	 */
>   	intel_context_get(ce);
>   	intel_context_active_release(ce);
> +	trace_intel_context_do_unpin(ce);
>   	intel_context_put(ce);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index c2327eebc09c..d605af0d66e6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -348,6 +348,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   
>   	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>   	if (!enabled && !err) {
> +		trace_intel_context_sched_enable(ce);
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   		set_context_enabled(ce);
>   	} else if (!enabled) {
> @@ -812,6 +813,8 @@ static int register_context(struct intel_context *ce)
>   	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
>   		ce->guc_id * sizeof(struct guc_lrc_desc);
>   
> +	trace_intel_context_register(ce);
> +
>   	return __guc_action_register_context(guc, ce->guc_id, offset);
>   }
>   
> @@ -831,6 +834,8 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> +	trace_intel_context_deregister(ce);
> +
>   	return __guc_action_deregister_context(guc, guc_id);
>   }
>   
> @@ -905,6 +910,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
>   	 * GuC before registering this context.
>   	 */
>   	if (context_registered) {
> +		trace_intel_context_steal_guc_id(ce);
>   		set_context_wait_for_deregister_to_register(ce);
>   		intel_context_get(ce);
>   
> @@ -963,6 +969,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
>   
> +	trace_intel_context_sched_disable(ce);
>   	intel_context_get(ce);
>   
>   	guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
> @@ -1119,6 +1126,9 @@ static void __guc_signal_context_fence(struct intel_context *ce)
>   
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
> +	if (!list_empty(&ce->guc_state.fences))
> +		trace_intel_context_fence_release(ce);
> +
>   	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
>   		i915_sw_fence_complete(&rq->submit);
>   
> @@ -1529,6 +1539,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	if (unlikely(!ce))
>   		return -EPROTO;
>   
> +	trace_intel_context_deregister_done(ce);
> +
>   	if (context_wait_for_deregister_to_register(ce)) {
>   		struct intel_runtime_pm *runtime_pm =
>   			&ce->engine->gt->i915->runtime_pm;
> @@ -1580,6 +1592,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		return -EPROTO;
>   	}
>   
> +	trace_intel_context_sched_done(ce);
> +
>   	if (context_pending_enable(ce)) {
>   		clr_context_pending_enable(ce);
>   	} else if (context_pending_disable(ce)) {
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index b02d04b6c8f6..97c2e83984ed 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -818,8 +818,8 @@ DECLARE_EVENT_CLASS(i915_request,
>   );
>   
>   DEFINE_EVENT(i915_request, i915_request_add,
> -	    TP_PROTO(struct i915_request *rq),
> -	    TP_ARGS(rq)
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
Is this an intentional white space change?

>   );
>   
>   #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
> @@ -905,6 +905,90 @@ TRACE_EVENT(i915_request_out,
>   			      __entry->ctx, __entry->seqno, __entry->completed)
>   );
>   
> +DECLARE_EVENT_CLASS(intel_context,
> +	    TP_PROTO(struct intel_context *ce),
> +	    TP_ARGS(ce),
> +
> +	    TP_STRUCT__entry(
> +			     __field(u32, guc_id)
> +			     __field(int, pin_count)
> +			     __field(u32, sched_state)
> +			     __field(u32, guc_sched_state_no_lock)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __entry->guc_id = ce->guc_id;
> +			   __entry->pin_count = atomic_read(&ce->pin_count);
> +			   __entry->sched_state = ce->guc_state.sched_state;
> +			   __entry->guc_sched_state_no_lock =
> +			   atomic_read(&ce->guc_sched_state_no_lock);
> +			   ),
> +
> +	    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x",
> +		      __entry->guc_id, __entry->pin_count, __entry->sched_state,
> +		      __entry->guc_sched_state_no_lock)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_register,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_deregister,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_deregister_done,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_sched_enable,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_sched_disable,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_sched_done,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_create,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_fence_release,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_free,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_steal_guc_id,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_do_pin,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_do_unpin,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
>   #else
>   #if !defined(TRACE_HEADER_MULTI_READ)
>   static inline void
> @@ -941,6 +1025,66 @@ static inline void
>   trace_i915_request_out(struct i915_request *rq)
>   {
>   }
> +
> +static inline void
> +trace_intel_context_register(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_deregister(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_deregister_done(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_sched_enable(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_sched_disable(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_sched_done(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_create(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_fence_release(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_free(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_steal_guc_id(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_do_pin(struct intel_context *ce)
> +{
> +}
> +
> +static inline void
> +trace_intel_context_do_unpin(struct intel_context *ce)
> +{
> +}
>   #endif
>   #endif
>   

