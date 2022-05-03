Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C09517FB2
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0BD10E545;
	Tue,  3 May 2022 08:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319A710E545;
 Tue,  3 May 2022 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651566349; x=1683102349;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P3V5TyQVMsBRba0KAJC0plBjCD0Oo4uVTsoClxqVPeQ=;
 b=NrhxJoqfE0KRqvNQg3IcTgqCfmD5NB2jyolmCD1BbhwIMiqFe6Eba9qS
 RMo8pMYcSazr2LDH/ldiwH7PvKSdNO1T2fuzonlHmcGknqqNlTWucB2B0
 qBK++Nw9dYXJ7IhJlM+PhrYcptKl48DtRQqCpLaUIfvs42XWstqPCYe5w
 NLrf9LmhU66yWeCXojl6LDBUwIcbfdzUddLrmzb6yq5EjYEInL7j6eC6q
 df001ukq5jaTD/g+qy6c22gbQYBrC+WkzJnsV8psG1eK0+nyIklx4XnYh
 /p3xAebH9gNZVb7qXDNIYSiEZBu4muIg7CjzFsJL7dVroWbxnwVP7Iy2h A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292613416"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="292613416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 01:25:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562127763"
Received: from doshaugh-mobl.ger.corp.intel.com (HELO [10.213.236.211])
 ([10.213.236.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 01:25:47 -0700
Message-ID: <45976c49-ac33-e00f-fc8e-30bdb4f1a57e@linux.intel.com>
Date: Tue, 3 May 2022 09:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH 06/11] drm/i915/pvc: Reduce stack usage in
 reset selftest with extra blitter engine
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-7-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220502163417.2635462-7-matthew.d.roper@intel.com>
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


On 02/05/2022 17:34, Matt Roper wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> PVC adds extra blitter engines (in the following patch). The reset
> selftest has a local array on the stack which is sized by the number
> of engines. The increase pushes the size of this array to the point
> where it trips the 'stack too large' compile warning. This patch takes
> the allocation of the stack and makes it dynamic instead.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 83ff4c2e57c5..3b9d82276db2 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -979,6 +979,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   	enum intel_engine_id id, tmp;
>   	struct hang h;
>   	int err = 0;
> +	struct active_engine *threads;

Drive by nits - sticks out like a sore thumb a bit here - I'd put it 
above "id, tmp" so it's all nicely sorted by width.
>   
>   	/* Check that issuing a reset on one engine does not interfere
>   	 * with any other engine.
> @@ -996,8 +997,11 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   			h.ctx->sched.priority = 1024;
>   	}
>   
> +	threads = kzalloc(sizeof(*threads) * I915_NUM_ENGINES, GFP_KERNEL);

And this could be kcalloc (or kmalloc_array since zeroing is not needed) 
if that's any better. Seems selftests use that pattern anyway.

Both comments are optional really.

Regards,

Tvrtko

> +	if (!threads)
> +		return -ENOMEM;
> +
>   	for_each_engine(engine, gt, id) {
> -		struct active_engine threads[I915_NUM_ENGINES] = {};
>   		unsigned long device = i915_reset_count(global);
>   		unsigned long count = 0, reported;
>   		bool using_guc = intel_engine_uses_guc(engine);
> @@ -1016,7 +1020,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   			break;
>   		}
>   
> -		memset(threads, 0, sizeof(threads));
> +		memset(threads, 0, sizeof(*threads) * I915_NUM_ENGINES);
>   		for_each_engine(other, gt, tmp) {
>   			struct task_struct *tsk;
>   
> @@ -1236,6 +1240,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   			break;
>   		}
>   	}
> +	kfree(threads);
>   
>   	if (intel_gt_is_wedged(gt))
>   		err = -EIO;
