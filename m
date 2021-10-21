Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFD43625E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEC26EC51;
	Thu, 21 Oct 2021 13:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AEE6EC51;
 Thu, 21 Oct 2021 13:08:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="228976049"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="228976049"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 06:08:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="527481406"
Received: from amcewan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.254.142])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 06:07:59 -0700
Date: Thu, 21 Oct 2021 16:07:56 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <YXFmLKoq8Fg9JxSd@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave & Daniel,

Here comes the final feature PR for 5.16.

As the biggest thing it adds multi-LRC (parallel) submission
implementation for GuC and a simplified parallel submission uAPI
to go with that (only works with GuC for now). It is has a similar
mission to the bonded submission uAPI, take a look at the kerneldocs
for full detail.

Then there are some improvements to making sure old pages are flushed from
caches before making them available to userspaces. Those extra flushes may
be visible in corner case scenarios if application is frequently importing
new dmabufs on non-LLC hardware. The better approach would anyway be to
recycle a pool of dmabufs than destroy and recreate.

In addition to that, it's only minor changes with mainly developer
impact and those can be seen in shortlog.

Regards, Joonas

PS. There has been request to backmerge drm-next after you merge this
    PR, to bring in dma-resv iterators. I'll do that.

PPS. Will send out the dim patches for the "for-linux-next-gt" branch
     updating to make sure we avoid the future conflicts.

***

drm-intel-gt-next-2021-10-21:

UAPI Changes:

- Expose multi-LRC submission interface

  Similar to the bonded submission interface but simplified.
  Comes with GuC only implementation for now. See kerneldoc
  for more details.

  Userspace changes: https://github.com/intel/media-driver/pull/1252

- Expose logical engine instance to user

  Needed by the multi-LRC submission interface for GuC

  Userspace changes: https://github.com/intel/media-driver/pull/1252

Driver Changes:

- Fix blank screen booting crashes when CONFIG_CC_OPTIMIZE_FOR_SIZE=y (Hugh)
- Add support for multi-LRC submission in the GuC backend (Matt B)
- Add extra cache flushing before making pages userspace visible (Matt A, Thomas)
- Mark internal GPU object pages dirty so they will be flushed properly (Matt A)

- Move remaining debugfs interfaces i915_wedged/i915_forcewake_user into gt (Andi)
- Replace the unconditional clflushes with drm_clflush_virt_range() (Ville)
- Remove IS_ACTIVE macro completely (Lucas)
- Improve kerneldocs for cache_dirty (Matt A)

- Add missing includes (Lucas)
- Selftest improvements (Matt R, Ran, Matt A)

