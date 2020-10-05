Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDE6283F3E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 21:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320DE89A91;
	Mon,  5 Oct 2020 19:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2A789A91;
 Mon,  5 Oct 2020 19:04:18 +0000 (UTC)
IronPort-SDR: fEkxjAU8Yx11dfioSIshQJ+cMPiyz2WPVgf9OG4GMQzTsyMuVlEPreBJ+ORQBqmkMOCYy1kuNG
 Rj5UkJ8ONzzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161240842"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="161240842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 12:02:00 -0700
IronPort-SDR: 9Y86dWdOANEG59Jz9d6f85rYrAD+hjMo/yq3B6FxXBxeRBFJ6rLfrTWkbA/xaIx9kWyIqeWUAB
 L6xUjprNu6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="341253560"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2020 10:15:29 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 james.ausmus@intel.com, matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Subject: [PATCH v4 0/2] drm/i915/jsl: Update JSL Voltage swing table
Date: Mon,  5 Oct 2020 22:36:17 +0530
Message-Id: <20201005170619.1523-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch series covers following thigns:

1. Split and differentiate between EHL and JSL platfrom
2. Update voltage swing table for eDP on JSL platform

Changes since V3 :
        - Changed IS_EHL_JSL to IS_JSL_EHL
        - Renamed IS_EHL_REVID to IS_JSL_EHL_REVID
        - Reverted removal of IS_ELKHARTLAKE and also
          added IS_JASPERLAKE
	- Corrected mistake of using IS_ELKHARTLAKE twice 
	  and missing IS_JASPERLAKE in intel_ddi

Changes since V2 :
        - Added IS_EHL_JSL to replace IS_ELKHARTLAKE
        - EHL/JSL PCI ids split added
        - Rebased to drm master commit

Changes since V1 :
        - IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
          HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
        - Reverted EHL/JSL PCI ids split change

Tejas Upadhyay (2):
  drm/i915/jsl: Split EHL/JSL platform info and PCI ids
  drm/i915/edp/jsl: Update vswing table for HBR and HBR2

 drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 93 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 16 ++--
 drivers/gpu/drm/i915/gt/intel_sseu.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  4 +-
 drivers/gpu/drm/i915/i915_drv.h               |  9 +-
 drivers/gpu/drm/i915/i915_pci.c               |  9 ++
 drivers/gpu/drm/i915/intel_device_info.c      |  1 +
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 drivers/gpu/drm/i915/intel_pch.c              |  2 +-
 include/drm/i915_pciids.h                     |  9 +-
 15 files changed, 135 insertions(+), 35 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
