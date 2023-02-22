Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D069FD53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 22:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31B10E169;
	Wed, 22 Feb 2023 21:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AB610E169;
 Wed, 22 Feb 2023 21:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677099683; x=1708635683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nALHn0YhACcsVEIr/nsIBEeUjHby0oRS6WiGB37Eb+8=;
 b=Q/9Be6iLYBp/mMMREwK9Z73q3s8DJiIeSDJ9hqiUah2/Sd0x6EaXKRTq
 2udBRxr/RkS/vD7AFcIK8obAhCWGb/ZkEZebFMiHVP9HAJ3ykbzc2Yl3u
 HMsmzihjgXHh7/znYzhhLNxIbZprParjxhIL5AJkR3CmmuX6brtvRjFwR
 IajPDM6CnpNWs1SvXVLrB4bP/bIFwE9vYmtRbM5I1aOJ2/H1qCTaGsOf3
 CNpaG4gad7Fq7vGubK+FPej4LKjKsmf2cpn7f/WSgYAJgRZrwIH3lzvhW
 HUIOPJhID1pTapXAkiZ1At6K/xtm+MK16GoZCvCD+ES9uyXc3WQHnxADh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397729617"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="397729617"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 13:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="815068976"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="815068976"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2023 13:01:22 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Date: Wed, 22 Feb 2023 13:01:20 -0800
Message-Id: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org, Anshuman <anshuman.gupta@intel.com>,
	dri-devel@lists.freedesktop.org, Gupta@freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Driver-FLR flow may inadvertently exit early before the full
completion of the re-init of the internal HW state if we only poll
GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
we need a two-step completion wait-for-completion flow that also
involves GU_CNTL. See the patch and new code comments for detail.
This is new direction from HW architecture folks.

   v2: - Add error message for the teardown timeout (Anshuman)
       - Don't duplicate code in comments (Jani)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
---
 drivers/gpu/drm/i915/intel_uncore.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index f018da7ebaac..f3c46352db89 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2749,14 +2749,25 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 	/* Trigger the actual Driver-FLR */
 	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
 
+	/* Wait for hardware teardown to complete */
+	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
+					 DRIVERFLR_STATUS, 0,
+					 flr_timeout_ms);
+	if (ret) {
+		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
+		return;
+	}
+
+	/* Wait for hardware/firmware re-init to complete */
 	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
 					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
 					 flr_timeout_ms);
 	if (ret) {
-		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
+		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
 		return;
 	}
 
+	/* Clear sticky completion status */
 	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
-- 
2.39.0

