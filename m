Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365A5E5F10
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 11:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A7710E2DB;
	Thu, 22 Sep 2022 09:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9455610E2A4;
 Thu, 22 Sep 2022 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663840471; x=1695376471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ruTMuVxuSmR3rHbwBxxJPqg3dMI+k+T9N4IDvGz3wc0=;
 b=LlyKCPka+PGiIGd25erEcGI63Z8HYqemXDLlzY9oQKEeKIu5gFK2UnTG
 dqZYCVvtd+CWRMxIOwLgeBKvkuOiAJ+9GUt0MbhuvNIKBVigLr0mYGURi
 G3pHYDtCsZEXhOTalSmw7qp0zIf3V9j+D3oIp+V7ndPYK5UdbQz0qVcRx
 UYxZLuTpcTXj8szsMxSS/4og/WlKd89V5gmYO7VxjxrORqzeaxK0JvNz4
 WT7O4hzbfh48kk0lWT3TjQMWu9aV26+O7Uu6FyHRnvidgXCtfOzzXh22q
 yH7Bvvz82t/ukhF7LfaKXVqOmxOXUPTk/rdBOiRVH8q05Vgu69MeFRaVk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="364235127"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="364235127"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:54:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="864793578"
Received: from akoska-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:54:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC v4 08/14] drm/i915/vm_bind: Abstract out common execbuf
 functions
In-Reply-To: <20220921070945.27764-9-niranjana.vishwanathapura@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-9-niranjana.vishwanathapura@intel.com>
Date: Thu, 22 Sep 2022 12:54:09 +0300
Message-ID: <877d1v7n0e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Sep 2022, Niranjana Vishwanathapura <niranjana.vishwanathapura@i=
ntel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h b/driv=
ers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> new file mode 100644
> index 000000000000..725febfd6a53
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_EXECBUFFER_COMMON_H
> +#define __I915_GEM_EXECBUFFER_COMMON_H
> +
> +#include <drm/drm_syncobj.h>
> +
> +#include "gt/intel_context.h"

You don't need these includes. Most of it can be handled using forward
declarations. You'll need <linux/types.h>

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
> +
> +struct intel_context *
> +eb_find_context(struct intel_context *context, unsigned int context_numb=
er);
> +
> +int add_timeline_fence(struct drm_file *file, u32 handle, u64 point,
> +		       struct eb_fence *f, bool wait, bool signal);
> +void put_fence_array(struct eb_fence *fences, u64 num_fences);
> +int await_fence_array(struct eb_fence *fences, u64 num_fences,
> +		      struct i915_request *rq);
> +void signal_fence_array(struct eb_fence *fences, u64 num_fences,
> +			struct dma_fence * const fence);
> +
> +int eb_requests_add(struct i915_request **requests, unsigned int num_bat=
ches,
> +		    struct intel_context *context, struct i915_sched_attr sched,

struct i915_sched_attr is passed by value, so you either need to turn
that into a pointer, or you need the definition. The definition is just
a wrapper around an int. (For strict type safety or for future proofing
or what, I don't know.) And this all brings me to my pet peeve about
gem/gt headers.

To get that definition of a struct wrapper around an int, you need to
include i915_scheduler_types.h, which recursively includes a total of 16
headers. Touch any of those files, and you get a rebuild butterfly
effect.

28% of i915 header files, when modified, cause the rebuild of 83% of the
driver. Please let's not make it worse.


BR,
Jani.

> +		    int err);
> +void eb_requests_get(struct i915_request **requests, unsigned int num_ba=
tches);
> +void eb_requests_put(struct i915_request **requests, unsigned int num_ba=
tches);
> +
> +struct dma_fence *__eb_composite_fence_create(struct i915_request **requ=
ests,
> +					      unsigned int num_batches,
> +					      struct intel_context *context);
> +
> +#endif /* __I915_GEM_EXECBUFFER_COMMON_H */

--=20
Jani Nikula, Intel Open Source Graphics Center
