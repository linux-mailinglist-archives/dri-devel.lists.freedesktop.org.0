Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B25FC856
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 17:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F39810E56D;
	Wed, 12 Oct 2022 15:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763BC10E550;
 Wed, 12 Oct 2022 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665588135; x=1697124135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iP8jiMGeDBm3ohY9fT4xIo19p94Zj1s9oDSDxNckFt8=;
 b=KOY/dpCrIwg9s5CkDvesXqmZACHV98S8XvRqin8n7p8FKZeANIoVuAmC
 I/w4yp3Nsyf7HNNtwFyx7rVpnx3/JMHYfbTlZFWdU03pJo5mmzg1Ioa1v
 QAmXG1OmszmSyinvGuh3Cz/Jt6QJyEp7r2NffTlxC27uQg7NfqlC2yMUX
 rB+SdH+gIvN06Kn6CcqYg9Md2Y6cvcfFTK1OcLEV98QP0UkxclXr8vrm5
 aKuoku0ZbZp3wm9z4OalmjoUt/XLSnQBl4Cme9OI6vYkMbxNAZLwB9547
 4NTDultVY/L7H37sUJmB3SyrMF4h3toInC0J66ivSnUdja4X2nFrBEVk5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="305879789"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="305879789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 08:21:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="629145636"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="629145636"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 08:21:49 -0700
Date: Wed, 12 Oct 2022 08:21:22 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 12/17] drm/i915/vm_bind: Implement
 I915_GEM_EXECBUFFER3 ioctl
Message-ID: <20221012152122.GA26976@nvishwa1-DESK>
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-13-niranjana.vishwanathapura@intel.com>
 <5aed1778-ae6f-58fe-625e-45e7195c2616@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aed1778-ae6f-58fe-625e-45e7195c2616@intel.com>
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

On Wed, Oct 12, 2022 at 11:32:18AM +0100, Matthew Auld wrote:
>On 10/10/2022 07:58, Niranjana Vishwanathapura wrote:
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
>>v2: Add more input validity checks.
>>v3: batch_address is a VA (not an array) if num_batches=1,
>>     minor cleanup
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 580 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>>  include/uapi/drm/i915_drm.h                   |  61 ++
>>  5 files changed, 645 insertions(+)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>
>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>index 3564307699ea..94520b79e7e7 100644
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
>>index 000000000000..1f38f658066a
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>@@ -0,0 +1,580 @@
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
>
>I guess EXEC_CAPTURE is also now gone? Is that expected? We ofc don't 
>have the list of objects so perhaps doesn't make sense any more. Just 
>double checking...

Yah, instead will have a VM_BIND_CAPTURE flag for user to request for capture
during vm_bind call. It is not implemented yet.

Niranjana

