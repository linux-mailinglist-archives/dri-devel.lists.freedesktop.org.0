Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085DD25DA18
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052AA6E2BE;
	Fri,  4 Sep 2020 13:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDB66E2BE;
 Fri,  4 Sep 2020 13:39:46 +0000 (UTC)
IronPort-SDR: 7WeNvKFcJ0Z0jzkijt8zEDug4pOzYfErjm5EtI1CZjqREQJwfuYfORg/FidyV2y9LVYHqf4qqj
 EU8lQLqiWwMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137793393"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137793393"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:39:46 -0700
IronPort-SDR: umS+8YSeLs1PI5iYUt1ZRDymbvCEaye4HPeq1p6nhNzc4oKCabi9Mr3MUm1c9XfmXFx8u2Hoad
 iVCuHZ0tzN1A==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="478491476"
Received: from mpietrix-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.4.5])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:39:42 -0700
Date: Fri, 4 Sep 2020 16:39:40 +0300
From: Joonas Lahtinen <jlahtine@jlahtine-mobl.ger.corp.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <20200904133940.GA20071@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes the GT pull request for v5.10. It's the same patches as
previously at "topic/drm-intel-gem-next", one dropped and a few
re-ordered while creating the "drm-intel-gt-next" branch. So the
patches have been part of drm-tip already for weeks.

More about the PR itself at the end, but now cutting to content:

As the log indicates, this pull req is all about the requested locking
refactoring. It ultimately ends up taking the WW locking into use across
the driver. I don't plan on sending further feature pull request
for v5.10, but let's focus on the -fixes pulls to stabilize this.

Apart from that, there's fix for Tigerlake related to syncobjs, a couple
of fixes to keep CI happy, and a code refactoring to allow for the
locking paradigm change.

GVT-g scheduler codebase is still missing the reworks. They will be done
as soon as the i915 ones get merged. But we have validated that the GVT-g
functionality still works as it's rather independent codebase.

NOTE: Includes reverts for 5 patches to faster introduce WW locking
refactoring. So those may come with some perf regressions. And major
locking refactoring probably also introduced some very subtle implicit
uAPI changes, so we'll have to deal with those as they are noticed.

Will include remaining 3 commits from drm-intel-gt-next in the PR of
next week (just -fixes stuff), when we have the full fixup for one of
them in addition to the minimal backportable fix. But feel free to 
take a look at the improved commit messages already, which you requested
in the previous -fixes PR.

CI results can be found at:

https://intel-gfx-ci.01.org/tree/drm-intel-gt-next/index.html

About this PR itself: I produced this with local DIM changes to
be able to tag branches at given commit and send the PR for given tag.
Took a couple of tries, so you can disregard the extra tags until
drm-intel-gt-next-2020-09-04-2. I'll post the DIM changes for review
as RFC.

Plan is for the "drm-intel-gt-next" branch to be a persistent branch,
where the GT hardware and GEM uAPI related patches would go. I opted to
drop the -queued concept, so single tree for tagging PRs and merging.

The rebasing onto drm-next while pushing to drm-intel-gt-next also causes
DIM to complain about the committer S-o-b's. I only added S-o-b to patches
that were actually modified and noticed DIM complaint only after I had
already fixed up all the Fixes: references.

I can re-spin with added S-o-bs everywhere if that's necessary.

Regards, Joonas

***

drm-intel-gt-next-2020-09-04-3:

UAPI Changes:
(- Potential implicit changes from WW locking refactoring)

Cross-subsystem Changes:
(- WW locking changes should align the i915 locking more with others)

Driver Changes:

- MAJOR: Apply WW locking across the driver (Maarten)

- Reverts for 5 commits to make applying WW locking faster (Maarten)
- Disable preparser around invalidations on Tigerlake for non-RCS engines (Chris)
- Add missing dma_fence_put() for error case of syncobj timeline (Chris)
- Parse command buffer earlier in eb_relocate(slow) to facilitate backoff (Maarten)
- Pin engine before pinning all objects (Maarten)
- Rework intel_context pinning to do everything outside of pin_mutex (Maarten)

