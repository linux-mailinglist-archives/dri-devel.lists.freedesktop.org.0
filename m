Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C95F604B18
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4313610F26C;
	Wed, 19 Oct 2022 15:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E8310F26C;
 Wed, 19 Oct 2022 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666192856; x=1697728856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XHLPBto32lrhlmViL4/Ace7LODAuZ9hjhtwG0OHRxcI=;
 b=CgHKMga7kZ9l87TWCPRnRL6Uxbmaz7rnAWL5G+gr+W0LdegzJlRfqG94
 UMHPdB3E+If2/5f1qZG4S1BenSNZSz8gfLOf3k/+E4ryGI/H8cTKuh5At
 P+vHlzHMQUOsazhCLKELlIVGhgMzUWdzjlYkwWKdM3PPPZO7l+oVqCYES
 2iL3BXtLTD0aq/LuhEyDxDpdEH3S3AJXTWnjDWDHPER8PNp3BbIJwZsDH
 fNChzCOGGLRATl3yC29ggO99AhrTnmQ3HmbGboiZDz80lnwJxOQGlkmR9
 xRCO4RkR7acmY4OPFmr5DsmAX2/ZuvfzyiV+MARlRlLE+5rdEHRxS03a4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289757806"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="289757806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:20:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="804348541"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="804348541"
Received: from abyrne1-mobl1.ger.corp.intel.com (HELO [10.252.27.172])
 ([10.252.27.172])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:20:51 -0700
Message-ID: <1d48bd33-ea96-e753-eb82-12948baa4573@intel.com>
Date: Wed, 19 Oct 2022 16:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 12/17] drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3
 ioctl
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-13-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071630.3831-13-niranjana.vishwanathapura@intel.com>
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

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> Implement new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
> works in vm_bind mode. The vm_bind mode only works with
> this new execbuf3 ioctl.
> 
> The new execbuf3 ioctl will not have any list of objects to validate
> bind as all required objects binding would have been requested by the
> userspace before submitting the execbuf3.
> 
> Legacy features like relocations etc are not supported by execbuf3.
> 
> v2: Add more input validity checks.
> v3: batch_address is a VA (not an array) if num_batches=1,
>      minor cleanup
> v4: replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 580 ++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
>   drivers/gpu/drm/i915/i915_driver.c            |   1 +
>   include/uapi/drm/i915_drm.h                   |  61 ++
>   5 files changed, 645 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 8d76bb888dc3..6a801684d569 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -150,6 +150,7 @@ gem-y += \
>   	gem/i915_gem_domain.o \
>   	gem/i915_gem_execbuffer_common.o \
>   	gem/i915_gem_execbuffer.o \
> +	gem/i915_gem_execbuffer3.o \
>   	gem/i915_gem_internal.o \
>   	gem/i915_gem_object.o \
>   	gem/i915_gem_lmem.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> new file mode 100644
> index 000000000000..a9b4cc44bf66
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> @@ -0,0 +1,580 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <linux/dma-resv.h>
> +#include <linux/uaccess.h>
> +
> +#include <drm/drm_syncobj.h>
> +
> +#include "gt/intel_context.h"
> +#include "gt/intel_gpu_commands.h"
> +#include "gt/intel_gt.h"
> +
> +#include "i915_drv.h"
> +#include "i915_gem_context.h"
> +#include "i915_gem_execbuffer_common.h"
> +#include "i915_gem_ioctls.h"
> +#include "i915_gem_vm_bind.h"
> +#include "i915_trace.h"
> +
> +#define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
> +#define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
> +
> +/* Catch emission of unexpected errors for CI! */
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +#undef EINVAL
> +#define EINVAL ({ \
> +	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
> +	22; \
> +})
> +#endif
> +
> +/**
> + * DOC: User command execution with execbuf3 ioctl
> + *
> + * A VM in VM_BIND mode will not support older execbuf mode of binding.
> + * The execbuf ioctl handling in VM_BIND mode differs significantly from the
> + * older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
> + * Hence, a new execbuf3 ioctl has been added to support VM_BIND mode. (See
> + * struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not accept any
> + * execlist. Hence, no support for implicit sync.
> + *
> + * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
> + * works with execbuf3 ioctl for submission.
> + *
> + * The execbuf3 ioctl directly specifies the batch addresses instead of as
> + * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
> + * support many of the older features like in/out/submit fences, fence array,
> + * default gem context etc. (See struct drm_i915_gem_execbuffer3).
> + *
> + * In VM_BIND mode, VA allocation is completely managed by the user instead of
> + * the i915 driver. Hence all VA assignment, eviction are not applicable in
> + * VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
> + * be using the i915_vma active reference tracking. It will instead check the
> + * dma-resv object's fence list for that.
> + *
> + * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
> + * vma lookup table, implicit sync, vma active reference tracking etc., are not
> + * applicable for execbuf3 ioctl.
> + */
> +
> +/**
> + * struct i915_execbuffer - execbuf struct for execbuf3
> + * @i915: reference to the i915 instance we run on
> + * @file: drm file reference
> + * args: execbuf3 ioctl structure
> + * @gt: reference to the gt instance ioctl submitted for
> + * @context: logical state for the request
> + * @gem_context: callers context
> + * @requests: requests to be build
> + * @composite_fence: used for excl fence in dma_resv objects when > 1 BB submitted
> + * @ww: i915_gem_ww_ctx instance
> + * @num_batches: number of batches submitted
> + * @batch_addresses: addresses corresponds to the submitted batches
> + * @batches: references to the i915_vmas corresponding to the batches
> + */

Are we building/including the docs for this somewhere? Looks like we are 
missing some stuff like @fences/@num_fences in the kernel-doc.

> +struct i915_execbuffer {
> +	struct drm_i915_private *i915;
> +	struct drm_file *file;
> +	struct drm_i915_gem_execbuffer3 *args;
> +
> +	struct intel_gt *gt;
> +	struct intel_context *context;
> +	struct i915_gem_context *gem_context;
> +
> +	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
> +	struct dma_fence *composite_fence;
> +
> +	struct i915_gem_ww_ctx ww;
> +
> +	unsigned int num_batches;
> +	u64 batch_addresses[MAX_ENGINE_INSTANCE + 1];
> +	struct i915_vma *batches[MAX_ENGINE_INSTANCE + 1];
> +
> +	struct eb_fence *fences;
> +	u64 num_fences;
> +};
> +
> +static void eb_unpin_engine(struct i915_execbuffer *eb);
> +
> +static int eb_select_context(struct i915_execbuffer *eb)
> +{
> +	struct i915_gem_context *ctx;
> +
> +	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->ctx_id);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	if (!i915_gem_vm_is_vm_bind_mode(ctx->vm)) {
> +		i915_gem_context_put(ctx);
> +		return -EOPNOTSUPP;
> +	}

It might be good to also ban recoverable context support somewhere for 
eb3. It should be non-recoverable ctx or nothing for new stuff it seems 
(VLK-40081).
