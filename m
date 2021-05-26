Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928913914DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812E06EC65;
	Wed, 26 May 2021 10:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F9E6EC64;
 Wed, 26 May 2021 10:26:34 +0000 (UTC)
IronPort-SDR: 85Hc6fJlXXBYhMXyUfrGk1RP4Ee5EeFT7PxjhMOKPK4aQ1lFBWaXjvwbB3xgvaY4QSntnI3jmr
 pb4vRLPk9vVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="288009830"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="288009830"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:26:34 -0700
IronPort-SDR: jMm20r4BS1HXjpDK0FSFshz5AHi2TAKNfxyaB8jWfv1sogFtEHNUtpx+R1ApppaiuUMKZX1m6u
 lk+W3GWiVxxQ==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="479875002"
Received: from wardmich-mobl.ger.corp.intel.com (HELO [10.213.209.181])
 ([10.213.209.181])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:26:32 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 49/97] drm/i915/guc: Disable engine
 barriers with GuC during unpin
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-50-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9e3af765-4baa-25aa-f1d3-5d8f24e8feed@linux.intel.com>
Date: Wed, 26 May 2021 11:26:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-50-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/05/2021 20:14, Matthew Brost wrote:
> Disable engine barriers for unpinning with GuC. This feature isn't
> needed with the GuC as it disables context scheduling before unpinning

Just isn't needed or causes a problem somehow?

> which guarantees the HW will not reference the context. Hence it is
> not necessary to defer unpinning until a kernel context request
> completes on each engine in the context engine mask.

Hm context engine mask does not come across as something used in this patch.

Engine PM works fine with this change - i915 does not turn of the 
engine/gt too early? I mean context unpin is on retire and the guc 
disable of context scheduling is sync or async? Even when the kernel 
context request gets emitted on engine pm put there is no race?

> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
>   drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
>   drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
>   drivers/gpu/drm/i915/i915_active.c         |  3 +++
>   4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 1499b8aace2a..7f97753ab164 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
>   
>   	__i915_active_acquire(&ce->active);
>   
> -	if (intel_context_is_barrier(ce))
> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
>   		return 0;
>   
>   	/* Preallocate tracking nodes */
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 92ecbab8c1cd..9b211ca5ecc7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -16,6 +16,7 @@
>   #include "intel_engine_types.h"
>   #include "intel_ring_types.h"
>   #include "intel_timeline_types.h"
> +#include "uc/intel_guc_submission.h"
>   
>   #define CE_TRACE(ce, fmt, ...) do {					\
>   	const struct intel_context *ce__ = (ce);			\
> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
> index 26685b927169..fa7b99a671dd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> @@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
>   	 * This test makes sure that the context is kept alive until a
>   	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
>   	 * with no more outstanding requests).
> +	 *
> +	 * In GuC submission mode we don't use idle barriers and we instead
> +	 * get a message from the GuC to signal that it is safe to unpin the
> +	 * context from memory.
>   	 */
> +	if (intel_engine_uses_guc(engine))
> +		return 0;
>   
>   	if (intel_engine_pm_is_awake(engine)) {
>   		pr_err("%s is awake before starting %s!\n",
> @@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
>   	 * on the context image remotely (intel_context_prepare_remote_request),
>   	 * which inserts foreign fences into intel_context.active, does not
>   	 * clobber the idle-barrier.
> +	 *
> +	 * In GuC submission mode we don't use idle barriers.
>   	 */
> +	if (intel_engine_uses_guc(engine))
> +		return 0;
>   
>   	if (intel_engine_pm_is_awake(engine)) {
>   		pr_err("%s is awake before starting %s!\n",
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index b1aa1c482c32..9a264898bb91 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -968,6 +968,9 @@ void i915_active_acquire_barrier(struct i915_active *ref)
>   
>   	GEM_BUG_ON(i915_active_is_idle(ref));
>   
> +	if (llist_empty(&ref->preallocated_barriers))
> +		return;

This hunk is not needed since the effectively same check is few lines below.

Regards,

Tvrtko

> +
>   	/*
>   	 * Transfer the list of preallocated barriers into the
>   	 * i915_active rbtree, but only as proto-nodes. They will be
> 
