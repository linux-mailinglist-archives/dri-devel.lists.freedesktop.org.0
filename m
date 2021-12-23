Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952747E780
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 19:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E736A10E3A7;
	Thu, 23 Dec 2021 18:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1740910E3A5;
 Thu, 23 Dec 2021 18:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640283061; x=1671819061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r+0BJy3hmJCVGsUoJfg/zdXZ8vtu+Eoo5NuvTsZQwbc=;
 b=mQX53RnzqF5BnGIXA1xTrpbHu12Z8zOnEkcxSt/fel/8/2wsmY+O8idM
 Mv1G6iDMEDNJqfldtcSJTIxk+RYEq6hTcUmPEbAGrKGpFm6r3UlBem6Lw
 seMHcYgfvfLixTXekwZpPY7efxsfIV3Q9HNAqPILa/W98ETB1zhsTLm+6
 k79WiG6yhk5Z9KCljwTYQzcCV6QyXblwdYSV16CbhDNgBCrYddAiMQd90
 iynozPRpU/cqBgOqnkIKQsbgR6iTzrfBx5MPKFQ6MxoV03KkNUfDvsN9N
 n6TS7jdi6xaOm3HJrwQsl5tPHtVfVSDspfNfecD511TxcJ/by4BRr0/Gi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="238401245"
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="238401245"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 10:10:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="617559331"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 10:10:59 -0800
Date: Thu, 23 Dec 2021 10:05:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Use lockless list for
 destroyed contexts
Message-ID: <20211223180508.GA3441@jons-linux-dev-box>
References: <20211222232907.12735-1-matthew.brost@intel.com>
 <10c729bc-d792-65f7-c136-b3de702717f9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10c729bc-d792-65f7-c136-b3de702717f9@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 23, 2021 at 10:01:42AM +0000, Tvrtko Ursulin wrote:
> 
> On 22/12/2021 23:29, Matthew Brost wrote:
> > Use a lockless list structure for destroyed contexts to avoid hammering
> > on global submission spin lock.
> 
> Thanks for looking into it quickly!
> 
> On the topic of "lockless" yes I agree the llist in principle is not a
> concern. That part looks fine to me. On the actual "integration" (how it
> slots in) with the GuC code I leave one comment below.
> 

Agree.

> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c       |  2 -
> >   drivers/gpu/drm/i915/gt/intel_context_types.h |  3 +-
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +-
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 44 +++++--------------
> >   4 files changed, 16 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 5d0ec7c49b6a..4aacb4b0418d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -403,8 +403,6 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >   	ce->guc_id.id = GUC_INVALID_LRC_ID;
> >   	INIT_LIST_HEAD(&ce->guc_id.link);
> > -	INIT_LIST_HEAD(&ce->destroyed_link);
> > -
> >   	INIT_LIST_HEAD(&ce->parallel.child_list);
> >   	/*
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 30cd81ad8911..4532d43ec9c0 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -9,6 +9,7 @@
> >   #include <linux/average.h>
> >   #include <linux/kref.h>
> >   #include <linux/list.h>
> > +#include <linux/llist.h>
> >   #include <linux/mutex.h>
> >   #include <linux/types.h>
> > @@ -224,7 +225,7 @@ struct intel_context {
> >   	 * list when context is pending to be destroyed (deregistered with the
> >   	 * GuC), protected by guc->submission_state.lock
> >   	 */
> > -	struct list_head destroyed_link;
> > +	struct llist_node destroyed_link;
> >   	/** @parallel: sub-structure for parallel submission members */
> >   	struct {
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index f9240d4baa69..705085058411 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -8,6 +8,7 @@
> >   #include <linux/xarray.h>
> >   #include <linux/delay.h>
> > +#include <linux/llist.h>
> >   #include "intel_uncore.h"
> >   #include "intel_guc_fw.h"
> > @@ -112,7 +113,7 @@ struct intel_guc {
> >   		 * @destroyed_contexts: list of contexts waiting to be destroyed
> >   		 * (deregistered with the GuC)
> >   		 */
> > -		struct list_head destroyed_contexts;
> > +		struct llist_head destroyed_contexts;
> >   		/**
> >   		 * @destroyed_worker: worker to deregister contexts, need as we
> >   		 * need to take a GT PM reference and can't from destroy
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 0a03a30e4c6d..6f7643edc139 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1771,7 +1771,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   	spin_lock_init(&guc->submission_state.lock);
> >   	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> >   	ida_init(&guc->submission_state.guc_ids);
> > -	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> > +	init_llist_head(&guc->submission_state.destroyed_contexts);
> >   	INIT_WORK(&guc->submission_state.destroyed_worker,
> >   		  destroyed_worker_func);
> > @@ -2696,26 +2696,18 @@ static void __guc_context_destroy(struct intel_context *ce)
> >   	}
> >   }
> > +#define take_destroyed_contexts(guc) \
> > +	llist_del_all(&guc->submission_state.destroyed_contexts)
> > +
> >   static void guc_flush_destroyed_contexts(struct intel_guc *guc)
> >   {
> > -	struct intel_context *ce;
> > -	unsigned long flags;
> > +	struct intel_context *ce, *cn;
> >   	GEM_BUG_ON(!submission_disabled(guc) &&
> >   		   guc_submission_initialized(guc));
> > -	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> > -		spin_lock_irqsave(&guc->submission_state.lock, flags);
> > -		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> > -					      struct intel_context,
> > -					      destroyed_link);
> > -		if (ce)
> > -			list_del_init(&ce->destroyed_link);
> > -		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > -
> > -		if (!ce)
> > -			break;
> > -
> > +	llist_for_each_entry_safe(ce, cn, take_destroyed_contexts(guc),
> > +				 destroyed_link) {
> >   		release_guc_id(guc, ce);
> >   		__guc_context_destroy(ce);
> >   	}
> > @@ -2723,23 +2715,11 @@ static void guc_flush_destroyed_contexts(struct intel_guc *guc)
> >   static void deregister_destroyed_contexts(struct intel_guc *guc)
> >   {
> > -	struct intel_context *ce;
> > -	unsigned long flags;
> > -
> > -	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> > -		spin_lock_irqsave(&guc->submission_state.lock, flags);
> > -		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> > -					      struct intel_context,
> > -					      destroyed_link);
> > -		if (ce)
> > -			list_del_init(&ce->destroyed_link);
> > -		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > -
> > -		if (!ce)
> > -			break;
> > +	struct intel_context *ce, *cn;
> > +	llist_for_each_entry_safe(ce, cn, take_destroyed_contexts(guc),
> > +				 destroyed_link)
> >   		guc_lrc_desc_unpin(ce);
> > -	}
> >   }
> >   static void destroyed_worker_func(struct work_struct *w)
> > @@ -2771,8 +2751,8 @@ static void guc_context_destroy(struct kref *kref)
> >   	if (likely(!destroy)) {
> >   		if (!list_empty(&ce->guc_id.link))
> >   			list_del_init(&ce->guc_id.link);
> > -		list_add_tail(&ce->destroyed_link,
> > -			      &guc->submission_state.destroyed_contexts);
> > +		llist_add(&ce->destroyed_link,
> > +			  &guc->submission_state.destroyed_contexts);
> 
> So here presumably submission lock is still needed for unlinking the from
> guc_id list.
> 

Yes, the submission lock also protects the guc_id list.

According to the llist DoC the llist_add could be outside a lock
(multiple producers can safely call llist_add simultaneously but it is
also harmless to call within a lock.

> Mechanical flows of the patch looks good to me, but I leave to you and John
> to decide on llist vs keeping the existing doubly linked list. I mean
> agreeing what fits better with the existing locking and data structure
> design.
> 

Sounds good.

Matt

> Regards,
> 
> Tvrtko
> 
> >   	} else {
> >   		__release_guc_id(guc, ce);
> >   	}
> > 
