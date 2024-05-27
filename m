Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF78CFBD0
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496E210F27F;
	Mon, 27 May 2024 08:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoEs/vc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7A10EA65;
 Mon, 27 May 2024 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716799390; x=1748335390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3sa3lpEiwx9HTVK8LslboedQYY6sDl3RKopOjsBMOKs=;
 b=HoEs/vc4Y5pHd4UByC6Zq69cxTrsOIDmLTW/eTTOCxWnMcie/hviZVSG
 70zN3cUQkfgwHBAacWv5Ormt0QVuhk7ngdf+JBbZ4PWH4VAJEIIBclWxA
 qK8kryQZD/uoa8XjEEhRCVFjgsvj59MCQju2xzj1u+gwcL0GRM3/SS/Dr
 7GBwm0j6Z6DM12IYIhcARiRg5fPJldyQJH13m5Q2jg3U3R4/Evkm/9G8v
 G+w3nuO4p1AAzEnoFUPXO5s0ZgDnNg3yT8+2qfJE6R8+o+6cURncEJzIn
 0zTc3nRvusoXmGl8JWxm0B6MaeurneSfCwlfK5cLPqwDk/5mlPxq81Fby g==;
X-CSE-ConnectionGUID: Gz3wxTqKSl2tRKRePmSUTw==
X-CSE-MsgGUID: hHP50eEwRwODBtMz+jjRvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13049015"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13049015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 01:43:08 -0700
X-CSE-ConnectionGUID: 5qY789XwR6C+NzgbaYSCDg==
X-CSE-MsgGUID: 0iMhrMJbSGq7FVptfGOkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34676864"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 01:43:06 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 6/6] drm/i915/alpm: Add debugfs for LOBF
Date: Mon, 27 May 2024 13:56:36 +0530
Message-Id: <20240527082636.1519057-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240527082636.1519057-1-animesh.manna@intel.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
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
index a8ae5f65a250..a26716c14aa3 100644
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
index 80b9ca086a49..c82ecc7b4001 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -11,6 +11,7 @@
 struct intel_dp;
 struct intel_crtc_state;
 struct drm_connector_state;
+struct intel_connector;
 
 void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
@@ -20,4 +21,5 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
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

