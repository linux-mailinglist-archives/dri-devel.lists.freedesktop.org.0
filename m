Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD662617953
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 10:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4200810E256;
	Thu,  3 Nov 2022 09:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546E010E1C9;
 Thu,  3 Nov 2022 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667466198; x=1699002198;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=pQgl7XRVgcd2d9g0XSQe1fLHEAiBS6SXQA65Tms59Ig=;
 b=QbMqCBB0z15echZVaWWteDQ2RQJeqzn+wwDPCh/x2uVUD/CCiNAhxbKH
 FU7cp762Xgus47cdzFYGWIf65IwJTVWX0YsYK77O7mn5ZEbf5CtpEOSZi
 vXTlOgNpS+ceZ3e/CHJrl908PGDj6OhMMM0qgL9+YKfh7uZQe9owhdq7F
 lh3XFo17Iun2pPlXqL2sfSs6cpNGhKcf74mG045aFxXeNDbI11CW3l7j+
 mIgtWQMF7y/2QWNpFeZ59QL/T3NrbjVG5eUIzPRwVttUvaM639m/qrzyd
 4oBgAaXrILKDK/0yYwFsDbMiZJOjvlucD0szk/+YnsLwj4JmSdtNTt1Ll Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="336319855"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="336319855"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 02:03:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="723868057"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="723868057"
Received: from khogan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.226.17])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 02:03:15 -0700
Date: Thu, 3 Nov 2022 09:03:13 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y2ODlCGM4nACmzsJ@tursulin-desk>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A few fixes for 6.1.

On the display side fixed a race condition in accessing DKL PHY registers
(TGL+), fixed LVDS EDID fixed mode setup and fixed SDVO invalid mode
filtering. On the GEM side fix running under Xen and use DMA API directly
instead of special casing for SWIOTLB only.

drm-intel-fixes-2022-11-03:
- Add locking around DKL PHY register accesses (Imre Deak)
- Stop abusing swiotlb_max_segment (Robert Beckett)
- Filter out invalid outputs more sensibly (Ville Syrjälä)
- Setup DDC fully before output init (Ville Syrjälä)
- Simplify intel_panel_add_edid_alt_fixed_modes() (Ville Syrjälä)
- Grab mode_config.mutex during LVDS init to avoid WARNs (Ville Syrjälä)
The following changes since commit 30a0b95b1335e12efef89dd78518ed3e4a71a763:

  Linux 6.1-rc3 (2022-10-30 15:19:28 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-11-03

for you to fetch changes up to 12caf46cf4fc92b1c3884cb363ace2e12732fd2f:

  drm/i915/sdvo: Grab mode_config.mutex during LVDS init to avoid WARNs (2022-10-31 14:09:15 +0000)

----------------------------------------------------------------
- Add locking around DKL PHY register accesses (Imre Deak)
- Stop abusing swiotlb_max_segment (Robert Beckett)
- Filter out invalid outputs more sensibly (Ville Syrjälä)
- Setup DDC fully before output init (Ville Syrjälä)
- Simplify intel_panel_add_edid_alt_fixed_modes() (Ville Syrjälä)
- Grab mode_config.mutex during LVDS init to avoid WARNs (Ville Syrjälä)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/tgl+: Add locking around DKL PHY register accesses

Robert Beckett (1):
      drm/i915: stop abusing swiotlb_max_segment

Ville Syrjälä (4):
      drm/i915/sdvo: Filter out invalid outputs more sensibly
      drm/i915/sdvo: Setup DDC fully before output init
      drm/i915: Simplify intel_panel_add_edid_alt_fixed_modes()
      drm/i915/sdvo: Grab mode_config.mutex during LVDS init to avoid WARNs

 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  68 ++++++-------
 drivers/gpu/drm/i915/display/intel_display_core.h  |   8 ++
 .../drm/i915/display/intel_display_power_well.c    |   7 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       | 109 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |  24 +++++
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  59 +++++------
 drivers/gpu/drm/i915/display/intel_lvds.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   4 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  64 +++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |  19 +---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    |   3 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |  34 ++++---
 19 files changed, 277 insertions(+), 139 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.h
