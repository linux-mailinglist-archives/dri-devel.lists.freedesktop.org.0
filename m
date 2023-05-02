Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A056F462A
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A7010E28C;
	Tue,  2 May 2023 14:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB32210E28C;
 Tue,  2 May 2023 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038350; x=1714574350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W++mSXj606OUWZamGXCrIXD2DE8hzdzlxYfmpGAqrE8=;
 b=n3JQ1rDfW2L1pcmzFVwsY6vUDgil5KFEvGV9n36HQ8ahxrHyepX4uBQ+
 J49frLXaHWZD+NpoG3bvVLv+faASn1XeFCxR4ZrS/8b7hFOd948wdYty1
 FEh1ygB3EEDLOBVowyLNz5Swt8+AVVYbuGNi6gd2UNiWEVojXHUYvf6Pv
 FZA4uE+TWCY4t2yca5yLqvYI3b5c8k8OFhOQsHuy/W2UQIpIeRV+/IlwA
 qDQHvtyKgBxgBu0UBIV9XYWTQMrHUp7Bj42cixO2uCAO/QvAG/Cgmd3Cf
 N/OzYYVUExgCw9CR25WQ100f6hRYj2L0cK4xou028jBpaSMcfbvjFaFnp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396769"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396769"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991602"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991602"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] drm/i915: MST+DSC nukage and state stuff
Date: Tue,  2 May 2023 17:38:55 +0300
Message-Id: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The big one here is removal of the defunct i915 MST DSC code.
That one clearly needs a lot more love, and the big issue
there (FEC) probably can't be done in a way that can be
easily backported. So IMO we just need to nuke the whole
MST+DSC thing for now, or else we'll end up with impossible
to debug bug reports.

The rest is mainly improvements around state
readout/check/dumping.

Ville Syrjälä (11):
  drm/dp_mst: Fix fractional DSC bpp handling
  drm/i915/mst: Remove broken MST DSC support
  drm/i915/mst: Read out FEC state
  drm/i915: Fix FEC pipe A vs. DDI A mixup
  drm/i915: Check lane count when determining FEC support
  drm/i915: Fix FEC state dump
  drm/i915: Split some long lines
  drm/i915: Introduce crtc_state->enhanced_framing
  drm/i915: Stop spamming the logs with PLL state
  drm/i915: Drop some redundant eDP checks
  drm/i915: Reduce combo PHY log spam

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  20 +-
 drivers/gpu/drm/i915/display/g4x_dp.c         |  10 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  17 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |   2 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   3 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  29 +--
 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  29 +--
 .../drm/i915/display/intel_dp_link_training.c |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 181 +-----------------
 drivers/gpu/drm/i915/display/intel_fdi.c      |   9 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   3 +-
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    |   2 +-
 include/drm/display/drm_dp_mst_helper.h       |   2 +-
 17 files changed, 80 insertions(+), 236 deletions(-)

-- 
2.39.2

