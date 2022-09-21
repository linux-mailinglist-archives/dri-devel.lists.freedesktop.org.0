Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8205BFC35
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 12:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE8510E2C2;
	Wed, 21 Sep 2022 10:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554AB10E10E;
 Wed, 21 Sep 2022 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663755557; x=1695291557;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=95W7BYZo7Z7JFkxNKf9P7VFejjIYuAimVKBnkWXyTUw=;
 b=jy4vjzzGDPvRppTf9tAUxEvsuM1DCRv5JvhEwKizyIRNX97zijLJrVqa
 DoPYizyK12OdQcurQKZBD3vDHrDSteUHYBVBng87VoeY0dnpOD7pPZ10d
 hughQsXgBdsqqVspVgg88mVdxotiredGQWBYPCk43wIghQ6W14TNf2ocX
 b/AWB96WoUd/vwQPeqtze9Opco+SZ7Z3S51rrYPBl2H85eqXrREmvjQGL
 vxOOql6v0julNCjnv/QMHRzdbx2j7ggxG9CLhM7N6A4TTiVaHDGf30CGx
 M8Mlw/RyjeHNZGpz97TFR8GaILNZ2E2TvvoXEkX9Kh3aC0xyNHdLRiRUm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="326273548"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="326273548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 03:18:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="570474035"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO [10.213.205.22])
 ([10.213.205.22])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 03:18:54 -0700
Message-ID: <f14f142b-c382-9592-ff3d-af9e69028f75@linux.intel.com>
Date: Wed, 21 Sep 2022 11:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [RFC v4 08/14] drm/i915/vm_bind: Abstract out common
 execbuf functions
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-9-niranjana.vishwanathapura@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220921070945.27764-9-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: daniel.vetter@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@intel.com, paulo.r.zanoni@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
> The new execbuf3 ioctl path and the legacy execbuf ioctl
> paths have many common functionalities.
> Share code between these two paths by abstracting out the
> common functionalities into a separate file where possible.

