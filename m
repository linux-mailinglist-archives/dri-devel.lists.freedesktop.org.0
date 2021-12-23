Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4947E24E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 12:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC4110E336;
	Thu, 23 Dec 2021 11:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C38210E334;
 Thu, 23 Dec 2021 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259113; x=1671795113;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tI4bJ3IyhZjrGMzR4vsIRP8N5uPIbUom0vl1dIwpqhc=;
 b=JoAVVJnyq/G6N9ibnBH/IrAU4qsj3Aejap4LcB7TR3usIu+yU2FbhlYM
 gwutPQ0GZ8MOfwz+lZCaCMYZhA26x0FpDmc/qErL4TdhC6wWTde/UNitp
 hr6WDfrpI3irhVgZFd8CGP116VIreLEMcYk+NFdm3TLh1siqZjCl+DRdP
 Nf9SL1j2M37F6mFB3ogZ+s3X510s7eEf0KRMJNKXPgC0vL4Lr00iOAu1U
 kyr5Mhh6gk1xu/CmfD1HAZ2B05eMu7yM5aoc0tMsDKiwoD2GgHGv//Ct0
 M0h0p6oETiSxXtqMZJ9rpoJ0HYwohra4NvWs1ggHehrjIBmfUN501fNjR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="327119293"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="327119293"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:31:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="508830625"
Received: from istruvin-mobl2.ger.corp.intel.com (HELO [10.252.38.82])
 ([10.252.38.82])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:31:37 -0800
Message-ID: <5506211b-3390-5976-2ad7-e60ceac57ba6@linux.intel.com>
Date: Thu, 23 Dec 2021 12:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use trylock instead of blocking
 lock for __i915_gem_free_objects.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org
References: <20211222155622.2960379-1-maarten.lankhorst@linux.intel.com>
 <0068b80d-1b6b-6ec7-6b06-0a309626312c@shipmail.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <0068b80d-1b6b-6ec7-6b06-0a309626312c@shipmail.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 20:43, Thomas Hellström (Intel) wrote:
>
> On 12/22/21 16:56, Maarten Lankhorst wrote:
>> Convert free_work into delayed_work, similar to ttm to allow converting the
>> blocking lock in __i915_gem_free_objects to a trylock.
>>
>> Unlike ttm, the object should already be idle, as it's kept alive
>> by a reference through struct i915_vma->active, which is dropped
>> after all vma's are idle.
>>
>> Because of this, we can use a no wait by default, or when the lock
>> is contested, we use ttm's 10 ms.
>>
>> The trylock should only fail when the object is sharing it's resv with
>> other objects, and typically objects are not kept locked for a long
>> time, so we can safely retry on failure.
>>
>> Fixes: be7612fd6665 ("drm/i915: Require object lock when freeing pages during destruction")
>> Testcase: igt/gem_exec_alignment/pi*
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 14 ++++++++++----
>>   drivers/gpu/drm/i915/i915_drv.h            |  4 ++--
>>   2 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 39cd563544a5..d87b508b59b1 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -331,7 +331,13 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
>>               continue;
>>           }
>>   -        i915_gem_object_lock(obj, NULL);
>> +        if (!i915_gem_object_trylock(obj, NULL)) {
>> +            /* busy, toss it back to the pile */
>> +            if (llist_add(&obj->freed, &i915->mm.free_list))
>> +                queue_delayed_work(i915->wq, &i915->mm.free_work, msecs_to_jiffies(10));
>
> i915->wq is ordered. From what I can tell, with queue_delayed_work(), the work doesn't get inserted into the queue order until the delay expires, right? So we don't unnecessarily hold up other objects getting freed?
>
>> +            continue;
>> +        }
>> +
>>           __i915_gem_object_pages_fini(obj);
>>           i915_gem_object_unlock(obj);
>>           __i915_gem_free_object(obj);
>> @@ -353,7 +359,7 @@ void i915_gem_flush_free_objects(struct drm_i915_private *i915)
>>   static void __i915_gem_free_work(struct work_struct *work)
>>   {
>>       struct drm_i915_private *i915 =
>> -        container_of(work, struct drm_i915_private, mm.free_work);
>> +        container_of(work, struct drm_i915_private, mm.free_work.work);
>>         i915_gem_flush_free_objects(i915);
>>   }
>> @@ -385,7 +391,7 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>>        */
>>         if (llist_add(&obj->freed, &i915->mm.free_list))
>> -        queue_work(i915->wq, &i915->mm.free_work);
>> +        queue_delayed_work(i915->wq, &i915->mm.free_work, 0);
>>   }
>>     void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
>> @@ -710,7 +716,7 @@ bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
>>     void i915_gem_init__objects(struct drm_i915_private *i915)
>>   {
>> -    INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
>> +    INIT_DELAYED_WORK(&i915->mm.free_work, __i915_gem_free_work);
>>   }
>>     void i915_objects_module_exit(void)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index c8fddb7e61c9..beeb42a14aae 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -465,7 +465,7 @@ struct i915_gem_mm {
>>        * List of objects which are pending destruction.
>>        */
>>       struct llist_head free_list;
>> -    struct work_struct free_work;
>> +    struct delayed_work free_work;
>>       /**
>>        * Count of objects pending destructions. Used to skip needlessly
>>        * waiting on an RCU barrier if no objects are waiting to be freed.
>> @@ -1625,7 +1625,7 @@ static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
>>        * armed the work again.
>>        */
>>       while (atomic_read(&i915->mm.free_count)) {
>> -        flush_work(&i915->mm.free_work);
>> +        flush_delayed_work(&i915->mm.free_work);
>>           flush_delayed_work(&i915->bdev.wq);
>>           rcu_barrier();
>>       }
>
> Otherwise LGTM.
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>
>
>
Thanks, pushed!

