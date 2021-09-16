Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3140D65D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674DE6EB30;
	Thu, 16 Sep 2021 09:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCA96EB2C;
 Thu, 16 Sep 2021 09:39:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202683951"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202683951"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 02:39:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="509244640"
Received: from kumardhx-mobl1.gar.corp.intel.com (HELO [10.252.50.13])
 ([10.252.50.13])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 02:38:57 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/i915/gt: Use spin_lock_irq()
 instead of local_irq_disable() + spin_lock()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Clark Williams <williams@redhat.com>
References: <20210908185703.2989414-1-bigeasy@linutronix.de>
 <20210908185703.2989414-3-bigeasy@linutronix.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <48ed82b8-a641-1090-a93f-23476f9c0eb0@linux.intel.com>
Date: Thu, 16 Sep 2021 11:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210908185703.2989414-3-bigeasy@linutronix.de>
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 08-09-2021 om 20:57 schreef Sebastian Andrzej Siewior:
> execlists_dequeue() is invoked from a function which uses
> local_irq_disable() to disable interrupts so the spin_lock() behaves
> like spin_lock_irq().
> This breaks PREEMPT_RT because local_irq_disable() + spin_lock() is not
> the same as spin_lock_irq().
>
> execlists_dequeue_irq() and execlists_dequeue() has each one caller
> only. If intel_engine_cs::active::lock is acquired and released with the
> _irq suffix then it behaves almost as if execlists_dequeue() would be
> invoked with disabled interrupts. The difference is the last part of the
> function which is then invoked with enabled interrupts.
> I can't tell if this makes a difference. From looking at it, it might
> work to move the last unlock at the end of the function as I didn't find
> anything that would acquire the lock again.
>
> Reported-by: Clark Williams <williams@redhat.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  .../drm/i915/gt/intel_execlists_submission.c    | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index fc77592d88a96..2ec1dd352960b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1265,7 +1265,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>  	 * and context switches) submission.
>  	 */
>  
> -	spin_lock(&engine->active.lock);
> +	spin_lock_irq(&engine->active.lock);
>  
>  	/*
>  	 * If the queue is higher priority than the last
> @@ -1365,7 +1365,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>  				 * Even if ELSP[1] is occupied and not worthy
>  				 * of timeslices, our queue might be.
>  				 */
> -				spin_unlock(&engine->active.lock);
> +				spin_unlock_irq(&engine->active.lock);
>  				return;
>  			}
>  		}
> @@ -1391,7 +1391,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>  
>  		if (last && !can_merge_rq(last, rq)) {
>  			spin_unlock(&ve->base.active.lock);
> -			spin_unlock(&engine->active.lock);
> +			spin_unlock_irq(&engine->active.lock);
>  			return; /* leave this for another sibling */
>  		}
>  
> @@ -1552,7 +1552,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>  	 * interrupt for secondary ports).
>  	 */
>  	execlists->queue_priority_hint = queue_prio(execlists);
> -	spin_unlock(&engine->active.lock);
> +	spin_unlock_irq(&engine->active.lock);
>  
>  	/*
>  	 * We can skip poking the HW if we ended up with exactly the same set
> @@ -1578,13 +1578,6 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>  	}
>  }
>  
> -static void execlists_dequeue_irq(struct intel_engine_cs *engine)
> -{
> -	local_irq_disable(); /* Suspend interrupts across request submission */
> -	execlists_dequeue(engine);
> -	local_irq_enable(); /* flush irq_work (e.g. breadcrumb enabling) */
> -}
> -
>  static void clear_ports(struct i915_request **ports, int count)
>  {
>  	memset_p((void **)ports, NULL, count);
> @@ -2377,7 +2370,7 @@ static void execlists_submission_tasklet(struct tasklet_struct *t)
>  	}
>  
>  	if (!engine->execlists.pending[0]) {
> -		execlists_dequeue_irq(engine);
> +		execlists_dequeue(engine);
>  		start_timeslice(engine);
>  	}
>  

Patches look good.

For both patches:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I've been looking at running i915 with the -rt patch series, and noticed i915_request_submit fails with GEM_BUG_ON(!irqs_disabled()); presumably same failure exists for i915_request_unsubmit().

Might be worth removing those checks as well? Seems double with lockdep_assert_held on an irq lock anyway.

I've also noticed the local_irq_disable/enable is removed from intel_pipe_update_(start/end) in the rt series. It might make sense from a -rt point of view, but that code needs to run without interruptions, or i915 may show visual glitches or even locks up the system.

It should just be a set of registers hammered in, but the code might needs to be fixed to take the mmio lock as outer lock, and become a strict set of register read/writes only.

~Maarten

