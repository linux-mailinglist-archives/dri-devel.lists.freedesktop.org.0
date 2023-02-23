Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A106A1289
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 23:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3E210E0C9;
	Thu, 23 Feb 2023 22:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03D10E0C9;
 Thu, 23 Feb 2023 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677189900; x=1708725900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jSub0NwLTItn7Krrp9secaLMuzwYYGYVrb7F97kRFC8=;
 b=YnYyPmBOlhkedqguSTH9RTGZyKk1uDYl/Xq7oL6OjEEjhAOnpLMMuX+a
 vkl01XH7Q3doSCtI5hWrkBDiO7noEQJhSZVa+U4ogzrN8hTDuUhL/0/yT
 nVyVIF/uOujKhlCwQLNNEfM2XGFdwBNVSwkgdt++TaVZB7IAybGC9741a
 j18cLwuGq5GC49fqh3j2/T0FZJBvJMCTW3csmTtSEfAXJgoZbNZo1ky6K
 rvn4Yt1JtL+Wn4u0M39B2xRE0waAH+2OA9QfZFVS6NTOQsO2RJ5YA6gkU
 7MCCrWUwVdknjUaXtWpMvGcO13FMVwxZo0/mb32n/MyXpufPuC72gQREd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317090289"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="317090289"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 14:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736563929"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="736563929"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2023 14:04:59 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Date: Thu, 23 Feb 2023 14:04:58 -0800
Message-Id: <20230223220458.520815-1-alan.previn.teres.alexis@intel.com>
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
   v3: - Add get/put runtime-pm for this function. Though
         not functionally required during unload, its so the uncore
	 doesn't complain.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
---
 drivers/gpu/drm/i915/intel_uncore.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index f018da7ebaac..9832b8ac8b1a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2724,10 +2724,13 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
 	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
+	intel_wakeref_t wakeref;
 	int ret;
 
 	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
 
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
 	/*
 	 * Make sure any pending FLR requests have cleared by waiting for the
 	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
@@ -2742,22 +2745,36 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 		drm_err(&i915->drm,
 			"Failed to wait for Driver-FLR bit to clear! %d\n",
 			ret);
-		return;
+		goto out;
 	}
 	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
 
 	/* Trigger the actual Driver-FLR */
 	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
 
+	/* Wait for hardware teardown to complete */
+	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
+					 DRIVERFLR_STATUS, 0,
+					 flr_timeout_ms);
+	if (ret) {
+		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
+		goto out;
+	}
+
+	/* Wait for hardware/firmware re-init to complete */
 	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
 					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
 					 flr_timeout_ms);
 	if (ret) {
-		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
-		return;
+		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
+		goto out;
 	}
 
+	/* Clear sticky completion status */
 	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
+
+out:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
 
 /* Called via drm-managed action */
-- 
2.39.0

