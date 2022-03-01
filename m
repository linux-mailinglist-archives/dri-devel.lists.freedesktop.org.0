Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704144C8EAB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 16:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3C110E4E7;
	Tue,  1 Mar 2022 15:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7253A10E5E9;
 Tue,  1 Mar 2022 15:14:04 +0000 (UTC)
Date: Tue, 1 Mar 2022 16:13:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1646147641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUGdyEgq6oh5oMSMjuG1ObSlbMWtpa9RG58i4P3AYEo=;
 b=r7kFrtrbJ5frtNRF4Z8L8omVQm4FeAZu+9vKS/ZHE52WcNnwN+U9qlUED5J3JiiPSL1s9c
 9+C1alOn5DOv/BDuKynnLEA0ZT6vX68XceEBpk+AaVjn6EdvJYpBqKZMa7Ja7+KYE5tKa8
 e5c/qdesHUufdk1hu1dHt5ahvwskmshh1TspDHDjsQDaNE36pqPwb4LAxBcLDA01VhohG9
 tEGNRKyN7LXD35gSAEQsDcsbjgdXD4TWeXIYNlPsQGsB3JFPAg+pkgvMqzwZUElYHBi5+I
 Tyxn+MZIz8Pla379NDEV1JhKRWClFrb8FXLvN8r8amUqsW9nv1l4r2q0ct9bxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1646147641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUGdyEgq6oh5oMSMjuG1ObSlbMWtpa9RG58i4P3AYEo=;
 b=j6q775/mf8kGM1qjt0NdZyEiylQTM+yLrFtlaWI9VPb5ux3JxeByA16nNz5Xo6OjxdnhhJ
 dhMgQ6SetMITDBBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Message-ID: <Yh44NxT/DMhB4Sqf@linutronix.de>
References: <YgqmfKhwU5spS069@linutronix.de> <YhlgRb1lZO38gAz5@linutronix.de>
 <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
 <YhylgaoHtSKi7+el@linutronix.de>
 <42282635-50a8-505f-0bd5-5aef9945e3d3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42282635-50a8-505f-0bd5-5aef9945e3d3@linux.intel.com>
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

On 2022-03-01 14:27:18 [+0000], Tvrtko Ursulin wrote:
> > you see:
> >     0003-drm-i915-Use-preempt_disable-enable_rt-where-recomme.patch
> >     0004-drm-i915-Don-t-disable-interrupts-on-PREEMPT_RT-duri.patch
> 
> Two for the display folks.
> 
> >     0005-drm-i915-Don-t-check-for-atomic-context-on-PREEMPT_R.patch
> 
> What do preempt_disable/enable do on PREEMPT_RT? Thinking if instead the
> solution could be to always force the !ATOMIC path (for the whole
> _wait_for_atomic macro) on PREEMPT_RT.

Could be one way to handle it. But please don't disable preemption and
or interrupts for longer period of time as all of it increases the
overall latency.

Side note: All of these patches is a collection over time. I personally
have only a single i7-sandybridge with i915 and here I don't really
enter all the possible paths here. People report, I patch and look
around and then they are quiet so I assume that it is working.

> >     0006-drm-i915-Disable-tracing-points-on-PREEMPT_RT.patch
> 
> If the issue is only with certain trace points why disable all?

It is a class and it is easier that way.

> >     0007-drm-i915-skip-DRM_I915_LOW_LEVEL_TRACEPOINTS-with-NO.patch
> 
> Didn't quite fully understand, why is this not fixable? Especially thinking
> if the option of not blanket disabling all tracepoints in the previous
> patch.

The problem is that you can't acquire that lock from within that
trace-point on PREEMPT_RT. On !RT it is possible but it is also
problematic because LOCKDEP does not see possible dead locks unless that
trace-point is enabled.

I've been talking to Steven (after
https://lkml.kernel.org/r/20211214115837.6f33a9b2@gandalf.local.home)
and he wants to come up with something where you can pass a lock as
argument to the tracing-API. That way the lock can be acquired before
the trace event is invoked and lockdep will see it even if the trace
event is disabled.
So there is an idea how to get it to work eventually without disabling
it in the long term.

Making the register a raw_spinlock_t would solve problem immediately but
I am a little worried given the increased latency in a quick test:
   https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.de/

also, this one single hardware but the upper limit atomic-polls is high.

> >     0008-drm-i915-gt-Queue-and-wait-for-the-irq_work-item.patch
> 
> Not sure about why cond_resched was put between irq_work_queue and
> irq_work_sync - would it not be like-for-like change to have the two
> together? 

maybe it loops for a while and an additional scheduling would be nice.

> Commit message makes me think _queue already starts the handler on
> x86 at least.

Yes, irq_work_queue() triggers the IRQ right away on x86,
irq_work_sync() would wait for it to happen in case it did not happen.
On architectures which don't provide an IRQ-work interrupt, it is
delayed to the HZ tick timer interrupt. So this serves also as an
example in case someone want to copy the code ;)

> >     0009-drm-i915-gt-Use-spin_lock_irq-instead-of-local_irq_d.patch
> 
> I think this is okay. The part after the unlock is serialized by the tasklet
> already.
> 
> Slight doubt due the comment:
> 
>   local_irq_enable(); /* flush irq_work (e.g. breadcrumb enabling) */
> 
> Makes me want to think about it harder but not now.

Clark reported it and confirmed that the warning is gone on RT and
everything appears to work ;)
PREEMPT_RT wise there is no synchronisation vs irq_work other than an
actual lock (in case it is needed).

> Another thing to check is if execlists_context_status_change still needs the
> atomic notifier chain with this change.
> 
> >     0010-drm-i915-Drop-the-irqs_disabled-check.patch
> 
> LGTM.

Do you want me to repost that one?

> >     Revert-drm-i915-Depend-on-PREEMPT_RT.patch
> 
> Okay.
> 
> And finally for this very patch (the thread I am replying to):
> 
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks.

> Regards,
> 
> Tvrtko

Sebastian
