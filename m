Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81559F8F1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6142AB02DC;
	Wed, 24 Aug 2022 12:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA4CAFBDD;
 Wed, 24 Aug 2022 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661342499; x=1692878499;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=JPlLhfg5aq7bXkWn527eoc+8KxHvsf2jkSv+nTJgdJ8=;
 b=aPb67AvxIy3IGG7jpyq0K4X4FLUeOsS2utSLZrhNmKfR4zE0QlKWPlOH
 n++ONZB7tViT3xjt/UknF8QcQ8GyZDMzne7saRu+aGG365gNb9zXj0IL4
 rvbc7Hnrg+cgC1UPfKSKU6yHX9tgvKT6p2roINKcr+kW36IcUDVK1OgQw
 7PRx8nAyLKSZ2BpcBfSD0Z0sT6xr2zv7sEpIv3VTpep7RQLY51Y5cfcZg
 BzD57J7TGgHVbPNgjLKnus9/8+iwgKGq9fSq4SvqiAGBMyRJnX0RVadk+
 1lcVTgUyXE9BW6mqloVo40n+WjmHQ7DIzX6PkV82G+LJv4xLTD+ztiJEd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="292688605"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="292688605"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 05:01:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="678018880"
Received: from gaburges-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.12.186])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 05:01:17 -0700
Date: Wed, 24 Aug 2022 15:01:14 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YwYTCjA/Rhpd1n4A@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes the first drm-intel-gt-next PR towards 6.1. Quite a small one.

As primary things, there's the parallel support of GuC v69 and v70
which already went in via -fixes, improvements to the TLB invalidation
performance regressions, further DG2 enabling and improved debugging
for GuC errors.

On top of that, locking simplification for freeing objects to avoid
potential system freeze, addition of gt/gtN/.defaults (including freq
to start), silencing some messages that are not errors.

Regards, Joonas

PS. I left a few commits out from top of drm-intel-gt-next as there is fixup
needed for at least one. I will include those in the next PR.

***

drm-intel-gt-next-2022-08-24:

UAPI Changes:

- Create gt/gtN/.defaults/ for per gt sysfs defaults

  Create a gt/gtN/.defaults/ directory (similar to
  engine/<engine-name>/.defaults/) to expose default parameter values for
  each gt in sysfs. This allows userspace to restore default parameter values
  after they have changed.

Driver Changes:

- Support GuC v69 in parallel to v70 (Daniele)
- Improve TLB invalidation to limit performance regression (Chris, Mauro)
- Expose per-gt RPS defaults in sysfs (Ashutosh)
- Suppress OOM warning for shmemfs object allocation failure (Chris, Nirmoy)
- Disable PCI resize on 32-bit machines (Nirmoy)
- Update DG2 to GuC v70.4.1 (John)
- Fix CCS data copying on DG2 during swapping (Matt A)
- Add DG2 performance tuning setting recommended by spec (Matt R)
- Add GuC <-> kernel time stamp translation information to error logs (John)
- Record GuC CTB info in error logs (John)

- Route semaphores to GuC for Gen12+ when enabled (Michal Wi, John)
- Improve resilency to bug #3575: Handle reset timeouts under unrelated kernel hangs (Chris, Ashutosh)
- Avoid system freeze by removing shared locking on freeing objects (Chris, Nirmoy)
- Demote GuC error "No response for request" into debug when expected (Zhanjun)
- Fix GuC capture size warning and bump the size (John)
- Use streaming loads to speed up dumping the GuC log (Chris, John)
- Don't abort on CTB_UNUSED status from GuC (John)
- Don't send spurious policy update for GuC child contexts (Daniele)
- Don't leak the CCS state (Matt A)

- Prefer drm_err over pr_err (John)
- Eliminate unused calc_ctrl_surf_instr_size (Matt A)
- Add dedicated function for non-ctx register tuning settings (Matt R)
- Style and typo fixes, documentation improvements (Jason Wang, Mauro)
- Selftest improvements (Matt B, Rahul, John)

