Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933343C659
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 11:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2236E875;
	Wed, 27 Oct 2021 09:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE476E875;
 Wed, 27 Oct 2021 09:21:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="230066568"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="230066568"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:21:06 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="579470654"
Received: from aeremina-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.123])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:21:04 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211026155116.GA12563@jons-linux-dev-box>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <163489530491.10153.576017085715728906@jlahtine-mobl.ger.corp.intel.com>
 <20211022164219.GA23160@jons-linux-dev-box>
 <163515462275.3804.10893210486918669519@jlahtine-mobl.ger.corp.intel.com>
 <20211025151506.GA10182@jons-linux-dev-box>
 <163523877564.3841.4449806608079864803@jlahtine-mobl.ger.corp.intel.com>
 <20211026155116.GA12563@jons-linux-dev-box>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 00/47] GuC submission support
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163532646166.7295.478246212520524583@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 27 Oct 2021 12:21:01 +0300
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

Quoting Matthew Brost (2021-10-26 18:51:17)
> On Tue, Oct 26, 2021 at 11:59:35AM +0300, Joonas Lahtinen wrote:
> > Quoting Matthew Brost (2021-10-25 18:15:09)
> > > On Mon, Oct 25, 2021 at 12:37:02PM +0300, Joonas Lahtinen wrote:
> > > > Quoting Matthew Brost (2021-10-22 19:42:19)
> > > > > On Fri, Oct 22, 2021 at 12:35:04PM +0300, Joonas Lahtinen wrote:
> > > > > > Hi Matt & John,
> > > > > >=20
> > > > > > Can you please queue patches with the right Fixes: references t=
o convert
> > > > > > all the GuC tracepoints to be protected by the LOW_LEVEL_TRACEP=
OINTS
> > > > > > protection for now. Please do so before next Wednesday so we ge=
t it
> > > > > > queued in drm-intel-next-fixes.
> > > > > >=20
> > > > >=20
> > > > > Don't we already do that? I checked i915_trace.h and every tracep=
oint I
> > > > > added (intel_context class, i915_request_guc_submit) is protected=
 by
> > > > > LOW_LEVEL_TRACEPOINTS.
> > > > >=20
> > > > > The only thing I changed outside of that protection is adding the=
 guc_id
> > > > > field to existing i915_request class tracepoints.
> > > >=20
> > > > It's the first search hit for "guc" inside the i915_trace.h file :)
> > > >=20
> > > > > Without the guc_id in
> > > > > those tracepoints these are basically useless with GuC submission=
. We
> > > > > could revert that if it is a huge deal but as I said then they are
> > > > > useless...
> > > >=20
> > > > Let's eliminate it for now and restore the tracepoint exactly as it=
 was.
> > > >=20
> > >=20
> > > Don't really agree - let's render tracepoints to be useless? Are
> > > tracepoints ABI? I googled this and couldn't really find a definie
> > > answer. If tracepoints are ABI, then OK I can revert this change but
> > > still this is a poor technical decision (tracepoints should not be AB=
I).
> >=20
> > Thats a very heated discussion in general. But the fact is that if
> > tracepoint changes have caused regressions to applications, they have
> > been forced to be remain untouched. You are free to raise the discussion
> > with Linus/LKML if you feel that should not be the case. So the end
> > result is that tracepoints are effectively in limbo, not ABI unless some
> > application uses them like ABI.
> >=20
> > Feel free to search the intel-gfx/lkml for "tracepoints" keyword and lo=
ok
> > for threads with many replies. It's not that I would not agree, it's mo=
re
> > that I'm not in the mood for repeating that discussion over and over ag=
ain
> > and always land in the same spot.
> >=20
> > So for now, we don't add anything new to tracepoints we can't guarantee
> > to always be there untouched. Similarly, we don't guarantee any of them
> > to remain stable. So we try to be compatible with the limbo.
> >=20
> > I'm long overdue waiting for some stable consumer to step up for the
> > tracepoints, so we can then start discussion what would actually be the
> > best way of getting that information out for them. In ~5 years that has
> > not happened.
> >=20
> > > > If there is an immediate need, we should instead have an auxilary t=
racepoint
> > > > which is enabled only through LOW_LEVEL_TRACEPOINTS and that amends=
 the
> > > > information of the basic tracepoint.
> > > >=20
> > >=20
> > > Regardless of what I said above, I'll post 2 patches. The 1st just
> > > remove the GuC, the 2nd modify the tracepoint to include guc_id if
> > > LOW_LEVEL_TRACEPOINTS is defined.
> >=20
> > Thanks. Let's get a patch merged which simply drops the guc_id for now
> > to unblock things.
> >=20
> > For the second, an auxilary tracepoint will be preferred instead of
> > mutating the existing one (regardless of the LOW_LEVEL_TRACEPOINTS).
> >=20
> > I only noticed a patch that mutates the tracepoints, can you
> > double-check sending the first patch?
>=20
> Sorry for the double reply - missed this one in the first.
>=20
> I changed my plans / mind after I send the original email. I only sent a
> patch which includes guc_id when LOW_LEVEL_TRACEPOINTS is enabled. That
> is the bear minimum I live with. Without it any time there is a problem
> results in hacking the kernel. I can't do that. This is a good
> compromise.

