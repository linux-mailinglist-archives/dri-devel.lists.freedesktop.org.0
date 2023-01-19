Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3ED674317
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8585510E9DF;
	Thu, 19 Jan 2023 19:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30CD10E9DF;
 Thu, 19 Jan 2023 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674157796; x=1705693796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VWs6EP8Tj//CeZN1Gw+f9OkP+/JBoJqTdDs1Ca8w/98=;
 b=bsI6ranaESTuKlO5TXEQxA1ZYpWLaEZqzUjyQQ5m3CqRGkgzCjbR040M
 3zC0BmZXL5FCcqDDhlpnwpiSN697A3fnlPHlEp40sykGC/b2PEho5WZ5T
 vcwSQZJHiPQMphXcI6RWvizbBUoR0xMDlBrG7e5bhgxMfe/p7rokgpLpW
 DPw2qM4M6WthMJgQ1oxES84H2GxUW7grGt27hFgsMJplWO/GyOJ4Zf0Gf
 VnRC9eXcXkQZkgzTJt0/PnujhNDCRj34/rDk2BFvUqKDMExXo0V4ui6+y
 YZHwTRolrlBggABmXyYlXQj+SbXMv69QLJrOkMhN5cVnCOyx8acP/tgY7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305075462"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305075462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="610191017"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="610191017"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 19 Jan 2023 11:49:55 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
Date: Thu, 19 Jan 2023 11:49:55 -0800
Message-Id: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Vivi@freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	dri-devel@lists.freedesktop.org,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Driver-FLR flow may inadvertently exit early before the full
completion of the re-init of the internal HW state if we only poll
GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
we need a two-step completion wait-for-completion flow that also
involves GU_CNTL. See the patch and new code comments for detail.
This is new direction from HW architecture folks.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
---
 drivers/gpu/drm/i915/intel_uncore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 8dee9e62a73e..959869e2ff05 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2748,6 +2748,12 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 	/* Trigger the actual Driver-FLR */
 	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
 
+	/* Completion Step 1 - poll for 'CNTL-BIT31 = 0' wait for hw teardown to complete */
+	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
+					 DRIVERFLR_STATUS, 0,
+					 flr_timeout_ms);
+
+	/* Completion: Step 2 - poll for 'DEBUG-BIT31 = 1' for hw/fw re-init to complete */
 	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
 					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
 					 flr_timeout_ms);
@@ -2756,6 +2762,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 		return;
 	}
 
+	/* Write 1 to clear GU_DEBUG's sticky completion status bit */
 	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
 }
 

base-commit: 0a0ee61784df01ac098a92bd43673ee30c629f13
-- 
2.39.0

