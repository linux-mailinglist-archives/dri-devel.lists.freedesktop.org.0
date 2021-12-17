Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169DA478B33
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 13:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52DA10F2F0;
	Fri, 17 Dec 2021 12:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25A10F2EA;
 Fri, 17 Dec 2021 12:15:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="226600603"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="226600603"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 04:15:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="605881475"
Received: from cmccall-mobl2.ger.corp.intel.com (HELO [10.213.248.38])
 ([10.213.248.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 04:15:55 -0800
Message-ID: <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
Date: Fri, 17 Dec 2021 12:15:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/12/2021 15:07, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Log engine resets done by the GuC firmware in the similar way it is done
> by the execlists backend.
> 
> This way we have notion of where the hangs are before the GuC gains
> support for proper error capture.

Ping - any interest to log this info?

All there currently is a non-descriptive "[drm] GPU HANG: ecode 
12:0:00000000".

Also, will GuC be reporting the reason for the engine reset at any point?

Regards,

Tvrtko

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 97311119da6f..51512123dc1a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -11,6 +11,7 @@
>   #include "gt/intel_context.h"
>   #include "gt/intel_engine_pm.h"
>   #include "gt/intel_engine_heartbeat.h"
> +#include "gt/intel_engine_user.h"
>   #include "gt/intel_gpu_commands.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_clock_utils.h"
> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct intel_guc *guc,
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct drm_i915_private *i915 = gt->i915;
> -	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> +	struct intel_engine_cs *engine = ce->engine;
>   	intel_wakeref_t wakeref;
>   
> +	if (intel_engine_is_virtual(engine)) {
> +		drm_notice(&i915->drm, "%s class, engines 0x%x; GuC engine reset\n",
> +			   intel_engine_class_repr(engine->class),
> +			   engine->mask);
> +		engine = guc_virtual_get_sibling(engine, 0);
> +	} else {
> +		drm_notice(&i915->drm, "%s GuC engine reset\n", engine->name);
> +	}
> +
>   	intel_engine_set_hung_context(engine, ce);
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>   		i915_capture_error_state(gt, engine->mask);
> 
