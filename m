Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 607571D25A6
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 06:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261B96E2D1;
	Thu, 14 May 2020 04:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8CC6E183;
 Thu, 14 May 2020 04:03:49 +0000 (UTC)
IronPort-SDR: xAUMcoz4q8oBfpDANBGPexGNGe+pMPIhlJBUwT73N83FS1oBcbJDrKDmst2V3xYULr5xYcKgs6
 eYHyDA+kS4rg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 21:03:49 -0700
IronPort-SDR: xJyHCJG91/nEkMmDgkkzTJUze5Ckgtjh45Du9FKANLJiecYVNOYPnN7p3xnhJbNKndNXoBiOQN
 7hI+sLFV9IZA==
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="251964537"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 21:03:48 -0700
Date: Wed, 13 May 2020 21:02:35 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200514040235.GA2164266@intel.com>
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

Hi Dave and Daniel,

This one looks big, but it actually includes the one I had
sent last week, but probably too late on Thursday. Sorry.

There are various fixes acummulated here around preemption,
timeslices, fences and vma unbind, mostly for GPU hangs,
and deadlocks. There's also Some display workaroudns and fixes,
including frame buffer compression fix, and a fix for DP AUX
on Tiger Lake.

This also  includes GVT with fix for arecent guest display probe
failure, and a fix for a kernel oops for older aliasing ppgtt guest.

Here goes drm-intel-fixes-2020-05-13-1:
- Handle idling during i915_gem_evict_something busy loops (Chris)
- Mark current submissions with a weak-dependency (Chris)
- Propagate errror from completed fences (Chris)
- Fixes on execlist to avoid GPU hang situation (Chris)
- Fixes couple deadlocks (Chris)
- Timeslice preemption fixes (Chris)
- Fix Display Port interrupt handling on Tiger Lake (Imre)
- Reduce debug noise around Frame Buffer Compression
+(Peter)
- Fix logic around IPC W/a for Coffee Lake and Kaby Lake
+(Sultan)
- Avoid dereferencing a dead context (Chris)

Thanks,
Rodrigo.

The following changes since commit 8598eb781cf68fd6cb67c479f1479ae58bd54fb9:

  drm/i915: Use proper fault mask in interrupt postinstall too (2020-04-28 16:38:03 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-05-13-1

for you to fetch changes up to 955da9d77435acac066139e9d7f7723ce7204a1d:

  drm/i915: Handle idling during i915_gem_evict_something busy loops (2020-05-13 14:39:41 -0700)

----------------------------------------------------------------
- Handle idling during i915_gem_evict_something busy loops (Chris)
- Mark current submissions with a weak-dependency (Chris)
- Propagate errror from completed fences (Chris)
- Fixes on execlist to avoid GPU hang situation (Chris)
- Fixes couple deadlocks (Chris)
- Timeslice preemption fixes (Chris)
- Fix Display Port interrupt handling on Tiger Lake (Imre)
- Reduce debug noise around Frame Buffer Compression
+(Peter)
- Fix logic around IPC W/a for Coffee Lake and Kaby Lake
+(Sultan)
- Avoid dereferencing a dead context (Chris)

----------------------------------------------------------------
Chris Wilson (10):
      drm/i915: Avoid dereferencing a dead context
      drm/i915/gt: Make timeslicing an explicit engine property
      drm/i915: Check current i915_vma.pin_count status first on unbind
      drm/i915/gt: Yield the timeslice if caught waiting on a user semaphore
      drm/i915/gem: Remove object_is_locked assertion from unpin_from_display_plane
      drm/i915/execlists: Avoid reusing the same logical CCID
      drm/i915/execlists: Track inflight CCID
      drm/i915: Propagate error from completed fences
      drm/i915: Mark concurrent submissions with a weak-dependency
      drm/i915: Handle idling during i915_gem_evict_something busy loops

Colin Xu (1):
      drm/i915/gvt: Init DPLL/DDI vreg for virtual display instead of inheritance.

Imre Deak (1):
      drm/i915/tgl+: Fix interrupt handling for DP AUX transactions

Peter Jones (1):
      Make the "Reducing compressed framebufer size" message be DRM_INFO_ONCE()

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2020-05-12' of https://github.com/intel/gvt-linux into drm-intel-fixes

Sultan Alsawaf (1):
      drm/i915: Don't enable WaIncreaseLatencyIPCEnabled when IPC is disabled

Zhenyu Wang (1):
      drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest

 drivers/gpu/drm/i915/display/intel_fbc.c          |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c        |   7 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h     |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine.h            |   9 --
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |   6 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h      |  35 +++++--
 drivers/gpu/drm/i915/gt/intel_gt_irq.c            |  15 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c               | 120 +++++++++++++++-------
 drivers/gpu/drm/i915/gt/selftest_lrc.c            |  34 +++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |   2 +-
 drivers/gpu/drm/i915/gvt/display.c                |  49 ++++++++-
 drivers/gpu/drm/i915/gvt/scheduler.c              |  10 +-
 drivers/gpu/drm/i915/i915_gem_evict.c             |  26 +++--
 drivers/gpu/drm/i915/i915_gpu_error.c             |  12 ++-
 drivers/gpu/drm/i915/i915_irq.c                   |  16 +--
 drivers/gpu/drm/i915/i915_perf.c                  |   6 +-
 drivers/gpu/drm/i915/i915_reg.h                   |   1 +
 drivers/gpu/drm/i915/i915_request.c               |  12 ++-
 drivers/gpu/drm/i915/i915_scheduler.c             |   6 +-
 drivers/gpu/drm/i915/i915_scheduler.h             |   3 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h       |   1 +
 drivers/gpu/drm/i915/i915_vma.c                   |  25 ++---
 drivers/gpu/drm/i915/intel_pm.c                   |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c         |   2 +-
 24 files changed, 259 insertions(+), 151 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
