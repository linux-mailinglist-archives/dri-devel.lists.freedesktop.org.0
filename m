Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA516D0929
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25B110E035;
	Thu, 30 Mar 2023 15:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BE510E035;
 Thu, 30 Mar 2023 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680189062; x=1711725062;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xIlJIKmawjiuh4ucrdQ+vsmcGMGV9Kboz0XfNJU9b40=;
 b=IMkexOHuGxxy1VRLv0HKRH76eb8lkKNsEvHexxMvVvOrs512JHozAhW4
 0W+R11Ybb9Bp6h62J1uAxOpGq7Bwes2A+K72MmP+4RCutkem+phM501D6
 4BYCmuvFwCY1BhHCqBhNXuZGTXuDVRZ8o/KCP1+ewwJI9rJ8Ok9c6ykB8
 oigjigsgVidlO34N4qHBnxvYa2HIiPEbo6jYRvF9OWIy26dDwHzxDeVD/
 b25eyEKXc2UtlEnN6+Y3mabrdCZeg51KkQLQJ5S1lMMJMZWj2YwltxVtT
 RnV7/WZTXjCm13pYMUOzOoLJ9hhBEsXC3FL9c948Jn/5ftgLitl0t29ur Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="320846845"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="320846845"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="828370914"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="828370914"
Received: from bjmcgrat-mobl.amr.corp.intel.com (HELO [10.213.215.205])
 ([10.213.215.205])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:10:39 -0700
Message-ID: <8c9e6931-e445-4df6-90e5-b648a3fa1b3b@linux.intel.com>
Date: Thu, 30 Mar 2023 16:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915/gt: Hold a wakeref for the active VM
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230330-hold_wakeref_for_active_vm-v1-1-baca712692f6@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230330-hold_wakeref_for_active_vm-v1-1-baca712692f6@intel.com>
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


On 30/03/2023 15:35, Andrzej Hajda wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> There may be a disconnect between the GT used by the engine and the GT
> used for the VM, requiring us to hold a wakeref on both while the GPU is
> active with this request.

Presumably this is for MTL? "drm/i1915/mtl: ..." ?

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> [ahajda: removed not-yet-upstremed wakeref tracking bits]
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.h   | 15 +++++++++++----
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c |  3 +++
>   2 files changed, 14 insertions(+), 4 deletions(-)
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

Above too are balance and plausible - media tile engine vs root tile VM, 
although at the moment it escapes me what exactly would go bad, like 
what gets powered down which is then access by the executing request and 
fails how?

>   }
>   
>   static inline struct intel_context *intel_context_get(struct intel_context *ce)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index e971b153fda976..ac0566c5e99e17 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -114,6 +114,9 @@ __queue_and_release_pm(struct i915_request *rq,
>   
>   	ENGINE_TRACE(engine, "parking\n");
>   
> +	GEM_BUG_ON(rq->context->active_count != 1);
> +	__intel_gt_pm_get(engine->gt);
> +

But this one I don't immediately get. Above we have get and put which is 
balanced - fine, but where is this extra get coming from, who will put 
it and where?

Regards,

Tvrtko

>   	/*
>   	 * We have to serialise all potential retirement paths with our
>   	 * submission, as we don't want to underflow either the
> 
> ---
> base-commit: 3385d6482cd60f2a0bbb0fa97b70ae7dbba4f95c
> change-id: 20230330-hold_wakeref_for_active_vm-7f013a449ef3
> 
> Best regards,
