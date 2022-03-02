Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446774CA4DF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 13:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211F210ED06;
	Wed,  2 Mar 2022 12:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE89410ED06
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 12:32:56 +0000 (UTC)
Date: Wed, 2 Mar 2022 13:32:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1646224375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6/1rKVTrXaC4pmzDxfiDtmQeP/5Nibph0yrdWe6Uu4=;
 b=VeQ2aWuJGFUmggPa1CiE3w+VFOu25SqTtkWRkWhyRS0P+UMCmToTnjE/eHy4lOQ5FTyhzN
 Jbk8EenfDWm4ors7vhD3yDJrySbtR89JlzhEW5kYtB1w1UmBxjis7Z6pWHhAqfanSjtqdw
 Zu26OFZyC2nTdC1eUaw1vMDpbKRn4rCMcBAR3A8mu3xoDPnWbJUqPnPG0WgdVX39Eql3y4
 rSj8CNIYv2EVRS77JOvhPaVWEkWsCiS8Sv2Tt2724PDq1OpGSumVnzqtCHXAU6F0dfqloJ
 nM8vOeDjPzBjDDGzMSUEZoS/LUjYS8saTkbJ1opIoawfOxeaC2PHoYxr6Yf0RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1646224375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6/1rKVTrXaC4pmzDxfiDtmQeP/5Nibph0yrdWe6Uu4=;
 b=Lc2YK7LOVX2wJqtytmqs49eRgti4xiGgBxb1unvD6MvapTeOunYPmwzwggrUbOU4KoQPBf
 YFJ+Vj2X2kxLNVBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Message-ID: <Yh9j9URUNOiHN4TW@linutronix.de>
References: <YgqmfKhwU5spS069@linutronix.de> <YhlgRb1lZO38gAz5@linutronix.de>
 <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
 <YhylgaoHtSKi7+el@linutronix.de>
 <42282635-50a8-505f-0bd5-5aef9945e3d3@linux.intel.com>
 <Yh44NxT/DMhB4Sqf@linutronix.de>
 <cc09f4d6-c0f5-3ea5-0eab-fa1d2a7c6519@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc09f4d6-c0f5-3ea5-0eab-fa1d2a7c6519@linux.intel.com>
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

On 2022-03-02 11:42:35 [+0000], Tvrtko Ursulin wrote:
> > > >      0005-drm-i915-Don-t-check-for-atomic-context-on-PREEMPT_R.patch
> > > 
> > > What do preempt_disable/enable do on PREEMPT_RT? Thinking if instead the
> > > solution could be to always force the !ATOMIC path (for the whole
> > > _wait_for_atomic macro) on PREEMPT_RT.
> > 
> > Could be one way to handle it. But please don't disable preemption and
> > or interrupts for longer period of time as all of it increases the
> > overall latency.
> 
> I am looking for your guidance of what is the correct thing here.
> 
> Main purpose of this macro on the i915 side is to do short waits on GPU
> registers changing post write from spin-locked sections. But there were rare
> cases when very short waits were needed from unlocked sections, shorter than
> 10us (which is AFAIR what usleep_range documents should be a lower limit).
> Which is why non-atomic path was added to the macro. That path uses
> preempt_disable/enable so it can use local_clock().
>
> All this may, or may not be, compatible with PREEMPT_RT to start with?

Your assumption about atomic is not correct and that is why I aim to
ignore for RT. Or maybe alter so it fits.
It is assumed, that in_atomic() is true in an interrupts handler or with
an acquired spinlock_t, right? Both condition keep the context
preemptible so the atomic check triggers. However, both (the force
threaded interrupt handler and the spinlock_t) ensure that the task is
stuck on the CPU.

So maybe your _WAIT_FOR_ATOMIC_CHECK() could point to cant_migrate().
It looks like you try to ensure that local_clock() is from the same CPU.

> Or question phrased differently, how we should implement the <10us waits
> from non-atomic sections under PREEMPT_RT?

I think if you swap check in _WAIT_FOR_ATOMIC_CHECK() it should be good.
After all the remains preemptible during the condition polls so it
should work.

