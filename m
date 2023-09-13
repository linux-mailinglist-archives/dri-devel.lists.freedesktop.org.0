Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAC79DFB5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E081E10E35D;
	Wed, 13 Sep 2023 06:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E255E10E26D;
 Wed, 13 Sep 2023 06:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694585513; x=1726121513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mA8VurIMNSYGfTXSwzwX47Tk3PNUx/Y7aVB24PGI2Cg=;
 b=c3aZF7tmIHj2iP3xD2CcO4eozsjiNWAUQBlJC+4FEqNCeK0CvLz4s+il
 +HE1RfuFC9BHwOHCrAnYC7PiX4fofvo0egP/QpwrdInm6wRyPhW0mRv93
 iAIG9DEecLS5xF1kGGCnngV4M1ZXJOuMjy714UsyXBEah0tQBajf8lMST
 ZryoiVUWPRuxrfdhf0WjvK/PzW8btIyHEC1xqWLKFdnG3+4A9/DLTfSyp
 6L68t9tAZXbDNCs694/Gx5907ELYytzzkhagk2rCaeZRnv6k92qBNxqgh
 nP3zDMLhiptKpQ3jRmXZ2JDTwzU7AzogsBjA/Rsdnq7sbW7P8/NEHGP7O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377482531"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377482531"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 23:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693741680"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="693741680"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 23:11:28 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] Add DSC fractional bpp support
Date: Wed, 13 Sep 2023 11:35:58 +0530
Message-Id: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 ankit.k.nautiyal@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

his patch series adds support for DSC fractional compressed bpp
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
  drm/display/dp: Add helper function to get DSC bpp prescision
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
 .../drm/i915/display/intel_display_debugfs.c  | 83 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 81 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 32 ++++---
 drivers/gpu/drm/i915/display/intel_fdi.c      |  2 +-
 .../i915/display/intel_fractional_helper.h    | 36 ++++++++
 .../gpu/drm/i915/display/intel_qp_tables.c    |  3 -
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 30 +++++--
 include/drm/display/drm_dp_helper.h           |  1 +
 16 files changed, 275 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h

-- 
2.25.1

