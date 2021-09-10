Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6640611D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 02:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5336E94F;
	Fri, 10 Sep 2021 00:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8B16E94C;
 Fri, 10 Sep 2021 00:39:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="208059975"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="208059975"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 17:39:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="466833178"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 17:39:12 -0700
Date: Thu, 9 Sep 2021 17:34:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 05/27] drm/i915: Add GT PM unpark worker
Message-ID: <20210910003411.GA23380@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-6-matthew.brost@intel.com>
 <3d07a1aa-811b-2862-40e7-3556ce8588b6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d07a1aa-811b-2862-40e7-3556ce8588b6@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 09, 2021 at 03:36:44PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Sometimes it is desirable to queue work up for later if the GT PM isn't
> > held and run that work on next GT PM unpark.
> What is the reason for doing this? Why is it important? Why not just take
> the GT PM at the time the work is requested?
>

This was suggestion from a long time back, don't take GT PM (waking the
GPU) if is is idle. I believe Daniele suggested this a couple years ago
/ we still have this FIXME comment in DII.
 
> > 
> > Implemented with a list in the GT of all pending work, workqueues in
> > the list, a callback to add a workqueue to the list, and finally a
> > wakeref post_get callback that iterates / drains the list + queues the
> > workqueues.
> > 
> > First user of this is deregistration of GuC contexts.
> This statement should be in the first paragraph but needs to be more
> detailed - why is it necessary to add all this extra complexity rather than
> just taking the GT PM?
> 
>

This is just an optimization - don't take the GT PM when deregistering a
context if the GT is idle. If you think it is too complex we can can
delete this but IMO it really isn't any more complex than the previous
patch as either way we need a list + worker. Also once we have this
framework in place we might be able to find other users of this.
 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/Makefile                 |  1 +
