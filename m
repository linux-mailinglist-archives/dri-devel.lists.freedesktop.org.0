Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F506722EB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317D410E793;
	Wed, 18 Jan 2023 16:23:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DDF10E792;
 Wed, 18 Jan 2023 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674058990; x=1705594990;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9Fi480uzS5oBGcDSvrekY97oLJsbYkd3EZfuIFpLe2U=;
 b=IVJDYp3WmwYjaIbPaCbspXRiM0LXxSWK6rOoAqaXjq7cJDK7vkUbWN97
 H0O5YzZo6ReP0oCZZhl5SuPa3evqOpLUuFga1xPXW4KHQ3uHp67gvIqR7
 zPF7Dbltye4rfM/r9bJlcl734h/4ylbIUrBq+gjs3lxdMWqPR7FTuapc/
 P+vbSxLbfcXTJiszD3h8suavSP5X+5pSVDYE+cREKeqSwbHRU98XonUeG
 V8CLTq4znMlcfricnjgGIiDwEIyKuvWNZfyns6oktnJeZlIquE7vjeo7A
 9QONp8A+59R6y/25xHn8gGSeMceqh/ipGU7YJORCg+gJZgQizIEXK9fFO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312899539"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="312899539"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:22:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="988612254"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="988612254"
Received: from llvincen-mobl.ger.corp.intel.com (HELO [10.213.215.37])
 ([10.213.215.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:22:31 -0800
Message-ID: <f2c7519b-9a6b-e750-e64c-c1d38720391d@linux.intel.com>
Date: Wed, 18 Jan 2023 16:22:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230117213630.2897570-2-John.C.Harrison@Intel.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/01/2023 21:36, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When GuC support was added to error capture, the locking around the
> request object was broken. Fix it up.
> 
> The context based search manages the spinlocking around the search
> internally. So it needs to grab the reference count internally as
> well. The execlist only request based search relies on external
> locking, so it needs an external reference count. So no change to that
> code itself but the context version does change.
> 
> The only other caller is the code for dumping engine state to debugfs.
> That code wasn't previously getting an explicit reference at all as it
> does everything while holding the execlist specific spinlock. So that
> needs updaing as well as that spinlock doesn't help when using GuC
> submission. Rather than trying to conditionally get/put depending on
> submission model, just change it to always do the get/put.
> 
> In addition, intel_guc_find_hung_context() was not acquiring the
> correct spinlock before searching the request list. So fix that up too.
> 
> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset
> with GuC")
> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Michael Cheng <michael.cheng@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Bruce Chang <yu.bruce.chang@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c           |  1 +
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  7 ++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++++
>   drivers/gpu/drm/i915/i915_gpu_error.c             |  5 ++---
>   4 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index e94365b08f1ef..df64cf1954c1d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -552,6 +552,7 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   
>   		active = rq;
>   	}
> +	active = i915_request_get_rcu(active);
>   	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>   
>   	return active;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 922f1bb22dc68..517d1fb7ae333 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2236,10 +2236,13 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
>   	if (guc) {
>   		ce = intel_engine_get_hung_context(engine);
> -		if (ce)
> +		if (ce) {
> +			/* This will reference count the request (if found) */
>   			hung_rq = intel_context_find_active_request(ce);
> +		}
>   	} else {
>   		hung_rq = intel_engine_execlist_find_hung_request(engine);
> +		hung_rq = i915_request_get_rcu(hung_rq);

Looks like intel_engine_execlist_find_hung_request can return NULL which 
i915_request_get_rcu will not handle.

Maybe it would come up simpler if intel_context_find_active_request 
wouldn't be getting the reference and then you can get one here at a 
single place for both branches?

>   	}
>   
>   	if (hung_rq)
> @@ -2250,6 +2253,8 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	else
>   		intel_engine_dump_active_requests(&engine->sched_engine->requests,
>   						  hung_rq, m);
> +	if (hung_rq)
> +		i915_request_put(hung_rq);
>   }
>   
>   void intel_engine_dump(struct intel_engine_cs *engine,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e42..3b34a82d692be 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4820,6 +4820,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> +		bool found;
> +
>   		if (!kref_get_unless_zero(&ce->ref))
>   			continue;
>   
> @@ -4836,10 +4838,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   				goto next;
>   		}
>   
> +		found = false;
> +		spin_lock(&ce->guc_state.lock);
>   		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>   				continue;
>   
> +			found = true;
> +			break;
> +		}
> +		spin_unlock(&ce->guc_state.lock);
> +
> +		if (found) {
>   			intel_engine_set_hung_context(engine, ce);
>   
>   			/* Can only cope with one hang at a time... */
> @@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   			xa_lock(&guc->context_lookup);
>   			goto done;
>   		}
> +
>   next:
>   		intel_context_put(ce);
>   		xa_lock(&guc->context_lookup);

This hunk I have to leave for someone who know the GuC backend well.

Regards,

Tvrtko

> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9d5d5a397b64e..4107a0dfcca7d 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1607,6 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
>   	ce = intel_engine_get_hung_context(engine);
>   	if (ce) {
>   		intel_engine_clear_hung_context(engine);
> +		/* This will reference count the request (if found) */
>   		rq = intel_context_find_active_request(ce);
>   		if (!rq || !i915_request_started(rq))
>   			goto no_request_capture;
> @@ -1618,13 +1619,11 @@ capture_engine(struct intel_engine_cs *engine,
>   		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>   			spin_lock_irqsave(&engine->sched_engine->lock, flags);
>   			rq = intel_engine_execlist_find_hung_request(engine);
> +			rq = i915_request_get_rcu(rq);
>   			spin_unlock_irqrestore(&engine->sched_engine->lock,
>   					       flags);
>   		}
>   	}
> -	if (rq)
> -		rq = i915_request_get_rcu(rq);
> -
>   	if (!rq)
>   		goto no_request_capture;
>   
