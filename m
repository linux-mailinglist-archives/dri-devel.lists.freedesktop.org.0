Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873D3CBFE5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 01:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2A56E9EC;
	Fri, 16 Jul 2021 23:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57436E953;
 Fri, 16 Jul 2021 23:57:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="271919237"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="271919237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 16:57:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="574488682"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 16:57:20 -0700
Date: Fri, 16 Jul 2021 23:57:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 46/51] drm/i915/selftest: Fix MOCS selftest for GuC
 submission
Message-ID: <20210716235718.GA10498@DUT151-ICLU.fm.intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-47-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716201724.54804-47-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 01:17:19PM -0700, Matthew Brost wrote:
> From: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> 
> When GuC submission is enabled, the GuC controls engine resets. Rather
> than explicitly triggering a reset, the driver must submit a hanging
> context to GuC and wait for the reset to occur.
> 
> Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_mocs.c | 49 ++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index 8763bbeca0f7..b7314739ee40 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -10,6 +10,7 @@
>  #include "gem/selftests/mock_context.h"
>  #include "selftests/igt_reset.h"
>  #include "selftests/igt_spinner.h"
> +#include "selftests/intel_scheduler_helpers.h"
>  
>  struct live_mocs {
>  	struct drm_i915_mocs_table table;
> @@ -318,7 +319,8 @@ static int live_mocs_clean(void *arg)
>  }
>  
>  static int active_engine_reset(struct intel_context *ce,
> -			       const char *reason)
> +			       const char *reason,
> +			       bool using_guc)
>  {
>  	struct igt_spinner spin;
>  	struct i915_request *rq;
> @@ -335,9 +337,13 @@ static int active_engine_reset(struct intel_context *ce,
>  	}
>  
>  	err = request_add_spin(rq, &spin);
> -	if (err == 0)
> +	if (err == 0 && !using_guc)
>  		err = intel_engine_reset(ce->engine, reason);
>  
> +	/* Ensure the reset happens and kills the engine */
> +	if (err == 0)
> +		err = intel_selftest_wait_for_rq(rq);
> +
>  	igt_spinner_end(&spin);
>  	igt_spinner_fini(&spin);
>  
> @@ -345,21 +351,23 @@ static int active_engine_reset(struct intel_context *ce,
>  }
>  
>  static int __live_mocs_reset(struct live_mocs *mocs,
> -			     struct intel_context *ce)
> +			     struct intel_context *ce, bool using_guc)
>  {
>  	struct intel_gt *gt = ce->engine->gt;
>  	int err;
>  
>  	if (intel_has_reset_engine(gt)) {
> -		err = intel_engine_reset(ce->engine, "mocs");
> -		if (err)
> -			return err;
> -
> -		err = check_mocs_engine(mocs, ce);
> -		if (err)
> -			return err;
> +		if (!using_guc) {
> +			err = intel_engine_reset(ce->engine, "mocs");
> +			if (err)
> +				return err;
> +
> +			err = check_mocs_engine(mocs, ce);
> +			if (err)
> +				return err;
> +		}
>  
> -		err = active_engine_reset(ce, "mocs");
> +		err = active_engine_reset(ce, "mocs", using_guc);
>  		if (err)
>  			return err;
>  
> @@ -395,19 +403,32 @@ static int live_mocs_reset(void *arg)
>  
>  	igt_global_reset_lock(gt);
>  	for_each_engine(engine, gt, id) {
> +		bool using_guc = intel_engine_uses_guc(engine);
> +		struct intel_selftest_saved_policy saved;
>  		struct intel_context *ce;
> +		int err2;
> +
> +		err = intel_selftest_modify_policy(engine, &saved);
> +		if (err)
> +			break;
>  
>  		ce = mocs_context_create(engine);
>  		if (IS_ERR(ce)) {
>  			err = PTR_ERR(ce);
> -			break;
> +			goto restore;
>  		}
>  
>  		intel_engine_pm_get(engine);
> -		err = __live_mocs_reset(&mocs, ce);
> -		intel_engine_pm_put(engine);
>  
> +		err = __live_mocs_reset(&mocs, ce, using_guc);
> +
> +		intel_engine_pm_put(engine);
>  		intel_context_put(ce);
> +
> +restore:
> +		err2 = intel_selftest_restore_policy(engine, &saved);
> +		if (err == 0)
> +			err = err2;
>  		if (err)
>  			break;
>  	}
> -- 
> 2.28.0
> 
