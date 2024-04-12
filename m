Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA428A3337
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09BD10F752;
	Fri, 12 Apr 2024 16:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="led39kpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1959010E13F;
 Fri, 12 Apr 2024 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712938106; x=1744474106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v4dSY6UU08+eumVPDxg9CoMAwjK6OkLrBJPNASoloqQ=;
 b=led39kpC4WPt1lSqa8CPBLhAE/D0ywtFbR1XjqQ3MxjQEB9S88pKrvII
 kS25MXk7NKZRpBh45k7Jmr8g/5NVTk1wJ+SbUQAqeRiqK49B16WITPutA
 UOwKDOc2ke9k6AI+dzlwzagWqmskiEqOoTGSdSMevIlBHa5CQClr3PlDu
 ZEQ6cZFmHcrijjXDETQNB6IcIwkuoVt+Gjbivr9UsqHwMLGJybPaGN4K2
 WwfjTgnYoiDQWAlaSxbhm596SjzQ1niuS1m+15CfCGsz1dw0Q2B2tfSHS
 oTooh4/Puy3JI0gXdjSmAks4VnxVPx3T0WZx4QdObLht8rfXHsLUChIPU w==;
X-CSE-ConnectionGUID: 1tpXks5gQ+ej+krDUE7GQA==
X-CSE-MsgGUID: QVhAcKjhQqmOW91W+drrpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8256929"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8256929"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:08:25 -0700
X-CSE-ConnectionGUID: LfGW5F4mRYGfHWSiKXE2sg==
X-CSE-MsgGUID: wC1lkrgMTvy9PgzCw2WyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25964172"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 12 Apr 2024 09:08:24 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Date: Fri, 12 Apr 2024 21:22:43 +0530
Message-Id: <20240412155243.2891996-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240412155243.2891996-1-animesh.manna@intel.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
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

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 47 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  2 +
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index ae894c85233c..21dfc06952d7 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -339,3 +339,50 @@ void intel_alpm_configure(struct intel_dp *intel_dp)
 {
 	lnl_alpm_configure(intel_dp);
 }
+
+static int i915_edp_lobf_support_show(struct seq_file *m, void *data)
+{
+	struct intel_connector *connector = m->private;
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+
+	seq_printf(m, "LOBF support: = %s",
+		   str_yes_no(intel_dp->lobf_supported));
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_support);
+
+static int i915_edp_lobf_status_show(struct seq_file *m, void *data)
+{
+	struct intel_connector *connector = m->private;
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	const char *status;
+
+	if (intel_dp->lobf_enabled)
+		status = "enabled";
+	else
+		status = "disabled";
+
+	seq_printf(m, "LOBF: %s\n", status);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_status);
+
+void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
+{
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct dentry *root = connector->base.debugfs_entry;
+
+	if (DISPLAY_VER(i915) >= 20 &&
+	    connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
+		return;
+
+	debugfs_create_file("i915_edp_lobf_supported", 0444, root,
+			    connector, &i915_edp_lobf_support_fops);
+
+	debugfs_create_file("i915_edp_lobf_status", 0444, root,
+			    connector, &i915_edp_lobf_status_fops);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index c341d2c2b7f7..66e81ed8b2fb 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -11,6 +11,7 @@
 struct intel_dp;
 struct intel_crtc_state;
 struct drm_connector_state;
+struct intel_connector;
 
 bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
@@ -19,5 +20,6 @@ void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp);
+void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 0feffe8d4e45..ba1530149836 100644
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
@@ -1542,6 +1543,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 	intel_drrs_connector_debugfs_add(connector);
 	intel_pps_connector_debugfs_add(connector);
 	intel_psr_connector_debugfs_add(connector);
+	intel_alpm_lobf_debugfs_add(connector);
 
 	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-- 
2.29.0