When it comes to fixing a regression, it should be done with the minimal
revert/change with "Fixes:" as suggested originally.

Then we can leave the discussion for how to best cover the gap you pointed
out, to be resolved in the second patch. There are clearly at least two ways
to approach it, either mutate the original tracepoint or add an auxilary
tracepoint to amend the information. So we should have a quick
discussion between the involved parties which is a better approach.

We should not fix the regression in a patch where we also initiate a
change in behavior. That'll make bisecting and backporting patches a pain.

So even if the patches would be merged back-to-back to the tree at the
same time, they should be different patches. And in this case it seems
that the latter patch should have some discussion to reach a rough
consensus and that should not delay the delivery of the fix itself.

I will queue a patch to do the fix. We should continue the discussion
about auxilary tracepoint vs. mutating an existing tracepoint based on
the kernel config option in an another thread.

Regards, Joonas

>=20
> Matt
>=20
> >=20
> > Regards, Joonas
> >=20
> > >=20
> > > > For the longer term solution we should align towards the dma fence
> > > > tracepoints. When those are combined with the OA information, one s=
hould
> > > > be able to get a good understanding of both the software and hardwa=
re
> > > > scheduling decisions.
> > > >=20
> > >=20
> > > Not sure about this either. I use these tracepoins to correlate things
> > > to the GuC log. Between the 2, if you know what you are doing you
> > > basically can figure out everything that is happening. Fields in the
> > > trace translate directly to fields in the GuC log. Some of these fiel=
ds
> > > are backend specific, not sure how these could be pushed the dma fence
> > > tracepoints. For what it is worth, without these tracepoints we'd lik=
ely
> > > still have a bunch of bugs in the GuC firmware. I understand these
> > > points, several other i915 developers do, and several of the GuC
> > > firmware developers do too.
> > >=20
> > > Matt
> > >=20
> > > > Regards, Joonas
> > > >=20
> > > > >=20
> > > > > Matt
> > > > >=20
> > > > > > There's the orthogonal track to discuss what would be the stabl=
e set of
> > > > > > tracepoints we could expose. However, before that discussion is=
 closed,
> > > > > > let's keep a rather strict line to avoid potential maintenance =
burned.
> > > > > >=20
> > > > > > We can then relax in the future as needed.
> > > > > >=20
> > > > > > Regards, Joonas
> > > > > >=20
> > > > > > Quoting Matthew Brost (2021-06-24 10:04:29)
> > > > > > > As discussed in [1], [2] we are enabling GuC submission suppo=
rt in the
> > > > > > > i915. This is a subset of the patches in step 5 described in =
[1],
> > > > > > > basically it is absolute to enable CI with GuC submission on =
gen11+
> > > > > > > platforms.
> > > > > > >=20
> > > > > > > This series itself will likely be broken down into smaller pa=
tch sets to
> > > > > > > merge. Likely into CTBs changes, basic submission, virtual en=
gines, and
> > > > > > > resets.
> > > > > > >=20
> > > > > > > A following series will address the missing patches remaining=
 from [1].
