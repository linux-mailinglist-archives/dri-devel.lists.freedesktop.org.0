Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1374748C3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75910E5C7;
	Tue, 14 Dec 2021 17:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F1E10E398;
 Tue, 14 Dec 2021 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639501430; x=1671037430;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a45f6CeRIbOy07vN63xqvaDwyQGcm4PUnEyGSpb5KxU=;
 b=KEWzBV1gwg3Fd9iRFO29N3aqYI1t4BLLHUvWkW1UAB/oGgiJeYC6b0pJ
 iU//E52tQLLBf+8EIq+Bf5pv3YZJlNXfgy+brCzxuEC8gcnCQBtCk20Rl
 IS0Dom0KXSDR8LBOYca907eLO18I1Jp8NOfi/pjyjSVahROAxbr2XtlJE
 aE6+y6x06IXW9MAjkkmWU72s1nAw4mKvyJDpAjmHFfMxqn8zc7AH9IQDR
 hYuKEsSMQqONtWVAlm+NkLs+jjm6pWxhvJujRbgpe7HQuZTXGgAF6m8gk
 HW7ttxbhowhyA4ufGw7DeJW6N1n6tbIw9rkoQgSd7JhrjMwUCjbv5xpXG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="237761705"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="237761705"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:03:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="463866417"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:03:13 -0800
Date: Tue, 14 Dec 2021 08:57:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 7/7] drm/i915/guc: Selftest for stealing of guc ids
Message-ID: <20211214165751.GA27863@jons-linux-dev-box>
References: <20211211173545.23536-1-matthew.brost@intel.com>
 <20211211173545.23536-8-matthew.brost@intel.com>
 <4402aa52-8fc1-362b-4dcf-78b502959953@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4402aa52-8fc1-362b-4dcf-78b502959953@intel.com>
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

On Mon, Dec 13, 2021 at 04:26:07PM -0800, John Harrison wrote:
> On 12/11/2021 09:35, Matthew Brost wrote:
> > Testing the stealing of guc ids is hard from user space as we have 64k
> > guc_ids. Add a selftest, which artificially reduces the number of guc
> > ids, and forces a steal. Description of test below.
> Last sentence seems redundant.
> 

Will delete.

