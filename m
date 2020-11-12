Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230852B0A10
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 17:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F66C6E24E;
	Thu, 12 Nov 2020 16:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC636E10B;
 Thu, 12 Nov 2020 16:34:26 +0000 (UTC)
IronPort-SDR: WCBBHYk1d7izAgir4eDyN+Ch9H8vaYv7+VRrjfmd+N1m3fmWQ6QP2VHEb5WeMNuVGiAAwSqhBw
 QwZxxgnHSTUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170444548"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="170444548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:34:15 -0800
IronPort-SDR: Cis5zq8kCrHwAXWnwuIyPtV3aN4FaqQgnRvci5dVTPzkNNaaXXghKkDMAHAa9qVgAQGH+w/M/w
 OIiNJBMtB0Ag==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="474336266"
Received: from jwhela5-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.3.2])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:34:10 -0800
Date: Thu, 12 Nov 2020 18:34:07 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <20201112163407.GA20320@jlahtine-mobl.ger.corp.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes the drm-intel-gt-next PR for 5.11.

Most importantly there is a healthy chunk of Tigerlake
related fixes and a fix for user reported issue #2381 where
graphics output would stop at "switching to inteldrmfb from
simple".

Fixes to DMA mapped sg usage in i915 to unblock intel iommu
rework. Fixes to previously introduced WW mutex rework.

We're enabling eLLC for displayable buffers on SKL+. Plenty
of fixes to driver unbind/bind cycle. The GuC firmware
version is being updated (that just loads HuC for now).

The usual amount of fixes for CI found corner cases.

Expect a few conflicts with drm-intel-next (resolved in rerere)
as the platform enabling ones go there. I'll backmerge drm-next
once you've accepted this to pull all the changes to gt-next.

The -next-fixes and -fixes would come from Jani after this is
accepted, too.

Regards, Joonas

***

drm-intel-gt-next-2020-11-12-1:

Cross-subsystem Changes:
- DMA mapped scatterlist fixes in i915 to unblock merging of
  https://lkml.org/lkml/2020/9/27/70 (Tvrtko, Tom)

Driver Changes:

- Fix for user reported issue #2381 (Graphical output stops with "switching=
 to inteldrmfb from simple"):
  Mark ininitial fb obj as WT on eLLC machines to avoid rcu lockup during f=
bdev init (Ville, Chris)
- Fix for Tigerlake (and earlier) to avoid spurious empty CSB events leadin=
g to hang (Chris, Bruce)
- Delay execlist processing for Tigerlake to avoid hang (Chris)
- Fix for Tigerlake RCS engine health check through heartbeat (Chris)
- Fix for Tigerlake reserved MOCS entries (Ayaz, Chris)
- Fix Media power gate sequence on Tigerlake (Rodrigo)
- Enable eLLC caching of display buffers for SKL+ (Ville)
- Support parsing of oversize batches on Gen9 (Matt, Chris)
- Exclude low pages (128KiB) of stolen from use to avoid thrashing during r=
eset (Chris)
- Flush engines before Tigerlake breadcrumbs (Chris)

- Use the local HWSP offset during submission (Chris)
- Flush coherency domains on first set-domain-ioctl (Chris, Zbigniew)
- Use the active reference on the vma while capturing to avoid use-after-fr=
ee (Chris)
- Fix MOCS PTE setting for gen9+ (Ville)
- Avoid NULL dereference on IPS driver callback while unbinding i915 (Chris)
- Avoid NULL dereference from PT/PD stash allocation error (Matt)
- Hold request reference for canceling an active context (Chris)
- Avoid infinite loop on x86-32 when mapping a lot of objects (Chris)
- Disallow WC mappings when processor doesn't support them (Chris)
- Return correct error in i915_gem_object_copy_blt() error path (Dan)
- Return correct error in intel_context_create_request() error path (Maarte=
n)
- Tune down GuC communication enabled/disabled messages to debug (Jani)
- Fix rebased commit "Remove i915_request.lock requirement for execution ca=
llbacks" (Chris)
- Cancel outstanding work after disabling heartbeats on an engine (Chris)
- Signal cancelled requests (Chris)
- Retire cancelled requests on unload (Chris)
- Scrub HW state on driver remove (Chris)
- Undo forced context restores after trivial preemptions (Chris)
- Handle PCI unbind in PMU code (Tvrtko)
- Fix CPU hotplug with multiple GPUs in PMU code (Trtkko)
- Correctly set SFC capability for video engines (Venkata)

