Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E693EA623
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 16:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D146E088;
	Thu, 12 Aug 2021 14:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9867D6E041
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 14:04:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f12-20020a05600c4e8c00b002e6bdd6ffe2so1434493wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kfMPMSAzRUAUdf8c4D9nL6Y+n+EuAvTRWgqDTVXE4K8=;
 b=imUYSorb4LVhO/4Lo0xWyxxYnXUWI5yCLnpqpl5YXgmm0wh0tkYPitr768NKyz1urM
 yLKNmibW1yv7FvTNEqlTS3Q4XI+UccZmSY4J0/tawud/gQm7OkUjkg1wPcuWA0IQsOF+
 OLMW6o/tFiq46qIs5qGpXXBEPzb/1CCHieSXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kfMPMSAzRUAUdf8c4D9nL6Y+n+EuAvTRWgqDTVXE4K8=;
 b=UbaE0MKXgm8kgpLL3Bvu7EvV9Ib0x0dli6eigCBTjZyHvO8wz9Xy/epz3T5PcJtA8s
 0Wect1FiH2C7t2xM16FortT+Ke3hJB8aPuQKRIu9Z2TDITpBpz9morljzPtCugK9q8ps
 16HWjXse5p8fuzXvmSWmm7arQiX48xfwW8Lqn7MfW1nLWOuvrdDbvmjtFffw0bPScSDf
 bRxk8pm2Z7HsLpEhAMbg516Q/zkVADgmb6fte1/yAEx0ugkrar7UMjrj/S9+mSxbtSt7
 W7/al8Y7yfP66Fvpy9P7sP6A5PtEa0F0kbP7UzNnLyebkG8hk1hGR5r6q7DZzEWaaM5x
 ul2Q==
X-Gm-Message-State: AOAM531fbyiETu6nGdpBah7fQbZ1mFeNUJFNW1dnhU7kryfyVUWEsi9K
 G4M4CULj3AY+F8UW90tWilpQwQ==
X-Google-Smtp-Source: ABdhPJzGGN+F7wWIen6qOINIar8LpPe7PhG/gtcIak3WPdYQk3byDFvsQyLYGEkUpanmiE0QpomnIQ==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr4292597wml.82.1628777047636; 
 Thu, 12 Aug 2021 07:04:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t8sm3097467wmj.5.2021.08.12.07.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:04:06 -0700 (PDT)
Date: Thu, 12 Aug 2021 16:04:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 46/46] drm/i915/guc: Add delay before
 disabling scheduling on contexts
Message-ID: <YRUqVWcLF5DcLiia@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-47-matthew.brost@intel.com>
 <YRFjJy/7eWLo/eaL@phenom.ffwll.local>
 <20210809193226.GA124227@DUT151-ICLU.fm.intel.com>
 <YROepEK1+Go/y4I0@phenom.ffwll.local>
 <20210811174323.GA297080@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811174323.GA297080@DUT151-ICLU.fm.intel.com>
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

On Wed, Aug 11, 2021 at 05:43:23PM +0000, Matthew Brost wrote:
> On Wed, Aug 11, 2021 at 11:55:48AM +0200, Daniel Vetter wrote:
> > On Mon, Aug 09, 2021 at 07:32:26PM +0000, Matthew Brost wrote:
> > > On Mon, Aug 09, 2021 at 07:17:27PM +0200, Daniel Vetter wrote:
> > > > On Tue, Aug 03, 2021 at 03:29:43PM -0700, Matthew Brost wrote:
> > > > > Some workloads use lots of contexts that continually pin / unpin
> > > > > contexts. With GuC submission an unpin translates to a schedule disable
> > > > > H2G which puts pressure on both the i915 and GuC. A schedule disable can
> > > > > also block future requests from being submitted until the operation
> > > > > completes. None of this is ideal.
> > > > > 
> > > > > Add a configurable, via debugfs, delay period before the schedule
> > > > > disable is issued. Default delay period is 1 second. The delay period is
> > > > > skipped if more than 3/4 of the guc_ids are in use.
> > > > > 
> > > > > This patch also updates the selftests to turn off this delay period as
> > > > > this extra time would likely cause many selftests to fail. Follow up
> > > > > patches will fix all the selftests and enable the delay period.
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > I think this is more evidence that we should just pin/unpin context at
> > > > create/destruction time. The current scheme doesn't really work that well
> > > > and causes way more pain than benefits it seems.
> > > > 
> > > 
> > > Well that choice is above my pay grade, but for what it is worth it
> > > would simplify the GuC backend quite a bit if we perma-pin contexts. By
> > > quite a bit, I actually mean a lot of complexity goes away.
> > > 
> > > In the meantime I think we probably need this code though to avoid
> > > trashes on the scheduling enable / disable.
> > 
> > The trouble is that you muck around with the context close state bit,
> 
> This really doesn't mess this bit anymore that what is there, it just
> adds callback to the backend.
> 
> > which is one of these lockless trickeries where my cursory analysis (just
> > a few days in total of randomly stumbling over it when reading other code)
> > strongly suggests it's busted.
> > 
> > I really don't want to build more on top, especially not without careful
> > review and all that.
> > 
> > Also since this is a perf claim, the commit message needs some numbers.
> >
> 
> This was basically just visual inspection of ftrace of a media workload
> that uses lots of contexts. The contexts were repeatedly pinned /
> unpinned. Disabling / enabling scheduling is a rather expensive
> operation so we really shouldn't be doing it all the time. We visually
> observed an ftrace after this change and all this unnecessary traffic
> went away.

That's the kinds of stuff that should be included in the commit message,
ideally with some numbers (like how many you manage to remove or whatever
metric it is you picked, something quick like done with grep and line
counting is good enough).

> > Finally even if we decide to make contexts properly evictable, we need a
> > different scheme anyway. As you realized the current active tracking is
> > kinda backwards because it unpins immediately when no longer in use.
> 
> Right, this basically just works around the fact that contexts are
> immediately unpinned when not in use. As stated before if we perma-pin
> contexts all this goes away.

