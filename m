Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A64230A9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 21:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BEA6EC31;
	Tue,  5 Oct 2021 19:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EFC6EC30;
 Tue,  5 Oct 2021 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UDfCk26W2bKJey4sPfltPYatc0MQtHA7Rn5bmE5+zlE=; b=q86jKg/s8JmMSUWwey5RfB+aYz
 9nj2AAg2sbBKCEK/NMOIrpnpGjzA26KkV0rpRaKf6/S8Vk9x0/MU70S0cp72CqjQk+zV/XoZcGc39
 Wfyw6THSCAaskDdQ4LTkCcRAEQwRBiotAZ1BEMouPWsN1z1gLQp2Bv+cMBXcJl5FKQ3Bd/cQt63xE
 blgYaM+/HK3qgjQcnFaSIrln+ymfapPj29xPsfKN9Dmd/ICqXYtL1Py2GuQxJw3B0AaxUb0JIsSVr
 r5f7SjIosdQPemxVYR22yY8crQaLVL7jeZVdjOVoaGST2p9aCcyfdKY08wsCgrrQolrefTPJ/i28W
 arzQdXPg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXpvG-000C7r-D1; Tue, 05 Oct 2021 19:16:42 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id C10A9981A96; Tue,  5 Oct 2021 21:16:17 +0200 (CEST)
Date: Tue, 5 Oct 2021 21:16:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 8/8] drm/i915: Don't disable interrupts and pretend a
 lock as been acquired in __timeline_mark_lock().
Message-ID: <20211005191617.GA174703@worktop.programming.kicks-ass.net>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-9-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005150046.1000285-9-bigeasy@linutronix.de>
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

On Tue, Oct 05, 2021 at 05:00:46PM +0200, Sebastian Andrzej Siewior wrote:
> This is a revert of commits
>    d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")
>    6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by timeline->mutex")
> 
> The existing code leads to a different behaviour depending on wheather
> lockdep is enabled or not. Any following lock that is acquired without
> disabling interrupts (but needs to) will not be noticed by lockdep.
> 
> This it not just a lockdep annotation but is used but an actual mutex_t
> that is properly used as a lock but in case of __timeline_mark_lock()
> lockdep is only told that it is acquired but no lock has been acquired.
> 
> It appears that its purporse is just satisfy the lockdep_assert_held()
> check in intel_context_mark_active(). The other problem with disabling
> interrupts is that on PREEMPT_RT interrupts are also disabled which
> leads to problems for instance later during memory allocation.
> 
> Add an argument to intel_context_mark_active() which is true if the lock
> must have been acquired, false if other magic is involved and the lock
> is not needed. Use the `false' argument only from within
> switch_to_kernel_context() and remove __timeline_mark_lock().
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Eeew, nice find.


> -static inline void intel_context_mark_active(struct intel_context *ce)
> +static inline void intel_context_mark_active(struct intel_context *ce,
> +					     bool timeline_mutex_needed)
>  {
> -	lockdep_assert_held(&ce->timeline->mutex);
> +	if (timeline_mutex_needed)
> +		lockdep_assert_held(&ce->timeline->mutex);
>  	++ce->active_count;
>  }

Chris, might it be possible to write that something like:

	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
		       engine_is_parked(ce));

instead?

Otherwise,

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
