Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3231CA29C
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 07:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34096E892;
	Fri,  8 May 2020 05:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA536E892;
 Fri,  8 May 2020 05:25:40 +0000 (UTC)
IronPort-SDR: LQts2E9hJuFyKsaR7cZZsztMA/E3qvC4jX2R3itvB40nYmBmhaIz/WS74fjvyrHMRas7vjdopF
 ku3P+aHSb7pA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 22:25:39 -0700
IronPort-SDR: LwQzoQnhkqpUZ0AWHuz0uiEOZPR05ed4ANCO6vlM5nGio05PsMKkS5pKmbJoQguvy9yOIt6hUn
 USiiaD1UfXgg==
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="435559079"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 22:25:38 -0700
Date: Thu, 7 May 2020 22:24:37 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200508052437.GA3212215@intel.com>
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

Here goes drm-intel-fixes-2020-05-07:

- Fixes on execlist to avoid GPU hang situation (Chris)
- Fixes couple deadlocks (Chris)
- Timeslice preemption fixes (Chris)
- Fix Display Port interrupt handling on Tiger Lake (Imre)
- Reduce debug noise around Frame Buffer Compression (Peter)
- Fix logic around IPC W/a for Coffee Lake and Kaby Lake (Sultan)
- Avoid dereferencing a dead context (Chris)

Thanks,
Rodrigo.

The following changes since commit 8598eb781cf68fd6cb67c479f1479ae58bd54fb9:

  drm/i915: Use proper fault mask in interrupt postinstall too (2020-04-28 16:38:03 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-05-07

for you to fetch changes up to 1bc6a60143a4f9264cc6e09ceb9919f4e813a872:

  drm/i915/execlists: Track inflight CCID (2020-05-06 15:37:59 -0700)

----------------------------------------------------------------
- Fixes on execlist to avoid GPU hang situation (Chris)
- Fixes couple deadlocks (Chris)
- Timeslice preemption fixes (Chris)
- Fix Display Port interrupt handling on Tiger Lake (Imre)
- Reduce debug noise around Frame Buffer Compression (Peter)
- Fix logic around IPC W/a for Coffee Lake and Kaby Lake (Sultan)
- Avoid dereferencing a dead context (Chris)

----------------------------------------------------------------
Chris Wilson (7):
      drm/i915: Avoid dereferencing a dead context
      drm/i915/gt: Make timeslicing an explicit engine property
      drm/i915: Check current i915_vma.pin_count status first on unbind
      drm/i915/gt: Yield the timeslice if caught waiting on a user semaphore
      drm/i915/gem: Remove object_is_locked assertion from unpin_from_display_plane
      drm/i915/execlists: Avoid reusing the same logical CCID
      drm/i915/execlists: Track inflight CCID

Imre Deak (1):
      drm/i915/tgl+: Fix interrupt handling for DP AUX transactions

Peter Jones (1):
      Make the "Reducing compressed framebufer size" message be DRM_INFO_ONCE()

Sultan Alsawaf (1):
      drm/i915: Don't enable WaIncreaseLatencyIPCEnabled when IPC is disabled

 drivers/gpu/drm/i915/display/intel_fbc.c          |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c        |   7 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h     |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine.h            |   9 --
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |   6 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h      |  35 +++++--
 drivers/gpu/drm/i915/gt/intel_gt_irq.c            |  15 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c               | 117 ++++++++++++++--------
 drivers/gpu/drm/i915/gt/selftest_lrc.c            |  34 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c              |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c             |  12 ++-
 drivers/gpu/drm/i915/i915_irq.c                   |  16 +--
 drivers/gpu/drm/i915/i915_perf.c                  |   6 +-
 drivers/gpu/drm/i915/i915_reg.h                   |   1 +
 drivers/gpu/drm/i915/i915_vma.c                   |  25 ++---
 drivers/gpu/drm/i915/intel_pm.c                   |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c         |   2 +-
 18 files changed, 180 insertions(+), 124 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
