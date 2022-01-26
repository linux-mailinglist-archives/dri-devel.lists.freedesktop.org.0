Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937E949C78A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A8910E853;
	Wed, 26 Jan 2022 10:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC8A10E834;
 Wed, 26 Jan 2022 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643192964; x=1674728964;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JC9qTSnowJg4LUsMjTqaiX1UfnsFj3lYW94Q+UYJmEQ=;
 b=lYm5Y43j0MlX+byYNN3Ey/pcy6kl+UX19dTyDNplKSADBDQ63v7AQ6V1
 43wUSUZfcupcGSjJVecxQUcrBGn6UYZi1gHwrk+4SMiGvg395uVIfb+4e
 6E4w757LXtzrE3FVp7H7+MJEpTNbXT7/72whNQJrUDUTsmapjn9RGijiH
 ecPeJxwGcys/iUKncMyJ+15Izw9743DAlK7zkIAUgC2sTeGCsCzusENGf
 H+WRqqGmQJqdF/s8MX/U5BCYcyEeInMMKhbmaeUrqTGmdByOcvCNrScdc
 HKziVEr4TqX+8kRJmRZUufWWlPMy5bJupcgzxkZwCo70vBx4NCqjDqN1D g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246299860"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="246299860"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:29:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="581065540"
Received: from mburchar-mobl.amr.corp.intel.com (HELO [10.212.54.252])
 ([10.212.54.252])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:29:22 -0800
Message-ID: <abc9273c-4054-3c09-f584-22dcf33a34e6@linux.intel.com>
Date: Wed, 26 Jan 2022 10:29:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add request cancel low level
 trace point
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20220124150157.15758-1-matthew.brost@intel.com>
 <20220124150157.15758-2-matthew.brost@intel.com>
 <fec72cb6-a008-103e-0f7b-5d6fec548618@linux.intel.com>
 <20220125163911.GA20056@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220125163911.GA20056@jons-linux-dev-box>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/01/2022 16:39, Matthew Brost wrote:
> On Tue, Jan 25, 2022 at 12:27:43PM +0000, Tvrtko Ursulin wrote:
>>
>> On 24/01/2022 15:01, Matthew Brost wrote:
>>> Add request cancel trace point guarded by
>>> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINT.
>>
>> Okay-ish I guess (There is pr_notice with the only real caller, but I
>> suppose you want it for selftests? Oh yes, why is missing from the commit
>> message.), but I'd emit it from i915_request_cancel since that's what the
>> tracepoint is called so it fits.
>>
> 
> I had this tracepoint at one point but somehow during the upstreaming it
> got lost. Noticed when debugging the below issue this tracepoint wasn't
> present, so I brought it back in.
> 
> I generally use low level tracepoints for debug, so a pr_notice doesn't
> really help there.
> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/4960

This was a GuC backend bug right? And log shows this:

<7> [275.431050] [drm:eb_lookup_vmas [i915]] EINVAL at eb_validate_vma:514
<5> [295.433920] Fence expiration time out i915-0000:03:00.0:kms_vblank[1038]:2!
<3> [332.736763] INFO: task kworker/2:1:55 blocked for more than 30 seconds.

So pr_notice worked. I am not opposed to the tracepoint just put a solid why in the commit message and if the tracepoint is called i915_request_cancel it should be emitted from i915_request_cancel().

Regards,

Tvrtko

> 
> Matt
> 
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context.h |  1 +
>>>    drivers/gpu/drm/i915/i915_trace.h       | 10 ++++++++++
>>>    2 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
>>> index d8c74bbf9aae2..3aed4d77f116c 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
>>> @@ -124,6 +124,7 @@ intel_context_is_pinned(struct intel_context *ce)
>>>    static inline void intel_context_cancel_request(struct intel_context *ce,
>>>    						struct i915_request *rq)
>>>    {
>>> +	trace_i915_request_cancel(rq);
>>>    	GEM_BUG_ON(!ce->ops->cancel_request);
>>>    	return ce->ops->cancel_request(ce, rq);
>>>    }
>>> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
>>> index 37b5c9e9d260e..d0a11a8bb0ca3 100644
>>> --- a/drivers/gpu/drm/i915/i915_trace.h
>>> +++ b/drivers/gpu/drm/i915/i915_trace.h
>>> @@ -324,6 +324,11 @@ DEFINE_EVENT(i915_request, i915_request_add,
>>>    );
>>>    #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
>>> +DEFINE_EVENT(i915_request, i915_request_cancel,
>>> +	     TP_PROTO(struct i915_request *rq),
>>> +	     TP_ARGS(rq)
>>> +);
>>> +
>>>    DEFINE_EVENT(i915_request, i915_request_guc_submit,
>>>    	     TP_PROTO(struct i915_request *rq),
>>>    	     TP_ARGS(rq)
>>> @@ -497,6 +502,11 @@ DEFINE_EVENT(intel_context, intel_context_do_unpin,
>>>    #else
>>>    #if !defined(TRACE_HEADER_MULTI_READ)
>>> +static inline void
>>> +trace_i915_request_cancel(struct i915_request *rq)
>>> +{
>>> +}
>>> +
>>>    static inline void
>>>    trace_i915_request_guc_submit(struct i915_request *rq)
>>>    {
>>>
