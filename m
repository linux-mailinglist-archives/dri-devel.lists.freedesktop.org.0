Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CB4CA3FF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E9A10E88E;
	Wed,  2 Mar 2022 11:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744D010E88E;
 Wed,  2 Mar 2022 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646221360; x=1677757360;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hpfHanUBTT6yrSQckm/GnJ6C7bOYDBfoO37uha4e6zY=;
 b=hyIxUf8j5QLuHRRsLKvAjaCtW3w/E3Xl6fPicW2GZRvHE2tQSe2uDiIR
 VZA07f8R6S3vv9OxdQoch/w6pWc852q9FjsR2qZvCpcDdj7V+Fbk4E1zS
 FXcenQkS4RkytWIHNQX+FC0Z5QUYEktLQ9uZv1nKCBVBJy4d8x4opcyGz
 uQxCTseUCBv9d97mxLUorcbtP9UrwCj+twdvmpjKadU2FciZHsVpfmD60
 xmPoMg4BfdsNe1iDEd9zpbM8p2RDFiFYXDWJrNGLZLmjlV5LTbEE4OUW7
 bn1a7NMWP+tfNvigWCpA+juJlC+zVhZO80X6D5EVR42gV6E98UlzubqZU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="252210444"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="252210444"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 03:42:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="641670020"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 03:42:37 -0800
Message-ID: <cc09f4d6-c0f5-3ea5-0eab-fa1d2a7c6519@linux.intel.com>
Date: Wed, 2 Mar 2022 11:42:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <YgqmfKhwU5spS069@linutronix.de> <YhlgRb1lZO38gAz5@linutronix.de>
 <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
 <YhylgaoHtSKi7+el@linutronix.de>
 <42282635-50a8-505f-0bd5-5aef9945e3d3@linux.intel.com>
 <Yh44NxT/DMhB4Sqf@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yh44NxT/DMhB4Sqf@linutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/03/2022 15:13, Sebastian Andrzej Siewior wrote:
> On 2022-03-01 14:27:18 [+0000], Tvrtko Ursulin wrote:
>>> you see:
>>>      0003-drm-i915-Use-preempt_disable-enable_rt-where-recomme.patch
>>>      0004-drm-i915-Don-t-disable-interrupts-on-PREEMPT_RT-duri.patch
>>
>> Two for the display folks.
>>
>>>      0005-drm-i915-Don-t-check-for-atomic-context-on-PREEMPT_R.patch
>>
>> What do preempt_disable/enable do on PREEMPT_RT? Thinking if instead the
>> solution could be to always force the !ATOMIC path (for the whole
>> _wait_for_atomic macro) on PREEMPT_RT.
> 
> Could be one way to handle it. But please don't disable preemption and
> or interrupts for longer period of time as all of it increases the
> overall latency.

I am looking for your guidance of what is the correct thing here.

Main purpose of this macro on the i915 side is to do short waits on GPU 
registers changing post write from spin-locked sections. But there were 
rare cases when very short waits were needed from unlocked sections, 
shorter than 10us (which is AFAIR what usleep_range documents should be 
a lower limit). Which is why non-atomic path was added to the macro. 
That path uses preempt_disable/enable so it can use local_clock().

All this may, or may not be, compatible with PREEMPT_RT to start with?

Or question phrased differently, how we should implement the <10us waits 
from non-atomic sections under PREEMPT_RT?

> Side note: All of these patches is a collection over time. I personally
> have only a single i7-sandybridge with i915 and here I don't really
> enter all the possible paths here. People report, I patch and look
> around and then they are quiet so I assume that it is working.
> 
>>>      0006-drm-i915-Disable-tracing-points-on-PREEMPT_RT.patch
>>
>> If the issue is only with certain trace points why disable all?
> 
> It is a class and it is easier that way.
> 
>>>      0007-drm-i915-skip-DRM_I915_LOW_LEVEL_TRACEPOINTS-with-NO.patch
>>
>> Didn't quite fully understand, why is this not fixable? Especially thinking
>> if the option of not blanket disabling all tracepoints in the previous
>> patch.
> 
> The problem is that you can't acquire that lock from within that
> trace-point on PREEMPT_RT. On !RT it is possible but it is also
> problematic because LOCKDEP does not see possible dead locks unless that
> trace-point is enabled.

