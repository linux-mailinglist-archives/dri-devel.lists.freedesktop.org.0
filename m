Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F17B2DA0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1E310E6D1;
	Fri, 29 Sep 2023 08:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60A810E6CA;
 Fri, 29 Sep 2023 08:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975463; x=1727511463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/eDp/o//qdFrMlpO6bN0mqi/TLJLxTv2Y3NPZ0dpsqM=;
 b=AlLcbZ3jASt3LRDqIwNaD/GitPoOfJ8916woo6hpVQzCHXfwkrGo3cOa
 46mWxulIOcVzc/TOMlCpB0AnP124g6FW5G23Zf7yFQfBhJD2qinSzK8oI
 qtkCHwAqjNGht2RNmXvD8NipW80f3Ox610nEn10xjKQE+Dkq1Z1YVAhIY
 8G89lPstXhEns9uHC99PqEJplIngxWe6Fs1CoLAdeoKVgdJo9NFfD3NgM
 riKviyVxujCz2M3+IUuw4IOMVOgtRdiW+HBHEH7TIP+ijOPD18rKh1XoR
 ghYhTcduS4fnk2n5VtcItl75o9Vz79uRBOEA7u9NmGw7rhNEt/77uVkG7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379520246"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="379520246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815517381"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="815517381"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 00:19:04 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] Add DSC fractional bpp support
Date: Fri, 29 Sep 2023 12:43:14 +0530
Message-Id: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
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

