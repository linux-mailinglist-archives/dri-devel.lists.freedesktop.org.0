Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B895C7A91C3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 08:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E3610E56C;
	Thu, 21 Sep 2023 06:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8A910E56A;
 Thu, 21 Sep 2023 06:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695277518; x=1726813518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Strhk3rn05dwRerP2jDgwNMgPmjZj50iXPW8jbH3r0o=;
 b=Q/ZHTiXFZ8thiEQwuIibLmOs/iJm46OlZ5BsRplINPNOMAhLW3Ls4zn6
 8pBCOTCakRZwWzPGBwG/0yDGxeevHOPdKEH1pxqDdad93Q+tQVj72KJ33
 JluQe/t2NKJOdw06XB/vXTGJj1D63ZsKyZsEvp4bYid9UxZ2AuNOgQxbx
 zm/YiliYQ21Z/f34CeIRTScuBe5sGLgEDLU6k1Uc5wOn8T2FzSNWI6RAt
 9XUeWYe3dESoGG/JadKmvDQbYdl8BrdB9+LuXh5vrDjntggfylQQp8Q/D
 fpctAp3t12lAqb/khX+AVdmC/y4xpZRzRiS1CYD6ib4qKwrDjag6GrSAd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379314139"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="379314139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812488228"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="812488228"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 23:25:15 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 6/6] drm/i915/panelreplay: Debugfs support for panel replay
Date: Thu, 21 Sep 2023 11:43:35 +0530
Message-Id: <20230921061335.454818-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230921061335.454818-1-animesh.manna@intel.com>
References: <20230921061335.454818-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, jouni.hogander@intel.com,
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add debugfs support which will print source and sink status
per connector basis.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 132 +++++++++++++++++------
 1 file changed, 97 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 67337b4a421b..65f22e4ff3b2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2834,6 +2834,25 @@ static int psr_get_status_and_error_status(struct intel_dp *intel_dp,
 	return 0;
 }
 
+static int panel_replay_get_status_and_error_status(struct intel_dp *intel_dp,
+						    u8 *status, u8 *error_status)
+{
+	struct drm_dp_aux *aux = &intel_dp->aux;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(aux, DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS, status);
+	if (ret != 1)
+		return ret;
+
+	ret = drm_dp_dpcd_readb(aux, DP_PANEL_REPLAY_ERROR_STATUS, error_status);
+	if (ret != 1)
+		return ret;
+
+	*status = *status & DP_PSR_SINK_STATE_MASK;
+
+	return 0;
+}
+
 static void psr_alpm_check(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
@@ -3046,7 +3065,7 @@ psr_source_status(struct intel_dp *intel_dp, struct seq_file *m)
 			status = live_status[status_val];
 	}
 
-	seq_printf(m, "Source PSR status: %s [0x%08x]\n", status, val);
+	seq_printf(m, "Source PSR/PanelReplay status: %s [0x%08x]\n", status, val);
 }
 
 static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
@@ -3059,18 +3078,23 @@ static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
 	bool enabled;
 	u32 val;
 
-	seq_printf(m, "Sink support: %s", str_yes_no(psr->sink_support));
-	if (psr->sink_support)
+	seq_printf(m, "Sink support: PSR = %s, Panel Replay = %s",
+		   str_yes_no(psr->sink_support),
+		   str_yes_no(psr->sink_panel_replay_support));
+
+	if (psr->sink_support || psr->sink_panel_replay_support)
 		seq_printf(m, " [0x%02x]", intel_dp->psr_dpcd[0]);
 	seq_puts(m, "\n");
 
-	if (!psr->sink_support)
+	if (!(psr->sink_support || psr->sink_panel_replay_support))
 		return 0;
 
 	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 	mutex_lock(&psr->lock);
 
-	if (psr->enabled)
+	if (psr->panel_replay_enabled)
+		status = "Panel Replay Enabled";
+	else if (psr->enabled)
 		status = psr->psr2_enabled ? "PSR2 enabled" : "PSR1 enabled";
 	else
 		status = "disabled";
@@ -3083,14 +3107,17 @@ static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
 		goto unlock;
 	}
 
