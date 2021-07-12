Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0AF3C6267
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 20:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE9A896E7;
	Mon, 12 Jul 2021 18:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F13889402;
 Mon, 12 Jul 2021 18:08:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="207014142"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="207014142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:08:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="412664344"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.125.18])
 ([10.209.125.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:08:23 -0700
Subject: Re: [PATCH 24/47] drm/i915/guc: Add several request trace points
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-25-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a08958aa-0603-be36-5d61-0cb14a4abb5f@intel.com>
Date: Mon, 12 Jul 2021 11:08:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-25-matthew.brost@intel.com>
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
> Add trace points for request dependencies and GuC submit. Extended
> existing request trace points to include submit fence value,, guc_id,
Excessive punctuation. Or maybe should say 'fence value, tail, guc_id'? 
With that fixed:

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> and ring tail value.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 ++
>   drivers/gpu/drm/i915/i915_request.c           |  3 ++
>   drivers/gpu/drm/i915/i915_trace.h             | 39 ++++++++++++++++++-
>   3 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 89b3c7e5d15b..c2327eebc09c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -422,6 +422,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   			guc->stalled_request = last;
>   			return false;
>   		}
> +		trace_i915_request_guc_submit(last);
>   	}
>   
>   	guc->stalled_request = NULL;
> @@ -642,6 +643,8 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   	ret = guc_add_request(guc, rq);
>   	if (ret == -EBUSY)
>   		guc->stalled_request = rq;
> +	else
> +		trace_i915_request_guc_submit(rq);
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index d92c9f25c9f4..7f7aa096e873 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1344,6 +1344,9 @@ __i915_request_await_execution(struct i915_request *to,
>   			return err;
>   	}
>   
> +	trace_i915_request_dep_to(to);
> +	trace_i915_request_dep_from(from);
> +
>   	/* Couple the dependency tree for PI on this exposed to->fence */
>   	if (to->engine->sched_engine->schedule) {
>   		err = i915_sched_node_add_dependency(&to->sched,
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 6778ad2a14a4..b02d04b6c8f6 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -794,22 +794,27 @@ DECLARE_EVENT_CLASS(i915_request,
>   	    TP_STRUCT__entry(
>   			     __field(u32, dev)
>   			     __field(u64, ctx)
> +			     __field(u32, guc_id)
>   			     __field(u16, class)
>   			     __field(u16, instance)
>   			     __field(u32, seqno)
> +			     __field(u32, tail)
>   			     ),
>   
>   	    TP_fast_assign(
>   			   __entry->dev = rq->engine->i915->drm.primary->index;
>   			   __entry->class = rq->engine->uabi_class;
>   			   __entry->instance = rq->engine->uabi_instance;
> +			   __entry->guc_id = rq->context->guc_id;
>   			   __entry->ctx = rq->fence.context;
>   			   __entry->seqno = rq->fence.seqno;
> +			   __entry->tail = rq->tail;
>   			   ),
>   
> -	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
> +	    TP_printk("dev=%u, engine=%u:%u, guc_id=%u, ctx=%llu, seqno=%u, tail=%u",
>   		      __entry->dev, __entry->class, __entry->instance,
> -		      __entry->ctx, __entry->seqno)
> +		      __entry->guc_id, __entry->ctx, __entry->seqno,
> +		      __entry->tail)
>   );
>   
>   DEFINE_EVENT(i915_request, i915_request_add,
> @@ -818,6 +823,21 @@ DEFINE_EVENT(i915_request, i915_request_add,
>   );
>   
>   #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
> +DEFINE_EVENT(i915_request, i915_request_dep_to,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
> +DEFINE_EVENT(i915_request, i915_request_dep_from,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
> +DEFINE_EVENT(i915_request, i915_request_guc_submit,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
>   DEFINE_EVENT(i915_request, i915_request_submit,
>   	     TP_PROTO(struct i915_request *rq),
>   	     TP_ARGS(rq)
> @@ -887,6 +907,21 @@ TRACE_EVENT(i915_request_out,
>   
>   #else
>   #if !defined(TRACE_HEADER_MULTI_READ)
> +static inline void
> +trace_i915_request_dep_to(struct i915_request *rq)
> +{
> +}
> +
> +static inline void
> +trace_i915_request_dep_from(struct i915_request *rq)
> +{
> +}
> +
> +static inline void
> +trace_i915_request_guc_submit(struct i915_request *rq)
> +{
> +}
> +
>   static inline void
>   trace_i915_request_submit(struct i915_request *rq)
>   {

