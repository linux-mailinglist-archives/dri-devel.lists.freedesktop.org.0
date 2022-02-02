Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20A4A7AE3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 23:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8406C88C07;
	Wed,  2 Feb 2022 22:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A748288C07;
 Wed,  2 Feb 2022 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643840104; x=1675376104;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=p/unwyLo2VLHKfJaMP1x/7mjl4kzkPviyWtwT6TOTak=;
 b=al9P6+7Q3VTGffRqGM6VA9n1Bvu5aY53FilM1+81n2+H8mFeTA/FZ0tA
 wyiS2/BMQi3YGhKm1m5qtEoRko+hr10vRMJIWZ/VEV7D7clnJiStTXH4L
 SGDdPUGfOJmf3wmxL+kSrEZEGpUYYJu8/e6Td27N0S9qWtimueKtQ4lWp
 KyrQz4TxKOTMhdL/5PJZ3RsIMdn+GwHO43st5qh9/bV3JjTY/rLW6DZdp
 o3/vrQzCCQy1ENJFd1viQTZwP0bLNycV0eAewl1Aghgxw1zZbSKqnEL/Z
 ZqUUVgch8Ek24DhkM0xP0DrwVHGXNiM8PPmMWIWmuG6SSznE1o11NHXHf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247983246"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="247983246"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 14:15:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="699102071"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga005.jf.intel.com with ESMTP; 02 Feb 2022 14:15:02 -0800
Received: from [10.249.148.124] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.148.124])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 212MF1O9003289; Wed, 2 Feb 2022 22:15:01 GMT
Message-ID: <42aa9c4d-8a09-d02a-c205-491438a52305@intel.com>
Date: Wed, 2 Feb 2022 23:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/i915: Flip guc_id allocation partition
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220113162747.4017-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220113162747.4017-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13.01.2022 17:27, Matthew Brost wrote:
> Move the multi-lrc guc_id from the lower allocation partition (0 to
> number of multi-lrc guc_ids) to upper allocation partition (number of
> single-lrc to max guc_ids).
> 
> This will help when a native driver transitions to a PF after driver
> load time. If the perma-pin guc_ids (kernel contexts) are in a low range
> it is easy reduce total number of guc_ids as the allocated slrc are in a
> valid range the mlrc range moves to an unused range. Assuming no mlrc
> are allocated and few slrc are used the native to PF transition is
> seamless for the guc_id resource.
> 
> v2:
>  (Michal / Tvrtko)
>   - Add an explaination to commit message of why this patch is needed
>  (Michal / Piotr)
>   - Replace marcos with functions
>  (Michal)
>   - Rework logic flow in new_mlrc_guc_id
>   - Unconditionally call bitmap_free
> v3:
>  (Michal)
>   - Move allocation of mlrc bitmap back submission init
>  (CI)
>   - Resend for CI
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 77 ++++++++++++++-----
>  1 file changed, 56 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 23a40f10d376d..fce58365b3ff8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -138,17 +138,6 @@ guc_create_parallel(struct intel_engine_cs **engines,
>  
>  #define GUC_REQUEST_SIZE 64 /* bytes */
>  
> -/*
> - * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> - * per the GuC submission interface. A different allocation algorithm is used
> - * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> - * partition the guc_id space. We believe the number of multi-lrc contexts in
> - * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> - * multi-lrc.
> - */
> -#define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> -	((guc)->submission_state.num_guc_ids / 16)
> -
>  /*
>   * Below is a set of functions which control the GuC scheduling state which
>   * require a lock.
> @@ -1746,6 +1735,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>  }
>  
>  static void destroyed_worker_func(struct work_struct *w);
> +static int number_mlrc_guc_id(struct intel_guc *guc);
>  
>  /*
>   * Set up the memory resources to be shared with the GuC (via the GGTT)
> @@ -1778,7 +1768,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>  		  destroyed_worker_func);
>  
>  	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> +		bitmap_zalloc(number_mlrc_guc_id(guc), GFP_KERNEL);

to fully benefit from the id partition flip we likely will have to
allocate bitmap 'just-in-time' when first mlrc id is needed

so something like you had in early rev but abandon to avoid alloc inside
spinlock - but I'm wondering why we can't alloc bitmap for mlrc case,
while we allow allocation for slrc (as ida_simple_get may alloc, no?

>  	if (!guc->submission_state.guc_ids_bitmap)
>  		return -ENOMEM;
>  
> @@ -1864,6 +1854,57 @@ static void guc_submit_request(struct i915_request *rq)
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>  }
>  
> +/*
> + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> + * per the GuC submission interface. A different allocation algorithm is used
> + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> + * partition the guc_id space. We believe the number of multi-lrc contexts in
> + * use should be low and 1/16 should be sufficient.

do we have any other numbers as guideline ?

while it is easy assumption that 1/16 from 64K contexts may be
sufficient, what about 1/16 of 1K contexts ? will that work too ?

also, do we have to make hard split ? what if there will be no users for
mlrc but more slrc contexts would be beneficial ? or the opposite ?

> + */
> +#define MLRC_GUC_ID_RATIO	16
> +
> +static int number_mlrc_guc_id(struct intel_guc *guc)
> +{
> +	return guc->submission_state.num_guc_ids / MLRC_GUC_ID_RATIO;
> +}
> +
> +static int number_slrc_guc_id(struct intel_guc *guc)
> +{
> +	return guc->submission_state.num_guc_ids - number_mlrc_guc_id(guc);
> +}
> +
> +static int mlrc_guc_id_base(struct intel_guc *guc)
> +{
> +	return number_slrc_guc_id(guc);
> +}
> +
> +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	int ret;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> +
> +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> +				       number_mlrc_guc_id(guc),
> +				       order_base_2(ce->parallel.number_children
> +						    + 1));
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	return ret + mlrc_guc_id_base(guc);
> +}
> +
> +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	GEM_BUG_ON(intel_context_is_parent(ce));
> +
> +	return ida_simple_get(&guc->submission_state.guc_ids,
> +			      0, number_slrc_guc_id(guc),
> +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> +			      __GFP_NOWARN);

are you sure that these gfp flags are safe for use under spinlock ?

-Michal

> +}
> +
>  static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  {
>  	int ret;
> @@ -1871,16 +1912,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
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
>  	if (unlikely(ret < 0))
>  		return ret;
>  