-	if (psr->psr2_enabled) {
+	if (psr->panel_replay_enabled) {
+		val = intel_de_read(dev_priv, TRANS_DP2_CTL(cpu_transcoder));
+		enabled = val & TRANS_DP2_PANEL_REPLAY_ENABLE;
+	} else if (psr->psr2_enabled) {
 		val = intel_de_read(dev_priv, EDP_PSR2_CTL(cpu_transcoder));
 		enabled = val & EDP_PSR2_ENABLE;
 	} else {
 		val = intel_de_read(dev_priv, psr_ctl_reg(dev_priv, cpu_transcoder));
 		enabled = val & EDP_PSR_ENABLE;
 	}
-	seq_printf(m, "Source PSR ctl: %s [0x%08x]\n",
+	seq_printf(m, "Source PSR/PanelReplay ctl: %s [0x%08x]\n",
 		   str_enabled_disabled(enabled), val);
 	psr_source_status(intel_dp, m);
 	seq_printf(m, "Busy frontbuffer bits: 0x%08x\n",
@@ -3232,6 +3259,7 @@ static int i915_psr_sink_status_show(struct seq_file *m, void *data)
 {
 	struct intel_connector *connector = m->private;
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_psr *psr = &intel_dp->psr;
 	static const char * const sink_status[] = {
 		"inactive",
 		"transition to active, capture and display",
@@ -3242,45 +3270,82 @@ static int i915_psr_sink_status_show(struct seq_file *m, void *data)
 		"reserved",
 		"sink internal error",
 	};
+	static const char * const panel_replay_status[] = {
+		"Sink device frame is locked to the Source device",
+		"Sink device is coasting, using the VTotal target",
+		"Sink device is governing the frame rate (frame rate unlock is granted)",
+		"Sink device in the process of re-locking with the Source device",
+	};
 	const char *str;
 	int ret;
 	u8 status, error_status;
 
-	if (!CAN_PSR(intel_dp)) {
-		seq_puts(m, "PSR Unsupported\n");
+	if (!(CAN_PSR(intel_dp) || CAN_PANEL_REPLAY(intel_dp))) {
+		seq_puts(m, "PSR/Panel-Replay Unsupported\n");
 		return -ENODEV;
 	}
 
 	if (connector->base.status != connector_status_connected)
 		return -ENODEV;
 
-	ret = psr_get_status_and_error_status(intel_dp, &status, &error_status);
-	if (ret)
-		return ret;
+	if (psr->panel_replay_enabled) {
+		u32 temp;
 
-	status &= DP_PSR_SINK_STATE_MASK;
-	if (status < ARRAY_SIZE(sink_status))
-		str = sink_status[status];
-	else
-		str = "unknown";
+		ret = panel_replay_get_status_and_error_status(intel_dp, &status, &error_status);
+		if (ret)
+			return ret;
 
-	seq_printf(m, "Sink PSR status: 0x%x [%s]\n", status, str);
+		temp = status & DP_SINK_FRAME_LOCKED_MASK;
+		temp >>= DP_SINK_FRAME_LOCKED_SHIFT;
+		if (temp < ARRAY_SIZE(panel_replay_status))
+			str = panel_replay_status[temp];
+		else
+			str = "unknown";
 
-	seq_printf(m, "Sink PSR error status: 0x%x", error_status);
+		seq_printf(m, "Sink Panel Replay status: 0x%x [%s]\n", status, str);
 
-	if (error_status & (DP_PSR_RFB_STORAGE_ERROR |
-			    DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR |
-			    DP_PSR_LINK_CRC_ERROR))
-		seq_puts(m, ":\n");
-	else
-		seq_puts(m, "\n");
-	if (error_status & DP_PSR_RFB_STORAGE_ERROR)
-		seq_puts(m, "\tPSR RFB storage error\n");
-	if (error_status & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
-		seq_puts(m, "\tPSR VSC SDP uncorrectable error\n");
-	if (error_status & DP_PSR_LINK_CRC_ERROR)
-		seq_puts(m, "\tPSR Link CRC error\n");
+		seq_printf(m, "Sink Panel Replay error status: 0x%x", error_status);
+
+		if (error_status & (DP_PANEL_REPLAY_RFB_STORAGE_ERROR |
+				    DP_PANEL_REPLAY_VSC_SDP_UNCORRECTABLE_ERROR |
+				    DP_PANEL_REPLAY_LINK_CRC_ERROR))
+			seq_puts(m, ":\n");
+		else
+			seq_puts(m, "\n");
+		if (error_status & DP_PANEL_REPLAY_RFB_STORAGE_ERROR)
+			seq_puts(m, "\tPANEL-REPLAY RFB storage error\n");
+		if (error_status & DP_PANEL_REPLAY_VSC_SDP_UNCORRECTABLE_ERROR)
+			seq_puts(m, "\tPANEL-REPLAY VSC SDP uncorrectable error\n");
+		if (error_status & DP_PANEL_REPLAY_LINK_CRC_ERROR)
+			seq_puts(m, "\tPANEL-REPLAY Link CRC error\n");
+	} else {
+		ret = psr_get_status_and_error_status(intel_dp, &status, &error_status);
+		if (ret)
+			return ret;
+
+		status &= DP_PSR_SINK_STATE_MASK;
+		if (status < ARRAY_SIZE(sink_status))
+			str = sink_status[status];
+		else
+			str = "unknown";
+
+		seq_printf(m, "Sink PSR status: 0x%x [%s]\n", status, str);
 
+		seq_printf(m, "Sink PSR error status: 0x%x", error_status);
+
+		if (error_status & (DP_PSR_RFB_STORAGE_ERROR |
+				    DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR |
+				    DP_PSR_LINK_CRC_ERROR))
+			seq_puts(m, ":\n");
+		else
+			seq_puts(m, "\n");
+		if (error_status & DP_PSR_RFB_STORAGE_ERROR)
+			seq_puts(m, "\tPSR RFB storage error\n");
+		if (error_status & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
+			seq_puts(m, "\tPSR VSC SDP uncorrectable error\n");
+		if (error_status & DP_PSR_LINK_CRC_ERROR)
+			seq_puts(m, "\tPSR Link CRC error\n");
+	}
 	return ret;
 }
 DEFINE_SHOW_ATTRIBUTE(i915_psr_sink_status);
@@ -3299,13 +3364,10 @@ void intel_psr_connector_debugfs_add(struct intel_connector *connector)
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct dentry *root = connector->base.debugfs_entry;
 
-	if (connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
-		return;
-
 	debugfs_create_file("i915_psr_sink_status", 0444, root,
 			    connector, &i915_psr_sink_status_fops);
 
-	if (HAS_PSR(i915))
+	if (HAS_PSR(i915) || HAS_DP20(i915))
 		debugfs_create_file("i915_psr_status", 0444, root,
 				    connector, &i915_psr_status_fops);
 }
-- 
2.29.0

