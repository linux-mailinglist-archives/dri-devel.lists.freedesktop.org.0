Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70735F0945
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E1E10EC68;
	Fri, 30 Sep 2022 10:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1310EC7D;
 Fri, 30 Sep 2022 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664534741; x=1696070741;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z5ldiK+eU4EyhQditQtoqlaBEggtUu54Oy4CIhQqtN8=;
 b=V6Gek7AyfUJqaxLJtASlD7lyY851bDizxzLEjTjuMelPEGL6BcXyWy14
 ZRz+7EXphBBYcgvrINvFnDNxChPZxtNhf/B9JHHyg+2o3ltV+iuStAApY
 bJXOjQV/OZog7bfyXqwN46IsXzTIYzMQND86SPawWhdyd+GH6NQ+r6p2Y
 Jrzg6ywfcG2RpS4MSSDV+tfDbTNc2z+ejIupEs5fK92eFwSi2RVC5/1NM
 tRdX0mc3eBCEmo3JnfVYKde4QQyg+RaTWbuBV5MQtW4cB9HAXWEcdE0tc
 qaUQcTWGYdrGy0nE7ICVXL36m0IhI0LOQjWZvm8Ic6nChWDVQJJB4XBuW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="302135518"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="302135518"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:45:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="797930064"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="797930064"
Received: from dtrawins-mobl1.ger.corp.intel.com (HELO [10.252.7.39])
 ([10.252.7.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:45:37 -0700
Message-ID: <e88e01a5-fea0-5c6b-97b2-7cbac90a4019@intel.com>
Date: Fri, 30 Sep 2022 11:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 10/16] drm/i915/vm_bind: Abstract out common execbuf
 functions
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-11-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220928061918.6340-11-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
> The new execbuf3 ioctl path and the legacy execbuf ioctl
> paths have many common functionalities.
> Abstract out the common execbuf functionalities into a
> separate file where possible, thus allowing code sharing.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../drm/i915/gem/i915_gem_execbuffer_common.c | 664 ++++++++++++++++++
>   .../drm/i915/gem/i915_gem_execbuffer_common.h |  74 ++
>   3 files changed, 739 insertions(+)
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
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
> new file mode 100644
> index 000000000000..a7efd74afc9c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
> @@ -0,0 +1,664 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <linux/dma-fence-array.h>
> +
> +#include <drm/drm_syncobj.h>
> +
> +#include "gt/intel_context.h"
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
> +/**
> + * i915_eb_pin_engine() - Pin the engine
> + * @ce: the context
> + * @ww: optional locking context or NULL
> + * @throttle: throttle to ensure enough ring space
> + * @nonblock: do not block during throttle
> + *
> + * Pin the @ce timeline. If @throttle is set, enable throttling to ensure
> + * enough ring space is available either by waiting for requests to complete
> + * (if @nonblock is not set) or by returning error -EWOULDBLOCK (if @nonblock
> + * is set).
> + *
> + * Returns 0 upon success, -ve error code upon error.
> + */
> +int i915_eb_pin_engine(struct intel_context *ce, struct i915_gem_ww_ctx *ww,
> +		       bool throttle, bool nonblock)
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
> +/**
> + * i915_eb_unpin_engine() - Unpin the engine
> + * @ce: the context
> + *
> + * Unpin the @ce timeline.
> + */
> +void i915_eb_unpin_engine(struct intel_context *ce)
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
> +/**
> + * i915_eb_find_context() - Find the context
> + * @context: the context
> + * @context_number: required context index
> + *
> + * Returns the @context_number'th child of specified @context,
> + * or NULL if the child context is not found.
> + * If @context_number is 0, return the specified @context.
> + */
> +struct intel_context *
> +i915_eb_find_context(struct intel_context *context, unsigned int context_number)
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
> +/**
> + * i915_eb_put_fence_array() - Free Execbuffer fence array
> + * @fences: Pointer to array of Execbuffer fences (See struct eb_fences)
> + * @num_fences: Number of fences in @fences array
> + *
> + * Free the Execbuffer fences in @fences array.
> + */
> +void i915_eb_put_fence_array(struct eb_fence *fences, u64 num_fences)
> +{
> +	if (fences)
> +		__free_fence_array(fences, num_fences);
> +}
> +
> +/**
> + * i915_eb_add_timeline_fence() - Add a fence to the specified Execbuffer fence
> + * array.
> + * @file: drm file pointer
> + * @handle: drm_syncobj handle
> + * @point: point in the timeline
> + * @f: Execbuffer fence
> + * @wait: wait for the specified fence
> + * @signal: signal the specified fence
> + *
> + * Add the fence specified by drm_syncobj @handle at specified @point in the
> + * timeline to the Execbuffer fence array @f. If @wait is specified, it is an
> + * input fence and if @signal is specified it is an output fence.
> + *
> + * Returns 0 upon success, -ve error upon failure.

Also can return 1, which also means success. Also maybe clarify that 
zero here is special.

Acked-by: Matthew Auld <matthew.auld@intel.com>