The following changes since commit 17cd10a44a8962860ff4ba351b2a290e752dbbde:

  drm/i915: Add lmem_bar_size modparam (2022-07-13 17:47:51 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-08-24

for you to fetch changes up to 5ece208ab05e4042c80ed1e6fe6d7ce236eee89b:

  drm/i915/guc: Use streaming loads to speed up dumping the guc log (2022-08-17 10:07:03 -0700)

----------------------------------------------------------------
UAPI Changes:

- Create gt/gtN/.defaults/ for per gt sysfs defaults

  Create a gt/gtN/.defaults/ directory (similar to
  engine/<engine-name>/.defaults/) to expose default parameter values for
  each gt in sysfs. This allows userspace to restore default parameter values
  after they have changed.

Driver Changes:

- Support GuC v69 in parallel to v70 (Daniele)
- Improve TLB invalidation to limit performance regression (Chris, Mauro)
- Expose per-gt RPS defaults in sysfs (Ashutosh)
- Suppress OOM warning for shmemfs object allocation failure (Chris, Nirmoy)
- Disable PCI resize on 32-bit machines (Nirmoy)
- Update DG2 to GuC v70.4.1 (John)
- Fix CCS data copying on DG2 during swapping (Matt A)
- Add DG2 performance tuning setting recommended by spec (Matt R)
- Add GuC <-> kernel time stamp translation information to error logs (John)
- Record GuC CTB info in error logs (John)

- Route semaphores to GuC for Gen12+ when enabled (Michal Wi, John)
- Improve resilency to bug #3575: Handle reset timeouts under unrelated kernel hangs (Chris, Ashutosh)
- Avoid system freeze by removing shared locking on freeing objects (Chris, Nirmoy)
- Demote GuC error "No response for request" into debug when expected (Zhanjun)
- Fix GuC capture size warning and bump the size (John)
- Use streaming loads to speed up dumping the GuC log (Chris, John)
- Don't abort on CTB_UNUSED status from GuC (John)
- Don't send spurious policy update for GuC child contexts (Daniele)
- Don't leak the CCS state (Matt A)

- Prefer drm_err over pr_err (John)
- Eliminate unused calc_ctrl_surf_instr_size (Matt A)
- Add dedicated function for non-ctx register tuning settings (Matt R)
- Style and typo fixes, documentation improvements (Jason Wang, Mauro)
- Selftest improvements (Matt B, Rahul, John)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/guc: Add a helper for log buffer size

Ashutosh Dixit (2):
      drm/i915/gt: Create gt/gtN/.defaults/ for per gt sysfs defaults
      drm/i915/gt: Expose per-gt RPS defaults in sysfs

Chris Wilson (8):
      drm/i915/reset: Handle reset timeouts under unrelated kernel hangs
      drm/i915: Suppress oom warning for shmemfs object allocation failure
      drm/i915/gt: Ignore TLB invalidations on idle engines
      drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
      drm/i915/gt: Skip TLB invalidations once wedged
      drm/i915/gt: Batch TLB invalidations
      drm/i915/gem: Remove shared locking on freeing objects
      drm/i915/guc: Use streaming loads to speed up dumping the guc log

Daniele Ceraolo Spurio (2):
      drm/i915/guc: support v69 in parallel to v70
      drm/i915/guc: Don't send policy update for child contexts.

Harish Chegondi (1):
      drm/i915/dg2: Add Wa_1509727124

Jason Wang (2):
      drm/i915/gt: Remove unneeded semicolon
      drm/i915/selftests: Fix comment typo

John Harrison (7):
      drm/i915/guc: Don't use pr_err when not necessary
      drm/i915/selftest: Cope with not having an RCS engine
      drm/i915/guc: Don't abort on CTB_UNUSED status
      drm/i915/dg2: Update DG2 to GuC v70.4.1
      drm/i915/guc: Fix capture size warning and bump the size
      drm/i915/guc: Add GuC <-> kernel time stamp translation information
      drm/i915/guc: Record CTB info in error logs

Matt Roper (2):
      drm/i915/gt: Add dedicated function for non-ctx register tuning settings
      drm/i915/dg2: Add additional tuning settings

Matthew Auld (3):
      drm/i915/ttm: don't leak the ccs state
      drm/i915/ttm: remove calc_ctrl_surf_instr_size
      drm/i915/ttm: fix CCS handling

Matthew Brost (2):
      drm/i915/guc: Fix issues with live_preempt_cancel
      drm/i915/guc: Support larger contexts on newer hardware

Mauro Carvalho Chehab (3):
      drm/i915/gt: document with_intel_gt_pm_if_awake()
      drm/i915/gt: describe the new tlb parameter at i915_vma_resource
      drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb()

Michał Winiarski (1):
      drm/i915/guc: Route semaphores to GuC for Gen12+

Nirmoy Das (1):
      drm/i915: disable pci resize on 32-bit machine

Rahul Kumar Singh (1):
      drm/i915/guc: Add selftest for a hung GuC

Zhanjun Dong (1):
      drm/i915/guc: Check for ct enabled while waiting for response

 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  25 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |  11 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  77 +++-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |  11 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  11 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |   6 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  34 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  27 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            | 104 +++---
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   8 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   4 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |   6 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  76 ++--
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  12 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   3 +
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  19 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |  40 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  45 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  45 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  79 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 393 ++++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  68 +++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   7 +
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |  37 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    | 159 +++++++++
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |  10 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  67 +++-
 drivers/gpu/drm/i915/i915_gpu_error.h              |  21 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  33 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   1 +
 drivers/gpu/drm/i915/i915_vma_resource.c           |   9 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |   6 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |   1 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |   2 +-
 49 files changed, 1227 insertions(+), 345 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
