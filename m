Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808E4256D1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 17:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAE86E84C;
	Thu,  7 Oct 2021 15:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D133E6E84C;
 Thu,  7 Oct 2021 15:42:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="206404746"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="206404746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 08:42:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="458835173"
Received: from unerlige-ril-10.jf.intel.com (HELO unerlige-ril-10.165.21.208)
 ([10.165.21.208])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 08:42:33 -0700
Date: Thu, 7 Oct 2021 08:42:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com, daniel.vetter@ffwll.ch,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915/pmu: Connect engine busyness stats from GuC to
 pmu
Message-ID: <20211007154233.GJ4467@unerlige-ril-10.165.21.208>
References: <20211005174711.55618-1-umesh.nerlige.ramappa@intel.com>
 <73824dba-142a-1022-252e-ce56de1227fa@linux.intel.com>
 <20211006204552.GI4467@unerlige-ril-10.165.21.208>
 <ae1570ac-4af1-bb3e-7a97-9b56e2242441@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae1570ac-4af1-bb3e-7a97-9b56e2242441@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Thu, Oct 07, 2021 at 09:17:34AM +0100, Tvrtko Ursulin wrote:
>
>On 06/10/2021 21:45, Umesh Nerlige Ramappa wrote:
>>On Wed, Oct 06, 2021 at 10:11:58AM +0100, Tvrtko Ursulin wrote:
>
>[snip]
>
>>>>@@ -762,12 +764,25 @@ submission_disabled(struct intel_guc *guc)
>>>> static void disable_submission(struct intel_guc *guc)
>>>> {
>>>>     struct i915_sched_engine * const sched_engine = guc->sched_engine;
>>>>+    struct intel_gt *gt = guc_to_gt(guc);
>>>>+    struct intel_engine_cs *engine;
>>>>+    enum intel_engine_id id;
>>>>+    unsigned long flags;
>>>>     if (__tasklet_is_enabled(&sched_engine->tasklet)) {
>>>>         GEM_BUG_ON(!guc->ct.enabled);
>>>>         __tasklet_disable_sync_once(&sched_engine->tasklet);
>>>>         sched_engine->tasklet.callback = NULL;
>>>>     }
>>>>+
>>>>+    cancel_delayed_work(&guc->timestamp.work);
>>>
>>>I am not sure when disable_submission gets called so a question - 
>>>could it be important to call cancel_delayed_work_sync here to 
>>>ensure if the worker was running it had exited before proceeding?
>>
>>disable_submission is called in the reset_prepare path for uc 
>>resets. I see this happening only with busy-hang test which does a 
>>global gt reset. The counterpart for this is the 
>>guc_init_engine_stats which is called post reset in the path to 
>>initialize GuC.
>>
>>I tried cancel_delayed_work_sync both here and in park. Seems to 
>>work fine, so will change the calls to _sync versions.
>
>From park is not allowed to sleep so can't do sync from there. It 
>might have been my question which put you on a wrong path, sorry. Now 
>I think question remains what happens if the ping worker happens to be 
>sampling GuC state as GuC is being reset? Do you need some sort of a 
>lock to protect that, or make sure worker skips if reset in progress?
>

If ping ran after the actual gt reset, we should be okay. If it ran 
after we reset prev_total and before gt reset, then we have bad 
busyness. At the same time, skipping ping risks timestamp overflow. I am 
thinking skip ping, but update all stats in the reset_prepare path.  
reset_prepare is running with pm runtime.

On a different note, during reset, we need to store now-start into the 
total_gt_clks also because we may lose that information in the next pmu 
query or ping (post reset). Maybe I will store active_clks instead of 
running in the stats to do that.

Thanks,
Umesh

