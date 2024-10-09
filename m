Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45B9978AF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 00:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711710E829;
	Wed,  9 Oct 2024 22:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcaYSViR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3610E827;
 Wed,  9 Oct 2024 22:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728514114; x=1760050114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k0QJBzS52AnX7UwI6/SdTdtdtC9OO51ptFUfzVoMT+Y=;
 b=kcaYSViRpjYsCITC688qfhV9yl2Z+GDOe9jff2lxBPfTmwbIDJxVEbm7
 cxwvTmlNujgukyuM1vSrBz1SfO+6H1vLMz4TW+n2HyTuwVcRh+9UfDYUS
 cUBE1InQYIffhl5g4mP8jpXPU4AkYcJoHHqPLu4hGADtkf0EFmuaCkzdV
 taEdTb29Ql7I/AXNpiQDZIRn18wZGiFVg6PY+MQNzCB7PSYj0oRF0Sty5
 qJpcNFBV7ESfF3s7mHX01Amugt9HNWL0J5fNXcDgQMzJvGX8KgpQ/othG
 /Qd2dsfMIvfv4U+jtFRhOF0SXtwR/NWrvMbvH2B1goNzn19cZj9n1Y4Fp g==;
X-CSE-ConnectionGUID: yX+sDTzQT0CBuyDFYB9NKg==
X-CSE-MsgGUID: oEu2x0PZSYy9BQQzhzzByg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27977229"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="27977229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 15:48:33 -0700
X-CSE-ConnectionGUID: GtfowIDmTtC9v3ZTeyDjfw==
X-CSE-MsgGUID: auaq+BCsRHWI8s91sm8uMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="76493470"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 15:48:31 -0700
Date: Thu, 10 Oct 2024 00:48:28 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris.p.wilson@intel.com, andi.shyti@linux.intel.com,
 nirmoy.das@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v1] drm/i915/gt: Retry RING_HEAD reset until it sticks
Message-ID: <ZwcIPNb3E9TqonIR@ashyti-mobl2.lan>
References: <20241003141044.149748-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003141044.149748-1-nitin.r.gote@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nitin,

On Thu, Oct 03, 2024 at 07:40:44PM +0530, Nitin Gote wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> On Haswell, in particular, we see an issue where resets fails because
> the engine resumes from an incorrect RING_HEAD. Since the RING_HEAD
> doesn't point to the remaining requests to re-run, but may instead point
> into the uninitialised portion of the ring, the GPU may be then fed
> invalid instructions from a privileged context, oft pushing the GPU into
> an unrecoverable hang.
> 
> If at first the write doesn't succeed, try, try again.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/5432
> Testcase: igt/i915_selftest/hangcheck
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

I believe this is now Chris Wilson <chris.p.wilson@linux.intel.com>

> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
>  drivers/gpu/drm/i915/i915_utils.h             |  9 ++++
>  2 files changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 72277bc8322e..6427f07ed23e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -192,6 +192,7 @@ static bool stop_ring(struct intel_engine_cs *engine)
>  static int xcs_resume(struct intel_engine_cs *engine)
>  {
>  	struct intel_ring *ring = engine->legacy.ring;
> +	ktime_t kt;
>  
>  	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
>  		     ring->head, ring->tail);
> @@ -230,9 +231,20 @@ static int xcs_resume(struct intel_engine_cs *engine)
>  	set_pp_dir(engine);
>  
>  	/* First wake the ring up to an empty/idle ring */
> -	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
> +	until_timeout_ns(kt, 2 * NSEC_PER_MSEC) {

Can you please use the for loop directly here?

And we need some commenting here to understand. Besides, if the
change is for haswell, why don't we limit it to haswell?

> +		ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
> +		if (ENGINE_READ_FW(engine, RING_HEAD) == ring->head)
> +			break;
> +	}
> +

...

> @@ -259,16 +275,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>  	return 0;
>  
>  err:
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

I believe this is out of the scope of this patch and should go in
another patch.

>  	return -EIO;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 609214231ffc..538dfb8fa1d8 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -232,6 +232,15 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>  	}
>  }
>  
> +/*
> + * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
> + */
> +
> +#define until_timeout_ns(end, timeout_ns) \
> +	for ((end) = ktime_get() + (timeout_ns); \
> +			ktime_before(ktime_get(), (end)); \
> +			cpu_relax())
> +

If you use this directly above then you don't need for this
define.

Andi

>  /*
>   * __wait_for - magic wait macro
>   *
> -- 
> 2.25.1
