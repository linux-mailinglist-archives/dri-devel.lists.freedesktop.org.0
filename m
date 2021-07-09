Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F242A3C2B87
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0538D6E9AE;
	Fri,  9 Jul 2021 22:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8D6E9AD;
 Fri,  9 Jul 2021 22:59:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="209832022"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="209832022"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 15:59:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="649662561"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.142.243])
 ([10.212.142.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 15:59:12 -0700
Subject: Re: [PATCH 17/47] drm/i915/guc: Extend deregistration fence to
 schedule disable
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-18-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1b8ede0f-538b-8633-8e25-542158562c31@intel.com>
Date: Fri, 9 Jul 2021 15:59:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-18-matthew.brost@intel.com>
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
> Extend the deregistration context fence to fence whne a GuC context has
> scheduling disable pending.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++----
>   1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0386ccd5a481..0a6ccdf32316 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -918,7 +918,19 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   		goto unpin;
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +
> +	/*
> +	 * We have to check if the context has been pinned again as another pin
> +	 * operation is allowed to pass this function. Checking the pin count
> +	 * here synchronizes this function with guc_request_alloc ensuring a
> +	 * request doesn't slip through the 'context_pending_disable' fence.
> +	 */
The pin count is an atomic so doesn't need the spinlock. Also the above 
comment 'checking the pin count here synchronizes ...' seems wrong. 
Isn't the point that acquiring the spinlock is what synchronises with 
guc_request_alloc? So the comment should be before the spinlock acquire 
and should mention using the spinlock for this purpose?

John.


> +	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		return;
> +	}
>   	guc_id = prep_context_pending_disable(ce);
> +
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   	with_intel_runtime_pm(runtime_pm, wakeref)
> @@ -1123,19 +1135,22 @@ static int guc_request_alloc(struct i915_request *rq)
>   out:
>   	/*
>   	 * We block all requests on this context if a G2H is pending for a
> -	 * context deregistration as the GuC will fail a context registration
> -	 * while this G2H is pending. Once a G2H returns, the fence is released
> -	 * that is blocking these requests (see guc_signal_context_fence).
> +	 * schedule disable or context deregistration as the GuC will fail a
> +	 * schedule enable or context registration if either G2H is pending
> +	 * respectfully. Once a G2H returns, the fence is released that is
> +	 * blocking these requests (see guc_signal_context_fence).
>   	 *
> -	 * We can safely check the below field outside of the lock as it isn't
> -	 * possible for this field to transition from being clear to set but
> +	 * We can safely check the below fields outside of the lock as it isn't
> +	 * possible for these fields to transition from being clear to set but
>   	 * converse is possible, hence the need for the check within the lock.
>   	 */
> -	if (likely(!context_wait_for_deregister_to_register(ce)))
> +	if (likely(!context_wait_for_deregister_to_register(ce) &&
> +		   !context_pending_disable(ce)))
>   		return 0;
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	if (context_wait_for_deregister_to_register(ce)) {
> +	if (context_wait_for_deregister_to_register(ce) ||
> +	    context_pending_disable(ce)) {
>   		i915_sw_fence_await(&rq->submit);
>   
>   		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
> @@ -1484,10 +1499,18 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	if (context_pending_enable(ce)) {
>   		clr_context_pending_enable(ce);
>   	} else if (context_pending_disable(ce)) {
> +		/*
> +		 * Unpin must be done before __guc_signal_context_fence,
> +		 * otherwise a race exists between the requests getting
> +		 * submitted + retired before this unpin completes resulting in
> +		 * the pin_count going to zero and the context still being
> +		 * enabled.
> +		 */
>   		intel_context_sched_disable_unpin(ce);
>   
>   		spin_lock_irqsave(&ce->guc_state.lock, flags);
>   		clr_context_pending_disable(ce);
> +		__guc_signal_context_fence(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	}
>   

