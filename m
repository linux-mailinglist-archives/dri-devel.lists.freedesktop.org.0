Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D99437191
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 08:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370B389B4D;
	Fri, 22 Oct 2021 06:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0289B4D;
 Fri, 22 Oct 2021 06:12:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="216147936"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="216147936"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:12:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="721586457"
Received: from unknown (HELO [10.249.254.159]) ([10.249.254.159])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:11:59 -0700
Message-ID: <7fa98234-73d5-69a7-d712-b3180614c873@linux.intel.com>
Date: Fri, 22 Oct 2021 08:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/i915/selftests: Update live.evict to wait on requests
 / idle GPU after each loop
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
References: <20211021214040.33292-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211021214040.33292-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/21/21 23:40, Matthew Brost wrote:
> Update live.evict to wait on last request and idle GPU after each loop.
> This not only enhances the test to fill the GGTT on each engine class
> but also avoid timeouts from igt_flush_test when using GuC submission.
> igt_flush_test (idle GPU) can take a long time with GuC submission if
> losts of contexts are created due to H2G / G2H required to destroy
> contexts.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   .../gpu/drm/i915/selftests/i915_gem_evict.c   | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> index f99bb0113726..7e0658a77659 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> @@ -442,6 +442,7 @@ static int igt_evict_contexts(void *arg)
>   	/* Overfill the GGTT with context objects and so try to evict one. */
>   	for_each_engine(engine, gt, id) {
>   		struct i915_sw_fence fence;
> +		struct i915_request *last = NULL;
>   
>   		count = 0;
>   		onstack_fence_init(&fence);
> @@ -479,6 +480,9 @@ static int igt_evict_contexts(void *arg)
>   
>   			i915_request_add(rq);
>   			count++;
> +			if (last)
> +				i915_request_put(last);
> +			last = i915_request_get(rq);
>   			err = 0;
>   		} while(1);
>   		onstack_fence_fini(&fence);
> @@ -486,6 +490,21 @@ static int igt_evict_contexts(void *arg)
>   			count, engine->name);
>   		if (err)
>   			break;
> +		if (last) {
> +			if (i915_request_wait(last, 0, HZ) < 0) {
> +				err = -EIO;
> +				i915_request_put(last);
> +				pr_err("Failed waiting for last request (on %s)",
> +				       engine->name);
> +				break;
> +			}
> +			i915_request_put(last);
> +		}
> +		err = intel_gt_wait_for_idle(engine->gt, HZ * 3);
> +		if (err) {
> +			pr_err("Failed to idle GT (on %s)", engine->name);
> +			break;
> +		}
>   	}
>   
>   	mutex_lock(&ggtt->vm.mutex);