> > The problem is that you can't acquire that lock from within that
> > trace-point on PREEMPT_RT. On !RT it is possible but it is also
> > problematic because LOCKDEP does not see possible dead locks unless that
> > trace-point is enabled.
> 
> Oh I meant could the include ordering problem be fixed differently?
> 
> """
> [PATCH 07/10] drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with
>  NOTRACE
> 
> The order of the header files is important. If this header file is
> included after tracepoint.h was included then the NOTRACE here becomes a
> nop. Currently this happens for two .c files which use the tracepoitns
> behind DRM_I915_LOW_LEVEL_TRACEPOINTS.
> """
> 
> Like these two .c files - can order of includes just be changed in them?

Maybe. Let me check and get back to you.

> > I've been talking to Steven (after
> > https://lkml.kernel.org/r/20211214115837.6f33a9b2@gandalf.local.home)
> > and he wants to come up with something where you can pass a lock as
> > argument to the tracing-API. That way the lock can be acquired before
> > the trace event is invoked and lockdep will see it even if the trace
> > event is disabled.
> > So there is an idea how to get it to work eventually without disabling
> > it in the long term.
> > 
> > Making the register a raw_spinlock_t would solve problem immediately but
> > I am a little worried given the increased latency in a quick test:
> >     https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.de/
> > 
> > also, this one single hardware but the upper limit atomic-polls is high.
> > 
> > > >      0008-drm-i915-gt-Queue-and-wait-for-the-irq_work-item.patch
> > > 
> > > Not sure about why cond_resched was put between irq_work_queue and
> > > irq_work_sync - would it not be like-for-like change to have the two
> > > together?
> > 
> > maybe it loops for a while and an additional scheduling would be nice.
> > 
> > > Commit message makes me think _queue already starts the handler on
> > > x86 at least.
> > 
> > Yes, irq_work_queue() triggers the IRQ right away on x86,
> > irq_work_sync() would wait for it to happen in case it did not happen.
> > On architectures which don't provide an IRQ-work interrupt, it is
> > delayed to the HZ tick timer interrupt. So this serves also as an
> > example in case someone want to copy the code ;)
> 
> My question wasn't why is there a need_resched() in there, but why is the
> patch:
> 
> +		irq_work_queue(&b->irq_work);
>  		cond_resched();
> +		irq_work_sync(&b->irq_work);
> 
> And not:
> 
> +		irq_work_queue(&b->irq_work);
> +		irq_work_sync(&b->irq_work);
>  		cond_resched();
> 
> To preserve like for like, if my understanding of the commit message was
> correct.

No strong need, it can be put as you suggest.
Should someone else schedule &b->irq_work from another CPU then you
could first attempt to cond_resched() and then wait for &b->irq_work's
completion. Assuming that this does not happen (because the irq_work was
previously queued and invoked immediately) irq_work_sync) will just return.

> > > >      0009-drm-i915-gt-Use-spin_lock_irq-instead-of-local_irq_d.patch
> > > 
> > > I think this is okay. The part after the unlock is serialized by the tasklet
> > > already.
> > > 
> > > Slight doubt due the comment:
> > > 
> > >    local_irq_enable(); /* flush irq_work (e.g. breadcrumb enabling) */
> > > 
> > > Makes me want to think about it harder but not now.
> > 
> > Clark reported it and confirmed that the warning is gone on RT and
> > everything appears to work ;)
> 
> I will need to think about it harder at some point.
> 
> > PREEMPT_RT wise there is no synchronisation vs irq_work other than an
> > actual lock (in case it is needed).
> 
> Okay, marking as todo/later for me. Need to see if enabling breadcrumbs
> earlier than it used to be after this patch makes any difference.

Okay.

> > > Another thing to check is if execlists_context_status_change still needs the
> > > atomic notifier chain with this change.
> > > 
> > > >      0010-drm-i915-Drop-the-irqs_disabled-check.patch
> > > 
> > > LGTM.
> > 
> > Do you want me to repost that one?
> 
> I think it's up to you whether you go one by one, or repost the whole series
> or whatever.

If it is up to me then let me repost that one single patch and I have it
out of my queue :) And
0008-drm-i915-gt-Queue-and-wait-for-the-irq_work-item.patch without
cond_resched() in the middle.

> Regards,
> 
> Tvrtko

Sebastian
