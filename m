Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFB7B1CD3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E1710E630;
	Thu, 28 Sep 2023 12:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6510E630;
 Thu, 28 Sep 2023 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695905177; x=1727441177;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pzvd6AwCo5B7CqcnQjhji03Psj5df/ymWXmNm1FxerE=;
 b=CtjoVBOt/XFvtaqwmunVHuMhcqrzqNt51g0uGecsbALtaVTyyqOnP6j1
 EwvpLQJHm4lPsfQrOCXsKjKqcAPcUA4I00eVofp/3qKFosSOU/g4Qz1EQ
 flHFaef3rZW4DtlPtuxA3fCuSE1K4xiWs3bnxT2ZDTPRrOPnEzFWzTHNU
 PaehypgG7cOcCJQv0b1iooPUh0dLXVHwtLRItZ2LFjA2WHasPRPxJGb6g
 e6KP0qk3JR7mSxDstcdtBIxfBNE1cJnerkiYLX4HKj/GldP6mNX4krC41
 ZYIoUFGiSCHuhOcna2g5KXn3NcWRtxSe0anVMxpC/QuB02TqtywkFCFih g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361419327"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="361419327"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="893000662"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="893000662"
Received: from nlachman-mobl.ger.corp.intel.com (HELO [10.213.204.130])
 ([10.213.204.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:45:02 -0700
Message-ID: <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
Date: Thu, 28 Sep 2023 13:46:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/09/2023 17:36, Teres Alexis, Alan Previn wrote:
> Thanks for taking the time to review this Tvrtko, replies inline below.
> 
> On Wed, 2023-09-27 at 10:02 +0100, Tvrtko Ursulin wrote:
>> On 26/09/2023 20:05, Alan Previn wrote:
>>> When suspending, add a timeout when calling
>>> intel_gt_pm_wait_for_idle else if we have a lost
>>> G2H event that holds a wakeref (which would be
>>> indicative of a bug elsewhere in the driver),
>>> driver will at least complete the suspend-resume
>>> cycle, (albeit not hitting all the targets for
>>> low power hw counters), instead of hanging in the kernel.
> alan:snip
> 
>>>    {
>>> +	int timeout_ms = CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT ? : 10000;
>>
>> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT is in ns so assigning it to _ms is
>> a bit to arbitrary.
>>
>> Why not the existing I915_GT_SUSPEND_IDLE_TIMEOUT for instance?
> alan: good catch, my bad. However I915_GT_SUSPEND_IDLE_TIMEOUT is only half a sec
> which i feel is too quick. I guess i could create a new #define or a multiple
> of I915_GT_SUSPEND_IDLE_TIMEOUT?
> 
>>>    	/*
>>>    	 * On rare occasions, we've observed the fence completion trigger
>>>    	 * free_engines asynchronously via rcu_call. Ensure those are done.
>>> @@ -308,7 +309,10 @@ static void wait_for_suspend(struct intel_gt *gt)
>>>    		intel_gt_retire_requests(gt);
>>>    	}
>>>    
>>> -	intel_gt_pm_wait_for_idle(gt);
>>> +	/* we are suspending, so we shouldn't be waiting forever */
>>> +	if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms) == -ETIMEDOUT)
>>> +		gt_warn(gt, "bailing from %s after %d milisec timeout\n",
>>> +			__func__, timeout_ms);
>>
>> Does the timeout in intel_gt_pm_wait_timeout_for_idle always comes in
>> pair with the timeout first in intel_gt_wait_for_idle?
> alan: Not necessarily, ... IIRC in nearly all cases, the first wait call
> complete in time (i.e. no more ongoing work) and the second wait
> does wait only if the last bit of work 'just-finished', then that second
> wait may take a touch bit longer because of possible async gt-pm-put calls.
> (which appear in several places in the driver as part of regular runtime
> operation including request completion). NOTE: this not high end workloads
> so the
>>
>> Also, is the timeout here hit from the intel_gt_suspend_prepare,
>> intel_gt_suspend_late, or can be both?
>>
>> Main concern is that we need to be sure there are no possible
>> ill-effects, like letting the GPU/GuC scribble on some memory we
>> unmapped (or will unmap), having let the suspend continue after timing
>> out, and not perhaps doing the forced wedge like wait_for_suspend() does
>> on the existing timeout path.
> alan: this will not happen because the held wakeref is never force-released
> after the timeout - so what happens is the kernel would bail the suspend.

How does it know to fail the suspend when there is no error code 
returned with this timeout? Maybe a stupid question.. my knowledge of 
suspend-resume paths was not great even before I forgot it all.

>> Would it be possible to handle the lost G2H events directly in the
>> respective component instead of here? Like apply the timeout during the
>> step which explicitly idles the CT for suspend (presumably that
>> exists?), and so cleanup from there once declared a lost event.
> alan: So yes, we don't solve the problem with this patch - Patch#2
> is addressing the root cause - and verification is still ongoing - because its
> hard to thoroughly test / reproduce. (i.e. Patch 2 could get re-rev'd).
> 
> Intent of this patch, is to be informed that gt-pm wait failed in prep for
> suspending and kernel will eventually bail the suspend, that's all.
> Because without this timed-out version of gt-pm-wait, if we did have a leaky
> gt-wakeref, kernel will hang here forever and we will need to get serial
> console or ramoops to eventually discover the kernel's cpu hung error with
> call-stack pointing to this location. So the goal here is to help speed up
> future debug process (if let's say some future code change with another
> async gt-pm-put came along and caused new problems after Patch #2 resolved
> this time).
> 
> Recap: so in both cases (original vs this patch), if we had a buggy gt-wakeref leak,
> we dont get invalid guc-accesses, but without this patch, we wait forever,
> and with this patch, we get some messages and eventually bail the suspend.

It is not possible to wait for lost G2H in something like 
intel_uc_suspend() and simply declare "bad things happened" if it times 
out there, and forcibly clean it all up? (Which would include releasing 
all the abandoned pm refs, so this patch wouldn't be needed.)

Regards,

Tvrtko
