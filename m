Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB507403B44
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 16:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33616E15E;
	Wed,  8 Sep 2021 14:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2B26E155;
 Wed,  8 Sep 2021 14:15:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220550012"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="220550012"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 07:15:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="465648089"
Received: from eoinwals-mobl.ger.corp.intel.com (HELO [10.213.233.175])
 ([10.213.233.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 07:15:08 -0700
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915/xehp: Extend uninterruptible
 OpenCL workloads to CCS
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-9-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <404363a8-cb5f-6066-c6e8-c19d28fb43f7@linux.intel.com>
Date: Wed, 8 Sep 2021 15:15:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907171916.2548047-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/09/2021 18:19, Matt Roper wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Now that OpenCL workloads can run on the compute engine, we need to set
> preempt_timeout_ms = 0 on the CCS engines too.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2f719f0ecac3..7e6ac0ae1f07 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -377,16 +377,17 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
>   	engine->props.timeslice_duration_ms =
>   		CONFIG_DRM_I915_TIMESLICE_DURATION;
>   
> -	/* Override to uninterruptible for OpenCL workloads. */
> -	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
> -		engine->props.preempt_timeout_ms = 0;
> -
>   	/* features common between engines sharing EUs */
>   	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
>   		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
>   		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
>   	}
>   
> +	/* Override to uninterruptible for OpenCL workloads. */
> +	if (GRAPHICS_VER(i915) == 12 &&
> +	    engine->flags & I915_ENGINE_HAS_RCS_REG_STATE)
> +		engine->props.preempt_timeout_ms = 0;
> +
>   	engine->defaults = engine->props; /* never to change again */
>   
>   	engine->context_size = intel_engine_context_size(gt, engine->class);
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