> >   drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++
> >   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  8 ++++
> >   .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.c | 35 ++++++++++++++++
> >   .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.h | 40 +++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_gt_types.h      | 10 +++++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  8 ++--
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++--
> >   drivers/gpu/drm/i915/intel_wakeref.c          |  5 +++
> >   drivers/gpu/drm/i915/intel_wakeref.h          |  1 +
> >   10 files changed, 119 insertions(+), 7 deletions(-)
> >   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
> >   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
> > 
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index 642a5b5a1b81..579bdc069f25 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -103,6 +103,7 @@ gt-y += \
> >   	gt/intel_gt_clock_utils.o \
> >   	gt/intel_gt_irq.o \
> >   	gt/intel_gt_pm.o \
> > +	gt/intel_gt_pm_unpark_work.o \
> >   	gt/intel_gt_pm_irq.o \
> >   	gt/intel_gt_requests.o \
> >   	gt/intel_gtt.o \
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index 62d40c986642..7e690e74baa2 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -29,6 +29,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> >   	spin_lock_init(&gt->irq_lock);
> > +	spin_lock_init(&gt->pm_unpark_work_lock);
> > +	INIT_LIST_HEAD(&gt->pm_unpark_work_list);
> > +
> >   	INIT_LIST_HEAD(&gt->closed_vma);
> >   	spin_lock_init(&gt->closed_lock);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index dea8e2479897..564c11a3748b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -90,6 +90,13 @@ static int __gt_unpark(struct intel_wakeref *wf)
> >   	return 0;
> >   }
> > +static void __gt_unpark_work_queue(struct intel_wakeref *wf)
> > +{
> > +	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
> > +
> > +	intel_gt_pm_unpark_work_queue(gt);
> > +}
> > +
> >   static int __gt_park(struct intel_wakeref *wf)
> >   {
> >   	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
> > @@ -118,6 +125,7 @@ static int __gt_park(struct intel_wakeref *wf)
> >   static const struct intel_wakeref_ops wf_ops = {
> >   	.get = __gt_unpark,
> > +	.post_get = __gt_unpark_work_queue,
> >   	.put = __gt_park,
> >   };
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
> > new file mode 100644
> > index 000000000000..23162dbd0c35
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
> > @@ -0,0 +1,35 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2021 Intel Corporation
> > + */
> > +
> > +#include "i915_drv.h"
> > +#include "intel_runtime_pm.h"
> > +#include "intel_gt_pm.h"
> > +
> > +void intel_gt_pm_unpark_work_queue(struct intel_gt *gt)
> > +{
> > +	struct intel_gt_pm_unpark_work *work, *next;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gt->pm_unpark_work_lock, flags);
> > +	list_for_each_entry_safe(work, next,
> > +				 &gt->pm_unpark_work_list, link) {
> > +		list_del_init(&work->link);
> > +		queue_work(system_unbound_wq, &work->worker);
> > +	}
> > +	spin_unlock_irqrestore(&gt->pm_unpark_work_lock, flags);
> > +}
> > +
> > +void intel_gt_pm_unpark_work_add(struct intel_gt *gt,
> > +				 struct intel_gt_pm_unpark_work *work)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gt->pm_unpark_work_lock, flags);
> > +	if (intel_gt_pm_is_awake(gt))
> > +		queue_work(system_unbound_wq, &work->worker);
> > +	else if (list_empty(&work->link))
> > +		list_add_tail(&work->link, &gt->pm_unpark_work_list);
> > +	spin_unlock_irqrestore(&gt->pm_unpark_work_lock, flags);
> > +}
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
> > new file mode 100644
> > index 000000000000..eaf1dc313aa2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2021 Intel Corporation
> > + */
> > +
> > +#ifndef INTEL_GT_PM_UNPARK_WORK_H
> > +#define INTEL_GT_PM_UNPARK_WORK_H
> > +
> > +#include <linux/list.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct intel_gt;
> > +
> > +/**
> > + * struct intel_gt_pm_unpark_work - work to be scheduled when GT unparked
> > + */
> > +struct intel_gt_pm_unpark_work {
> > +	/**
> > +	 * @link: link into gt->pm_unpark_work_list of workers that need to be
> > +	 * scheduled when GT is unpark, protected by gt->pm_unpark_work_lock
> > +	 */
> > +	struct list_head link;
> > +	/** @worker: will be scheduled when GT unparked */
> > +	struct work_struct worker;
> > +};
> > +
> > +void intel_gt_pm_unpark_work_queue(struct intel_gt *gt);
> > +
> > +void intel_gt_pm_unpark_work_add(struct intel_gt *gt,
> > +				 struct intel_gt_pm_unpark_work *work);
> > +
> > +static inline void
> > +intel_gt_pm_unpark_work_init(struct intel_gt_pm_unpark_work *work,
> > +			     work_func_t fn)
> > +{
> > +	INIT_LIST_HEAD(&work->link);
> > +	INIT_WORK(&work->worker, fn);
> > +}
> > +
> > +#endif /* INTEL_GT_PM_UNPARK_WORK_H */
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > index a81e21bf1bd1..4480312f0add 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > @@ -96,6 +96,16 @@ struct intel_gt {
> >   	struct intel_wakeref wakeref;
> >   	atomic_t user_wakeref;
> > +	/**
> > +	 * @pm_unpark_work_list: list of delayed work to scheduled which GT is
> > +	 * unparked, protected by pm_unpark_work_lock
> > +	 */
> > +	struct list_head pm_unpark_work_list;
> > +	/**
> > +	 * @pm_unpark_work_lock: protects pm_unpark_work_list
> > +	 */
> > +	spinlock_t pm_unpark_work_lock;
> > +
> >   	struct list_head closed_vma;
> >   	spinlock_t closed_lock; /* guards the list of closed_vma */
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 7358883f1540..023953e77553 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -19,6 +19,7 @@
> >   #include "intel_uc_fw.h"
> >   #include "i915_utils.h"
> >   #include "i915_vma.h"
> > +#include "gt/intel_gt_pm_unpark_work.h"
> >   struct __guc_ads_blob;
> > @@ -78,11 +79,12 @@ struct intel_guc {
> >   		 */
> >   		struct list_head destroyed_contexts;
> >   		/**
> > -		 * @destroyed_worker: worker to deregister contexts, need as we
> > +		 * @destroyed_worker: Worker to deregister contexts, need as we
> >   		 * need to take a GT PM reference and can't from destroy
> > -		 * function as it might be in an atomic context (no sleeping)
> > +		 * function as it might be in an atomic context (no sleeping).
> These corrections should be squashed into the previous patch that added
> these comments in the first place.
> 

Yep.

Matt

> John.
> 
> 
> > +		 * Worker only issues deregister when GT is unparked.
> >   		 */
> > -		struct work_struct destroyed_worker;
> > +		struct intel_gt_pm_unpark_work destroyed_worker;
> >   	} submission_state;
> >   	bool submission_supported;
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index f835e06e5f9f..dbf919801de2 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1135,7 +1135,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> >   	ida_init(&guc->submission_state.guc_ids);
> >   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> > -	INIT_WORK(&guc->submission_state.destroyed_worker, destroyed_worker_func);
> > +	intel_gt_pm_unpark_work_init(&guc->submission_state.destroyed_worker,
> > +				     destroyed_worker_func);
> >   	return 0;
> >   }
> > @@ -1942,13 +1943,18 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
> >   static void destroyed_worker_func(struct work_struct *w)
> >   {
> > -	struct intel_guc *guc = container_of(w, struct intel_guc,
> > +	struct intel_gt_pm_unpark_work *destroyed_worker =
> > +		container_of(w, struct intel_gt_pm_unpark_work, worker);
> > +	struct intel_guc *guc = container_of(destroyed_worker, struct intel_guc,
> >   					     submission_state.destroyed_worker);
> >   	struct intel_gt *gt = guc_to_gt(guc);
> >   	int tmp;
> > -	with_intel_gt_pm(gt, tmp)
> > +	with_intel_gt_pm_if_awake(gt, tmp)
> >   		deregister_destroyed_contexts(guc);
> > +
> > +	if (!list_empty(&guc->submission_state.destroyed_contexts))
> > +		intel_gt_pm_unpark_work_add(gt, destroyed_worker);
> >   }
> >   static void guc_context_destroy(struct kref *kref)
> > @@ -1985,7 +1991,8 @@ static void guc_context_destroy(struct kref *kref)
> >   	 * take the GT PM for the first time which isn't allowed from an atomic
> >   	 * context.
> >   	 */
> > -	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
> > +	intel_gt_pm_unpark_work_add(guc_to_gt(guc),
> > +				    &guc->submission_state.destroyed_worker);
> >   }
> >   static int guc_context_alloc(struct intel_context *ce)
> > diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
> > index dfd87d082218..282fc4f312e3 100644
> > --- a/drivers/gpu/drm/i915/intel_wakeref.c
> > +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> > @@ -24,6 +24,8 @@ static void rpm_put(struct intel_wakeref *wf)
> >   int __intel_wakeref_get_first(struct intel_wakeref *wf)
> >   {
> > +	bool do_post = false;
> > +
> >   	/*
> >   	 * Treat get/put as different subclasses, as we may need to run
> >   	 * the put callback from under the shrinker and do not want to
> > @@ -44,8 +46,11 @@ int __intel_wakeref_get_first(struct intel_wakeref *wf)
> >   		}
> >   		smp_mb__before_atomic(); /* release wf->count */
> > +		do_post = true;
> >   	}
> >   	atomic_inc(&wf->count);
> > +	if (do_post && wf->ops->post_get)
> > +		wf->ops->post_get(wf);
> >   	mutex_unlock(&wf->mutex);
> >   	INTEL_WAKEREF_BUG_ON(atomic_read(&wf->count) <= 0);
> > diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> > index 545c8f277c46..ef7e6a698e8a 100644
> > --- a/drivers/gpu/drm/i915/intel_wakeref.h
> > +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> > @@ -30,6 +30,7 @@ typedef depot_stack_handle_t intel_wakeref_t;
> >   struct intel_wakeref_ops {
> >   	int (*get)(struct intel_wakeref *wf);
> > +	void (*post_get)(struct intel_wakeref *wf);
> >   	int (*put)(struct intel_wakeref *wf);
> >   };
> 
