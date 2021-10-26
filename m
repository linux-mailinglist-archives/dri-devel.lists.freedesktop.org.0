Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23743B610
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853B76E439;
	Tue, 26 Oct 2021 15:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BFD6E439;
 Tue, 26 Oct 2021 15:49:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217115016"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217115016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:47:41 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="596977809"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:47:40 -0700
Date: Tue, 26 Oct 2021 08:43:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Subject: Re: [PATCH 00/47] GuC submission support
Message-ID: <20211026154303.GA12465@jons-linux-dev-box>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <163489530491.10153.576017085715728906@jlahtine-mobl.ger.corp.intel.com>
 <20211022164219.GA23160@jons-linux-dev-box>
 <163515462275.3804.10893210486918669519@jlahtine-mobl.ger.corp.intel.com>
 <20211025151506.GA10182@jons-linux-dev-box>
 <163523877564.3841.4449806608079864803@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163523877564.3841.4449806608079864803@jlahtine-mobl.ger.corp.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 26, 2021 at 11:59:35AM +0300, Joonas Lahtinen wrote:
> Quoting Matthew Brost (2021-10-25 18:15:09)
> > On Mon, Oct 25, 2021 at 12:37:02PM +0300, Joonas Lahtinen wrote:
> > > Quoting Matthew Brost (2021-10-22 19:42:19)
> > > > On Fri, Oct 22, 2021 at 12:35:04PM +0300, Joonas Lahtinen wrote:
> > > > > Hi Matt & John,
> > > > > 
> > > > > Can you please queue patches with the right Fixes: references to convert
> > > > > all the GuC tracepoints to be protected by the LOW_LEVEL_TRACEPOINTS
> > > > > protection for now. Please do so before next Wednesday so we get it
> > > > > queued in drm-intel-next-fixes.
> > > > > 
> > > > 
> > > > Don't we already do that? I checked i915_trace.h and every tracepoint I
> > > > added (intel_context class, i915_request_guc_submit) is protected by
> > > > LOW_LEVEL_TRACEPOINTS.
> > > > 
> > > > The only thing I changed outside of that protection is adding the guc_id
> > > > field to existing i915_request class tracepoints.
> > > 
> > > It's the first search hit for "guc" inside the i915_trace.h file :)
> > > 
> > > > Without the guc_id in
> > > > those tracepoints these are basically useless with GuC submission. We
> > > > could revert that if it is a huge deal but as I said then they are
> > > > useless...
> > > 
> > > Let's eliminate it for now and restore the tracepoint exactly as it was.
> > > 
> > 
> > Don't really agree - let's render tracepoints to be useless? Are
> > tracepoints ABI? I googled this and couldn't really find a definie
> > answer. If tracepoints are ABI, then OK I can revert this change but
> > still this is a poor technical decision (tracepoints should not be ABI).
> 
> Thats a very heated discussion in general. But the fact is that if
> tracepoint changes have caused regressions to applications, they have
> been forced to be remain untouched. You are free to raise the discussion
> with Linus/LKML if you feel that should not be the case. So the end
> result is that tracepoints are effectively in limbo, not ABI unless some
> application uses them like ABI.
> 

Not trying to start or fight a holy war. If the current rules are don't
change tracepoints, we won't. Patch posted, let's stay focused, get an
RB, and move on.

Matt

