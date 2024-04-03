Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7107896A63
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C3E1125E4;
	Wed,  3 Apr 2024 09:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9wUuDRN";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F19112904;
 Wed,  3 Apr 2024 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712136112; x=1743672112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kygdojvdzQ5BfPQWPd6z8AfTEG+/K4u54bi39JjQMFM=;
 b=O9wUuDRNsPLZOQt0Q/B/aLRmeIPJm5RpXxMdQGk6m98xtYci/RyLnmPj
 CWcn45HYKsLDEocDmt8Bf/Y8ohstEZQaPCdk0Fgl21sjBZ2CnVmTdEHVC
 l6Twp1UA5LSnGCTBWC1G5N0kx96pGfWXyN0v387jQPKGMGef39SnQj0CZ
 m0eSGLXhMtF7QCX9CtnXAPgLC4kT64gQwmqA+FbPGVItwKcY0Q9OYRWMJ
 Wchjkr8zEckbu7Ttgo6kZH2XBEPHjZ2dBi6LuygMtre+ZDTcCluo5KDUZ
 kyiVNsLSpxx20bryY2RYbOQoDuJB0sRjv1C6RYMTDsH1Ke25VKqDUO77w A==;
X-CSE-ConnectionGUID: 4We+/xW1SZ2NFwZgFsMpLw==
X-CSE-MsgGUID: r52DZSsqQy60I1p4moCYjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29836212"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="29836212"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:21:51 -0700
X-CSE-ConnectionGUID: rY1j/9jFSRqRSXp47hpwkg==
X-CSE-MsgGUID: 1DHb+WYUQLedlaq1995Lxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49351114"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:21:47 -0700
Message-ID: <8bdf3840-f248-4134-992f-d529cdbae510@linux.intel.com>
Date: Wed, 3 Apr 2024 11:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Fix the fix for reset lock confusion
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, Zhanjun Dong <zhanjun.dong@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Madhumitha Tolakanahalli Pradeep
 <madhumitha.tolakanahalli.pradeep@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
References: <20240329235306.1559639-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240329235306.1559639-1-John.C.Harrison@Intel.com>
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


On 3/30/2024 12:53 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The previous fix for the circlular lock splat about the busyness
> worker wasn't quite complete. Even though the reset-in-progress flag
> is cleared at the start of intel_uc_reset_finish, the entire function
> is still inside the reset mutex lock. Not sure why the patch appeared
> to fix the issue both locally and in CI. However, it is now back
> again.
>
> There is a further complication the wedge code path within
> intel_gt_reset() jumps around so much it results in nested
> reset_prepare/_finish calls. That is, the call sequence is:
>    intel_gt_reset
>    | reset_prepare
>    | __intel_gt_set_wedged
>    | | reset_prepare
>    | | reset_finish
>    | reset_finish
>
> The nested finish means that even if the clear of the in-progress flag
> was moved to the end of _finish, it would still be clear for the
> entire second call. Surprisingly, this does not seem to be causing any
> other problems at present.
>
> As an aside, a wedge on fini does not call the finish functions at
> all. The reset_in_progress flag is left set (twice).
>
> So instead of trying to cancel the worker anywhere at all in the reset
> path, just add a cancel to intel_guc_submission_fini instead. Note
> that it is not a problem if the worker is still active during a reset.
> Either it will run before the reset path starts locking things and
> will simply block the reset code for a tiny amount of time. Or it will
> run after the locks have been acquired and will early exit due to the
> try-lock.
>
> Also, do not use the reset-in-progress flag to decide whether a
> synchronous cancel is safe (from a lockdep perspective) or not.
> Instead, use the actual reset mutex state (both the genuine one and
> the custom rolled BACKOFF one).
>
> Fixes: 0e00a8814eec ("drm/i915/guc: Avoid circular locking issue on busyness flush")
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Thanks for the details, looks good to me:

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 ++++++++-----------
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  4 ++++
>   2 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 16640d6dd0589..00757d6333e88 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1403,14 +1403,17 @@ static void guc_cancel_busyness_worker(struct intel_guc *guc)
>   	 * Trying to pass a 'need_sync' or 'in_reset' flag all the way down through
>   	 * every possible call stack is unfeasible. It would be too intrusive to many
>   	 * areas that really don't care about the GuC backend. However, there is the
> -	 * 'reset_in_progress' flag available, so just use that.
> +	 * I915_RESET_BACKOFF flag and the gt->reset.mutex can be tested for is_locked.
> +	 * So just use those. Note that testing both is required due to the hideously
> +	 * complex nature of the i915 driver's reset code paths.
>   	 *
>   	 * And note that in the case of a reset occurring during driver unload
> -	 * (wedge_on_fini), skipping the cancel in _prepare (when the reset flag is set
> -	 * is fine because there is another cancel in _finish (when the reset flag is
> -	 * not).
> +	 * (wedged_on_fini), skipping the cancel in reset_prepare/reset_fini (when the
> +	 * reset flag/mutex are set) is fine because there is another explicit cancel in
> +	 * intel_guc_submission_fini (when the reset flag/mutex are not).
>   	 */
> -	if (guc_to_gt(guc)->uc.reset_in_progress)
> +	if (mutex_is_locked(&guc_to_gt(guc)->reset.mutex) ||
> +	    test_bit(I915_RESET_BACKOFF, &guc_to_gt(guc)->reset.flags))
>   		cancel_delayed_work(&guc->timestamp.work);
>   	else
>   		cancel_delayed_work_sync(&guc->timestamp.work);
> @@ -1424,8 +1427,6 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
>   	unsigned long flags;
>   	ktime_t unused;
>   
> -	guc_cancel_busyness_worker(guc);
> -
>   	spin_lock_irqsave(&guc->timestamp.lock, flags);
>   
>   	guc_update_pm_timestamp(guc, &unused);
> @@ -2004,13 +2005,6 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>   
>   void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   {
> -	/*
> -	 * Ensure the busyness worker gets cancelled even on a fatal wedge.
> -	 * Note that reset_prepare is not allowed to because it confuses lockdep.
> -	 */
> -	if (guc_submission_initialized(guc))
> -		guc_cancel_busyness_worker(guc);
> -
>   	/* Reset called during driver load or during wedge? */
>   	if (unlikely(!guc_submission_initialized(guc) ||
>   		     !intel_guc_is_fw_running(guc) ||
> @@ -2136,6 +2130,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	if (!guc->submission_initialized)
>   		return;
>   
> +	guc_fini_engine_stats(guc);
>   	guc_flush_destroyed_contexts(guc);
>   	guc_lrc_desc_pool_destroy_v69(guc);
>   	i915_sched_engine_put(guc->sched_engine);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index b47051ddf17f2..7a63abf8f644c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -633,6 +633,10 @@ void intel_uc_reset_finish(struct intel_uc *uc)
>   {
>   	struct intel_guc *guc = &uc->guc;
>   
> +	/*
> +	 * NB: The wedge code path results in prepare -> prepare -> finish -> finish.
> +	 * So this function is sometimes called with the in-progress flag not set.
> +	 */
>   	uc->reset_in_progress = false;
>   
>   	/* Firmware expected to be running when this function is called */
