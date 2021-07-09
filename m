Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF93C2B73
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4612D6E9AB;
	Fri,  9 Jul 2021 22:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385956E9A7;
 Fri,  9 Jul 2021 22:39:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="273621419"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="273621419"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 15:39:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="649658740"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.142.243])
 ([10.212.142.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 15:39:30 -0700
From: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 14/47] drm/i915/guc: Insert fence on context when
 deregistering
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-15-matthew.brost@intel.com>
Message-ID: <33ca1529-fabb-f59c-dba1-cedcececac73@intel.com>
Date: Fri, 9 Jul 2021 15:39:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-15-matthew.brost@intel.com>
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
> Sometime during context pinning a context with the same guc_id is
Sometime*s*

> registered with the GuC. In this a case deregister must be before before
before before -> done before

> the context can be registered. A fence is inserted on all requests while
> the deregister is in flight. Once the G2H is received indicating the
> deregistration is complete the context is registered and the fence is
> released.
>
> Cc: John Harrison<john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
With the above text fixed up:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  1 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  5 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 51 ++++++++++++++++++-
>   drivers/gpu/drm/i915/i915_request.h           |  8 +++
>   4 files changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 2b68af16222c..f750c826e19d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -384,6 +384,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	mutex_init(&ce->pin_mutex);
>   
>   	spin_lock_init(&ce->guc_state.lock);
> +	INIT_LIST_HEAD(&ce->guc_state.fences);
>   
>   	ce->guc_id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id_link);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index ce7c69b34cd1..beafe55a9101 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -146,6 +146,11 @@ struct intel_context {
>   		 * submission
>   		 */
>   		u8 sched_state;
> +		/*
> +		 * fences: maintains of list of requests that have a submit
> +		 * fence related to GuC submission
> +		 */
> +		struct list_head fences;
>   	} guc_state;
>   
>   	/* GuC scheduling state that does not require a lock. */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d39579ac2faa..49e5d460d54b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -924,6 +924,30 @@ static const struct intel_context_ops guc_context_ops = {
>   	.destroy = guc_context_destroy,
>   };
>   
> +static void __guc_signal_context_fence(struct intel_context *ce)
> +{
> +	struct i915_request *rq;
> +
> +	lockdep_assert_held(&ce->guc_state.lock);
> +
> +	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
> +		i915_sw_fence_complete(&rq->submit);
> +
> +	INIT_LIST_HEAD(&ce->guc_state.fences);
> +}
> +
> +static void guc_signal_context_fence(struct intel_context *ce)
> +{
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!context_wait_for_deregister_to_register(ce));
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	clr_context_wait_for_deregister_to_register(ce);
> +	__guc_signal_context_fence(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +}
> +
>   static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>   {
>   	return new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> @@ -934,6 +958,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
>   	struct intel_guc *guc = ce_to_guc(ce);
> +	unsigned long flags;
>   	int ret;
>   
>   	GEM_BUG_ON(!intel_context_is_pinned(rq->context));
> @@ -978,7 +1003,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
>   	 */
>   	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
> -		return 0;
> +		goto out;
>   
>   	ret = pin_guc_id(guc, ce);	/* returns 1 if new guc_id assigned */
>   	if (unlikely(ret < 0))
> @@ -994,6 +1019,28 @@ static int guc_request_alloc(struct i915_request *rq)
>   
>   	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
>   
> +out:
> +	/*
> +	 * We block all requests on this context if a G2H is pending for a
> +	 * context deregistration as the GuC will fail a context registration
> +	 * while this G2H is pending. Once a G2H returns, the fence is released
> +	 * that is blocking these requests (see guc_signal_context_fence).
> +	 *
> +	 * We can safely check the below field outside of the lock as it isn't
> +	 * possible for this field to transition from being clear to set but
> +	 * converse is possible, hence the need for the check within the lock.
> +	 */
> +	if (likely(!context_wait_for_deregister_to_register(ce)))
> +		return 0;
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (context_wait_for_deregister_to_register(ce)) {
> +		i915_sw_fence_await(&rq->submit);
> +
> +		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
>   	return 0;
>   }
>   
> @@ -1295,7 +1342,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref)
>   			register_context(ce);
> -		clr_context_wait_for_deregister_to_register(ce);
> +		guc_signal_context_fence(ce);
>   		intel_context_put(ce);
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 239964bec1fa..f870cd75a001 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -285,6 +285,14 @@ struct i915_request {
>   		struct hrtimer timer;
>   	} watchdog;
>   
> +	/*
> +	 * Requests may need to be stalled when using GuC submission waiting for
> +	 * certain GuC operations to complete. If that is the case, stalled
> +	 * requests are added to a per context list of stalled requests. The
> +	 * below list_head is the link in that list.
> +	 */
> +	struct list_head guc_fence_link;
> +
>   	I915_SELFTEST_DECLARE(struct {
>   		struct list_head link;
>   		unsigned long delay;

