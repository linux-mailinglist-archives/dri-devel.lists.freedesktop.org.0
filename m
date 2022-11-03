Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE46617B86
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 12:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1608810E070;
	Thu,  3 Nov 2022 11:31:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D7910E070;
 Thu,  3 Nov 2022 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667475104; x=1699011104;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nHatI9/ooDaneCBvHC1kKb0bsLWYqPIlD2wOFeYwvjc=;
 b=CeDhRDz66PZN0bbHz4xFfknWaY/BEKYhChU5jn/GfhAQXkiVC2Nyb3Yz
 Nukp0BvtUIfHtd9eHwVnV7tUPnDb45gQl5l4aT67Ehn+M9ngx6BYGM+aD
 RLI8HVI3K/w3FSKVkYtygPYvgmqW2j2/nW0CRtIWSvQUH9PNzpoy5HDKu
 sLz3tSxLWVPOkhRrVDly5R2BDW625lDxvk0leVhNKKbADUiJLuox27eeQ
 /wn3QsGHHbnW6pBjwACg6P2OgBAdVZoGs2Ga87uN1hvXoOW0jupJVTAsp
 NDFv2du7KKtBgBc5GC/zwj2Cs+xFhM657cquomZU6x1f2xuTU9FDGvclC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395961919"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="395961919"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 04:31:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="703639036"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="703639036"
Received: from khogan-mobl1.ger.corp.intel.com (HELO [10.213.226.17])
 ([10.213.226.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 04:31:23 -0700
Message-ID: <46b26193-8f46-af55-c152-b43839087ea4@linux.intel.com>
Date: Thu, 3 Nov 2022 11:31:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
 <20221102192109.2492625-3-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221102192109.2492625-3-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/11/2022 19:21, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The engine busyness stats has a worker function to do things like
> 64bit extend the 32bit hardware counters. The GuC's reset prepare
> function flushes out this worker function to ensure no corruption
> happens during the reset. Unforunately, the worker function has an
> infinite wait for active resets to finish before doing its work. Thus
> a deadlock would occur if the worker function had actually started
> just as the reset starts.
> 
> The function being used to lock the reset-in-progress mutex is called
> intel_gt_reset_trylock(). However, as noted it does not follow
> standard 'trylock' conventions and exit if already locked. So rename
> the current _trylock function to intel_gt_reset_lock_interruptible(),
> which is the behaviour it actually provides. In addition, add a new
> implementation of _trylock and call that from the busyness stats
> worker instead.
> 
> v2: Rename existing trylock to interruptible rather than trying to
> preserve the existing (confusing) naming scheme (review comments from
> Tvrtko).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c       |  2 +-
>   drivers/gpu/drm/i915/gt/intel_reset.c          | 18 ++++++++++++++++--
>   drivers/gpu/drm/i915/gt/intel_reset.h          |  1 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +++-
>   4 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index e63329bc80659..c29efdef8313a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -330,7 +330,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>   	if (ret)
>   		goto err_rpm;
>   
> -	ret = intel_gt_reset_trylock(ggtt->vm.gt, &srcu);
> +	ret = intel_gt_reset_lock_interruptible(ggtt->vm.gt, &srcu);
>   	if (ret)
>   		goto err_pages;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 3159df6cdd492..24736ebee17c2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1407,15 +1407,19 @@ void intel_gt_handle_error(struct intel_gt *gt,
>   	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>   }
>   
> -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
> +static int _intel_gt_reset_lock(struct intel_gt *gt, int *srcu, bool retry)
>   {
>   	might_lock(&gt->reset.backoff_srcu);
> -	might_sleep();
> +	if (retry)
> +		might_sleep();
>   
>   	rcu_read_lock();
>   	while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>   		rcu_read_unlock();
>   
> +		if (!retry)
> +			return -EBUSY;
> +
>   		if (wait_event_interruptible(gt->reset.queue,
>   					     !test_bit(I915_RESET_BACKOFF,
>   						       &gt->reset.flags)))
> @@ -1429,6 +1433,16 @@ int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>   	return 0;
>   }
>   
> +int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
> +{
> +	return _intel_gt_reset_lock(gt, srcu, false);
> +}
> +
> +int intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu)
> +{
> +	return _intel_gt_reset_lock(gt, srcu, true);
> +}
> +
>   void intel_gt_reset_unlock(struct intel_gt *gt, int tag)
>   __releases(&gt->reset.backoff_srcu)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
> index adc734e673870..25c975b6e8fc0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
> @@ -39,6 +39,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine,
>   void __i915_request_reset(struct i915_request *rq, bool guilty);
>   
>   int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu);
> +int __must_check intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu);
>   void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
>   
>   void intel_gt_set_wedged(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 941613be3b9dd..92e514061d20b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1401,7 +1401,9 @@ static void guc_timestamp_ping(struct work_struct *wrk)
>   
>   	/*
>   	 * Synchronize with gt reset to make sure the worker does not
> -	 * corrupt the engine/guc stats.
> +	 * corrupt the engine/guc stats. NB: can't actually block waiting
> +	 * for a reset to complete as the reset requires flushing out
> +	 * this worker thread if started. So waiting would deadlock.
>   	 */
>   	ret = intel_gt_reset_trylock(gt, &srcu);
>   	if (ret)

LGTM but I don't remember fully how ping worker and reset interact so 
I'll let Umesh r-b. Like is it okay to skip the ping or we'd need to 
re-schedule it ASAP due wrap issues? Maybe reset makes that pointless, I 
don't remember.

Regards,

Tvrtko
