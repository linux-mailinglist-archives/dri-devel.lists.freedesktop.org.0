Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDB3CBDBD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E137B6E9DD;
	Fri, 16 Jul 2021 20:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87E6E9D7;
 Fri, 16 Jul 2021 20:24:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210599305"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210599305"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 13:24:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507246383"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 13:24:19 -0700
Date: Fri, 16 Jul 2021 13:13:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 44/51] drm/i915/selftest: Better error
 reporting from hangcheck selftest
Message-ID: <20210716201258.GA27739@sdutt-i7>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-45-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716201724.54804-45-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 01:17:17PM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There are many ways in which the hangcheck selftest can fail. Very few
> of them actually printed an error message to say what happened. So,
> fill in the missing messages.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 89 ++++++++++++++++----
>  1 file changed, 72 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 7aea10aa1fb4..0ed87cc4d063 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -378,6 +378,7 @@ static int igt_reset_nop(void *arg)
>  			ce = intel_context_create(engine);
>  			if (IS_ERR(ce)) {
>  				err = PTR_ERR(ce);
> +				pr_err("[%s] Create context failed: %d!\n", engine->name, err);
>  				break;
>  			}
>  
> @@ -387,6 +388,7 @@ static int igt_reset_nop(void *arg)
>  				rq = intel_context_create_request(ce);
>  				if (IS_ERR(rq)) {
>  					err = PTR_ERR(rq);
> +					pr_err("[%s] Create request failed: %d!\n", engine->name, err);
>  					break;
>  				}
>  
> @@ -401,24 +403,31 @@ static int igt_reset_nop(void *arg)
>  		igt_global_reset_unlock(gt);
>  
>  		if (intel_gt_is_wedged(gt)) {
> +			pr_err("[%s] GT is wedged!\n", engine->name);
>  			err = -EIO;
>  			break;
>  		}
>  
>  		if (i915_reset_count(global) != reset_count + ++count) {
> -			pr_err("Full GPU reset not recorded!\n");
> +			pr_err("[%s] Reset not recorded: %d vs %d + %d!\n",
> +			       engine->name, i915_reset_count(global), reset_count, count);
>  			err = -EINVAL;
>  			break;
>  		}
>  
>  		err = igt_flush_test(gt->i915);
> -		if (err)
> +		if (err) {
> +			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
>  			break;
> +		}
>  	} while (time_before(jiffies, end_time));
>  	pr_info("%s: %d resets\n", __func__, count);
>  
> -	if (igt_flush_test(gt->i915))
> +	if (igt_flush_test(gt->i915)) {
> +		pr_err("Post flush failed: %d!\n", err);
>  		err = -EIO;
> +	}
> +
>  	return err;
>  }
>  
> @@ -441,8 +450,10 @@ static int igt_reset_nop_engine(void *arg)
>  		int err;
>  
>  		ce = intel_context_create(engine);
> -		if (IS_ERR(ce))
> +		if (IS_ERR(ce)) {
> +			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
>  			return PTR_ERR(ce);
> +		}
>  
>  		reset_count = i915_reset_count(global);
>  		reset_engine_count = i915_reset_engine_count(global, engine);
> @@ -550,8 +561,10 @@ static int igt_reset_fail_engine(void *arg)
>  		int err;
>  
>  		ce = intel_context_create(engine);
> -		if (IS_ERR(ce))
> +		if (IS_ERR(ce)) {
> +			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
>  			return PTR_ERR(ce);
> +		}
>  
>  		st_engine_heartbeat_disable(engine);
>  		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> @@ -711,6 +724,7 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>  				rq = hang_create_request(&h, engine);
>  				if (IS_ERR(rq)) {
>  					err = PTR_ERR(rq);
> +					pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  					break;
>  				}
>  
> @@ -765,12 +779,16 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>  			break;
>  
>  		err = igt_flush_test(gt->i915);
> -		if (err)
> +		if (err) {
> +			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
>  			break;
> +		}
>  	}
>  
> -	if (intel_gt_is_wedged(gt))
> +	if (intel_gt_is_wedged(gt)) {
> +		pr_err("GT is wedged!\n");
>  		err = -EIO;
> +	}
>  
>  	if (active)
>  		hang_fini(&h);
> @@ -837,6 +855,7 @@ static int active_engine(void *data)
>  		ce[count] = intel_context_create(engine);
>  		if (IS_ERR(ce[count])) {
>  			err = PTR_ERR(ce[count]);
> +			pr_err("[%s] Create context #%ld failed: %d!\n", engine->name, count, err);
>  			while (--count)
>  				intel_context_put(ce[count]);
>  			return err;
> @@ -852,6 +871,7 @@ static int active_engine(void *data)
>  		new = intel_context_create_request(ce[idx]);
>  		if (IS_ERR(new)) {
>  			err = PTR_ERR(new);
> +			pr_err("[%s] Create request #%d failed: %d!\n", engine->name, idx, err);
>  			break;
>  		}
>  
> @@ -867,8 +887,10 @@ static int active_engine(void *data)
>  		}
>  
>  		err = active_request_put(old);
> -		if (err)
> +		if (err) {
> +			pr_err("[%s] Request put failed: %d!\n", engine->name, err);
>  			break;
> +		}
>  
>  		cond_resched();
>  	}
> @@ -876,6 +898,9 @@ static int active_engine(void *data)
>  	for (count = 0; count < ARRAY_SIZE(rq); count++) {
>  		int err__ = active_request_put(rq[count]);
>  
> +		if (err)
> +			pr_err("[%s] Request put #%ld failed: %d!\n", engine->name, count, err);
> +
>  		/* Keep the first error */
>  		if (!err)
>  			err = err__;
> @@ -949,6 +974,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  					  "igt/%s", other->name);
>  			if (IS_ERR(tsk)) {
>  				err = PTR_ERR(tsk);
> +				pr_err("[%s] Thread spawn failed: %d!\n", engine->name, err);
>  				goto unwind;
>  			}
>  
> @@ -967,6 +993,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  				rq = hang_create_request(&h, engine);
>  				if (IS_ERR(rq)) {
>  					err = PTR_ERR(rq);
> +					pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  					break;
>  				}
>  
> @@ -999,10 +1026,10 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  			if (rq) {
>  				if (rq->fence.error != -EIO) {
>  					pr_err("i915_reset_engine(%s:%s):"
> -					       " failed to reset request %llx:%lld\n",
> +					       " failed to reset request %lld:%lld [0x%04X]\n",
>  					       engine->name, test_name,
>  					       rq->fence.context,
> -					       rq->fence.seqno);
> +					       rq->fence.seqno, rq->context->guc_id);
>  					i915_request_put(rq);
>  
>  					GEM_TRACE_DUMP();
> @@ -1101,8 +1128,10 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  			break;
>  
>  		err = igt_flush_test(gt->i915);
> -		if (err)
> +		if (err) {
> +			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
>  			break;
> +		}
>  	}
>  
>  	if (intel_gt_is_wedged(gt))
> @@ -1180,12 +1209,15 @@ static int igt_reset_wait(void *arg)
>  	igt_global_reset_lock(gt);
>  
>  	err = hang_init(&h, gt);
> -	if (err)
> +	if (err) {
> +		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
>  		goto unlock;
> +	}
>  
>  	rq = hang_create_request(&h, engine);
>  	if (IS_ERR(rq)) {
>  		err = PTR_ERR(rq);
> +		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  		goto fini;
>  	}
>  
> @@ -1310,12 +1342,15 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  	/* Check that we can recover an unbind stuck on a hanging request */
>  
>  	err = hang_init(&h, gt);
> -	if (err)
> +	if (err) {
> +		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
>  		return err;
> +	}
>  
>  	obj = i915_gem_object_create_internal(gt->i915, SZ_1M);
>  	if (IS_ERR(obj)) {
>  		err = PTR_ERR(obj);
> +		pr_err("[%s] Create object failed: %d!\n", engine->name, err);
>  		goto fini;
>  	}
>  
> @@ -1330,12 +1365,14 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  	arg.vma = i915_vma_instance(obj, vm, NULL);
>  	if (IS_ERR(arg.vma)) {
>  		err = PTR_ERR(arg.vma);
> +		pr_err("[%s] VMA instance failed: %d!\n", engine->name, err);
>  		goto out_obj;
>  	}
>  
>  	rq = hang_create_request(&h, engine);
>  	if (IS_ERR(rq)) {
>  		err = PTR_ERR(rq);
> +		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  		goto out_obj;
>  	}
>  
> @@ -1347,6 +1384,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  	err = i915_vma_pin(arg.vma, 0, 0, pin_flags);
>  	if (err) {
>  		i915_request_add(rq);
> +		pr_err("[%s] VMA pin failed: %d!\n", engine->name, err);
>  		goto out_obj;
>  	}
>  
> @@ -1363,8 +1401,14 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  	i915_vma_lock(arg.vma);
>  	err = i915_request_await_object(rq, arg.vma->obj,
>  					flags & EXEC_OBJECT_WRITE);
> -	if (err == 0)
> +	if (err == 0) {
>  		err = i915_vma_move_to_active(arg.vma, rq, flags);
> +		if (err)
> +			pr_err("[%s] Move to active failed: %d!\n", engine->name, err);
> +	} else {
> +		pr_err("[%s] Request await failed: %d!\n", engine->name, err);
> +	}
> +
>  	i915_vma_unlock(arg.vma);
>  
>  	if (flags & EXEC_OBJECT_NEEDS_FENCE)
> @@ -1392,6 +1436,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  	tsk = kthread_run(fn, &arg, "igt/evict_vma");
>  	if (IS_ERR(tsk)) {
>  		err = PTR_ERR(tsk);
> +		pr_err("[%s] Thread spawn failed: %d!\n", engine->name, err);
>  		tsk = NULL;
>  		goto out_reset;
>  	}
> @@ -1518,6 +1563,7 @@ static int igt_reset_queue(void *arg)
>  		prev = hang_create_request(&h, engine);
>  		if (IS_ERR(prev)) {
>  			err = PTR_ERR(prev);
> +			pr_err("[%s] Create 'prev' hang request failed: %d!\n", engine->name, err);
>  			goto fini;
>  		}
>  
> @@ -1532,6 +1578,7 @@ static int igt_reset_queue(void *arg)
>  			rq = hang_create_request(&h, engine);
>  			if (IS_ERR(rq)) {
>  				err = PTR_ERR(rq);
> +				pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  				goto fini;
>  			}
>  
> @@ -1619,8 +1666,10 @@ static int igt_reset_queue(void *arg)
>  		i915_request_put(prev);
>  
>  		err = igt_flush_test(gt->i915);
> -		if (err)
> +		if (err) {
> +			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
>  			break;
> +		}
>  	}
>  
>  fini:
> @@ -1653,12 +1702,15 @@ static int igt_handle_error(void *arg)
>  		return 0;
>  
>  	err = hang_init(&h, gt);
> -	if (err)
> +	if (err) {
> +		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
>  		return err;
> +	}
>  
>  	rq = hang_create_request(&h, engine);
>  	if (IS_ERR(rq)) {
>  		err = PTR_ERR(rq);
> +		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  		goto err_fini;
>  	}
>  
> @@ -1743,12 +1795,15 @@ static int igt_atomic_reset_engine(struct intel_engine_cs *engine,
>  		return err;
>  
>  	err = hang_init(&h, engine->gt);
> -	if (err)
> +	if (err) {
> +		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
>  		return err;
> +	}
>  
>  	rq = hang_create_request(&h, engine);
>  	if (IS_ERR(rq)) {
>  		err = PTR_ERR(rq);
> +		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
>  		goto out;
>  	}
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
