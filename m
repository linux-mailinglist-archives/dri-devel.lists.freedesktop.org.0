Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEF3B973C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB56EC18;
	Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204416EB2C;
 Thu,  1 Jul 2021 20:25:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208567502"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208567502"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564403"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/53] drm/i915: Add XE_HP initial definitions
Date: Thu,  1 Jul 2021 13:23:36 -0700
Message-Id: <20210701202427.1547543-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

Our _FEATURES macro went back to GEN7, extending each other, making it
difficult to grasp what was really enabled/disabled. Take the
opportunity of the GEN -> XE_HP name break and also break with the
feature inheritance.

For XE_HP this basically goes from GEN12 back to GEN7 coalescing the
features making sure the overrides remain, remove all the
display-specific features and sort it.

Then also remove the definitions that would be overridden by
DGFX_FEATURES and those that were 0 (since that is the default).
Exception here is has_master_unit_irq: although it is a feature that
started with DG1 and is true for all DGFX platforms, it's also true for
XE_HP in general.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index a7bfdd827bc8..dc0883bad9cf 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -995,6 +995,30 @@ static const struct intel_device_info adl_p_info = {
 };
 
 #undef GEN
+
+#define XE_HP_PAGE_SIZES \
+	.page_sizes = I915_GTT_PAGE_SIZE_4K | \
+		      I915_GTT_PAGE_SIZE_64K | \
+		      I915_GTT_PAGE_SIZE_2M
+
+#define XE_HP_FEATURES \
+	.graphics_ver = 12, \
+	.graphics_ver_release = 50, \
+	XE_HP_PAGE_SIZES, \
+	.dma_mask_size = 46, \
+	.has_64bit_reloc = 1, \
+	.has_global_mocs = 1, \
+	.has_gt_uc = 1, \
+	.has_llc = 1, \
+	.has_logical_ring_contexts = 1, \
+	.has_logical_ring_elsq = 1, \
+	.has_rc6 = 1, \
+	.has_reset_engine = 1, \
+	.has_rps = 1, \
+	.has_runtime_pm = 1, \
+	.ppgtt_size = 48, \
+	.ppgtt_type = INTEL_PPGTT_FULL
+
 #undef PLATFORM
 
 /*
-- 
2.25.4

