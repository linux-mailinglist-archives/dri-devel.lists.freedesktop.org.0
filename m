Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D814838BF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2E10F409;
	Tue, 23 Jan 2024 10:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7C510F16D;
 Tue, 23 Jan 2024 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005738; x=1737541738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j7Q+HW1CbclKqHB1hHBsF+IV5inxkflp3LgPsMqWl3U=;
 b=TfLgVUr5mxkh0lWqgYy9p1mPUdlJX3sY7bVFJ56o2VCb22WZDFlYK4PA
 jLep+iwA07stserRPkCXFfUgwNSN4AKDNcT9VoccchuFUWIXiJ/MTz8Z9
 bfSlXS//HVM9r0Nle4+Xv1SQFLE2HFJeCgIkpNj0/ySp82SaUvZ2pQ6d7
 nukhBo4VrM8DIV7OrrjfJglLg213YD1yvti9wN12MKloCTiKzPxmuWiAk
 A1vOwq1t04VDn9uP8sYjWyqb4b/0+rTV8JnI8DXglBtOSONzEn0T6o7jN
 Y8KWpLAt/o3lUjbSLxmxZoyakDaSx8FUCoAnwHt5m938Qu1oo9BaBn+vX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134280"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134280"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283436"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283436"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:57 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 16/19] drm/i915/dp: Handle DP tunnel IRQs
Date: Tue, 23 Jan 2024 12:28:47 +0200
Message-Id: <20240123102850.390126-17-imre.deak@intel.com>
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

Handle DP tunnel IRQs a sink (or rather a BW management component like
the Thunderbolt Connection Manager) raises to signal the completion of a
BW request by the driver, or to signal any state change related to the
link BW.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 37 +++++++++++++++++++------
 include/drm/display/drm_dp.h            |  1 +
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6968fdb7ffcdf..8ebfb039000f6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4911,13 +4911,15 @@ static bool intel_dp_mst_link_status(struct intel_dp *intel_dp)
  * - %true if pending interrupts were serviced (or no interrupts were
  *   pending) w/o detecting an error condition.
  * - %false if an error condition - like AUX failure or a loss of link - is
- *   detected, which needs servicing from the hotplug work.
+ *   detected, or another condition - like a DP tunnel BW state change - needs
+ *   servicing from the hotplug work.
  */
 static bool
 intel_dp_check_mst_status(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	bool link_ok = true;
+	bool reprobe_needed = false;
 
 	drm_WARN_ON_ONCE(&i915->drm, intel_dp->active_mst_links < 0);
 
@@ -4944,6 +4946,13 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 
 		intel_dp_mst_hpd_irq(intel_dp, esi, ack);
 
+		if (esi[3] & DP_TUNNELING_IRQ) {
+			if (drm_dp_tunnel_handle_irq(i915->display.dp_tunnel_mgr,
+						     &intel_dp->aux))
+				reprobe_needed = true;
+			ack[3] |= DP_TUNNELING_IRQ;
+		}
+
 		if (!memchr_inv(ack, 0, sizeof(ack)))
 			break;
 
@@ -4954,7 +4963,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 			drm_dp_mst_hpd_irq_send_new_request(&intel_dp->mst_mgr);
 	}
 
-	return link_ok;
+	return link_ok && !reprobe_needed;
 }
 
 static void
@@ -5330,23 +5339,32 @@ static void intel_dp_check_device_service_irq(struct intel_dp *intel_dp)
 		drm_dbg_kms(&i915->drm, "Sink specific irq unhandled\n");
 }
 
-static void intel_dp_check_link_service_irq(struct intel_dp *intel_dp)
+static bool intel_dp_check_link_service_irq(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	bool reprobe_needed = false;
 	u8 val;
 
 	if (intel_dp->dpcd[DP_DPCD_REV] < 0x11)
-		return;
+		return false;
 
 	if (drm_dp_dpcd_readb(&intel_dp->aux,
 			      DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &val) != 1 || !val)
-		return;
+		return false;
+
+	if ((val & DP_TUNNELING_IRQ) &&
+	    drm_dp_tunnel_handle_irq(i915->display.dp_tunnel_mgr,
+				     &intel_dp->aux))
+		reprobe_needed = true;
 
 	if (drm_dp_dpcd_writeb(&intel_dp->aux,
 			       DP_LINK_SERVICE_IRQ_VECTOR_ESI0, val) != 1)
-		return;
+		return reprobe_needed;
 
 	if (val & HDMI_LINK_STATUS_CHANGED)
 		intel_dp_handle_hdmi_link_status_change(intel_dp);
+
+	return reprobe_needed;
 }
 
 /*
@@ -5367,6 +5385,7 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	u8 old_sink_count = intel_dp->sink_count;
+	bool reprobe_needed = false;
 	bool ret;
 
 	/*
@@ -5389,7 +5408,7 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
 	}
 
 	intel_dp_check_device_service_irq(intel_dp);
-	intel_dp_check_link_service_irq(intel_dp);
+	reprobe_needed = intel_dp_check_link_service_irq(intel_dp);
 
 	/* Handle CEC interrupts, if any */
 	drm_dp_cec_irq(&intel_dp->aux);
@@ -5416,10 +5435,10 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
 		 * FIXME get rid of the ad-hoc phy test modeset code
 		 * and properly incorporate it into the normal modeset.
 		 */
-		return false;
+		reprobe_needed = true;
 	}
 
-	return true;
+	return !reprobe_needed;
 }
 
 /* XXX this is probably wrong for multiple downstream ports */
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 8bfd5d007be8d..4891bd916d26a 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1081,6 +1081,7 @@
 # define STREAM_STATUS_CHANGED               (1 << 2)
 # define HDMI_LINK_STATUS_CHANGED            (1 << 3)
 # define CONNECTED_OFF_ENTRY_REQUESTED       (1 << 4)
+# define DP_TUNNELING_IRQ                    (1 << 5)
 
 #define DP_PSR_ERROR_STATUS                 0x2006  /* XXX 1.2? */
 # define DP_PSR_LINK_CRC_ERROR              (1 << 0)
-- 
2.39.2

