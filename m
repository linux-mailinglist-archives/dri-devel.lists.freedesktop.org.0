Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA8A5F0FEC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 18:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75E10ED97;
	Fri, 30 Sep 2022 16:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8610ED82;
 Fri, 30 Sep 2022 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664555235; x=1696091235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TSDCTEha2c0kIEIhfnXxePT5ZJ3Awb6UTYebrILx9Nw=;
 b=gbt7eXP6tjaHGHZRJkh9N47OWoJPoP0Fn9dKlWy8KrIzPi5Ca0iF0RKS
 W8rS9k6h/iZd/Aey8rAMxddPGVO/TlQoxM4YxwCEn5B4TEyFLn5h+Csu0
 ddG0KcSFa80Ctm4D0EcPHYHRfg/hL2hyK4i10QKtwRwpJxz2HViJB/YBF
 /AjU5stTr2r0Jzt678ZW4OF96Unisp7Me8uetUXjzGB+2kfucEforu8qG
 mJX3iTBKacueijm8yqHWgC0iXvOiH0wvRgm06egQR8FOvHHcVCezz3Oek
 RGLXP5Wzgf8eYr+GuYCzOIJdWn6VxgtKQu9byJGFURH5wF79fBjfUNbvO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="285365616"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="285365616"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:27:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="951600774"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="951600774"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:27:05 -0700
Date: Fri, 30 Sep 2022 09:26:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 10/16] drm/i915/vm_bind: Abstract out common execbuf
 functions
Message-ID: <20220930162641.GJ22224@nvishwa1-DESK>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-11-niranjana.vishwanathapura@intel.com>
 <e88e01a5-fea0-5c6b-97b2-7cbac90a4019@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e88e01a5-fea0-5c6b-97b2-7cbac90a4019@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 11:45:34AM +0100, Matthew Auld wrote:
