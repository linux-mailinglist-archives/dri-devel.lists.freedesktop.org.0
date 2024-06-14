Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2369091D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945BC10EE0C;
	Fri, 14 Jun 2024 17:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ns+hZtZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC9110EE03;
 Fri, 14 Jun 2024 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386754; x=1749922754;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h3n5PwNAVx/9NfMHvIQK2/QA/doChwvnvOjTsWN49XI=;
 b=ns+hZtZ+pmjjldbM5Fjpq9g9hAN9YXRi2gjcZBCAFVAHie4CH0bycE56
 RIYOYYcmWE0uaWJ3CtgLEABr6o0y5/gGNM/1uDjZpa04o7ml18HbSz5L7
 fPsupAvB0XF1VLCO87N/zPv4dfVSKA9sdeiz5/QfQ8KeMCp03CJaA7ma+
 jNs+92hXR24dBGib5bVbsO9u+L/cUtsoxIkaULQau9CjAw+ZFh3UW3ONl
 oqBlqKL+/Cholmi+/fOJsVAE+SegBqtBFOh5udpfeYuVsuhQo9x3aj2ti
 J34H/EGHTWK9C+dvhEbNrFhbVFNKAJWUSfc7fGJL1q4JmrvhM/Swwp9AL Q==;
X-CSE-ConnectionGUID: o+WKsZxYRi2nGOCpTsIYNA==
X-CSE-MsgGUID: ZtU0pX8gR+6QHeDPeYokgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069348"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:13 -0700
X-CSE-ConnectionGUID: gIeSu5noTH+ZG5v1WRuZPw==
X-CSE-MsgGUID: BpErcX+vTpG6lb+F5TRpnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712473"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:12 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915: Dump DSC state to dmesg and
 debugfs/i915_display_info
Date: Fri, 14 Jun 2024 20:39:08 +0300
Message-ID: <20240614173911.3743172-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240614173911.3743172-1-imre.deak@intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
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

Dump the DSC state to dmesg during HW readout and state computation as
well as the i915_display_info debugfs entry.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../drm/i915/display/intel_crtc_state_dump.c  |  3 +++
 .../drm/i915/display/intel_display_debugfs.c  |  4 ++++
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 20 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.h     |  4 ++++
 4 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 6df526e189b5b..705ec5ad385c8 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -10,6 +10,7 @@
 #include "intel_crtc_state_dump.h"
 #include "intel_display_types.h"
 #include "intel_hdmi.h"
+#include "intel_vdsc.h"
 #include "intel_vrr.h"
 
 static void intel_dump_crtc_timings(struct drm_printer *p,
@@ -369,6 +370,8 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	else if (IS_VALLEYVIEW(i915))
 		vlv_dump_csc(&p, "wgc csc", &pipe_config->csc);
 
+	intel_vdsc_state_dump(&p, 0, pipe_config);
+
 dump_planes:
 	if (!state)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 91757fed9c6d2..c20a5097ea331 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -36,6 +36,7 @@
 #include "intel_pps.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
+#include "intel_vdsc.h"
 #include "intel_wm.h"
 
 static inline struct drm_i915_private *node_to_i915(struct drm_info_node *node)
@@ -551,6 +552,7 @@ static void crtc_updates_add(struct intel_crtc *crtc)
 static void intel_crtc_info(struct seq_file *m, struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
 	const struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_encoder *encoder;
@@ -581,6 +583,8 @@ static void intel_crtc_info(struct seq_file *m, struct intel_crtc *crtc)
 			   crtc_state->joiner_pipes,
 			   intel_crtc_is_joiner_secondary(crtc_state) ? "slave" : "master");
 
+	intel_vdsc_state_dump(&p, 1, crtc_state);
+
 	for_each_intel_encoder_mask(&dev_priv->drm, encoder,
 				    crtc_state->uapi.encoder_mask)
 		intel_encoder_info(m, crtc, encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index ffda11b417e24..ca1d8be659195 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -990,3 +990,23 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 out:
 	intel_display_power_put(dev_priv, power_domain, wakeref);
 }
+
+static void intel_vdsc_dump_state(struct drm_printer *p, int indent,
+				  const struct intel_crtc_state *crtc_state)
+{
+	drm_printf_indent(p, indent,
+			  "dsc-dss: compressed-bpp:" DRM_X16_FMT ", slice-count: %d, split: %s\n",
+			  DRM_X16_ARGS(crtc_state->dsc.compressed_bpp_x16),
+			  crtc_state->dsc.slice_count,
+			  str_yes_no(crtc_state->dsc.dsc_split));
+}
+
+void intel_vdsc_state_dump(struct drm_printer *p, int indent,
+			   const struct intel_crtc_state *crtc_state)
+{
+	if (!crtc_state->dsc.compression_enable)
+		return;
+
+	intel_vdsc_dump_state(p, indent, crtc_state);
+	drm_dsc_dump_config(p, indent, &crtc_state->dsc.config);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
index 2cc41ff089094..290b2e9b3482e 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+struct drm_printer;
+
 enum transcoder;
 struct intel_crtc;
 struct intel_crtc_state;
@@ -27,5 +29,7 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state);
 void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state);
+void intel_vdsc_state_dump(struct drm_printer *p, int indent,
+			   const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_VDSC_H__ */
-- 
2.43.3

