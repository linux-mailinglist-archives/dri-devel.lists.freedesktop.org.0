Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E93D1FC0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5064C6EDE1;
	Thu, 22 Jul 2021 08:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBA76EDDC;
 Thu, 22 Jul 2021 08:17:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="208478726"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="208478726"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:17:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470541233"
Received: from cstylian-mobl3.ger.corp.intel.com (HELO [10.213.198.98])
 ([10.213.198.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:17:35 -0700
Subject: Re: [Intel-gfx] [PATCH 49/51] drm/i915/selftest: Bump selftest
 timeouts for hangcheck
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-50-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7f3c661a-3764-adf4-9f5d-9b220b315b3b@linux.intel.com>
Date: Thu, 22 Jul 2021 09:17:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716201724.54804-50-matthew.brost@intel.com>
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


On 16/07/2021 21:17, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Some testing environments and some heavier tests are slower than

What testing environments are they? It's not a simulation patch which 
"escaped" by accident I am wondering. If not then it's just GuC which is 
so slow, like that other patch two steps previous in the series?

Regards,

Tvrtko

> previous limits allowed for. For example, it can take multiple seconds
> for the 'context has been reset' notification handler to reach the
> 'kill the requests' code in the 'active' version of the 'reset
> engines' test. During which time the selftest gets bored, gives up
> waiting and fails the test.
> 
> There is also an async thread that the selftest uses to pump work
> through the hardware in parallel to the context that is marked for
> reset. That also could get bored waiting for completions and kill the
> test off.
> 
> Lastly, the flush at the of various test sections can also see
> timeouts due to the large amount of work backed up. This is also true
> of the live_hwsp_read test.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c             | 2 +-
>   drivers/gpu/drm/i915/selftests/igt_flush_test.c          | 2 +-
>   drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 971c0c249eb0..a93a9b0d258e 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -876,7 +876,7 @@ static int active_request_put(struct i915_request *rq)
>   	if (!rq)
>   		return 0;
>   
> -	if (i915_request_wait(rq, 0, 5 * HZ) < 0) {
> +	if (i915_request_wait(rq, 0, 10 * HZ) < 0) {
>   		GEM_TRACE("%s timed out waiting for completion of fence %llx:%lld\n",
>   			  rq->engine->name,
>   			  rq->fence.context,
> diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.c b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
> index 7b0939e3f007..a6c71fca61aa 100644
> --- a/drivers/gpu/drm/i915/selftests/igt_flush_test.c
> +++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
> @@ -19,7 +19,7 @@ int igt_flush_test(struct drm_i915_private *i915)
>   
>   	cond_resched();
>   
> -	if (intel_gt_wait_for_idle(gt, HZ / 5) == -ETIME) {
> +	if (intel_gt_wait_for_idle(gt, HZ) == -ETIME) {
>   		pr_err("%pS timed out, cancelling all further testing.\n",
>   		       __builtin_return_address(0));
>   
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> index 69db139f9e0d..ebd6d69b3315 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -13,7 +13,7 @@
>   
>   #define REDUCED_TIMESLICE	5
>   #define REDUCED_PREEMPT		10
> -#define WAIT_FOR_RESET_TIME	1000
> +#define WAIT_FOR_RESET_TIME	10000
>   
>   int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>   				 struct intel_selftest_saved_policy *saved,
> 
