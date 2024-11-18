Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341BD9D1436
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6871710E250;
	Mon, 18 Nov 2024 15:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPr/rihJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E619C10E504;
 Mon, 18 Nov 2024 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731942908; x=1763478908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XkSAEyUgEgePIbW5D4sXjrjpWXMraYBOTfLPsCCus1w=;
 b=BPr/rihJdcn7PYlGbmXXwXgvR4MpBZL8fLyhKKGnW88A2HCijuGSB1eJ
 54iwQlUPJwvHrzXkyhWJmvwpnrLMMHpOp9I5dEFxvqkS+qUe6No31AAmb
 NZlmwnJtCqC9QD2ywa3MUukpQLqQtjZnPRkacdqQfHQssRy51G0lQOIiE
 YkopJMr5+LypD4qZ2eTe6yqVhflkJYn3AUmh6c1xV8kjVd4RZTPiX3glP
 0zVDsDbfOkVUVOu1539baWXyt5qGh/YbVYsBsh4oYy/qLYuFQk8G0sMwv
 wvXT49dVVCRY4+siZEl3EDuIS+rr7G/lOgHkM9v4+LdgycjiEJfXEd7iu Q==;
X-CSE-ConnectionGUID: HE8VDeRSSQi76sK0TEdtoA==
X-CSE-MsgGUID: BfqIw3otRTC23+59wCSyhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32139257"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32139257"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:08 -0800
X-CSE-ConnectionGUID: Z4t/gnRqRkaHSU3LsG+PtA==
X-CSE-MsgGUID: eGcTc8SbTFW2n8MUsvN6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89040799"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH 1/3] drm/dp: extract drm_dp_dpcd_poll_act_handled()
Date: Mon, 18 Nov 2024 17:14:52 +0200
Message-Id: <3d91f7b6639960fe688eb6ae0236254adae3e82d.1731942780.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1731942780.git.jani.nikula@intel.com>
References: <cover.1731942780.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 54 ++++++++++++++++++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 36 +------------
 include/drm/display/drm_dp_helper.h           |  2 +
 3 files changed, 57 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6ee51003de3c..b7e03bf02cd8 100644
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
+ * drm_dp_dpcd_poll_act_handled() - Polls for ACT handled status.
+ * @aux: DisplayPort AUX channel
+ * @timeout_ms: Timeout in ms
+ *
+ * Tries waiting for the sink to finish updating its payload table by polling
+ * for the ACT handled bit for up to @timeout_ms milliseconds, defaulting to
+ * 3000 ms if 0.
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
index ac90118b9e7a..2bdbc1eb282b 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -29,7 +29,6 @@
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
-#include <linux/iopoll.h>
 
 #if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
 #include <linux/stacktrace.h>
@@ -4723,18 +4722,6 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
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
@@ -4752,28 +4739,9 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
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

