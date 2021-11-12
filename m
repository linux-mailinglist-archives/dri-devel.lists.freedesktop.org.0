Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D044EE3A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 21:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747D6E0B8;
	Fri, 12 Nov 2021 20:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098CE6E0AD;
 Fri, 12 Nov 2021 20:57:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="233050003"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="233050003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 12:57:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="643718298"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 12:57:29 -0800
Date: Fri, 12 Nov 2021 12:51:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/i915/pmu: Increase the live_engine_busy_stats sample
 period
Message-ID: <20211112205151.GA9801@jons-linux-dev-box>
References: <20211112025222.61031-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112025222.61031-1-umesh.nerlige.ramappa@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 06:52:22PM -0800, Umesh Nerlige Ramappa wrote:
> Irrespective of the backend for request submissions, busyness for an
> engine with an active context is calculated using:
> 
> busyness = total + (current_time - context_switch_in_time)
> 
> In execlists mode of operation, the context switch events are handled
> by the CPU. Context switch in/out time and current_time are captured
> in CPU time domain using ktime_get().
> 
> In GuC mode of submission, context switch events are handled by GuC and
> the times in the above formula are captured in GT clock domain. This
> information is shared with the CPU through shared memory. This results
> in 2 caveats:
> 
> 1) The time taken between start of a batch and the time that CPU is able
> to see the context_switch_in_time in shared memory is dependent on GuC
> and memory bandwidth constraints.
> 
> 2) Determining current_time requires an MMIO read that can take anywhere
> between a few us to a couple ms. A reference CPU time is captured soon
> after reading the MMIO so that the caller can compare the cpu delta
> between 2 busyness samples. The issue here is that the CPU delta and the
> busyness delta can be skewed because of the time taken to read the
> register.
> 
> These 2 factors affect the accuracy of the selftest -
> live_engine_busy_stats. For (1) the selftest waits until busyness stats
> are visible to the CPU. The effects of (2) are more prominent for the
> current busyness sample period of 100 us. Increase the busyness sample
> period from 100 us to 10 ms to overccome (2).
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Explaination of increased wait period makes sense to me.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_engine_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
> index 0bfd738dbf3a..96cc565afa78 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
> @@ -316,7 +316,7 @@ static int live_engine_busy_stats(void *arg)
>  		ENGINE_TRACE(engine, "measuring busy time\n");
>  		preempt_disable();
>  		de = intel_engine_get_busy_time(engine, &t[0]);
> -		udelay(100);
> +		udelay(10000);
>  		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
>  		preempt_enable();
>  		dt = ktime_sub(t[1], t[0]);
> -- 
> 2.20.1
> 
