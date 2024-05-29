Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6733F8D3F90
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 22:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036311A111;
	Wed, 29 May 2024 20:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9K8CQU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398A10FAAF;
 Wed, 29 May 2024 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717014255; x=1748550255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmnmOHh0pHN5fMa3w0j3k/cIdJzo+G0eU+KofPw6dQ8=;
 b=l9K8CQU+TIYI7Si4z0uMuHWSIeHRiJivgjYqGNLN9KBuXIOBTOVpeJ1g
 c6kBcXz5ItkQo/b9CuqVmRihYVKtKF5MA/KneaRb7s+3MMo7iQ17atN6w
 aylhPO+vsE2+wtpQd1v2qaDmUohVkmWo0OQJoGc6FWgRXB9kinf1r+N8O
 A+B5pqwKOJYqyb0azVU6vg6/Y/tvpjx+JLrTXOx250CWJZl/hBSW3eIhB
 Ka9zz1ID1tsySztALs4Eo6GHUMGrI3cVdYQ3bdS+wq0foKTmjrsaFBCLL
 OFOHxWB/dCL9IU1I4x3ZM3gLDYPAjdsq6BgkE716w9mJKqgN1ZQrmUs2k g==;
X-CSE-ConnectionGUID: ZgDr93WLSDeSdoN64BQ5LA==
X-CSE-MsgGUID: ASNYATDLTsqgrMSnwbRRJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13397249"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13397249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:24:15 -0700
X-CSE-ConnectionGUID: xxGS//PGTXaM4/3+k2rs2g==
X-CSE-MsgGUID: 26Cy7CvBQ9OuSUXXoTOFEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66760031"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 13:24:13 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v7 6/6] drm/i915/alpm: Add debugfs for LOBF
Date: Thu, 30 May 2024 01:37:42 +0530
Message-Id: <20240529200742.1694401-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240529200742.1694401-1-animesh.manna@intel.com>
References: <20240529200742.1694401-1-animesh.manna@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For validation purpose add debugfs for LOBF.

v1: Initial version.
v2: Add aux-wake/less info along with lobf status. [Jouni]

Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
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

