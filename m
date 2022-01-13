Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6B48DD73
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 19:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A2F10E434;
	Thu, 13 Jan 2022 18:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8941910E275;
 Thu, 13 Jan 2022 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642097240; x=1673633240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o2REkMe5S/vX5qJVW9l/PRh0AZ7IesGHHtsuSasOVNg=;
 b=Zr0esW+lL2ug7K9pMkhxBW/Mcr/gq6/bpKLxKANfeCGyP2bXES5f1ZRo
 kxcYSLMpxvgNRWo2Sqp6qxEnlMeYB/nuqZ94H+73HpvNaaA4ic5/1znzK
 jX15s7fCStik916k3uGC/aAtHF4k76U0cOeQnDLOVXesCucjYOVyXeliH
 50tq0roRBGUzZXCbRJ7Bq25gYYEYIjTz2p5SCUexSMmkpUxk4x0Nai3wb
 1kqAtyMhzZhgSRWRQwJNj3cFGOKef4qMn9ngt0z4qMWCAED2ev0mBPNkR
 4WS4DjLvjDn/dxpfsywGgEptFsB6d1bEhwgQ7OuNU70a7U5TiYR4wSZSh A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="241639725"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="241639725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:07:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="529769352"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:07:19 -0800
Date: Thu, 13 Jan 2022 10:01:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/selftests: Add a cancel request selftest
 that triggers a reset
Message-ID: <20220113180128.GA20915@jons-linux-dev-box>
References: <20220111231109.23244-1-matthew.brost@intel.com>
 <20220111231109.23244-2-matthew.brost@intel.com>
 <5b396396-46c2-30b4-09a6-1d23d474c978@intel.com>
 <20220113173408.GA20135@jons-linux-dev-box>
 <bc06adfc-d676-a687-678b-97ff64886537@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc06adfc-d676-a687-678b-97ff64886537@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 09:59:35AM -0800, John Harrison wrote:
