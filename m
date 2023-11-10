Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B67E7B36
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7D10E965;
	Fri, 10 Nov 2023 10:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1B110E963;
 Fri, 10 Nov 2023 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611377; x=1731147377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ePbLA/SR0H2puoLIk0ypOkX+vCkB23hrJ4880K3Nc4=;
 b=fHZ5zhs4nX0P1KqHxCZT2IppwCL2YaZhIKQrnvHMuhlTaHa0OQ1VChuW
 /EMbXQxkPEKjpMcxDopmirsCJSbyhXxlJFWT895PqVlQduFqlqgcuz/Cr
 9+sBVCIgP4iCPJFHQlxJtSPz3ZOzn2lBvx/tsFJj3qDIEvHigeqsZ4e9e
 KJ1lscEVfvCl3uy/dxRK7PmpEPc2XEANXcQzuJ5DmGtGSmn2fNXnnECwU
 OjrAkjr9i+zO3G5Rehisq/hvgtS9Xd6vE+X4Cs3300aJC93XBqtWcj0In
 kA8l+GvhI2QaWhibDVG1RcjqC1j+F3hKBpE9s8Ivoxpt96c4MOOQcj1U4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712784"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816390"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:14 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/11] Add DSC fractional bpp support
Date: Fri, 10 Nov 2023 15:40:09 +0530
Message-Id: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: vandita.kulkarni@intel.com, suraj.kandpal@intel.com,
 suijingfeng@loongson.cn, swati2.sharma@intel.com
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

Rev10: Rebased and added DSC Fractional support for DP MST.

Ankit Nautiyal (8):
  drm/display/dp: Add helper function to get DSC bpp precision
  drm/i915/display: Store compressed bpp in U6.4 format
  drm/i915/display: Consider fractional vdsc bpp while computing m_n
    values
  drm/i915/audio: Consider fractional vdsc bpp while computing tu_data
  drm/i915/dp: Iterate over output bpp with fractional step size
  drm/i915/dp_mst: Use precision of 1/16 for computing bpp
  drm/i916/dp_mst: Iterate over the DSC bpps as per DSC precision
    support
  drm/i915/dp_mst: Add support for forcing dsc fractional bpp via
    debugfs

Swati Sharma (2):
  drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
  drm/i915/dsc: Allow DSC only with fractional bpp when forced from
    debugfs

Vandita Kulkarni (1):
  drm/i915/dsc/mtl: Add support for fractional bpp

 drivers/gpu/drm/display/drm_dp_helper.c       | 27 ++++++
 drivers/gpu/drm/i915/display/icl_dsi.c        | 10 +--
 drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++--
 drivers/gpu/drm/i915/display/intel_bios.c     |  4 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  6 +-
 .../drm/i915/display/intel_display_debugfs.c  | 84 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 87 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 85 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_fdi.c      |  3 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c  |  2 +-
 .../gpu/drm/i915/display/intel_qp_tables.c    |  3 -
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 29 +++++--
 include/drm/display/drm_dp_helper.h           |  1 +
 15 files changed, 266 insertions(+), 100 deletions(-)

-- 
2.40.1

