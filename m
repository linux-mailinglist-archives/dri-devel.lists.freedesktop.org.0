Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84605397BB5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 23:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD07E6E054;
	Tue,  1 Jun 2021 21:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6126E054;
 Tue,  1 Jun 2021 21:23:07 +0000 (UTC)
IronPort-SDR: t3gP5baAF/oL1SgT8kp7ngGlMofaexrXZGPyZSRu9JzDz+rlJw2G7763Nu6VOc5SNkjHTmwg8G
 kmshYGdElqCA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="184008808"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="184008808"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 14:23:06 -0700
IronPort-SDR: 8LxedI0983ZjWkH49/JMeKhahN9tveHLbVMILUhTUM8wSa+Zg8uQ+OWPoSMO0uzkVzLQWBgfak
 6YOzk3Zwc55A==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="479440346"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.213.165.160])
 ([10.213.165.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 14:23:03 -0700
Subject: Re: [PATCH v4 04/17] drm/i915/gt: Export the pinned context
 constructor and destructor
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
 <20210525054803.7387-5-daniele.ceraolospurio@intel.com>
 <YLaWdU2mLu/Ih2Yp@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <0960d940-1fca-a7e7-8cce-ef149dbda717@intel.com>
Date: Tue, 1 Jun 2021 14:23:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLaWdU2mLu/Ih2Yp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/2021 1:20 PM, Rodrigo Vivi wrote:
> On Mon, May 24, 2021 at 10:47:50PM -0700, Daniele Ceraolo Spurio wrote:
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> Allow internal clients to create a pinned context.
>>
>> v2 (Daniele): export destructor as well, allow optional usage of custom
>> vm for maximum flexibility.
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine.h    | 10 ++++++++
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 29 +++++++++++++++--------
>>   2 files changed, 29 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
>> index 47ee8578e511..a64d28aba257 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>> @@ -18,7 +18,9 @@
>>   #include "intel_workarounds.h"
>>   
>>   struct drm_printer;
>> +struct intel_context;
>>   struct intel_gt;
>> +struct lock_class_key;
>>   
>>   /* Early gen2 devices have a cacheline of just 32 bytes, using 64 is overkill,
>>    * but keeps the logic simple. Indeed, the whole purpose of this macro is just
>> @@ -255,6 +257,14 @@ struct i915_request *
>>   intel_engine_find_active_request(struct intel_engine_cs *engine);
>>   
>>   u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>> +struct intel_context *
>> +intel_engine_create_pinned_context(struct intel_engine_cs *engine,
>> +				   struct i915_address_space *vm,
>> +				   unsigned int ring_size,
>> +				   unsigned int hwsp,
>> +				   struct lock_class_key *key,
>> +				   const char *name);
>> +void intel_engine_destroy_pinned_context(struct intel_context *ce);
>>   
>>   void intel_engine_init_active(struct intel_engine_cs *engine,
>>   			      unsigned int subclass);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index eba2da9679a5..8cbf11497e8e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -801,11 +801,13 @@ intel_engine_init_active(struct intel_engine_cs *engine, unsigned int subclass)
>>   #endif
>>   }
>>   
>> -static struct intel_context *
>> -create_pinned_context(struct intel_engine_cs *engine,
>> -		      unsigned int hwsp,
>> -		      struct lock_class_key *key,
>> -		      const char *name)
>> +struct intel_context *
>> +intel_engine_create_pinned_context(struct intel_engine_cs *engine,
>> +				   struct i915_address_space *vm,
>> +				   unsigned int ring_size,
>> +				   unsigned int hwsp,
>> +				   struct lock_class_key *key,
>> +				   const char *name)
>>   {
>>   	struct intel_context *ce;
>>   	int err;
>> @@ -816,6 +818,12 @@ create_pinned_context(struct intel_engine_cs *engine,
>>   
>>   	__set_bit(CONTEXT_BARRIER_BIT, &ce->flags);
>>   	ce->timeline = page_pack_bits(NULL, hwsp);
>> +	ce->ring = __intel_context_ring_size(ring_size);
> why do we need this now and we didn't need before?

Since we're now exporting the function as a more "official" interface, 
the idea was to provide as much flexibility as possible. The ring size 
could be used if e.g. we decide to use more pxp sessions and therefore 
need more space in the ring to insert instructions. Same for the vm below.

Daniele

>
>> +
>> +	if (vm) {
>> +		i915_vm_put(ce->vm);
>> +		ce->vm = i915_vm_get(vm);
>> +	}
> same question here...
>
>>   
>>   	err = intel_context_pin(ce); /* perma-pin so it is always available */
>>   	if (err) {
>> @@ -834,7 +842,7 @@ create_pinned_context(struct intel_engine_cs *engine,
>>   	return ce;
>>   }
>>   
>> -static void destroy_pinned_context(struct intel_context *ce)
>> +void intel_engine_destroy_pinned_context(struct intel_context *ce)
>>   {
>>   	struct intel_engine_cs *engine = ce->engine;
>>   	struct i915_vma *hwsp = engine->status_page.vma;
>> @@ -854,8 +862,9 @@ create_kernel_context(struct intel_engine_cs *engine)
>>   {
>>   	static struct lock_class_key kernel;
>>   
>> -	return create_pinned_context(engine, I915_GEM_HWS_SEQNO_ADDR,
>> -				     &kernel, "kernel_context");
>> +	return intel_engine_create_pinned_context(engine, NULL, SZ_4K,
>> +						  I915_GEM_HWS_SEQNO_ADDR,
>> +						  &kernel, "kernel_context");
>>   }
>>   
>>   /**
>> @@ -898,7 +907,7 @@ static int engine_init_common(struct intel_engine_cs *engine)
>>   	return 0;
>>   
>>   err_context:
>> -	destroy_pinned_context(ce);
>> +	intel_engine_destroy_pinned_context(ce);
>>   	return ret;
>>   }
>>   
>> @@ -956,7 +965,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
>>   		fput(engine->default_state);
>>   
>>   	if (engine->kernel_context)
>> -		destroy_pinned_context(engine->kernel_context);
>> +		intel_engine_destroy_pinned_context(engine->kernel_context);
>>   
>>   	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
>>   	cleanup_status_page(engine);
>> -- 
>> 2.29.2
>>