- Update GuC code to use firmware v49.0.1 (John, Matthew B., Daniele, Oscar=
, Michel, Rodrigo, Michal)
- Improve GuC warnings on loading failure (John)
- Avoid ownership race in buffer pool by clearing age (Chris)
- Use MMIO to read CSB in case of failure (Chris, Mika)
- Show engine properties in engine state dump to indicate changes (Chris, J=
oonas)
- Break up error capture compression loops with cond_resched() (Chris)
- Reduce GPU error capture mutex hold time to avoid khungtaskd (Chris)
- Serialise debugfs i915_gem_objects with ctx->mutex (Chris)
- Always test execution status on closing the context and close if not pers=
istent (Chris)
- Avoid mixing integer types during batch copies (Chris, Jared)
- Skip over MI_NOOP when parsing to avoid overhead (Chris)
- Hold onto an explicit ref to i915_vma_work.pinned (Chris)
- Perform all asynchronous waits prior to marking payload start (Chris)
- Pull phys pread/pwrite implementations to the backend (Matt)

- Improve record of hung engines in error state (Tvrtko)
- Allow backends to override pread implementation (Matt)
- Reinforce LRC poisoning checks to confirm context survives execution (Chr=
is)
- Fix memory region max size calculation (Matt)
- Fix order when adding blocks to memory region (Matt)
- Eliminate unused intel_virtual_engine_get_sibling func (Chris)
- Cleanup kasan warning for on-stack (unsigned long) casting (Chris)
- Onion unwind for scratch page allocation failure (Chris)
- Poison stolen pages before use (Chris)
- Selftest improvements (Chris)
The following changes since commit e0ee152fce25dc9269c7ea5280c98aa4b3682759:

  drm/i915: Unlock the shared hwsp_gtt object after pinning (2020-09-07 15:=
08:11 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2020-1=
1-12-1

for you to fetch changes up to 695dc55b573985569259e18f8e6261a77924342b:

  drm/i915/tgl: Fix Media power gate sequence. (2020-11-11 15:07:10 +0000)

----------------------------------------------------------------
Cross-subsystem Changes:
- DMA mapped scatterlist fixes in i915 to unblock merging of
  https://lkml.org/lkml/2020/9/27/70 (Tvrtko, Tom)

Driver Changes:

- Fix for user reported issue #2381 (Graphical output stops with "switching=
 to inteldrmfb from simple"):
  Mark ininitial fb obj as WT on eLLC machines to avoid rcu lockup during f=
bdev init (Ville, Chris)
- Fix for Tigerlake (and earlier) to avoid spurious empty CSB events leadin=
g to hang (Chris, Bruce)
- Delay execlist processing for Tigerlake to avoid hang (Chris)
- Fix for Tigerlake RCS engine health check through heartbeat (Chris)
- Fix for Tigerlake reserved MOCS entries (Ayaz, Chris)
- Fix Media power gate sequence on Tigerlake (Rodrigo)
- Enable eLLC caching of display buffers for SKL+ (Ville)
- Support parsing of oversize batches on Gen9 (Matt, Chris)
- Exclude low pages (128KiB) of stolen from use to avoid thrashing during r=
eset (Chris)
- Flush engines before Tigerlake breadcrumbs (Chris)

- Use the local HWSP offset during submission (Chris)
- Flush coherency domains on first set-domain-ioctl (Chris, Zbigniew)
- Use the active reference on the vma while capturing to avoid use-after-fr=
ee (Chris)
- Fix MOCS PTE setting for gen9+ (Ville)
- Avoid NULL dereference on IPS driver callback while unbinding i915 (Chris)
- Avoid NULL dereference from PT/PD stash allocation error (Matt)
- Hold request reference for canceling an active context (Chris)
- Avoid infinite loop on x86-32 when mapping a lot of objects (Chris)
- Disallow WC mappings when processor doesn't support them (Chris)
- Return correct error in i915_gem_object_copy_blt() error path (Dan)
- Return correct error in intel_context_create_request() error path (Maarte=
n)
- Tune down GuC communication enabled/disabled messages to debug (Jani)
- Fix rebased commit "Remove i915_request.lock requirement for execution ca=
llbacks" (Chris)
- Cancel outstanding work after disabling heartbeats on an engine (Chris)
- Signal cancelled requests (Chris)
- Retire cancelled requests on unload (Chris)
- Scrub HW state on driver remove (Chris)
- Undo forced context restores after trivial preemptions (Chris)
- Handle PCI unbind in PMU code (Tvrtko)
- Fix CPU hotplug with multiple GPUs in PMU code (Trtkko)
- Correctly set SFC capability for video engines (Venkata)

- Update GuC code to use firmware v49.0.1 (John, Matthew B., Daniele, Oscar=
, Michel, Rodrigo, Michal)
- Improve GuC warnings on loading failure (John)
- Avoid ownership race in buffer pool by clearing age (Chris)
- Use MMIO to read CSB in case of failure (Chris, Mika)
- Show engine properties in engine state dump to indicate changes (Chris, J=
oonas)
- Break up error capture compression loops with cond_resched() (Chris)
- Reduce GPU error capture mutex hold time to avoid khungtaskd (Chris)
- Serialise debugfs i915_gem_objects with ctx->mutex (Chris)
- Always test execution status on closing the context and close if not pers=
istent (Chris)
- Avoid mixing integer types during batch copies (Chris, Jared)
- Skip over MI_NOOP when parsing to avoid overhead (Chris)
- Hold onto an explicit ref to i915_vma_work.pinned (Chris)
- Perform all asynchronous waits prior to marking payload start (Chris)
- Pull phys pread/pwrite implementations to the backend (Matt)

- Improve record of hung engines in error state (Tvrtko)
- Allow backends to override pread implementation (Matt)
- Reinforce LRC poisoning checks to confirm context survives execution (Chr=
is)
- Fix memory region max size calculation (Matt)
- Fix order when adding blocks to memory region (Matt)
- Eliminate unused intel_virtual_engine_get_sibling func (Chris)
- Cleanup kasan warning for on-stack (unsigned long) casting (Chris)
- Onion unwind for scratch page allocation failure (Chris)
- Poison stolen pages before use (Chris)
- Selftest improvements (Chris)

----------------------------------------------------------------
Ayaz A Siddiqui (1):
      drm/i915/gt: Initialize reserved and unspecified MOCS indices

Chris Wilson (46):
      drm/i915/gem: Avoid implicit vmap for highmem on x86-32
      drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not suppo=
rted
      drm/i915/gt: Clear the buffer pool age before use
      drm/i915/gt: Check for a registered driver with IPS
      drm/i915/gt: Widen CSB pointer to u64 for the parsers
      drm/i915/gt: Wait for CSB entries on Tigerlake
      drm/i915/gt: Apply the CSB w/a for all
      drm/i915/gt: Use a mmio read of the CSB in case of failure
      drm/i915/gt: Show engine properties in the pretty printer
      drm/i915: Break up error capture compression loops with cond_resched()
      drm/i915: Reduce GPU error capture mutex hold time
      drm/i915/gt: Remove defunct intel_virtual_engine_get_sibling()
      drm/i915/gem: Serialise debugfs i915_gem_objects with ctx->mutex
      drm/i915: Redo "Remove i915_request.lock requirement for execution ca=
llbacks"
      drm/i915/gem: Hold request reference for canceling an active context
      drm/i915: Cancel outstanding work after disabling heartbeats on an en=
gine
      drm/i915/gt: Always send a pulse down the engine after disabling hear=
tbeat
      drm/i915/gem: Always test execution status on closing the context
      drm/i915: Avoid mixing integer types during batch copies
      drm/i915/gt: Signal cancelled requests
      drm/i915/selftests: Finish pending mock requests on cancellation.
      drm/i915/gt: Retire cancelled requests on unload
      drm/i915: Skip over MI_NOOP when parsing
      drm/i915/gt: Scrub HW state on remove
      drm/i915/gt: Track the most recent pulse for the heartbeat
      drm/i915/gt: Fixup tgl mocs for PTE tracking
      drm/i915/gem: Support parsing of oversize batches
      drm/i915/gt: Delay execlist processing for tgl
      drm/i915/gt: Undo forced context restores after trivial preemptions
      drm/i915/gt: Cleanup kasan warning for on-stack (unsigned long) casti=
ng
      drm/i915/gt: Confirm the context survives execution
      drm/i915: Use the active reference on the vma while capturing
      drm/i915/gt: Onion unwind for scratch page allocation failure
      drm/i915/gem: Poison stolen pages before use
      drm/i915: Exclude low pages (128KiB) of stolen from use
      drm/i915/selftests: Flush the old heartbeat more gently
      drm/i915/gem: Flush coherency domains on first set-domain-ioctl
      drm/i915/selftests: Skip RPS tests on Ironlake (only IPS)
      drm/i915/gt: Use the local HWSP offset during submission
      drm/i915/selftests: Exercise intel_timeline_read_hwsp()
      drm/i915/gem: Avoid synchronous binds deep within locks
      drm/i915/gt: Expose more parameters for emitting writes into the ring
      drm/i915/gt: Flush xcs before tgl breadcrumbs
      drm/i915: Hold onto an explicit ref to i915_vma_work.pinned
      drm/i915/gem: Perform all asynchronous waits prior to marking payload=
 start
      drm/i915/gem: Pull phys pread/pwrite implementations to the backend

Dan Carpenter (1):
      drm/i915: Fix an error code i915_gem_object_copy_blt()

Jani Nikula (1):
      drm/i915/uc: tune down GuC communication enabled/disabled messages

John Harrison (3):
      drm/i915/guc: Update to use firmware v49.0.1
      drm/i915/guc: Improved reporting when GuC fails to load
      drm/i915/guc: Clear pointers on free

Maarten Lankhorst (1):
      drm/i915: Fix uninitialised variable in intel_context_create_request.

Matthew Auld (4):
      drm/i915: check i915_vm_alloc_pt_stash for errors
      drm/i915/region: fix max size calculation
      drm/i915/gem: Allow backends to override pread implementation
      drm/i915/region: fix order when adding blocks

Rodrigo Vivi (1):
      drm/i915/tgl: Fix Media power gate sequence.

Tvrtko Ursulin (6):
      drm/i915: Fix DMA mapped scatterlist walks
      drm/i915: Fix DMA mapped scatterlist lookup
      drm/i915/pmu: Handle PCI unbind
      drm/i915/pmu: Fix CPU hotplug with multiple GPUs
      drm/i915: Improve record of hung engines in error state
      drm/i915: Use ABI engine class in error state ecode

Venkata Sandeep Dhanalakota (1):
      drm/i915: Correctly set SFC capability for video engines

Ville Syrj=E4l=E4 (3):
      drm/i915: Mark ininitial fb obj as WT on eLLC machines to avoid rcu l=
ockup during fbdev init
      drm/i915: Fix MOCS PTE setting for gen9+
      drm/i915: Enable eLLC caching of display buffers for SKL+

 drivers/gpu/drm/i915/Kconfig.debug                 |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |   8 +
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  73 ++--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  28 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  51 ++-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |  55 +++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  54 ++-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   2 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  24 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  20 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   1 +
 drivers/gpu/drm/i915/gt/intel_engine.h             |  64 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  42 ++-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   | 112 +++---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  37 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  11 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |   2 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  10 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 162 ++++++---
 drivers/gpu/drm/i915/gt/intel_lrc.h                |   4 -
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h            |   3 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  21 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  22 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   4 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   1 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |  18 +-
 drivers/gpu/drm/i915/gt/intel_timeline_types.h     |   2 +
 drivers/gpu/drm/i915/gt/mock_engine.c              |  29 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |  13 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           | 196 +++++++++++
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   8 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        | 378 +++++++++++++++++=
+++-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  18 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         | 132 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  31 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  80 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  27 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |   6 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |  77 +++--
 drivers/gpu/drm/i915/i915_debugfs.c                |   4 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   7 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  32 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  74 ++--
 drivers/gpu/drm/i915/i915_gpu_error.h              |  10 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   7 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  96 ++++--
 drivers/gpu/drm/i915/i915_pmu.h                    |  10 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  12 +-
 drivers/gpu/drm/i915/i915_request.c                |  17 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |  17 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  14 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   4 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  13 -
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  77 +++++
 drivers/gpu/drm/i915/selftests/mock_region.c       |   2 +-
 70 files changed, 1759 insertions(+), 576 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
