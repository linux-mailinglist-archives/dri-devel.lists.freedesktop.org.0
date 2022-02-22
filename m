Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E94BF71E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 12:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4454510E358;
	Tue, 22 Feb 2022 11:19:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB14F10E241;
 Tue, 22 Feb 2022 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645528750; x=1677064750;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KVK9CUe9+QEJsk6IHdsBfuZIGG5AyiPwK87qK3Edr50=;
 b=e6SAeZxSzZqsd2Gt3yX/XvMRuw5ozAt7ZmrskHjXmgKjP9Pe3Hff8sqL
 lFx7qvceyIJPbM++ks/3IsNkQOosIOi3nT33vztCQvjJFYYRzVtQHXJe1
 VRcITarlrk6w7uCQJ1M6XTG5obfHVLox0rsHrF/h5VUwVCS7m6WvCobgU
 IMVvd1QOAzJ999cfEGXPKYPTSSajklAkR+mRa48KWGzvhz5PE9Mz+WWZQ
 u2eXt/2A3WHZedIGbuqxGSKYxztDCJAfw7moY9rfy9RCgodFp5rDlTVni
 7GDWY8N4edNyxaM4mb2wyfcrhGLi/y5mbP2gmscBQGuqkm4DIY0NhJyO3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="312409215"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="312409215"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 03:19:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="507947490"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO [10.213.218.63])
 ([10.213.218.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 03:19:09 -0800
Message-ID: <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
Date: Tue, 22 Feb 2022 11:19:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220218213307.1338478-3-John.C.Harrison@Intel.com>
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


On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Compute workloads are inherantly not pre-emptible for long periods on
> current hardware. As a workaround for this, the pre-emption timeout
> for compute capable engines was disabled. This is undesirable with GuC
> submission as it prevents per engine reset of hung contexts. Hence the
> next patch will re-enable the timeout but bumped up by an order of
> magnititude.

(Some typos above.)

> However, the heartbeat might not respect that. Depending upon current
> activity, a pre-emption to the heartbeat pulse might not even be
> attempted until the last heartbeat period. Which means that only one

Might not be attempted, but could be if something is running with lower 
priority. In which case I think special casing the last heartbeat does 
not feel right because it can end up resetting the engine before it was 
intended.

Like if first heartbeat decides to preempt (the decision is backend 
specific, could be same prio + timeslicing), and preempt timeout has 
been set to heartbeat interval * 3, then 2nd heartbeat gets queued up, 
then 3rd, and so reset is triggered even before the first preempt 
timeout legitimately expires (or just as it is about to react).

Instead, how about preempt timeout is always considered when calculating 
when to emit the next heartbeat? End result would be similar to your 
patch, in terms of avoiding the direct problem, although hang detection 
would be overall longer (but more correct I think).

And it also means in the next patch you don't have to add coupling 
between preempt timeout and heartbeat to intel_engine_setup. Instead 
just some long preempt timeout would be needed. Granted, the decoupling 
argument is not super strong since then the heartbeat code has the 
coupling instead, but that still feels better to me. (Since we can say 
heartbeats only make sense on loaded engines, and so things like preempt 
timeout can legitimately be considered from there.)

Incidentally, that would be similar to a patch which Chris had a year 
ago (https://patchwork.freedesktop.org/patch/419783/?series=86841&rev=1) 
to fix some CI issue.

On a related topic, if GuC engine resets stop working when preempt 
timeout is set to zero - I think we need to somehow let the user know if 
they try to tweak it via sysfs. Perhaps go as far as -EINVAL in GuC 
mode, if i915.reset has not explicitly disabled engine resets.

Regards,

Tvrtko

> period is granted for the pre-emption to occur. With the aforesaid
> bump, the pre-emption timeout could be significantly larger than this
> heartbeat period.
> 
> So adjust the heartbeat code to take the pre-emption timeout into
> account. When it reaches the final (high priority) period, it now
> ensures the delay before hitting reset is bigger than the pre-emption
> timeout.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index a3698f611f45..72a82a6085e0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -22,9 +22,25 @@
>   
>   static bool next_heartbeat(struct intel_engine_cs *engine)
>   {
> +	struct i915_request *rq;
>   	long delay;
>   
>   	delay = READ_ONCE(engine->props.heartbeat_interval_ms);
> +
> +	rq = engine->heartbeat.systole;
> +	if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER) {
> +		long longer;
> +
> +		/*
> +		 * The final try is at the highest priority possible. Up until now
> +		 * a pre-emption might not even have been attempted. So make sure
> +		 * this last attempt allows enough time for a pre-emption to occur.
> +		 */
> +		longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
> +		if (longer > delay)
> +			delay = longer;
> +	}
> +
>   	if (!delay)
>   		return false;
>   
