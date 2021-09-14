Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED840A272
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 03:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8C66E314;
	Tue, 14 Sep 2021 01:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753156E314;
 Tue, 14 Sep 2021 01:23:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="201347836"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="201347836"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 18:23:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="551982877"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 18:23:39 -0700
Date: Mon, 13 Sep 2021 18:18:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 10/27] drm/i915/guc: Introduce context
 parent-child relationship
Message-ID: <20210914011839.GA16298@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-11-matthew.brost@intel.com>
 <721d6ceb-eb16-a2dd-fa9f-517a3e389167@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <721d6ceb-eb16-a2dd-fa9f-517a3e389167@intel.com>
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

On Mon, Sep 13, 2021 at 04:19:00PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Introduce context parent-child relationship. Once this relationship is
> > created all pinning / unpinning operations are directed to the parent
> > context. The parent context is responsible for pinning all of its'
> > children and itself.
> > 
> > This is a precursor to the full GuC multi-lrc implementation but aligns
> > to how GuC mutli-lrc interface is defined - a single H2G is used
> > register / deregister all of the contexts simultaneously.
> > 
> > Subsequent patches in the series will implement the pinning / unpinning
> > operations for parent / child contexts.
> > 
> > v2:
> >   (Daniel Vetter)
> >    - Add kernel doc, add wrapper to access parent to ensure safety
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c       | 29 ++++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_context.h       | 39 +++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_context_types.h | 23 +++++++++++
> >   3 files changed, 91 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 508cfe5770c0..00d1aee6d199 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -404,6 +404,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >   	INIT_LIST_HEAD(&ce->destroyed_link);
> No need for this blank line?
> 

I guess but typically I try to put blank lines between each different
set of variables (e.g. a lock and list would next to each other if the
lock protects the list, two different lists would have a blank line like
this case here). 

> > +	INIT_LIST_HEAD(&ce->guc_child_list);
> > +
> >   	/*
> >   	 * Initialize fence to be complete as this is expected to be complete
> >   	 * unless there is a pending schedule disable outstanding.
> > @@ -418,10 +420,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >   void intel_context_fini(struct intel_context *ce)
> >   {
> > +	struct intel_context *child, *next;
> > +
> >   	if (ce->timeline)
> >   		intel_timeline_put(ce->timeline);
> >   	i915_vm_put(ce->vm);
> > +	/* Need to put the creation ref for the children */
> > +	if (intel_context_is_parent(ce))
> > +		for_each_child_safe(ce, child, next)
> > +			intel_context_put(child);
> > +
> >   	mutex_destroy(&ce->pin_mutex);
> >   	i915_active_fini(&ce->active);
> >   }
> > @@ -537,6 +546,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> >   	return active;
> >   }
> > +void intel_context_bind_parent_child(struct intel_context *parent,
> > +				     struct intel_context *child)
> > +{
> > +	/*
> > +	 * Callers responsibility to validate that this function is used
> > +	 * correctly but we use GEM_BUG_ON here ensure that they do.
> > +	 */
> > +	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
> > +	GEM_BUG_ON(intel_context_is_pinned(parent));
> > +	GEM_BUG_ON(intel_context_is_child(parent));
> > +	GEM_BUG_ON(intel_context_is_pinned(child));
> > +	GEM_BUG_ON(intel_context_is_child(child));
> > +	GEM_BUG_ON(intel_context_is_parent(child));
> > +
> > +	parent->guc_number_children++;
> > +	list_add_tail(&child->guc_child_link,
> > +		      &parent->guc_child_list);
> > +	child->parent = parent;
> > +}
> > +
> >   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> >   #include "selftest_context.c"
> >   #endif
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index c41098950746..c2985822ab74 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -44,6 +44,45 @@ void intel_context_free(struct intel_context *ce);
> >   int intel_context_reconfigure_sseu(struct intel_context *ce,
> >   				   const struct intel_sseu sseu);
> > +static inline bool intel_context_is_child(struct intel_context *ce)
> > +{
> > +	return !!ce->parent;
> > +}
> > +
> > +static inline bool intel_context_is_parent(struct intel_context *ce)
> > +{
> > +	return !!ce->guc_number_children;
> > +}
> > +
> > +static inline bool intel_context_is_pinned(struct intel_context *ce);
> No point declaring 'static inline' if there is no function body?
> 

Forward delc for the below function.

> > +
> > +static inline struct intel_context *
> > +intel_context_to_parent(struct intel_context *ce)
> > +{
> > +        if (intel_context_is_child(ce)) {
> > +		/*
> > +		 * The parent holds ref count to the child so it is always safe
> > +		 * for the parent to access the child, but the child has pointer
> has pointer -> has a pointer
>

Yep.
 
> > +		 * to the parent without a ref. To ensure this is safe the child
> > +		 * should only access the parent pointer while the parent is
> > +		 * pinned.
> > +		 */
> > +                GEM_BUG_ON(!intel_context_is_pinned(ce->parent));
> > +
> > +                return ce->parent;
> > +        } else {
> > +                return ce;
> > +        }
> > +}
> > +
> > +void intel_context_bind_parent_child(struct intel_context *parent,
> > +				     struct intel_context *child);
> > +
> > +#define for_each_child(parent, ce)\
> > +	list_for_each_entry(ce, &(parent)->guc_child_list, guc_child_link)
> > +#define for_each_child_safe(parent, ce, cn)\
> > +	list_for_each_entry_safe(ce, cn, &(parent)->guc_child_list, guc_child_link)
> Do these macros not need some kind of intel_context prefix? Or at least be
> 'for_each_guc_child' given the naming of the list/link fields? But maybe not
> if the guc_ is dropped from the variable names - see below.
> 

I like the names. Yes, the guc_* prefix should be dropped because these
are used in execlists too. I can drop those prefixes in the next rev.

> > +
> >   /**
> >    * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
> >    * @ce - the context
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index fd338a30617e..0fafc178cf2c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -213,6 +213,29 @@ struct intel_context {
> >   	 */
> >   	struct list_head destroyed_link;
> > +	/** anonymous struct for parent / children only members */
> > +	struct {
> > +		union {
> > +			/**
> > +			 * @guc_child_list: parent's list of of children
> > +			 * contexts, no protection as immutable after context
> > +			 * creation
> > +			 */
> > +			struct list_head guc_child_list;
> > +			/**
> > +			 * @guc_child_link: child's link into parent's list of
> > +			 * children
> > +			 */
> > +			struct list_head guc_child_link;
> > +		};
> > +
> > +		/** @parent: pointer to parent if child */
> > +		struct intel_context *parent;
> > +
> > +		/** @guc_number_children: number of children if parent */
> > +		u8 guc_number_children;
> These are not really a GuC specific fields? The parent/child thing might
> only be necessary for GuC submission (although can you say it won't be
> required by any future backend, such as the DRM scheduler?) but it is a
> context level concept. None of the files changed in this patch are GuC
> specific. So no need for 'guc_' prefix? Alternatively, if it all really is
> completely GuC specific then the 'parent' field should also have the prefix?
> Or even just name the outer struct 'guc_family' or something and drop the
> prefixes from all the inner members.
> 

Yep, will drop. Originally only used for GuC submission but now a
generic concept.

Matt

> John.
> 
> > +	};
> > +
> >   #ifdef CONFIG_DRM_I915_SELFTEST
> >   	/**
> >   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> 
