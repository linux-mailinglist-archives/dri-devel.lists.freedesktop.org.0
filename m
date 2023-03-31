Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE06D2302
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD2410F270;
	Fri, 31 Mar 2023 14:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A3810F272;
 Fri, 31 Mar 2023 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680274317; x=1711810317;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KNTROMmrQDGMIqNaw58W/qUu3KXgBuSUINmQI12vqQM=;
 b=dQgdE1MWLEKiLPUZ4HwzEv/dE4BHZoQtqaLUCNqT8MmZ4jFEMdQm2MAb
 ADRrAKJnFe+kHMXEChlZcWTys5BsfkFkjbwVlTRpqAfGPBII5Lx0pPBze
 PE+EWhobNFjQNLqqyLSsRvsLZHX7Fq59jkN6UtJPEoP6CvdrD/jS5pW8I
 8YQA0SuKU/UKOIrL/VamzCahjQ1hnnNXF2UCFwJJ5XD6Uf1RFZXnsd160
 /e2LqUyRZd2PTHQxx7Ao8ABx8/wRmY5Xud3VvvUzzKD5OFlxkwiuONdTo
 nsS4H7qIY+YwMtvcbqCi9ffXzAfytIphO1QY6d7rvw1JCpcEtTLmDsxGe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321859373"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321859373"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 07:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="774382258"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="774382258"
Received: from bpower-mobl3.ger.corp.intel.com (HELO [10.213.225.27])
 ([10.213.225.27])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 07:51:53 -0700
Message-ID: <6807bede-7e95-d53a-5fed-0e7513b91d50@linux.intel.com>
Date: Fri, 31 Mar 2023 15:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/i915/gt: Hold a wakeref for the active VM
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31/03/2023 15:16, Andrzej Hajda wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> There may be a disconnect between the GT used by the engine and the GT
> used for the VM, requiring us to hold a wakeref on both while the GPU is
> active with this request.
> 
> v2: added explanation to __queue_and_release_pm
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> [ahajda: removed not-yet-upstremed wakeref tracking bits]
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20230330-hold_wakeref_for_active_vm-v1-1-baca712692f6@intel.com
> ---
>   drivers/gpu/drm/i915/gt/intel_context.h   | 15 +++++++++++----
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c |  9 +++++++++
>   2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 0a8d553da3f439..48f888c3da083b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -14,6 +14,7 @@
>   #include "i915_drv.h"
>   #include "intel_context_types.h"
>   #include "intel_engine_types.h"
> +#include "intel_gt_pm.h"
>   #include "intel_ring_types.h"
>   #include "intel_timeline_types.h"
>   #include "i915_trace.h"
> @@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
>   static inline void intel_context_enter(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->timeline->mutex);
> -	if (!ce->active_count++)
> -		ce->ops->enter(ce);
> +	if (ce->active_count++)
> +		return;
> +
> +	ce->ops->enter(ce);
> +	intel_gt_pm_get(ce->vm->gt);
>   }
>   
>   static inline void intel_context_mark_active(struct intel_context *ce)
> @@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->timeline->mutex);
>   	GEM_BUG_ON(!ce->active_count);
> -	if (!--ce->active_count)
> -		ce->ops->exit(ce);
> +	if (--ce->active_count)
> +		return;
> +
> +	intel_gt_pm_put_async(ce->vm->gt);
> +	ce->ops->exit(ce);
>   }
>   
>   static inline struct intel_context *intel_context_get(struct intel_context *ce)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index e971b153fda976..ee531a5c142c77 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -114,6 +114,15 @@ __queue_and_release_pm(struct i915_request *rq,
>   
>   	ENGINE_TRACE(engine, "parking\n");
>   
> +	/*
> +	 * Open coded one half of intel_context_enter, which we have to omit
> +	 * here (see the large comment below) and because the other part must
> +	 * not be called due constructing directly with __i915_request_create
> +	 * which increments active count via intel_context_mark_active.
> +	 */
> +	GEM_BUG_ON(rq->context->active_count != 1);
> +	__intel_gt_pm_get(engine->gt);
> +
>   	/*
>   	 * We have to serialise all potential retirement paths with our
>   	 * submission, as we don't want to underflow either the

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