> > > > > > >=20
> > > > > > > Locally tested on TGL machine and basic tests seem to be pass=
ing.
> > > > > > >=20
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > >=20
> > > > > > > [1] https://patchwork.freedesktop.org/series/89844/
> > > > > > > [2] https://patchwork.freedesktop.org/series/91417/
> > > > > > >=20
> > > > > > > Daniele Ceraolo Spurio (1):
> > > > > > >   drm/i915/guc: Unblock GuC submission on Gen11+
> > > > > > >=20
> > > > > > > John Harrison (10):
> > > > > > >   drm/i915/guc: Module load failure test for CT buffer creati=
on
> > > > > > >   drm/i915: Track 'serial' counts for virtual engines
> > > > > > >   drm/i915/guc: Provide mmio list to be saved/restored on eng=
ine reset
> > > > > > >   drm/i915/guc: Don't complain about reset races
> > > > > > >   drm/i915/guc: Enable GuC engine reset
> > > > > > >   drm/i915/guc: Fix for error capture after full GPU reset wi=
th GuC
> > > > > > >   drm/i915/guc: Hook GuC scheduling policies up
> > > > > > >   drm/i915/guc: Connect reset modparam updates to GuC policy =
flags
> > > > > > >   drm/i915/guc: Include scheduling policies in the debugfs st=
ate dump
> > > > > > >   drm/i915/guc: Add golden context to GuC ADS
> > > > > > >=20
> > > > > > > Matthew Brost (36):
> > > > > > >   drm/i915/guc: Relax CTB response timeout
> > > > > > >   drm/i915/guc: Improve error message for unsolicited CT resp=
onse
> > > > > > >   drm/i915/guc: Increase size of CTB buffers
> > > > > > >   drm/i915/guc: Add non blocking CTB send function
> > > > > > >   drm/i915/guc: Add stall timer to non blocking CTB send func=
tion
> > > > > > >   drm/i915/guc: Optimize CTB writes and reads
> > > > > > >   drm/i915/guc: Add new GuC interface defines and structures
> > > > > > >   drm/i915/guc: Remove GuC stage descriptor, add lrc descript=
or
> > > > > > >   drm/i915/guc: Add lrc descriptor context lookup array
> > > > > > >   drm/i915/guc: Implement GuC submission tasklet
> > > > > > >   drm/i915/guc: Add bypass tasklet submission path to GuC
> > > > > > >   drm/i915/guc: Implement GuC context operations for new inte=
face
> > > > > > >   drm/i915/guc: Insert fence on context when deregistering
> > > > > > >   drm/i915/guc: Defer context unpin until scheduling is disab=
led
> > > > > > >   drm/i915/guc: Disable engine barriers with GuC during unpin
> > > > > > >   drm/i915/guc: Extend deregistration fence to schedule disab=
le
> > > > > > >   drm/i915: Disable preempt busywait when using GuC scheduling
> > > > > > >   drm/i915/guc: Ensure request ordering via completion fences
> > > > > > >   drm/i915/guc: Disable semaphores when using GuC scheduling
> > > > > > >   drm/i915/guc: Ensure G2H response has space in buffer
> > > > > > >   drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
> > > > > > >   drm/i915/guc: Update GuC debugfs to support new GuC
> > > > > > >   drm/i915/guc: Add several request trace points
> > > > > > >   drm/i915: Add intel_context tracing
> > > > > > >   drm/i915/guc: GuC virtual engines
> > > > > > >   drm/i915: Hold reference to intel_context over life of i915=
_request
> > > > > > >   drm/i915/guc: Disable bonding extension with GuC submission
> > > > > > >   drm/i915/guc: Direct all breadcrumbs for a class to single =
breadcrumbs
> > > > > > >   drm/i915/guc: Reset implementation for new GuC interface
> > > > > > >   drm/i915: Reset GPU immediately if submission is disabled
> > > > > > >   drm/i915/guc: Add disable interrupts to guc sanitize
> > > > > > >   drm/i915/guc: Suspend/resume implementation for new interfa=
ce
> > > > > > >   drm/i915/guc: Handle context reset notification
> > > > > > >   drm/i915/guc: Handle engine reset failure notification
> > > > > > >   drm/i915/guc: Enable the timer expired interrupt for GuC
> > > > > > >   drm/i915/guc: Capture error state on context reset
> > > > > > >=20
> > > > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   |   30 +-
> > > > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.h   |    1 +
> > > > > > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
> > > > > > >  drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   41 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   14 +-
> > > > > > >  .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_context.c       |   41 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_context.h       |   31 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_context_types.h |   49 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_engine.h        |   72 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
> > > > > > >  .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
> > > > > > >  .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_engine_types.h  |   12 +-
> > > > > > >  .../drm/i915/gt/intel_execlists_submission.c  |  234 +-
> > > > > > >  .../drm/i915/gt/intel_execlists_submission.h  |   11 -
> > > > > > >  drivers/gpu/drm/i915/gt/intel_gt.c            |   21 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   22 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
> > > > > > >  drivers/gpu/drm/i915/gt/intel_reset.c         |   20 +-
> > > > > > >  .../gpu/drm/i915/gt/intel_ring_submission.c   |   28 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
> > > > > > >  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
> > > > > > >  .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
> > > > > > >  drivers/gpu/drm/i915/gt/mock_engine.c         |   41 +-
> > > > > > >  drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
> > > > > > >  drivers/gpu/drm/i915/gt/selftest_execlists.c  |   20 +-
> > > > > > >  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   15 +
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  106 +-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  460 +++-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    3 +
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  318 ++-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   22 +-
> > > > > > >  .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   25 +-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   88 +-
> > > > > > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2197 +++++++=
++++++++--
> > > > > > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   17 +-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  102 +-
> > > > > > >  drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
> > > > > > >  drivers/gpu/drm/i915/i915_debugfs.c           |    2 +
> > > > > > >  drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
> > > > > > >  drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
> > > > > > >  drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
> > > > > > >  drivers/gpu/drm/i915/i915_reg.h               |    2 +
> > > > > > >  drivers/gpu/drm/i915/i915_request.c           |  159 +-
> > > > > > >  drivers/gpu/drm/i915/i915_request.h           |   21 +
> > > > > > >  drivers/gpu/drm/i915/i915_scheduler.c         |    6 +
> > > > > > >  drivers/gpu/drm/i915/i915_scheduler.h         |    6 +
> > > > > > >  drivers/gpu/drm/i915/i915_scheduler_types.h   |    5 +
> > > > > > >  drivers/gpu/drm/i915/i915_trace.h             |  197 +-
> > > > > > >  .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
> > > > > > >  .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
> > > > > > >  57 files changed, 4159 insertions(+), 787 deletions(-)
> > > > > > >=20
> > > > > > > --=20
> > > > > > > 2.28.0
> > > > > > >=20
