Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7D674AED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0D10EA1B;
	Fri, 20 Jan 2023 04:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5C510EA1B;
 Fri, 20 Jan 2023 04:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189713; x=1705725713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ArwRWkIClebT8bbYaoTVjMKjozyAHPmZMunqKCxrGuc=;
 b=jgPtKaczDsrnsCauytr9u/Dtkz2vphbtjf0iye/YO7iXcrLahexzXuFz
 3NCv4Upk6m7xX0DCq5DNLCDfSF+9aUQPMawmfAtbD8+9E5m9md6CW5AqS
 ELJIC+jZ0ATiGc5FMkiGoVQxGCTMfeizaVY8q/eWbPl752XmzE4cUJ89d
 6+j1EvmlfDeqcgtFcvL+D5zs5ZspTSyjZAVpALWsZPikIEAFAhZoW9jN6
 gKFVA7TGhHlh8zl0r2dUnhXf64nLahw49OU0Qlzwmw8ev2Jp2fT8gxV4x
 2FXDVFHtiHrwqTtP+7aNAEHlm3dh7CchXmeNNj1NwbONzEkDonX8Zn/P5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195431"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734898"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734898"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:50 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/16] Add DSC fractional bpp support
Date: Fri, 20 Jan 2023 10:08:28 +0530
Message-Id: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for DSC fractional compressed bpp
for MTL+. The series starts with some fixes, followed by patches that
lay groundwork to iterate over valid compressed bpps to select the
'best' compressed bpp with optimal link configuration (taken from
upstream series: https://patchwork.freedesktop.org/series/105200/).

The later patches, add changes to accommodate compressed bpp with
fractional part, including changes to QP calculations.
To get the 'best' compressed bpp, we iterate over the valid compressed
bpp values, but with fractional step size 1/16, 1/8, 1/4 or 1/2 as per
sink support.

The last 2 patches add support to depict DSC sink's fractional support,
and debugfs to enforce use of fractional bpp, while choosing an
appropriate compressed bpp.


Ankit Nautiyal (13):
  drm/i915/dp: Remove extra logs for printing DSC info
  drm/i915/dp: Avoid forcing DSC BPC for MST case
  drm/i915/dp: Do not check for min DSC BPC for MST case
  drm/i915/dp: Check if dsc forced bpc is in allowed limits
  drm/i915/dp: Avoid left shift of DSC output bpp by 4
  drm/i915/dp: Rename helpers to get DSC max pipe_bpp/output_bpp
  drm/i915/dp: Get optimal link config to have best compressed bpp
  drm/i915/display: Store compressed bpp in U6.4 format
  drm/i915/display: Consider fractional vdsc bpp while computing m_n
    values
  drm/i915/audio : Consider fractional vdsc bpp while computing tu_data
  drm/display/dp: Fix the DP DSC Receiver cap size
  drm/display/dp: Add helper function to get DSC bpp prescision
  drm/i915/dp: Iterate over output bpp with fractional step size

Swati Sharma (2):
  drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
  drm/i915/dsc: Allow DSC only with fractional bpp when forced from
    debugfs

Vandita Kulkarni (1):
  drm/i915/dsc/mtl: Add support for fractional bpp

 drivers/gpu/drm/display/drm_dp_helper.c       |  27 ++
 drivers/gpu/drm/i915/display/icl_dsi.c        |  10 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.h  |   2 +-
 .../drm/i915/display/intel_display_debugfs.c  |  84 ++++
 .../drm/i915/display/intel_display_types.h    |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 389 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h       |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  30 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   2 +-
 .../gpu/drm/i915/display/intel_qp_tables.c    |   3 -
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  16 +-
 include/drm/display/drm_dp.h                  |   2 +-
 include/drm/display/drm_dp_helper.h           |   1 +
 16 files changed, 487 insertions(+), 132 deletions(-)

-- 
2.25.1

