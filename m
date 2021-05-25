Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98223903C5
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 16:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618896EA3F;
	Tue, 25 May 2021 14:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057AC6EA3B;
 Tue, 25 May 2021 14:19:54 +0000 (UTC)
IronPort-SDR: q0uF2jQoducmJ5nSoCIOJ0NADKefNaH4kmmAeQu0V0Y+4WKT/y+SKLZIahH8kFEO7ztUu8rwqZ
 56TkZ5zrxsQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202240579"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202240579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 07:19:52 -0700
IronPort-SDR: JaC8ErFap8+Rnpug6svDD4ahaEcq74CYjynwsBVNKbdeEzoG6hrpw7Ak5cwjJRoYO6HksaTJcM
 aymWnU89yplQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442565087"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 07:19:49 -0700
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 intel-gfx@lists.freedesktop.org, mahesh.meena@intel.com,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
Date: Tue, 25 May 2021 15:19:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
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


+ dri-devel as per process

On 25/05/2021 14:55, Tejas Upadhyay wrote:
> v2: Only declare timeslicing if we can safely preempt userspace.

Commit message got butchered up somehow so you'll need to fix that at 
some point.

Regards,

Tvrtko

> Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
>   include/uapi/drm/i915_drm.h                 | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 3cca7ea2d6ea..12d165566ed2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
>   		MAP(HAS_PREEMPTION, PREEMPTION),
>   		MAP(HAS_SEMAPHORES, SEMAPHORES),
>   		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
> +		MAP(TIMESLICE_BIT, TIMESLICING),
>   #undef MAP
>   	};
>   	struct intel_engine_cs *engine;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index c2c7759b7d2e..af2212d6113c 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
>   #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
>   #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
>   #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
> +#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
>   
>   #define I915_PARAM_HUC_STATUS		 42
>   
> 
