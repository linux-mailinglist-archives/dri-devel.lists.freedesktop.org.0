Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2A8B3C83
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE6010F146;
	Fri, 26 Apr 2024 16:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ex2FtwAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7525C10F135;
 Fri, 26 Apr 2024 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714147987; x=1745683987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NYYud3nisLQNkqgJou6N4izb6PljCGJnpztp2pdfMQ0=;
 b=ex2FtwADBCxWDH4uLJqkfG9V9ovsFr2HXdwD/3Zj6tNJ7/RuE/FmO4gh
 DO/woP7h7Xz2PT4uLCja3beSIziNN7A2oGjMDwCAC2RyzWC03arzPQoiy
 EPVM5Abamb6WdDKipMrmGfzlRzqGLiBmc3kLyO/sJgnXpcz26KtnA4ATz
 Ol2NZNpDBWPVQPPi/QzPyb83gXdC+UkxpxqVj5LQqhadYtBm8EbjZJZzS
 8ep3HNyC2LYXX2Z2o1LMEbR5HcGuuHhOL835Tm197kkQrfxVOuskrXBls
 LUWLuiN0anMz9FGYqqkVena9BjW/rn9UNaZbleOR1A2hnIjaee92k7vHv A==;
X-CSE-ConnectionGUID: 2jq7iCn3QNOlbZjsxZy3dw==
X-CSE-MsgGUID: YSgPDyY+Tx2i8cPgHcWJrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9756443"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9756443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 09:13:06 -0700
X-CSE-ConnectionGUID: Aet+SIr8QWa8EtVJ+W+rkA==
X-CSE-MsgGUID: 0PtzvyhbQOquj2phj3JMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="25541332"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.59])
 ([10.94.248.59])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 09:13:04 -0700
Message-ID: <37711cc1-02f8-4ab4-86fd-3f4c8c96c7c5@linux.intel.com>
Date: Fri, 26 Apr 2024 18:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Disarm breadcrumbs if engines are already
 idle
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240423165505.465734-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240423165505.465734-2-janusz.krzysztofik@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/23/2024 6:23 PM, Janusz Krzysztofik wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> The breadcrumbs use a GT wakeref for guarding the interrupt, but are
> disarmed during release of the engine wakeref. This leaves a hole where
> we may attach a breadcrumb just as the engine is parking (after it has
> parked its breadcrumbs), execute the irq worker with some signalers still
> attached, but never be woken again.
>
> That issue manifests itself in CI with IGT runner timeouts while tests
> are waiting indefinitely for release of all GT wakerefs.
>
> <6> [209.151778] i915: Running live_engine_pm_selftests/live_engine_busy_stats
> <7> [209.231628] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] disabling PW_5
> <7> [209.231816] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] disabling PW_4
> <7> [209.231944] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] disabling PW_3
> <7> [209.232056] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] disabling PW_2
> <7> [209.232166] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] disabling DC_off
> <7> [209.232270] i915 0000:00:02.0: [drm:skl_enable_dc6 [i915]] Enabling DC6
> <7> [209.232368] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Setting DC state from 00 to 02
> <4> [299.356116] [IGT] Inactivity timeout exceeded. Killing the current test with SIGQUIT.
> ...
> <6> [299.356526] sysrq: Show State
> ...
> <6> [299.373964] task:i915_selftest   state:D stack:11784 pid:5578  tgid:5578  ppid:873    flags:0x00004002
> <6> [299.373967] Call Trace:
> <6> [299.373968]  <TASK>
> <6> [299.373970]  __schedule+0x3bb/0xda0
> <6> [299.373974]  schedule+0x41/0x110
> <6> [299.373976]  intel_wakeref_wait_for_idle+0x82/0x100 [i915]
> <6> [299.374083]  ? __pfx_var_wake_function+0x10/0x10
> <6> [299.374087]  live_engine_busy_stats+0x9b/0x500 [i915]
> <6> [299.374173]  __i915_subtests+0xbe/0x240 [i915]
> <6> [299.374277]  ? __pfx___intel_gt_live_setup+0x10/0x10 [i915]
> <6> [299.374369]  ? __pfx___intel_gt_live_teardown+0x10/0x10 [i915]
> <6> [299.374456]  intel_engine_live_selftests+0x1c/0x30 [i915]
> <6> [299.374547]  __run_selftests+0xbb/0x190 [i915]
> <6> [299.374635]  i915_live_selftests+0x4b/0x90 [i915]
> <6> [299.374717]  i915_pci_probe+0x10d/0x210 [i915]
>
> At the end of the interrupt worker, if there are no more engines awake,
> disarm the breadcrumb and go to sleep.
>
> Fixes: 9d5612ca165a ("drm/i915/gt: Defer enabling the breadcrumb interrupt to after submission")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/10026
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: <stable@vger.kernel.org> # v5.12+
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>


Acked-by: Nirmoy Das <nirmoy.das@intel.com>

I will let others/Andrzej r-b this as I am not very familiar with the code.


Thanks,

Nirmoy

> ---
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index d650beb8ed22f..20b9b04ec1e0b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -263,8 +263,13 @@ static void signal_irq_work(struct irq_work *work)
>   		i915_request_put(rq);
>   	}
>   
> +	/* Lazy irq enabling after HW submission */
>   	if (!READ_ONCE(b->irq_armed) && !list_empty(&b->signalers))
>   		intel_breadcrumbs_arm_irq(b);
> +
> +	/* And confirm that we still want irqs enabled before we yield */
> +	if (READ_ONCE(b->irq_armed) && !atomic_read(&b->active))
> +		intel_breadcrumbs_disarm_irq(b);
>   }
>   
>   struct intel_breadcrumbs *
> @@ -315,13 +320,7 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs *b)
>   		return;
>   
>   	/* Kick the work once more to drain the signalers, and disarm the irq */
> -	irq_work_sync(&b->irq_work);
> -	while (READ_ONCE(b->irq_armed) && !atomic_read(&b->active)) {
> -		local_irq_disable();
> -		signal_irq_work(&b->irq_work);
> -		local_irq_enable();
> -		cond_resched();
> -	}
> +	irq_work_queue(&b->irq_work);
>   }
>   
>   void intel_breadcrumbs_free(struct kref *kref)
> @@ -404,7 +403,7 @@ static void insert_breadcrumb(struct i915_request *rq)
>   	 * the request as it may have completed and raised the interrupt as
>   	 * we were attaching it into the lists.
>   	 */
> -	if (!b->irq_armed || __i915_request_is_complete(rq))
> +	if (!READ_ONCE(b->irq_armed) || __i915_request_is_complete(rq))
>   		irq_work_queue(&b->irq_work);
>   }
>   
