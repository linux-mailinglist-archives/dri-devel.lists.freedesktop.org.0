Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4157920D9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC0F10E44D;
	Tue,  5 Sep 2023 07:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA95C10E451;
 Tue,  5 Sep 2023 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693900035; x=1725436035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Auv/YWjG7eUXLUwedrwDnrGpdbZcFF9PDUMVZmpu430=;
 b=HIZCD9RtaSsXquljln78cgGjdLpUD1sE0NaqVc7Sam19/e177KHgPnz3
 Dzpyn9IHpfrx6eassDFMVJbul4JzcUGCSMEk/t44ata0flVpONKxasBvC
 8YRqSdPYXGCdfj58npepRH8a71sPj6AaV4OKRjmLIqIpY7Tsu/kDcRBxB
 SxlBe7FcJjM5/uBXzyveuVBCpXwtktWDX7vd9jqN8yls/CYujueAceLgR
 0o+MdONL/lf+JVKRT53+Er0iriqOqM+9Knio2UubsATepNpOQG9oQewgZ
 8+v7X7MvUOaR8n1t2eh50u27f+50e5IFMDEDszGfmSxi9rEZI4AkTpJu8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443133702"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="443133702"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 00:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="855878528"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="855878528"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 00:47:11 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/6] drm/i915/panelreplay: Debugfs support for panel replay
Date: Tue,  5 Sep 2023 13:05:51 +0530
Message-Id: <20230905073551.958368-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230905073551.958368-1-animesh.manna@intel.com>
References: <20230905073551.958368-1-animesh.manna@intel.com>
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
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add debugfs support which will print source and sink status
per connector basis.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 70 ++++++++++++++++--------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5cbf08a4c94c..f50f110feb09 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3044,7 +3044,7 @@ psr_source_status(struct intel_dp *intel_dp, struct seq_file *m)
 			status = live_status[status_val];
 	}
 
-	seq_printf(m, "Source PSR status: %s [0x%08x]\n", status, val);
+	seq_printf(m, "Source PSR/PanelReplay status: %s [0x%08x]\n", status, val);
 }
 
 static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
@@ -3057,18 +3057,23 @@ static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
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
@@ -3081,14 +3086,17 @@ static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
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
@@ -3230,6 +3238,7 @@ static int i915_psr_sink_status_show(struct seq_file *m, void *data)
 {
 	struct intel_connector *connector = m->private;
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_psr *psr = &intel_dp->psr;
 	static const char * const sink_status[] = {
 		"inactive",
 		"transition to active, capture and display",
@@ -3240,27 +3249,47 @@ static int i915_psr_sink_status_show(struct seq_file *m, void *data)
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
-	u8 val;
+	u8 val, temp;
 
-	if (!CAN_PSR(intel_dp)) {
-		seq_puts(m, "PSR Unsupported\n");
+	if (!(CAN_PSR(intel_dp) || CAN_PANEL_REPLAY(intel_dp))) {
+		seq_puts(m, "PSR/Panel-Replay Unsupported\n");
 		return -ENODEV;
 	}
 
 	if (connector->base.status != connector_status_connected)
 		return -ENODEV;
 
-	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_PSR_STATUS, &val);
-	if (ret != 1)
-		return ret < 0 ? ret : -EIO;
+	if (psr->panel_replay_enabled) {
+		ret = drm_dp_dpcd_readb(&intel_dp->aux,
+					DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS, &val);
+		if (ret != 1)
+			return ret < 0 ? ret : -EIO;
 
-	val &= DP_PSR_SINK_STATE_MASK;
-	if (val < ARRAY_SIZE(sink_status))
-		str = sink_status[val];
-	else
-		str = "unknown";
+		temp = val & DP_SINK_FRAME_LOCKED_MASK;
+		temp >>= DP_SINK_FRAME_LOCKED_SHIFT;
+		if (temp < ARRAY_SIZE(panel_replay_status))
+			str = panel_replay_status[temp];
+		else
+			str = "unknown";
+	} else {
+		ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_PSR_STATUS, &val);
+		if (ret != 1)
+			return ret < 0 ? ret : -EIO;
+
+		val &= DP_PSR_SINK_STATE_MASK;
+		if (val < ARRAY_SIZE(sink_status))
+			str = sink_status[val];
+		else
+			str = "unknown";
+	}
 
 	seq_printf(m, "Sink PSR status: 0x%x [%s]\n", val, str);
 
@@ -3282,13 +3311,10 @@ void intel_psr_connector_debugfs_add(struct intel_connector *connector)
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

