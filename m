Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F45EF9AF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAB410E653;
	Thu, 29 Sep 2022 16:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6DF10EABE;
 Thu, 29 Sep 2022 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664467372; x=1696003372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=syl4hkIBMsJJBox/omDOJujHfzKNxcXOzymxNVYz/Z8=;
 b=JfnDfsXnFgJZWa1riAu7Db3rlm00eNFf+z0EZP71pkgpCcVmfjAAr/jA
 x+DufM+Ot1Z23TPAdbceqkSJq4NMNxrNz6rIO2+GpAYXmKYVXrChPYzox
 0XQztx8jmNp2NIaMhWWbncqCuslNCguv8MxE8z4d2j+CldjJ0GhKn1CJc
 QZWd3EF0t6cVRSOyHrg0BeKYltFLD/sXdKuW5DIWPCg808XK3JlnAyfTH
 hmR0EvPjIeFgM+Mrrr2Zn1MoIlWMpVUoE4UOEPBPP9wlcNRW94NIVx0d2
 83pvABVGe+gc2EiK80u3qRlYdpuVUY9PR2jbo1yjxayqgZcGoKHlq9WSj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="365987568"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="365987568"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 09:02:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="655604460"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="655604460"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 09:02:23 -0700
Date: Thu, 29 Sep 2022 09:02:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 12/16] drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3
 ioctl
Message-ID: <20220929160159.GC22224@nvishwa1-DESK>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-13-niranjana.vishwanathapura@intel.com>
 <9fa140b7-fa8a-fa04-556b-aab240d7b6f0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fa140b7-fa8a-fa04-556b-aab240d7b6f0@intel.com>
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

