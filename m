Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989548C070
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FE0112F32;
	Wed, 12 Jan 2022 08:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14929112F32;
 Wed, 12 Jan 2022 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641977667; x=1673513667;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=el365RuRAUBqSqt6IuZsJnAb+C0E7znE4QfRI6qhvgI=;
 b=PixZhP0y4gedYNWHDgzU0gT0IKEOYllmup2tz/to+Axf+swxuqHofREq
 arkqP16kLYwgkAvyT5SdgcaJhanbI6e9k1zncbHzf+tHBvURlaBQAQyad
 puqF+6vRVdcAidr6ohd/BWQcW9SoAGgC3g6r2Je1x6AkkW98vkpCC+hz7
 Ya155+IBuet7otGTfAmYeM13K1JQYHnrX+rQoOT6WN4+iqc28z4YOtH3d
 dBC0cYGz7tLZgmCo3sftTxWu+z/st+qxCd4jf/lYvqr87yjx4jqz4AGLl
 JskF2QGMR0/QkbpqDeZzWWFpRTzG3c9EXl+iUg3koQlQGusWlr+uC5A4r w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="241245420"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="241245420"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 00:54:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="691316771"
Received: from guevarag-mobl.ger.corp.intel.com (HELO [10.213.234.181])
 ([10.213.234.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 00:54:21 -0800
Message-ID: <4f9a8e6a-5a12-2d6b-bdb9-f40269045874@linux.intel.com>
Date: Wed, 12 Jan 2022 08:54:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Flip guc_id allocation partition
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220111163019.13694-1-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220111163019.13694-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 11/01/2022 16:30, Matthew Brost wrote:
> Move the multi-lrc guc_id from the lower allocation partition (0 to
> number of multi-lrc guc_ids) to upper allocation partition (number of
> single-lrc to max guc_ids).

Just a reminder that best practice for commit messages is to include the 
"why" as well.

Regards,

Tvrtko

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
>   1 file changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9989d121127df..1bacc9621cea8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -147,6 +147,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>    */
>   #define NUMBER_MULTI_LRC_GUC_ID(guc)	\
>   	((guc)->submission_state.num_guc_ids / 16)
> +#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
> +	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))
>   
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
> @@ -1776,11 +1778,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_WORK(&guc->submission_state.destroyed_worker,
>   		  destroyed_worker_func);
>   
> -	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> -	if (!guc->submission_state.guc_ids_bitmap)
> -		return -ENOMEM;
> -
>   	spin_lock_init(&guc->timestamp.lock);
>   	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> @@ -1796,7 +1793,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	guc_flush_destroyed_contexts(guc);
>   	guc_lrc_desc_pool_destroy(guc);
>   	i915_sched_engine_put(guc->sched_engine);
> -	bitmap_free(guc->submission_state.guc_ids_bitmap);
> +	if (guc->submission_state.guc_ids_bitmap)
> +		bitmap_free(guc->submission_state.guc_ids_bitmap);
>   }
>   
>   static inline void queue_request(struct i915_sched_engine *sched_engine,
> @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	int ret;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> +
> +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> +				       NUMBER_MULTI_LRC_GUC_ID(guc),
> +				       order_base_2(ce->parallel.number_children
> +						    + 1));
> +	if (likely(!(ret < 0)))
> +		ret += NUMBER_SINGLE_LRC_GUC_ID(guc);
> +
> +	return ret;
> +}
> +
> +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	GEM_BUG_ON(intel_context_is_parent(ce));
> +
> +	return ida_simple_get(&guc->submission_state.guc_ids,
> +			      0, NUMBER_SINGLE_LRC_GUC_ID(guc),
> +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> +			      __GFP_NOWARN);
> +}
> +
>   static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	int ret;
> @@ -1870,16 +1895,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	if (intel_context_is_parent(ce))
> -		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> -					      NUMBER_MULTI_LRC_GUC_ID(guc),
> -					      order_base_2(ce->parallel.number_children
> -							   + 1));
> +		ret = new_mlrc_guc_id(guc, ce);
>   	else
> -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> -				     guc->submission_state.num_guc_ids,
> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> -				     __GFP_NOWARN);
> +		ret = new_slrc_guc_id(guc, ce);
> +
>   	if (unlikely(ret < 0))
>   		return ret;
>   
> @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>   
> +	if (unlikely(intel_context_is_parent(ce) &&
> +		     !guc->submission_state.guc_ids_bitmap)) {
> +		guc->submission_state.guc_ids_bitmap =
> +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> +		if (!guc->submission_state.guc_ids_bitmap)
> +			return -ENOMEM;
> +	}
> +
>   try_again:
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   
> 
