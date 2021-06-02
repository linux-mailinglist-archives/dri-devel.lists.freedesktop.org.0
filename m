Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE76398A98
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 15:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AF56EC9F;
	Wed,  2 Jun 2021 13:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83536EC9C;
 Wed,  2 Jun 2021 13:31:39 +0000 (UTC)
IronPort-SDR: 0YkXxb94CmC1JwrkIay/JIV6CWPhtGgQchkFXBmiJIpF11N4CnsJ0Fu2GNpIYYkE28hLmNWFUk
 2j44sYQj2phQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="201927149"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="201927149"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 06:31:38 -0700
IronPort-SDR: oapPiT93yJC4wKfaPEp/mgfDUo1PUiNCh6zBrkZFsJHlQCzinouysoJ14w3ssfl1gJnW23cnix
 dpzAYZLg6KRg==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="447406074"
Received: from tstaplex-mobl1.ger.corp.intel.com (HELO [10.213.195.193])
 ([10.213.195.193])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 06:31:37 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 63/97] drm/i915/guc: Direct all
 breadcrumbs for a class to single breadcrumbs
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-64-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <350db416-4742-8427-9572-1384ad487670@linux.intel.com>
Date: Wed, 2 Jun 2021 14:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-64-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/05/2021 20:14, Matthew Brost wrote:
> With GuC virtual engines the physical engine which a request executes
> and completes on isn't known to the i915. Therefore we can't attach a
> request to a physical engines breadcrumbs. To work around this we create
> a single breadcrumbs per engine class when using GuC submission and
> direct all physical engine interrupts to this breadcrumbs.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> CC: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   | 41 +++++-------
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   | 14 +++-
>   .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |  7 ++
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  3 +
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 28 +++++++-
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 -
>   .../drm/i915/gt/intel_execlists_submission.c  |  4 +-
>   drivers/gpu/drm/i915/gt/mock_engine.c         |  4 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 67 +++++++++++++++++--
>   9 files changed, 133 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index 38cc42783dfb..2007dc6f6b99 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -15,28 +15,14 @@
>   #include "intel_gt_pm.h"
>   #include "intel_gt_requests.h"
>   
> -static bool irq_enable(struct intel_engine_cs *engine)
> +static bool irq_enable(struct intel_breadcrumbs *b)
>   {
> -	if (!engine->irq_enable)
> -		return false;
> -
> -	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> -	engine->irq_enable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> -
> -	return true;
> +	return intel_engine_irq_enable(b->irq_engine);
>   }
>   
> -static void irq_disable(struct intel_engine_cs *engine)
> +static void irq_disable(struct intel_breadcrumbs *b)
>   {
> -	if (!engine->irq_disable)
> -		return;
> -
> -	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> -	engine->irq_disable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> +	intel_engine_irq_disable(b->irq_engine);
>   }
>   
>   static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
> @@ -57,7 +43,7 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
>   	WRITE_ONCE(b->irq_armed, true);
>   
>   	/* Requests may have completed before we could enable the interrupt. */
> -	if (!b->irq_enabled++ && irq_enable(b->irq_engine))
> +	if (!b->irq_enabled++ && b->irq_enable(b))
>   		irq_work_queue(&b->irq_work);
>   }
>   
> @@ -76,7 +62,7 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
>   {
>   	GEM_BUG_ON(!b->irq_enabled);
>   	if (!--b->irq_enabled)
> -		irq_disable(b->irq_engine);
> +		b->irq_disable(b);
>   
>   	WRITE_ONCE(b->irq_armed, false);
>   	intel_gt_pm_put_async(b->irq_engine->gt);
> @@ -281,7 +267,7 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
>   	if (!b)
>   		return NULL;
>   
> -	b->irq_engine = irq_engine;
> +	kref_init(&b->ref);
>   
>   	spin_lock_init(&b->signalers_lock);
>   	INIT_LIST_HEAD(&b->signalers);
> @@ -290,6 +276,10 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
>   	spin_lock_init(&b->irq_lock);
>   	init_irq_work(&b->irq_work, signal_irq_work);
>   
> +	b->irq_engine = irq_engine;
> +	b->irq_enable = irq_enable;
> +	b->irq_disable = irq_disable;
> +
>   	return b;
>   }
>   
> @@ -303,9 +293,9 @@ void intel_breadcrumbs_reset(struct intel_breadcrumbs *b)
>   	spin_lock_irqsave(&b->irq_lock, flags);
>   
>   	if (b->irq_enabled)
> -		irq_enable(b->irq_engine);
> +		b->irq_enable(b);
>   	else
> -		irq_disable(b->irq_engine);
> +		b->irq_disable(b);
>   
>   	spin_unlock_irqrestore(&b->irq_lock, flags);
>   }
> @@ -325,11 +315,14 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs *b)
>   	}
>   }
>   
> -void intel_breadcrumbs_free(struct intel_breadcrumbs *b)
> +void intel_breadcrumbs_free(struct kref *kref)
>   {
> +	struct intel_breadcrumbs *b = container_of(kref, typeof(*b), ref);
> +
>   	irq_work_sync(&b->irq_work);
>   	GEM_BUG_ON(!list_empty(&b->signalers));
>   	GEM_BUG_ON(b->irq_armed);
> +
>   	kfree(b);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
> index 3ce5ce270b04..72105b74663d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
> @@ -17,7 +17,7 @@ struct intel_breadcrumbs;
>   
>   struct intel_breadcrumbs *
>   intel_breadcrumbs_create(struct intel_engine_cs *irq_engine);
> -void intel_breadcrumbs_free(struct intel_breadcrumbs *b);
> +void intel_breadcrumbs_free(struct kref *kref);
>   
>   void intel_breadcrumbs_reset(struct intel_breadcrumbs *b);
>   void __intel_breadcrumbs_park(struct intel_breadcrumbs *b);
> @@ -48,4 +48,16 @@ void i915_request_cancel_breadcrumb(struct i915_request *request);
>   void intel_context_remove_breadcrumbs(struct intel_context *ce,
>   				      struct intel_breadcrumbs *b);
>   
> +static inline struct intel_breadcrumbs *
> +intel_breadcrumbs_get(struct intel_breadcrumbs *b)
> +{
> +	kref_get(&b->ref);
> +	return b;
> +}
> +
> +static inline void intel_breadcrumbs_put(struct intel_breadcrumbs *b)
> +{
> +	kref_put(&b->ref, intel_breadcrumbs_free);
> +}
> +
>   #endif /* __INTEL_BREADCRUMBS__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> index 3a084ce8ff5e..a4e146684be8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> @@ -7,10 +7,13 @@
>   #define __INTEL_BREADCRUMBS_TYPES__
>   
>   #include <linux/irq_work.h>
> +#include <linux/kref.h>
>   #include <linux/list.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
>   
> +typedef u8 intel_engine_mask_t;

Why not include engine types? Engine mask so belongs there and I 
wouldn't move it. Especially since over there otherwise a "dangling" 
#define ALL_ENGINES ((intel_engine_mask_t)~0ul) remains.

> +
>   /*
>    * Rather than have every client wait upon all user interrupts,
>    * with the herd waking after every interrupt and each doing the
> @@ -29,6 +32,7 @@
>    * the overhead of waking that client is much preferred.
>    */
>   struct intel_breadcrumbs {
> +	struct kref ref;
>   	atomic_t active;
>   
>   	spinlock_t signalers_lock; /* protects the list of signalers */
> @@ -42,7 +46,10 @@ struct intel_breadcrumbs {
>   	bool irq_armed;
>   
>   	/* Not all breadcrumbs are attached to physical HW */
> +	intel_engine_mask_t	engine_mask;
>   	struct intel_engine_cs *irq_engine;
> +	bool	(*irq_enable)(struct intel_breadcrumbs *b);
> +	void	(*irq_disable)(struct intel_breadcrumbs *b);
>   };
>   
>   #endif /* __INTEL_BREADCRUMBS_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 3cd09381b6f8..3321d0917a99 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -209,6 +209,9 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
>   
>   void intel_engine_init_execlists(struct intel_engine_cs *engine);
>   
> +bool intel_engine_irq_enable(struct intel_engine_cs *engine);
> +void intel_engine_irq_disable(struct intel_engine_cs *engine);
> +
>   static inline void __intel_engine_reset(struct intel_engine_cs *engine,
>   					bool stalled)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 903f72f0953a..10300db1c9a6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -765,7 +765,7 @@ static int engine_setup_common(struct intel_engine_cs *engine)
>   err_cmd_parser:
>   	i915_sched_engine_put(engine->sched_engine);
>   err_sched_engine:
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   err_status:
>   	cleanup_status_page(engine);
>   	return err;
> @@ -965,7 +965,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
>   {
>   	GEM_BUG_ON(!list_empty(&engine->sched_engine->requests));
>   
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   	i915_sched_engine_put(engine->sched_engine);
>   
>   	intel_engine_fini_retire(engine);
> @@ -1320,6 +1320,30 @@ bool intel_engines_are_idle(struct intel_gt *gt)
>   	return true;
>   }
>   
> +bool intel_engine_irq_enable(struct intel_engine_cs *engine)
> +{
> +	if (!engine->irq_enable)
> +		return false;
> +
> +	/* Caller disables interrupts */
> +	spin_lock(&engine->gt->irq_lock);
> +	engine->irq_enable(engine);
> +	spin_unlock(&engine->gt->irq_lock);
> +
> +	return true;
> +}
> +
> +void intel_engine_irq_disable(struct intel_engine_cs *engine)
> +{
> +	if (!engine->irq_disable)
> +		return;
> +
> +	/* Caller disables interrupts */
> +	spin_lock(&engine->gt->irq_lock);
> +	engine->irq_disable(engine);
> +	spin_unlock(&engine->gt->irq_lock);
> +}
> +
>   void intel_engines_reset_default_submission(struct intel_gt *gt)
>   {
>   	struct intel_engine_cs *engine;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index e2b5cda6dbc4..f7b6eed586ce 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -64,7 +64,6 @@ struct intel_gt;
>   struct intel_ring;
>   struct intel_uncore;
>   
> -typedef u8 intel_engine_mask_t;
>   #define ALL_ENGINES ((intel_engine_mask_t)~0ul)
>   
>   struct intel_hw_status_page {
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 02880ea5d693..396b1356ea3e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3418,9 +3418,11 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
>   	lrc_fini(&ve->context);
>   	intel_context_fini(&ve->context);
>   
> -	intel_breadcrumbs_free(ve->base.breadcrumbs);
> +	if (ve->base.breadcrumbs)
> +		intel_breadcrumbs_put(ve->base.breadcrumbs);
>   	if (ve->base.sched_engine)
>   		i915_sched_engine_put(ve->base.sched_engine);
> +
>   	intel_engine_free_request_pool(&ve->base);
>   
>   	kfree(ve->bonds);
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 97b10fd60b55..4d023b5cd5da 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -284,7 +284,7 @@ static void mock_engine_release(struct intel_engine_cs *engine)
>   	GEM_BUG_ON(timer_pending(&mock->hw_delay));
>   
>   	i915_sched_engine_put(engine->sched_engine);
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   
>   	intel_context_unpin(engine->kernel_context);
>   	intel_context_put(engine->kernel_context);
> @@ -376,7 +376,7 @@ int mock_engine_init(struct intel_engine_cs *engine)
>   	return 0;
>   
>   err_breadcrumbs:
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   err_schedule:
>   	i915_sched_engine_put(engine->sched_engine);
>   	return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f0e5731bcef6..80b89171b35a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1077,6 +1077,9 @@ static void __guc_context_destroy(struct intel_context *ce)
>   		struct guc_virtual_engine *ve =
>   			container_of(ce, typeof(*ve), context);
>   
> +		if (ve->base.breadcrumbs)
> +			intel_breadcrumbs_put(ve->base.breadcrumbs);
> +
>   		kfree(ve);
>   	} else {
>   		intel_context_free(ce);
> @@ -1381,6 +1384,62 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> +static bool
> +guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
> +{
> +	struct intel_engine_cs *sibling;
> +	intel_engine_mask_t tmp, mask = b->engine_mask;
> +	bool result = false;
> +
> +	for_each_engine_masked(sibling, b->irq_engine->gt, mask, tmp)
> +		result |= intel_engine_irq_enable(sibling);
> +
> +	return result;
> +}
> +
> +static void
> +guc_irq_disable_breadcrumbs(struct intel_breadcrumbs *b)
> +{
> +	struct intel_engine_cs *sibling;
> +	intel_engine_mask_t tmp, mask = b->engine_mask;
> +
> +	for_each_engine_masked(sibling, b->irq_engine->gt, mask, tmp)
> +		intel_engine_irq_disable(sibling);
> +}
> +
> +static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
> +{
> +	int i;
> +
> +       /*
> +        * In GuC submission mode we do not know which physical engine a request
> +        * will be scheduled on, this creates a problem because the breadcrumb
> +        * interrupt is per physical engine. To work around this we attach
> +        * requests and direct all breadcrumb interrupts to the first instance
> +        * of an engine per class. In addition all breadcrumb interrupts are
> +	* enaled / disabled across an engine class in unison.

enabled

So the problem statement only applies to virtual engines but this code 
runs for physical engines as well..

> +        */
> +	for (i = 0; i < MAX_ENGINE_INSTANCE; ++i) {
> +		struct intel_engine_cs *sibling =
> +			engine->gt->engine_class[engine->class][i];
> +
> +		if (sibling) {
> +			if (engine->breadcrumbs != sibling->breadcrumbs) {
> +				intel_breadcrumbs_put(engine->breadcrumbs);
> +				engine->breadcrumbs =
> +					intel_breadcrumbs_get(sibling->breadcrumbs);
> +			}

...and it frees the breadcrumb instances previously created, replacing 
it with..

> +			break;
> +		}
> +	}
> +
> +	if (engine->breadcrumbs) {
> +		engine->breadcrumbs->engine_mask |= engine->mask;
> +		engine->breadcrumbs->irq_enable = guc_irq_enable_breadcrumbs;
> +		engine->breadcrumbs->irq_disable = guc_irq_disable_breadcrumbs;
> +	}

...patched up version of the breadcrumbs from the first engine instance?

It's too kludgy in my view. Rather than create and then destroy + patch 
up, setup code should just do the right thing from the start.

This means if the design is breadcrumbs tree per class, have that 
created and stored somehwere under gt.guc and then just kref assign if 
guc is in use instead of creating direct per engine breadcrumbs and then 
destroying them.

On a related note, it's unfortunate how the very thing which should off 
load from the CPU is actually creating more work for the CPU in several 
areas (breadcrumbs, engine serial, CT busy looping, probably more. ...). 
And we have no idea if and when will it come up overall better.

But yeah, I don't have any ideas on how to do it better on the high 
level. Clearly interrupts need to be enabled for all engines virtuals 
are composed off, and clearly there needs to be a single tree of all 
those so code can find them.

Actually, this approach doesn't work for mixed class virtual engines 
which were considered at one point. Oh well.. pain for another day.

Regards,

Tvrtko

> +}
> +
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>   {
>   	struct intel_timeline *tl;
> @@ -1604,6 +1663,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   
>   	guc_default_vfuncs(engine);
>   	guc_default_irqs(engine);
> +	guc_init_breadcrumbs(engine);
>   
>   	if (engine->class == RENDER_CLASS)
>   		rcs_submission_override(engine);
> @@ -1846,11 +1906,6 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
>   	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
>   	ve->base.saturated = ALL_ENGINES;
> -	ve->base.breadcrumbs = intel_breadcrumbs_create(&ve->base);
> -	if (!ve->base.breadcrumbs) {
> -		kfree(ve);
> -		return ERR_PTR(-ENOMEM);
> -	}
>   
>   	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
>   
> @@ -1899,6 +1954,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   				sibling->emit_fini_breadcrumb;
>   			ve->base.emit_fini_breadcrumb_dw =
>   				sibling->emit_fini_breadcrumb_dw;
> +			ve->base.breadcrumbs =
> +				intel_breadcrumbs_get(sibling->breadcrumbs);
>   
>   			ve->base.flags |= sibling->flags;
>   
> 
