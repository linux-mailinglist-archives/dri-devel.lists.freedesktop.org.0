Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB2153FE6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29B6FA12;
	Thu,  6 Feb 2020 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47B6F9D9;
 Thu,  6 Feb 2020 08:00:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so5950388wrr.1;
 Thu, 06 Feb 2020 00:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zx+DN1YnR63kKRGf+i4/7rJxFVE1UHdMKGvUOExQ05c=;
 b=O+CW60/7LUYZgLCu/7IroU4122jvNk9SYmvbjSiPgQtLP5Yi6tNBasKmvpVbL2k4Cr
 jXecwbtZnmdinzLpDiJShg22lfdZDMKPIAODN7OqtuIh9HyNQ/afsoOtew32NXin3UTi
 klQBG0QALfeE3z7szMa/U//VxGa9fQIYb2DGV51mavxqcjKkOfs90YgMLkKhxCCL2M52
 yETuHDWbwDgkpVzVMatj6v1uQ/zxDNio2eYYEEHGoDgmHBLD8rSNo1qlzmU3/O+bd6LJ
 ZuD105MvozrkZFSC4mvNva1sT6tAOdIJ7WlvGtA4NEVHp5GtBKYSGLdTgmGvgYKNaekA
 mP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zx+DN1YnR63kKRGf+i4/7rJxFVE1UHdMKGvUOExQ05c=;
 b=D9gmmMx++zUZlSUnOzTVCFMybbUWQjVtAt0f58JKhEGiWEklyRJA+eeP24nqg4ybaQ
 CaCJzoQLxNVltcbvzIZM5ADt1Ki6WhGhcpHarEiKup291dS/s3FGFya3kCIqyIftXTl7
 A6z5ZwN1/xUalNPAOSL9TOJhBBKmuInm+vhj04oqeRNcTNR06dcE3gjPbuW/fcU8S8jS
 85wD7syy3dkVd4//gDiKDNY3bWNy8BfQ/IGS/1UPUOw57C7OClAw72BUUldsty03lwX2
 ugRXaLJg4sxlxc8U+Oj/p/N8C8AlSWp7LJLAODKUybVdD7xi+6GsZ1kunrem3QBlPdI4
 z2rA==
X-Gm-Message-State: APjAAAX+qwJ1kIEJTVI5mcJUmFerSQPYI/q2qePNZctLA8lnQ0eP1HKp
 usJKyEcYs1ZbMqExE8LeC+I=
X-Google-Smtp-Source: APXvYqxPdFMRdfkaa8IlO6cyuAnDvV8Be6Z5pjiF1bg3MiNNDXGz50irnFzUlMHhNLrDPeMfu3vnyw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr2389619wrp.203.1580976030894; 
 Thu, 06 Feb 2020 00:00:30 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:30 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 02/12] drm/i915/dp_link_training: convert to drm_device
 based logging macros.
Date: Thu,  6 Feb 2020 11:00:03 +0300
Message-Id: <20200206080014.13759-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts various instances of the printk based drm logging macros to the
struct drm_device based logging macros in
i915/display/intel_dp_link_training.c.
This also involves extracting the drm_i915_private device pointer from
the intel_dp type to use in the various macros.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 75 ++++++++++++-------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 2a1130dd1ad0..a7defb37ab00 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -130,6 +130,7 @@ static bool intel_dp_link_max_vswing_reached(struct intel_dp *intel_dp)
 static bool
 intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 voltage;
 	int voltage_tries, cr_tries, max_cr_tries;
 	bool max_vswing_reached = false;
@@ -143,9 +144,11 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp)
 			      &link_bw, &rate_select);
 
 	if (link_bw)
-		DRM_DEBUG_KMS("Using LINK_BW_SET value %02x\n", link_bw);
+		drm_dbg_kms(&i915->drm,
+			    "Using LINK_BW_SET value %02x\n", link_bw);
 	else
-		DRM_DEBUG_KMS("Using LINK_RATE_SET value %02x\n", rate_select);
+		drm_dbg_kms(&i915->drm,
+			    "Using LINK_RATE_SET value %02x\n", rate_select);
 
 	/* Write the link configuration data */
 	link_config[0] = link_bw;
@@ -169,7 +172,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp)
 	if (!intel_dp_reset_link_train(intel_dp,
 				       DP_TRAINING_PATTERN_1 |
 				       DP_LINK_SCRAMBLING_DISABLE)) {
-		DRM_ERROR("failed to enable link training\n");
+		drm_err(&i915->drm, "failed to enable link training\n");
 		return false;
 	}
 
@@ -193,22 +196,23 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp)
 		drm_dp_link_train_clock_recovery_delay(intel_dp->dpcd);
 
 		if (!intel_dp_get_link_status(intel_dp, link_status)) {
-			DRM_ERROR("failed to get link status\n");
+			drm_err(&i915->drm, "failed to get link status\n");
 			return false;
 		}
 
 		if (drm_dp_clock_recovery_ok(link_status, intel_dp->lane_count)) {
-			DRM_DEBUG_KMS("clock recovery OK\n");
+			drm_dbg_kms(&i915->drm, "clock recovery OK\n");
 			return true;
 		}
 
 		if (voltage_tries == 5) {
-			DRM_DEBUG_KMS("Same voltage tried 5 times\n");
+			drm_dbg_kms(&i915->drm,
+				    "Same voltage tried 5 times\n");
 			return false;
 		}
 
 		if (max_vswing_reached) {
-			DRM_DEBUG_KMS("Max Voltage Swing reached\n");
+			drm_dbg_kms(&i915->drm, "Max Voltage Swing reached\n");
 			return false;
 		}
 
