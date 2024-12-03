Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFEA9E21C7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C457510EA5B;
	Tue,  3 Dec 2024 15:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFJZNuAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CA510EA59;
 Tue,  3 Dec 2024 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733239043; x=1764775043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LSnWuW6AOkZ1QIwXhQrr08qRTaQeTbpOr8jxXtK38OE=;
 b=mFJZNuAP4CHWCJlkEwDcoJW8slbDk2JZ7qYoQM4hQkTHzROO/uuEIJan
 /+0yT59ltvZm3/j1qlJNrMMpJVvvwmt4YbXn5z7EImIJd0Jm+l+yQ8Gix
 lvSWv514s5wiAI5pZDtPhJTTbE6V5g7X/Wmj6E5A6pdkTgU+ShzHWTq+3
 ePyozUKLdVX2LvklMNj1qC+76ZOLhXvdcA77Lx7rI6Oju00S0LfBE1CsB
 U+NTEzDUc/xzoyZ7VzIWBycYQvI+g76vleYb6NZwP2jiRXRWBmQEEvtwX
 l2pvrq5DyqGIeAdBSTVTk0o6a/WW0krsl9vv1CgrT0anvKS6EnwDjvJuG w==;
X-CSE-ConnectionGUID: j+hKFUX1SfmDabIgex0jkA==
X-CSE-MsgGUID: SRDUu3WsTJ2/F9wnTO1aiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33708764"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33708764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:23 -0800
X-CSE-ConnectionGUID: 3FfjGUtBQye5MGRgVel89w==
X-CSE-MsgGUID: CjINd40WTvyjHOI+D7IFAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97526210"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 1/3] drm/dp: extract drm_dp_dpcd_poll_act_handled()
Date: Tue,  3 Dec 2024 17:17:08 +0200
Message-Id: <459fd3e96a55a8ea8ada8d27d93eaa24c235f9c1.1733238941.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733238940.git.jani.nikula@intel.com>
References: <cover.1733238940.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

SST with 128b/132b channel coding needs this too. Extract to a separate
helper, independent of MST.

Pass timeout in as a parameter, anticipating that we can reduce the
timeout for SST.

v2: Clean up kernel-doc a bit

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 54 ++++++++++++++++++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 36 +------------
 include/drm/display/drm_dp_helper.h           |  2 +
 3 files changed, 57 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6ee51003de3c..fdb55c462d64 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -22,15 +22,16 @@
 
 #include <linux/backlight.h>
 #include <linux/delay.h>
+#include <linux/dynamic_debug.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
-#include <linux/dynamic_debug.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -779,6 +780,57 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
 
+static int read_payload_update_status(struct drm_dp_aux *aux)
+{
+	int ret;
+	u8 status;
+
+	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
+	if (ret < 0)
+		return ret;
+
+	return status;
+}
+
+/**
+ * drm_dp_dpcd_poll_act_handled() - Poll for ACT handled status
+ * @aux: DisplayPort AUX channel
+ * @timeout_ms: Timeout in ms
+ *
+ * Try waiting for the sink to finish updating its payload table by polling for
+ * the ACT handled bit of DP_PAYLOAD_TABLE_UPDATE_STATUS for up to @timeout_ms
+ * milliseconds, defaulting to 3000 ms if 0.
+ *
+ * Returns:
+ * 0 if the ACT was handled in time, negative error code on failure.
+ */
+int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms)
+{
+	int ret, status;
+
+	/* default to 3 seconds, this is arbitrary */
+	timeout_ms = timeout_ms ?: 3000;
+
+	ret = readx_poll_timeout(read_payload_update_status, aux, status,
+				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
+				 200, timeout_ms * USEC_PER_MSEC);
+	if (ret < 0 && status >= 0) {
+		drm_err(aux->drm_dev, "Failed to get ACT after %d ms, last status: %02x\n",
+			timeout_ms, status);
+		return -EINVAL;
+	} else if (status < 0) {
+		/*
+		 * Failure here isn't unexpected - the hub may have
+		 * just been unplugged
+		 */
+		drm_dbg_kms(aux->drm_dev, "Failed to read payload table status: %d\n", status);
+		return status;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_dpcd_poll_act_handled);
+
 static bool is_edid_digital_input_dp(const struct drm_edid *drm_edid)
 {
 	/* FIXME: get rid of drm_edid_raw() */
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e6ee180815b2..32481628fa89 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -29,7 +29,6 @@
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
-#include <linux/iopoll.h>
 
 #if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
 #include <linux/stacktrace.h>
@@ -4726,18 +4725,6 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 	return ret;
 }
 
-static int do_get_act_status(struct drm_dp_aux *aux)
-{
-	int ret;
-	u8 status;
-
-	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
-	if (ret < 0)
-		return ret;
-
-	return status;
-}
-
 /**
  * drm_dp_check_act_status() - Polls for ACT handled status.
  * @mgr: manager to use
@@ -4755,28 +4742,9 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 	 * There doesn't seem to be any recommended retry count or timeout in
 	 * the MST specification. Since some hubs have been observed to take
 	 * over 1 second to update their payload allocations under certain
-	 * conditions, we use a rather large timeout value.
+	 * conditions, we use a rather large timeout value of 3 seconds.
 	 */
-	const int timeout_ms = 3000;
-	int ret, status;
-
-	ret = readx_poll_timeout(do_get_act_status, mgr->aux, status,
-				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
-				 200, timeout_ms * USEC_PER_MSEC);
-	if (ret < 0 && status >= 0) {
-		drm_err(mgr->dev, "Failed to get ACT after %dms, last status: %02x\n",
-			timeout_ms, status);
-		return -EINVAL;
-	} else if (status < 0) {
-		/*
-		 * Failure here isn't unexpected - the hub may have
-		 * just been unplugged
-		 */
-		drm_dbg_kms(mgr->dev, "Failed to read payload table status: %d\n", status);
-		return status;
-	}
-
-	return 0;
+	return drm_dp_dpcd_poll_act_handled(mgr->aux, 3000);
 }
 EXPORT_SYMBOL(drm_dp_check_act_status);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 279624833ea9..38eea21d1082 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -567,6 +567,8 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 				     enum drm_dp_phy dp_phy,
 				     u8 link_status[DP_LINK_STATUS_SIZE]);
 
+int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms);
+
 bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 				    u8 real_edid_checksum);
 
-- 
2.39.5