- Avoid tracking GEM context until registered (Cc: stable, Chris)
- Provide a fastpath for waiting on vma bindings (Chris)
- Fixes to preempt-to-busy mechanism (Chris)
- Distinguish the virtual breadcrumbs from the irq breadcrumbs (Chris)
- Switch to object allocations for page directories (Chris)
- Hold context/request reference while breadcrumbs are active (Chris)
- Make sure execbuffer always passes ww state to i915_vma_pin (Maarten)

- Code refactoring to facilitate use of WW locking (Maarten)
- Locking refactoring to use more granular locking (Maarten, Chris)
- Support for multiple pinned timelines per engine (Chris)
- Move complication of I915_GEM_THROTTLE to the ioctl from general code (Chris)
- Make active tracking/vma page-directory stash work preallocated (Chris)
- Avoid flushing submission tasklet too often (Chris)
- Reduce context termination list iteration guard to RCU (Chris)
- Reductions to locking contention (Chris)
- Fixes for issues found by CI (Chris)

The following changes since commit 3393649977f9a8847c659e282ea290d4b703295c:

  Merge tag 'drm-intel-next-2020-08-24-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-08-28 14:09:31 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2020-09-04-3

for you to fetch changes up to 509c5c3f0a072962260299aeab106ce27df7bb07:

  drm/i915: Add ww locking to pin_to_display_plane, v2. (2020-09-03 15:35:28 +0300)

----------------------------------------------------------------
UAPI Changes:
(- Potential implicit changes from WW locking refactoring)

Cross-subsystem Changes:
(- WW locking changes should align the i915 locking more with others)

Driver Changes:

- MAJOR: Apply WW locking across the driver (Maarten)

- Reverts for 5 commits to make applying WW locking faster (Maarten)
- Disable preparser around invalidations on Tigerlake for non-RCS engines (Chris)
- Add missing dma_fence_put() for error case of syncobj timeline (Chris)
- Parse command buffer earlier in eb_relocate(slow) to facilitate backoff (Maarten)
- Pin engine before pinning all objects (Maarten)
- Rework intel_context pinning to do everything outside of pin_mutex (Maarten)

- Avoid tracking GEM context until registered (Cc: stable, Chris)
- Provide a fastpath for waiting on vma bindings (Chris)
- Fixes to preempt-to-busy mechanism (Chris)
- Distinguish the virtual breadcrumbs from the irq breadcrumbs (Chris)
- Switch to object allocations for page directories (Chris)
- Hold context/request reference while breadcrumbs are active (Chris)
- Make sure execbuffer always passes ww state to i915_vma_pin (Maarten)

- Code refactoring to facilitate use of WW locking (Maarten)
- Locking refactoring to use more granular locking (Maarten, Chris)
- Support for multiple pinned timelines per engine (Chris)
- Move complication of I915_GEM_THROTTLE to the ioctl from general code (Chris)
- Make active tracking/vma page-directory stash work preallocated (Chris)
- Avoid flushing submission tasklet too often (Chris)
- Reduce context termination list iteration guard to RCU (Chris)
- Reductions to locking contention (Chris)
- Fixes for issues found by CI (Chris)

----------------------------------------------------------------
Chris Wilson (30):
      drm/i915: Reduce i915_request.lock contention for i915_request_wait
      drm/i915/selftests: Mock the status_page.vma for the kernel_context
      drm/i915: Soften the tasklet flush frequency before waits
      drm/i915/gem: Remove disordered per-file request list for throttling
      drm/i915/gt: Disable preparser around xcs invalidations on tgl
      drm/i915/gt: Delay taking the spinlock for grabbing from the buffer pool
      drm/i915/selftests: Flush the active barriers before asserting
      drm/i915/gt: Fix termination condition for freeing all buffer objects
      drm/i915/gem: Delay tracking the GEM context until it is registered
      drm/i915/gt: Support multiple pinned timelines
      drm/i915/gt: Pull release of node->age under the spinlock
      drm/i915/selftests: Drop stale timeline constructor assert
      drm/i915: Skip taking acquire mutex for no ref->active callback
      drm/i915: Export a preallocate variant of i915_active_acquire()
      drm/i915: Keep the most recently used active-fence upon discard
      drm/i915: Make the stale cached active node available for any timeline
      drm/i915: Reduce locking around i915_active_acquire_preallocate_barrier()
      drm/i915: Provide a fastpath for waiting on vma bindings
      drm/i915: Remove requirement for holding i915_request.lock for breadcrumbs
      drm/i915/gt: Replace intel_engine_transfer_stale_breadcrumbs
      drm/i915/gt: Only transfer the virtual context to the new engine if active
      drm/i915/gt: Distinguish the virtual breadcrumbs from the irq breadcrumbs
      drm/i915: Preallocate stashes for vma page-directories
      drm/i915/gt: Switch to object allocations for page directories
      drm/i915/gt: Shrink i915_page_directory's slab bucket
      drm/i915/gt: Move intel_breadcrumbs_arm_irq earlier
      drm/i915/gt: Hold context/request reference while breadcrumbs are active
      drm/i915/selftests: Prevent selecting 0 for our random width/align
      drm/i915/gem: Reduce context termination list iteration guard to RCU
      drm/i915/gem: Free the fence after a fence-chain lookup failure

