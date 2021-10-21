Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9234435AC0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 08:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ACB6EB51;
	Thu, 21 Oct 2021 06:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E37D6EA2A;
 Thu, 21 Oct 2021 06:15:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="227724887"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="227724887"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 23:15:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="632067132"
Received: from mstribae-mobl1.ger.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 23:15:52 -0700
Message-ID: <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a
 GT reset in hangcheck selftest
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: john.c.harrison@intel.com
Date: Thu, 21 Oct 2021 08:15:49 +0200
In-Reply-To: <20211011234705.30853-1-matthew.brost@intel.com>
References: <20211011234705.30853-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
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

Hi, Matthew,

On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
> The hangcheck selftest blocks per engine resets by setting magic bits
> in
> the reset flags. This is incorrect for GuC submission because if the
> GuC
> fails to reset an engine we would like to do a full GT reset. Do no
> set
> these magic bits when using GuC submission.
> 
> Side note this lockless algorithm with magic bits to block resets
> really
> should be ripped out.
> 

Lockless algorithm aside, from a quick look at the code in
intel_reset.c it appears to me like the interface that falls back to a
full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
is explicitly intended to not do that, so is there a discrepancy
between GuC and non-GuC here?

/Thomas


> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 7e2d99dd012d..90a03c60c80c 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -734,7 +734,8 @@ static int __igt_reset_engine(struct intel_gt
> *gt, bool active)
>                 reset_engine_count = i915_reset_engine_count(global,
> engine);
>  
>                 st_engine_heartbeat_disable(engine);
> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +               if (!using_guc)
> +                       set_bit(I915_RESET_ENGINE + id, &gt-
> >reset.flags);
>                 count = 0;
>                 do {
>                         struct i915_request *rq = NULL;
> @@ -824,7 +825,8 @@ static int __igt_reset_engine(struct intel_gt
> *gt, bool active)
>                         if (err)
>                                 break;
>                 } while (time_before(jiffies, end_time));
> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +               if (!using_guc)
> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
> >reset.flags);
>                 st_engine_heartbeat_enable(engine);
>                 pr_info("%s: Completed %lu %s resets\n",
>                         engine->name, count, active ? "active" :
> "idle");
> @@ -1042,7 +1044,8 @@ static int __igt_reset_engines(struct intel_gt
> *gt,
>                 yield(); /* start all threads before we begin */
>  
>                 st_engine_heartbeat_disable_no_pm(engine);
> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +               if (!using_guc)
> +                       set_bit(I915_RESET_ENGINE + id, &gt-
> >reset.flags);
>                 do {
>                         struct i915_request *rq = NULL;
>                         struct intel_selftest_saved_policy saved;
> @@ -1165,7 +1168,8 @@ static int __igt_reset_engines(struct intel_gt
> *gt,
>                         if (err)
>                                 break;
>                 } while (time_before(jiffies, end_time));
> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +               if (!using_guc)
> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
> >reset.flags);
>                 st_engine_heartbeat_enable_no_pm(engine);
>  
>                 pr_info("i915_reset_engine(%s:%s): %lu resets\n",