> On 1/13/2022 09:34, Matthew Brost wrote:
> > On Thu, Jan 13, 2022 at 09:33:12AM -0800, John Harrison wrote:
> > > On 1/11/2022 15:11, Matthew Brost wrote:
> > > > Add a cancel request selftest that results in an engine reset to cancel
> > > > the request as it is non-preemptable. Also insert a NOP request after
> > > > the cancelled request and confirm that it completes successfully.
> > > > 
> > > > v2:
> > > >    (Tvrtko)
> > > >     - Skip test if preemption timeout compiled out
> > > >     - Skip test if engine reset isn't supported
> > > >     - Update debug prints to be more descriptive
> > > > v3:
> > > >     - Add comment explaining test
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
> > > >    1 file changed, 117 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> > > > index 7f66f6d299b26..f78de99d5ae1e 100644
> > > > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > > > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > > > @@ -782,6 +782,115 @@ static int __cancel_completed(struct intel_engine_cs *engine)
> > > >    	return err;
> > > >    }
> > > > +/*
> > > > + * Test to prove a non-preemptable request can be cancelled and a subsequent
> > > > + * request on the same context can successfully complete after cancallation.
> > > cancellation
> > > 
> > Yep.
> > 
> > > > + *
> > > > + * Testing methodology is to create non-preemptable request and submit it,
> > > a non-preemptible
> > > 
> > Yep.
> > 
> > > > + * wait for spinner to start, create a NOP request and submit it, cancel the
> > > > + * spinner, wait for spinner to complete and verify it failed with an error,
> > > > + * finally wait for NOP request to complete verify it succeeded without an
> > > > + * error. Preemption timeout also reduced / restored so test runs in a timely
> > > > + * maner.
> > > > + */
> > > > +static int __cancel_reset(struct drm_i915_private *i915,
> > > > +			  struct intel_engine_cs *engine)
> > > > +{
> > > > +	struct intel_context *ce;
> > > > +	struct igt_spinner spin;
> > > > +	struct i915_request *rq, *nop;
> > > > +	unsigned long preempt_timeout_ms;
> > > > +	int err = 0;
> > > > +
> > > > +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT ||
> > > Does this matter? The test is overriding the default anyway.
> > > 
> > Yes. Execlists don't try to preempt anything if
> > CONFIG_DRM_I915_PREEMPT_TIMEOUT is turned off. If we wan't to avoid the
> > cancelation doing a full GT reset, CONFIG_DRM_I915_PREEMPT_TIMEOUT
> > should be turned on.
> Hmm, I would read that as a bug. The description for the config parameter
> is:
>           "This is adjustable via
>           /sys/class/drm/card?/engine/*/preempt_timeout_ms
> 
>           May be 0 to disable the timeout.
> 
>           The compiled in default may get overridden at driver probe time on
>           certain platforms and certain engines which will be reflected in
> the
>           sysfs control."
> 
> I would take that as meaning that even if the compiled in default is zero,
> the user or even the i915 driver itself could override that at runtime and
> enable pre-emption again. So having any code use this as a flag is broken.
> Indeed, any code other than 'engine->default_preempt_timeout =
> CONFIG_PREEMPT_TIMEOUT' is broken, IMHO.
> 

Can't really argue against you here.

> But maybe that's for a different patch. If the driver is already behaving
> badly and doing the correct thing here will actually cause test failures
> then you can't really do much other than follow the existing bad behaviour.
>

Yea, agree it is out of scope this patch / series. We can cleanup the
execlists code in a follow up patch if needed + loop in an execlists
expert for a reviewer. Maybe there is a unknown reason that code is
doing this?

Matt

> John.
> 
> 
> > > > +	    !intel_has_reset_engine(engine->gt))
> > > > +		return 0;
> > > > +
> > > > +	preempt_timeout_ms = engine->props.preempt_timeout_ms;
> > > > +	engine->props.preempt_timeout_ms = 100;
> > > > +
> > > > +	if (igt_spinner_init(&spin, engine->gt))
> > > > +		goto out_restore;
> > > > +
> > > > +	ce = intel_context_create(engine);
> > > > +	if (IS_ERR(ce)) {
> > > > +		err = PTR_ERR(ce);
> > > > +		goto out_spin;
> > > > +	}
> > > > +
> > > > +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> > > > +	if (IS_ERR(rq)) {
> > > > +		err = PTR_ERR(rq);
> > > > +		goto out_ce;
> > > > +	}
> > > > +
> > > > +	pr_debug("%s: Cancelling active non-preemptable request\n",
> > > > +		 engine->name);
> > > > +	i915_request_get(rq);
> > > > +	i915_request_add(rq);
> > > > +	if (!igt_wait_for_spinner(&spin, rq)) {
> > > > +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> > > > +
> > > > +		pr_err("Failed to start spinner on %s\n", engine->name);
> > > > +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> > > > +		err = -ETIME;
> > > > +		goto out_rq;
> > > > +	}
> > > > +
> > > > +	nop = intel_context_create_request(ce);
> > > > +	if (IS_ERR(nop))
> > > > +		goto out_nop;
> > > Should be out_rq?
> > > 
> > Yes, it should.
> > 
> > Matt
> > 
> > > John.
> > > 
> > > 
> > > > +	i915_request_get(nop);
> > > > +	i915_request_add(nop);
> > > > +
> > > > +	i915_request_cancel(rq, -EINTR);
> > > > +
> > > > +	if (i915_request_wait(rq, 0, HZ) < 0) {
> > > > +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> > > > +
> > > > +		pr_err("%s: Failed to cancel hung request\n", engine->name);
> > > > +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> > > > +		err = -ETIME;
> > > > +		goto out_nop;
> > > > +	}
> > > > +
> > > > +	if (rq->fence.error != -EINTR) {
> > > > +		pr_err("%s: fence not cancelled (%u)\n",
> > > > +		       engine->name, rq->fence.error);
> > > > +		err = -EINVAL;
> > > > +		goto out_nop;
> > > > +	}
> > > > +
> > > > +	if (i915_request_wait(nop, 0, HZ) < 0) {
> > > > +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> > > > +
> > > > +		pr_err("%s: Failed to complete nop request\n", engine->name);
> > > > +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> > > > +		err = -ETIME;
> > > > +		goto out_nop;
> > > > +	}
> > > > +
> > > > +	if (nop->fence.error != 0) {
> > > > +		pr_err("%s: Nop request errored (%u)\n",
> > > > +		       engine->name, nop->fence.error);
> > > > +		err = -EINVAL;
> > > > +	}
> > > > +
> > > > +out_nop:
> > > > +	i915_request_put(nop);
> > > > +out_rq:
> > > > +	i915_request_put(rq);
> > > > +out_ce:
> > > > +	intel_context_put(ce);
> > > > +out_spin:
> > > > +	igt_spinner_fini(&spin);
> > > > +out_restore:
> > > > +	engine->props.preempt_timeout_ms = preempt_timeout_ms;
> > > > +	if (err)
> > > > +		pr_err("%s: %s error %d\n", __func__, engine->name, err);
> > > > +	return err;
> > > > +}
> > > > +
> > > >    static int live_cancel_request(void *arg)
> > > >    {
> > > >    	struct drm_i915_private *i915 = arg;
> > > > @@ -814,6 +923,14 @@ static int live_cancel_request(void *arg)
> > > >    			return err;
> > > >    		if (err2)
> > > >    			return err2;
> > > > +
> > > > +		/* Expects reset so call outside of igt_live_test_* */
> > > > +		err = __cancel_reset(i915, engine);
> > > > +		if (err)
> > > > +			return err;
> > > > +
> > > > +		if (igt_flush_test(i915))
> > > > +			return -EIO;
> > > >    	}
> > > >    	return 0;
> 