Maarten Lankhorst (23):
      Revert "drm/i915/gem: Async GPU relocations only"
      drm/i915: Revert relocation chaining commits.
      Revert "drm/i915/gem: Drop relocation slowpath".
      Revert "drm/i915/gem: Split eb_vma into its own allocation"
      drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.
      drm/i915: Remove locking from i915_gem_object_prepare_read/write
      drm/i915: Parse command buffer earlier in eb_relocate(slow)
      drm/i915: Use per object locking in execbuf, v12.
      drm/i915: Use ww locking in intel_renderstate.
      drm/i915: Add ww context handling to context_barrier_task
      drm/i915: Nuke arguments to eb_pin_engine
      drm/i915: Pin engine before pinning all objects, v5.
      drm/i915: Rework intel_context pinning to do everything outside of pin_mutex
      drm/i915: Make sure execbuffer always passes ww state to i915_vma_pin.
      drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as well, v2.
      drm/i915: Kill last user of intel_context_create_request outside of selftests
      drm/i915: Convert i915_perf to ww locking as well
      drm/i915: Dirty hack to fix selftests locking inversion
      drm/i915/selftests: Fix locking inversion in lrc selftest.
      drm/i915: Use ww pinning for intel_context_create_request()
      drm/i915: Move i915_vma_lock in the selftests to avoid lock inversion, v3.
      drm/i915: Add ww locking to vm_fault_gtt
      drm/i915: Add ww locking to pin_to_display_plane, v2.

 drivers/gpu/drm/i915/display/intel_display.c       |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |   89 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  105 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   80 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 1601 +++++++++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   51 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   40 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |  152 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h     |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   10 +
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |   67 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    9 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    2 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   50 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  144 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |   60 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   45 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c |    2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  106 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.h               |    5 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  181 +--
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  305 ++--
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h        |   36 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |   47 +
 drivers/gpu/drm/i915/gt/intel_context.c            |  309 ++--
 drivers/gpu/drm/i915/gt/intel_context.h            |   13 +
 drivers/gpu/drm/i915/gt/intel_context_types.h      |    5 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   20 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   34 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    3 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   31 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   97 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   23 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |  103 +-
 .../gpu/drm/i915/gt/intel_gt_buffer_pool_types.h   |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  300 +---
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  142 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  167 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |  150 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   73 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.h        |    9 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    1 +
 drivers/gpu/drm/i915/gt/intel_ring.c               |   10 +-
 drivers/gpu/drm/i915/gt/intel_ring.h               |    3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   42 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    1 +
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   28 +-
 drivers/gpu/drm/i915/gt/intel_timeline.h           |   24 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   43 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   30 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |    2 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   22 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   30 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   10 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    3 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   17 +-
 drivers/gpu/drm/i915/i915_active.c                 |  237 ++-
 drivers/gpu/drm/i915/i915_active.h                 |   31 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   24 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  107 +-
 drivers/gpu/drm/i915/i915_gem.h                    |   12 +
 drivers/gpu/drm/i915/i915_irq.c                    |    1 +
 drivers/gpu/drm/i915/i915_perf.c                   |   57 +-
 drivers/gpu/drm/i915/i915_request.c                |  132 +-
 drivers/gpu/drm/i915/i915_request.h                |    8 -
 drivers/gpu/drm/i915/i915_vma.c                    |   65 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   13 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   41 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   75 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |    4 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   18 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |    2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |    8 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |   26 +-
 81 files changed, 3654 insertions(+), 2169 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
