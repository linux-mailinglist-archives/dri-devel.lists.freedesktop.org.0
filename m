Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B0C467EB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6010E395;
	Mon, 10 Nov 2025 12:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1omGA0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2914D10E387;
 Mon, 10 Nov 2025 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762776725; x=1794312725;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Gq1Qz9de0zDdr7Qza9fayAQEpXpfGWwvApSfAxEFrck=;
 b=G1omGA0hXOppyDbA6On8JSz01FLJWAggrdfYozTMuPlzwn4YLSKvwQb2
 OpBtrdvAlIjYJZAdp/dCQuI4WyX8ZkuH2qhUTXPxvKG+TWsNBDEuOHD50
 EL+zszhDaJSSbhn1l3h6NIGXbcgMHygAFBvSPH2QPK3JS3Hk4tPL1poWl
 Wji6fMiO6UZSP1fVmGosPSZyaLOWYSxwqLY45wfYIpeO1s93n06P4VV0Q
 Ta/4+UZoC5OTIW6SSRM2P2OyzE2WFcLv5/DlJyqUDqRw9aAX0RPvXBCcF
 ScCYNEyht4+oBCfcsbvzfxybL57FRDvgz2cL3ns2atgYipmhfMTPj22qw A==;
X-CSE-ConnectionGUID: uksbPI6eTaC66d0iOuJn7w==
X-CSE-MsgGUID: yceLlf4wTHSdTozkuo5OCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64734782"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64734782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:12:05 -0800
X-CSE-ConnectionGUID: HH7CDWeHTiWebboaKijKWA==
X-CSE-MsgGUID: BnoiTsyASuSg/n0lzooiUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="189379199"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:11:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Marco Crivellari
 <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
In-Reply-To: <34ozsv3e6ujs4rn6c2r4nrjcjifgazddy5jecwur6atfcop6vp@bunf3uyofmb4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251104100032.61525-1-marco.crivellari@suse.com>
 <34ozsv3e6ujs4rn6c2r4nrjcjifgazddy5jecwur6atfcop6vp@bunf3uyofmb4>
Date: Mon, 10 Nov 2025 14:11:56 +0200
Message-ID: <aaac1c9b25d0fc2500e67d05948a22d77dcc72e7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 05 Nov 2025, Krzysztof Karas <krzysztof.karas@intel.com> wrote:
> Hi Marco,
>
> thanks for addressing my comments!
>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> on the whole series.

The series absolutely must go through both i915 and xe CI before
merging. Krzysztof, can you please make follow through with that?

BR,
Jani.

>  
> Best Regards,
> Krzysztof
>
> On 2025-11-04 at 11:00:29 +0100, Marco Crivellari wrote:
>> Hi,
>> 
>> === Current situation: problems ===
>> 
>> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
>> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
>> 
>> This leads to different scenarios if a work item is scheduled on an
>> isolated CPU where "delay" value is 0 or greater then 0:
>>         schedule_delayed_work(, 0);
>> 
>> This will be handled by __queue_work() that will queue the work item on the
>> current local (isolated) CPU, while:
>> 
>>         schedule_delayed_work(, 1);
>> 
>> Will move the timer on an housekeeping CPU, and schedule the work there.
>> 
>> Currently if a user enqueue a work item using schedule_delayed_work() the
>> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
>> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
>> schedule_work() that is using system_wq and queue_work(), that makes use
>> again of WORK_CPU_UNBOUND.
>> 
>> This lack of consistency cannot be addressed without refactoring the API.
>> 
>> === Recent changes to the WQ API ===
>> 
>> The following, address the recent changes in the Workqueue API:
>> 
>> - commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>> - commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>> 
>> The old workqueues will be removed in a future release cycle.
>> 
>> === Introduced Changes by this series ===
>> 
>> 1) [P 1-2]  Replace uses of system_wq and system_unbound_wq
>> 
>>     system_wq is a per-CPU workqueue, but his name is not clear.
>>     system_unbound_wq is to be used when locality is not required.
>> 
>>     Because of that, system_wq has been replaced with system_percpu_wq, and
>>     system_unbound_wq has been replaced with system_dfl_wq.
>> 
>> 2) [P 3] WQ_PERCPU added to alloc_workqueue()
>> 
>>     This change adds a new WQ_PERCPU flag to explicitly request
>>     alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>> 
>> 
>> Thanks!
>> 
>> ---
>> Changes in 3:
>> - Improved commit logs
>> 
>> Changes in v2:
>> - fix typo in patch subject (add instead of added).
>> 
>> - in every patch is also present the specific commit hash about the
>>   workqueue API change.
>> 
>> - fixed commit log of P1 (removed "Adding system_dfl_wq...").
>> 
>> - P2: subject changed reflecting the effective change.
>> 
>> - rebased to v6.18-rc4.
>> 
>> 
>> Marco Crivellari (3):
>>   drm/i915: replace use of system_unbound_wq with system_dfl_wq
>>   drm/i915: replace use of system_wq with system_percpu_wq in the
>>     documentation
>>   drm/i915: add WQ_PERCPU to alloc_workqueue users
>> 
>>  drivers/gpu/drm/i915/display/intel_display_driver.c | 4 ++--
>>  drivers/gpu/drm/i915/display/intel_display_power.c  | 2 +-
>>  drivers/gpu/drm/i915/display/intel_tc.c             | 4 ++--
>>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c        | 2 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c              | 4 ++--
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c           | 4 ++--
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c   | 6 +++---
>>  drivers/gpu/drm/i915/i915_active.c                  | 2 +-
>>  drivers/gpu/drm/i915/i915_driver.c                  | 5 +++--
>>  drivers/gpu/drm/i915/i915_drv.h                     | 2 +-
>>  drivers/gpu/drm/i915/i915_sw_fence_work.c           | 2 +-
>>  drivers/gpu/drm/i915/i915_vma_resource.c            | 2 +-
>>  drivers/gpu/drm/i915/pxp/intel_pxp.c                | 2 +-
>>  drivers/gpu/drm/i915/pxp/intel_pxp_irq.c            | 2 +-
>>  drivers/gpu/drm/i915/selftests/i915_sw_fence.c      | 2 +-
>>  drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 2 +-
>>  16 files changed, 24 insertions(+), 23 deletions(-)
>> 
>> -- 
>> 2.51.1
>> 
>

-- 
Jani Nikula, Intel
