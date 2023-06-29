Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBECF742FA3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 23:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A338C10E04D;
	Thu, 29 Jun 2023 21:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D4710E3EC;
 Thu, 29 Jun 2023 21:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688075102; x=1719611102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mGgbyzfh+nygcH9klhZXB4hr+J1jIcCv5e2ZPeimO2w=;
 b=N1Ecqc6RQ2JvufL2ACQLuiTFNul2E0ptemjfRmEFsicY5A/LVupr4jhu
 AVSQIPxTy7I/Sce2NEufpwdh0cOrAla3OfoVSTALIK7fODb0FQl7J4QU7
 wMcgyNd1HP4ltVtuVe8Fk1K6U51reuTpvI0kIL3rWq8s2f8NtXC7MkvE3
 0KDkO4dNMzCJo9SN69BL822gwMtie9+EXwh6PvoavBq0gmtsmefVSxuyo
 C+kt5h3RcztFCxPirfLabLMf9+ZIinsiBAMi11kVDwf74lDTF0WK8Yvl3
 lU/Q+eP+SAkVgfMtq+DVBUIQ8EHCqaMi3KgxMvgPhfAMQFdYQ0Gbt6/eH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="428278752"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="428278752"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 14:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752778568"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="752778568"
Received: from kevinp3x-mobl2.ger.corp.intel.com (HELO [10.213.199.245])
 ([10.213.199.245])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 14:44:59 -0700
Message-ID: <29d9e289-42f8-8ae2-ad2b-9ddfe8c848cc@linux.intel.com>
Date: Thu, 29 Jun 2023 22:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230629204248.1283601-1-alan.previn.teres.alexis@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230629204248.1283601-1-alan.previn.teres.alexis@intel.com>
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


On 29/06/2023 21:42, Alan Previn wrote:
> On MTL, if the GSC Proxy init flows haven't completed, submissions to the
> GSC engine will fail. Those init flows are dependent on the mei's
> gsc_proxy component that is loaded in parallel with i915 and a
> worker that could potentially start after i915 driver init is done.
> 
> That said, all subsytems that access the GSC engine today does check
> for such init flow completion before using the GSC engine. However,
> selftests currently don't wait on anything before starting.
> 
> To fix this, add a waiter function at the start of __run_selftests
> that waits for gsc-proxy init flows to complete. While implementing this,
> use an table of function pointers so its scalable to add additional
> waiter functions for future such "wait on dependency" cases that.
> 
> Difference from prior versions:
>     v3: Rebase to latest drm-tip.
>     v2: Based on internal testing, increase the timeout for gsc-proxy
>         specific case to 8 seconds.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> ---
>   .../gpu/drm/i915/selftests/i915_selftest.c    | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> index 39da0fb0d6d2..a74b7e264d92 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -24,6 +24,8 @@
>   #include <linux/random.h>
>   
>   #include "gt/intel_gt_pm.h"
> +#include "gt/uc/intel_gsc_fw.h"
> +
>   #include "i915_driver.h"
>   #include "i915_drv.h"
>   #include "i915_selftest.h"
> @@ -127,6 +129,63 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
>   		st[i].enabled = true;
>   }
>   
> +static int
> +__wait_gsc_proxy_completed(struct drm_i915_private *i915,
> +			   unsigned long timeout_ms)
> +{
> +	bool need_to_wait = (IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY) &&
> +			     i915->media_gt &&
> +			     HAS_ENGINE(i915->media_gt, GSC0) &&
> +			     intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw));
> +
> +	/*
> +	 * For gsc proxy component loading + init, we need a much longer timeout
> +	 * than what CI selftest infrastrucutre currently uses. This longer wait
> +	 * period depends on the kernel config and component driver load ordering
> +	 */

How is a CI timeout value relevant?

Plus from the commit message it sounds like the point of wait is so 
submission to gsc does not fail if loading is still in progress, not 
that the CI times out. So what is the main problem?

> +	if (timeout_ms < 8000)
> +		timeout_ms = 8000;
> +
> +	if (need_to_wait &&
> +	    (wait_for(intel_gsc_uc_fw_proxy_init_done(&i915->media_gt->uc.gsc, true),
> +	    timeout_ms)))
> +		return -ETIME;
> +
> +	return 0;
> +}
> +
> +struct __startup_waiter {
> +	const char *name;
> +	int (*wait_to_completed)(struct drm_i915_private *i915, unsigned long timeout_ms);
> +};
> +
> +static struct __startup_waiter all_startup_waiters[] = { \
> +	{"gsc_proxy", __wait_gsc_proxy_completed} \
> +	};
> +
> +static int __wait_on_all_system_dependencies(struct drm_i915_private *i915)
> +{
> +	struct __startup_waiter *waiter = all_startup_waiters;
> +	int count = ARRAY_SIZE(all_startup_waiters);
> +	int ret;
> +
> +	if (!waiter || !count || !i915)
> +		return 0;

Ugh.

If it ever becomes an empty array just zap this whole code and not have 
these checks.

Also, no i915 is a possibility?

But actually.. please don't add the function table generalization unless 
it is already known something else is coming to be plugged into it.

> +
> +	for (; count--; waiter++) {
> +		if (!waiter->wait_to_completed)
> +			continue;
> +		ret = waiter->wait_to_completed(i915, i915_selftest.timeout_ms);
> +		if (ret) {
> +			pr_info(DRIVER_NAME ": Pre-selftest waiter %s failed with %d\n",
> +				waiter->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int __run_selftests(const char *name,
>   			   struct selftest *st,
>   			   unsigned int count,
> @@ -134,6 +193,8 @@ static int __run_selftests(const char *name,
>   {
>   	int err = 0;
>   
> +	__wait_on_all_system_dependencies(data);

Why does this need to be top level selftests and not just a wait for 
intel_gsc_uc_fw_proxy_init_done in the tests where it is relevant, via 
some helper or something?

Regards,

Tvrtko

> +
>   	while (!i915_selftest.random_seed)
>   		i915_selftest.random_seed = get_random_u32();
>   
> 
> base-commit: 6f8963ce33be65c67e53b16fa18325e12ab76861
