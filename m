Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD848C9BEB
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96DF10E63A;
	Mon, 20 May 2024 11:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGTpA5Zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3193E10E625;
 Mon, 20 May 2024 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716203088; x=1747739088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=57ZUdas4PgR36h9kw7njbc5Pp8988NXozKuYuFzg7d8=;
 b=jGTpA5Zg/J9lSvMkwLHxPJFH9MPsqe3Ycq9idDHSKYwlrBvmnfe/45Dt
 og7Ux5Uuw7zuB29T41O3qBcTDbIbOzHm46kBKrlRuY/lEwQ2iuObDKLzi
 wIZguKdkWDpNuPYlHPX/vcEnttdNO9toE6loTrGayatu7iveYRr8CQ8A8
 m08XCBzFNkMEXVJIDM6Mvk6TDmw4XHEvYGN/6BQFr9nEsSGzHDusEybO7
 8XWKAeVdlgIRSS/zpG6THgFd1FpswnvNpruW4CUIHV8KvBx5we9/wY4dy
 bkmwqcZ1oSrlcavfDeJuZl2tzgttziWThBvU+Ku7x53EM9T16LEpSJnBg g==;
X-CSE-ConnectionGUID: WCHItAeBRGGy3Cixte6oQg==
X-CSE-MsgGUID: VBtZBMqLSSeG3gX5mnUSkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22996399"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="22996399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 04:04:48 -0700
X-CSE-ConnectionGUID: qeG3BRaXRHGibvri9YctLw==
X-CSE-MsgGUID: APRsW1XlTaKlXXIwZHxtug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63723644"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 20 May 2024 04:04:46 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 6/6] drm/i915/alpm: Add debugfs for LOBF
Date: Mon, 20 May 2024 16:18:22 +0530
Message-Id: <20240520104822.1116122-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240520104822.1116122-1-animesh.manna@intel.com>
References: <20240520104822.1116122-1-animesh.manna@intel.com>
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

For validation purpose add debugfs for LOBF.

v1: Initial version.
v2: Add aux-wake/less info along with lobf status. [Jouni]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 49 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  2 +
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 8f4da817ef55..843ffb5fcb7a 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -360,3 +360,52 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
 {
 	lnl_alpm_configure(intel_dp, crtc_state);
 }
+
+static int i915_edp_lobf_info_show(struct seq_file *m, void *data)
+{
+	struct intel_connector *connector = m->private;
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_crtc *crtc;
+	struct intel_crtc_state *crtc_state;
+	enum transcoder cpu_transcoder;
+	u32 alpm_ctl;
+	int ret;
+
+	ret = drm_modeset_lock_single_interruptible(&dev_priv->drm.mode_config.connection_mutex);
+	if (ret)
+		return ret;
+
+	crtc = connector->base.state->crtc;
+	if (connector->base.status != connector_status_connected || !crtc) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	crtc_state = to_intel_crtc_state(crtc->state);
+	cpu_transcoder = crtc_state->cpu_transcoder;
+	alpm_ctl = intel_de_read(dev_priv, ALPM_CTL(dev_priv, cpu_transcoder));
+	seq_printf(m, "LOBF status: %s\n", str_enabled_disabled(alpm_ctl & ALPM_CTL_LOBF_ENABLE));
+	seq_printf(m, "Aux-wake alpm status: %s\n",
+		   str_enabled_disabled(!(alpm_ctl & ALPM_CTL_ALPM_AUX_LESS_ENABLE)));
+	seq_printf(m, "Aux-less alpm status: %s\n",
+		   str_enabled_disabled(alpm_ctl & ALPM_CTL_ALPM_AUX_LESS_ENABLE));
+out:
+	drm_modeset_unlock(&dev_priv->drm.mode_config.connection_mutex);
+
+	return ret;
+}
+
+DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_info);
+
+void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
+{
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct dentry *root = connector->base.debugfs_entry;
+
+	if (DISPLAY_VER(i915) < 20 ||
+	    connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
+		return;
+
+	debugfs_create_file("i915_edp_lobf_info", 0444, root,
+			    connector, &i915_edp_lobf_info_fops);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index fd9be8aa876c..0dab2068164a 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -11,6 +11,7 @@
 struct intel_dp;
 struct intel_crtc_state;
 struct drm_connector_state;
+struct intel_connector;
 
 void intel_alpm_get_capability(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
@@ -20,4 +21,5 @@ void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
 				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp,
 			  const struct intel_crtc_state *crtc_state);
+void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 35f9f86ef70f..86d9900c40af 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -13,6 +13,7 @@
 #include "i915_debugfs.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
+#include "intel_alpm.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_crtc_state_dump.h"
@@ -1515,6 +1516,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 	intel_drrs_connector_debugfs_add(connector);
 	intel_pps_connector_debugfs_add(connector);
 	intel_psr_connector_debugfs_add(connector);
+	intel_alpm_lobf_debugfs_add(connector);
 
 	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-- 
2.29.0

