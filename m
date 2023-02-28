Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6C6A5119
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 03:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298110E494;
	Tue, 28 Feb 2023 02:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696FE10E471;
 Tue, 28 Feb 2023 02:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677550913; x=1709086913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0iWN4NSVxcAJpQGBzzVwSRfHUDfhGGCncm1XHjLRQjE=;
 b=fqX1CwVapuXOCBR2PTpxIBM5xTOCRI8B5Mb4uXxGlToGIRNcN2VIzLVy
 9L79+gxG+QB3ZqmX1haq6pzSXuOmfhMy0FldCkSQGx6Gi3EnomietoDAV
 tY3hvJZLYnKPxEzp6utZ5Hsk5bBl0qDGlIPOCIff3DwHVXhukGTdWNlWh
 ADHQ2mrP4r24CQeX2d78jzI5ilwetkGJcnsS+yVB+5RpC1840S8P0ybLM
 vKB26SKkEMOFG6eeUNrbD8+cF5DSQ/IC+4XyGtrSFpRD/6PTyHj4LXSEg
 oLI7kSrVacW65PhRZuAq85JhTljRd71eel5g4Ymtl9m+bfZEXXnA+Krk9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334070739"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="334070739"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 18:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919601741"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="919601741"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 18:21:52 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 8/8] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Date: Mon, 27 Feb 2023 18:21:50 -0800
Message-Id: <20230228022150.1657843-9-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable PXP with MTL-GSC-CS: add the has_pxp into device info
and increase the debugfs teardown timeouts to align with
new GSC-CS + firmware specs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c              | 1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c | 9 ++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index a8d942b16223..4ecf0f2ab6ec 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1150,6 +1150,7 @@ static const struct intel_device_info mtl_info = {
 	.has_guc_deprivilege = 1,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
+	.has_pxp = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
index 9f6e300486b4..ddf9f8bb7791 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
@@ -14,6 +14,7 @@
 
 #include "intel_pxp.h"
 #include "intel_pxp_debugfs.h"
+#include "intel_pxp_gsccs.h"
 #include "intel_pxp_irq.h"
 #include "intel_pxp_types.h"
 
@@ -45,6 +46,7 @@ static int pxp_terminate_set(void *data, u64 val)
 {
 	struct intel_pxp *pxp = data;
 	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
+	int timeout_ms;
 
 	if (!intel_pxp_is_active(pxp))
 		return -ENODEV;
@@ -54,8 +56,13 @@ static int pxp_terminate_set(void *data, u64 val)
 	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
 	spin_unlock_irq(gt->irq_lock);
 
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		timeout_ms = GSC_PENDING_RETRY_LATENCY_MS;
+	else
+		timeout_ms = 250;
+
 	if (!wait_for_completion_timeout(&pxp->termination,
-					 msecs_to_jiffies(100)))
+					 msecs_to_jiffies(timeout_ms)))
 		return -ETIMEDOUT;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 4ddf2ee60222..03f006f9dc2e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -44,7 +44,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 				      KCR_SIP(pxp->kcr_base),
 				      mask,
 				      in_play ? mask : 0,
-				      100);
+				      250);
 
 	intel_runtime_pm_put(uncore->rpm, wakeref);
 
-- 
2.39.0

