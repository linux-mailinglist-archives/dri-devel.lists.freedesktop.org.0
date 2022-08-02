Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B276587837
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 09:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32BE11A53C;
	Tue,  2 Aug 2022 07:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911A518A690;
 Tue,  2 Aug 2022 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426488; x=1690962488;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LijYlLPGz8S4x2uzO3RB0folYWdXJztzxm12sh9TPJ4=;
 b=JBTiLLdL2vkfrWW5ye1SH3sRnEMkeFu6DESP91gPg282lz0jIlI3YbG6
 7JqQTkbUv3xpTNcYHtJXk4c/Opll9a1f2eXd3hyM2S0IBu06KPx4uGBRy
 Y90tWUAHchWUi4tVAxscN+r6SvJg4Y22kARF/FqXIB48Iv7um4ZXYfXMr
 s7E+F3dEST3heI7i3ibEvva7Y3GlZ9Pk8Wea457KAO54y7qg+HBJYqNID
 v5SRv1L9jpkgtEV8rIp6qSL2TIqOfjXHyMc4luFeNjQDI8Sup7iYPVbqe
 3/fYoy6G67V9moJ2hP8NfppX1zTYKqh30xLkD4geXqGxlHzr9njFGo1NE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="353352139"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="353352139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="661515377"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.39.112])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:04 -0700
Date: Tue, 2 Aug 2022 09:48:01 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/21] drm/i915/guc: Define CTB based TLB
 invalidation routines
Message-ID: <20220802094801.24bec766@maurocar-mobl2>
In-Reply-To: <fb9f1a22-fa68-9e7a-9159-90b87fbb27aa@intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <1be3eb5a7110012de506b3df01339b314c6643b7.1657800199.git.mchehab@kernel.org>
 <fb9f1a22-fa68-9e7a-9159-90b87fbb27aa@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Borislav Petkov <bp@suse.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jul 2022 16:06:28 +0200
Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:

> On 14.07.2022 14:06, Mauro Carvalho Chehab wrote:
> > From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> > 
> > Add routines to interface with GuC firmware for TLB invalidation.
> > 
> > Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
> > 
> >  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 35 +++++++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 90 ++++++++++++++++++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 13 +++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 24 ++++-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  6 ++
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 91 ++++++++++++++++++-
> >  6 files changed, 253 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> > index 4ef9990ed7f8..2e39d8df4c82 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> > @@ -134,6 +134,10 @@ enum intel_guc_action {
> >  	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> >  	INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> >  	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > +	INTEL_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,  
> 
> should this be part of this patch ?

No, I'll drop...
> 
> > +	INTEL_GUC_ACTION_PAGE_FAULT_NOTIFICATION = 0x6001,

... and also drop this one.

> > +	INTEL_GUC_ACTION_TLB_INVALIDATION = 0x7000,
> > +	INTEL_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,  
> 
> can we document layout of these actions ?

Where should we document it? At intel_guc_invalidate_tlb_guc()
function & friends, or are you thinking on something else, at this
header file?

> 
> >  	INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
> >  	INTEL_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
> >  	INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
> > @@ -177,4 +181,35 @@ enum intel_guc_state_capture_event_status {
> >  
> >  #define INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
> >  
> > +#define INTEL_GUC_TLB_INVAL_TYPE_SHIFT 0
> > +#define INTEL_GUC_TLB_INVAL_MODE_SHIFT 8  
> 
> can we stop using SHIFT-based definitions and start using MASK-based
> instead ? then we will be able to use FIELD_PREP/GET like we do for i915_reg

Ok.

> 
> > +/* Flush PPC or SMRO caches along with TLB invalidation request */
> > +#define INTEL_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
> > +
> > +enum intel_guc_tlb_invalidation_type {
> > +	INTEL_GUC_TLB_INVAL_GUC = 0x3,
> > +};
> > +
> > +/*
> > + * 0: Heavy mode of Invalidation:
> > + * The pipeline of the engine(s) for which the invalidation is targeted to is
> > + * blocked, and all the in-flight transactions are guaranteed to be Globally
> > + * Observed before completing the TLB invalidation
> > + * 1: Lite mode of Invalidation:
> > + * TLBs of the targeted engine(s) are immediately invalidated.
> > + * In-flight transactions are NOT guaranteed to be Globally Observed before
> > + * completing TLB invalidation.
> > + * Light Invalidation Mode is to be used only when
> > + * it can be guaranteed (by SW) that the address translations remain invariant
> > + * for the in-flight transactions across the TLB invalidation. In other words,
> > + * this mode can be used when the TLB invalidation is intended to clear out the
> > + * stale cached translations that are no longer in use. Light Invalidation Mode
> > + * is much faster than the Heavy Invalidation Mode, as it does not wait for the
> > + * in-flight transactions to be GOd.
> > + */  
> 
> either drop this comment or squash with patch 10/21 to fix it

Ok.

> 
> > +enum intel_guc_tlb_inval_mode {
> > +	INTEL_GUC_TLB_INVAL_MODE_HEAVY = 0x0,
> > +	INTEL_GUC_TLB_INVAL_MODE_LITE = 0x1,
> > +};
> > +
> >  #endif /* _ABI_GUC_ACTIONS_ABI_H */
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > index 2706a8c65090..5c59f9b144a3 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > @@ -855,6 +855,96 @@ int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value)
> >  	return __guc_self_cfg(guc, key, 2, value);
> >  }
> >  
> > +static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)  
> 
> nit: maybe since MMIO TLB has moved to dedicated file, we can do the
> same with GUC TLB code like "intel_guc_tlb.c" ?