On Thu, Sep 29, 2022 at 04:00:47PM +0100, Matthew Auld wrote:
>On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
>>Implement new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>>works in vm_bind mode. The vm_bind mode only works with
>>this new execbuf3 ioctl.
>>
>>The new execbuf3 ioctl will not have any list of objects to validate
>>bind as all required objects binding would have been requested by the
>>userspace before submitting the execbuf3.
>>
>>Legacy features like relocations etc are not supported by execbuf3.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 571 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>>  include/uapi/drm/i915_drm.h                   |  61 ++
>>  5 files changed, 636 insertions(+)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>
>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>index bf952f478555..3473ee5825bb 100644
>>--- a/drivers/gpu/drm/i915/Makefile
>>+++ b/drivers/gpu/drm/i915/Makefile
>>@@ -150,6 +150,7 @@ gem-y += \
>>  	gem/i915_gem_domain.o \
>>  	gem/i915_gem_execbuffer_common.o \
>>  	gem/i915_gem_execbuffer.o \
>>+	gem/i915_gem_execbuffer3.o \
>>  	gem/i915_gem_internal.o \
>>  	gem/i915_gem_object.o \
>>  	gem/i915_gem_lmem.o \
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>new file mode 100644
>>index 000000000000..92af88bc8deb
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>@@ -0,0 +1,571 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+#include <linux/dma-resv.h>
>>+#include <linux/uaccess.h>
>>+
>>+#include <drm/drm_syncobj.h>
>>+
>>+#include "gt/intel_context.h"
>>+#include "gt/intel_gpu_commands.h"
>>+#include "gt/intel_gt.h"
>>+
>>+#include "i915_drv.h"
>>+#include "i915_gem_context.h"
>>+#include "i915_gem_execbuffer_common.h"
>>+#include "i915_gem_ioctls.h"
>>+#include "i915_gem_vm_bind.h"
>>+#include "i915_trace.h"
>>+
>>+#define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>>+#define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>>+
>>+/* Catch emission of unexpected errors for CI! */
>>+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>+#undef EINVAL
>>+#define EINVAL ({ \
>>+	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
>>+	22; \
>>+})
>>+#endif
>>+
>>+/**
>>+ * DOC: User command execution with execbuf3 ioctl
>>+ *
>>+ * A VM in VM_BIND mode will not support older execbuf mode of binding.
>>+ * The execbuf ioctl handling in VM_BIND mode differs significantly from the
>>+ * older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
>>+ * Hence, a new execbuf3 ioctl has been added to support VM_BIND mode. (See
>>+ * struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not accept any
>>+ * execlist. Hence, no support for implicit sync.
>>+ *
>>+ * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
>>+ * works with execbuf3 ioctl for submission.
>>+ *
>>+ * The execbuf3 ioctl directly specifies the batch addresses instead of as
>>+ * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
>>+ * support many of the older features like in/out/submit fences, fence array,
>>+ * default gem context etc. (See struct drm_i915_gem_execbuffer3).
>>+ *
>>+ * In VM_BIND mode, VA allocation is completely managed by the user instead of
>>+ * the i915 driver. Hence all VA assignment, eviction are not applicable in
>>+ * VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
>>+ * be using the i915_vma active reference tracking. It will instead check the
>>+ * dma-resv object's fence list for that.
>>+ *
>>+ * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
>>+ * vma lookup table, implicit sync, vma active reference tracking etc., are not
>>+ * applicable for execbuf3 ioctl.
>>+ */
>>+
>>+/**
>>+ * struct i915_execbuffer - execbuf struct for execbuf3
>>+ * @i915: reference to the i915 instance we run on
>>+ * @file: drm file reference
>>+ * args: execbuf3 ioctl structure
>>+ * @gt: reference to the gt instance ioctl submitted for
>>+ * @context: logical state for the request
>>+ * @gem_context: callers context
>>+ * @requests: requests to be build
>>+ * @composite_fence: used for excl fence in dma_resv objects when > 1 BB submitted
>>+ * @ww: i915_gem_ww_ctx instance
>>+ * @num_batches: number of batches submitted
>>+ * @batch_addresses: addresses corresponds to the submitted batches
>>+ * @batches: references to the i915_vmas corresponding to the batches
>>+ */
>>+struct i915_execbuffer {
>>+	struct drm_i915_private *i915;
>>+	struct drm_file *file;
>>+	struct drm_i915_gem_execbuffer3 *args;
>>+
>>+	struct intel_gt *gt;
>>+	struct intel_context *context;
>>+	struct i915_gem_context *gem_context;
>>+
>>+	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
>>+	struct dma_fence *composite_fence;
>>+
>>+	struct i915_gem_ww_ctx ww;
>>+
>>+	unsigned int num_batches;
>>+	u64 batch_addresses[MAX_ENGINE_INSTANCE + 1];
>>+	struct i915_vma *batches[MAX_ENGINE_INSTANCE + 1];
>>+
>>+	struct eb_fence *fences;
>>+	u64 num_fences;
>>+};
>>+
>>+static void eb_unpin_engine(struct i915_execbuffer *eb);
>>+
>>+static int eb_select_context(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_gem_context *ctx;
>>+
>>+	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->ctx_id);
>>+	if (IS_ERR(ctx))
>>+		return PTR_ERR(ctx);
>>+
>>+	if (!ctx->vm->vm_bind_mode) {
>>+		i915_gem_context_put(ctx);
>>+		return -EOPNOTSUPP;
>>+	}
>>+
>>+	eb->gem_context = ctx;
>>+	return 0;
>>+}
>>+
>>+static struct i915_vma *
>>+eb_find_vma(struct i915_address_space *vm, u64 addr)
>>+{
>>+	u64 va;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+
>>+	va = gen8_noncanonical_addr(addr & PIN_OFFSET_MASK);
>>+	return i915_gem_vm_bind_lookup_vma(vm, va);
>>+}
>>+
>>+static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	unsigned int i, current_batch = 0;
>>+	struct i915_vma *vma;
>>+
>>+	for (i = 0; i < eb->num_batches; i++) {
>>+		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
>>+		if (!vma)
>>+			return -EINVAL;
>>+
>>+		eb->batches[current_batch] = vma;
>>+		++current_batch;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static void eb_release_vma_all(struct i915_execbuffer *eb, bool final)
>>+{
>>+	eb_unpin_engine(eb);
>>+}
>>+
>>+/*
>>+ * Using two helper loops for the order of which requests / batches are created
>>+ * and added the to backend. Requests are created in order from the parent to
>>+ * the last child. Requests are added in the reverse order, from the last child
>>+ * to parent. This is done for locking reasons as the timeline lock is acquired
>>+ * during request creation and released when the request is added to the
>>+ * backend. To make lockdep happy (see intel_context_timeline_lock) this must be
>>+ * the ordering.
>>+ */
>>+#define for_each_batch_create_order(_eb) \
>>+	for (unsigned int i = 0; i < (_eb)->num_batches; ++i)
>>+
>>+static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>+{
>>+	/* Unconditionally flush any chipset caches (for streaming writes). */
>>+	intel_gt_chipset_flush(eb->gt);
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_request_submit(struct i915_execbuffer *eb,
>>+			     struct i915_request *rq,
>>+			     struct i915_vma *batch,
>>+			     u64 batch_len)
>>+{
>>+	struct intel_engine_cs *engine = rq->context->engine;
>>+	int err;
>>+
>>+	if (intel_context_nopreempt(rq->context))
>>+		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &rq->fence.flags);
>>+
>>+	/*
>>+	 * After we completed waiting for other engines (using HW semaphores)
>>+	 * then we can signal that this request/batch is ready to run. This
>>+	 * allows us to determine if the batch is still waiting on the GPU
>>+	 * or actually running by checking the breadcrumb.
>>+	 */
>>+	if (engine->emit_init_breadcrumb) {
>>+		err = engine->emit_init_breadcrumb(rq);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>+	return engine->emit_bb_start(rq, batch->node.start, batch_len, 0);
>>+}
>>+
>>+static int eb_submit(struct i915_execbuffer *eb)
>>+{
>>+	int err;
>>+
>>+	err = eb_move_to_gpu(eb);
>
>I'm looking but can't find the magic bit that chains up the request 
>against each of the binds (since binding often can be async), to 
>ensure we don't submit the rq to hw, before the binds (and potential 
>moves/clears) are for sure complete. In i915_vma_bind() it's still 
>using vma->active, and not for example adding kernel fence to 
>dma-resv, and here ensuring we adhere to it? What am I missing?

Yah, you are right, looks like it got lost in the driver redesign.
We do need to call __i915_request_await_bind() for persistent vmas,
and keep the persistent vmas in vm_bind_list in the vm_bind ioctl,
so that execbuf properly waits for the binds to complete.
Will update.

Regards,
Niranjana

