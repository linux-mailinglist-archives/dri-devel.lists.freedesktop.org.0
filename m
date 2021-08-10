Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD403E55C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FF389F43;
	Tue, 10 Aug 2021 08:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C49589F2E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:45:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x12so1691205wrr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HghH6VT92/R3WeGAdf2CkMvyIDluibCWfnctqclrtWc=;
 b=ONxSb97rQFni1QdaHMQg5r+rhCXdoJrK4vUiPc7fGsAeY2m/j9Y5lTwb71vR1/OmN2
 p0AkIgA9hkF4lcucQgwp5iTVYC71o7ArlgyJjsszXugTisO2frnIdqPdC3n+sT3BR4Vm
 cdddfA9HOMeG+1zFJcQKgT96rcgDuddyfWGoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HghH6VT92/R3WeGAdf2CkMvyIDluibCWfnctqclrtWc=;
 b=lGiRGOSFvzaWC2Sp4/YLKECCPUwQfRRs9Xko7aYkzncVE9RtALAQTQ8HQ2gXYrwDeT
 R1SWWYsS/u4ZwUlaMDZyGxnLb0njEZ1TvqZq0WBpncXwD2n/7TxHgJcvjhVk7uvD5ME/
 TxNRnaO2fKOWlD+VBkywL4Xm3kzUiQ8ZMVtmC4Trv9WXb0FkMisGUatrJtrlogSPaS3c
 eFuPZDyyrZK6WASbCo9yuHBOLLy7TWK+94KEC2YnEBHJnhd9OMOK4VUhlint1AYoLFza
 FCOP04E993FvHcs1s7Wt6qiQlJ07NbyvPArKjsgYpYqEaJ0Wkv9NxqlUWRdHMlxir38w
 ymeA==
X-Gm-Message-State: AOAM533Fr3dufKxXtELehPQ+oXGkkybK9n5f1H0tveT9iEFEzBZFlZ22
 Q7aJtV9ihWAnnQFhykvl+aZQQw==
X-Google-Smtp-Source: ABdhPJzXEF8iqdmB34N9gLj9EfZVA2WrDLNeID/oP9yhpdv9tYBKtKXlwlFJNMTvsYG4uuWDDpbVNQ==
X-Received: by 2002:a5d:4c91:: with SMTP id z17mr2092593wrs.54.1628585151690; 
 Tue, 10 Aug 2021 01:45:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n8sm22024995wrx.46.2021.08.10.01.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:45:51 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:45:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 15/46] drm/i915/guc: Introduce context
 parent-child relationship
Message-ID: <YRI8veIU9NoKVW0S@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-16-matthew.brost@intel.com>
 <YRE9w8f+k24hTiWP@phenom.ffwll.local>
 <20210809184416.GA123689@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809184416.GA123689@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 09, 2021 at 06:44:16PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 04:37:55PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 03, 2021 at 03:29:12PM -0700, Matthew Brost wrote:
