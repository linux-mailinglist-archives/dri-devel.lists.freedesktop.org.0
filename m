Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129A3F8493
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E23F89CD8;
	Thu, 26 Aug 2021 09:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F9588FFE;
 Thu, 26 Aug 2021 09:32:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204907838"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="204907838"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 02:32:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="527773570"
Received: from garrydex-mobl1.ger.corp.intel.com (HELO [10.213.254.71])
 ([10.213.254.71])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 02:32:56 -0700
Subject: Re: [Intel-gfx] [PATCH 08/27] drm/i915/selftests: Add a cancel
 request selftest that triggers a reset
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-9-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2aa468eb-e7a8-1617-1b92-7a8f8b6ae015@linux.intel.com>
Date: Thu, 26 Aug 2021 10:32:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826032327.18078-9-matthew.brost@intel.com>
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


On 26/08/2021 04:23, Matthew Brost wrote:
> Add a cancel request selftest that results in an engine reset to cancel
> the request as it is non-preemptable. Also insert a NOP request after
> the cancelled request and confirm that it completely successfully.

Which patch fixes a problem this exposes in the execlists implementation?

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 100 ++++++++++++++++++
>   1 file changed, 100 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index d67710d10615..e2c5db77f087 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -772,6 +772,98 @@ static int __cancel_completed(struct intel_engine_cs *engine)
>   	return err;
>   }
>   
> +static int __cancel_reset(struct intel_engine_cs *engine)
> +{
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq, *nop;
> +	unsigned long preempt_timeout_ms;
> +	int err = 0;
> +

You may need to skip the test if preempt timeout is compiled out or if 
GPU reset is altogether disabled.

> +	preempt_timeout_ms = engine->props.preempt_timeout_ms;
> +	engine->props.preempt_timeout_ms = 100;
> +
> +	if (igt_spinner_init(&spin, engine->gt))
> +		goto out_restore;
> +
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		err = PTR_ERR(ce);
> +		goto out_spin;
> +	}
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> +	if (IS_ERR(rq)) {
> +		err = PTR_ERR(rq);
> +		goto out_ce;
> +	}
> +
> +	pr_debug("%s: Cancelling active request\n", engine->name);

"active non-preemptable" perhaps?

> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +	if (!igt_wait_for_spinner(&spin, rq)) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("Failed to start spinner on %s\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_rq;
> +	}
> +
> +	nop = intel_context_create_request(ce);
> +	if (IS_ERR(nop))
> +		goto out_nop;
> +	i915_request_get(nop);
> +	i915_request_add(nop);
> +
> +	i915_request_cancel(rq, -EINTR);
> +
> +	if (i915_request_wait(rq, 0, HZ) < 0) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("%s: Failed to cancel hung request\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_nop;
> +	}
> +
> +	if (rq->fence.error != -EINTR) {
> +		pr_err("%s: fence not cancelled (%u)\n",
> +		       engine->name, rq->fence.error);
> +		err = -EINVAL;
> +		goto out_nop;
> +	}
> +
> +	if (i915_request_wait(nop, 0, HZ) < 0) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("%s: Failed to complete nop request\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_nop;
> +	}
> +
> +	if (nop->fence.error != 0) {
> +		pr_err("%s: Nop request errored (%u)\n",

Maybe s/nop/innocent/ in the respective log messages?

> +		       engine->name, nop->fence.error);
> +		err = -EINVAL;
> +	}
> +
> +out_nop:
> +	i915_request_put(nop);
> +out_rq:
> +	i915_request_put(rq);
> +out_ce:
> +	intel_context_put(ce);
> +out_spin:
> +	igt_spinner_fini(&spin);
> +out_restore:
> +	engine->props.preempt_timeout_ms = preempt_timeout_ms;
> +	if (err)
> +		pr_err("%s: %s error %d\n", __func__, engine->name, err);
> +	return err;
> +}
> +
>   static int live_cancel_request(void *arg)
>   {
>   	struct drm_i915_private *i915 = arg;
> @@ -804,6 +896,14 @@ static int live_cancel_request(void *arg)
>   			return err;
>   		if (err2)
>   			return err2;
> +
> +		/* Expects reset so call outside of igt_live_test_* */

Hm there are live tests like live_preempt_cancel which seemingly manage 
to do resets under the live test block.

Regards,

Tvrtko

> +		err = __cancel_reset(engine);
> +		if (err)
> +			return err;
> +
> +		if (igt_flush_test(i915))
> +			return -EIO;
>   	}
>   
>   	return 0;
> 
