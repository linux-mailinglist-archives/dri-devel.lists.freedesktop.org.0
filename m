Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B804F90BA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5483F10F047;
	Fri,  8 Apr 2022 08:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6065710F093;
 Fri,  8 Apr 2022 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649406334; x=1680942334;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iOP7kwKib9kq+rExHbsgnxNkixd0tqWGE21G+0d6zZA=;
 b=Myr6xlMtfwtYeNI1v0aVqTZq62poI6NQnt64KrGK2mBiy5oTfeM0OJYM
 uYEL71D9tcCQei17JPhW+bA54N+19RQ7cYP4rBq+KlTbKf5MbVIf9Bnrh
 V2x4HiiUeMpe4nJrw9+uWoBV7sz2zPOBheVQvHpu4jaZ4K/35/GHKjQUk
 c9lzk5pOg47pCQQ4R04p3pvK9ndJHT1Jkp+1ucCBcRV8JEeFGnIcgQmtb
 UCYO5Fxjy/NBy/RN39GkCKV5ST8ok07X+td71Krrp72Nkm7/mVGtXCYtS
 GoR/5WQGrEf2hNR2Ta/Zg06veM3ezP74g3usl0YIAvd09J11WkIYxMj7Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260378172"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="260378172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:25:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="571410962"
Received: from ddobson-mobl.ger.corp.intel.com (HELO [10.213.224.220])
 ([10.213.224.220])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:25:32 -0700
Message-ID: <b9fd2365-9412-b496-6e41-757d6d5d0f0c@linux.intel.com>
Date: Fri, 8 Apr 2022 09:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling
 requests
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
 <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
 <Yk/rHyGrOlrkDtdR@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yk/rHyGrOlrkDtdR@phenom.ffwll.local>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/04/2022 08:58, Daniel Vetter wrote:
> On Thu, Apr 07, 2022 at 04:16:27PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Inherit submitter nice at point of request submission to account for long
>> running processes getting either externally or self re-niced.
>>
>> This accounts for the current processing landscape where computational
>> pipelines are composed of CPU and GPU parts working in tandem.
>>
>> Nice value will only apply to requests which originate from user contexts
>> and have default context priority. This is to avoid disturbing any
>> application made choices of low and high (batch processing and latency
>> sensitive compositing). In this case nice value adjusts the effective
>> priority in the narrow band of -19 to +20 around
>> I915_CONTEXT_DEFAULT_PRIORITY.
>>
>> This means that userspace using the context priority uapi directly has a
>> wider range of possible adjustments (in practice that only applies to
>> execlists platforms - with GuC there are only three priority buckets), but
>> in all cases nice adjustment has the expected effect: positive nice
>> lowering the scheduling priority and negative nice raising it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> I don't think adding any more fancy features to i915-scheduler makes
> sense, at least not before we've cut over to drm/sched.

Why do you think so?

Drm/sched has at least low/normal/high priority and surely we will keep 
the i915 context priority ABI.

Then this patch is not touching the i915 scheduler at all, neither it is 
fancy.

The cover letter explains how it implements the same approach as the IO 
scheduler. And it explains the reasoning and benefits. Provides an user 
experience benefit today, which can easily be preserved.

Regards,

Tvrtko

> -Daniel
> 
>> ---
>>   drivers/gpu/drm/i915/i915_request.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>> index 582770360ad1..e5cfa073d8f0 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -1811,8 +1811,17 @@ void i915_request_add(struct i915_request *rq)
>>   	/* XXX placeholder for selftests */
>>   	rcu_read_lock();
>>   	ctx = rcu_dereference(rq->context->gem_context);
>> -	if (ctx)
>> +	if (ctx) {
>>   		attr = ctx->sched;
>> +		/*
>> +		 * Inherit process nice when scheduling user contexts but only
>> +		 * if context has the default priority to avoid touching
>> +		 * contexts where GEM uapi has been used to explicitly lower
>> +		 * or elevate it.
>> +		 */
>> +		if (attr.priority == I915_CONTEXT_DEFAULT_PRIORITY)
>> +			attr.priority = -task_nice(current);
>> +	}
>>   	rcu_read_unlock();
>>   
>>   	__i915_request_queue(rq, &attr);
>> -- 
>> 2.32.0
>>
> 