> > 
> > The test creates a spinner which is used to block all subsequent
> > submissions until it completes. Next, a loop creates a context and a NOP
> > request each iteration until the guc_ids are exhausted (request creation
> > returns -EAGAIN). The spinner is ended, unblocking all requests created
> > in the loop. At this point all guc_ids are exhausted but are available
> > to steal. Try to create another request which should successfully steal
> > a guc_id. Wait on last request to complete, idle GPU, verify a guc_id
> > was stolen via a counter, and exit the test. Test also artificially
> > reduces the number of guc_ids so the test runs in a timely manner.
> > 
> > v2:
> >   (John Harrison)
> >    - s/stole/stolen
> >    - Fix some wording in test description
> >    - Rework indexing into context array
> >    - Add test description to commit message
> >    - Fix typo in commit message
> >   (Checkpatch)
> >    - s/guc/(guc) in NUMBER_MULTI_LRC_GUC_ID
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 ++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  16 +-
> >   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 173 ++++++++++++++++++
> >   3 files changed, 196 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 1cb46098030d..f9240d4baa69 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -94,6 +94,11 @@ struct intel_guc {
> >   		 * @guc_ids: used to allocate new guc_ids, single-lrc
> >   		 */
> >   		struct ida guc_ids;
> > +		/**
> > +		 * @num_guc_ids: Number of guc_ids, selftest feature to be able
> > +		 * to reduce this number while testing.
> > +		 */
> > +		int num_guc_ids;
> >   		/**
> >   		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
> >   		 */
> > @@ -202,6 +207,13 @@ struct intel_guc {
> >   		 */
> >   		struct delayed_work work;
> >   	} timestamp;
> > +
> > +#ifdef CONFIG_DRM_I915_SELFTEST
> > +	/**
> > +	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
> > +	 */
> > +	int number_guc_id_stolen;
> > +#endif
> >   };
> >   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 96fcf869e3ff..99414b49ca6d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -145,7 +145,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
> >    * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> >    * multi-lrc.
> >    */
> > -#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
> > +#define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> > +	((guc)->submission_state.num_guc_ids / 16)
> >   /*
> >    * Below is a set of functions which control the GuC scheduling state which
> > @@ -1775,7 +1776,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   		  destroyed_worker_func);
> >   	guc->submission_state.guc_ids_bitmap =
> > -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
> > +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> >   	if (!guc->submission_state.guc_ids_bitmap)
> >   		return -ENOMEM;
> > @@ -1869,13 +1870,13 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	if (intel_context_is_parent(ce))
> >   		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > -					      NUMBER_MULTI_LRC_GUC_ID,
> > +					      NUMBER_MULTI_LRC_GUC_ID(guc),
> >   					      order_base_2(ce->parallel.number_children
> >   							   + 1));
> >   	else
> >   		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > -				     NUMBER_MULTI_LRC_GUC_ID,
> > -				     GUC_MAX_LRC_DESCRIPTORS,
> > +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > +				     guc->submission_state.num_guc_ids,
> >   				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> >   				     __GFP_NOWARN);
> >   	if (unlikely(ret < 0))
> > @@ -1941,6 +1942,10 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   		set_context_guc_id_invalid(cn);
> > +#ifdef CONFIG_DRM_I915_SELFTEST
> > +		guc->number_guc_id_stolen++;
> > +#endif
> > +
> >   		return 0;
> >   	} else {
> >   		return -EAGAIN;
> > @@ -3779,6 +3784,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
> >   void intel_guc_submission_init_early(struct intel_guc *guc)
> >   {
> > +	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> >   	guc->submission_supported = __guc_submission_supported(guc);
> >   	guc->submission_selected = __guc_submission_selected(guc);
> >   }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > index fb0e4a7bd8ca..90f5eb66281c 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > @@ -3,8 +3,21 @@
> >    * Copyright �� 2021 Intel Corporation
> >    */
> > +#include "selftests/igt_spinner.h"
> >   #include "selftests/intel_scheduler_helpers.h"
> > +static int request_add_spin(struct i915_request *rq, struct igt_spinner *spin)
> > +{
> > +	int err = 0;
> > +
> > +	i915_request_get(rq);
> > +	i915_request_add(rq);
> > +	if (spin && !igt_wait_for_spinner(spin, rq))
> > +		err = -ETIMEDOUT;
> > +
> > +	return err;
> > +}
> > +
> >   static struct i915_request *nop_user_request(struct intel_context *ce,
> >   					     struct i915_request *from)
> >   {
> > @@ -110,10 +123,170 @@ static int intel_guc_scrub_ctbs(void *arg)
> >   	return ret;
> >   }
> > +/*
> > + * intel_guc_steal_guc_ids - Test to exhaust all guc_ids and then steal one
> > + *
> > + * This test creates a spinner which is used to block all subsequent submissions
> > + * until it completes. Next, a loop creates a context and a NOP request each
> > + * iteration until the guc_ids are exhausted (request creation returns -EAGAIN).
> > + * The spinner is ended, unblocking all requests created in the loop. At this
> > + * point all guc_ids are exhausted but are available to steal. Try to create
> > + * another request which should successfully steal a guc_id. Wait on last
> > + * request to complete, idle GPU, verify a guc_id was stolen via a counter, and
> > + * exit the test. Test also artificially reduces the number of guc_ids so the
> > + * test runs in a timely manner.
> > + */
> > +static int intel_guc_steal_guc_ids(void *arg)
> > +{
> > +	struct intel_gt *gt = arg;
> > +	struct intel_guc *guc = &gt->uc.guc;
> > +	int ret, sv, context_index = 0;
> > +	intel_wakeref_t wakeref;
> > +	struct intel_engine_cs *engine;
> > +	struct intel_context **ce;
> > +	struct igt_spinner spin;
> > +	struct i915_request *spin_rq = NULL, *rq, *last = NULL;
> > +	int number_guc_id_stolen = guc->number_guc_id_stolen;
> > +
> > +	ce = kzalloc(sizeof(*ce) * GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL);
> > +	if (!ce) {
> > +		pr_err("Context array allocation failed\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> > +	engine = intel_selftest_find_any_engine(gt);
> > +	sv = guc->submission_state.num_guc_ids;
> > +	guc->submission_state.num_guc_ids = 4096;
> > +
> > +	/* Create spinner to block requests in below loop */
> > +	ce[context_index] = intel_context_create(engine);
> > +	if (IS_ERR(ce[context_index])) {
> > +		ce[context_index] = NULL;
> > +		ret = PTR_ERR(ce[context_index]);
> Um, this is now null!
> 

Ugh, wrong order. Will fix.

> > +		pr_err("Failed to create context: %d\n", ret);
> > +		goto err_wakeref;
> > +	}
> > +	ret = igt_spinner_init(&spin, engine->gt);
> > +	if (ret) {
> > +		pr_err("Failed to create spinner: %d\n", ret);
> > +		goto err_contexts;
> > +	}
> > +	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
> > +					     MI_ARB_CHECK);
> > +	if (IS_ERR(spin_rq)) {
> > +		ret = PTR_ERR(spin_rq);
> > +		pr_err("Failed to create spinner request: %d\n", ret);
> > +		goto err_contexts;
> > +	}
> > +	ret = request_add_spin(spin_rq, &spin);
> > +	if (ret) {
> > +		pr_err("Failed to add Spinner request: %d\n", ret);
> > +		goto err_spin_rq;
> > +	}
> > +
> > +	/* Use all guc_ids */
> > +	while (ret != -EAGAIN) {
> > +		ce[++context_index] = intel_context_create(engine);
> > +		if (IS_ERR(ce[context_index])) {
> > +			ce[context_index] = NULL;
> > +			ret = PTR_ERR(ce[context_index--]);
> And again.
>

Same.
 
> > +			pr_err("Failed to create context: %d\n", ret);
> > +			goto err_spin_rq;
> > +		}
> > +
> > +		rq = nop_user_request(ce[context_index], spin_rq);
> > +		if (IS_ERR(rq)) {
> > +			ret = PTR_ERR(rq);
> > +			rq = NULL;
> > +			if (ret != -EAGAIN) {
> > +				pr_err("Failed to create request, %d: %d\n",
> > +				       context_index, ret);
> > +				goto err_spin_rq;
> > +			}
> > +		} else {
> > +			if (last)
> > +				i915_request_put(last);
> > +			last = rq;
> > +		}
> > +	}
> > +
> > +	/* Release blocked requests */
> > +	igt_spinner_end(&spin);
> > +	ret = intel_selftest_wait_for_rq(spin_rq);
> > +	if (ret) {
> > +		pr_err("Spin request failed to complete: %d\n", ret);
> > +		i915_request_put(last);
> > +		goto err_spin_rq;
> > +	}
> > +	i915_request_put(spin_rq);
> > +	igt_spinner_fini(&spin);
> > +	spin_rq = NULL;
> > +
> > +	/* Wait for last request */
> > +	ret = i915_request_wait(last, 0, HZ * 30);
> > +	i915_request_put(last);
> > +	if (ret < 0) {
> > +		pr_err("Last request failed to complete: %d\n", ret);
> > +		goto err_spin_rq;
> > +	}
> > +
> > +	/* Try to steal guc_id */
> > +	rq = nop_user_request(ce[context_index], NULL);
> > +	if (IS_ERR(rq)) {
> > +		ret = PTR_ERR(rq);
> > +		pr_err("Failed to steal guc_id, %d: %d\n", context_index, ret);
> > +		goto err_spin_rq;
> > +	}
> > +
> > +	/* Wait for request with stolen guc_id */
> > +	ret = i915_request_wait(rq, 0, HZ);
> > +	i915_request_put(rq);
> > +	if (ret < 0) {
> > +		pr_err("Request with stolen guc_id failed to complete: %d\n",
> > +		       ret);
> > +		goto err_spin_rq;
> > +	}
> > +
> > +	/* Wait for idle */
> > +	ret = intel_gt_wait_for_idle(gt, HZ * 30);
> > +	if (ret < 0) {
> > +		pr_err("GT failed to idle: %d\n", ret);
> > +		goto err_spin_rq;
> > +	}
> > +
> > +	/* Verify a guc_id got stolen */
> got stolen -> was stolen
> 

Yes.

> > +	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
> > +		pr_err("No guc_ids stolenn");
> ids stolenn -> id was stolen
>

And yes.

> John.
> 
> > +		ret = -EINVAL;
> > +	} else {
> > +		ret = 0;
> > +	}
> > +
> > +err_spin_rq:
> > +	if (spin_rq) {
> > +		igt_spinner_end(&spin);
> > +		intel_selftest_wait_for_rq(spin_rq);
> > +		i915_request_put(spin_rq);
> > +		igt_spinner_fini(&spin);
> > +		intel_gt_wait_for_idle(gt, HZ * 30);
> > +	}
> > +err_contexts:
> > +	for (; context_index >= 0 && ce[context_index]; --context_index)
> > +		intel_context_put(ce[context_index]);
> > +err_wakeref:
> > +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> > +	kfree(ce);
> > +	guc->submission_state.num_guc_ids = sv;
> > +
> > +	return ret;
> > +}
> > +
> >   int intel_guc_live_selftests(struct drm_i915_private *i915)
> >   {
> >   	static const struct i915_subtest tests[] = {
> >   		SUBTEST(intel_guc_scrub_ctbs),
> > +		SUBTEST(intel_guc_steal_guc_ids),
> >   	};
> >   	struct intel_gt *gt = &i915->gt;
> 
