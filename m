Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A339F5E883D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 06:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD7A10EBB7;
	Sat, 24 Sep 2022 04:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631D510EBB9;
 Sat, 24 Sep 2022 04:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663993370; x=1695529370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sbylrXKcGUUrMCONiOD+B2MCLK39f0oaKMUpkjZupQs=;
 b=GvjTMsdL7mmluKDhGkMSWNFHizBAELK6GGCL8FyWsp0XM6dyHUBEsswZ
 cqygnvQM5QZte7xbMtZYqKY92TvIYg4IRObNzx/5a2qK1zx2Zm7m6F5Pt
 WKhGqOEyXADhWX7696MTpFY1GemUjR6iYyiKe9COIeFKXy5pi4WlsoE06
 zhmEHpC1dd7g4JSOqWRftGuwz+EUObSc+FF9G5Wv16zzClmJfaLHBGjku
 43aerO+aPD2AwmJLtMTz4diFZNyhlV158tkgWT7dzH8Exh87gq1UfQ0Rn
 9mkPQTXIl8omGqHbAqmmBpcQW22PJncBy4ShlVMRoedl6Jaq91CuORzYf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="387033132"
X-IronPort-AV: E=Sophos;i="5.93,341,1654585200"; d="scan'208";a="387033132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 21:22:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,341,1654585200"; d="scan'208";a="615845190"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 21:22:49 -0700
Date: Fri, 23 Sep 2022 21:22:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [RFC v4 08/14] drm/i915/vm_bind: Abstract out common execbuf
 functions
Message-ID: <20220924042227.GI28263@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-9-niranjana.vishwanathapura@intel.com>
 <877d1v7n0e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d1v7n0e.fsf@intel.com>
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
 intel-gfx@lists.freedesktop.org, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 jason@jlekstrand.net, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 12:54:09PM +0300, Jani Nikula wrote:
>On Wed, 21 Sep 2022, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
>> new file mode 100644
>> index 000000000000..725febfd6a53
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
>> @@ -0,0 +1,47 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#ifndef __I915_GEM_EXECBUFFER_COMMON_H
>> +#define __I915_GEM_EXECBUFFER_COMMON_H
>> +
>> +#include <drm/drm_syncobj.h>
>> +
>> +#include "gt/intel_context.h"
>
>You don't need these includes. Most of it can be handled using forward
>declarations. You'll need <linux/types.h>
>

Thanks Jani,
Sure, here and everywhere I will remove the unwanted includes and use
forward declarations instead.

>> +
>> +struct eb_fence {
>> +	struct drm_syncobj *syncobj;
>> +	struct dma_fence *dma_fence;
>> +	u64 value;
>> +	struct dma_fence_chain *chain_fence;
>> +};
>> +
>> +int __eb_pin_engine(struct intel_context *ce, struct i915_gem_ww_ctx *ww,
>> +		    bool throttle, bool nonblock);
>> +void __eb_unpin_engine(struct intel_context *ce);
>> +int __eb_select_engine(struct intel_context *ce);
>> +void __eb_put_engine(struct intel_context *context, struct intel_gt *gt);
>> +
>> +struct intel_context *
>> +eb_find_context(struct intel_context *context, unsigned int context_number);
>> +
>> +int add_timeline_fence(struct drm_file *file, u32 handle, u64 point,
>> +		       struct eb_fence *f, bool wait, bool signal);
>> +void put_fence_array(struct eb_fence *fences, u64 num_fences);
>> +int await_fence_array(struct eb_fence *fences, u64 num_fences,
>> +		      struct i915_request *rq);
>> +void signal_fence_array(struct eb_fence *fences, u64 num_fences,
>> +			struct dma_fence * const fence);
>> +
>> +int eb_requests_add(struct i915_request **requests, unsigned int num_batches,
>> +		    struct intel_context *context, struct i915_sched_attr sched,
>
>struct i915_sched_attr is passed by value, so you either need to turn
>that into a pointer, or you need the definition. The definition is just
>a wrapper around an int. (For strict type safety or for future proofing
>or what, I don't know.) And this all brings me to my pet peeve about
>gem/gt headers.
>
>To get that definition of a struct wrapper around an int, you need to
>include i915_scheduler_types.h, which recursively includes a total of 16
>headers. Touch any of those files, and you get a rebuild butterfly
>effect.
>
>28% of i915 header files, when modified, cause the rebuild of 83% of the
>driver. Please let's not make it worse.
>

Ok. I think it is passed by value as it is just a wrapper around an int.
I am just moving this function to a separate file.
Will keep it as such, but will forward declare it insted of including
the i915_scheduler_types.h.

Regards,
Niranjana

>
>BR,
>Jani.
>
>> +		    int err);
>> +void eb_requests_get(struct i915_request **requests, unsigned int num_batches);
>> +void eb_requests_put(struct i915_request **requests, unsigned int num_batches);
>> +
>> +struct dma_fence *__eb_composite_fence_create(struct i915_request **requests,
>> +					      unsigned int num_batches,
>> +					      struct intel_context *context);
>> +
>> +#endif /* __I915_GEM_EXECBUFFER_COMMON_H */
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
