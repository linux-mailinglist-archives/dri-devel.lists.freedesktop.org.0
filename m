Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8662C572A7A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 02:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCB597EE9;
	Wed, 13 Jul 2022 00:54:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD4297EE5;
 Wed, 13 Jul 2022 00:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657673679; x=1689209679;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4PUrxdQMtTHVmDhqGxhm30yFo3LVoIfwvzyprwD87rc=;
 b=C1nnEnmu7YoekMLogGWUiTsGM3kfOTZNR3jU8XTzKZ3EsF4UvHdiIdVR
 gQrZf1iZhvbGnwWedZBxCZFG2AKx6SOPLc9s71QvWp5aXO4SBrdXblJnH
 vl5V7hikBtRvmMAY5grcR0c9jrAlweGrEnWfG+MWSXWtIXWrlpgVhwI17
 rt+oKsAxFWxrZpcFyQiAeIVsFHDHacJXnsPbPyrANduFc+SiQqVDAfWU6
 glOjFES8zGEMmxCJiNl6jVP1kfY8RKAFuAa4ddXEEUbMOyXBGVmmb3x5a
 g46mHyCkGRSWMFmwzRxSbayUofHL6737G/8t4CpvvVloCCXfmzJ85+d1r Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="282630624"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="282630624"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 17:54:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="592814489"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 17:54:38 -0700
Date: Tue, 12 Jul 2022 17:48:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [PATCH 09/12] drm/i915/selftest: Cope with not having an RCS
 engine
Message-ID: <20220713004812.GA3011@jons-linux-dev-box>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-10-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712233136.1044951-10-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 04:31:33PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> It is no longer guaranteed that there will always be an RCS engine.
> So, use the helper function for finding the first available engine that
> can be used for general purpose selftets.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 6493265d5f642..7f3bb1d34dfbf 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -1302,13 +1302,15 @@ static int igt_reset_wait(void *arg)
>  {
>  	struct intel_gt *gt = arg;
>  	struct i915_gpu_error *global = &gt->i915->gpu_error;
> -	struct intel_engine_cs *engine = gt->engine[RCS0];
> +	struct intel_engine_cs *engine;
>  	struct i915_request *rq;
>  	unsigned int reset_count;
>  	struct hang h;
>  	long timeout;
>  	int err;
>  
> +	engine = intel_selftest_find_any_engine(gt);
> +
>  	if (!engine || !intel_engine_can_store_dword(engine))
>  		return 0;
>  
> @@ -1432,7 +1434,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  				 int (*fn)(void *),
>  				 unsigned int flags)
>  {
> -	struct intel_engine_cs *engine = gt->engine[RCS0];
> +	struct intel_engine_cs *engine;
>  	struct drm_i915_gem_object *obj;
>  	struct task_struct *tsk = NULL;
>  	struct i915_request *rq;
> @@ -1444,6 +1446,8 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  	if (!gt->ggtt->num_fences && flags & EXEC_OBJECT_NEEDS_FENCE)
>  		return 0;
>  
> +	engine = intel_selftest_find_any_engine(gt);
> +
>  	if (!engine || !intel_engine_can_store_dword(engine))
>  		return 0;
>  
> @@ -1819,12 +1823,14 @@ static int igt_handle_error(void *arg)
>  {
>  	struct intel_gt *gt = arg;
>  	struct i915_gpu_error *global = &gt->i915->gpu_error;
> -	struct intel_engine_cs *engine = gt->engine[RCS0];
> +	struct intel_engine_cs *engine;
>  	struct hang h;
>  	struct i915_request *rq;
>  	struct i915_gpu_coredump *error;
>  	int err;
>  
> +	engine = intel_selftest_find_any_engine(gt);
> +
>  	/* Check that we can issue a global GPU and engine reset */
>  
>  	if (!intel_has_reset_engine(gt))
> -- 
> 2.36.0
> 
