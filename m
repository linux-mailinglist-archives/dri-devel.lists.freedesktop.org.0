Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB33E47CC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE3389C2C;
	Mon,  9 Aug 2021 14:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499789C2C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:40:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z4so21800752wrv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WPSOxXtZOtRuAV2N/AVgCO87MDvzS3FYg2sg28OLyv0=;
 b=A+U71t08+c9irjJAsFIUcpAgXhqSijB3hiSY1P0I4zPEooQZ/QgqO+u/txi/8W0m7Y
 kSFqD3PRSALDaSqXQoE7Rs7X586jk+2YLTMRorQWil20KWtU7V5tZT/+DJLxDPpjPDxa
 lM/czVDLyhhvTFQcCuXcWXT9A/OS6apczpVM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WPSOxXtZOtRuAV2N/AVgCO87MDvzS3FYg2sg28OLyv0=;
 b=qrbl7RwWRaCWVdCbT2cPMMgVnAJcifwcRFtqyFAGFE39FvK8afCVdwAlyXxHRWAkT5
 QNoR6aAbP2D22tkE3MkgoYatfhdfM5ug6idqByQJ+5XvchpSxMWBBSfqsIaT6QgxAgFb
 fUOMZcV8jzpZ/nIm88p97BSVDjzpgO8kFOXi/4zdxcCErRfrhEHZYJ7wHhQ3m+ql2U1H
 ufQblJo9dEXEz4o60L+an9+YPNFP92WbGh/s+8lxKpBugFnup72YrXZy2jO52e67xIpp
 IbIIiDf56B0edWKgnLzi3fVsJRF34gu7zbGBfMlatevidH1xxBtjjWZKC7/tJh80Lnol
 kfiA==
X-Gm-Message-State: AOAM5328M1N8AHyKxva/1oeewF2VnYltVa5T1VCFFT6UXEKV0b+9nCUt
 IpNsJF2oo1Dw0t+pa0mU7loB+716/qtGmw==
X-Google-Smtp-Source: ABdhPJyyNzREVUuT9Utslp1EmD0/H6FaqtsZsmPjwJceJdOm+/ChDTiP37o12c1f5gg1kdNq+luSPQ==
X-Received: by 2002:adf:ef4b:: with SMTP id c11mr25233906wrp.35.1628520014020; 
 Mon, 09 Aug 2021 07:40:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l41sm19611876wmp.23.2021.08.09.07.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 07:40:13 -0700 (PDT)
Date: Mon, 9 Aug 2021 16:40:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 15/46] drm/i915/guc: Introduce context
 parent-child relationship
Message-ID: <YRE+SxNmTbkacCPx@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-16-matthew.brost@intel.com>
 <YRE9w8f+k24hTiWP@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRE9w8f+k24hTiWP@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 04:37:55PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:12PM -0700, Matthew Brost wrote:
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
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_context.c       | 29 +++++++++++++++++++
> >  drivers/gpu/drm/i915/gt/intel_context.h       | 18 ++++++++++++
> >  drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++++++++
> >  3 files changed, 59 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 745e84c72c90..8cb92b10b547 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -395,6 +395,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >  	spin_lock_init(&ce->guc_state.lock);
> >  	INIT_LIST_HEAD(&ce->guc_state.fences);
> >  
> > +	INIT_LIST_HEAD(&ce->guc_child_list);
> > +
> >  	spin_lock_init(&ce->guc_active.lock);
> >  	INIT_LIST_HEAD(&ce->guc_active.requests);
> >  
> > @@ -414,10 +416,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >  
> >  void intel_context_fini(struct intel_context *ce)
> >  {
> > +	struct intel_context *child, *next;
> > +
> >  	if (ce->timeline)
> >  		intel_timeline_put(ce->timeline);
> >  	i915_vm_put(ce->vm);
> >  
> > +	/* Need to put the creation ref for the children */
> > +	if (intel_context_is_parent(ce))
> > +		for_each_child_safe(ce, child, next)
> > +			intel_context_put(child);
> > +
> >  	mutex_destroy(&ce->pin_mutex);
> >  	i915_active_fini(&ce->active);
> >  }
> > @@ -533,6 +542,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> >  	return active;
> >  }
> >  
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
> >  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> >  #include "selftest_context.c"
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index c41098950746..ad6ce5ac4824 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -44,6 +44,24 @@ void intel_context_free(struct intel_context *ce);
> >  int intel_context_reconfigure_sseu(struct intel_context *ce,
> >  				   const struct intel_sseu sseu);
> >  
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
> > +void intel_context_bind_parent_child(struct intel_context *parent,
> > +				     struct intel_context *child);
> > +
> > +#define for_each_child(parent, ce)\
> > +	list_for_each_entry(ce, &(parent)->guc_child_list, guc_child_link)
> > +#define for_each_child_safe(parent, ce, cn)\
> > +	list_for_each_entry_safe(ce, cn, &(parent)->guc_child_list, guc_child_link)
> > +
> >  /**
> >   * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
> >   * @ce - the context
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 2df79ba39867..66b22b370a72 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -202,6 +202,18 @@ struct intel_context {
> >  	/* GuC context blocked fence */
> >  	struct i915_sw_fence guc_blocked;
> >  
> > +	/* Head of children list or link in parent's children list */
> 
> Kerneldoc layout would be nice, plus explaining when exactly this is
> set or the list empty (e.g. guch_child_list is empty if and only if
> guc_number_children > 0 and parent == NULL).
> 
> Also mentionting that these are invariant over the lifetime of the object
> would be nice.
> 
> Finally some words on refcounting (like who holds a reference on whom and
> how we guarantee that use-after-free doesn't go boom since you have links
> both ways). It looks like parent holds a reference on the child, so how do
> you make sure the child looking at the parent doesn't go boom?
> -Daniel
> 
> > +	union {
> > +		struct list_head guc_child_list;	/* parent */
> > +		struct list_head guc_child_link;	/* child */
> > +	};
> > +
> > +	/* Pointer to parent */
> > +	struct intel_context *parent;
> > +
> > +	/* Number of children if parent */
> > +	u8 guc_number_children;

Another one: Can we really not afford a int here? The nasty thing about
unsigned is that wrap-around is well-defined, which is why gcc won't ever
complain about it. Which hides bugs. Same for next patch, which also
micro-optimizes a few fields to be tiny.

We generally don't have thousands of contexts hanging around, unless
there's a reason (which should be documented) this feels like it's
squarely on the wrong side of "don't prematurely optimize".
-Daniel

> > +
> >  	/*
> >  	 * GuC priority management
> >  	 */
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
