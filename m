Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFB1ED7D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 23:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AD389B55;
	Wed,  3 Jun 2020 21:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4FD89A1A;
 Wed,  3 Jun 2020 21:10:43 +0000 (UTC)
IronPort-SDR: iOuQRVm6YWb8CVRtq0hBSjyq9kggMXroBh0VQDImlelR8FrY0St+4PCl2Na/CgkX5w1dGTN54d
 LkxVWmBApahw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 14:10:42 -0700
IronPort-SDR: Fjp9V/KRVG6hXoKGf6PPZmXruKhjFsal9uhs7NVuJAtQV7jZL1P/Ez8KNWso6J+KYMTe6d1LQu
 25FchbGwwEsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,469,1583222400"; d="scan'208";a="269199540"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 03 Jun 2020 14:10:41 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/dp_mst: Fix disabling MST on a port
Date: Thu,  4 Jun 2020 00:10:38 +0300
Message-Id: <20200603211040.8190-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.23.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently MST on a port can get enabled/disabled from the hotplug work
and get disabled from the short pulse work in a racy way. Fix this by
relying on the MST state checking in the hotplug work and just schedule
a hotplug work from the short pulse handler if some problem happened
during the MST interrupt handling.

This removes the explicit MST disabling in case of an AUX failure, but
if AUX fails, then probably the detection will also fail during the
scheduled hotplug work and it's not guaranteed that we'll see
intermittent errors anyway.

While at it also simplify the error checking of the MST interrupt
handler.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 33 +++----------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 55fda074c0ad..befbcacddaa1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5604,7 +5604,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 		}
 	}
 
-	return need_retrain;
+	return need_retrain ? -EINVAL : 0;
 }
 
 static bool
@@ -7255,35 +7255,10 @@ intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
 	}
 
 	if (intel_dp->is_mst) {
-		switch (intel_dp_check_mst_status(intel_dp)) {
-		case -EINVAL:
-			/*
-			 * If we were in MST mode, and device is not
-			 * there, get out of MST mode
-			 */
-			drm_dbg_kms(&i915->drm,
-				    "MST device may have disappeared %d vs %d\n",
-				    intel_dp->is_mst,
-				    intel_dp->mst_mgr.mst_state);
-			intel_dp->is_mst = false;
-			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
-							intel_dp->is_mst);
-
-			return IRQ_NONE;
-		case 1:
-			return IRQ_NONE;
-		default:
-			break;
-		}
-	}
-
-	if (!intel_dp->is_mst) {
-		bool handled;
-
-		handled = intel_dp_short_pulse(intel_dp);
-
-		if (!handled)
+		if (intel_dp_check_mst_status(intel_dp) < 0)
 			return IRQ_NONE;
+	} else if (!intel_dp_short_pulse(intel_dp)) {
+		return IRQ_NONE;
 	}
 
 	return IRQ_HANDLED;
-- 
2.23.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
