Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1042B6D6809
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3315B10E6EF;
	Tue,  4 Apr 2023 15:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93010E531;
 Tue,  4 Apr 2023 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680623845; x=1712159845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IGSS2ncpRPEUGuI2WAgN5IGlyOhaZKVf36+5Z8vngv0=;
 b=ZPOCQBhwEACtIJBQ2RWhplzar3udMxe0XIq5bhgeGKL9Gh0lq1Qny3H3
 ljSQNhIby99mCoLizF2UJagxZVvSXs0LZ+XbyaodLbTpmU5Vvx2np4TJm
 Drovo7Mrh3r3V3yFCkNXmK2E8TkEBKYaYM4L/Zb+aLjDFTwJcKv54DSwQ
 7hfqkDiEFcLYlz1JMd3hnmBYY8Cz/SNY3BrXZSwmkv6pfS+igjED4SAjl
 xn6zxW7ehSIHlvNQAfmp8hvBnajQ/E3j13lrmnoT4K9G9loNecINLfthe
 5IVx22S6KQSA7uvV5+3GM2ZWz+bgPiJicQ9UjqhIjGl7z+helQ1qySA0W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370044535"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370044535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932503603"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932503603"
Received: from pcanders-mobl1.ger.corp.intel.com (HELO [10.213.217.134])
 ([10.213.217.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:57:22 -0700
Message-ID: <f193eb7f-19f9-b9a8-7edf-438dafb74da4@linux.intel.com>
Date: Tue, 4 Apr 2023 16:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/i915/gt: Hold a wakeref for the active VM
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
 <ZCxEoelnOSpRiy6A@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZCxEoelnOSpRiy6A@ashyti-mobl2.lan>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/04/2023 16:39, Andi Shyti wrote:
> Hi Andrzej,
> 
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
>> index 0a8d553da3f439..48f888c3da083b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
>> @@ -14,6 +14,7 @@
>>   #include "i915_drv.h"
>>   #include "intel_context_types.h"
>>   #include "intel_engine_types.h"
>> +#include "intel_gt_pm.h"
>>   #include "intel_ring_types.h"
>>   #include "intel_timeline_types.h"
>>   #include "i915_trace.h"
>> @@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
>>   static inline void intel_context_enter(struct intel_context *ce)
>>   {
>>   	lockdep_assert_held(&ce->timeline->mutex);
>> -	if (!ce->active_count++)
>> -		ce->ops->enter(ce);
>> +	if (ce->active_count++)
>> +		return;
>> +
>> +	ce->ops->enter(ce);
>> +	intel_gt_pm_get(ce->vm->gt);
>>   }
>>   
>>   static inline void intel_context_mark_active(struct intel_context *ce)
>> @@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
>>   {
>>   	lockdep_assert_held(&ce->timeline->mutex);
>>   	GEM_BUG_ON(!ce->active_count);
>> -	if (!--ce->active_count)
>> -		ce->ops->exit(ce);
>> +	if (--ce->active_count)
>> +		return;
>> +
>> +	intel_gt_pm_put_async(ce->vm->gt);
>> +	ce->ops->exit(ce);
> 
> shouldn't these two be swapped?
> 
>>   }
>>   
>>   static inline struct intel_context *intel_context_get(struct intel_context *ce)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index e971b153fda976..ee531a5c142c77 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -114,6 +114,15 @@ __queue_and_release_pm(struct i915_request *rq,
>>   
>>   	ENGINE_TRACE(engine, "parking\n");
>>   
>> +	/*
>> +	 * Open coded one half of intel_context_enter, which we have to omit
>> +	 * here (see the large comment below) and because the other part must
>> +	 * not be called due constructing directly with __i915_request_create
>> +	 * which increments active count via intel_context_mark_active.
>> +	 */
>> +	GEM_BUG_ON(rq->context->active_count != 1);
>> +	__intel_gt_pm_get(engine->gt);
> 
> where is it's brother "put"?

It's in request retire via intel_context_exit. Ie. request construction 
is special here, while retirement is standard.

Regards,

Tvrtko

> 
> Thanks,
> Andi
> 
>> +
>>   	/*
>>   	 * We have to serialise all potential retirement paths with our
>>   	 * submission, as we don't want to underflow either the
>>
>> ---
>> base-commit: 3385d6482cd60f2a0bbb0fa97b70ae7dbba4f95c
>> change-id: 20230330-hold_wakeref_for_active_vm-7f013a449ef3
>>
>> Best regards,
>> -- 
>> Andrzej Hajda <andrzej.hajda@intel.com>
