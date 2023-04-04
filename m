Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723006D679F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B210E3AD;
	Tue,  4 Apr 2023 15:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65410E3AD;
 Tue,  4 Apr 2023 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680622786; x=1712158786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1E4eQJ2R8I5+t5D+4d5CSh9PlLTGMtzXUU+KR/WKjYk=;
 b=hFCaSJI2dppxmTCrTFau1L+DnyhIQcGmJGX19cEh+dClrU/N0oe+LZTU
 SJOqgeTbDeJ99/8PZEZE/P9Xw1A30vnyDh2ayxX9R4VAUDwiyHtvDJ9DO
 WHSIKqwxYDk0C+t+69L7fzgLNWDnedlCslLcwWYloHj4RipO38eqNDs4v
 H2Q8vPgjTsjXnQR0tIXld8G5ZmdxV2DosKkwl4NqFHBkVbzxhRQoE1JVY
 vnyZ41x3OiKK9vY1eqVoEA+RqI9FjUOZvG/JUDKasIrEZBjN7eUmsvnIS
 oJS6mf0vDYyVesTwDCZMDS9jbEnKdoj9ev2frLv2ivhMFU0gskzrS3XdD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370039757"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370039757"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="1016148383"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="1016148383"
Received: from vferra-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:39:40 -0700
Date: Tue, 4 Apr 2023 17:39:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Hold a wakeref for the active VM
Message-ID: <ZCxEoelnOSpRiy6A@ashyti-mobl2.lan>
References: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 0a8d553da3f439..48f888c3da083b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -14,6 +14,7 @@
>  #include "i915_drv.h"
>  #include "intel_context_types.h"
>  #include "intel_engine_types.h"
> +#include "intel_gt_pm.h"
>  #include "intel_ring_types.h"
>  #include "intel_timeline_types.h"
>  #include "i915_trace.h"
> @@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
>  static inline void intel_context_enter(struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->timeline->mutex);
> -	if (!ce->active_count++)
> -		ce->ops->enter(ce);
> +	if (ce->active_count++)
> +		return;
> +
> +	ce->ops->enter(ce);
> +	intel_gt_pm_get(ce->vm->gt);
>  }
>  
>  static inline void intel_context_mark_active(struct intel_context *ce)
> @@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->timeline->mutex);
>  	GEM_BUG_ON(!ce->active_count);
> -	if (!--ce->active_count)
> -		ce->ops->exit(ce);
> +	if (--ce->active_count)
> +		return;
> +
> +	intel_gt_pm_put_async(ce->vm->gt);
> +	ce->ops->exit(ce);

shouldn't these two be swapped?

>  }
>  
>  static inline struct intel_context *intel_context_get(struct intel_context *ce)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index e971b153fda976..ee531a5c142c77 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -114,6 +114,15 @@ __queue_and_release_pm(struct i915_request *rq,
>  
>  	ENGINE_TRACE(engine, "parking\n");
>  
> +	/*
> +	 * Open coded one half of intel_context_enter, which we have to omit
> +	 * here (see the large comment below) and because the other part must
> +	 * not be called due constructing directly with __i915_request_create
> +	 * which increments active count via intel_context_mark_active.
> +	 */
> +	GEM_BUG_ON(rq->context->active_count != 1);
> +	__intel_gt_pm_get(engine->gt);

where is it's brother "put"?

Thanks,
Andi

> +
>  	/*
>  	 * We have to serialise all potential retirement paths with our
>  	 * submission, as we don't want to underflow either the
> 
> ---
> base-commit: 3385d6482cd60f2a0bbb0fa97b70ae7dbba4f95c
> change-id: 20230330-hold_wakeref_for_active_vm-7f013a449ef3
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
