Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC144B94B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 00:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECD36EDC1;
	Tue,  9 Nov 2021 23:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8919F6EDC0;
 Tue,  9 Nov 2021 23:17:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="212590499"
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; d="scan'208";a="212590499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 15:17:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; d="scan'208";a="491858259"
Received: from shanthyw-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.34.193])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 15:17:32 -0800
Date: Tue, 9 Nov 2021 18:17:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YYsBif3HMi8GjLoU@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-next-fixes-2021-11-09:

Couple Reverts, build fix, couple virtualization fixes,
blank screen and other display rates fixes, and more.

Four patches targeting stable in here.

Display Fixes:
- DP rates related fixes (Imre, Jani)
- A Revert on disaling dual eDP that was causing state readout problems (Jani)
- put the cdclk vtables in const data (Jani)
- Fix DVO port type for moder platforms (Ville)
- Fix blankscreen by turning DP++ TMDS output buffers on encoder->shutdown (Ville)
- CCS FBs related fixes (Imre)

GT fixes:
- Fix recursive lock in GuC submission (Matt Brost)
- Revert guc_id from i915_request tracepoint (Joonas)
- Build fix around dmabuf (Matt Auld)

Thanks,
Rodrigo.

The following changes since commit 367fe8dc299c968eabdae890536d55d80ea55e01:

  Merge tag 'amd-drm-next-5.16-2021-10-22' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-10-27 10:38:41 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2021-11-09

for you to fetch changes up to ade4a1fc5741a36b559dfbd4557dc3da1a4394af:

  drm/i915/adlp/fb: Prevent the mapping of redundant trailing padding NULL pages (2021-11-09 10:02:48 -0500)

----------------------------------------------------------------
Couple Reverts, build fix, couple virtualization fixes,
blank screen and other display rates fixes, and more.

Four patches targeting stable in here.

Display Fixes:
- DP rates related fixes (Imre, Jani)
- A Revert on disaling dual eDP that was causing state readout problems (Jani)
- put the cdclk vtables in const data (Jani)
- Fix DVO port type for moder platforms (Ville)
- Fix blankscreen by turning DP++ TMDS output buffers on encoder->shutdown (Ville)
- CCS FBs related fixes (Imre)

GT fixes:
- Fix recursive lock in GuC submission (Matt Brost)
- Revert guc_id from i915_request tracepoint (Joonas)
- Build fix around dmabuf (Matt Auld)

----------------------------------------------------------------
Imre Deak (4):
      drm/i915/dp: Ensure sink rate values are always valid
      drm/i915/dp: Ensure max link params are always valid
      drm/i915/fb: Fix rounding error in subsampled plane size calculation
      drm/i915/adlp/fb: Prevent the mapping of redundant trailing padding NULL pages

Jani Nikula (3):
      Revert "drm/i915/bios: gracefully disable dual eDP for now"
      drm/i915/cdclk: put the cdclk vtables in const data
      drm/i915/dp: fix integer overflow in 128b/132b data rate calculation

Joonas Lahtinen (1):
      drm/i915: Revert 'guc_id' from i915_request tracepoint

Matthew Auld (1):
      drm/i915/dmabuf: fix broken build

Matthew Brost (1):
      drm/i915/guc: Fix recursive lock in GuC submission

Ville Syrjälä (3):
      drm/i915: Extend the async flip VT-d w/a to skl/bxt
      drm/i915: Fix type1 DVI DP dual mode adapter heuristic for modern platforms
      drm/i915/hdmi: Turn DP++ TMDS output buffers back on in encoder->shutdown()

Zhi A Wang (1):
      drm/i915/gvt: fix the usage of ww lock in gvt scheduler.

 drivers/gpu/drm/i915/display/g4x_hdmi.c           |   1 +
 drivers/gpu/drm/i915/display/intel_bios.c         | 132 +++++++++++-----------
 drivers/gpu/drm/i915/display/intel_cdclk.c        |  44 ++++----
 drivers/gpu/drm/i915/display/intel_ddi.c          |   1 +
 drivers/gpu/drm/i915/display/intel_display.c      |   9 +-
 drivers/gpu/drm/i915/display/intel_dp.c           |  31 +++--
 drivers/gpu/drm/i915/display/intel_fb.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c         |  16 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.h         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c        |   7 ++
 drivers/gpu/drm/i915/gt/intel_ggtt.c              |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |   3 +-
 drivers/gpu/drm/i915/gvt/scheduler.c              |   4 +-
 drivers/gpu/drm/i915/i915_trace.h                 |   7 +-
 drivers/gpu/drm/i915/intel_pm.c                   |  12 ++
 15 files changed, 162 insertions(+), 113 deletions(-)
