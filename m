Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48534456BE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75EA6FA5B;
	Thu,  4 Nov 2021 16:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6535E6FA54;
 Thu,  4 Nov 2021 16:04:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231981187"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="231981187"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 09:04:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="578908602"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 09:04:56 -0700
Date: Thu, 4 Nov 2021 09:00:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use clear_and_wake_up_bit() for the
 per-engine reset bitlocks
Message-ID: <20211104160024.GA27940@jons-linux-dev-box>
References: <20211104125844.707783-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211104125844.707783-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 01:58:44PM +0100, Thomas Hellström wrote:
> Some selftests assume that nothing will attempt to grab these bitlocks
> while they are held by the selftests. With GuC, for example, that is
> not true because the hanging workloads may cause the GuC code to attempt
> to grab them for a global reset, and that may cause it to end up
> sleeping on the bit never waking up. Regardless whether that will be
> the final solution for GuC, use clear_and_wake_up_bit() pending a more
> thorough investigation on how this should be handled moving forward.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

This series will also fix the CI crash:
https://patchwork.freedesktop.org/series/96406/

Regardless of the above series this one looks correct and needed.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 8 ++++----
>  drivers/gpu/drm/i915/selftests/igt_reset.c   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 7e2d99dd012d..8590419be4c6 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -528,7 +528,7 @@ static int igt_reset_nop_engine(void *arg)
>  				break;
>  			}
>  		} while (time_before(jiffies, end_time));
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		st_engine_heartbeat_enable(engine);
>  
>  		pr_info("%s(%s): %d resets\n", __func__, engine->name, count);
> @@ -679,7 +679,7 @@ static int igt_reset_fail_engine(void *arg)
>  out:
>  		pr_info("%s(%s): %d resets\n", __func__, engine->name, count);
>  skip:
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		st_engine_heartbeat_enable(engine);
>  		intel_context_put(ce);
>  
> @@ -824,7 +824,7 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>  			if (err)
>  				break;
>  		} while (time_before(jiffies, end_time));
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		st_engine_heartbeat_enable(engine);
>  		pr_info("%s: Completed %lu %s resets\n",
>  			engine->name, count, active ? "active" : "idle");
> @@ -1165,7 +1165,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  			if (err)
>  				break;
>  		} while (time_before(jiffies, end_time));
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		st_engine_heartbeat_enable_no_pm(engine);
>  
>  		pr_info("i915_reset_engine(%s:%s): %lu resets\n",
> diff --git a/drivers/gpu/drm/i915/selftests/igt_reset.c b/drivers/gpu/drm/i915/selftests/igt_reset.c
> index 9f8590b868a9..a2838c65f8a5 100644
> --- a/drivers/gpu/drm/i915/selftests/igt_reset.c
> +++ b/drivers/gpu/drm/i915/selftests/igt_reset.c
> @@ -36,7 +36,7 @@ void igt_global_reset_unlock(struct intel_gt *gt)
>  	enum intel_engine_id id;
>  
>  	for_each_engine(engine, gt, id)
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  
>  	clear_bit(I915_RESET_BACKOFF, &gt->reset.flags);
>  	wake_up_all(&gt->reset.queue);
> -- 
> 2.31.1
> 
