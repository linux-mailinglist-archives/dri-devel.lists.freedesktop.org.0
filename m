Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FD3B7A4E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 00:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790C289C86;
	Tue, 29 Jun 2021 22:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5EC89C80;
 Tue, 29 Jun 2021 22:09:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="188627826"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="188627826"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 15:09:06 -0700
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="419762316"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.46.34])
 ([10.209.46.34])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 15:09:06 -0700
Subject: Re: [PATCH 12/47] drm/i915/guc: Add bypass tasklet submission path to
 GuC
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-13-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <74833967-1ea0-62a8-f283-26abd4b90952@intel.com>
Date: Tue, 29 Jun 2021 15:09:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-13-matthew.brost@intel.com>
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
> Add bypass tasklet submission path to GuC. The tasklet is only used if H2G
> channel has backpresure.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++----
>   1 file changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ee933efbf0ff..38aff83ee9fa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -172,6 +172,12 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	return err;
>   }
>   
> +static inline void guc_set_lrc_tail(struct i915_request *rq)
> +{
> +	rq->context->lrc_reg_state[CTX_RING_TAIL] =
> +		intel_ring_set_tail(rq->ring, rq->tail);
> +}
> +
>   static inline int rq_prio(const struct i915_request *rq)
>   {
>   	return rq->sched.attr.priority;
> @@ -215,8 +221,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   	}
>   done:
>   	if (submit) {
> -		last->context->lrc_reg_state[CTX_RING_TAIL] =
> -			intel_ring_set_tail(last->ring, last->tail);
> +		guc_set_lrc_tail(last);
>   resubmit:
>   		/*
>   		 * We only check for -EBUSY here even though it is possible for
> @@ -496,20 +501,36 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
>   	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>   }
>   
> +static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> +				     struct i915_request *rq)
> +{
> +	int ret;
> +
> +	__i915_request_submit(rq);
> +
> +	trace_i915_request_in(rq, 0);
> +
> +	guc_set_lrc_tail(rq);
> +	ret = guc_add_request(guc, rq);
> +	if (ret == -EBUSY)
> +		guc->stalled_request = rq;
> +
> +	return ret;
> +}
> +
>   static void guc_submit_request(struct i915_request *rq)
>   {
>   	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> +	struct intel_guc *guc = &rq->engine->gt->uc.guc;
>   	unsigned long flags;
>   
>   	/* Will be called from irq-context when using foreign fences. */
>   	spin_lock_irqsave(&sched_engine->lock, flags);
>   
> -	queue_request(sched_engine, rq, rq_prio(rq));
> -
> -	GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
> -	GEM_BUG_ON(list_empty(&rq->sched.link));
> -
> -	tasklet_hi_schedule(&sched_engine->tasklet);
> +	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
> +		queue_request(sched_engine, rq, rq_prio(rq));
> +	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
> +		tasklet_hi_schedule(&sched_engine->tasklet);
>   
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }

