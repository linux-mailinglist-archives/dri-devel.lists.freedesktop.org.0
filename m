Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494014270DD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 20:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A053F6F527;
	Fri,  8 Oct 2021 18:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6AE6E07D;
 Fri,  8 Oct 2021 18:38:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="225342480"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="225342480"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 11:38:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="657898547"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 11:38:17 -0700
Date: Fri, 8 Oct 2021 11:33:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH 07/26] drm/i915/guc: Introduce context parent-child
 relationship
Message-ID: <20211008183330.GA2672@jons-linux-dev-box>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-8-matthew.brost@intel.com>
 <624cb924-dadc-89f8-6f52-c56366f15eb1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624cb924-dadc-89f8-6f52-c56366f15eb1@intel.com>
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

On Thu, Oct 07, 2021 at 12:35:08PM -0700, John Harrison wrote:
> On 10/4/2021 15:06, Matthew Brost wrote:
> > Introduce context parent-child relationship. Once this relationship is
> > created all pinning / unpinning operations are directed to the parent
> > context. The parent context is responsible for pinning all of its'
> No need for an apostrophe.
> 

Fixed.

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
> > v3:
> >   (John Harrison)
> >    - Fix comment explaing GEM_BUG_ON in to_parent()
> >    - Make variable names generic (non-GuC specific)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c       | 29 +++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_context.h       | 41 +++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_context_types.h | 21 ++++++++++
> >   3 files changed, 91 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index f601323b939f..c5bb7ccfb3f8 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -403,6 +403,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >   	INIT_LIST_HEAD(&ce->destroyed_link);
> > +	INIT_LIST_HEAD(&ce->parallel.child_list);
> > +
> >   	/*
> >   	 * Initialize fence to be complete as this is expected to be complete
> >   	 * unless there is a pending schedule disable outstanding.
> > @@ -417,10 +419,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
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
> >   	i915_sw_fence_fini(&ce->guc_state.blocked);
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
> > +	parent->parallel.number_children++;
> > +	list_add_tail(&child->parallel.child_link,
> > +		      &parent->parallel.child_list);
> > +	child->parallel.parent = parent;
> > +}
> > +
> >   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> >   #include "selftest_context.c"
> >   #endif
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index c41098950746..b63c10a144af 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -44,6 +44,47 @@ void intel_context_free(struct intel_context *ce);
> >   int intel_context_reconfigure_sseu(struct intel_context *ce,
> >   				   const struct intel_sseu sseu);
> > +static inline bool intel_context_is_child(struct intel_context *ce)
> > +{
> > +	return !!ce->parallel.parent;
> > +}
> > +
> > +static inline bool intel_context_is_parent(struct intel_context *ce)
> > +{
> > +	return !!ce->parallel.number_children;
> > +}
> > +
> > +static inline bool intel_context_is_pinned(struct intel_context *ce);
> > +
> > +static inline struct intel_context *
> > +intel_context_to_parent(struct intel_context *ce)
> > +{
> > +	if (intel_context_is_child(ce)) {
> > +		/*
> > +		 * The parent holds ref count to the child so it is always safe
> > +		 * for the parent to access the child, but the child has a
> > +		 * pointer to the parent without a ref. To ensure this is safe
> > +		 * the child should only access the parent pointer while the
> > +		 * parent is pinned.
> > +		 */
> > +		GEM_BUG_ON(!intel_context_is_pinned(ce->parallel.parent));
> > +
> > +		return ce->parallel.parent;
> > +	} else {
> > +		return ce;
> > +	}
> > +}
> > +
> > +void intel_context_bind_parent_child(struct intel_context *parent,
> > +				     struct intel_context *child);
> > +
> > +#define for_each_child(parent, ce)\
> > +	list_for_each_entry(ce, &(parent)->parallel.child_list,\
> > +			    parallel.child_link)
> > +#define for_each_child_safe(parent, ce, cn)\
> > +	list_for_each_entry_safe(ce, cn, &(parent)->parallel.child_list,\
> > +				 parallel.child_link)
> > +
> >   /**
> >    * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
> >    * @ce - the context
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 4613d027cbc3..76dfca57cb45 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -220,6 +220,27 @@ struct intel_context {
> >   	 */
> >   	struct list_head destroyed_link;
> > +	/** @parallel: sub-structure for parallel submission members */
> > +	struct {
> > +		union {
> > +			/**
> > +			 * @child_list: parent's list of children
> > +			 * contexts, no protection as immutable after context
> > +			 * creation
> > +			 */
> > +			struct list_head child_list;
> > +			/**
> > +			 * @child_link: child's link into parent's list of
> > +			 * children
> > +			 */
> > +			struct list_head child_link;
> > +		};
> > +		/** @parent: pointer to parent if child */
> > +		struct intel_context *parent;
> > +		/** @number_children: number of children if parent */
> > +		u8 number_children;
> Is there any particular reason for using 'u8'? A simple 'int' can be much
> more efficient depending upon the host CPU architecture.
> 

Several other fields in the struct are u8 as well, I guess it saves a
few bytes in the struct if they are packed together. Going to leave as
is, if we want to change to all natural sizes we can do in a simple
follow up patch.

Matt

> Not a blocker though. So with the typo above fixed:
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> 
> > +	} parallel;
> > +
> >   #ifdef CONFIG_DRM_I915_SELFTEST
> >   	/**
> >   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> 
