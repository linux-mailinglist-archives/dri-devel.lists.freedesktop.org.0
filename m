Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CACB1298F8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 17:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7456E2D5;
	Mon, 23 Dec 2019 16:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039236E2D5;
 Mon, 23 Dec 2019 16:56:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 08:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,348,1571727600"; d="scan'208";a="418728904"
Received: from unknown (HELO amanna.iind.intel.com) ([10.223.74.53])
 by fmsmga006.fm.intel.com with ESMTP; 23 Dec 2019 08:56:21 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/i915/dp: Move vswing/pre-emphasis adjustment
 calculation
Date: Mon, 23 Dec 2019 22:15:37 +0530
Message-Id: <20191223164537.15285-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191219123310.GG1208@intel.com>
References: <20191219123310.GG1208@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com,
 Animesh Manna <animesh.manna@intel.com>, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vswing/pre-emphasis adjustment calculation is needed in processing
of auto phy compliance request other than link training, so moved
the same function in intel_dp.c.

No functional change.

v1: initial patch.
v2:
- used "intel_dp" prefix in function name. (Jani)
- used array notation instead pointer for link_status. (Ville)

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 34 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |  4 +++
 .../drm/i915/display/intel_dp_link_training.c | 32 -----------------
 3 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2f31d226c6eb..4703e533feb3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4110,6 +4110,40 @@ ivb_cpu_edp_signal_levels(u8 train_set)
 	}
 }
 
+void
+intel_dp_get_adjust_train(struct intel_dp *intel_dp,
+			  const u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	u8 v = 0;
+	u8 p = 0;
+	int lane;
+	u8 voltage_max;
+	u8 preemph_max;
+
+	for (lane = 0; lane < intel_dp->lane_count; lane++) {
+		u8 this_v = drm_dp_get_adjust_request_voltage(link_status,
+							      lane);
+		u8 this_p = drm_dp_get_adjust_request_pre_emphasis(link_status,
+								   lane);
+
+		if (this_v > v)
+			v = this_v;
+		if (this_p > p)
+			p = this_p;
+	}
+
+	voltage_max = intel_dp_voltage_max(intel_dp);
+	if (v >= voltage_max)
+		v = voltage_max | DP_TRAIN_MAX_SWING_REACHED;
+
+	preemph_max = intel_dp_pre_emphasis_max(intel_dp, v);
+	if (p >= preemph_max)
+		p = preemph_max | DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+
+	for (lane = 0; lane < 4; lane++)
+		intel_dp->train_set[lane] = v | p;
+}
+
 void
 intel_dp_set_signal_levels(struct intel_dp *intel_dp)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 3da166054788..83eadc87af26 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include <drm/i915_drm.h>
+#include <drm/drm_dp_helper.h>
 
 #include "i915_reg.h"
 
@@ -91,6 +92,9 @@ void
 intel_dp_program_link_training_pattern(struct intel_dp *intel_dp,
 				       u8 dp_train_pat);
 void
+intel_dp_get_adjust_train(struct intel_dp *intel_dp,
+			  const u8 link_status[DP_LINK_STATUS_SIZE]);
+void
 intel_dp_set_signal_levels(struct intel_dp *intel_dp);
 void intel_dp_set_idle_link_train(struct intel_dp *intel_dp);
 u8
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 2a1130dd1ad0..1e38584e7d56 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -34,38 +34,6 @@ intel_dp_dump_link_status(const u8 link_status[DP_LINK_STATUS_SIZE])
 		      link_status[3], link_status[4], link_status[5]);
 }
 
-static void
-intel_get_adjust_train(struct intel_dp *intel_dp,
-		       const u8 link_status[DP_LINK_STATUS_SIZE])
-{
-	u8 v = 0;
-	u8 p = 0;
-	int lane;
-	u8 voltage_max;
-	u8 preemph_max;
-
-	for (lane = 0; lane < intel_dp->lane_count; lane++) {
-		u8 this_v = drm_dp_get_adjust_request_voltage(link_status, lane);
-		u8 this_p = drm_dp_get_adjust_request_pre_emphasis(link_status, lane);
-
-		if (this_v > v)
-			v = this_v;
-		if (this_p > p)
-			p = this_p;
-	}
-
-	voltage_max = intel_dp_voltage_max(intel_dp);
-	if (v >= voltage_max)
-		v = voltage_max | DP_TRAIN_MAX_SWING_REACHED;
-
-	preemph_max = intel_dp_pre_emphasis_max(intel_dp, v);
-	if (p >= preemph_max)
-		p = preemph_max | DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
-
-	for (lane = 0; lane < 4; lane++)
-		intel_dp->train_set[lane] = v | p;
-}
-
 static bool
 intel_dp_set_link_train(struct intel_dp *intel_dp,
 			u8 dp_train_pat)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
