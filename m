Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C464585C82F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846A10E56F;
	Tue, 20 Feb 2024 21:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnum7Z2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1F10E59F;
 Tue, 20 Feb 2024 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463929; x=1739999929;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BTe7GQhOeDHcOo48vdyZlV595EUjWwTAyYUtJV+/aUs=;
 b=hnum7Z2OqVIFiRWfFmlcwHOGlx/MdjmaMJHB8MkFFbSIVUSK0ADSJNZh
 2jf3hDVhH/T6H0oMc6b/vllw9AdK28Df511/OssZ7uKsrJkbKeSGLFZYC
 92YBMHGrZCNsbDFBoRkjkVDCSONlbVAKPIHDWkTqgETT0jtuDhEZwM74x
 GQck7OuSOAYyIvpeAYsK4wFqcwX9xsPewCCShXe5Y3AtpGQpGef2W0j7n
 Qge4thLDUDV3i+JgWM9ArX0cMmzuICLS8YMmgIqB55sKyW8jaJS+2jWVX
 ulmhq7t+Vbd1hgUWyf3QHVs1fDtuS97R5YqOLpTMKhQYJzoU+nGrcJ3YE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738679"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061647"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:47 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/21] drm/i915/dp: Suspend/resume DP tunnels
Date: Tue, 20 Feb 2024 23:18:39 +0200
Message-Id: <20240220211841.448846-20-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Suspend and resume DP tunnels during system suspend/resume, disabling
the BW allocation mode during suspend, re-enabling it after resume. This
reflects the link's BW management component (Thunderbolt CM) disabling
BWA during suspend. Before any BW requests the driver must read the
sink's DPRX capabilities (since the BW manager requires this
information, so snoops for it on AUX), so ensure this read takes place.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a3dfcbb710027..35ef17439038a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -36,6 +36,7 @@
 #include <asm/byteorder.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dp_tunnel.h>
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
@@ -3313,18 +3314,21 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state)
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
-
-	if (!crtc_state)
-		return;
+	bool dpcd_updated = false;
 
 	/*
 	 * Don't clobber DPCD if it's been already read out during output
 	 * setup (eDP) or detect.
 	 */
-	if (intel_dp->dpcd[DP_DPCD_REV] == 0)
+	if (crtc_state && intel_dp->dpcd[DP_DPCD_REV] == 0) {
 		intel_dp_get_dpcd(intel_dp);
+		dpcd_updated = true;
+	}
 
-	intel_dp_reset_max_link_params(intel_dp);
+	intel_dp_tunnel_resume(intel_dp, crtc_state, dpcd_updated);
+
+	if (crtc_state)
+		intel_dp_reset_max_link_params(intel_dp);
 }
 
 bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
@@ -5947,6 +5951,8 @@ void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
 	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
 
 	intel_pps_vdd_off_sync(intel_dp);
+
+	intel_dp_tunnel_suspend(intel_dp);
 }
 
 void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
-- 
2.39.2

