Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4A617969
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 10:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E3F10E254;
	Thu,  3 Nov 2022 09:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E74610E254;
 Thu,  3 Nov 2022 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667466624; x=1699002624;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6Vw4M88rzzl4mfSTP1YRtAtTUCjlnO9FaYRCtYSsnhM=;
 b=O7EXtHAn0d/3xXAdR03+rEyz0p550iJqK4tnEssZt/YTp+vgptPwkDnu
 LfsLkpQOmgNRDc8laZdRHeih6CjykJQukBq9OykcB8UStLADQ7ogNY414
 1LpbhuNwJbtUw8k8KaPYsnqUCc5y5M2F9WUkq07o9v3loYLdNx8S5sQIK
 GnrhkbqsTnFi/UthSzSyV1meUcSM1VJFaK2S72/g2OjQT3UGMb5XYb8oN
 /MzqH+nIQpwK61a3Dj/fC6in7iYFwL4fXBpJPQnVfw9Q8aI92fbXruS+h
 XGiKdi2KJWL6u3lyekM5cNnezYeX3LwWHz3697WjHAwhHxwhUR+LV7XqI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="297086967"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="297086967"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 02:10:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585720962"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="585720962"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.42.177])
 ([10.249.42.177])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 02:10:22 -0700
Message-ID: <2d6e7e7b-81dc-7ae3-8dbc-a5adb13c8b2e@linux.intel.com>
Date: Thu, 3 Nov 2022 10:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/i915/guc: don't hardcode BCS0 in guc_hang selftest
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20221102214310.2829310-1-daniele.ceraolospurio@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221102214310.2829310-1-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM Acked-by: Nirmoy Das <nirmoy.das@intel.com>

On 11/2/2022 10:43 PM, Daniele Ceraolo Spurio wrote:
> On MTL there are no BCS engines on the media GT, so we can't always use
> BCS0 in the test. There is no actual reason to use a BCS engine over an
> engine of a different class, so switch to using any available engine.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> index 01f8cd3c3134..d91b58f70403 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> @@ -35,11 +35,14 @@ static int intel_hang_guc(void *arg)
>   	struct i915_request *rq;
>   	intel_wakeref_t wakeref;
>   	struct i915_gpu_error *global = &gt->i915->gpu_error;
> -	struct intel_engine_cs *engine;
> +	struct intel_engine_cs *engine = intel_selftest_find_any_engine(gt);
>   	unsigned int reset_count;
>   	u32 guc_status;
>   	u32 old_beat;
>   
> +	if (!engine)
> +		return 0;
> +
>   	ctx = kernel_context(gt->i915, NULL);
>   	if (IS_ERR(ctx)) {
>   		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
> @@ -48,14 +51,13 @@ static int intel_hang_guc(void *arg)
>   
>   	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
>   
> -	ce = intel_context_create(gt->engine[BCS0]);
> +	ce = intel_context_create(engine);
>   	if (IS_ERR(ce)) {
>   		ret = PTR_ERR(ce);
>   		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>   		goto err;
>   	}
>   
> -	engine = ce->engine;
>   	reset_count = i915_reset_count(global);
>   
>   	old_beat = engine->props.heartbeat_interval_ms;