I'll add a patch at the end of this series moving the code.

> > +{
> > +	struct intel_guc_tlb_wait _wq, *wq = &_wq;
> > +	DEFINE_WAIT_FUNC(wait, woken_wake_function);
> > +	int err = 0;
> > +	u32 seqno;
> > +
> > +	init_waitqueue_head(&_wq.wq);
> > +
> > +	if (xa_alloc_cyclic_irq(&guc->tlb_lookup, &seqno, wq,
> > +				xa_limit_32b, &guc->next_seqno,
> > +				GFP_ATOMIC | __GFP_NOWARN) < 0) {
> > +		/* Under severe memory pressure? Serialise TLB allocations */
> > +		xa_lock_irq(&guc->tlb_lookup);
> > +		wq = xa_load(&guc->tlb_lookup, guc->serial_slot);
> > +		wait_event_lock_irq(wq->wq,
> > +				    !READ_ONCE(wq->status),
> > +				    guc->tlb_lookup.xa_lock);
> > +		/*
> > +		 * Update wq->status under lock to ensure only one waiter can
> > +		 * issue the tlb invalidation command using the serial slot at a
> > +		 * time. The condition is set to false before releasing the lock
> > +		 * so that other caller continue to wait until woken up again.
> > +		 */
> > +		wq->status = 1;
> > +		xa_unlock_irq(&guc->tlb_lookup);
> > +
> > +		seqno = guc->serial_slot;
> > +	}
> > +
> > +	action[1] = seqno;  
> 
> it's sad that we need to update in blind this action message
> 
> if you don't want to expose seqno allocation in a helper function that
> each caller would use, then maybe assert that this action message is
> expected one

I'll encapsulate the code that allocates the seqno on a new helper function:

	static int intel_guc_alloc_tlb_seqno(struct intel_guc *guc,
	                                    struct intel_guc_tlb_wait *wq)
	{
	       u32 seqno;
	
	       if (xa_alloc_cyclic_irq(&guc->tlb_lookup, &seqno, wq,
	                               xa_limit_32b, &guc->next_seqno,
        	                       GFP_ATOMIC | __GFP_NOWARN) >= 0)
	               return seqno;

		/* Under severe memory pressure? Serialise TLB allocations */

	       xa_lock_irq(&guc->tlb_lookup);
	       wq = xa_load(&guc->tlb_lookup, guc->serial_slot);
	       wait_event_lock_irq(wq->wq,
	                           !READ_ONCE(wq->status),
        	                   guc->tlb_lookup.xa_lock);
	       /*
	        * Update wq->status under lock to ensure only one waiter can
	        * issue the TLB invalidation command using the serial slot at a
	        * time. The condition is set to false before releasing the lock
	        * so that other caller continue to wait until woken up again.
	        */
	       wq->status = 1;
	       xa_unlock_irq(&guc->tlb_lookup);
	
	       return guc->serial_slot;
	}

This should improve the readability of the invalidate function:

	static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
	{
		struct intel_guc_tlb_wait _wq, *wq = &_wq;
		DEFINE_WAIT_FUNC(wait, woken_wake_function);
		int err = 0;
		u32 seqno;

		init_waitqueue_head(&_wq.wq);

		seqno = intel_guc_alloc_tlb_seqno(guc, wq);
		action[1] = seqno;
	...

> > +
> > +	add_wait_queue(&wq->wq, &wait);
> > +
> > +	err = intel_guc_send_busy_loop(guc, action, size, G2H_LEN_DW_INVALIDATE_TLB, true);
> > +	if (err) {
> > +		/*
> > +		 * XXX: Failure of tlb invalidation is critical and would  
> 
> s/tlb/TLB
> 
> > +		 * warrant a gt reset.
> > +		 */
> > +		goto out;
> > +	}
> > +/*
> > + * GuC has a timeout of 1ms for a tlb invalidation response from GAM. On a  
> 
> ditto
> 
> > + * timeout GuC drops the request and has no mechanism to notify the host about
> > + * the timeout. So keep a larger timeout that accounts for this individual
> > + * timeout and max number of outstanding invalidation requests that can be
> > + * queued in CT buffer.
> > + */
> > +#define OUTSTANDING_GUC_TIMEOUT_PERIOD  (HZ)
> > +	if (!wait_woken(&wait, TASK_UNINTERRUPTIBLE,  
> 
> IIRC there was some discussion if we can rely on this in our scenario
> can you sync with Chris on that?

I'll check.

> 
> > +			OUTSTANDING_GUC_TIMEOUT_PERIOD)) {
> > +		/*
> > +		 * XXX: Failure of tlb invalidation is critical and would  
> 
> s/tlb/TLB
> 
> > +		 * warrant a gt reset.
> > +		 */
> > +		drm_err(&guc_to_gt(guc)->i915->drm,
> > +			 "tlb invalidation response timed out for seqno %u\n", seqno);  
> 
> s/tlb/TLB
> 
> btw, should we care here about G2H_LEN_DW_INVALIDATE_TLB space that we
> reserved in send_busy_loop() ?

Good question. The logic at intel_guc_tlb_invalidation_done() has
something to handle timeouts:

	/* We received a response after the waiting task did exit with a timeout */
	if (unlikely(!wait))
		drm_err(&guc_to_gt(guc)->i915->drm,
			"Stale TLB invalidation response with seqno %d\n", seqno);

It sounds to me that this is already covered there.

> 
> > +		err = -ETIME;
> > +	}
> > +out:
> > +	remove_wait_queue(&wq->wq, &wait);
> > +	if (seqno != guc->serial_slot)
> > +		xa_erase_irq(&guc->tlb_lookup, seqno);
> > +
> > +	return err;
> > +}
> > +
> > +/*
> > + * Guc TLB Invalidation: Invalidate the TLB's of GuC itself.
> > + */
> > +int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
> > +				 enum intel_guc_tlb_inval_mode mode)
> > +{
> > +	u32 action[] = {
> > +		INTEL_GUC_ACTION_TLB_INVALIDATION,
> > +		0,
> > +		INTEL_GUC_TLB_INVAL_GUC << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
> > +			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
> > +			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
> > +	};
> > +
> > +	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc)) {
> > +		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");  
> 
> you should use drm_err() instead

Ok.

> but wondering if maybe this should be treated as a coding error (and
> then use GEM_BUG/WARN_ON instead) but then not sure how to interpret the
> check for the intel_guc_ct_enabled() embedded in above macro ...
> note that intel_guc_ct_send() will return -ENODEV if CTB is down

Good point. Still, I don't think that the driver should crash with
GEM_BUG/WARN_ON() if TLB invalidation is not available, as this may
cause regressions.

I mean, assuming that someone is currently using the driver on a
firmware that doesn't support such actions, after this patch, the
driver will stop working for him.

So, I think the right thing to do is to just report it as an
error.

> > +		return 0;
> > +	}
> > +
> > +	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
> > +}
> > +
> >  /**
> >   * intel_guc_load_status - dump information about GuC load status
> >   * @guc: the GuC
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index d0d99f178f2d..f82a121b0838 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -77,6 +77,10 @@ struct intel_guc {
> >  	atomic_t outstanding_submission_g2h;
> >  
> >  	/** @interrupts: pointers to GuC interrupt-managing functions. */
> > +	struct xarray tlb_lookup;
> > +	u32 serial_slot;
> > +	u32 next_seqno;  
> 
> wrong place - above kernel-doc is for the struct below

