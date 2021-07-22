Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE33D219B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E556EA41;
	Thu, 22 Jul 2021 10:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187C6EA3E;
 Thu, 22 Jul 2021 10:02:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="209714468"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="209714468"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 03:02:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470576974"
Received: from cstylian-mobl3.ger.corp.intel.com (HELO [10.213.198.98])
 ([10.213.198.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 03:02:57 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Ditch i915 globals shrink
 infrastructure
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210721183229.4136488-1-daniel.vetter@ffwll.ch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <591fb3fc-ca96-da18-a280-37304f5f920d@linux.intel.com>
Date: Thu, 22 Jul 2021 11:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721183229.4136488-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2021 19:32, Daniel Vetter wrote:
> This essentially reverts
> 
> commit 84a1074920523430f9dc30ff907f4801b4820072
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Wed Jan 24 11:36:08 2018 +0000
> 
>      drm/i915: Shrink the GEM kmem_caches upon idling
> 
> mm/vmscan.c:do_shrink_slab() is a thing, if there's an issue with it
> then we need to fix that there, not hand-roll our own slab shrinking
> code in i915.

This is somewhat incomplete statement which ignores a couple of angles 
so I wish there was a bit more time to respond before steam rolling it 
in. :(

The removed code was not a hand rolled shrinker, but about managing slab 
sizes in face of bursty workloads. Core code does not know when i915 is 
active and when it is idle, so calling kmem_cache_shrink() after going 
idle wass supposed to help with house keeping by doing house keeping 
work outside of the latency sensitive phase.

To "fix" (improve really) it in core as you suggest, would need some 
method of signaling when a slab user feels is an opportunte moment to do 
this house keeping. And kmem_cache_shrink is just that so I don't see 
the problem.

Granted, argument kmem_cache_shrink is not much used is a valid one so 
discussion overall is definitely valid. Becuase on the higher level we 
could definitely talk about which workloads actually benefit from this 
code and how much which probably no one knows at this point.

But in general I think you needed to leave more time for discussion. 12 
hours is way too short.

Regards,

Tvrtko

> Noticed while reviewing a patch set from Jason to fix up some issues
> in our i915_init() and i915_exit() module load/cleanup code. Now that
> i915_globals.c isn't any different than normal init/exit functions, we
> should convert them over to one unified table and remove
> i915_globals.[hc] entirely.
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 --
>   drivers/gpu/drm/i915/gem/i915_gem_object.c  |  6 --
>   drivers/gpu/drm/i915/gt/intel_context.c     |  6 --
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c       |  4 -
>   drivers/gpu/drm/i915/i915_active.c          |  6 --
>   drivers/gpu/drm/i915/i915_globals.c         | 95 ---------------------
>   drivers/gpu/drm/i915/i915_globals.h         |  3 -
>   drivers/gpu/drm/i915/i915_request.c         |  7 --
>   drivers/gpu/drm/i915/i915_scheduler.c       |  7 --
>   drivers/gpu/drm/i915/i915_vma.c             |  6 --
>   10 files changed, 146 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7d6f52d8a801..bf2a2319353a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -2280,18 +2280,12 @@ i915_gem_engines_iter_next(struct i915_gem_engines_iter *it)
>   #include "selftests/i915_gem_context.c"
>   #endif
>   
> -static void i915_global_gem_context_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_luts);
> -}
> -
>   static void i915_global_gem_context_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_luts);
>   }
>   
>   static struct i915_global_gem_context global = { {
> -	.shrink = i915_global_gem_context_shrink,
>   	.exit = i915_global_gem_context_exit,
>   } };
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 9da7b288b7ed..5c21cff33199 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -664,18 +664,12 @@ void i915_gem_init__objects(struct drm_i915_private *i915)
>   	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
>   }
>   
> -static void i915_global_objects_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_objects);
> -}
> -
>   static void i915_global_objects_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_objects);
>   }
>   
>   static struct i915_global_object global = { {
> -	.shrink = i915_global_objects_shrink,
>   	.exit = i915_global_objects_exit,
>   } };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index bd63813c8a80..c1338441cc1d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -398,18 +398,12 @@ void intel_context_fini(struct intel_context *ce)
>   	i915_active_fini(&ce->active);
>   }
>   
> -static void i915_global_context_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_ce);
> -}
> -
>   static void i915_global_context_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_ce);
>   }
>   
>   static struct i915_global_context global = { {
> -	.shrink = i915_global_context_shrink,
>   	.exit = i915_global_context_exit,
>   } };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index aef3084e8b16..d86825437516 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -67,8 +67,6 @@ static int __gt_unpark(struct intel_wakeref *wf)
>   
>   	GT_TRACE(gt, "\n");
>   
> -	i915_globals_unpark();
> -
>   	/*
>   	 * It seems that the DMC likes to transition between the DC states a lot
>   	 * when there are no connected displays (no active power domains) during
> @@ -116,8 +114,6 @@ static int __gt_park(struct intel_wakeref *wf)
>   	GEM_BUG_ON(!wakeref);
>   	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
>   
> -	i915_globals_park();
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index b1aa1c482c32..91723123ae9f 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -1176,18 +1176,12 @@ struct i915_active *i915_active_create(void)
>   #include "selftests/i915_active.c"
>   #endif
>   
> -static void i915_global_active_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_cache);
> -}
> -
>   static void i915_global_active_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_cache);
>   }
>   
>   static struct i915_global_active global = { {
> -	.shrink = i915_global_active_shrink,
>   	.exit = i915_global_active_exit,
>   } };
>   
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index 77f1911c463b..7fe2e503897b 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -17,61 +17,8 @@
>   
>   static LIST_HEAD(globals);
>   
> -static atomic_t active;
> -static atomic_t epoch;
> -static struct park_work {
> -	struct delayed_work work;
> -	struct rcu_head rcu;
> -	unsigned long flags;
> -#define PENDING 0
> -	int epoch;
> -} park;
> -
> -static void i915_globals_shrink(void)
> -{
> -	struct i915_global *global;
> -
> -	/*
> -	 * kmem_cache_shrink() discards empty slabs and reorders partially
> -	 * filled slabs to prioritise allocating from the mostly full slabs,
> -	 * with the aim of reducing fragmentation.
> -	 */
> -	list_for_each_entry(global, &globals, link)
> -		global->shrink();
> -}
> -
> -static void __i915_globals_grace(struct rcu_head *rcu)
> -{
> -	/* Ratelimit parking as shrinking is quite slow */
> -	schedule_delayed_work(&park.work, round_jiffies_up_relative(2 * HZ));
> -}
> -
> -static void __i915_globals_queue_rcu(void)
> -{
> -	park.epoch = atomic_inc_return(&epoch);
> -	if (!atomic_read(&active)) {
> -		init_rcu_head(&park.rcu);
> -		call_rcu(&park.rcu, __i915_globals_grace);
> -	}
> -}
> -
> -static void __i915_globals_park(struct work_struct *work)
> -{
> -	destroy_rcu_head(&park.rcu);
> -
> -	/* Confirm nothing woke up in the last grace period */
> -	if (park.epoch != atomic_read(&epoch)) {
> -		__i915_globals_queue_rcu();
> -		return;
> -	}
> -
> -	clear_bit(PENDING, &park.flags);
> -	i915_globals_shrink();
> -}
> -
>   void __init i915_global_register(struct i915_global *global)
>   {
> -	GEM_BUG_ON(!global->shrink);
>   	GEM_BUG_ON(!global->exit);
>   
>   	list_add_tail(&global->link, &globals);
> @@ -109,52 +56,10 @@ int __init i915_globals_init(void)
>   		}
>   	}
>   
> -	INIT_DELAYED_WORK(&park.work, __i915_globals_park);
>   	return 0;
>   }
>   
> -void i915_globals_park(void)
> -{
> -	/*
> -	 * Defer shrinking the global slab caches (and other work) until
> -	 * after a RCU grace period has completed with no activity. This
> -	 * is to try and reduce the latency impact on the consumers caused
> -	 * by us shrinking the caches the same time as they are trying to
> -	 * allocate, with the assumption being that if we idle long enough
> -	 * for an RCU grace period to elapse since the last use, it is likely
> -	 * to be longer until we need the caches again.
> -	 */
> -	if (!atomic_dec_and_test(&active))
> -		return;
> -
> -	/* Queue cleanup after the next RCU grace period has freed slabs */
> -	if (!test_and_set_bit(PENDING, &park.flags))
> -		__i915_globals_queue_rcu();
> -}
> -
> -void i915_globals_unpark(void)
> -{
> -	atomic_inc(&epoch);
> -	atomic_inc(&active);
> -}
> -
> -static void __exit __i915_globals_flush(void)
> -{
> -	atomic_inc(&active); /* skip shrinking */
> -
> -	rcu_barrier(); /* wait for the work to be queued */
> -	flush_delayed_work(&park.work);
> -
> -	atomic_dec(&active);
> -}
> -
>   void __exit i915_globals_exit(void)
>   {
> -	GEM_BUG_ON(atomic_read(&active));
> -
> -	__i915_globals_flush();
>   	__i915_globals_cleanup();
> -
> -	/* And ensure that our DESTROY_BY_RCU slabs are truly destroyed */
> -	rcu_barrier();
>   }
> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> index 2d199f411a4a..9e6b4fd07528 100644
> --- a/drivers/gpu/drm/i915/i915_globals.h
> +++ b/drivers/gpu/drm/i915/i915_globals.h
> @@ -14,15 +14,12 @@ typedef void (*i915_global_func_t)(void);
>   struct i915_global {
>   	struct list_head link;
>   
> -	i915_global_func_t shrink;
>   	i915_global_func_t exit;
>   };
>   
>   void i915_global_register(struct i915_global *global);
>   
>   int i915_globals_init(void);
> -void i915_globals_park(void);
> -void i915_globals_unpark(void);
>   void i915_globals_exit(void);
>   
>   /* constructors */
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 09ebea9a0090..d3de9f60e03a 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2077,12 +2077,6 @@ void i915_request_show(struct drm_printer *m,
>   #include "selftests/i915_request.c"
>   #endif
>   
> -static void i915_global_request_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_execute_cbs);
> -	kmem_cache_shrink(global.slab_requests);
> -}
> -
>   static void i915_global_request_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_execute_cbs);
> @@ -2090,7 +2084,6 @@ static void i915_global_request_exit(void)
>   }
>   
>   static struct i915_global_request global = { {
> -	.shrink = i915_global_request_shrink,
>   	.exit = i915_global_request_exit,
>   } };
>   
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> index 3a58a9130309..561c649e59f7 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.c
> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> @@ -475,12 +475,6 @@ i915_sched_engine_create(unsigned int subclass)
>   	return sched_engine;
>   }
>   
> -static void i915_global_scheduler_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_dependencies);
> -	kmem_cache_shrink(global.slab_priorities);
> -}
> -
>   static void i915_global_scheduler_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_dependencies);
> @@ -488,7 +482,6 @@ static void i915_global_scheduler_exit(void)
>   }
>   
>   static struct i915_global_scheduler global = { {
> -	.shrink = i915_global_scheduler_shrink,
>   	.exit = i915_global_scheduler_exit,
>   } };
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 5b9dce0f443b..09a7c47926f7 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1414,18 +1414,12 @@ void i915_vma_make_purgeable(struct i915_vma *vma)
>   #include "selftests/i915_vma.c"
>   #endif
>   
> -static void i915_global_vma_shrink(void)
> -{
> -	kmem_cache_shrink(global.slab_vmas);
> -}
> -
>   static void i915_global_vma_exit(void)
>   {
>   	kmem_cache_destroy(global.slab_vmas);
>   }
>   
>   static struct i915_global_vma global = { {
> -	.shrink = i915_global_vma_shrink,
>   	.exit = i915_global_vma_exit,
>   } };
>   
> 