@@ -217,7 +221,8 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp)
 		/* Update training set as requested by target */
 		intel_get_adjust_train(intel_dp, link_status);
 		if (!intel_dp_update_link_train(intel_dp)) {
-			DRM_ERROR("failed to update link training\n");
+			drm_err(&i915->drm,
+				"failed to update link training\n");
 			return false;
 		}
 
@@ -231,7 +236,8 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp)
 			max_vswing_reached = true;
 
 	}
-	DRM_ERROR("Failed clock recovery %d times, giving up!\n", max_cr_tries);
+	drm_err(&i915->drm,
+		"Failed clock recovery %d times, giving up!\n", max_cr_tries);
 	return false;
 }
 
@@ -256,9 +262,11 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp)
 		return DP_TRAINING_PATTERN_4;
 	} else if (intel_dp->link_rate == 810000) {
 		if (!source_tps4)
-			DRM_DEBUG_KMS("8.1 Gbps link rate without source HBR3/TPS4 support\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "8.1 Gbps link rate without source HBR3/TPS4 support\n");
 		if (!sink_tps4)
-			DRM_DEBUG_KMS("8.1 Gbps link rate without sink TPS4 support\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "8.1 Gbps link rate without sink TPS4 support\n");
 	}
 	/*
 	 * Intel platforms that support HBR2 also support TPS3. TPS3 support is
@@ -271,9 +279,11 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp)
 		return  DP_TRAINING_PATTERN_3;
 	} else if (intel_dp->link_rate >= 540000) {
 		if (!source_tps3)
-			DRM_DEBUG_KMS(">=5.4/6.48 Gbps link rate without source HBR2/TPS3 support\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    ">=5.4/6.48 Gbps link rate without source HBR2/TPS3 support\n");
 		if (!sink_tps3)
-			DRM_DEBUG_KMS(">=5.4/6.48 Gbps link rate without sink TPS3 support\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    ">=5.4/6.48 Gbps link rate without sink TPS3 support\n");
 	}
 
 	return DP_TRAINING_PATTERN_2;
@@ -282,6 +292,7 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp)
 static bool
 intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int tries;
 	u32 training_pattern;
 	u8 link_status[DP_LINK_STATUS_SIZE];
@@ -295,7 +306,7 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp)
 	/* channel equalization */
 	if (!intel_dp_set_link_train(intel_dp,
 				     training_pattern)) {
-		DRM_ERROR("failed to start channel equalization\n");
+		drm_err(&i915->drm, "failed to start channel equalization\n");
 		return false;
 	}
 
@@ -303,7 +314,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp)
 
 		drm_dp_link_train_channel_eq_delay(intel_dp->dpcd);
 		if (!intel_dp_get_link_status(intel_dp, link_status)) {
-			DRM_ERROR("failed to get link status\n");
+			drm_err(&i915->drm,
+				"failed to get link status\n");
 			break;
 		}
 
@@ -311,23 +323,25 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp)
 		if (!drm_dp_clock_recovery_ok(link_status,
 					      intel_dp->lane_count)) {
 			intel_dp_dump_link_status(link_status);
-			DRM_DEBUG_KMS("Clock recovery check failed, cannot "
-				      "continue channel equalization\n");
+			drm_dbg_kms(&i915->drm,
+				    "Clock recovery check failed, cannot "
+				    "continue channel equalization\n");
 			break;
 		}
 
 		if (drm_dp_channel_eq_ok(link_status,
 					 intel_dp->lane_count)) {
 			channel_eq = true;
-			DRM_DEBUG_KMS("Channel EQ done. DP Training "
-				      "successful\n");
+			drm_dbg_kms(&i915->drm, "Channel EQ done. DP Training "
+				    "successful\n");
 			break;
 		}
 
 		/* Update training set as requested by target */
 		intel_get_adjust_train(intel_dp, link_status);
 		if (!intel_dp_update_link_train(intel_dp)) {
-			DRM_ERROR("failed to update link training\n");
+			drm_err(&i915->drm,
+				"failed to update link training\n");
 			break;
 		}
 	}
@@ -335,7 +349,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp)
 	/* Try 5 times, else fail and try at lower BW */
 	if (tries == 5) {
 		intel_dp_dump_link_status(link_status);
-		DRM_DEBUG_KMS("Channel equalization failed 5 times\n");
+		drm_dbg_kms(&i915->drm,
+			    "Channel equalization failed 5 times\n");
 	}
 
 	intel_dp_set_idle_link_train(intel_dp);
@@ -362,17 +377,19 @@ intel_dp_start_link_train(struct intel_dp *intel_dp)
 	if (!intel_dp_link_training_channel_equalization(intel_dp))
 		goto failure_handling;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Link Training Passed at Link Rate = %d, Lane count = %d",
-		      intel_connector->base.base.id,
-		      intel_connector->base.name,
-		      intel_dp->link_rate, intel_dp->lane_count);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "[CONNECTOR:%d:%s] Link Training Passed at Link Rate = %d, Lane count = %d",
+		    intel_connector->base.base.id,
+		    intel_connector->base.name,
+		    intel_dp->link_rate, intel_dp->lane_count);
 	return;
 
  failure_handling:
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Link Training failed at link rate = %d, lane count = %d",
-		      intel_connector->base.base.id,
-		      intel_connector->base.name,
-		      intel_dp->link_rate, intel_dp->lane_count);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "[CONNECTOR:%d:%s] Link Training failed at link rate = %d, lane count = %d",
+		    intel_connector->base.base.id,
+		    intel_connector->base.name,
+		    intel_dp->link_rate, intel_dp->lane_count);
 	if (!intel_dp_get_link_train_fallback_values(intel_dp,
 						     intel_dp->link_rate,
 						     intel_dp->lane_count))
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
