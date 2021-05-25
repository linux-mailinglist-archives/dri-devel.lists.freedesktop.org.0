Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0138FE39
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8B6E9DE;
	Tue, 25 May 2021 09:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EF16E9DE;
 Tue, 25 May 2021 09:52:06 +0000 (UTC)
IronPort-SDR: hgMu8jTiF6OtV2fajgayY43V9prUx152oFk/EzFdGb47gzVgsHIgQM4fJfUKqqmt9fNdusnrKT
 h58+FaXJW8KA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287725591"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="287725591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:52:05 -0700
IronPort-SDR: LbfMFEuDXIN1gshz2wxQ7QWvBaN4Gnry/2HlmX7KZaBhC3iWQDUgXC8dWYVgZPmVLqMQIDpcec
 vzD0NlmvJbgw==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442471348"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:52:03 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 53/97] drm/i915/guc: Disable semaphores
 when using GuC scheduling
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-54-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <295c0e48-5091-504a-5a81-10a60fa900f4@linux.intel.com>
Date: Tue, 25 May 2021 10:52:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-54-matthew.brost@intel.com>
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
> Disable semaphores when using GuC scheduling as semaphores are broken in
> the current GuC firmware.

What is "current"? Given that the patch itself is like year and a half old.

Regards,

Tvrtko

> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 993faa213b41..d30260ffe2a7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -230,7 +230,8 @@ static void intel_context_set_gem(struct intel_context *ce,
>   		ce->timeline = intel_timeline_get(ctx->timeline);
>   
>   	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> -	    intel_engine_has_timeslices(ce->engine))
> +	    intel_engine_has_timeslices(ce->engine) &&
> +	    intel_engine_has_semaphores(ce->engine))
>   		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>   
>   	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> @@ -1939,7 +1940,8 @@ static int __apply_priority(struct intel_context *ce, void *arg)
>   	if (!intel_engine_has_timeslices(ce->engine))
>   		return 0;
>   
> -	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
> +	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> +	    intel_engine_has_semaphores(ce->engine))
>   		intel_context_set_use_semaphores(ce);
>   	else
>   		intel_context_clear_use_semaphores(ce);
> 
