Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438C48CF0F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 00:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF9910E4B6;
	Wed, 12 Jan 2022 23:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601DE10E4B6;
 Wed, 12 Jan 2022 23:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642029681; x=1673565681;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=+DKoyD9DUp5e/33nHSPXg2Oz2oq0uRvSd4a5jS6G+IU=;
 b=bZPoK+SmeAuJBm7QqbIRVnx7SWjuHrGPel5yFS6sZkUvk3xztbauiYKQ
 PALo+MENvDo/HxA5x5xS0EcPKT+w1rQdefhxMyHz8zI+f3wOwON5AUWvg
 mgP4AJN7qTlkThLB/tU1KiLMLKizEXoj0zEqkidgm8BC0WF6UafhDwjrG
 moJJVzNLMcbX68H487ijXxau1LxteR+u4qMyymlwflf1dTpKVEEKx16bn
 EC0za63KrUv63wCit+/Ci8vQoJX1y4o9VP3UXHICDfBJmzFy2MmZdm9nG
 CRhH2V6DxPr7KPl2u0h1MD1BdmZq1G9DsfKml6GZmjiFkineETPRvCj7T Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307223197"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="307223197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="490922361"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga002.jf.intel.com with ESMTP; 12 Jan 2022 15:21:19 -0800
Received: from [10.249.155.39] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.155.39])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 20CNLHUB005780; Wed, 12 Jan 2022 23:21:18 GMT
Message-ID: <37083d2f-e572-4c78-41ba-a1693e9e84f8@intel.com>
Date: Thu, 13 Jan 2022 00:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/i915: Flip guc_id allocation partition
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220111163019.13694-1-matthew.brost@intel.com>
Content-Language: en-US
In-Reply-To: <20220111163019.13694-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.01.2022 17:30, Matthew Brost wrote:
> Move the multi-lrc guc_id from the lower allocation partition (0 to
> number of multi-lrc guc_ids) to upper allocation partition (number of
> single-lrc to max guc_ids).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
>  1 file changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9989d121127df..1bacc9621cea8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -147,6 +147,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>   */
>  #define NUMBER_MULTI_LRC_GUC_ID(guc)	\
>  	((guc)->submission_state.num_guc_ids / 16)
> +#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
> +	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))

above two will likely look better if converted into inline functions, or
even better if we explicitly store slrc/mlrc upper/lower id limits under
guc submission state

>  
>  /*
>   * Below is a set of functions which control the GuC scheduling state which
> @@ -1776,11 +1778,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
>  	INIT_WORK(&guc->submission_state.destroyed_worker,
>  		  destroyed_worker_func);
>  
> -	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> -	if (!guc->submission_state.guc_ids_bitmap)
> -		return -ENOMEM;
> -
>  	spin_lock_init(&guc->timestamp.lock);
>  	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>  	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> @@ -1796,7 +1793,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>  	guc_flush_destroyed_contexts(guc);
>  	guc_lrc_desc_pool_destroy(guc);
>  	i915_sched_engine_put(guc->sched_engine);
> -	bitmap_free(guc->submission_state.guc_ids_bitmap);
> +	if (guc->submission_state.guc_ids_bitmap)
> +		bitmap_free(guc->submission_state.guc_ids_bitmap);

it should be fine to pass NULL to bitmap_free, no?

>  }
>  
>  static inline void queue_request(struct i915_sched_engine *sched_engine,
> @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>  }
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

btw, is there any requirement (GuC ABI ?) that allocated ids need
to be allocated with power of 2 alignment ? I don't think that we
must optimize that hard and in some cases waste extra ids (as we might
be limited on some configs)

> +	if (likely(!(ret < 0)))
> +		ret += NUMBER_SINGLE_LRC_GUC_ID(guc);

nit: more readable would be

	if (unlikely(ret < 0))
		return ret;

	return ret + guc->submission_state.mlrc_base;

> +
> +	return ret;
> +}
> +
> +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	GEM_BUG_ON(intel_context_is_parent(ce));

do we really need ce here ?

> +
> +	return ida_simple_get(&guc->submission_state.guc_ids,
> +			      0, NUMBER_SINGLE_LRC_GUC_ID(guc),

if we change the logic of NUMBER_SINGLE/MULTI_LRC_GUC_ID macros from
static split into more dynamic, then we could likely implement lazy
increase of available slrc/mlrc id limits on demand, within available
range, without deciding upfront of the hardcoded split 15 : 1

but this can be done next time ;)

> +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> +			      __GFP_NOWARN);
> +}
> +
>  static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  {
>  	int ret;
> @@ -1870,16 +1895,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  	GEM_BUG_ON(intel_context_is_child(ce));
>  
>  	if (intel_context_is_parent(ce))
> -		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> -					      NUMBER_MULTI_LRC_GUC_ID(guc),
> -					      order_base_2(ce->parallel.number_children
> -							   + 1));
> +		ret = new_mlrc_guc_id(guc, ce);
>  	else
> -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> -				     guc->submission_state.num_guc_ids,
> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> -				     __GFP_NOWARN);
> +		ret = new_slrc_guc_id(guc, ce);
> +

with above helpers introduced, shouldn't we move code from new_guc_id()
to assign_guc_id() ?

>  	if (unlikely(ret < 0))
>  		return ret;
>  
> @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  
>  	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>  
> +	if (unlikely(intel_context_is_parent(ce) &&
> +		     !guc->submission_state.guc_ids_bitmap)) {
> +		guc->submission_state.guc_ids_bitmap =
> +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> +		if (!guc->submission_state.guc_ids_bitmap)
> +			return -ENOMEM;
> +	}

maybe move this chunk to new_mlrc_guc_id() ?
or we can't due to the spin_lock below ?
but then how do you protect guc_ids_bitmap pointer itself ?

-Michal

> +
>  try_again:
>  	spin_lock_irqsave(&guc->submission_state.lock, flags);
>  
