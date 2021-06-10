Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDB3A2843
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75E56ECAD;
	Thu, 10 Jun 2021 09:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F016ECAC;
 Thu, 10 Jun 2021 09:29:18 +0000 (UTC)
IronPort-SDR: lYU02pjzMET51kcu/VjOJSp9DlC09jnMquCZ/GpeyakDqlBKjkGpAYC2m9d/fR/Sr++VrMi07D
 JEUvM5SnR7Ig==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="205077983"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="205077983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 02:29:16 -0700
IronPort-SDR: fBALTGYP5kqfgl7R2CnebFgmAIZDfjlLBbk+6+/rBQmIR7ca6HzVVI1kUwuDuGvY9tHSPUahcf
 z9vMievE1vfA==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="448653216"
Received: from rabolton-mobl.ger.corp.intel.com (HELO [10.213.197.140])
 ([10.213.197.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 02:29:14 -0700
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210609212959.471209-1-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
Date: Thu, 10 Jun 2021 10:29:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609212959.471209-1-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/06/2021 22:29, Jason Ekstrand wrote:
> Ever since 0eafec6d3244 ("drm/i915: Enable lockless lookup of request
> tracking via RCU"), the i915 driver has used SLAB_TYPESAFE_BY_RCU (it
> was called SLAB_DESTROY_BY_RCU at the time) in order to allow RCU on
> i915_request.  As nifty as SLAB_TYPESAFE_BY_RCU may be, it comes with
> some serious disclaimers.  In particular, objects can get recycled while
> RCU readers are still in-flight.  This can be ok if everyone who touches
> these objects knows about the disclaimers and is careful.  However,
> because we've chosen to use SLAB_TYPESAFE_BY_RCU for i915_request and
> because i915_request contains a dma_fence, we've leaked
> SLAB_TYPESAFE_BY_RCU and its whole pile of disclaimers to every driver
> in the kernel which may consume a dma_fence.

I don't think the part about leaking is true...

> We've tried to keep it somewhat contained by doing most of the hard work
> to prevent access of recycled objects via dma_fence_get_rcu_safe().
> However, a quick grep of kernel sources says that, of the 30 instances
> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
> It's likely there bear traps in DRM and related subsystems just waiting
> for someone to accidentally step in them.

...because dma_fence_get_rcu_safe apears to be about whether the 
*pointer* to the fence itself is rcu protected, not about the fence 
object itself.

If one has a stable pointer to a fence dma_fence_get_rcu is I think 
enough to deal with SLAB_TYPESAFE_BY_RCU used by i915_request (as dma 
fence is a base object there). Unless you found a bug in rq field 
recycling. But access to the dma fence is all tightly controlled so I 
don't get what leaks.

> This patch series stops us using SLAB_TYPESAFE_BY_RCU for i915_request
> and, instead, does an RCU-safe slab free via rcu_call().  This should
> let us keep most of the perf benefits of slab allocation while avoiding
> the bear traps inherent in SLAB_TYPESAFE_BY_RCU.  It then removes support
> for SLAB_TYPESAFE_BY_RCU from dma_fence entirely.

According to the rationale behind SLAB_TYPESAFE_BY_RCU traditional RCU 
freeing can be a lot more costly so I think we need a clear 
justification on why this change is being considered.

Regards,

Tvrtko

> 
> Note: The last patch is labled DONOTMERGE.  This was at Daniel Vetter's
> request as we may want to let this bake for a couple releases before we
> rip out dma_fence_get_rcu_safe entirely.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Jason Ekstrand (5):
>    drm/i915: Move intel_engine_free_request_pool to i915_request.c
>    drm/i915: Use a simpler scheme for caching i915_request
>    drm/i915: Stop using SLAB_TYPESAFE_BY_RCU for i915_request
>    dma-buf: Stop using SLAB_TYPESAFE_BY_RCU in selftests
>    DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
> 
>   drivers/dma-buf/dma-fence-chain.c         |   8 +-
>   drivers/dma-buf/dma-resv.c                |   4 +-
>   drivers/dma-buf/st-dma-fence-chain.c      |  24 +---
>   drivers/dma-buf/st-dma-fence.c            |  27 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |   4 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |   8 --
>   drivers/gpu/drm/i915/i915_active.h        |   4 +-
>   drivers/gpu/drm/i915/i915_request.c       | 147 ++++++++++++----------
>   drivers/gpu/drm/i915/i915_request.h       |   2 -
>   drivers/gpu/drm/i915/i915_vma.c           |   4 +-
>   include/drm/drm_syncobj.h                 |   4 +-
>   include/linux/dma-fence.h                 |  50 --------
>   include/linux/dma-resv.h                  |   4 +-
>   13 files changed, 110 insertions(+), 180 deletions(-)
> 
