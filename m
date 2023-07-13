Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC71751EED
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D665910E680;
	Thu, 13 Jul 2023 10:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA25410E66F;
 Thu, 13 Jul 2023 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244650; x=1720780650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NTNA7nFPteiC5o2oQBWLwJiY0vM2uJXhNVdDMdYd2OE=;
 b=K/frozrRRgQIx581pmcax/YIiYjzN8/l7dvU+lKPROr7kLAhcWP4/Fu1
 hDfKS/aI9FU1KXbJsYTCnz20F7YRcoYnnzCG94wPb9l7+rL2RRpN4HHpm
 GW0tfWnT6pF1Q0IgvCOuciclq9kIdtzpPprIrg4nMJG77s2xLJLhSBV+L
 zOTMuWiU/5zCdSxyDecPCBznoYWE+/a0tsP8pcb6vb1GwfFeh2piBkje6
 x69H7TlUSox55Tmk1RbC3zate02cKeaz428P8hYj/C0Flm0y4QKrvXZU/
 3Wyj3s3jJh1zBcCDXuo+lPKdMrGCfQE5WVzciFUg2R0ZBTYiE13MyYRtD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897496"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965282"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965282"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/19] DSC misc fixes
Date: Thu, 13 Jul 2023 16:03:27 +0530
Message-Id: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is an attempt to address multiple issues with DSC,
scattered in separate existing series.

Patches 1-3 are DSC fixes from series to Handle BPC for HDMI2.1 PCON
https://patchwork.freedesktop.org/series/107550/

Patches 4-5 are from series DSC fixes for Bigjoiner:
https://patchwork.freedesktop.org/series/115773/

Patches 6-12 are from series to add DSC fractional BPP support:
https://patchwork.freedesktop.org/series/111391/

Patch 13 is to fix compressed bpc for MST DSC, from Stan's series :
https://patchwork.freedesktop.org/series/116179/

Rev2: Addressed review comments from Stan, Ville.

Rev3: Split larger patches. Separate out common helpers.

Rev4: Rebased, fixed checkpatch warnings.

Ankit Nautiyal (18):
  drm/i915/dp: Consider output_format while computing dsc bpp
  drm/i915/dp: Move compressed bpp check with 420 format inside the
    helper
  drm/i915/dp_mst: Use output_format to get the final link bpp
  drm/i915/dp: Use consistent name for link bpp and compressed bpp
  drm/i915/dp: Update Bigjoiner interface bits for computing compressed
    bpp
  drm/i915/display: Account for DSC not split case while computing cdclk
  drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
  drm/i915/dp: Remove extra logs for printing DSC info
  drm/display/dp: Fix the DP DSC Receiver cap size
  drm/i915/dp: Avoid forcing DSC BPC for MST case
  drm/i915/dp: Add functions to get min/max src input bpc with DSC
  drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
  drm/i915/dp: Avoid left shift of DSC output bpp by 4
  drm/i915/dp: Rename helper to get DSC max pipe_bpp
  drm/i915/dp: Separate out functions for edp/DP for computing DSC bpp
  drm/i915/dp: Add DSC BPC/BPP constraints while selecting pipe bpp with
    DSC
  drm/i915/dp: Separate out function to get compressed bpp with joiner
  drm/i915/dp: Get optimal link config to have best compressed bpp

Stanislav Lisovskiy (1):
  drm/i915: Query compressed bpp properly using correct DPCD and DP Spec
    info

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  63 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 611 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h       |  20 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  80 +--
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  12 +
 drivers/gpu/drm/i915/display/intel_vdsc.h     |   2 +
 .../drm/i915/display/skl_universal_plane.c    |   4 +-
 include/drm/display/drm_dp.h                  |   2 +-
 8 files changed, 603 insertions(+), 191 deletions(-)

-- 
2.40.1

