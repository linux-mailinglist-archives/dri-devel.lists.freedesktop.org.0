Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1385FC3CC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 12:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1343310E3C9;
	Wed, 12 Oct 2022 10:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BD310E2F6;
 Wed, 12 Oct 2022 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665570743; x=1697106743;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pAU3qH7t9xZciy3nsc6QfbuEQGLxLne6lR6B+fK5WBs=;
 b=m91i0TEl5nu1x/SIgg5Lufd9EExtvcNrFHhhLlKMcUoS1ab1gQAE23rm
 n6xhvfW7KokwNu6+q9AzVvPonK1IBJqrPGV2SRlTQ0Q1C7qgnZQ6TvWvl
 O1QNDKZzCTdzxaXbRoTpaeZZR+Cn3Wmd5bAus7gb9FO5VatjRBw8bXZlc
 x2Fz7uCyUIN/FAmswEhNppMxXykDO+p5QIp0s9zJcVTXSdS4/1lskCSKw
 u38CUYd3W6FxtPZ30zQCKkuFBurq/eqe0gJweFdGk0cUpcjhICdsz71Am
 2rLD3/AmmGgLURULb09niaya03kpGET6zIYbiPZeqJakhHlU5PdQgxEtV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="331249828"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="331249828"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 03:32:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="801797988"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="801797988"
Received: from dionita-mobl.ger.corp.intel.com (HELO [10.252.24.124])
 ([10.252.24.124])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 03:32:20 -0700
Message-ID: <5aed1778-ae6f-58fe-625e-45e7195c2616@intel.com>
Date: Wed, 12 Oct 2022 11:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v3 12/17] drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3
 ioctl
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-13-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221010065826.32037-13-niranjana.vishwanathapura@intel.com>
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

On 10/10/2022 07:58, Niranjana Vishwanathapura wrote:
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
> index 3564307699ea..94520b79e7e7 100644
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
> index 000000000000..1f38f658066a
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

I guess EXEC_CAPTURE is also now gone? Is that expected? We ofc don't 
have the list of objects so perhaps doesn't make sense any more. Just 
double checking...