The following changes since commit 1a839e016e4964b5c8384e5d82e5e5ac02a23f52:

  drm/i915: remove IS_ACTIVE (2021-10-07 11:04:05 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-10-21

for you to fetch changes up to ab5d964c001b9efffcbfa4d67a30186b67d79771:

  drm/i915/selftests: mark up hugepages object with start_cpu_write (2021-10-20 16:50:42 +0100)

----------------------------------------------------------------
UAPI Changes:

- Expose multi-LRC submission interface

  Similar to the bonded submission interface but simplified.
  Comes with GuC only implementation for now. See kerneldoc
  for more details.

  Userspace changes: https://github.com/intel/media-driver/pull/1252

- Expose logical engine instance to user

  Needed by the multi-LRC submission interface for GuC

  Userspace changes: https://github.com/intel/media-driver/pull/1252

Driver Changes:

- Fix blank screen booting crashes when CONFIG_CC_OPTIMIZE_FOR_SIZE=y (Hugh)
- Add support for multi-LRC submission in the GuC backend (Matt B)
- Add extra cache flushing before making pages userspace visible (Matt A, Thomas)
- Mark internal GPU object pages dirty so they will be flushed properly (Matt A)

- Move remaining debugfs interfaces i915_wedged/i915_forcewake_user into gt (Andi)
- Replace the unconditional clflushes with drm_clflush_virt_range() (Ville)
- Remove IS_ACTIVE macro completely (Lucas)
- Improve kerneldocs for cache_dirty (Matt A)

- Add missing includes (Lucas)
- Selftest improvements (Matt R, Ran, Matt A)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: move remaining debugfs interfaces into gt

Hugh Dickins (1):
      drm/i915: fix blank screen booting crashes

Lucas De Marchi (2):
      drm/i915/gt: include tsc.h where used
      drm/i915/gt: add asm/cacheflush.h for use of clflush()

Matt Roper (1):
      drm/i915: Stop using I915_TILING_* in client blit selftest

Matthew Auld (9):
      drm/i915: mark dmabuf objects as ALLOC_USER
      drm/i915: mark userptr objects as ALLOC_USER
      drm/i915: extract bypass-llc check into helper
      drm/i915/dmabuf: add paranoid flush-on-acquire
      drm/i915/userptr: add paranoid flush-on-acquire
      drm/i915/shmem: ensure flush during swap-in on non-LLC
      drm/i915: expand on the kernel-doc for cache_dirty
      drm/i915: mark up internal objects with start_cpu_write
      drm/i915/selftests: mark up hugepages object with start_cpu_write

Matthew Brost (24):
      drm/i915/guc: Move GuC guc_id allocation under submission state sub-struct
      drm/i915/guc: Take GT PM ref when deregistering context
      drm/i915/guc: Take engine PM when a context is pinned with GuC submission
      drm/i915/guc: Don't call switch_to_kernel_context with GuC submission
      drm/i915: Add logical engine mapping
      drm/i915: Expose logical engine instance to user
      drm/i915/guc: Introduce context parent-child relationship
      drm/i915/guc: Add multi-lrc context registration
      drm/i915/guc: Ensure GuC schedule operations do not operate on child contexts
      drm/i915/guc: Assign contexts in parent-child relationship consecutive guc_ids
      drm/i915/guc: Implement parallel context pin / unpin functions
      drm/i915/guc: Implement multi-lrc submission
      drm/i915/guc: Insert submit fences between requests in parent-child relationship
      drm/i915/guc: Implement multi-lrc reset
      drm/i915/guc: Update debugfs for GuC multi-lrc
      drm/i915/guc: Connect UAPI to GuC multi-lrc interface
      drm/i915/doc: Update parallel submit doc to point to i915_drm.h
      drm/i915/guc: Add basic GuC multi-lrc selftest
      drm/i915/guc: Implement no mid batch preemption for multi-lrc
      drm/i915: Multi-BB execbuf
      drm/i915/guc: Handle errors in multi-lrc requests
      drm/i915: Make request conflict tracking understand parallel submits
      drm/i915: Update I915_GEM_BUSY IOCTL to understand composite fences
      drm/i915: Enable multi-bb execbuf

Ran Jianping (1):
      drm/i915/selftests: remove duplicate include in mock_region.c

Ville Syrjälä (3):
      drm/i915: Replace the unconditional clflush with drm_clflush_virt_range()
      drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
      drm/i915: Catch yet another unconditioal clflush

 Documentation/gpu/rfc/i915_parallel_execbuf.h      |  122 --
 Documentation/gpu/rfc/i915_scheduler.rst           |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |   57 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  227 ++-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |   16 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    9 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  797 +++++++----
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   26 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   27 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   29 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    8 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    7 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   29 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   52 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   56 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   73 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   66 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   13 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |   37 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    7 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    7 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   55 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h         |    4 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |   14 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   41 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      |    4 +
 drivers/gpu/drm/i915/gt/intel_llc.c                |    1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    5 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |    4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   12 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   29 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   54 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   24 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |   34 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 1446 +++++++++++++++++---
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |  179 +++
 drivers/gpu/drm/i915/i915_debugfs.c                |   43 +-
 drivers/gpu/drm/i915/i915_query.c                  |    2 +
 drivers/gpu/drm/i915/i915_request.c                |  143 +-
 drivers/gpu/drm/i915/i915_request.h                |   23 +
 drivers/gpu/drm/i915/i915_vma.c                    |   21 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   13 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   12 +
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |    1 +
 drivers/gpu/drm/i915/selftests/mock_region.c       |    2 -
 include/uapi/drm/i915_drm.h                        |  139 +-
 52 files changed, 3231 insertions(+), 764 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
