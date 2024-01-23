Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1563D838BF7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FBF10E77D;
	Tue, 23 Jan 2024 10:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824510F1A0;
 Tue, 23 Jan 2024 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005740; x=1737541740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21gjnB6xKEvCpVp21MyAr5xCVewaEhbxYUVJyJqjbeo=;
 b=n+foJV8lb06krVeEgz2g7AFkpHys0Md3GUXdeQL7bryasdcfvIrT6CpB
 kbpEzaqNsrV13/q0xJJkAwATlMoX5DVf0dhUYU1KNT4GXXzNkvT8p6VSM
 XRhDw6wNemHO6VY/sm6zm3cDzyyAq/aHaSKoxJEU3o0bFkgmq47rXjHHs
 v0/j/GENunIFolAqDDE0+xb31RGEoMkcLAuXoIZll6cDMzmAdI8uCh3T3
 daiUOF+Dk2ubbM+F5jDyNpex0zhSWekaPtti+MMlwjyaJea8HNlLrql5W
 v0/xXynMQf3PH3qANguT7BS7DKSV4u54P11qh0NFl/+nL8j83mx5fdgkp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134305"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134305"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283462"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283462"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:59 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/19] drm/i915/dp: Suspend/resume DP tunnels
Date: Tue, 23 Jan 2024 12:28:49 +0200
Message-Id: <20240123102850.390126-19-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
index 8ebfb039000f6..bc138a54f8d7b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -36,6 +36,7 @@
 #include <asm/byteorder.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dp_tunnel.h>
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
@@ -3320,18 +3321,21 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
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
+	intel_dp_tunnel_resume(intel_dp, dpcd_updated);
+
+	if (crtc_state)
+		intel_dp_reset_max_link_params(intel_dp);
 }
 
 bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
@@ -5973,6 +5977,8 @@ void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
 	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
 
 	intel_pps_vdd_off_sync(intel_dp);
+
+	intel_dp_tunnel_suspend(intel_dp);
 }
 
 void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
-- 
2.39.2

