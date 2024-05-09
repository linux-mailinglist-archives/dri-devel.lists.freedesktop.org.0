Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E48C0B2C
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 07:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C5210E2F4;
	Thu,  9 May 2024 05:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTBfUHFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84CC10E2F4;
 Thu,  9 May 2024 05:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715233688; x=1746769688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0kiCswv9uYYvHnA++SyybTdOdMPnZip/EerZbx3D6SA=;
 b=BTBfUHFlsDon2SX9UcPK7Jw2dtnSQie2OAY+tNQi6TD9eXTBZ3KDD6mw
 4UZAif93P+R5Okb0HJcUvbywA2bFvcD8h8Aj+nfFsxKYB6Zv8H5/Ei+st
 HDJMnLJbPOCZpdW7UL0FZR2nF3wTXXuwj/r0t1xkmeus2D7GUSDDxfURs
 U7H3uluDP5W4Uo9TiJkrcMgQkbQNjapIUOOiBhwz8JBB0/JezWtCujrlk
 YCS6qWa0eJlGV3JsYHUl3eDZOT+kPGn/IY9OO3kAUCKjWfF1VgZcH5VTp
 L85yif5N6/CcGVRxVTZojZLryri6zQIq1UVkRp76PEtLld8s9lJHeXpXo A==;
X-CSE-ConnectionGUID: pxChH77ZRGW9Sruy+N0Dig==
X-CSE-MsgGUID: laLs/4IRTuuvMYUlQJiujA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28645997"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="28645997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:48:07 -0700
X-CSE-ConnectionGUID: zq5+6Y/TTwGEyCoUteG44w==
X-CSE-MsgGUID: VoX/xFSpT3+dLufqW1nOtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33817648"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 08 May 2024 22:48:05 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 6/6] drm/i915/alpm: Add debugfs for LOBF
Date: Thu,  9 May 2024 11:01:55 +0530
Message-Id: <20240509053155.327071-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240509053155.327071-1-animesh.manna@intel.com>
References: <20240509053155.327071-1-animesh.manna@intel.com>
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
index c8eddc910cc5..b5b4c212de88 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -354,3 +354,52 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
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
index c0c085c1e5b0..8e1e0bbd44a3 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -11,6 +11,7 @@
 struct intel_dp;
 struct intel_crtc_state;
 struct drm_connector_state;
+struct intel_connector;
 
 enum alpm_mode intel_alpm_get_capability(struct intel_dp *intel_dp);
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

