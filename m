Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60391C40C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A587210ECB9;
	Fri, 28 Jun 2024 16:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTMIkUgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F3F10ECB2;
 Fri, 28 Jun 2024 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593095; x=1751129095;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JJ2+Tqi8mJip5DbQDCcIlNTv4nheVYkO/6C9T7I1/TU=;
 b=MTMIkUgVTv3Uq3eptSWWuRM/U+FC3HgKowwg/0QloWMtikmJv5cwiDrI
 JqcomuIvkWwJdqpl7C5VYlCl9XdbHMiEpW5d0c8H22rA9Exw8hh1UhoC6
 6zHXJDqqohImE+CARlzCgEf5TAB3H+k2mgeIKhGrSWI2JgIT4E9JOzk/N
 ou3R4R1VKyOOrmUHfrjO/3euntg7a/rYHrAtTOmrE28xF6Hbe0m++W4RT
 0kTfvC/jRlMDbGjSzAyORiWMPGFguQwurpUgX7r2MVbjLI8PQCVVy8d2m
 pVD4UKoUl1tSJHMuia83+qjZPcmXgkAa8aVDKpWX3oPFjIZHFvlwEpR4V A==;
X-CSE-ConnectionGUID: 9S/sGgX0SdCIUBJWIL9qvQ==
X-CSE-MsgGUID: v/R7GFA8RcOhy2qpKSvNZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620088"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620088"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:55 -0700
X-CSE-ConnectionGUID: W5nPzwN8R1+G3uUqu6Hh3A==
X-CSE-MsgGUID: dM5do//0Qk+tqodRoARj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519931"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:54 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/i915: Dump DSC state to dmesg and
 debugfs/i915_display_info
Date: Fri, 28 Jun 2024 19:44:49 +0300
Message-ID: <20240628164451.1177612-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
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

v2: Rebase on the s/DRM_X16/FXP_Q4 change.

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
index ff717dc1a2ce5..404ed05371cb8 100644
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
+			  "dsc-dss: compressed-bpp:" FXP_Q4_FMT ", slice-count: %d, split: %s\n",
+			  FXP_Q4_ARGS(crtc_state->dsc.compressed_bpp_x16),
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

