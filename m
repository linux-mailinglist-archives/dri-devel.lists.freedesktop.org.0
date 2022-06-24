Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18655A33A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8075310E861;
	Fri, 24 Jun 2022 21:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E7710E861;
 Fri, 24 Jun 2022 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656104629; x=1687640629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RzmUk0vu2qDrlUK63NeU8p0lK5abrpxk4sPGwtjpsN0=;
 b=nNJD0bI+EY+CVCEnT39P1LufSfpIZPCZPekVyRvJOBKJFGUk345+w9jQ
 gdQkb4+kOhRjcKLTy6tuKJCbWNYw8DG8+eCImt2mAjYJ6hKiFVkS3n6PC
 a/6gLE+e9RYfxlFliWwNeOBb1Z+xKmLB3C9W8tvUTvi6IaTPCXVJlqRSb
 1uWMTcvMPq9gixaAC3zwUwq+S7O0DrWT/99TCi0z7M2GUpNbvylzxFnkf
 kGNAePkydse0O5/JVR/ZWlgSM2W6MNtI4wWUQC7M9wklp8pt6KDlyHLAU
 7qjfKjGFgHRBrYA7Js//q6VbbVP1CuwdYeujZgRIBP4GIeSzsLmhFsSmq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="367411041"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="367411041"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 14:03:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="593387295"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 14:03:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Correct duplicated/misplaced GT register
 definitions
Date: Fri, 24 Jun 2022 14:03:27 -0700
Message-Id: <20220624210328.308630-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

XEHPSDV_FLAT_CCS_BASE_ADDR, GEN8_L3_LRA_1_GPGPU, and MMCD_MISC_CTRL were
duplicated between i915_reg.h and intel_gt_regs.h.  These are all GT
registers, so we should drop the copy from i915_reg.h.

XEHPSDV_TILE0_ADDR_RANGE was defined in i915_reg.h, but really belongs
in intel_gt_regs.h.  Move it.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  3 +++
 drivers/gpu/drm/i915/i915_reg.h            | 17 -----------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index fa54823d1219..e63de9c06596 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -14,6 +14,7 @@
 #include "gem/i915_gem_region.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
+#include "gt/intel_gt_regs.h"
 #include "gt/intel_region_lmem.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 07ef111947b8..61815b6e87de 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -324,6 +324,9 @@
 
 #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
 
+#define XEHPSDV_TILE0_ADDR_RANGE		_MMIO(0x4900)
+#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT		8
+
 #define XEHPSDV_FLAT_CCS_BASE_ADDR		_MMIO(0x4910)
 #define   XEHPSDV_CCS_BASE_SHIFT		8
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 932bd6aa4a0a..cf5e16abf6c7 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8345,23 +8345,6 @@ enum skl_power_gate {
 #define   SGGI_DIS			REG_BIT(15)
 #define   SGR_DIS			REG_BIT(13)
 
-#define XEHPSDV_TILE0_ADDR_RANGE	_MMIO(0x4900)
-#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT  8
-
-#define XEHPSDV_FLAT_CCS_BASE_ADDR	_MMIO(0x4910)
-#define   XEHPSDV_CCS_BASE_SHIFT	8
-
-/* gamt regs */
-#define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
-#define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
-#define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_CHV  0x5FF101FF /* max/min for LRA1/2 */
-#define   GEN9_L3_LRA_1_GPGPU_DEFAULT_VALUE_SKL  0x67F1427F /*    "        " */
-#define   GEN9_L3_LRA_1_GPGPU_DEFAULT_VALUE_BXT  0x5FF101FF /*    "        " */
-
-#define MMCD_MISC_CTRL		_MMIO(0x4ddc) /* skl+ */
-#define  MMCD_PCLA		(1 << 31)
-#define  MMCD_HOTSPOT_EN	(1 << 27)
-
 #define _ICL_PHY_MISC_A		0x64C00
 #define _ICL_PHY_MISC_B		0x64C04
 #define _DG2_PHY_MISC_TC1	0x64C14 /* TC1="PHY E" but offset as if "PHY F" */
-- 
2.36.1