Oh I meant could the include ordering problem be fixed differently?

"""
[PATCH 07/10] drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with
  NOTRACE

The order of the header files is important. If this header file is
included after tracepoint.h was included then the NOTRACE here becomes a
nop. Currently this happens for two .c files which use the tracepoitns
behind DRM_I915_LOW_LEVEL_TRACEPOINTS.
"""

Like these two .c files - can order of includes just be changed in them?

> 
> I've been talking to Steven (after
> https://lkml.kernel.org/r/20211214115837.6f33a9b2@gandalf.local.home)
> and he wants to come up with something where you can pass a lock as
> argument to the tracing-API. That way the lock can be acquired before
> the trace event is invoked and lockdep will see it even if the trace
> event is disabled.
> So there is an idea how to get it to work eventually without disabling
> it in the long term.
> 
> Making the register a raw_spinlock_t would solve problem immediately but
> I am a little worried given the increased latency in a quick test:
>     https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.de/
> 
> also, this one single hardware but the upper limit atomic-polls is high.
> 
>>>      0008-drm-i915-gt-Queue-and-wait-for-the-irq_work-item.patch
>>
>> Not sure about why cond_resched was put between irq_work_queue and
>> irq_work_sync - would it not be like-for-like change to have the two
>> together?
> 
> maybe it loops for a while and an additional scheduling would be nice.
> 
>> Commit message makes me think _queue already starts the handler on
>> x86 at least.
> 
> Yes, irq_work_queue() triggers the IRQ right away on x86,
> irq_work_sync() would wait for it to happen in case it did not happen.
> On architectures which don't provide an IRQ-work interrupt, it is
> delayed to the HZ tick timer interrupt. So this serves also as an
> example in case someone want to copy the code ;)

My question wasn't why is there a need_resched() in there, but why is 
the patch:

+		irq_work_queue(&b->irq_work);
  		cond_resched();
+		irq_work_sync(&b->irq_work);

And not:

+		irq_work_queue(&b->irq_work);
+		irq_work_sync(&b->irq_work);
  		cond_resched();

To preserve like for like, if my understanding of the commit message was 
correct.

> 
>>>      0009-drm-i915-gt-Use-spin_lock_irq-instead-of-local_irq_d.patch
>>
>> I think this is okay. The part after the unlock is serialized by the tasklet
>> already.
>>
>> Slight doubt due the comment:
>>
>>    local_irq_enable(); /* flush irq_work (e.g. breadcrumb enabling) */
>>
>> Makes me want to think about it harder but not now.
> 
> Clark reported it and confirmed that the warning is gone on RT and
> everything appears to work ;)

I will need to think about it harder at some point.

> PREEMPT_RT wise there is no synchronisation vs irq_work other than an
> actual lock (in case it is needed).

Okay, marking as todo/later for me. Need to see if enabling breadcrumbs 
earlier than it used to be after this patch makes any difference.

>> Another thing to check is if execlists_context_status_change still needs the
>> atomic notifier chain with this change.
>>
>>>      0010-drm-i915-Drop-the-irqs_disabled-check.patch
>>
>> LGTM.
> 
> Do you want me to repost that one?

I think it's up to you whether you go one by one, or repost the whole 
series or whatever.

>>>      Revert-drm-i915-Depend-on-PREEMPT_RT.patch
>>
>> Okay.
>>
>> And finally for this very patch (the thread I am replying to):
>>
>> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Thanks.

Np - and I've pushed this one.

Regards,

Tvrtko
