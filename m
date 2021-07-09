Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A373C2B7D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C172089E8C;
	Fri,  9 Jul 2021 22:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8160C89D83;
 Fri,  9 Jul 2021 22:53:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="190171270"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="190171270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 15:53:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="649661619"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.142.243])
 ([10.212.142.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 15:53:30 -0700
Subject: Re: [PATCH 16/47] drm/i915/guc: Disable engine barriers with GuC
 during unpin
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-17-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <8d056c1a-dc4a-baed-1664-0f86db9e7c5c@intel.com>
Date: Fri, 9 Jul 2021 15:53:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/2021 00:04, Matthew Brost wrote:
> Disable engine barriers for unpinning with GuC. This feature isn't
> needed with the GuC as it disables context scheduling before unpinning
> which guarantees the HW will not reference the context. Hence it is
> not necessary to defer unpinning until a kernel context request
> completes on each engine in the context engine mask.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
>   drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
>   drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
>   3 files changed, 12 insertions(+), 1 deletion(-)
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
Would be better to have a scheduler flag to say whether barriers are 
required or not. That would prevent polluting front end code with back 
end details.

John.


>   
>   	/* Preallocate tracking nodes */
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 8a7199afbe61..a592a9605dc8 100644
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

