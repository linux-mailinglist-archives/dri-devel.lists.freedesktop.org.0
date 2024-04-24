Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D138D8B12FB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4D113D4B;
	Wed, 24 Apr 2024 18:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIoTr8RG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6BF113D46;
 Wed, 24 Apr 2024 18:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713984856; x=1745520856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DuAi+yQVH+7iHB0X2UCGEMciYlsXfzM/LAIVbamLwXE=;
 b=eIoTr8RGXVRHTC1uJq+aki4mwt7yZDgHXP17/wKeWf3AqLURipQ3lQu6
 WxcnAk772ueHKmifCA+4iIq31YmFptWo4Dt+QQMlLhf8/Nyk282ImiuHt
 zuC0W+FoFgrcZhESTSHZvE+pOv2MWZGyEJaSl4ttYr5jErdouYUDmTCQI
 3Z08M3Efm81gQWtX8jhVvKYXedS2UriTLgnrPQwYgJons4iLKCDwFko6G
 drczSoS7U5JDQg9iapRyCB5ZbkFnglOMSphZoog5ThlEKvz9iIP8Gtpsr
 b84Phdamjw/iSfmvnlUy053RUsd8bBj0qhcaqgCqowQi0DRMqoeAknm03 w==;
X-CSE-ConnectionGUID: lsTC2SUlS2iT6SShT88BpQ==
X-CSE-MsgGUID: G3cb+j7uTb+YU3IzhkwXEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21061137"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21061137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 11:54:16 -0700
X-CSE-ConnectionGUID: 0xAowUfdRUGk7t5nUgAnsQ==
X-CSE-MsgGUID: wBF1EO/GQvqASboSgYU+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="25240517"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 24 Apr 2024 11:54:14 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Date: Thu, 25 Apr 2024 00:08:20 +0530
Message-Id: <20240424183820.3591593-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240424183820.3591593-1-animesh.manna@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
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
 drivers/gpu/drm/i915/display/intel_alpm.c     | 48 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  2 +
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index b08799586b58..2d3027c2fb0a 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -343,3 +343,51 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
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
+	bool lobf_enabled;
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
+	seq_printf(m, "LOBF Criteria met: %s\n", str_yes_no(crtc_state->has_lobf));
+
+	cpu_transcoder = crtc_state->cpu_transcoder;
+	lobf_enabled = intel_de_read(dev_priv, ALPM_CTL(cpu_transcoder)) & ALPM_CTL_LOBF_ENABLE;
+	seq_printf(m, "LOBF status: %s\n", str_enabled_disabled(lobf_enabled));
+
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
index a9ca190da3e4..01fd08eb96f5 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -11,6 +11,7 @@
 struct intel_dp;
 struct intel_crtc_state;
 struct drm_connector_state;
+struct intel_connector;
 
 bool intel_alpm_get_aux_less_status(struct intel_dp *intel_dp);
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

