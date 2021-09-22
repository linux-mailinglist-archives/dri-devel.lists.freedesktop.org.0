Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877E414D50
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 17:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F9B6EB8F;
	Wed, 22 Sep 2021 15:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020EC6E029;
 Wed, 22 Sep 2021 15:45:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="287294555"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="287294555"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 08:45:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="533815429"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 08:45:45 -0700
Date: Wed, 22 Sep 2021 08:40:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, tvrtko.ursulin@intel.com,
 lucas.demarchi@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Drop stealing of bits from
 i915_sw_fence function pointer
Message-ID: <20210922154049.GA17656@jons-linux-dev-box>
References: <20210922145739.17133-1-matthew.brost@intel.com>
 <f4a6320c-46ea-7a6d-6df8-3995b3497ef7@linux.intel.com>
 <94ef2f48-5f84-bc4c-0e9f-b1481afd8132@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94ef2f48-5f84-bc4c-0e9f-b1481afd8132@linux.intel.com>
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

On Wed, Sep 22, 2021 at 04:25:04PM +0100, Tvrtko Ursulin wrote:
> 
> On 22/09/2021 16:21, Tvrtko Ursulin wrote:
> > 
> > On 22/09/2021 15:57, Matthew Brost wrote:
> > > Rather than stealing bits from i915_sw_fence function pointer use
> > > seperate fields for function pointer and flags. If using two different
> > > fields, the 4 byte alignment for the i915_sw_fence function pointer can
> > > also be dropped.
> > > 
> > > v2:
> > >   (CI)
> > >    - Set new function field rather than flags in __i915_sw_fence_init
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
> > >   drivers/gpu/drm/i915/i915_request.c           |  4 ++--
> > >   drivers/gpu/drm/i915/i915_sw_fence.c          | 12 +++++------
> > >   drivers/gpu/drm/i915/i915_sw_fence.h          | 21 +++++++++----------
> > >   drivers/gpu/drm/i915/i915_sw_fence_work.c     |  2 +-
> > >   .../gpu/drm/i915/selftests/i915_sw_fence.c    |  2 +-
> > >   drivers/gpu/drm/i915/selftests/lib_sw_fence.c |  4 ++--
> > >   8 files changed, 23 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > index a7ca38613f89..6d5bb55ffc82 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -10323,7 +10323,7 @@ static void intel_atomic_commit_work(struct
> > > work_struct *work)
> > >       intel_atomic_commit_tail(state);
> > >   }
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   intel_atomic_commit_ready(struct i915_sw_fence *fence,
> > >                 enum i915_sw_fence_notify notify)
> > >   {
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index c2ab0e22db0a..df5fec5c3da8 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -800,7 +800,7 @@ static void free_engines_rcu(struct rcu_head *rcu)
> > >       free_engines(engines);
> > >   }
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   engines_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       struct i915_gem_engines *engines =
> > > diff --git a/drivers/gpu/drm/i915/i915_request.c
> > > b/drivers/gpu/drm/i915/i915_request.c
> > > index ce446716d092..945d3025a0b6 100644
> > > --- a/drivers/gpu/drm/i915/i915_request.c
> > > +++ b/drivers/gpu/drm/i915/i915_request.c
> > > @@ -719,7 +719,7 @@ void i915_request_cancel(struct i915_request
> > > *rq, int error)
> > >       intel_context_cancel_request(rq->context, rq);
> > >   }
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   submit_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       struct i915_request *request =
> > > @@ -755,7 +755,7 @@ submit_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >       return NOTIFY_DONE;
> > >   }
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   semaphore_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       struct i915_request *rq = container_of(fence, typeof(*rq),
> > > semaphore);
> > > diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c
> > > b/drivers/gpu/drm/i915/i915_sw_fence.c
> > > index c589a681da77..1c080dd1f718 100644
> > > --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> > > +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> > > @@ -34,7 +34,7 @@ enum {
> > >   static void *i915_sw_fence_debug_hint(void *addr)
> > >   {
> > > -    return (void *)(((struct i915_sw_fence *)addr)->flags &
> > > I915_SW_FENCE_MASK);
> > > +    return (void *)(((struct i915_sw_fence *)addr)->fn);
> > >   }
> > >   #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
> > > @@ -126,10 +126,7 @@ static inline void debug_fence_assert(struct
> > > i915_sw_fence *fence)
> > >   static int __i915_sw_fence_notify(struct i915_sw_fence *fence,
> > >                     enum i915_sw_fence_notify state)
> > >   {
> > > -    i915_sw_fence_notify_t fn;
> > > -
> > > -    fn = (i915_sw_fence_notify_t)(fence->flags & I915_SW_FENCE_MASK);
> > > -    return fn(fence, state);
> > > +    return fence->fn(fence, state);
> > >   }
> > >   #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
> > > @@ -242,10 +239,11 @@ void __i915_sw_fence_init(struct i915_sw_fence
> > > *fence,
> > >                 const char *name,
> > >                 struct lock_class_key *key)
> > >   {
> > > -    BUG_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK);
> > > +    BUG_ON(!fn);
> > >       __init_waitqueue_head(&fence->wait, name, key);
> > > -    fence->flags = (unsigned long)fn;
> > > +    fence->fn = fn;
> > > +    fence->flags = 0;
> > >       i915_sw_fence_reinit(fence);
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h
> > > b/drivers/gpu/drm/i915/i915_sw_fence.h
> > > index 30a863353ee6..70ba1789aa89 100644
> > > --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> > > +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> > > @@ -17,26 +17,25 @@
> > >   struct completion;
> > >   struct dma_resv;
> > > +struct i915_sw_fence;
> > > +
> > > +enum i915_sw_fence_notify {
> > > +    FENCE_COMPLETE,
> > > +    FENCE_FREE
> > > +};
> > > +
> > > +typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
> > > +                      enum i915_sw_fence_notify state);
> > >   struct i915_sw_fence {
> > >       wait_queue_head_t wait;
> > > +    i915_sw_fence_notify_t fn;
> > >       unsigned long flags;
> > 
> > Looks good to me. I'd just make the flags narrower now that they can be,
> > and put them down..
> > 
> > >       atomic_t pending;
> > 
> > .. here as unsigned int and so we save 4 bytes, maybe.
> 
> No this won't work due test_and_set_bit needs a long, oh well.
> 
> > 
> > In fact, unless CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is on, which it won't
> > be on release builds, I don't think anything uses flags any more. So you
> > could even omit the flags in that case. Might be cumbersome so can leave
> > for later, but would sure be nice not to waste space if we can avoid it.
> > 
> > Also please double check if i915_sw_fence_reinit() will be fine and
> > won't bug on since fence->flags is always zero now I think.
> 

Yes, the BUG_ON(!fence->flags) is going to blow up, good catch. Will
skip this revisions testing and repost with this fixed. 

If we add a few 'ifdef CONFIG_DRM_I915_SW_FENCE_CHECK_DAG' we indeed can
only include fence->flags if CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is
defined. Will include in next rev.

Matt

> But these two are worth checking out.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > >       int error;
> > >   };
> > >   #define I915_SW_FENCE_CHECKED_BIT    0 /* used internally for DAG
> > > checking */
> > > -#define I915_SW_FENCE_PRIVATE_BIT    1 /* available for use by owner */
> > > -#define I915_SW_FENCE_MASK        (~3)
> > > -
> > > -enum i915_sw_fence_notify {
> > > -    FENCE_COMPLETE,
> > > -    FENCE_FREE
> > > -};
> > > -
> > > -typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
> > > -                      enum i915_sw_fence_notify state);
> > > -#define __i915_sw_fence_call __aligned(4)
> > >   void __i915_sw_fence_init(struct i915_sw_fence *fence,
> > >                 i915_sw_fence_notify_t fn,
> > > diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c
> > > b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> > > index 5b33ef23d54c..d2e56b387993 100644
> > > --- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
> > > +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> > > @@ -23,7 +23,7 @@ static void fence_work(struct work_struct *work)
> > >       dma_fence_put(&f->dma);
> > >   }
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   fence_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       struct dma_fence_work *f = container_of(fence, typeof(*f), chain);
> > > diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> > > b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> > > index cbf45d85cbff..daa985e5a19b 100644
> > > --- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> > > +++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> > > @@ -28,7 +28,7 @@
> > >   #include "../i915_selftest.h"
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   fence_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       switch (state) {
> > > diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> > > b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> > > index 080b90b63d16..eb59a41bdb79 100644
> > > --- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> > > +++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> > > @@ -26,7 +26,7 @@
> > >   /* Small library of different fence types useful for writing tests */
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   nop_fence_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       return NOTIFY_DONE;
> > > @@ -89,7 +89,7 @@ struct heap_fence {
> > >       };
> > >   };
> > > -static int __i915_sw_fence_call
> > > +static int
> > >   heap_fence_notify(struct i915_sw_fence *fence, enum
> > > i915_sw_fence_notify state)
> > >   {
> > >       struct heap_fence *h = container_of(fence, typeof(*h), fence);
> > > 
