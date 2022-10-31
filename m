Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF1613348
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 11:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9494710E184;
	Mon, 31 Oct 2022 10:09:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3910E184;
 Mon, 31 Oct 2022 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667210965; x=1698746965;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KmsXoIRLEVb0wRnV6i7WkKiqnL16vZod6GpfpCYlu58=;
 b=GS4ivF6lbHxs6Z7ZTSDK2PhXmebjwuo9SuSnRKSMwlIvei97ZHm9LBVY
 w60NClra3o5tSxhIcpuvpii/WHwTego4Io5zBoWw8rNlh7xrvvDTFI837
 gkL9E9w5bOaCLDNkwg2OBEVyPajtUwcA3IM1jPXRuaEsdjoV096FyA6FW
 lDAXdHl3OA4KobNGDsID+EecT4JpS1hsUd6enIhPU0FJWGCc/RC14Aa3A
 BL2JFmAtWFyXNLpUxfnL1NVol66GCd5WxTNZZh/1JtU6toyNypMzHlxNS
 nFBo270Z+ww1Qr34XdffUG3Iog74U2dZ4BC4ayLHZlVReVf6pWCmoGNz4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="306478741"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="306478741"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:09:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="611438694"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="611438694"
Received: from aawaisi-mobl1.ger.corp.intel.com (HELO [10.213.221.7])
 ([10.213.221.7])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:09:24 -0700
Message-ID: <56a6c98a-069c-77b0-d6c5-4575bc324075@linux.intel.com>
Date: Mon, 31 Oct 2022 10:09:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
 <20221028194649.1130223-3-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221028194649.1130223-3-John.C.Harrison@Intel.com>
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


On 28/10/2022 20:46, John.C.Harrison@Intel.com wrote:
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
> Update the worker to abort if a reset is in progress rather than
> waiting for it to complete. It will still acquire the reset lock in
> the case where a reset was not already in progress. So the processing
> is still safe from corruption, but the deadlock can no longer occur.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c             | 15 ++++++++++++++-
>   drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++--
>   3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 3159df6cdd492..2f48c6e4420ea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1407,7 +1407,7 @@ void intel_gt_handle_error(struct intel_gt *gt,
>   	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>   }
>   
> -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
> +static int _intel_gt_reset_trylock(struct intel_gt *gt, int *srcu, bool retry)
>   {
>   	might_lock(&gt->reset.backoff_srcu);
>   	might_sleep();
> @@ -1416,6 +1416,9 @@ int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>   	while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>   		rcu_read_unlock();
>   
> +		if (!retry)
> +			return -EBUSY;
> +
>   		if (wait_event_interruptible(gt->reset.queue,
>   					     !test_bit(I915_RESET_BACKOFF,
>   						       &gt->reset.flags)))

Would it be more obvious to rename the existing semantics to 
intel_gt_reset_interruptible(), while the flavour you add in this patch 
truly is trylock? I am not sure, since it's all a bit special, but 
trylock sure feels confusing if it can sleep forever...

Regards,

Tvrtko

> @@ -1429,6 +1432,16 @@ int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>   	return 0;
>   }
>   
> +int intel_gt_reset_trylock_noretry(struct intel_gt *gt, int *srcu)
> +{
> +	return _intel_gt_reset_trylock(gt, srcu, false);
> +}
> +
> +int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
> +{
> +	return _intel_gt_reset_trylock(gt, srcu, true);
> +}
> +
>   void intel_gt_reset_unlock(struct intel_gt *gt, int tag)
>   __releases(&gt->reset.backoff_srcu)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
> index adc734e673870..7f863726eb6a2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
> @@ -38,6 +38,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine,
>   
>   void __i915_request_reset(struct i915_request *rq, bool guilty);
>   
> +int __must_check intel_gt_reset_trylock_noretry(struct intel_gt *gt, int *srcu);
>   int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu);
>   void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 941613be3b9dd..1fa1bc7dde3df 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1401,9 +1401,11 @@ static void guc_timestamp_ping(struct work_struct *wrk)
>   
>   	/*
>   	 * Synchronize with gt reset to make sure the worker does not
> -	 * corrupt the engine/guc stats.
> +	 * corrupt the engine/guc stats. NB: can't actually block waiting
> +	 * for a reset to complete as the reset requires flushing out
> +	 * any running worker thread. So waiting would deadlock.
>   	 */
> -	ret = intel_gt_reset_trylock(gt, &srcu);
> +	ret = intel_gt_reset_trylock_noretry(gt, &srcu);
>   	if (ret)
>   		return;
>   