Ok.

> > +
> >  	struct {
> >  		void (*reset)(struct intel_guc *guc);
> >  		void (*enable)(struct intel_guc *guc);
> > @@ -248,6 +252,11 @@ struct intel_guc {
> >  #endif
> >  };
> >  
> > +struct intel_guc_tlb_wait {
> > +	struct wait_queue_head wq;
> > +	u8 status;
> > +} __aligned(4);
> > +
> >  static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> >  {
> >  	return container_of(log, struct intel_guc, log);
> > @@ -363,6 +372,9 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
> >  int intel_guc_self_cfg32(struct intel_guc *guc, u16 key, u32 value);
> >  int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value);
> >  
> > +int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
> > +				 enum intel_guc_tlb_inval_mode mode);
> > +
> >  static inline bool intel_guc_is_supported(struct intel_guc *guc)
> >  {
> >  	return intel_uc_fw_is_supported(&guc->fw);
> > @@ -440,6 +452,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
> >  					 const u32 *msg, u32 len);
> >  int intel_guc_error_capture_process_msg(struct intel_guc *guc,
> >  					const u32 *msg, u32 len);
> > +void intel_guc_tlb_invalidation_done(struct intel_guc *guc, u32 seqno);
> >  
> >  struct intel_engine_cs *
> >  intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index f01325cd1b62..c1ce542b7855 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -1023,7 +1023,7 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
> >  	return 0;
> >  }
> >  
> > -static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
> > +static bool ct_process_incoming_requests(struct intel_guc_ct *ct, struct list_head *incoming)
> >  {
> >  	unsigned long flags;
> >  	struct ct_incoming_msg *request;
> > @@ -1031,11 +1031,11 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
> >  	int err;
> >  
> >  	spin_lock_irqsave(&ct->requests.lock, flags);
> > -	request = list_first_entry_or_null(&ct->requests.incoming,
> > +	request = list_first_entry_or_null(incoming,
> >  					   struct ct_incoming_msg, link);
> >  	if (request)
> >  		list_del(&request->link);
> > -	done = !!list_empty(&ct->requests.incoming);
> > +	done = !!list_empty(incoming);
> >  	spin_unlock_irqrestore(&ct->requests.lock, flags);
> >  
> >  	if (!request)
> > @@ -1058,7 +1058,7 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
> >  	bool done;
> >  
> >  	do {
> > -		done = ct_process_incoming_requests(ct);
> > +		done = ct_process_incoming_requests(ct, &ct->requests.incoming);
> >  	} while (!done);
> >  }
> >  
> > @@ -1078,14 +1078,30 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
> >  	switch (action) {
> >  	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
> >  	case INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> > +	case INTEL_GUC_ACTION_TLB_INVALIDATION_DONE:
> >  		g2h_release_space(ct, request->size);
> >  	}
> > +	/* Handle tlb invalidation response in interrupt context */  
> 
> since it breaks layering, can you add more comments why this is done in
> such way ?
> 
> > +	if (action == INTEL_GUC_ACTION_TLB_INVALIDATION_DONE) {

I'll improve the comment here. I guess something like this would
be enough:

	/*
	 * Handle tlb invalidation response in interrupt context
	 * 
	 * As TLB invalidation is needed to avoid leaking data, wait until
	 * TLB invalidation is completed before returning.
	 */

> > +		const u32 *payload;
> > +		u32 hxg_len, len;
> > +
> > +		hxg_len = request->size - GUC_CTB_MSG_MIN_LEN;
> > +		len = hxg_len - GUC_HXG_MSG_MIN_LEN;
> > +		if (unlikely(len < 1))
> > +			return -EPROTO;
> > +		payload = &hxg[GUC_HXG_MSG_MIN_LEN];  
> 
> if we still need to handle this at this level, can we at least move this
> message decomposition to the handler (in other words: just pass hxg
> pointer instead of single dword payload)

Yeah, makes sense.

> 
> > +		intel_guc_tlb_invalidation_done(ct_to_guc(ct),  payload[0]);
> > +		ct_free_msg(request);
> > +		return 0;
> > +	}
> >  
> >  	spin_lock_irqsave(&ct->requests.lock, flags);
> >  	list_add_tail(&request->link, &ct->requests.incoming);
> >  	spin_unlock_irqrestore(&ct->requests.lock, flags);
> >  
> >  	queue_work(system_unbound_wq, &ct->requests.worker);
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > index b3c9a9327f76..3edf567b3f65 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > @@ -22,6 +22,7 @@
> >  /* Payload length only i.e. don't include G2H header length */
> >  #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	2
> >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		1
> > +#define G2H_LEN_DW_INVALIDATE_TLB		1
> >  
> >  #define GUC_CONTEXT_DISABLE		0
> >  #define GUC_CONTEXT_ENABLE		1
> > @@ -431,4 +432,9 @@ enum intel_guc_recv_message {
> >  	INTEL_GUC_RECV_MSG_EXCEPTION = BIT(30),
> >  };
> >  
> > +#define INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc) \
> > +	((intel_guc_ct_enabled(&(guc)->ct)) && \  

This basically does:
	static inline bool intel_guc_ct_enabled(struct intel_guc_ct *ct)
	{
		return ct->enabled;
	}

> 
> do we need this check ?
> CTB is prerequisite for submission that is required below
> 
> > +	 (intel_guc_submission_is_used(guc)) && \

If I understood the code right, this checks the status machine,
by looking at __intel_uc_fw_status(&guc->fw), but it doesn't look
at ct->enabled. Without knowing exactly how the status is updated, 
is hard to tell if ct enabled flag will be always true here.

So, I would keep the check.

> > +	 (GRAPHICS_VER(guc_to_gt((guc))->i915) >= 12))
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 40f726c61e95..6888ea1bc7c1 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1653,11 +1653,20 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
> >  	intel_context_put(parent);
> >  }
> >  
> > +static void wake_up_tlb_invalidate(struct intel_guc_tlb_wait *wait)
> > +{
> > +	/* Barrier to ensure the store is observed by the woken thread */
> > +	smp_store_mb(wait->status, 0);
> > +	wake_up(&wait->wq);
> > +}
> > +
> >  void intel_guc_submission_reset(struct intel_guc *guc, intel_engine_mask_t stalled)
> >  {
> > +	struct intel_guc_tlb_wait *wait;
> >  	struct intel_context *ce;
> >  	unsigned long index;
> >  	unsigned long flags;
> > +	unsigned long i;
> >  
> >  	if (unlikely(!guc_submission_initialized(guc))) {
> >  		/* Reset called during driver load? GuC not yet initialised! */
> > @@ -1683,6 +1692,13 @@ void intel_guc_submission_reset(struct intel_guc *guc, intel_engine_mask_t stall
> >  
> >  	/* GuC is blown away, drop all references to contexts */
> >  	xa_destroy(&guc->context_lookup);
> > +
> > +	/*
> > +	 * The full GT reset will have cleared the TLB caches and flushed the
> > +	 * G2H message queue; we can release all the blocked waiters.
> > +	 */
> > +	xa_for_each(&guc->tlb_lookup, i, wait)
> > +		wake_up_tlb_invalidate(wait);  
> 
> shouldn't this be closer to intel_guc_invalidate_tlb_guc()
> then we can avoid spreading code across many files
> 
> same for the init/fini_tlb_lookup() functions below

I'll address that on a final patch moving GuC-based TLB patch to a
separate file.

> >  }
> >  
> >  static void guc_cancel_context_requests(struct intel_context *ce)
> > @@ -1805,6 +1821,41 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
> >  static void destroyed_worker_func(struct work_struct *w);
> >  static void reset_fail_worker_func(struct work_struct *w);
> >  
> > +static int init_tlb_lookup(struct intel_guc *guc)
> > +{
> > +	struct intel_guc_tlb_wait *wait;
> > +	int err;
> > +
> > +	xa_init_flags(&guc->tlb_lookup, XA_FLAGS_ALLOC);
> > +
> > +	wait = kzalloc(sizeof(*wait), GFP_KERNEL);
> > +	if (!wait)
> > +		return -ENOMEM;
> > +
> > +	init_waitqueue_head(&wait->wq);
> > +	err = xa_alloc_cyclic_irq(&guc->tlb_lookup, &guc->serial_slot, wait,
> > +				  xa_limit_32b, &guc->next_seqno, GFP_KERNEL);
> > +	if (err == -ENOMEM) {
> > +		kfree(wait);
> > +		return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void fini_tlb_lookup(struct intel_guc *guc)
> > +{
> > +	struct intel_guc_tlb_wait *wait;
> > +
> > +	wait = xa_load(&guc->tlb_lookup, guc->serial_slot);
> > +	if (wait) {
> > +		GEM_BUG_ON(wait->status);
> > +		kfree(wait);
> > +	}
> > +
> > +	xa_destroy(&guc->tlb_lookup);
> > +}
> > +
> >  /*
> >   * Set up the memory resources to be shared with the GuC (via the GGTT)
> >   * at firmware loading time.
> > @@ -1812,20 +1863,31 @@ static void reset_fail_worker_func(struct work_struct *w);
> >  int intel_guc_submission_init(struct intel_guc *guc)
> >  {
> >  	struct intel_gt *gt = guc_to_gt(guc);
> > +	int ret;
> >  
> >  	if (guc->submission_initialized)
> >  		return 0;
> >  
> > +	ret = init_tlb_lookup(guc);  
> 
> if we promote guc_tlb to own file/functions then maybe it could be
> init/fini directly from __uc_init_hw() ?

I'll look on it at the new patch to be added at the end.

> > +	if (ret)
> > +		return ret;
> > +
> >  	guc->submission_state.guc_ids_bitmap =
> >  		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > -	if (!guc->submission_state.guc_ids_bitmap)
> > -		return -ENOMEM;
> > +	if (!guc->submission_state.guc_ids_bitmap) {
> > +		ret = -ENOMEM;
> > +		goto err;
> > +	}
> >  
> >  	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> >  	guc->timestamp.shift = gpm_timestamp_shift(gt);
> >  	guc->submission_initialized = true;
> >  
> >  	return 0;
> > +
> > +err:
> > +	fini_tlb_lookup(guc);
> > +	return ret;
> >  }
> >  
> >  void intel_guc_submission_fini(struct intel_guc *guc)
> > @@ -1836,6 +1898,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> >  	guc_flush_destroyed_contexts(guc);
> >  	i915_sched_engine_put(guc->sched_engine);
> >  	bitmap_free(guc->submission_state.guc_ids_bitmap);
> > +	fini_tlb_lookup(guc);
> >  	guc->submission_initialized = false;
> >  }
> >  
> > @@ -4027,6 +4090,30 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
> >  	return ce;
> >  }
> >  
> > +static void wait_wake_outstanding_tlb_g2h(struct intel_guc *guc, u32 seqno)
> > +{
> > +	struct intel_guc_tlb_wait *wait;
> > +	unsigned long flags;
> > +
> > +	xa_lock_irqsave(&guc->tlb_lookup, flags);
> > +	wait = xa_load(&guc->tlb_lookup, seqno);
> > +
> > +	/* We received a response after the waiting task did exit with a timeout */
> > +	if (unlikely(!wait))
> > +		drm_dbg(&guc_to_gt(guc)->i915->drm,
> > +			"Stale tlb invalidation response with seqno %d\n", seqno);  
> 
> hmm, this sounds like a problem as we shouldn't get any late
> notifications - do we really want to hide it under drm_dbg ?

Agreed. I'll change it to drm_err().

> > +
> > +	if (wait)
> > +		wake_up_tlb_invalidate(wait);
> > +
> > +	xa_unlock_irqrestore(&guc->tlb_lookup, flags);
> > +}
> > +
> > +void intel_guc_tlb_invalidation_done(struct intel_guc *guc, u32 seqno)
> > +{
> > +	wait_wake_outstanding_tlb_g2h(guc, seqno);
> > +}
> > +
> >  int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >  					  const u32 *msg,
> >  					  u32 len)  
> 
> ,Michal