>On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
>>The new execbuf3 ioctl path and the legacy execbuf ioctl
>>paths have many common functionalities.
>>Abstract out the common execbuf functionalities into a
>>separate file where possible, thus allowing code sharing.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  .../drm/i915/gem/i915_gem_execbuffer_common.c | 664 ++++++++++++++++++
>>  .../drm/i915/gem/i915_gem_execbuffer_common.h |  74 ++
>>  3 files changed, 739 insertions(+)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
>>
>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>index 9bf939ef18ea..bf952f478555 100644
>>--- a/drivers/gpu/drm/i915/Makefile
>>+++ b/drivers/gpu/drm/i915/Makefile
>>@@ -148,6 +148,7 @@ gem-y += \
>>  	gem/i915_gem_create.o \
>>  	gem/i915_gem_dmabuf.o \
>>  	gem/i915_gem_domain.o \
>>+	gem/i915_gem_execbuffer_common.o \
>>  	gem/i915_gem_execbuffer.o \
>>  	gem/i915_gem_internal.o \
>>  	gem/i915_gem_object.o \
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
>>new file mode 100644
>>index 000000000000..a7efd74afc9c
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
>>@@ -0,0 +1,664 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+#include <linux/dma-fence-array.h>
>>+
>>+#include <drm/drm_syncobj.h>
>>+
>>+#include "gt/intel_context.h"
>>+#include "gt/intel_gt.h"
>>+#include "gt/intel_gt_pm.h"
>>+#include "gt/intel_ring.h"
>>+
>>+#include "i915_gem_execbuffer_common.h"
>>+
>>+#define __EXEC_COMMON_FENCE_WAIT	BIT(0)
>>+#define __EXEC_COMMON_FENCE_SIGNAL	BIT(1)
>>+
>>+static struct i915_request *eb_throttle(struct intel_context *ce)
>>+{
>>+	struct intel_ring *ring = ce->ring;
>>+	struct intel_timeline *tl = ce->timeline;
>>+	struct i915_request *rq;
>>+
>>+	/*
>>+	 * Completely unscientific finger-in-the-air estimates for suitable
>>+	 * maximum user request size (to avoid blocking) and then backoff.
>>+	 */
>>+	if (intel_ring_update_space(ring) >= PAGE_SIZE)
>>+		return NULL;
>>+
>>+	/*
>>+	 * Find a request that after waiting upon, there will be at least half
>>+	 * the ring available. The hysteresis allows us to compete for the
>>+	 * shared ring and should mean that we sleep less often prior to
>>+	 * claiming our resources, but not so long that the ring completely
>>+	 * drains before we can submit our next request.
>>+	 */
>>+	list_for_each_entry(rq, &tl->requests, link) {
>>+		if (rq->ring != ring)
>>+			continue;
>>+
>>+		if (__intel_ring_space(rq->postfix,
>>+				       ring->emit, ring->size) > ring->size / 2)
>>+			break;
>>+	}
>>+	if (&rq->link == &tl->requests)
>>+		return NULL; /* weird, we will check again later for real */
>>+
>>+	return i915_request_get(rq);
>>+}
>>+
>>+static int eb_pin_timeline(struct intel_context *ce, bool throttle,
>>+			   bool nonblock)
>>+{
>>+	struct intel_timeline *tl;
>>+	struct i915_request *rq = NULL;
>>+
>>+	/*
>>+	 * Take a local wakeref for preparing to dispatch the execbuf as
>>+	 * we expect to access the hardware fairly frequently in the
>>+	 * process, and require the engine to be kept awake between accesses.
>>+	 * Upon dispatch, we acquire another prolonged wakeref that we hold
>>+	 * until the timeline is idle, which in turn releases the wakeref
>>+	 * taken on the engine, and the parent device.
>>+	 */
>>+	tl = intel_context_timeline_lock(ce);
>>+	if (IS_ERR(tl))
>>+		return PTR_ERR(tl);
>>+
>>+	intel_context_enter(ce);
>>+	if (throttle)
>>+		rq = eb_throttle(ce);
>>+	intel_context_timeline_unlock(tl);
>>+
>>+	if (rq) {
>>+		long timeout = nonblock ? 0 : MAX_SCHEDULE_TIMEOUT;
>>+
>>+		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
>>+				      timeout) < 0) {
>>+			i915_request_put(rq);
>>+
>>+			/*
>>+			 * Error path, cannot use intel_context_timeline_lock as
>>+			 * that is user interruptable and this clean up step
>>+			 * must be done.
>>+			 */
>>+			mutex_lock(&ce->timeline->mutex);
>>+			intel_context_exit(ce);
>>+			mutex_unlock(&ce->timeline->mutex);
>>+
>>+			if (nonblock)
>>+				return -EWOULDBLOCK;
>>+			else
>>+				return -EINTR;
>>+		}
>>+		i915_request_put(rq);
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * i915_eb_pin_engine() - Pin the engine
>>+ * @ce: the context
>>+ * @ww: optional locking context or NULL
>>+ * @throttle: throttle to ensure enough ring space
>>+ * @nonblock: do not block during throttle
>>+ *
>>+ * Pin the @ce timeline. If @throttle is set, enable throttling to ensure
>>+ * enough ring space is available either by waiting for requests to complete
>>+ * (if @nonblock is not set) or by returning error -EWOULDBLOCK (if @nonblock
>>+ * is set).
>>+ *
>>+ * Returns 0 upon success, -ve error code upon error.
>>+ */
>>+int i915_eb_pin_engine(struct intel_context *ce, struct i915_gem_ww_ctx *ww,
>>+		       bool throttle, bool nonblock)
>>+{
>>+	struct intel_context *child;
>>+	int err;
>>+	int i = 0, j = 0;
>>+
>>+	if (unlikely(intel_context_is_banned(ce)))
>>+		return -EIO;
>>+
>>+	/*
>>+	 * Pinning the contexts may generate requests in order to acquire
>>+	 * GGTT space, so do this first before we reserve a seqno for
>>+	 * ourselves.
>>+	 */
>>+	err = intel_context_pin_ww(ce, ww);
>>+	if (err)
>>+		return err;
>>+
>>+	for_each_child(ce, child) {
>>+		err = intel_context_pin_ww(child, ww);
>>+		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
>>+	}
>>+
>>+	for_each_child(ce, child) {
>>+		err = eb_pin_timeline(child, throttle, nonblock);
>>+		if (err)
>>+			goto unwind;
>>+		++i;
>>+	}
>>+	err = eb_pin_timeline(ce, throttle, nonblock);
>>+	if (err)
>>+		goto unwind;
>>+
>>+	return 0;
>>+
>>+unwind:
>>+	for_each_child(ce, child) {
>>+		if (j++ < i) {
>>+			mutex_lock(&child->timeline->mutex);
>>+			intel_context_exit(child);
>>+			mutex_unlock(&child->timeline->mutex);
>>+		}
>>+	}
>>+	for_each_child(ce, child)
>>+		intel_context_unpin(child);
>>+	intel_context_unpin(ce);
>>+	return err;
>>+}
>>+
>>+/**
>>+ * i915_eb_unpin_engine() - Unpin the engine
>>+ * @ce: the context
>>+ *
>>+ * Unpin the @ce timeline.
>>+ */
>>+void i915_eb_unpin_engine(struct intel_context *ce)
>>+{
>>+	struct intel_context *child;
>>+
>>+	for_each_child(ce, child) {
>>+		mutex_lock(&child->timeline->mutex);
>>+		intel_context_exit(child);
>>+		mutex_unlock(&child->timeline->mutex);
>>+
>>+		intel_context_unpin(child);
>>+	}
>>+
>>+	mutex_lock(&ce->timeline->mutex);
>>+	intel_context_exit(ce);
>>+	mutex_unlock(&ce->timeline->mutex);
>>+
>>+	intel_context_unpin(ce);
>>+}
>>+
>>+/**
>>+ * i915_eb_find_context() - Find the context
>>+ * @context: the context
>>+ * @context_number: required context index
>>+ *
>>+ * Returns the @context_number'th child of specified @context,
>>+ * or NULL if the child context is not found.
>>+ * If @context_number is 0, return the specified @context.
>>+ */
>>+struct intel_context *
>>+i915_eb_find_context(struct intel_context *context, unsigned int context_number)
>>+{
>>+	struct intel_context *child;
>>+
>>+	if (likely(context_number == 0))
>>+		return context;
>>+
>>+	for_each_child(context, child)
>>+		if (!--context_number)
>>+			return child;
>>+
>>+	GEM_BUG_ON("Context not found");
>>+
>>+	return NULL;
>>+}
>>+
>>+static void __free_fence_array(struct eb_fence *fences, u64 n)
>>+{
>>+	while (n--) {
>>+		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
>>+		dma_fence_put(fences[n].dma_fence);
>>+		dma_fence_chain_free(fences[n].chain_fence);
>>+	}
>>+	kvfree(fences);
>>+}
>>+
>>+/**
>>+ * i915_eb_put_fence_array() - Free Execbuffer fence array
>>+ * @fences: Pointer to array of Execbuffer fences (See struct eb_fences)
>>+ * @num_fences: Number of fences in @fences array
>>+ *
>>+ * Free the Execbuffer fences in @fences array.
>>+ */
>>+void i915_eb_put_fence_array(struct eb_fence *fences, u64 num_fences)
>>+{
>>+	if (fences)
>>+		__free_fence_array(fences, num_fences);
>>+}
>>+
>>+/**
>>+ * i915_eb_add_timeline_fence() - Add a fence to the specified Execbuffer fence
>>+ * array.
>>+ * @file: drm file pointer
>>+ * @handle: drm_syncobj handle
>>+ * @point: point in the timeline
>>+ * @f: Execbuffer fence
>>+ * @wait: wait for the specified fence
>>+ * @signal: signal the specified fence
>>+ *
>>+ * Add the fence specified by drm_syncobj @handle at specified @point in the
>>+ * timeline to the Execbuffer fence array @f. If @wait is specified, it is an
>>+ * input fence and if @signal is specified it is an output fence.
>>+ *
>>+ * Returns 0 upon success, -ve error upon failure.
>
>Also can return 1, which also means success. Also maybe clarify that 
>zero here is special.
>

Ok, will update.

Regards,
Niranjana

>Acked-by: Matthew Auld <matthew.auld@intel.com>
