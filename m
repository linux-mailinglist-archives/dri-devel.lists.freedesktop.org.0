Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C724ED025
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C16899A3;
	Wed, 30 Mar 2022 23:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B6510E1DA;
 Wed, 30 Mar 2022 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682956; x=1680218956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ZPDJ8TaGxtKnkDW0obq40IPO9CrqVBehoZhcg4X3Vk=;
 b=HcKVVYlYMJw7eFvWV716Qd49fMJ/Iz6+LVmCVdwFcNL+TbgO9iYFXpgD
 CYqMomSMrW9Nxvncm+qwXzpaWxK45sRwFPE/X6XVc3HnlrbKKHZdmfO/x
 9O1kvNUyUjsEYC3phzrf9eyZDQczrdiufRcQYRfNi1MFZKOtXos31nhGX
 vgUVpTG0kGeDwquGS8vPPq5izX1HisrHUf2uVuVBBV9axTlqhoExZOl+o
 jLOlp2O1Oa1Q5E1L7yPqOgW61qRqA8RqSoduWSG1t2EPMx4GtgAG3G0xn
 Y0ZuJHXNNGhsV1y21E/psus2+HRzWk+Z33ukzT7WXwHDnSjn8rXtd5+KZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582510"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582510"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052007"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/15] drm/i915: Move XEHPSDV_TILE0_ADDR_RANGE to GT register
 header
Date: Wed, 30 Mar 2022 16:28:50 -0700
Message-Id: <20220330232858.3204283-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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

XEHPSDV_TILE0_ADDR_RANGE is a GT register and requires multicast
handling.  Move the definition to the proper header.

Fixes: b8ca8fef58d4 ("drm/i915/stolen: don't treat small BAR as an error")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h    | 3 +++
 drivers/gpu/drm/i915/i915_reg.h            | 3 ---
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 47b5e0e342ab..a10d857dfd9b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -13,6 +13,7 @@
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_regs.h"
 #include "gt/intel_region_lmem.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index a060de66126a..5ea4e2fb8eb4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -324,6 +324,9 @@
 #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
 #define XEHP_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
 
+#define XEHPSDV_TILE0_ADDR_RANGE		_MMIO(0x4900)
+#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT		8
+
 #define XEHPSDV_FLAT_CCS_BASE_ADDR		_MMIO(0x4910)
 #define   XEHPSDV_CCS_BASE_SHIFT		8
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 062e11289aa0..b0742b7f4201 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8491,9 +8491,6 @@ enum skl_power_gate {
 #define   SGGI_DIS			REG_BIT(15)
 #define   SGR_DIS			REG_BIT(13)
 
-#define XEHPSDV_TILE0_ADDR_RANGE	_MMIO(0x4900)
-#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT  8
-
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
 #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
-- 
2.34.1