> Feel free to search the intel-gfx/lkml for "tracepoints" keyword and look
> for threads with many replies. It's not that I would not agree, it's more
> that I'm not in the mood for repeating that discussion over and over again
> and always land in the same spot.
> 
> So for now, we don't add anything new to tracepoints we can't guarantee
> to always be there untouched. Similarly, we don't guarantee any of them
> to remain stable. So we try to be compatible with the limbo.
> 
> I'm long overdue waiting for some stable consumer to step up for the
> tracepoints, so we can then start discussion what would actually be the
> best way of getting that information out for them. In ~5 years that has
> not happened.
> 
> > > If there is an immediate need, we should instead have an auxilary tracepoint
> > > which is enabled only through LOW_LEVEL_TRACEPOINTS and that amends the
> > > information of the basic tracepoint.
> > > 
> > 
> > Regardless of what I said above, I'll post 2 patches. The 1st just
> > remove the GuC, the 2nd modify the tracepoint to include guc_id if
> > LOW_LEVEL_TRACEPOINTS is defined.
> 
> Thanks. Let's get a patch merged which simply drops the guc_id for now
> to unblock things.
> 
> For the second, an auxilary tracepoint will be preferred instead of
> mutating the existing one (regardless of the LOW_LEVEL_TRACEPOINTS).
> 
> I only noticed a patch that mutates the tracepoints, can you
> double-check sending the first patch?
> 
> Regards, Joonas
> 
> > 
> > > For the longer term solution we should align towards the dma fence
> > > tracepoints. When those are combined with the OA information, one should
> > > be able to get a good understanding of both the software and hardware
> > > scheduling decisions.
> > > 
> > 
> > Not sure about this either. I use these tracepoins to correlate things
> > to the GuC log. Between the 2, if you know what you are doing you
> > basically can figure out everything that is happening. Fields in the
> > trace translate directly to fields in the GuC log. Some of these fields
> > are backend specific, not sure how these could be pushed the dma fence
> > tracepoints. For what it is worth, without these tracepoints we'd likely
> > still have a bunch of bugs in the GuC firmware. I understand these
> > points, several other i915 developers do, and several of the GuC
> > firmware developers do too.
> > 
> > Matt
> > 
> > > Regards, Joonas
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > There's the orthogonal track to discuss what would be the stable set of
> > > > > tracepoints we could expose. However, before that discussion is closed,
> > > > > let's keep a rather strict line to avoid potential maintenance burned.
> > > > > 
> > > > > We can then relax in the future as needed.
> > > > > 
> > > > > Regards, Joonas
> > > > > 
> > > > > Quoting Matthew Brost (2021-06-24 10:04:29)
> > > > > > As discussed in [1], [2] we are enabling GuC submission support in the
> > > > > > i915. This is a subset of the patches in step 5 described in [1],
> > > > > > basically it is absolute to enable CI with GuC submission on gen11+
> > > > > > platforms.
> > > > > > 
> > > > > > This series itself will likely be broken down into smaller patch sets to
> > > > > > merge. Likely into CTBs changes, basic submission, virtual engines, and
> > > > > > resets.
> > > > > > 
> > > > > > A following series will address the missing patches remaining from [1].
> > > > > > 
> > > > > > Locally tested on TGL machine and basic tests seem to be passing.
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > 
> > > > > > [1] https://patchwork.freedesktop.org/series/89844/
> > > > > > [2] https://patchwork.freedesktop.org/series/91417/
> > > > > > 
> > > > > > Daniele Ceraolo Spurio (1):
> > > > > >   drm/i915/guc: Unblock GuC submission on Gen11+
> > > > > > 
> > > > > > John Harrison (10):
> > > > > >   drm/i915/guc: Module load failure test for CT buffer creation
> > > > > >   drm/i915: Track 'serial' counts for virtual engines
> > > > > >   drm/i915/guc: Provide mmio list to be saved/restored on engine reset
> > > > > >   drm/i915/guc: Don't complain about reset races
> > > > > >   drm/i915/guc: Enable GuC engine reset
> > > > > >   drm/i915/guc: Fix for error capture after full GPU reset with GuC
> > > > > >   drm/i915/guc: Hook GuC scheduling policies up
> > > > > >   drm/i915/guc: Connect reset modparam updates to GuC policy flags
> > > > > >   drm/i915/guc: Include scheduling policies in the debugfs state dump
> > > > > >   drm/i915/guc: Add golden context to GuC ADS
> > > > > > 
> > > > > > Matthew Brost (36):
> > > > > >   drm/i915/guc: Relax CTB response timeout
> > > > > >   drm/i915/guc: Improve error message for unsolicited CT response
> > > > > >   drm/i915/guc: Increase size of CTB buffers
> > > > > >   drm/i915/guc: Add non blocking CTB send function
> > > > > >   drm/i915/guc: Add stall timer to non blocking CTB send function
> > > > > >   drm/i915/guc: Optimize CTB writes and reads
> > > > > >   drm/i915/guc: Add new GuC interface defines and structures
> > > > > >   drm/i915/guc: Remove GuC stage descriptor, add lrc descriptor
> > > > > >   drm/i915/guc: Add lrc descriptor context lookup array
> > > > > >   drm/i915/guc: Implement GuC submission tasklet
> > > > > >   drm/i915/guc: Add bypass tasklet submission path to GuC
> > > > > >   drm/i915/guc: Implement GuC context operations for new inteface
> > > > > >   drm/i915/guc: Insert fence on context when deregistering
> > > > > >   drm/i915/guc: Defer context unpin until scheduling is disabled
> > > > > >   drm/i915/guc: Disable engine barriers with GuC during unpin
> > > > > >   drm/i915/guc: Extend deregistration fence to schedule disable
> > > > > >   drm/i915: Disable preempt busywait when using GuC scheduling
> > > > > >   drm/i915/guc: Ensure request ordering via completion fences
> > > > > >   drm/i915/guc: Disable semaphores when using GuC scheduling
> > > > > >   drm/i915/guc: Ensure G2H response has space in buffer
> > > > > >   drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
> > > > > >   drm/i915/guc: Update GuC debugfs to support new GuC
> > > > > >   drm/i915/guc: Add several request trace points
> > > > > >   drm/i915: Add intel_context tracing
> > > > > >   drm/i915/guc: GuC virtual engines
> > > > > >   drm/i915: Hold reference to intel_context over life of i915_request
> > > > > >   drm/i915/guc: Disable bonding extension with GuC submission
> > > > > >   drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs
> > > > > >   drm/i915/guc: Reset implementation for new GuC interface
> > > > > >   drm/i915: Reset GPU immediately if submission is disabled
> > > > > >   drm/i915/guc: Add disable interrupts to guc sanitize
> > > > > >   drm/i915/guc: Suspend/resume implementation for new interface
> > > > > >   drm/i915/guc: Handle context reset notification
> > > > > >   drm/i915/guc: Handle engine reset failure notification
> > > > > >   drm/i915/guc: Enable the timer expired interrupt for GuC
> > > > > >   drm/i915/guc: Capture error state on context reset
> > > > > > 
> > > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   |   30 +-
> > > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.h   |    1 +
> > > > > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
> > > > > >  drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   41 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   14 +-
> > > > > >  .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_context.c       |   41 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_context.h       |   31 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_context_types.h |   49 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_engine.h        |   72 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
> > > > > >  .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
> > > > > >  .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_engine_types.h  |   12 +-
> > > > > >  .../drm/i915/gt/intel_execlists_submission.c  |  234 +-
> > > > > >  .../drm/i915/gt/intel_execlists_submission.h  |   11 -
> > > > > >  drivers/gpu/drm/i915/gt/intel_gt.c            |   21 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   22 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
> > > > > >  drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
> > > > > >  drivers/gpu/drm/i915/gt/intel_reset.c         |   20 +-
> > > > > >  .../gpu/drm/i915/gt/intel_ring_submission.c   |   28 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
> > > > > >  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
> > > > > >  .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
> > > > > >  drivers/gpu/drm/i915/gt/mock_engine.c         |   41 +-
> > > > > >  drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
> > > > > >  drivers/gpu/drm/i915/gt/selftest_execlists.c  |   20 +-
> > > > > >  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   15 +
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  106 +-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  460 +++-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    3 +
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  318 ++-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   22 +-
> > > > > >  .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   25 +-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   88 +-
> > > > > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2197 +++++++++++++++--
> > > > > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   17 +-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  102 +-
> > > > > >  drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
> > > > > >  drivers/gpu/drm/i915/i915_debugfs.c           |    2 +
> > > > > >  drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
> > > > > >  drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
> > > > > >  drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
> > > > > >  drivers/gpu/drm/i915/i915_reg.h               |    2 +
> > > > > >  drivers/gpu/drm/i915/i915_request.c           |  159 +-
> > > > > >  drivers/gpu/drm/i915/i915_request.h           |   21 +
> > > > > >  drivers/gpu/drm/i915/i915_scheduler.c         |    6 +
> > > > > >  drivers/gpu/drm/i915/i915_scheduler.h         |    6 +
> > > > > >  drivers/gpu/drm/i915/i915_scheduler_types.h   |    5 +
> > > > > >  drivers/gpu/drm/i915/i915_trace.h             |  197 +-
> > > > > >  .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
> > > > > >  .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
> > > > > >  57 files changed, 4159 insertions(+), 787 deletions(-)
> > > > > > 
> > > > > > -- 
> > > > > > 2.28.0
> > > > > > 
