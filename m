Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30126550E9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 14:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4792C10E1A3;
	Fri, 23 Dec 2022 13:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981D10E1A3;
 Fri, 23 Dec 2022 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671801716; x=1703337716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Eiqt7wbUVC15K5NCdIMSb4/b4ElSmYXh2uiZLSSzJeo=;
 b=kTreq0bl+Ow4tHE61Wv0gPEr66Mzz0oHDANs7rPR5UHH9a1134G3GHFM
 EWSIHCg1sgFZJ0mpqgpkewzlYkO+VXbOx0JNVhLFSamk/Uf1nC0/vZ6PK
 3Of9fPfd9aZL1p+2IBQ1aJi7FQVJXiqoqxDHbbzqwlU3hpp2g4+HMewB4
 r+VSSuK8bx9SpD762+mMDK5GTc1MxXMJku311NxvoD+jZqXa8/4Eld5Lk
 i6CUUgyu8829qdoHqMMv1s44bvbQSl1fAeCpP84yNBCRAPIkYEm86wjWw
 p6fVOcmNX2P+wYrAVs+DtNP8LbZustN/YMu9R7EuTI6/ZPyQOq9pq+dlJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="320388664"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="320388664"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 05:21:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="602195427"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="602195427"
Received: from mirabhat-mobl1.amr.corp.intel.com (HELO [10.213.188.137])
 ([10.213.188.137])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 05:21:54 -0800
Message-ID: <d99c1147-fc3f-71f0-c115-49febbf2aa3a@linux.intel.com>
Date: Fri, 23 Dec 2022 13:21:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Retry RING_HEAD reset until it
 sticks
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221223121821.358021-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221223121821.358021-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/12/2022 12:18, Andi Shyti wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> On Haswell, in particular, we see an issue where resets fails because
> the engine resumes from an incorrect RING_HEAD. Since the RING_HEAD
> doesn't point to the remaining requests to re-run, but may instead point
> into the uninitialised portion of the ring, the GPU may be then fed
> invalid instructions from a privileged context, often pushing the GPU
> into an unrecoverable hang.
> 
> If at first the write doesn't succeed, try, try again.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/5432
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3303
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
>   drivers/gpu/drm/i915/i915_utils.h             |  8 ++++
>   2 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 827adb0cfaea6..cdf283f5b1427 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -192,6 +192,7 @@ static bool stop_ring(struct intel_engine_cs *engine)
>   static int xcs_resume(struct intel_engine_cs *engine)
>   {
>   	struct intel_ring *ring = engine->legacy.ring;
> +	ktime_t kt;
>   
>   	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
>   		     ring->head, ring->tail);
> @@ -230,9 +231,20 @@ static int xcs_resume(struct intel_engine_cs *engine)
>   	set_pp_dir(engine);
>   
>   	/* First wake the ring up to an empty/idle ring */
> -	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
> +	until_timeout_ns(kt, 2 * NSEC_PER_MSEC) {
> +		ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
> +		if (ENGINE_READ_FW(engine, RING_HEAD) == ring->head)
> +			break;
> +	}

2ms?! Shudder..

#define done \
({ \
	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head); \
	ENGINE_READ_FW(engine, RING_HEAD) == ring->head; \
})
_wait_for_atomic(done, 2 * USEC_PER_MSEC, needs_to_be_atomic_or_not?);
#undef done

Should work and avoid the need to add yet another helper, please 
double-check. Not as pretty, but accumulating generic sounding helpers 
in i915_utils.h is a bit frowned upon.

Regards,

Tvrtko

> +
>   	ENGINE_WRITE_FW(engine, RING_TAIL, ring->head);
> -	ENGINE_POSTING_READ(engine, RING_TAIL);
> +	if (ENGINE_READ_FW(engine, RING_HEAD) != ENGINE_READ_FW(engine, RING_TAIL)) {
> +		ENGINE_TRACE(engine, "failed to reset empty ring: [%x, %x]: %x\n",
> +			     ENGINE_READ_FW(engine, RING_HEAD),
> +			     ENGINE_READ_FW(engine, RING_TAIL),
> +			     ring->head);
> +		goto err;
> +	}
>   
>   	ENGINE_WRITE_FW(engine, RING_CTL,
>   			RING_CTL_SIZE(ring->size) | RING_VALID);
> @@ -241,12 +253,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>   	if (__intel_wait_for_register_fw(engine->uncore,
>   					 RING_CTL(engine->mmio_base),
>   					 RING_VALID, RING_VALID,
> -					 5000, 0, NULL))
> +					 5000, 0, NULL)) {
> +		ENGINE_TRACE(engine, "failed to restart\n");
>   		goto err;
> +	}
>   
> -	if (GRAPHICS_VER(engine->i915) > 2)
> +	if (GRAPHICS_VER(engine->i915) > 2) {
>   		ENGINE_WRITE_FW(engine,
>   				RING_MI_MODE, _MASKED_BIT_DISABLE(STOP_RING));
> +		ENGINE_POSTING_READ(engine, RING_MI_MODE);
> +	}
>   
>   	/* Now awake, let it get started */
>   	if (ring->tail != ring->head) {
> @@ -259,16 +275,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>   	return 0;
>   
>   err:
> -	drm_err(&engine->i915->drm,
> -		"%s initialization failed; "
> -		"ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
> -		engine->name,
> -		ENGINE_READ(engine, RING_CTL),
> -		ENGINE_READ(engine, RING_CTL) & RING_VALID,
> -		ENGINE_READ(engine, RING_HEAD), ring->head,
> -		ENGINE_READ(engine, RING_TAIL), ring->tail,
> -		ENGINE_READ(engine, RING_START),
> -		i915_ggtt_offset(ring->vma));
> +	ENGINE_TRACE(engine,
> +		     "initialization failed; "
> +		     "ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
> +		     ENGINE_READ(engine, RING_CTL),
> +		     ENGINE_READ(engine, RING_CTL) & RING_VALID,
> +		     ENGINE_READ(engine, RING_HEAD), ring->head,
> +		     ENGINE_READ(engine, RING_TAIL), ring->tail,
> +		     ENGINE_READ(engine, RING_START),
> +		     i915_ggtt_offset(ring->vma));
> +	GEM_TRACE_DUMP();
>   	return -EIO;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index b64192d9c7daa..f24a25c0685e1 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -254,6 +254,14 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>   	}
>   }
>   
> +/**
> + * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
> + */
> +#define until_timeout_ns(end, timeout_ns) \
> +	for ((end) = ktime_get() + (timeout_ns); \
> +	     ktime_before(ktime_get(), (end)); \
> +	     cpu_relax())
> + >   /**
>    * __wait_for - magic wait macro
>    *