Yeah, sounds all good then. Well, more or less.
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > > 
> > > Matt
> > > 
> > > > If anyone screams, and that's a big if aside of some igts, we can come up
> > > > with a proper scheme to evict contexts without pin/unpin and layer hacks
> > > > over that misdesign.
> > > > -Daniel
> > > > 
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   |   2 +-
> > > > >  .../i915/gem/selftests/i915_gem_coherency.c   |   2 +-
> > > > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   2 +-
> > > > >  .../drm/i915/gem/selftests/i915_gem_mman.c    |   2 +-
> > > > >  .../drm/i915/gem/selftests/i915_gem_object.c  |   2 +-
> > > > >  drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
> > > > >  drivers/gpu/drm/i915/gt/intel_context.h       |   9 +
> > > > >  drivers/gpu/drm/i915/gt/intel_context_types.h |   8 +
> > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   7 +
> > > > >  .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |  28 ++
> > > > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 322 +++++++++++++++++-
> > > > >  .../i915/gt/uc/selftest_guc_flow_control.c    |  19 +-
> > > > >  drivers/gpu/drm/i915/i915_selftest.h          |   2 +
> > > > >  drivers/gpu/drm/i915/i915_trace.h             |  10 +
> > > > >  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   2 +-
> > > > >  drivers/gpu/drm/i915/selftests/i915_perf.c    |   2 +-
> > > > >  drivers/gpu/drm/i915/selftests/i915_request.c |   2 +-
> > > > >  drivers/gpu/drm/i915/selftests/i915_vma.c     |   2 +-
> > > > >  18 files changed, 405 insertions(+), 20 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > index b199d59bd2c4..1553287e5491 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > @@ -1298,7 +1298,7 @@ static void engines_idle_release(struct i915_gem_context *ctx,
> > > > >  		int err;
> > > > >  
> > > > >  		/* serialises with execbuf */
> > > > > -		set_bit(CONTEXT_CLOSED_BIT, &ce->flags);
> > > > > +		intel_context_close(ce);
> > > > >  		if (!intel_context_pin_if_active(ce))
> > > > >  			continue;
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> > > > > index 13b088cc787e..a666d7e610f5 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> > > > > @@ -434,5 +434,5 @@ int i915_gem_coherency_live_selftests(struct drm_i915_private *i915)
> > > > >  		SUBTEST(igt_gem_coherency),
> > > > >  	};
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > > index ffae7df5e4d7..2c92afa9d608 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > > @@ -474,5 +474,5 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
> > > > >  		SUBTEST(igt_dmabuf_import_same_driver_lmem_smem),
> > > > >  	};
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > > index b20f5621f62b..4745c78a48de 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > > @@ -1414,5 +1414,5 @@ int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
> > > > >  		SUBTEST(igt_mmap_gpu),
> > > > >  	};
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
> > > > > index 740ee8086a27..ae1361c7c4cf 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
> > > > > @@ -95,5 +95,5 @@ int i915_gem_object_live_selftests(struct drm_i915_private *i915)
> > > > >  		SUBTEST(igt_gem_huge),
> > > > >  	};
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > > > index 8e90a4a0b7b0..96643040defd 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > > > @@ -472,6 +472,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> > > > >  	ce->guc_id = GUC_INVALID_LRC_ID;
> > > > >  	INIT_LIST_HEAD(&ce->guc_id_link);
> > > > >  
> > > > > +	INIT_LIST_HEAD(&ce->guc_sched_disable_link);
> > > > > +
> > > > >  	mutex_init(&ce->parallel_submit);
> > > > >  	ce->fence_context = dma_fence_context_alloc(1);
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > > > > index a302599e436a..f4c9036f7f03 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > > > > @@ -215,6 +215,15 @@ static inline bool intel_context_is_barrier(const struct intel_context *ce)
> > > > >  	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
> > > > >  }
> > > > >  
> > > > > +static inline void intel_context_close(struct intel_context *ce)
> > > > > +{
> > > > > +	set_bit(CONTEXT_CLOSED_BIT, &ce->flags);
> > > > > +
> > > > > +	trace_intel_context_close(ce);
> > > > > +	if (ce->ops->close)
> > > > > +		ce->ops->close(ce);
> > > > > +}
> > > > > +
> > > > >  static inline bool intel_context_is_closed(const struct intel_context *ce)
> > > > >  {
> > > > >  	return test_bit(CONTEXT_CLOSED_BIT, &ce->flags);
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > > > index 8af9ace4c052..53f00657a45c 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > > > @@ -11,6 +11,7 @@
> > > > >  #include <linux/list.h>
> > > > >  #include <linux/mutex.h>
> > > > >  #include <linux/types.h>
> > > > > +#include <linux/ktime.h>
> > > > >  
> > > > >  #include "i915_active_types.h"
> > > > >  #include "i915_sw_fence.h"
> > > > > @@ -38,6 +39,7 @@ struct intel_context_ops {
> > > > >  	int (*alloc)(struct intel_context *ce);
> > > > >  
> > > > >  	void (*ban)(struct intel_context *ce, struct i915_request *rq);
> > > > > +	void (*close)(struct intel_context *ce);
> > > > >  
> > > > >  	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww);
> > > > >  	int (*pin)(struct intel_context *ce);
> > > > > @@ -203,6 +205,12 @@ struct intel_context {
> > > > >  	 */
> > > > >  	struct list_head guc_id_link;
> > > > >  
> > > > > +	/*
> > > > > +	 * GuC schedule disable link / time
> > > > > +	 */
> > > > > +	struct list_head guc_sched_disable_link;
> > > > > +	ktime_t guc_sched_disable_time;
> > > > > +
> > > > >  	/* GuC context blocked fence */
> > > > >  	struct i915_sw_fence guc_blocked;
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > > index 30a0f364db8f..90b5b657d411 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > > @@ -60,6 +60,7 @@ struct intel_guc {
> > > > >  	struct ida guc_ids;
> > > > >  	u32 num_guc_ids;
> > > > >  	u32 max_guc_ids;
> > > > > +	u32 guc_ids_in_use[GUC_SUBMIT_ENGINE_MAX];
> > > > >  	unsigned long *guc_ids_bitmap;
> > > > >  #define MAX_GUC_ID_ORDER	(order_base_2(MAX_ENGINE_INSTANCE + 1))
> > > > >  	struct list_head guc_id_list_no_ref[MAX_GUC_ID_ORDER + 1];
> > > > > @@ -69,6 +70,12 @@ struct intel_guc {
> > > > >  	struct list_head destroyed_contexts;
> > > > >  	struct intel_gt_pm_unpark_work destroy_worker;
> > > > >  
> > > > > +	spinlock_t sched_disable_lock;	/* protects schedule disable list */
> > > > > +	struct list_head sched_disable_list;
> > > > > +	struct hrtimer sched_disable_timer;
> > > > > +#define SCHED_DISABLE_DELAY_NS	1000000000
> > > > > +	u64 sched_disable_delay_ns;
> > > > > +
> > > > >  	bool submission_supported;
> > > > >  	bool submission_selected;
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> > > > > index 7c479c5e7b3a..53a6f3da6cce 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> > > > > @@ -80,12 +80,40 @@ static int guc_num_id_set(void *data, u64 val)
> > > > >  }
> > > > >  DEFINE_SIMPLE_ATTRIBUTE(guc_num_id_fops, guc_num_id_get, guc_num_id_set, "%lld\n");
> > > > >  
> > > > > +static int guc_sched_disable_delay_ns_get(void *data, u64 *val)
> > > > > +{
> > > > > +	struct intel_guc *guc = data;
> > > > > +
> > > > > +	if (!intel_guc_submission_is_used(guc))
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	*val = guc->sched_disable_delay_ns;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int guc_sched_disable_delay_ns_set(void *data, u64 val)
> > > > > +{
> > > > > +	struct intel_guc *guc = data;
> > > > > +
> > > > > +	if (!intel_guc_submission_is_used(guc))
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	guc->sched_disable_delay_ns = val;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +DEFINE_SIMPLE_ATTRIBUTE(guc_sched_disable_delay_ns_fops,
> > > > > +			guc_sched_disable_delay_ns_get,
> > > > > +			guc_sched_disable_delay_ns_set, "%lld\n");
> > > > > +
> > > > >  void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
> > > > >  {
> > > > >  	static const struct debugfs_gt_file files[] = {
> > > > >  		{ "guc_info", &guc_info_fops, NULL },
> > > > >  		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
> > > > >  		{ "guc_num_id", &guc_num_id_fops, NULL },
> > > > > +		{ "guc_sched_disable_delay_ns", &guc_sched_disable_delay_ns_fops, NULL },
> > > > >  	};
> > > > >  
> > > > >  	if (!intel_guc_is_supported(guc))
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > index cd1893edf43a..dc0d6a099bee 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > @@ -654,11 +654,15 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
> > > > >  	return (timeout < 0) ? timeout : 0;
> > > > >  }
> > > > >  
> > > > > +static void sched_disable_contexts_flush(struct intel_guc *guc);
> > > > > +
> > > > >  int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> > > > >  {
> > > > >  	if (!intel_uc_uses_guc_submission(&guc_to_gt(guc)->uc))
> > > > >  		return 0;
> > > > >  
> > > > > +	sched_disable_contexts_flush(guc);
> > > > > +
> > > > >  	return intel_guc_wait_for_pending_msg(guc,
> > > > >  					      &guc->outstanding_submission_g2h,
> > > > >  					      true, timeout);
> > > > > @@ -1135,6 +1139,7 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
> > > > >  static void guc_signal_context_fence(struct intel_context *ce);
> > > > >  static void guc_cancel_context_requests(struct intel_context *ce);
> > > > >  static void guc_blocked_fence_complete(struct intel_context *ce);
> > > > > +static void sched_disable_context_delete(struct intel_context *ce);
> > > > >  
> > > > >  static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> > > > >  {
> > > > > @@ -1160,6 +1165,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> > > > >  		deregister = context_wait_for_deregister_to_register(ce);
> > > > >  		banned = context_banned(ce);
> > > > >  		init_sched_state(ce);
> > > > > +		sched_disable_context_delete(ce);
> > > > >  
> > > > >  		if (pending_enable || destroyed || deregister) {
> > > > >  			atomic_dec(&guc->outstanding_submission_g2h);
> > > > > @@ -1299,6 +1305,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> > > > >  
> > > > >  	intel_gt_park_heartbeats(guc_to_gt(guc));
> > > > >  	disable_submission(guc);
> > > > > +	hrtimer_cancel(&guc->sched_disable_timer);
> > > > >  	guc->interrupts.disable(guc);
> > > > >  
> > > > >  	/* Flush IRQ handler */
> > > > > @@ -1656,6 +1663,8 @@ static void guc_lrcd_reg_fini(struct intel_guc *guc);
> > > > >  
> > > > >  static void destroy_worker_func(struct work_struct *w);
> > > > >  
> > > > > +static enum hrtimer_restart sched_disable_timer_func(struct hrtimer *hrtimer);
> > > > > +
> > > > >  /*
> > > > >   * Set up the memory resources to be shared with the GuC (via the GGTT)
> > > > >   * at firmware loading time.
> > > > > @@ -1687,6 +1696,13 @@ int intel_guc_submission_init(struct intel_guc *guc)
> > > > >  	INIT_LIST_HEAD(&guc->destroyed_contexts);
> > > > >  	intel_gt_pm_unpark_work_init(&guc->destroy_worker, destroy_worker_func);
> > > > >  
> > > > > +	spin_lock_init(&guc->sched_disable_lock);
> > > > > +	INIT_LIST_HEAD(&guc->sched_disable_list);
> > > > > +	hrtimer_init(&guc->sched_disable_timer, CLOCK_MONOTONIC,
> > > > > +		     HRTIMER_MODE_REL);
> > > > > +	guc->sched_disable_timer.function = sched_disable_timer_func;
> > > > > +	guc->sched_disable_delay_ns = SCHED_DISABLE_DELAY_NS;
> > > > > +
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > @@ -1852,6 +1868,12 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > > >  	if (unlikely(ret < 0))
> > > > >  		return ret;
> > > > >  
> > > > > +	if (intel_context_is_parent(ce))
> > > > > +		guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_MULTI_LRC] +=
> > > > > +			order_base_2(ce->guc_number_children + 1);
> > > > > +	else
> > > > > +		guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_SINGLE_LRC]++;
> > > > > +
> > > > >  	ce->guc_id = ret;
> > > > >  	return 0;
> > > > >  }
> > > > > @@ -1860,13 +1882,18 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > > >  {
> > > > >  	GEM_BUG_ON(intel_context_is_child(ce));
> > > > >  	if (!context_guc_id_invalid(ce)) {
> > > > > -		if (intel_context_is_parent(ce))
> > > > > +		if (intel_context_is_parent(ce)) {
> > > > > +			guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_MULTI_LRC] -=
> > > > > +				order_base_2(ce->guc_number_children + 1);
> > > > >  			bitmap_release_region(guc->guc_ids_bitmap, ce->guc_id,
> > > > >  					      order_base_2(ce->guc_number_children
> > > > >  							   + 1));
> > > > > -		else
> > > > > +		} else {
> > > > > +			guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_SINGLE_LRC]--;
> > > > >  			ida_simple_remove(&guc->guc_ids, ce->guc_id);
> > > > > +		}
> > > > >  		clr_lrc_desc_registered(guc, ce->guc_id);
> > > > > +
> > > > >  		set_context_guc_id_invalid(ce);
> > > > >  	}
> > > > >  	if (!list_empty(&ce->guc_id_link))
> > > > > @@ -1931,9 +1958,13 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce,
> > > > >  			 * from another context that has more guc_id that itself.
> > > > >  			 */
> > > > >  			if (cn_o2 != ce_o2) {
> > > > > +				guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_MULTI_LRC] -=
> > > > > +					order_base_2(cn->guc_number_children + 1);
> > > > >  				bitmap_release_region(guc->guc_ids_bitmap,
> > > > >  						      cn->guc_id,
> > > > >  						      cn_o2);
> > > > > +				guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_MULTI_LRC] +=
> > > > > +					order_base_2(ce->guc_number_children + 1);
> > > > >  				bitmap_allocate_region(guc->guc_ids_bitmap,
> > > > >  						       ce->guc_id,
> > > > >  						       ce_o2);
> > > > > @@ -2538,7 +2569,7 @@ static void guc_context_unpin(struct intel_context *ce)
> > > > >  	__guc_context_unpin(ce);
> > > > >  
> > > > >  	if (likely(!intel_context_is_barrier(ce)))
> > > > > -		intel_engine_pm_put(ce->engine);
> > > > > +		intel_engine_pm_put_async(ce->engine);
> > > > >  }
> > > > >  
> > > > >  static void guc_context_post_unpin(struct intel_context *ce)
> > > > > @@ -2665,11 +2696,11 @@ static void guc_parent_context_unpin(struct intel_context *ce)
> > > > >  
> > > > >  	for_each_engine_masked(engine, ce->engine->gt,
> > > > >  			       ce->engine->mask, tmp)
> > > > > -		intel_engine_pm_put(engine);
> > > > > +		intel_engine_pm_put_async(engine);
> > > > >  	for_each_child(ce, child)
> > > > >  		for_each_engine_masked(engine, child->engine->gt,
> > > > >  				       child->engine->mask, tmp)
> > > > > -			intel_engine_pm_put(engine);
> > > > > +			intel_engine_pm_put_async(engine);
> > > > >  }
> > > > >  
> > > > >  static void __guc_context_sched_enable(struct intel_guc *guc,
> > > > > @@ -2788,6 +2819,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> > > > >  
> > > > >  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > > > >  
> > > > > +	sched_disable_context_delete(ce);
> > > > > +
> > > > >  	with_intel_runtime_pm(runtime_pm, wakeref)
> > > > >  		__guc_context_sched_disable(guc, ce, guc_id);
> > > > >  
> > > > > @@ -2914,8 +2947,202 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> > > > >  								     1);
> > > > >  		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > > > >  	}
> > > > > +
> > > > > +	sched_disable_context_delete(ce);
> > > > > +}
> > > > > +
> > > > > +#define next_sched_disable_time(guc, now, ce) \
> > > > > +	(guc->sched_disable_delay_ns - \
> > > > > +	 (ktime_to_ns(now) - ktime_to_ns(ce->guc_sched_disable_time)))
> > > > > +static void ____sched_disable_context_delete(struct intel_guc *guc,
> > > > > +					     struct intel_context *ce)
> > > > > +{
> > > > > +	bool is_first;
> > > > > +
> > > > > +	lockdep_assert_held(&guc->sched_disable_lock);
> > > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > > +	GEM_BUG_ON(list_empty(&ce->guc_sched_disable_link));
> > > > > +
> > > > > +	is_first = list_is_first(&ce->guc_sched_disable_link,
> > > > > +				 &guc->sched_disable_list);
> > > > > +	list_del_init(&ce->guc_sched_disable_link);
> > > > > +	if (list_empty(&guc->sched_disable_list)) {
> > > > > +		hrtimer_try_to_cancel(&guc->sched_disable_timer);
> > > > > +	} else if (is_first) {
> > > > > +		struct intel_context *first =
> > > > > +			list_first_entry(&guc->sched_disable_list,
> > > > > +					 typeof(*first),
> > > > > +					 guc_sched_disable_link);
> > > > > +		u64 next_time = next_sched_disable_time(guc, ktime_get(),
> > > > > +							first);
> > > > > +
> > > > > +		hrtimer_start(&guc->sched_disable_timer,
> > > > > +			      ns_to_ktime(next_time),
> > > > > +			      HRTIMER_MODE_REL_PINNED);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static void __sched_disable_context_delete(struct intel_guc *guc,
> > > > > +					   struct intel_context *ce)
> > > > > +{
> > > > > +	lockdep_assert_held(&guc->sched_disable_lock);
> > > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > > +
> > > > > +	if (!list_empty(&ce->guc_sched_disable_link)) {
> > > > > +		intel_context_sched_disable_unpin(ce);
> > > > > +		____sched_disable_context_delete(guc, ce);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static void sched_disable_context_delete(struct intel_context *ce)
> > > > > +{
> > > > > +	struct intel_guc *guc = ce_to_guc(ce);
> > > > > +	unsigned long flags;
> > > > > +
> > > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > > +
> > > > > +	if (!list_empty(&ce->guc_sched_disable_link)) {
> > > > > +		spin_lock_irqsave(&guc->sched_disable_lock, flags);
> > > > > +		__sched_disable_context_delete(guc, ce);
> > > > > +		spin_unlock_irqrestore(&guc->sched_disable_lock, flags);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static void sched_disable_context_add(struct intel_guc *guc,
> > > > > +				      struct intel_context *ce)
> > > > > +{
> > > > > +	unsigned long flags;
> > > > > +
> > > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > > +	GEM_BUG_ON(!list_empty(&ce->guc_sched_disable_link));
> > > > > +
> > > > > +	ce->guc_sched_disable_time = ktime_get();
> > > > > +
> > > > > +	spin_lock_irqsave(&guc->sched_disable_lock, flags);
> > > > > +	if (list_empty(&guc->sched_disable_list))
> > > > > +		hrtimer_start(&guc->sched_disable_timer,
> > > > > +			      ns_to_ktime(guc->sched_disable_delay_ns),
> > > > > +			      HRTIMER_MODE_REL_PINNED);
> > > > > +	list_add_tail(&ce->guc_sched_disable_link, &guc->sched_disable_list);
> > > > > +	spin_unlock_irqrestore(&guc->sched_disable_lock, flags);
> > > > > +}
> > > > > +
> > > > > +static void sched_disable_contexts_flush(struct intel_guc *guc)
> > > > > +{
> > > > > +	struct intel_runtime_pm *runtime_pm = &guc_to_gt(guc)->i915->runtime_pm;
> > > > > +	struct intel_context *ce, *cn;
> > > > > +	unsigned long flags;
> > > > > +
> > > > > +	spin_lock_irqsave(&guc->sched_disable_lock, flags);
> > > > > +
> > > > > +	list_for_each_entry_safe_reverse(ce, cn, &guc->sched_disable_list,
> > > > > +					 guc_sched_disable_link) {
> > > > > +		intel_wakeref_t wakeref;
> > > > > +		bool enabled;
> > > > > +		u16 guc_id;
> > > > > +
> > > > > +		list_del_init(&ce->guc_sched_disable_link);
> > > > > +
> > > > > +		spin_lock(&ce->guc_state.lock);
> > > > > +		enabled = context_enabled(ce);
> > > > > +		if (unlikely(!enabled || submission_disabled(guc))) {
> > > > > +			if (enabled)
> > > > > +				clr_context_enabled(ce);
> > > > > +			spin_unlock(&ce->guc_state.lock);
> > > > > +			intel_context_sched_disable_unpin(ce);
> > > > > +			continue;
> > > > > +		}
> > > > > +		if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> > > > > +			spin_unlock(&ce->guc_state.lock);
> > > > > +			continue;
> > > > > +		}
> > > > > +		guc_id = prep_context_pending_disable(ce);
> > > > > +		spin_unlock(&ce->guc_state.lock);
> > > > > +
> > > > > +		with_intel_runtime_pm(runtime_pm, wakeref)
> > > > > +			__guc_context_sched_disable(guc, ce, guc_id);
> > > > > +	}
> > > > > +
> > > > > +	hrtimer_try_to_cancel(&guc->sched_disable_timer);
> > > > > +
> > > > > +	spin_unlock_irqrestore(&guc->sched_disable_lock, flags);
> > > > >  }
> > > > >  
> > > > > +#define should_sched_be_disabled(guc, now, ce) \
> > > > > +	((ktime_to_ns(now) - ktime_to_ns(ce->guc_sched_disable_time)) > \
> > > > > +	(guc->sched_disable_delay_ns / 4) * 3)
> > > > > +static enum hrtimer_restart sched_disable_timer_func(struct hrtimer *hrtimer)
> > > > > +{
> > > > > +	struct intel_guc *guc = container_of(hrtimer, struct intel_guc,
> > > > > +					     sched_disable_timer);
> > > > > +	struct intel_runtime_pm *runtime_pm = &guc_to_gt(guc)->i915->runtime_pm;
> > > > > +	struct intel_context *ce, *cn;
> > > > > +	unsigned long flags;
> > > > > +	ktime_t now;
> > > > > +
> > > > > +	if (list_empty(&guc->sched_disable_list))
> > > > > +		return HRTIMER_NORESTART;
> > > > > +
> > > > > +	now = ktime_get();
> > > > > +
> > > > > +	spin_lock_irqsave(&guc->sched_disable_lock, flags);
> > > > > +
> > > > > +	list_for_each_entry_safe_reverse(ce, cn, &guc->sched_disable_list,
> > > > > +					 guc_sched_disable_link) {
> > > > > +		intel_wakeref_t wakeref;
> > > > > +		bool enabled;
> > > > > +		u16 guc_id;
> > > > > +
> > > > > +		/*
> > > > > +		 * If a context has been waiting for 3/4 of its delay or more,
> > > > > +		 * issue the schedule disable. Using this heuristic allows more
> > > > > +		 * than 1 context to have its scheduling disabled when this
> > > > > +		 * timer is run.
> > > > > +		 */
> > > > > +		if (!should_sched_be_disabled(guc, now, ce))
> > > > > +			break;
> > > > > +
> > > > > +		list_del_init(&ce->guc_sched_disable_link);
> > > > > +
> > > > > +		spin_lock(&ce->guc_state.lock);
> > > > > +		enabled = context_enabled(ce);
> > > > > +		if (unlikely(!enabled || submission_disabled(guc))) {
> > > > > +			if (enabled)
> > > > > +				clr_context_enabled(ce);
> > > > > +			spin_unlock(&ce->guc_state.lock);
> > > > > +			intel_context_sched_disable_unpin(ce);
> > > > > +			continue;
> > > > > +		}
> > > > > +		if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> > > > > +			spin_unlock(&ce->guc_state.lock);
> > > > > +			continue;
> > > > > +		}
> > > > > +		guc_id = prep_context_pending_disable(ce);
> > > > > +		spin_unlock(&ce->guc_state.lock);
> > > > > +
> > > > > +		with_intel_runtime_pm(runtime_pm, wakeref)
> > > > > +			__guc_context_sched_disable(guc, ce, guc_id);
> > > > > +	}
> > > > > +
> > > > > +	if (!list_empty(&guc->sched_disable_list)) {
> > > > > +		struct intel_context *first =
> > > > > +			list_first_entry(&guc->sched_disable_list,
> > > > > +					 typeof(*first),
> > > > > +					 guc_sched_disable_link);
> > > > > +		u64 next_time = next_sched_disable_time(guc, now, first);
> > > > > +
> > > > > +		hrtimer_forward(hrtimer, now, ns_to_ktime(next_time));
> > > > > +		spin_unlock_irqrestore(&guc->sched_disable_lock, flags);
> > > > > +
> > > > > +		return HRTIMER_RESTART;
> > > > > +	} else {
> > > > > +		spin_unlock_irqrestore(&guc->sched_disable_lock, flags);
> > > > > +
> > > > > +		return HRTIMER_NORESTART;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +#define guc_id_pressure(max, in_use)	(in_use > (max / 4) * 3)
> > > > >  static void guc_context_sched_disable(struct intel_context *ce)
> > > > >  {
> > > > >  	struct intel_guc *guc = ce_to_guc(ce);
> > > > > @@ -2924,8 +3151,14 @@ static void guc_context_sched_disable(struct intel_context *ce)
> > > > >  	intel_wakeref_t wakeref;
> > > > >  	u16 guc_id;
> > > > >  	bool enabled;
> > > > > +	int guc_id_index = intel_context_is_parent(ce) ?
> > > > > +		GUC_SUBMIT_ENGINE_MULTI_LRC : GUC_SUBMIT_ENGINE_SINGLE_LRC;
> > > > > +	int max_guc_ids = intel_context_is_parent(ce) ?
> > > > > +	       NUMBER_MULTI_LRC_GUC_ID(guc) :
> > > > > +	       guc->num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc);
> > > > >  
> > > > >  	GEM_BUG_ON(intel_context_is_child(ce));
> > > > > +	GEM_BUG_ON(!list_empty(&ce->guc_sched_disable_link));
> > > > >  
> > > > >  	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
> > > > >  	    !lrc_desc_registered(guc, ce->guc_id)) {
> > > > > @@ -2936,6 +3169,18 @@ static void guc_context_sched_disable(struct intel_context *ce)
> > > > >  	if (!context_enabled(ce))
> > > > >  		goto unpin;
> > > > >  
> > > > > +	/*
> > > > > +	 * If no guc_id pressure and the context isn't closed we delay the
> > > > > +	 * schedule disable to not to continuously disable / enable scheduling
> > > > > +	 * putting pressure on both the i915 and GuC. Delay is configurable via
> > > > > +	 * debugfs, default 1s.
> > > > > +	 */
> > > > > +	if (!guc_id_pressure(max_guc_ids, guc->guc_ids_in_use[guc_id_index]) &&
> > > > > +	    !intel_context_is_closed(ce) && guc->sched_disable_delay_ns) {
> > > > > +		sched_disable_context_add(guc, ce);
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > >  	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > > > >  
> > > > >  	/*
> > > > > @@ -3294,6 +3539,58 @@ static void remove_from_context(struct i915_request *rq)
> > > > >  	i915_request_notify_execute_cb_imm(rq);
> > > > >  }
> > > > >  
> > > > > +static void __guc_context_close(struct intel_guc *guc,
> > > > > +				struct intel_context *ce)
> > > > > +{
> > > > > +	lockdep_assert_held(&guc->sched_disable_lock);
> > > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > > +
> > > > > +	if (!list_empty(&ce->guc_sched_disable_link)) {
> > > > > +		struct intel_runtime_pm *runtime_pm =
> > > > > +			ce->engine->uncore->rpm;
> > > > > +		intel_wakeref_t wakeref;
> > > > > +		bool enabled;
> > > > > +		u16 guc_id;
> > > > > +
> > > > > +		spin_lock(&ce->guc_state.lock);
> > > > > +		enabled = context_enabled(ce);
> > > > > +		if (unlikely(!enabled || submission_disabled(guc))) {
> > > > > +			if (enabled)
> > > > > +				clr_context_enabled(ce);
> > > > > +			spin_unlock(&ce->guc_state.lock);
> > > > > +			intel_context_sched_disable_unpin(ce);
> > > > > +			goto update_list;
> > > > > +		}
> > > > > +		if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> > > > > +			spin_unlock(&ce->guc_state.lock);
> > > > > +			goto update_list;
> > > > > +		}
> > > > > +		guc_id = prep_context_pending_disable(ce);
> > > > > +		spin_unlock(&ce->guc_state.lock);
> > > > > +
> > > > > +		with_intel_runtime_pm(runtime_pm, wakeref)
> > > > > +			__guc_context_sched_disable(guc, ce, guc_id);
> > > > > +update_list:
> > > > > +		____sched_disable_context_delete(guc, ce);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static void guc_context_close(struct intel_context *ce)
> > > > > +{
> > > > > +	struct intel_guc *guc = ce_to_guc(ce);
> > > > > +	unsigned long flags;
> > > > > +
> > > > > +	/*
> > > > > +	 * If we close the context and a schedule disable is pending a delay, do
> > > > > +	 * it immediately.
> > > > > +	 */
> > > > > +	if (!list_empty(&ce->guc_sched_disable_link)) {
> > > > > +		spin_lock_irqsave(&guc->sched_disable_lock, flags);
> > > > > +		__guc_context_close(guc, ce);
> > > > > +		spin_unlock_irqrestore(&guc->sched_disable_lock, flags);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > >  static struct intel_context *
> > > > >  guc_create_parallel(struct intel_engine_cs **engines,
> > > > >  		    unsigned int num_siblings,
> > > > > @@ -3308,6 +3605,7 @@ static const struct intel_context_ops guc_context_ops = {
> > > > >  	.post_unpin = guc_context_post_unpin,
> > > > >  
> > > > >  	.ban = guc_context_ban,
> > > > > +	.close = guc_context_close,
> > > > >  
> > > > >  	.cancel_request = guc_context_cancel_request,
> > > > >  
> > > > > @@ -3538,6 +3836,10 @@ static int guc_request_alloc(struct i915_request *rq)
> > > > >  
> > > > >  	rq->reserved_space -= GUC_REQUEST_SIZE;
> > > > >  
> > > > > +	GEM_BUG_ON(!list_empty(&ce->guc_sched_disable_link) &&
> > > > > +		   atomic_read(&ce->pin_count) < 3);
> > > > > +	sched_disable_context_delete(ce);
> > > > > +
> > > > >  	/*
> > > > >  	 * guc_ids are exhausted or a heuristic is met indicating too many
> > > > >  	 * guc_ids are waiting on requests with submission dependencies (not
> > > > > @@ -3667,7 +3969,7 @@ static void guc_virtual_context_unpin(struct intel_context *ce)
> > > > >  	__guc_context_unpin(ce);
> > > > >  
> > > > >  	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> > > > > -		intel_engine_pm_put(engine);
> > > > > +		intel_engine_pm_put_async(engine);
> > > > >  }
> > > > >  
> > > > >  static void guc_virtual_context_enter(struct intel_context *ce)
> > > > > @@ -3708,6 +4010,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
> > > > >  	.post_unpin = guc_context_post_unpin,
> > > > >  
> > > > >  	.ban = guc_context_ban,
> > > > > +	.close = guc_context_close,
> > > > >  
> > > > >  	.cancel_request = guc_context_cancel_request,
> > > > >  
> > > > > @@ -3819,6 +4122,7 @@ static const struct intel_context_ops virtual_parent_context_ops = {
> > > > >  	.post_unpin = guc_parent_context_post_unpin,
> > > > >  
> > > > >  	.ban = guc_context_ban,
> > > > > +	.close = guc_context_close,
> > > > >  
> > > > >  	.enter = guc_virtual_context_enter,
> > > > >  	.exit = guc_virtual_context_exit,
> > > > > @@ -4924,7 +5228,11 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
> > > > >  	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
> > > > >  		   atomic_read(&guc->outstanding_submission_g2h));
> > > > >  	drm_printf(p, "GuC Number GuC IDs: %d\n", guc->num_guc_ids);
> > > > > -	drm_printf(p, "GuC Max Number GuC IDs: %d\n\n", guc->max_guc_ids);
> > > > > +	drm_printf(p, "GuC Max Number GuC IDs: %d\n", guc->max_guc_ids);
> > > > > +	drm_printf(p, "GuC single-lrc GuC IDs in use: %d\n",
> > > > > +		   guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_SINGLE_LRC]);
> > > > > +	drm_printf(p, "GuC multi-lrc GuC IDs in use: %d\n",
> > > > > +		   guc->guc_ids_in_use[GUC_SUBMIT_ENGINE_MULTI_LRC]);
> > > > >  	drm_printf(p, "GuC max context registered: %u\n\n",
> > > > >  		   guc->lrcd_reg.max_idx);
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
> > > > > index 9cfecf9d368e..ad70b3159ce4 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
> > > > > @@ -174,7 +174,8 @@ static int multi_lrc_not_blocked(struct intel_gt *gt, bool flow_control)
> > > > >  #define NUM_RQ_PER_CONTEXT	2
> > > > >  #define HEARTBEAT_INTERVAL	1500
> > > > >  
> > > > > -static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids, bool hang)
> > > > > +static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids,
> > > > > +					bool hang, bool sched_disable_delay)
> > > > >  {
> > > > >  	struct intel_gt *gt = arg;
> > > > >  	struct intel_guc *guc = &gt->uc.guc;
> > > > > @@ -203,6 +204,9 @@ static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids, bool hang
> > > > >  	if (limit_guc_ids)
> > > > >  		guc->num_guc_ids = NUM_GUC_ID;
> > > > >  
> > > > > +	if (sched_disable_delay)
> > > > > +		guc->sched_disable_delay_ns = SCHED_DISABLE_DELAY_NS / 5;
> > > > > +
> > > > >  	ce = intel_context_create(intel_selftest_find_any_engine(gt));
> > > > >  	if (IS_ERR(ce)) {
> > > > >  		ret = PTR_ERR(ce);
> > > > > @@ -391,6 +395,7 @@ static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids, bool hang
> > > > >  	guc->num_guc_ids = guc->max_guc_ids;
> > > > >  	guc->gse_hang_expected = false;
> > > > >  	guc->inject_bad_sched_disable = false;
> > > > > +	guc->sched_disable_delay_ns = 0;
> > > > >  	kfree(contexts);
> > > > >  
> > > > >  	return ret;
> > > > > @@ -398,17 +403,22 @@ static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids, bool hang
> > > > >  
> > > > >  static int intel_guc_flow_control_guc_ids(void *arg)
> > > > >  {
> > > > > -	return __intel_guc_flow_control_guc(arg, true, false);
> > > > > +	return __intel_guc_flow_control_guc(arg, true, false, false);
> > > > > +}
> > > > > +
> > > > > +static int intel_guc_flow_control_guc_ids_sched_disable_delay(void *arg)
> > > > > +{
> > > > > +	return __intel_guc_flow_control_guc(arg, true, false, true);
> > > > >  }
> > > > >  
> > > > >  static int intel_guc_flow_control_lrcd_reg(void *arg)
> > > > >  {
> > > > > -	return __intel_guc_flow_control_guc(arg, false, false);
> > > > > +	return __intel_guc_flow_control_guc(arg, false, false, false);
> > > > >  }
> > > > >  
> > > > >  static int intel_guc_flow_control_hang_state_machine(void *arg)
> > > > >  {
> > > > > -	return __intel_guc_flow_control_guc(arg, true, true);
> > > > > +	return __intel_guc_flow_control_guc(arg, true, true, false);
> > > > >  }
> > > > >  
> > > > >  #define NUM_RQ_STRESS_CTBS	0x4000
> > > > > @@ -861,6 +871,7 @@ int intel_guc_flow_control(struct drm_i915_private *i915)
> > > > >  	static const struct i915_subtest tests[] = {
> > > > >  		SUBTEST(intel_guc_flow_control_stress_ctbs),
> > > > >  		SUBTEST(intel_guc_flow_control_guc_ids),
> > > > > +		SUBTEST(intel_guc_flow_control_guc_ids_sched_disable_delay),
> > > > >  		SUBTEST(intel_guc_flow_control_lrcd_reg),
> > > > >  		SUBTEST(intel_guc_flow_control_hang_state_machine),
> > > > >  		SUBTEST(intel_guc_flow_control_multi_lrc_guc_ids),
> > > > > diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
> > > > > index f54de0499be7..bf464db7affe 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_selftest.h
> > > > > +++ b/drivers/gpu/drm/i915/i915_selftest.h
> > > > > @@ -92,12 +92,14 @@ int __i915_subtests(const char *caller,
> > > > >  			T, ARRAY_SIZE(T), data)
> > > > >  #define i915_live_subtests(T, data) ({ \
> > > > >  	typecheck(struct drm_i915_private *, data); \
> > > > > +	(data)->gt.uc.guc.sched_disable_delay_ns = 0; \
> > > > >  	__i915_subtests(__func__, \
> > > > >  			__i915_live_setup, __i915_live_teardown, \
> > > > >  			T, ARRAY_SIZE(T), data); \
> > > > >  })
> > > > >  #define intel_gt_live_subtests(T, data) ({ \
> > > > >  	typecheck(struct intel_gt *, data); \
> > > > > +	(data)->uc.guc.sched_disable_delay_ns = 0; \
> > > > >  	__i915_subtests(__func__, \
> > > > >  			__intel_gt_live_setup, __intel_gt_live_teardown, \
> > > > >  			T, ARRAY_SIZE(T), data); \
> > > > > diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> > > > > index 806ad688274b..57ba7065d5ab 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_trace.h
> > > > > +++ b/drivers/gpu/drm/i915/i915_trace.h
> > > > > @@ -933,6 +933,11 @@ DEFINE_EVENT(intel_context, intel_context_reset,
> > > > >  	     TP_ARGS(ce)
> > > > >  );
> > > > >  
> > > > > +DEFINE_EVENT(intel_context, intel_context_close,
> > > > > +	     TP_PROTO(struct intel_context *ce),
> > > > > +	     TP_ARGS(ce)
> > > > > +);
> > > > > +
> > > > >  DEFINE_EVENT(intel_context, intel_context_ban,
> > > > >  	     TP_PROTO(struct intel_context *ce),
> > > > >  	     TP_ARGS(ce)
> > > > > @@ -1035,6 +1040,11 @@ trace_intel_context_reset(struct intel_context *ce)
> > > > >  {
> > > > >  }
> > > > >  
> > > > > +static inline void
> > > > > +trace_intel_context_close(struct intel_context *ce)
> > > > > +{
> > > > > +}
> > > > > +
> > > > >  static inline void
> > > > >  trace_intel_context_ban(struct intel_context *ce)
> > > > >  {
> > > > > diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > > > > index f843a5040706..d54c280217fe 100644
> > > > > --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > > > > +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > > > > @@ -2112,5 +2112,5 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
> > > > >  
> > > > >  	GEM_BUG_ON(offset_in_page(i915->ggtt.vm.total));
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > > > > index 9e9a6cb1d9e5..86bad00cca95 100644
> > > > > --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> > > > > +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > > > > @@ -431,7 +431,7 @@ int i915_perf_live_selftests(struct drm_i915_private *i915)
> > > > >  	if (err)
> > > > >  		return err;
> > > > >  
> > > > > -	err = i915_subtests(tests, i915);
> > > > > +	err = i915_live_subtests(tests, i915);
> > > > >  
> > > > >  	destroy_empty_config(&i915->perf);
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> > > > > index d67710d10615..afbf88865a8b 100644
> > > > > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > > > > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > > > > @@ -1693,7 +1693,7 @@ int i915_request_live_selftests(struct drm_i915_private *i915)
> > > > >  	if (intel_gt_is_wedged(&i915->gt))
> > > > >  		return 0;
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > >  
> > > > >  static int switch_to_kernel_sync(struct intel_context *ce, int err)
> > > > > diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > > > > index dd0607254a95..f4b157451851 100644
> > > > > --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> > > > > +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > > > > @@ -1085,5 +1085,5 @@ int i915_vma_live_selftests(struct drm_i915_private *i915)
> > > > >  		SUBTEST(igt_vma_remapped_gtt),
> > > > >  	};
> > > > >  
> > > > > -	return i915_subtests(tests, i915);
> > > > > +	return i915_live_subtests(tests, i915);
> > > > >  }
> > > > > -- 
> > > > > 2.28.0
> > > > > 
> > > > 
> > > > -- 
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
