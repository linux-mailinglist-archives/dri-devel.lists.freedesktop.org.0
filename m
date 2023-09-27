Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A17AFF54
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 11:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0DD10E4B4;
	Wed, 27 Sep 2023 09:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC73010E4B2;
 Wed, 27 Sep 2023 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695805357; x=1727341357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uIqX/GOXXJV+XA4naAR+2bnYNj/HF6MZ5NqHnnsyQ+w=;
 b=ipWwtg/dungsleEDe2xNaeFyRdLvw2KxvxTpfwjUlUZa+J6wWgU9R8K+
 zcM/pBlGaCWaxFT6vzLJqocdjPRBRLNBYHpW6EYqF7Y/o/VN4SiNCWeXV
 1ot4gTA+Q3UL/iOaGNRKtHXvrQeDvjeZ+wnU/E6RkrIZglyZNqrmR6Aq3
 zzkZVoXKzFZaALlv1hClkWKV2UrXnn1dUKc7gzTl2pPW7OjTBK5pbB8vp
 k9Les0s6kmvOQ7rhsbVzXmgehQUWafb+8yrYqHmBpvOFMbwfy/N+ETKcl
 iMunpy/YfkKRjXkKpSdUZ/ZOTZXQtYOKC530NsTlsy+PTvI268/5h7sSj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384560266"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="384560266"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 02:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725730611"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="725730611"
Received: from mscanex-mobl.ger.corp.intel.com (HELO [10.213.204.17])
 ([10.213.204.17])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 02:02:35 -0700
Message-ID: <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
Date: Wed, 27 Sep 2023 10:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
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
Cc: Mousumi Jana <mousumi.jana@intel.com>, intel.com@freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/09/2023 20:05, Alan Previn wrote:
> When suspending, add a timeout when calling
> intel_gt_pm_wait_for_idle else if we have a lost
> G2H event that holds a wakeref (which would be
> indicative of a bug elsewhere in the driver),
> driver will at least complete the suspend-resume
> cycle, (albeit not hitting all the targets for
> low power hw counters), instead of hanging in the kernel.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Tested-by: Mousumi Jana <mousumi.jana@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  6 +++++-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
>   drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
>   drivers/gpu/drm/i915/intel_wakeref.h      |  6 ++++--
>   5 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 84a75c95f3f7..9c6151b78e1d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -687,7 +687,7 @@ void intel_engines_release(struct intel_gt *gt)
>   		if (!engine->release)
>   			continue;
>   
> -		intel_wakeref_wait_for_idle(&engine->wakeref);
> +		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
>   		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
>   
>   		engine->release(engine);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 59b5658a17fb..820217c06dc7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -289,6 +289,7 @@ int intel_gt_resume(struct intel_gt *gt)
>   
>   static void wait_for_suspend(struct intel_gt *gt)
>   {
> +	int timeout_ms = CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT ? : 10000;

CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT is in ns so assigning it to _ms is 
a bit to arbitrary.

Why not the existing I915_GT_SUSPEND_IDLE_TIMEOUT for instance?

>   	/*
>   	 * On rare occasions, we've observed the fence completion trigger
>   	 * free_engines asynchronously via rcu_call. Ensure those are done.
> @@ -308,7 +309,10 @@ static void wait_for_suspend(struct intel_gt *gt)
>   		intel_gt_retire_requests(gt);
>   	}
>   
> -	intel_gt_pm_wait_for_idle(gt);
> +	/* we are suspending, so we shouldn't be waiting forever */
> +	if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms) == -ETIMEDOUT)
> +		gt_warn(gt, "bailing from %s after %d milisec timeout\n",
> +			__func__, timeout_ms);

Does the timeout in intel_gt_pm_wait_timeout_for_idle always comes in 
pair with the timeout first in intel_gt_wait_for_idle?

Also, is the timeout here hit from the intel_gt_suspend_prepare, 
intel_gt_suspend_late, or can be both?

Main concern is that we need to be sure there are no possible 
ill-effects, like letting the GPU/GuC scribble on some memory we 
unmapped (or will unmap), having let the suspend continue after timing 
out, and not perhaps doing the forced wedge like wait_for_suspend() does 
on the existing timeout path.

Would it be possible to handle the lost G2H events directly in the 
respective component instead of here? Like apply the timeout during the 
step which explicitly idles the CT for suspend (presumably that 
exists?), and so cleanup from there once declared a lost event.

Regards,

Tvrtko

>   }
>   
>   void intel_gt_suspend_prepare(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6c9a46452364..5358acc2b5b1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -68,7 +68,12 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>   
>   static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>   {
> -	return intel_wakeref_wait_for_idle(&gt->wakeref);
> +	return intel_wakeref_wait_for_idle(&gt->wakeref, 0);
> +}
> +
> +static inline int intel_gt_pm_wait_timeout_for_idle(struct intel_gt *gt, int timeout_ms)
> +{
> +	return intel_wakeref_wait_for_idle(&gt->wakeref, timeout_ms);
>   }
>   
>   void intel_gt_pm_init_early(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
> index 718f2f1b6174..383a37521415 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -111,14 +111,20 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
>   			 "wakeref.work", &key->work, 0);
>   }
>   
> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf)
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms)
>   {
> -	int err;
> +	int err = 0;
>   
>   	might_sleep();
>   
> -	err = wait_var_event_killable(&wf->wakeref,
> -				      !intel_wakeref_is_active(wf));
> +	if (!timeout_ms)
> +		err = wait_var_event_killable(&wf->wakeref,
> +					      !intel_wakeref_is_active(wf));
> +	else if (wait_var_event_timeout(&wf->wakeref,
> +					!intel_wakeref_is_active(wf),
> +					msecs_to_jiffies(timeout_ms)) < 1)
> +		err = -ETIMEDOUT;
> +
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index ec881b097368..302694a780d2 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -251,15 +251,17 @@ __intel_wakeref_defer_park(struct intel_wakeref *wf)
>   /**
>    * intel_wakeref_wait_for_idle: Wait until the wakeref is idle
>    * @wf: the wakeref
> + * @timeout_ms: Timeout in ms, 0 means never timeout.
>    *
>    * Wait for the earlier asynchronous release of the wakeref. Note
>    * this will wait for any third party as well, so make sure you only wait
>    * when you have control over the wakeref and trust no one else is acquiring
>    * it.
>    *
> - * Return: 0 on success, error code if killed.
> + * Returns 0 on success, -ETIMEDOUT upon a timeout, or the unlikely
> + * error propagation from wait_var_event_killable if timeout_ms is 0.
>    */
> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf);
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms);
>   
>   struct intel_wakeref_auto {
>   	struct drm_i915_private *i915;
