Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80FC6A143C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 01:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E00B10E354;
	Fri, 24 Feb 2023 00:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8A710E354;
 Fri, 24 Feb 2023 00:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677197879; x=1708733879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FULYhg+1KF9ulco4OzwlD5L2XkTnU1ez1BDObstspok=;
 b=WlI0T8d8z/wYrwYm2Ci9jdk5Me70BRCLrApKN3rAkohcdy03UiH9XD+5
 olOfLHEHJTEWP6y3a7OGUnkQSn/n1EO3pWBFBCH3A27TQMtK913Zyalen
 A+9oY9HpWxeWSUGB5SHn+UzzWPas4pJddgrSC6WsUMNRIkv190nD/vyEL
 ZHVBbEtyrKIp3hr6upG7W9qyOdkmVPOdL6JMhbcy837/qV3SL1XSOzhr8
 k0CMWwdEGojpHqZqGeXyusYdZ/n1343qeRvVtn21JIZl6DsNNIRFYfdm4
 iD6RWh5r3f6yzN57M8rmLIz6zoRChibBFBxLZIc7v0S25r2fDW+mEb+Nz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="313748701"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="313748701"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 16:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674726305"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="674726305"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2023 16:17:59 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Date: Thu, 23 Feb 2023 16:17:58 -0800
Message-Id: <20230224001758.544817-1-alan.previn.teres.alexis@intel.com>
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
	Rodrigo <rodrigo.vivi@intel.com>,
	Vinay Belgaumkar <vinay.belgaumkar@intel.com>
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
   v3: - Add get/put runtime-pm for this function. Though
         not functionally required during unload, its so the uncore
	 doesn't complain.
   v4: - Remove the get/put runtime-pm - that was for a prior
         version of this patch (not needed for drm-managed callback).
       - Remove the fixes tag since this is only for MTL and MTL
         still needs force probe (Daniele).
       - Bit 31 of GU_CNTL should be DRIVERFLR instead of
         DRIVERFLR_STATUS (Daniele).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Tested-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index f018da7ebaac..7b8fd3b7ff82 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2749,14 +2749,25 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 	/* Trigger the actual Driver-FLR */
 	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
 
+	/* Wait for hardware teardown to complete */
+	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
+					 DRIVERFLR, 0,
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

