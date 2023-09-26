Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C07AE801
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEA610E375;
	Tue, 26 Sep 2023 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F387A10E372;
 Tue, 26 Sep 2023 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695716962; x=1727252962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/eDp/o//qdFrMlpO6bN0mqi/TLJLxTv2Y3NPZ0dpsqM=;
 b=NmNCyrgnGKxogKxNopIABbjQiUTRdqXs6FyHlt2TLgxP5vFM+jgnQIi9
 TNuyWvIA4ufDroBTrsLHqD1KCVCjJhOOSYDfmU3pjJjdU/72/dqfnp33G
 q7VsxNqCmjQmWJYjEPqbW2x5h6j1Ix3PIyd584IQHo2LRP6yns1LB327U
 vSn9ymYp0fLUKs+QN6DOYVHZQLQ1Al72ABBzL65I9amxx7UAxR0k0/1bW
 kPw/ux/pS7Kzqcr6vu2yPWo5C0FtSsRTT42iy+pfra6a9AHUL7U2mBePo
 DcGutIMMSQtVsYFotrJC5fqErrlJcLg/oCX7Kjh2ZkSH5o1kUocsu7FCu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412431819"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412431819"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752079049"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="752079049"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga007.fm.intel.com with ESMTP; 26 Sep 2023 01:29:18 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] Add DSC fractional bpp support
Date: Tue, 26 Sep 2023 13:53:23 +0530
Message-Id: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, swati2.sharma@intel.com,
 mripard@kernel.org, ankit.k.nautiyal@intel.com
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

Ankit Nautiyal (5):
  drm/display/dp: Add helper function to get DSC bpp precision
  drm/i915/display: Store compressed bpp in U6.4 format
  drm/i915/display: Consider fractional vdsc bpp while computing m_n
    values
  drm/i915/audio : Consider fractional vdsc bpp while computing tu_data
  drm/i915/dp: Iterate over output bpp with fractional step size

Swati Sharma (2):
  drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
  drm/i915/dsc: Allow DSC only with fractional bpp when forced from
    debugfs

Vandita Kulkarni (1):
  drm/i915/dsc/mtl: Add support for fractional bpp

 drivers/gpu/drm/display/drm_dp_helper.c       | 27 ++++++
 drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +--
 drivers/gpu/drm/i915/display/intel_audio.c    | 17 ++--
 drivers/gpu/drm/i915/display/intel_bios.c     |  6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  2 +-
 .../drm/i915/display/intel_display_debugfs.c  | 84 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 81 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 32 ++++---
 drivers/gpu/drm/i915/display/intel_fdi.c      |  2 +-
 .../i915/display/intel_fractional_helper.h    | 36 ++++++++
 .../gpu/drm/i915/display/intel_qp_tables.c    |  3 -
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 30 +++++--
 include/drm/display/drm_dp_helper.h           |  1 +
 16 files changed, 276 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h

-- 
2.25.1

