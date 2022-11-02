Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A561627C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 13:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E946110E485;
	Wed,  2 Nov 2022 12:12:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC84210E054;
 Wed,  2 Nov 2022 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667391125; x=1698927125;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EyztNz/zIwBUqCEO3Tu/DT059sJcI8P31Coi3KUmdxk=;
 b=HbejfKZhtQfp+rU8c63Okxwhxpf+bEufp0cQG0T9ZTMEZM0QEdispX7l
 q7msR3wPu2iRPw1kWTAH3s2RA5CV34T5kMSGJBHfGseDndPA+FeTZa1Gn
 Y1jQG+DAQph0grqzvTIJnyJRPqarInMC+yyzDXSnbusScZKtalLp5keHF
 7zKC8rv7liID58URKskpPTcCksF8itIgZAj+7qPtcVwBEq6tLBBa7yt7U
 9YhIVD1icrIu9aHeqVUjxDejb8m8s1O52Sntv0cjN+rh+99W+EUL45SOs
 WJNrpV3tK7NtVs+viX42FmbHcNvQHmkXPKVRbqOGPYiXFj11hTCv6zM/P Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310496331"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="310496331"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 05:12:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="585375914"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="585375914"
Received: from cjokeeff-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.15.91])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 05:12:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [PATCH] drm/i915: Don't wait forever in drop_caches
In-Reply-To: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
Date: Wed, 02 Nov 2022 14:12:00 +0200
Message-ID: <87k04d7dyn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> At the end of each test, IGT does a drop caches call via sysfs with

sysfs?

> special flags set. One of the possible paths waits for idle with an
> infinite timeout. That causes problems for debugging issues when CI
> catches a "can't go idle" test failure. Best case, the CI system times
> out (after 90s), attempts a bunch of state dump actions and then
> reboots the system to recover it. Worst case, the CI system can't do
> anything at all and then times out (after 1000s) and simply reboots.
> Sometimes a serial port log of dmesg might be available, sometimes not.
>
> So rather than making life hard for ourselves, change the timeout to
> be 10s rather than infinite. Also, trigger the standard
> wedge/reset/recover sequence so that testing can continue with a
> working system (if possible).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index ae987e92251dd..9d916fbbfc27c 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>  		  DROP_RESET_ACTIVE | \
>  		  DROP_RESET_SEQNO | \
>  		  DROP_RCU)
> +
> +#define DROP_IDLE_TIMEOUT	(HZ * 10)

I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only used
here.

I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
gt/intel_gt.c.

I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in intel_gt_pm.c.

I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.

My head spins.


BR,
Jani.


> +
>  static int
>  i915_drop_caches_get(void *data, u64 *val)
>  {
> @@ -661,7 +664,9 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
>  		intel_gt_retire_requests(gt);
>  
>  	if (val & (DROP_IDLE | DROP_ACTIVE)) {
> -		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +		ret = intel_gt_wait_for_idle(gt, DROP_IDLE_TIMEOUT);
> +		if (ret == -ETIME)
> +			intel_gt_set_wedged(gt);
>  		if (ret)
>  			return ret;
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