Looks like a good start to me. A couple comments/questions below.

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 507 ++---------------
>   .../drm/i915/gem/i915_gem_execbuffer_common.c | 530 ++++++++++++++++++
>   .../drm/i915/gem/i915_gem_execbuffer_common.h |  47 ++
>   4 files changed, 612 insertions(+), 473 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 9bf939ef18ea..bf952f478555 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -148,6 +148,7 @@ gem-y += \
>   	gem/i915_gem_create.o \
>   	gem/i915_gem_dmabuf.o \
>   	gem/i915_gem_domain.o \
> +	gem/i915_gem_execbuffer_common.o \
>   	gem/i915_gem_execbuffer.o \
>   	gem/i915_gem_internal.o \
>   	gem/i915_gem_object.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 33d989a20227..363b2a788cdf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -9,8 +9,6 @@
>   #include <linux/sync_file.h>
>   #include <linux/uaccess.h>
>   
> -#include <drm/drm_syncobj.h>
> -
>   #include "display/intel_frontbuffer.h"
>   
>   #include "gem/i915_gem_ioctls.h"
> @@ -28,6 +26,7 @@
>   #include "i915_file_private.h"
>   #include "i915_gem_clflush.h"
>   #include "i915_gem_context.h"
> +#include "i915_gem_execbuffer_common.h"
>   #include "i915_gem_evict.h"
>   #include "i915_gem_ioctls.h"
>   #include "i915_trace.h"
> @@ -235,13 +234,6 @@ enum {
>    * the batchbuffer in trusted mode, otherwise the ioctl is rejected.
>    */
>   
> -struct eb_fence {
> -	struct drm_syncobj *syncobj; /* Use with ptr_mask_bits() */
> -	struct dma_fence *dma_fence;
> -	u64 value;
> -	struct dma_fence_chain *chain_fence;
> -};
> -
>   struct i915_execbuffer {
>   	struct drm_i915_private *i915; /** i915 backpointer */
>   	struct drm_file *file; /** per-file lookup tables and limits */
> @@ -2446,164 +2438,29 @@ static const enum intel_engine_id user_ring_map[] = {
>   	[I915_EXEC_VEBOX]	= VECS0
>   };
>   
> -static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel_context *ce)
> -{
> -	struct intel_ring *ring = ce->ring;
> -	struct intel_timeline *tl = ce->timeline;
> -	struct i915_request *rq;
> -
> -	/*
> -	 * Completely unscientific finger-in-the-air estimates for suitable
> -	 * maximum user request size (to avoid blocking) and then backoff.
> -	 */
> -	if (intel_ring_update_space(ring) >= PAGE_SIZE)
> -		return NULL;
> -
> -	/*
> -	 * Find a request that after waiting upon, there will be at least half
> -	 * the ring available. The hysteresis allows us to compete for the
> -	 * shared ring and should mean that we sleep less often prior to
> -	 * claiming our resources, but not so long that the ring completely
> -	 * drains before we can submit our next request.
> -	 */
> -	list_for_each_entry(rq, &tl->requests, link) {
> -		if (rq->ring != ring)
> -			continue;
> -
> -		if (__intel_ring_space(rq->postfix,
> -				       ring->emit, ring->size) > ring->size / 2)
> -			break;
> -	}
> -	if (&rq->link == &tl->requests)
> -		return NULL; /* weird, we will check again later for real */
> -
> -	return i915_request_get(rq);
> -}
> -
> -static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
> -			   bool throttle)
> -{
> -	struct intel_timeline *tl;
> -	struct i915_request *rq = NULL;
> -
> -	/*
> -	 * Take a local wakeref for preparing to dispatch the execbuf as
> -	 * we expect to access the hardware fairly frequently in the
> -	 * process, and require the engine to be kept awake between accesses.
> -	 * Upon dispatch, we acquire another prolonged wakeref that we hold
> -	 * until the timeline is idle, which in turn releases the wakeref
> -	 * taken on the engine, and the parent device.
> -	 */
> -	tl = intel_context_timeline_lock(ce);
> -	if (IS_ERR(tl))
> -		return PTR_ERR(tl);
> -
> -	intel_context_enter(ce);
> -	if (throttle)
> -		rq = eb_throttle(eb, ce);
> -	intel_context_timeline_unlock(tl);
> -
> -	if (rq) {
> -		bool nonblock = eb->file->filp->f_flags & O_NONBLOCK;
> -		long timeout = nonblock ? 0 : MAX_SCHEDULE_TIMEOUT;
> -
> -		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
> -				      timeout) < 0) {
> -			i915_request_put(rq);
> -
> -			/*
> -			 * Error path, cannot use intel_context_timeline_lock as
> -			 * that is user interruptable and this clean up step
> -			 * must be done.
> -			 */
> -			mutex_lock(&ce->timeline->mutex);
> -			intel_context_exit(ce);
> -			mutex_unlock(&ce->timeline->mutex);
> -
> -			if (nonblock)
> -				return -EWOULDBLOCK;
> -			else
> -				return -EINTR;
> -		}
> -		i915_request_put(rq);
> -	}
> -
> -	return 0;
> -}
> -
>   static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle)
>   {
> -	struct intel_context *ce = eb->context, *child;
>   	int err;
> -	int i = 0, j = 0;
>   
>   	GEM_BUG_ON(eb->args->flags & __EXEC_ENGINE_PINNED);

You could avoid duplication by putting the common flags into the common 
header and then eb2 and eb3 add their own flags relative to the end of 
the last common entry.

>   
> -	if (unlikely(intel_context_is_banned(ce)))
> -		return -EIO;
> -
> -	/*
> -	 * Pinning the contexts may generate requests in order to acquire
> -	 * GGTT space, so do this first before we reserve a seqno for
> -	 * ourselves.
> -	 */
> -	err = intel_context_pin_ww(ce, &eb->ww);
> +	err = __eb_pin_engine(eb->context, &eb->ww, throttle,
> +			      eb->file->filp->f_flags & O_NONBLOCK);
>   	if (err)
>   		return err;
> -	for_each_child(ce, child) {
> -		err = intel_context_pin_ww(child, &eb->ww);
> -		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
> -	}
> -
> -	for_each_child(ce, child) {
> -		err = eb_pin_timeline(eb, child, throttle);
> -		if (err)
> -			goto unwind;
> -		++i;
> -	}
> -	err = eb_pin_timeline(eb, ce, throttle);
> -	if (err)
> -		goto unwind;
>   
>   	eb->args->flags |= __EXEC_ENGINE_PINNED;
>   	return 0;
> -
> -unwind:
> -	for_each_child(ce, child) {
> -		if (j++ < i) {
> -			mutex_lock(&child->timeline->mutex);
> -			intel_context_exit(child);
> -			mutex_unlock(&child->timeline->mutex);
> -		}
> -	}
> -	for_each_child(ce, child)
> -		intel_context_unpin(child);
> -	intel_context_unpin(ce);
> -	return err;
>   }
>   
>   static void eb_unpin_engine(struct i915_execbuffer *eb)
>   {
> -	struct intel_context *ce = eb->context, *child;
> -
>   	if (!(eb->args->flags & __EXEC_ENGINE_PINNED))
>   		return;
>   
>   	eb->args->flags &= ~__EXEC_ENGINE_PINNED;
>   
> -	for_each_child(ce, child) {
> -		mutex_lock(&child->timeline->mutex);
> -		intel_context_exit(child);
> -		mutex_unlock(&child->timeline->mutex);
> -
> -		intel_context_unpin(child);
> -	}
> -
> -	mutex_lock(&ce->timeline->mutex);
> -	intel_context_exit(ce);
> -	mutex_unlock(&ce->timeline->mutex);
> -
> -	intel_context_unpin(ce);
> +	__eb_unpin_engine(eb->context);
>   }
>   
>   static unsigned int
> @@ -2652,7 +2509,7 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
>   static int
>   eb_select_engine(struct i915_execbuffer *eb)
>   {
> -	struct intel_context *ce, *child;
> +	struct intel_context *ce;
>   	unsigned int idx;
>   	int err;
>   
> @@ -2677,36 +2534,10 @@ eb_select_engine(struct i915_execbuffer *eb)
>   	}
>   	eb->num_batches = ce->parallel.number_children + 1;
>   
> -	for_each_child(ce, child)
> -		intel_context_get(child);
> -	intel_gt_pm_get(ce->engine->gt);
> -
> -	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> -		err = intel_context_alloc_state(ce);
> -		if (err)
> -			goto err;
> -	}
> -	for_each_child(ce, child) {
> -		if (!test_bit(CONTEXT_ALLOC_BIT, &child->flags)) {
> -			err = intel_context_alloc_state(child);
> -			if (err)
> -				goto err;
> -		}
> -	}
> -
> -	/*
> -	 * ABI: Before userspace accesses the GPU (e.g. execbuffer), report
> -	 * EIO if the GPU is already wedged.
> -	 */
> -	err = intel_gt_terminally_wedged(ce->engine->gt);
> +	err = __eb_select_engine(ce);
>   	if (err)
>   		goto err;
>   
> -	if (!i915_vm_tryget(ce->vm)) {
> -		err = -ENOENT;
> -		goto err;
> -	}
> -
>   	eb->context = ce;
>   	eb->gt = ce->engine->gt;
>   
> @@ -2715,12 +2546,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>   	 * during ww handling. The pool is destroyed when last pm reference
>   	 * is dropped, which breaks our -EDEADLK handling.
>   	 */
> -	return err;
> +	return 0;
>   
>   err:
> -	intel_gt_pm_put(ce->engine->gt);
> -	for_each_child(ce, child)
> -		intel_context_put(child);
>   	intel_context_put(ce);
>   	return err;
>   }
> @@ -2728,24 +2556,7 @@ eb_select_engine(struct i915_execbuffer *eb)
>   static void
>   eb_put_engine(struct i915_execbuffer *eb)
>   {
> -	struct intel_context *child;
> -
> -	i915_vm_put(eb->context->vm);
> -	intel_gt_pm_put(eb->gt);
> -	for_each_child(eb->context, child)
> -		intel_context_put(child);
> -	intel_context_put(eb->context);
> -}
> -
> -static void
> -__free_fence_array(struct eb_fence *fences, unsigned int n)
> -{
> -	while (n--) {
> -		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
> -		dma_fence_put(fences[n].dma_fence);
> -		dma_fence_chain_free(fences[n].chain_fence);
> -	}
> -	kvfree(fences);
> +	__eb_put_engine(eb->context, eb->gt);
>   }
>   
>   static int
> @@ -2756,7 +2567,6 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   	u64 __user *user_values;
>   	struct eb_fence *f;
>   	u64 nfences;
> -	int err = 0;
>   
>   	nfences = timeline_fences->fence_count;
>   	if (!nfences)
> @@ -2791,9 +2601,9 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   
>   	while (nfences--) {
>   		struct drm_i915_gem_exec_fence user_fence;
> -		struct drm_syncobj *syncobj;
> -		struct dma_fence *fence = NULL;
> +		bool wait, signal;
>   		u64 point;
> +		int ret;
>   
>   		if (__copy_from_user(&user_fence,
>   				     user_fences++,
> @@ -2806,70 +2616,15 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   		if (__get_user(point, user_values++))
>   			return -EFAULT;
>   
> -		syncobj = drm_syncobj_find(eb->file, user_fence.handle);
> -		if (!syncobj) {
> -			DRM_DEBUG("Invalid syncobj handle provided\n");
> -			return -ENOENT;
> -		}
> -
> -		fence = drm_syncobj_fence_get(syncobj);
> -
> -		if (!fence && user_fence.flags &&
> -		    !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			DRM_DEBUG("Syncobj handle has no fence\n");
> -			drm_syncobj_put(syncobj);
> -			return -EINVAL;
> -		}
> -
> -		if (fence)
> -			err = dma_fence_chain_find_seqno(&fence, point);
> -
> -		if (err && !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			DRM_DEBUG("Syncobj handle missing requested point %llu\n", point);
> -			dma_fence_put(fence);
> -			drm_syncobj_put(syncobj);
> -			return err;
> -		}
> -
> -		/*
> -		 * A point might have been signaled already and
> -		 * garbage collected from the timeline. In this case
> -		 * just ignore the point and carry on.
> -		 */
> -		if (!fence && !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			drm_syncobj_put(syncobj);
> +		wait = user_fence.flags & I915_EXEC_FENCE_WAIT;
> +		signal = user_fence.flags & I915_EXEC_FENCE_SIGNAL;
> +		ret = add_timeline_fence(eb->file, user_fence.handle, point,
> +					 f, wait, signal);
> +		if (ret < 0)
> +			return ret;
> +		else if (!ret)
>   			continue;
> -		}
>   
> -		/*
> -		 * For timeline syncobjs we need to preallocate chains for
> -		 * later signaling.
> -		 */
> -		if (point != 0 && user_fence.flags & I915_EXEC_FENCE_SIGNAL) {
> -			/*
> -			 * Waiting and signaling the same point (when point !=
> -			 * 0) would break the timeline.
> -			 */
> -			if (user_fence.flags & I915_EXEC_FENCE_WAIT) {
> -				DRM_DEBUG("Trying to wait & signal the same timeline point.\n");
> -				dma_fence_put(fence);
> -				drm_syncobj_put(syncobj);
> -				return -EINVAL;
> -			}
> -
> -			f->chain_fence = dma_fence_chain_alloc();
> -			if (!f->chain_fence) {
> -				drm_syncobj_put(syncobj);
> -				dma_fence_put(fence);
> -				return -ENOMEM;
> -			}
> -		} else {
> -			f->chain_fence = NULL;
> -		}
> -
> -		f->syncobj = ptr_pack_bits(syncobj, user_fence.flags, 2);
> -		f->dma_fence = fence;
> -		f->value = point;
>   		f++;
>   		eb->num_fences++;
>   	}
> @@ -2949,65 +2704,6 @@ static int add_fence_array(struct i915_execbuffer *eb)
>   	return 0;
>   }
>   
> -static void put_fence_array(struct eb_fence *fences, int num_fences)
> -{
> -	if (fences)
> -		__free_fence_array(fences, num_fences);
> -}
> -
> -static int
> -await_fence_array(struct i915_execbuffer *eb,
> -		  struct i915_request *rq)
> -{
> -	unsigned int n;
> -	int err;
> -
> -	for (n = 0; n < eb->num_fences; n++) {
> -		struct drm_syncobj *syncobj;
> -		unsigned int flags;
> -
> -		syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
> -
> -		if (!eb->fences[n].dma_fence)
> -			continue;
> -
> -		err = i915_request_await_dma_fence(rq, eb->fences[n].dma_fence);
> -		if (err < 0)
> -			return err;
> -	}
> -
> -	return 0;
> -}
> -
> -static void signal_fence_array(const struct i915_execbuffer *eb,
> -			       struct dma_fence * const fence)
> -{
> -	unsigned int n;
> -
> -	for (n = 0; n < eb->num_fences; n++) {
> -		struct drm_syncobj *syncobj;
> -		unsigned int flags;
> -
> -		syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
> -		if (!(flags & I915_EXEC_FENCE_SIGNAL))
> -			continue;
> -
> -		if (eb->fences[n].chain_fence) {
> -			drm_syncobj_add_point(syncobj,
> -					      eb->fences[n].chain_fence,
> -					      fence,
> -					      eb->fences[n].value);
> -			/*
> -			 * The chain's ownership is transferred to the
> -			 * timeline.
> -			 */
> -			eb->fences[n].chain_fence = NULL;
> -		} else {
> -			drm_syncobj_replace_fence(syncobj, fence);
> -		}
> -	}
> -}
> -
>   static int
>   parse_timeline_fences(struct i915_user_extension __user *ext, void *data)
>   {
> @@ -3020,80 +2716,6 @@ parse_timeline_fences(struct i915_user_extension __user *ext, void *data)
>   	return add_timeline_fence_array(eb, &timeline_fences);
>   }
>   
> -static void retire_requests(struct intel_timeline *tl, struct i915_request *end)
> -{
> -	struct i915_request *rq, *rn;
> -
> -	list_for_each_entry_safe(rq, rn, &tl->requests, link)
> -		if (rq == end || !i915_request_retire(rq))
> -			break;
> -}
> -
> -static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
> -			  int err, bool last_parallel)
> -{
> -	struct intel_timeline * const tl = i915_request_timeline(rq);
> -	struct i915_sched_attr attr = {};
> -	struct i915_request *prev;
> -
> -	lockdep_assert_held(&tl->mutex);
> -	lockdep_unpin_lock(&tl->mutex, rq->cookie);
> -
> -	trace_i915_request_add(rq);
> -
> -	prev = __i915_request_commit(rq);
> -
> -	/* Check that the context wasn't destroyed before submission */
> -	if (likely(!intel_context_is_closed(eb->context))) {
> -		attr = eb->gem_context->sched;
> -	} else {
> -		/* Serialise with context_close via the add_to_timeline */
> -		i915_request_set_error_once(rq, -ENOENT);
> -		__i915_request_skip(rq);
> -		err = -ENOENT; /* override any transient errors */
> -	}
> -
> -	if (intel_context_is_parallel(eb->context)) {
> -		if (err) {
> -			__i915_request_skip(rq);
> -			set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
> -				&rq->fence.flags);
> -		}
> -		if (last_parallel)
> -			set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
> -				&rq->fence.flags);
> -	}
> -
> -	__i915_request_queue(rq, &attr);
> -
> -	/* Try to clean up the client's timeline after submitting the request */
> -	if (prev)
> -		retire_requests(tl, prev);
> -
> -	mutex_unlock(&tl->mutex);
> -
> -	return err;
> -}
> -
> -static int eb_requests_add(struct i915_execbuffer *eb, int err)
> -{
> -	int i;
> -
> -	/*
> -	 * We iterate in reverse order of creation to release timeline mutexes in
> -	 * same order.
> -	 */
> -	for_each_batch_add_order(eb, i) {
> -		struct i915_request *rq = eb->requests[i];
> -
> -		if (!rq)
> -			continue;
> -		err |= eb_request_add(eb, rq, err, i == 0);
> -	}
> -
> -	return err;
> -}
> -
>   static const i915_user_extension_fn execbuf_extensions[] = {
>   	[DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES] = parse_timeline_fences,
>   };
> @@ -3120,73 +2742,26 @@ parse_execbuf2_extensions(struct drm_i915_gem_execbuffer2 *args,
>   				    eb);
>   }
>   
> -static void eb_requests_get(struct i915_execbuffer *eb)
> -{
> -	unsigned int i;
> -
> -	for_each_batch_create_order(eb, i) {
> -		if (!eb->requests[i])
> -			break;
> -
> -		i915_request_get(eb->requests[i]);
> -	}
> -}
> -
> -static void eb_requests_put(struct i915_execbuffer *eb)
> -{
> -	unsigned int i;
> -
> -	for_each_batch_create_order(eb, i) {
> -		if (!eb->requests[i])
> -			break;
> -
> -		i915_request_put(eb->requests[i]);
> -	}
> -}
> -
>   static struct sync_file *
>   eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
>   {
>   	struct sync_file *out_fence = NULL;
> -	struct dma_fence_array *fence_array;
> -	struct dma_fence **fences;
> -	unsigned int i;
> -
> -	GEM_BUG_ON(!intel_context_is_parent(eb->context));
> +	struct dma_fence *fence;
>   
> -	fences = kmalloc_array(eb->num_batches, sizeof(*fences), GFP_KERNEL);
> -	if (!fences)
> -		return ERR_PTR(-ENOMEM);
> -
> -	for_each_batch_create_order(eb, i) {
> -		fences[i] = &eb->requests[i]->fence;
> -		__set_bit(I915_FENCE_FLAG_COMPOSITE,
> -			  &eb->requests[i]->fence.flags);
> -	}
> -
> -	fence_array = dma_fence_array_create(eb->num_batches,
> -					     fences,
> -					     eb->context->parallel.fence_context,
> -					     eb->context->parallel.seqno++,
> -					     false);
> -	if (!fence_array) {
> -		kfree(fences);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	/* Move ownership to the dma_fence_array created above */
> -	for_each_batch_create_order(eb, i)
> -		dma_fence_get(fences[i]);
> +	fence = __eb_composite_fence_create(eb->requests, eb->num_batches,
> +					    eb->context);
> +	if (IS_ERR(fence))
> +		return ERR_CAST(fence);
>   
>   	if (out_fence_fd != -1) {
> -		out_fence = sync_file_create(&fence_array->base);
> +		out_fence = sync_file_create(fence);
>   		/* sync_file now owns fence_arry, drop creation ref */
> -		dma_fence_put(&fence_array->base);
> +		dma_fence_put(fence);
>   		if (!out_fence)
>   			return ERR_PTR(-ENOMEM);
>   	}
>   
> -	eb->composite_fence = &fence_array->base;
> +	eb->composite_fence = fence;
>   
>   	return out_fence;
>   }
> @@ -3218,7 +2793,7 @@ eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq,
>   	}
>   
>   	if (eb->fences) {
> -		err = await_fence_array(eb, rq);
> +		err = await_fence_array(eb->fences, eb->num_fences, rq);
>   		if (err)
>   			return ERR_PTR(err);
>   	}
> @@ -3236,23 +2811,6 @@ eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq,
>   	return out_fence;
>   }
>   
> -static struct intel_context *
> -eb_find_context(struct i915_execbuffer *eb, unsigned int context_number)
> -{
> -	struct intel_context *child;
> -
> -	if (likely(context_number == 0))
> -		return eb->context;
> -
> -	for_each_child(eb->context, child)
> -		if (!--context_number)
> -			return child;
> -
> -	GEM_BUG_ON("Context not found");
> -
> -	return NULL;
> -}
> -
>   static struct sync_file *
>   eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
>   		   int out_fence_fd)
> @@ -3262,7 +2820,8 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
>   
>   	for_each_batch_create_order(eb, i) {
>   		/* Allocate a request for this batch buffer nice and early. */
> -		eb->requests[i] = i915_request_create(eb_find_context(eb, i));
> +		eb->requests[i] =
> +			i915_request_create(eb_find_context(eb->context, i));
>   		if (IS_ERR(eb->requests[i])) {
>   			out_fence = ERR_CAST(eb->requests[i]);
>   			eb->requests[i] = NULL;
> @@ -3442,11 +3001,13 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	err = eb_submit(&eb);
>   
>   err_request:
> -	eb_requests_get(&eb);
> -	err = eb_requests_add(&eb, err);
> +	eb_requests_get(eb.requests, eb.num_batches);
> +	err = eb_requests_add(eb.requests, eb.num_batches, eb.context,
> +			      eb.gem_context->sched, err);
>   
>   	if (eb.fences)
> -		signal_fence_array(&eb, eb.composite_fence ?
> +		signal_fence_array(eb.fences, eb.num_fences,
> +				   eb.composite_fence ?
>   				   eb.composite_fence :
>   				   &eb.requests[0]->fence);
>   
> @@ -3471,7 +3032,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	if (!out_fence && eb.composite_fence)
>   		dma_fence_put(eb.composite_fence);
>   
> -	eb_requests_put(&eb);
> +	eb_requests_put(eb.requests, eb.num_batches);
>   
>   err_vma:
>   	eb_release_vmas(&eb, true);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
> new file mode 100644
> index 000000000000..167268dfd930
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
> @@ -0,0 +1,530 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <linux/dma-fence-array.h>
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_pm.h"
> +#include "gt/intel_ring.h"
> +
> +#include "i915_gem_execbuffer_common.h"
> +
> +#define __EXEC_COMMON_FENCE_WAIT	BIT(0)
> +#define __EXEC_COMMON_FENCE_SIGNAL	BIT(1)
> +
> +static struct i915_request *eb_throttle(struct intel_context *ce)
> +{
> +	struct intel_ring *ring = ce->ring;
> +	struct intel_timeline *tl = ce->timeline;
> +	struct i915_request *rq;
> +
> +	/*
> +	 * Completely unscientific finger-in-the-air estimates for suitable
> +	 * maximum user request size (to avoid blocking) and then backoff.
> +	 */
> +	if (intel_ring_update_space(ring) >= PAGE_SIZE)
> +		return NULL;
> +
> +	/*
> +	 * Find a request that after waiting upon, there will be at least half
> +	 * the ring available. The hysteresis allows us to compete for the
> +	 * shared ring and should mean that we sleep less often prior to
> +	 * claiming our resources, but not so long that the ring completely
> +	 * drains before we can submit our next request.
> +	 */
> +	list_for_each_entry(rq, &tl->requests, link) {
> +		if (rq->ring != ring)
> +			continue;
> +
> +		if (__intel_ring_space(rq->postfix,
> +				       ring->emit, ring->size) > ring->size / 2)
> +			break;
> +	}
> +	if (&rq->link == &tl->requests)
> +		return NULL; /* weird, we will check again later for real */
> +
> +	return i915_request_get(rq);
> +}
> +
> +static int eb_pin_timeline(struct intel_context *ce, bool throttle,
> +			   bool nonblock)
> +{
> +	struct intel_timeline *tl;
> +	struct i915_request *rq = NULL;
> +
> +	/*
> +	 * Take a local wakeref for preparing to dispatch the execbuf as
> +	 * we expect to access the hardware fairly frequently in the
> +	 * process, and require the engine to be kept awake between accesses.
> +	 * Upon dispatch, we acquire another prolonged wakeref that we hold
> +	 * until the timeline is idle, which in turn releases the wakeref
> +	 * taken on the engine, and the parent device.
> +	 */
> +	tl = intel_context_timeline_lock(ce);
> +	if (IS_ERR(tl))
> +		return PTR_ERR(tl);
> +
> +	intel_context_enter(ce);
> +	if (throttle)
> +		rq = eb_throttle(ce);
> +	intel_context_timeline_unlock(tl);
> +
> +	if (rq) {
> +		long timeout = nonblock ? 0 : MAX_SCHEDULE_TIMEOUT;
> +
> +		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
> +				      timeout) < 0) {
> +			i915_request_put(rq);
> +
> +			/*
> +			 * Error path, cannot use intel_context_timeline_lock as
> +			 * that is user interruptable and this clean up step
> +			 * must be done.
> +			 */
> +			mutex_lock(&ce->timeline->mutex);
> +			intel_context_exit(ce);
> +			mutex_unlock(&ce->timeline->mutex);
> +
> +			if (nonblock)
> +				return -EWOULDBLOCK;
> +			else
> +				return -EINTR;
> +		}
> +		i915_request_put(rq);
> +	}
> +
> +	return 0;
> +}
> +
> +int __eb_pin_engine(struct intel_context *ce, struct i915_gem_ww_ctx *ww,
> +		    bool throttle, bool nonblock)
> +{
> +	struct intel_context *child;
> +	int err;
> +	int i = 0, j = 0;
> +
> +	if (unlikely(intel_context_is_banned(ce)))
> +		return -EIO;
> +
> +	/*
> +	 * Pinning the contexts may generate requests in order to acquire
> +	 * GGTT space, so do this first before we reserve a seqno for
> +	 * ourselves.
> +	 */
> +	err = intel_context_pin_ww(ce, ww);
> +	if (err)
> +		return err;
> +
> +	for_each_child(ce, child) {
> +		err = intel_context_pin_ww(child, ww);
> +		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
> +	}
> +
> +	for_each_child(ce, child) {
> +		err = eb_pin_timeline(child, throttle, nonblock);
> +		if (err)
> +			goto unwind;
> +		++i;
> +	}
> +	err = eb_pin_timeline(ce, throttle, nonblock);
> +	if (err)
> +		goto unwind;
> +
> +	return 0;
> +
> +unwind:
> +	for_each_child(ce, child) {
> +		if (j++ < i) {
> +			mutex_lock(&child->timeline->mutex);
> +			intel_context_exit(child);
> +			mutex_unlock(&child->timeline->mutex);
> +		}
> +	}
> +	for_each_child(ce, child)
> +		intel_context_unpin(child);
> +	intel_context_unpin(ce);
> +	return err;
> +}
> +
> +void __eb_unpin_engine(struct intel_context *ce)
> +{
> +	struct intel_context *child;
> +
> +	for_each_child(ce, child) {
> +		mutex_lock(&child->timeline->mutex);
> +		intel_context_exit(child);
> +		mutex_unlock(&child->timeline->mutex);
> +
> +		intel_context_unpin(child);
> +	}
> +
> +	mutex_lock(&ce->timeline->mutex);
> +	intel_context_exit(ce);
> +	mutex_unlock(&ce->timeline->mutex);
> +
> +	intel_context_unpin(ce);
> +}
> +
> +struct intel_context *
> +eb_find_context(struct intel_context *context, unsigned int context_number)
> +{
> +	struct intel_context *child;
> +
> +	if (likely(context_number == 0))
> +		return context;
> +
> +	for_each_child(context, child)
> +		if (!--context_number)
> +			return child;
> +
> +	GEM_BUG_ON("Context not found");
> +
> +	return NULL;
> +}
> +
> +static void __free_fence_array(struct eb_fence *fences, u64 n)
> +{
> +	while (n--) {
> +		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
> +		dma_fence_put(fences[n].dma_fence);
> +		dma_fence_chain_free(fences[n].chain_fence);
> +	}
> +	kvfree(fences);
> +}
> +
> +void put_fence_array(struct eb_fence *fences, u64 num_fences)
> +{
> +	if (fences)
> +		__free_fence_array(fences, num_fences);
> +}
> +
> +int add_timeline_fence(struct drm_file *file, u32 handle, u64 point,
> +		       struct eb_fence *f, bool wait, bool signal)
> +{
> +	struct drm_syncobj *syncobj;
> +	struct dma_fence *fence = NULL;
> +	u32 flags = 0;
> +	int err = 0;
> +
> +	syncobj = drm_syncobj_find(file, handle);
> +	if (!syncobj) {
> +		DRM_DEBUG("Invalid syncobj handle provided\n");
> +		return -ENOENT;
> +	}
> +
> +	fence = drm_syncobj_fence_get(syncobj);
> +
> +	if (!fence && wait && !signal) {
> +		DRM_DEBUG("Syncobj handle has no fence\n");
> +		drm_syncobj_put(syncobj);
> +		return -EINVAL;
> +	}
> +
> +	if (fence)
> +		err = dma_fence_chain_find_seqno(&fence, point);
> +
> +	if (err && !signal) {
> +		DRM_DEBUG("Syncobj handle missing requested point %llu\n", point);
> +		dma_fence_put(fence);
> +		drm_syncobj_put(syncobj);
> +		return err;
> +	}
> +
> +	/*
> +	 * A point might have been signaled already and
> +	 * garbage collected from the timeline. In this case
> +	 * just ignore the point and carry on.
> +	 */
> +	if (!fence && !signal) {
> +		drm_syncobj_put(syncobj);
> +		return 0;
> +	}
> +
> +	/*
> +	 * For timeline syncobjs we need to preallocate chains for
> +	 * later signaling.
> +	 */
> +	if (point != 0 && signal) {
> +		/*
> +		 * Waiting and signaling the same point (when point !=
> +		 * 0) would break the timeline.
> +		 */
> +		if (wait) {
> +			DRM_DEBUG("Trying to wait & signal the same timeline point.\n");
> +			dma_fence_put(fence);
> +			drm_syncobj_put(syncobj);
> +			return -EINVAL;
> +		}
> +
> +		f->chain_fence = dma_fence_chain_alloc();
> +		if (!f->chain_fence) {
> +			drm_syncobj_put(syncobj);
> +			dma_fence_put(fence);
> +			return -ENOMEM;
> +		}
> +	} else {
> +		f->chain_fence = NULL;
> +	}
> +
> +	flags |= wait ? __EXEC_COMMON_FENCE_WAIT : 0;
> +	flags |= signal ? __EXEC_COMMON_FENCE_SIGNAL : 0;
> +
> +	f->syncobj = ptr_pack_bits(syncobj, flags, 2);
> +	f->dma_fence = fence;
> +	f->value = point;
> +	return 1;
> +}
> +
> +int await_fence_array(struct eb_fence *fences, u64 num_fences,
> +		      struct i915_request *rq)
> +{
> +	unsigned int n;
> +
> +	for (n = 0; n < num_fences; n++) {
> +		struct drm_syncobj *syncobj;
> +		unsigned int flags;
> +		int err;
> +
> +		syncobj = ptr_unpack_bits(fences[n].syncobj, &flags, 2);
> +
> +		if (!fences[n].dma_fence)
> +			continue;
> +
> +		err = i915_request_await_dma_fence(rq, fences[n].dma_fence);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +void signal_fence_array(struct eb_fence *fences, u64 num_fences,
> +			struct dma_fence * const fence)
> +{
> +	unsigned int n;
> +
> +	for (n = 0; n < num_fences; n++) {
> +		struct drm_syncobj *syncobj;
> +		unsigned int flags;
> +
> +		syncobj = ptr_unpack_bits(fences[n].syncobj, &flags, 2);
> +		if (!(flags & __EXEC_COMMON_FENCE_SIGNAL))
> +			continue;
> +
> +		if (fences[n].chain_fence) {
> +			drm_syncobj_add_point(syncobj,
> +					      fences[n].chain_fence,
> +					      fence,
> +					      fences[n].value);
> +			/*
> +			 * The chain's ownership is transferred to the
> +			 * timeline.
> +			 */
> +			fences[n].chain_fence = NULL;
> +		} else {
> +			drm_syncobj_replace_fence(syncobj, fence);
> +		}
> +	}
> +}
> +
> +/*
> + * Using two helper loops for the order of which requests / batches are created
> + * and added the to backend. Requests are created in order from the parent to
> + * the last child. Requests are added in the reverse order, from the last child
> + * to parent. This is done for locking reasons as the timeline lock is acquired
> + * during request creation and released when the request is added to the
> + * backend. To make lockdep happy (see intel_context_timeline_lock) this must be
> + * the ordering.
> + */
> +#define for_each_batch_create_order(_num_batches) \
> +	for (unsigned int i = 0; i < (_num_batches); ++i)
> +#define for_each_batch_add_order(_num_batches) \
> +	for (int i = (_num_batches) - 1; i >= 0; --i)
> +
> +static void retire_requests(struct intel_timeline *tl, struct i915_request *end)
> +{
> +	struct i915_request *rq, *rn;
> +
> +	list_for_each_entry_safe(rq, rn, &tl->requests, link)
> +		if (rq == end || !i915_request_retire(rq))
> +			break;
> +}
> +
> +static int eb_request_add(struct intel_context *context,
> +			  struct i915_request *rq,
> +			  struct i915_sched_attr sched,
> +			  int err, bool last_parallel)
> +{
> +	struct intel_timeline * const tl = i915_request_timeline(rq);
> +	struct i915_sched_attr attr = {};
> +	struct i915_request *prev;
> +
> +	lockdep_assert_held(&tl->mutex);
> +	lockdep_unpin_lock(&tl->mutex, rq->cookie);
> +
> +	trace_i915_request_add(rq);
> +
> +	prev = __i915_request_commit(rq);
> +
> +	/* Check that the context wasn't destroyed before submission */
> +	if (likely(!intel_context_is_closed(context))) {
> +		attr = sched;
> +	} else {
> +		/* Serialise with context_close via the add_to_timeline */
> +		i915_request_set_error_once(rq, -ENOENT);
> +		__i915_request_skip(rq);
> +		err = -ENOENT; /* override any transient errors */
> +	}
> +
> +	if (intel_context_is_parallel(context)) {
> +		if (err) {
> +			__i915_request_skip(rq);
> +			set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
> +				&rq->fence.flags);
> +		}
> +		if (last_parallel)
> +			set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
> +				&rq->fence.flags);
> +	}
> +
> +	__i915_request_queue(rq, &attr);
> +
> +	/* Try to clean up the client's timeline after submitting the request */
> +	if (prev)
> +		retire_requests(tl, prev);
> +
> +	mutex_unlock(&tl->mutex);
> +
> +	return err;
> +}
> +
> +int eb_requests_add(struct i915_request **requests, unsigned int num_batches,
> +		    struct intel_context *context, struct i915_sched_attr sched,
> +		    int err)
> +{
> +	/*
> +	 * We iterate in reverse order of creation to release timeline mutexes
> +	 * in same order.
> +	 */
> +	for_each_batch_add_order(num_batches) {
> +		struct i915_request *rq = requests[i];
> +
> +		if (!rq)
> +			continue;
> +
> +		err = eb_request_add(context, rq, sched, err, i == 0);
> +	}
> +
> +	return err;
> +}
> +
> +void eb_requests_get(struct i915_request **requests, unsigned int num_batches)
> +{
> +	for_each_batch_create_order(num_batches) {
> +		if (!requests[i])
> +			break;
> +
> +		i915_request_get(requests[i]);
> +	}
> +}
> +
> +void eb_requests_put(struct i915_request **requests, unsigned int num_batches)
> +{
> +	for_each_batch_create_order(num_batches) {
> +		if (!requests[i])
> +			break;
> +
> +		i915_request_put(requests[i]);
> +	}
> +}
> +
> +struct dma_fence *__eb_composite_fence_create(struct i915_request **requests,
> +					      unsigned int num_batches,
> +					      struct intel_context *context)
> +{
> +	struct dma_fence_array *fence_array;
> +	struct dma_fence **fences;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(context));
> +
> +	fences = kmalloc_array(num_batches, sizeof(*fences), GFP_KERNEL);
> +	if (!fences)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for_each_batch_create_order(num_batches) {
> +		fences[i] = &requests[i]->fence;
> +		__set_bit(I915_FENCE_FLAG_COMPOSITE,
> +			  &requests[i]->fence.flags);
> +	}
> +
> +	fence_array = dma_fence_array_create(num_batches,
> +					     fences,
> +					     context->parallel.fence_context,
> +					     context->parallel.seqno++,
> +					     false);
> +	if (!fence_array) {
> +		kfree(fences);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* Move ownership to the dma_fence_array created above */
> +	for_each_batch_create_order(num_batches)
> +		dma_fence_get(fences[i]);
> +
> +	return &fence_array->base;
> +}
> +
> +int __eb_select_engine(struct intel_context *ce)
> +{
> +	struct intel_context *child;
> +	int err;
> +
> +	for_each_child(ce, child)
> +		intel_context_get(child);
> +	intel_gt_pm_get(ce->engine->gt);
> +
> +	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> +		err = intel_context_alloc_state(ce);
> +		if (err)
> +			goto err;
> +	}
> +	for_each_child(ce, child) {
> +		if (!test_bit(CONTEXT_ALLOC_BIT, &child->flags)) {
> +			err = intel_context_alloc_state(child);
> +			if (err)
> +				goto err;
> +		}
> +	}
> +
> +	/*
> +	 * ABI: Before userspace accesses the GPU (e.g. execbuffer), report
> +	 * EIO if the GPU is already wedged.
> +	 */
> +	err = intel_gt_terminally_wedged(ce->engine->gt);
> +	if (err)
> +		goto err;
> +
> +	if (!i915_vm_tryget(ce->vm)) {
> +		err = -ENOENT;
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	intel_gt_pm_put(ce->engine->gt);
> +	for_each_child(ce, child)
> +		intel_context_put(child);
> +	return err;
> +}
> +
> +void __eb_put_engine(struct intel_context *context, struct intel_gt *gt)
> +{
> +	struct intel_context *child;
> +
> +	i915_vm_put(context->vm);
> +	intel_gt_pm_put(gt);
> +	for_each_child(context, child)
> +		intel_context_put(child);
> +	intel_context_put(context);
> +}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> new file mode 100644
> index 000000000000..725febfd6a53
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_EXECBUFFER_COMMON_H
> +#define __I915_GEM_EXECBUFFER_COMMON_H
> +
> +#include <drm/drm_syncobj.h>
> +
> +#include "gt/intel_context.h"
> +
> +struct eb_fence {
> +	struct drm_syncobj *syncobj;
> +	struct dma_fence *dma_fence;
> +	u64 value;
> +	struct dma_fence_chain *chain_fence;
> +};
> +
> +int __eb_pin_engine(struct intel_context *ce, struct i915_gem_ww_ctx *ww,
> +		    bool throttle, bool nonblock);
> +void __eb_unpin_engine(struct intel_context *ce);
> +int __eb_select_engine(struct intel_context *ce);
> +void __eb_put_engine(struct intel_context *context, struct intel_gt *gt);

Two things:

1)

