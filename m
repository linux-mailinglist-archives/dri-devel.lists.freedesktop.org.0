Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9CF85D7AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 13:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1910E61D;
	Wed, 21 Feb 2024 12:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv6RSFXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9ED10E5DE;
 Wed, 21 Feb 2024 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708517305; x=1740053305;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z7IMXNw9sHvxGZnQJK4HVHHTP3o+beJlDFA7ofQwoY4=;
 b=cv6RSFXAFOeusI/Q3PzRpja5yH1HG9FI2GnZYOrRzsdzyLvfo8AQetSE
 8xwW+uOl5AEzbmbJX2RcTGr8hnzLQXjX6fC27xSRNbq10V/X7KM0DVnoG
 3QokmyR8Mtn/3jq2D5b8SjulekoqWLf6cJY8D3lvx3VXfhYU1a9EDsM6T
 u8XtvWmlchXf5osAfr6o3TAWcWURmtYXj2D33rbkHIGoF4AQAvsGBhnZ/
 43dTEtwpuz4AUKcX+PXfAaL6ddCnlyrLIhIX+gaBPyEXn9fDrfYoPDnfv
 QrruVBYI6wG3UDzcFHuxgdm0cHDxRRSCQmQIH0pdXgmTQUHvzA47p66Oh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3152144"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="3152144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 04:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5479297"
Received: from jdoyle1x-mobl2.ger.corp.intel.com (HELO [10.213.204.109])
 ([10.213.204.109])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 04:08:21 -0800
Message-ID: <150592ba-9d98-4ec7-a593-c218f4d4f74a@linux.intel.com>
Date: Wed, 21 Feb 2024 12:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <af007641-9705-4259-b29c-3cb78f67fc64@linux.intel.com>
 <ZdVAd3NxUNBZofts@ashyti-mobl2.lan>
 <a0f66a4d-12f9-4852-a1bb-a6d27538b436@linux.intel.com>
 <ZdXcRat8OcTeVozx@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZdXcRat8OcTeVozx@ashyti-mobl2.lan>
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


On 21/02/2024 11:19, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Wed, Feb 21, 2024 at 08:19:34AM +0000, Tvrtko Ursulin wrote:
>> On 21/02/2024 00:14, Andi Shyti wrote:
>>> On Tue, Feb 20, 2024 at 02:48:31PM +0000, Tvrtko Ursulin wrote:
>>>> On 20/02/2024 14:35, Andi Shyti wrote:
>>>>> Enable only one CCS engine by default with all the compute sices
>>>>
>>>> slices
>>>
>>> Thanks!
>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>> index 833987015b8b..7041acc77810 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>> @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>>>>>     		if (engine->uabi_class == I915_NO_UABI_CLASS)
>>>>>     			continue;
>>>>> +		/*
>>>>> +		 * Do not list and do not count CCS engines other than the first
>>>>> +		 */
>>>>> +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
>>>>> +		    engine->uabi_instance > 0) {
>>>>> +			i915->engine_uabi_class_count[engine->uabi_class]--;
>>>>> +			continue;
>>>>> +		}
>>>>
>>>> It's a bit ugly to decrement after increment, instead of somehow
>>>> restructuring the loop to satisfy both cases more elegantly.
>>>
>>> yes, agree, indeed I had a hard time here to accept this change
>>> myself.
>>>
>>> But moving the check above where the counter was incremented it
>>> would have been much uglier.
>>>
>>> This check looks ugly everywhere you place it :-)
>>
>> One idea would be to introduce a separate local counter array for
>> name_instance, so not use i915->engine_uabi_class_count[]. First one
>> increments for every engine, second only for the exposed ones. That way
>> feels wouldn't be too ugly.
> 
> Ah... you mean that whenever we change the CCS mode, we update
> the indexes of the exposed engines from list of the real engines.
> Will try.
> 
> My approach was to regenerate the list everytime the CCS mode was
> changed, but your suggestion looks a bit simplier.

No, I meant just for this first stage of permanently single engine. For avoiding the decrement after increment. Something like this, but not compile tested even:

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..4c33f30612c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -203,7 +203,8 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
  
  void intel_engines_driver_register(struct drm_i915_private *i915)
  {
-       u16 name_instance, other_instance = 0;
+       u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 2] = { };
+       u16 uabi_class, other_instance = 0;
         struct legacy_ring ring = {};
         struct list_head *it, *next;
         struct rb_node **p, *prev;
@@ -222,15 +223,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
  
                 GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
                 engine->uabi_class = uabi_classes[engine->class];
+
                 if (engine->uabi_class == I915_NO_UABI_CLASS) {
-                       name_instance = other_instance++;
-               } else {
-                       GEM_BUG_ON(engine->uabi_class >=
-                                  ARRAY_SIZE(i915->engine_uabi_class_count));
-                       name_instance =
-                               i915->engine_uabi_class_count[engine->uabi_class]++;
-               }
-               engine->uabi_instance = name_instance;
+                       uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
+               else
+                       uabi_class = engine->uabi_class;
+
+               GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));
+               engine->uabi_instance = class_instance[uabi_class]++;
  
                 /*
                  * Replace the internal name with the final user and log facing
@@ -238,11 +238,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
                  */
                 engine_rename(engine,
                               intel_engine_class_repr(engine->class),
-                             name_instance);
+                             engine->uabi_instance);
  
-               if (engine->uabi_class == I915_NO_UABI_CLASS)
+               if (uabi_class == I915_NO_UABI_CLASS)
                         continue;
  
+               GEM_BUG_ON(uabi_class >=
+                          ARRAY_SIZE(i915->engine_uabi_class_count));
+               i915->engine_uabi_class_count[uabi_class]++;
+
                 rb_link_node(&engine->uabi_node, prev, p);
                 rb_insert_color(&engine->uabi_node, &i915->uabi_engines);


>>> In any case, I'm working on a patch that is splitting this
>>> function in two parts and there is some refactoring happening
>>> here (for the first initialization and the dynamic update).
>>>
>>> Please let me know if it's OK with you or you want me to fix it
>>> in this run.
>>>
>>>> And I wonder if
>>>> internally (in dmesg when engine name is logged) we don't end up with ccs0
>>>> ccs0 ccs0 ccs0.. for all instances.
>>>
>>> I don't see this. Even in sysfs we see only one ccs. Where is it?
>>
>> When you run this patch on something with two or more ccs-es, the "renamed
>> ccs... to ccs.." debug logs do not all log the new name as ccs0?
> 
> it shouldn't, because the name_instance is anyway incremented
> normally... anyway, I will test it.

Hm maybe it needs more than two ccs engines and then it would be ccs0, ccs1, ccs2, ccs2, on a four ccs part. Or something.. It just feels the decrement of i915->engine_uabi_class_count, which engine_instance currently uses, has to mess this up somehow.

Regards,

Tvrtko
