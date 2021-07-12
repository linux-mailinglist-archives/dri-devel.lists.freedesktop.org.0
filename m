Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB83C6277
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 20:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0118C896BF;
	Mon, 12 Jul 2021 18:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E1896BF;
 Mon, 12 Jul 2021 18:11:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="189715247"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="189715247"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:11:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="412665245"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.125.18])
 ([10.209.125.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:11:48 -0700
Subject: Re: [PATCH 27/47] drm/i915: Track 'serial' counts for virtual engines
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-28-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1f82fc27-d857-228a-99fb-038295be77d0@intel.com>
Date: Mon, 12 Jul 2021 11:11:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-28-matthew.brost@intel.com>
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
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The serial number tracking of engines happens at the backend of
> request submission and was expecting to only be given physical
> engines. However, in GuC submission mode, the decomposition of virtual
> to physical engines does not happen in i915. Instead, requests are
> submitted to their virtual engine mask all the way through to the
> hardware (i.e. to GuC). This would mean that the heart beat code
> thinks the physical engines are idle due to the serial number not
> incrementing.
>
> This patch updates the tracking to decompose virtual engines into
> their physical constituents and tracks the request against each. This
> is not entirely accurate as the GuC will only be issuing the request
> to one physical engine. However, it is the best that i915 can do given
> that it has no knowledge of the GuC's scheduling decisions.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Need to pull in the updated subject line and commit description from 
Tvrtko in the RFC patch set review.

John.

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2 ++
>   .../gpu/drm/i915/gt/intel_execlists_submission.c |  6 ++++++
>   drivers/gpu/drm/i915/gt/intel_ring_submission.c  |  6 ++++++
>   drivers/gpu/drm/i915/gt/mock_engine.c            |  6 ++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 ++++++++++++++++
>   drivers/gpu/drm/i915/i915_request.c              |  4 +++-
>   6 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 5b91068ab277..1dc59e6c9a92 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -388,6 +388,8 @@ struct intel_engine_cs {
>   	void		(*park)(struct intel_engine_cs *engine);
>   	void		(*unpark)(struct intel_engine_cs *engine);
>   
> +	void		(*bump_serial)(struct intel_engine_cs *engine);
> +
>   	void		(*set_default_submission)(struct intel_engine_cs *engine);
>   
>   	const struct intel_context_ops *cops;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index bd4ced794ff9..9cfb8800a0e6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3203,6 +3203,11 @@ static void execlists_release(struct intel_engine_cs *engine)
>   	lrc_fini_wa_ctx(engine);
>   }
>   
> +static void execlist_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
>   static void
>   logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   {
> @@ -3212,6 +3217,7 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   
>   	engine->cops = &execlists_context_ops;
>   	engine->request_alloc = execlists_request_alloc;
> +	engine->bump_serial = execlist_bump_serial;
>   
>   	engine->reset.prepare = execlists_reset_prepare;
>   	engine->reset.rewind = execlists_reset_rewind;
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 5d42a12ef3d6..e1506b280df1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -1044,6 +1044,11 @@ static void setup_irq(struct intel_engine_cs *engine)
>   	}
>   }
>   
> +static void ring_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
>   static void setup_common(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> @@ -1063,6 +1068,7 @@ static void setup_common(struct intel_engine_cs *engine)
>   
>   	engine->cops = &ring_context_ops;
>   	engine->request_alloc = ring_request_alloc;
> +	engine->bump_serial = ring_bump_serial;
>   
>   	/*
>   	 * Using a global execution timeline; the previous final breadcrumb is
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 68970398e4ef..9203c766db80 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -292,6 +292,11 @@ static void mock_engine_release(struct intel_engine_cs *engine)
>   	intel_engine_fini_retire(engine);
>   }
>   
> +static void mock_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
>   struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
>   				    const char *name,
>   				    int id)
> @@ -318,6 +323,7 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
>   
>   	engine->base.cops = &mock_context_ops;
>   	engine->base.request_alloc = mock_request_alloc;
> +	engine->base.bump_serial = mock_bump_serial;
>   	engine->base.emit_flush = mock_emit_flush;
>   	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
>   	engine->base.submit_request = mock_submit_request;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ccbcf024b31b..d1badd7137b7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1496,6 +1496,20 @@ static void guc_release(struct intel_engine_cs *engine)
>   	lrc_fini_wa_ctx(engine);
>   }
>   
> +static void guc_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
> +static void virtual_guc_bump_serial(struct intel_engine_cs *engine)
> +{
> +	struct intel_engine_cs *e;
> +	intel_engine_mask_t tmp, mask = engine->mask;
> +
> +	for_each_engine_masked(e, engine->gt, mask, tmp)
> +		e->serial++;
> +}
> +
>   static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   {
>   	/* Default vfuncs which can be overridden by each engine. */
> @@ -1504,6 +1518,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   
>   	engine->cops = &guc_context_ops;
>   	engine->request_alloc = guc_request_alloc;
> +	engine->bump_serial = guc_bump_serial;
>   
>   	engine->sched_engine->schedule = i915_schedule;
>   
> @@ -1836,6 +1851,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   
>   	ve->base.cops = &virtual_guc_context_ops;
>   	ve->base.request_alloc = guc_request_alloc;
> +	ve->base.bump_serial = virtual_guc_bump_serial;
>   
>   	ve->base.submit_request = guc_submit_request;
>   
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 7f7aa096e873..de9deb95b8b1 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -692,7 +692,9 @@ bool __i915_request_submit(struct i915_request *request)
>   				     request->ring->vaddr + request->postfix);
>   
>   	trace_i915_request_execute(request);
> -	engine->serial++;
> +	if (engine->bump_serial)
> +		engine->bump_serial(engine);
> +
>   	result = true;
>   
>   	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));