Is there enough commonality to maybe avoid multiple arguments and have like

struct i915_execbuffer {

};

struct i915_execbuffer2 {
	struct i915_execbuffer eb;
	.. eb2 specific fields ..
};

struct i915_execbuffer3 {
	struct i915_execbuffer eb;
	.. eb3 specific fields ..
};

And then have the common helpers take the pointer to the common struct?

2)

Should we prefix with i915_ everything that is now no longer static?

Regards,

Tvrtko

> +
> +struct intel_context *
> +eb_find_context(struct intel_context *context, unsigned int context_number);
> +
> +int add_timeline_fence(struct drm_file *file, u32 handle, u64 point,
> +		       struct eb_fence *f, bool wait, bool signal);
> +void put_fence_array(struct eb_fence *fences, u64 num_fences);
> +int await_fence_array(struct eb_fence *fences, u64 num_fences,
> +		      struct i915_request *rq);
> +void signal_fence_array(struct eb_fence *fences, u64 num_fences,
> +			struct dma_fence * const fence);
> +
> +int eb_requests_add(struct i915_request **requests, unsigned int num_batches,
> +		    struct intel_context *context, struct i915_sched_attr sched,
> +		    int err);
> +void eb_requests_get(struct i915_request **requests, unsigned int num_batches);
> +void eb_requests_put(struct i915_request **requests, unsigned int num_batches);
> +
> +struct dma_fence *__eb_composite_fence_create(struct i915_request **requests,
> +					      unsigned int num_batches,
> +					      struct intel_context *context);
> +
> +#endif /* __I915_GEM_EXECBUFFER_COMMON_H */