> > > Introduce context parent-child relationship. Once this relationship is
> > > created all pinning / unpinning operations are directed to the parent
> > > context. The parent context is responsible for pinning all of its'
> > > children and itself.
> > > 
> > > This is a precursor to the full GuC multi-lrc implementation but aligns
> > > to how GuC mutli-lrc interface is defined - a single H2G is used
> > > register / deregister all of the contexts simultaneously.
> > > 
> > > Subsequent patches in the series will implement the pinning / unpinning
> > > operations for parent / child contexts.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_context.c       | 29 +++++++++++++++++++
> > >  drivers/gpu/drm/i915/gt/intel_context.h       | 18 ++++++++++++
> > >  drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++++++++
> > >  3 files changed, 59 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > index 745e84c72c90..8cb92b10b547 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > @@ -395,6 +395,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> > >  	spin_lock_init(&ce->guc_state.lock);
> > >  	INIT_LIST_HEAD(&ce->guc_state.fences);
> > >  
> > > +	INIT_LIST_HEAD(&ce->guc_child_list);
> > > +
> > >  	spin_lock_init(&ce->guc_active.lock);
> > >  	INIT_LIST_HEAD(&ce->guc_active.requests);
> > >  
> > > @@ -414,10 +416,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> > >  
> > >  void intel_context_fini(struct intel_context *ce)
> > >  {
> > > +	struct intel_context *child, *next;
> > > +
> > >  	if (ce->timeline)
> > >  		intel_timeline_put(ce->timeline);
> > >  	i915_vm_put(ce->vm);
> > >  
> > > +	/* Need to put the creation ref for the children */
> > > +	if (intel_context_is_parent(ce))
> > > +		for_each_child_safe(ce, child, next)
> > > +			intel_context_put(child);
> > > +
> > >  	mutex_destroy(&ce->pin_mutex);
> > >  	i915_active_fini(&ce->active);
> > >  }
> > > @@ -533,6 +542,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> > >  	return active;
> > >  }
> > >  
> > > +void intel_context_bind_parent_child(struct intel_context *parent,
> > > +				     struct intel_context *child)
> > > +{
> > > +	/*
> > > +	 * Callers responsibility to validate that this function is used
> > > +	 * correctly but we use GEM_BUG_ON here ensure that they do.
> > > +	 */
> > > +	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
> > > +	GEM_BUG_ON(intel_context_is_pinned(parent));
> > > +	GEM_BUG_ON(intel_context_is_child(parent));
> > > +	GEM_BUG_ON(intel_context_is_pinned(child));
> > > +	GEM_BUG_ON(intel_context_is_child(child));
> > > +	GEM_BUG_ON(intel_context_is_parent(child));
> > > +
> > > +	parent->guc_number_children++;
> > > +	list_add_tail(&child->guc_child_link,
> > > +		      &parent->guc_child_list);
> > > +	child->parent = parent;
> > > +}
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > >  #include "selftest_context.c"
> > >  #endif
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > > index c41098950746..ad6ce5ac4824 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > > @@ -44,6 +44,24 @@ void intel_context_free(struct intel_context *ce);
> > >  int intel_context_reconfigure_sseu(struct intel_context *ce,
> > >  				   const struct intel_sseu sseu);
> > >  
> > > +static inline bool intel_context_is_child(struct intel_context *ce)
> > > +{
> > > +	return !!ce->parent;
> > > +}
> > > +
> > > +static inline bool intel_context_is_parent(struct intel_context *ce)
> > > +{
> > > +	return !!ce->guc_number_children;
> > > +}
> > > +
> > > +void intel_context_bind_parent_child(struct intel_context *parent,
> > > +				     struct intel_context *child);
> > > +
> > > +#define for_each_child(parent, ce)\
> > > +	list_for_each_entry(ce, &(parent)->guc_child_list, guc_child_link)
> > > +#define for_each_child_safe(parent, ce, cn)\
> > > +	list_for_each_entry_safe(ce, cn, &(parent)->guc_child_list, guc_child_link)
> > > +
> > >  /**
> > >   * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
> > >   * @ce - the context
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > index 2df79ba39867..66b22b370a72 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > @@ -202,6 +202,18 @@ struct intel_context {
> > >  	/* GuC context blocked fence */
> > >  	struct i915_sw_fence guc_blocked;
> > >  
> > > +	/* Head of children list or link in parent's children list */
> > 
> > Kerneldoc layout would be nice, plus explaining when exactly this is
> > set or the list empty (e.g. guch_child_list is empty if and only if
> > guc_number_children > 0 and parent == NULL).
> > 
> 
> Sure.
> 
> > Also mentionting that these are invariant over the lifetime of the object
> > would be nice.
> >
> 
> Yes, this is a context creation setup step that is done exactly once and
> is invariant over the lifetime of these contexts.
> 
> > Finally some words on refcounting (like who holds a reference on whom and
> > how we guarantee that use-after-free doesn't go boom since you have links
> > both ways). It looks like parent holds a reference on the child, so how do
> > you make sure the child looking at the parent doesn't go boom?
> 
> I hadn't really thought about the child looking at the parent but I
> believe it is safe. The child only looks up the parent when submissions
> are in flight. We always have refs on the contexts when submissions are
> in flight so we should be good - e.g. the last ref to parent is dropped
> only after all submissions are done and the context is closed.

Yeah that's pretty much the only safe option I could come up with too.
Please
- document this
- enforce it with checks. I think a wrapper to get at the parent, which a)
  can fail and b) checks that the child request is not yet signalled
  should do. Something with try_get or whatever it the name to signal it
  can fail is best.

Then the rule is that the unsignalled child request has an implicit
reference on the parent as long as it's unsignalled, but not afterwards.
It might also be good to clear out the parent pointer before signalling
the request. If that races in funny ways there's definitely more problems.
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > > +	union {
> > > +		struct list_head guc_child_list;	/* parent */
> > > +		struct list_head guc_child_link;	/* child */
> > > +	};
> > > +
> > > +	/* Pointer to parent */
> > > +	struct intel_context *parent;
> > > +
> > > +	/* Number of children if parent */
> > > +	u8 guc_number_children;
> > > +
> > >  	/*
> > >  	 * GuC priority management
> > >  	 */
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
