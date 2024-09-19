Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7197CA45
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 15:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40BA10E70B;
	Thu, 19 Sep 2024 13:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdRdGgyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A826F10E6FD;
 Thu, 19 Sep 2024 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726753294; x=1758289294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rV9H2AhTeymJ3t4ROUOykMx/FbavPLZDLylcq+jg+Q0=;
 b=YdRdGgyvOABGlRKDzDeYoIGB7nOkqFBDjH7F/nqEgPeoChzRF9m8/tk4
 JFmd/0B5tH1F7C9iHstZO7PEfX7HmTbuhaT108jvFRGXJQvtzxcu5xsZ+
 cK0u/0Bbh2oxhvu56mADhdOnjKMIDHoqknLRDO0pQHDXgPwH0McZ+dqKV
 Eiu2OxmbdVMPkRM1zuaurhVt5iHVmER+XvbZRUfCY//brjU+aNpM7DJyn
 h0EK1hyMkDMKiBSYsjvSCzuBM37geR7MThFNjNUqnZRoId+1lG2hkghRM
 Zmsl5sT0vgADVpMvt6GtIErcWl8FvNlsl99w2u4G66dHbPkRMfGB7nv0d w==;
X-CSE-ConnectionGUID: 3s+i0eppQXqZR3vADrJUbQ==
X-CSE-MsgGUID: qU1o2Es9RSW0v4IeRqbVvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29505361"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29505361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 06:41:34 -0700
X-CSE-ConnectionGUID: zfthHAMRSqGQ+cyPkOcxtg==
X-CSE-MsgGUID: d7IQ8N42SlaRawLNgbMUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74912653"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 19 Sep 2024 06:41:31 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 4/6] drm/i915/histogram: Add crtc properties for global
 histogram
Date: Thu, 19 Sep 2024 19:01:38 +0530
Message-Id: <20240919133140.1372663-5-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919133140.1372663-1-arun.r.murthy@intel.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
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

CRTC properties have been added for enable/disable histogram, reading
the histogram data and writing the IET data.
"HISTOGRAM_EN" is the crtc property to enable/disable the global
histogram and takes a value 0/1 accordingly.
"Histogram" is a crtc property to read the binary histogram data.
"Global IET" is a crtc property to write the IET binary LUT data.

v2: Read the histogram blob data before sending uevent (Jani)
v3: use drm_property_replace_blob_from_id (Vandita)
    Add substruct for histogram in intel_crtc_state (Jani)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
 drivers/gpu/drm/i915/display/intel_crtc.c     | 169 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  13 ++
 .../drm/i915/display/intel_display_types.h    |  13 ++
 .../gpu/drm/i915/display/intel_histogram.c    |   6 +
 6 files changed, 210 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 12d6ed940751..496ff76431d2 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
 
+	if (crtc_state->histogram.global_iet)
+		drm_property_blob_get(crtc_state->histogram.global_iet);
 	/* copy color blobs */
 	if (crtc_state->hw.degamma_lut)
 		drm_property_blob_get(crtc_state->hw.degamma_lut);
@@ -278,6 +280,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	crtc_state->update_planes = 0;
 	crtc_state->dsb_color_vblank = NULL;
 	crtc_state->dsb_color_commit = NULL;
+	crtc_state->histogram.histogram_enable_changed = false;
 
 	return &crtc_state->uapi;
 }
@@ -314,6 +317,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
 	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_vblank);
 	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_commit);
 
+	if (crtc_state->histogram.global_iet)
+		drm_property_blob_put(crtc_state->histogram.global_iet);
 	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
 	intel_crtc_free_hw_state(crtc_state);
 	if (crtc_state->dp_tunnel_ref.tunnel)
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index aed3853952be..22a1806e995f 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -11,6 +11,7 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_work.h>
+#include <drm/drm_atomic_uapi.h>
 
 #include "i915_vgpu.h"
 #include "i9xx_plane.h"
@@ -27,6 +28,7 @@
 #include "intel_drrs.h"
 #include "intel_dsi.h"
 #include "intel_fifo_underrun.h"
+#include "intel_histogram.h"
 #include "intel_pipe_crc.h"
 #include "intel_psr.h"
 #include "intel_sprite.h"
@@ -203,6 +205,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
 static void intel_crtc_free(struct intel_crtc *crtc)
 {
 	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
+	intel_histogram_deinit(crtc);
 	kfree(crtc);
 }
 
@@ -222,6 +225,67 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
 	return 0;
 }
 
+static int intel_crtc_get_property(struct drm_crtc *crtc,
+				   const struct drm_crtc_state *state,
+				   struct drm_property *property,
+				   uint64_t *val)
+{
+	struct drm_i915_private *i915 = to_i915(crtc->dev);
+	const struct intel_crtc_state *intel_crtc_state =
+		to_intel_crtc_state(state);
+	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
+
+	if (property == intel_crtc->histogram_en_property) {
+		*val = intel_crtc_state->histogram.histogram_enable;
+	} else if (property == intel_crtc->global_iet_property) {
+		*val = (intel_crtc_state->histogram.global_iet) ?
+			intel_crtc_state->histogram.global_iet->base.id : 0;
+	} else if (property == intel_crtc->histogram_property) {
+		*val = (intel_crtc_state->histogram.histogram) ?
+			intel_crtc_state->histogram.histogram->base.id : 0;
+	} else {
+		drm_err(&i915->drm,
+			"Unknown property [PROP:%d:%s]\n",
+			property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int intel_crtc_set_property(struct drm_crtc *crtc,
+				   struct drm_crtc_state *state,
+				   struct drm_property *property,
+				   u64 val)
+{
+	struct drm_i915_private *i915 = to_i915(crtc->dev);
+	struct intel_crtc_state *intel_crtc_state =
+		to_intel_crtc_state(state);
+	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
+	bool replaced = false;
+
+	if (property == intel_crtc->histogram_en_property) {
+		intel_crtc_state->histogram.histogram_enable = val;
+		intel_crtc_state->histogram.histogram_enable_changed = true;
+		return 0;
+	}
+
+	if (property == intel_crtc->global_iet_property) {
+		drm_property_replace_blob_from_id(crtc->dev,
+						  &intel_crtc_state->histogram.global_iet,
+						  val,
+						  sizeof(uint32_t) * HISTOGRAM_IET_LENGTH,
+						  -1, &replaced);
+		if (replaced)
+			intel_crtc_state->histogram.global_iet_changed = true;
+		return 0;
+	}
+
+	drm_dbg_atomic(&i915->drm, "Unknown property [PROP:%d:%s]\n",
+		       property->base.id, property->name);
+	return -EINVAL;
+}
+
 #define INTEL_CRTC_FUNCS \
 	.set_config = drm_atomic_helper_set_config, \
 	.destroy = intel_crtc_destroy, \
@@ -231,7 +295,9 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
 	.set_crc_source = intel_crtc_set_crc_source, \
 	.verify_crc_source = intel_crtc_verify_crc_source, \
 	.get_crc_sources = intel_crtc_get_crc_sources, \
-	.late_register = intel_crtc_late_register
+	.late_register = intel_crtc_late_register, \
+	.atomic_set_property = intel_crtc_set_property, \
+	.atomic_get_property = intel_crtc_get_property
 
 static const struct drm_crtc_funcs bdw_crtc_funcs = {
 	INTEL_CRTC_FUNCS,
@@ -376,6 +442,10 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 	intel_color_crtc_init(crtc);
 	intel_drrs_crtc_init(crtc);
 	intel_crtc_crc_init(crtc);
+	intel_histogram_init(crtc);
+
+	/* Initialize crtc properties */
+	intel_crtc_add_property(crtc);
 
 	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -692,3 +762,100 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 out:
 	intel_psr_unlock(new_crtc_state);
 }
+
+static const struct drm_prop_enum_list histogram_enable_names[] = {
+	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
+	{ INTEL_HISTOGRAM_ENABLE, "Enable" },
+};
+
+/**
+ * intel_attach_histogram_en_property() - add property to enable/disable histogram
+ * @intel_crtc: pointer to the struct intel_crtc on which the global histogram is to
+ *		be enabled/disabled
+ *
+ * "HISTOGRAM_EN" is the crtc propety to enable/disable global histogram
+ */
+void intel_attach_histogram_en_property(struct intel_crtc *intel_crtc)
+{
+	struct drm_crtc *crtc = &intel_crtc->base;
+	struct drm_device *dev = crtc->dev;
+	struct drm_property *prop;
+
+	prop = intel_crtc->histogram_en_property;
+	if (!prop) {
+		prop = drm_property_create_enum(dev, 0,
+						"Histogram_Enable",
+						histogram_enable_names,
+						ARRAY_SIZE(histogram_enable_names));
+		if (!prop)
+			return;
+
+		intel_crtc->histogram_en_property = prop;
+	}
+
+	drm_object_attach_property(&crtc->base, prop, 0);
+}
+
+/**
+ * intel_attach_global_iet_property() - add property to write Image Enhancement data
+ * @intel_crtc: pointer to the struct intel_crtc on which global histogram is enabled
+ *
+ * "Global IET" is the crtc property to write the Image Enhancement LUT binary data
+ */
+void intel_attach_global_iet_property(struct intel_crtc *intel_crtc)
+{
+	struct drm_crtc *crtc = &intel_crtc->base;
+	struct drm_device *dev = crtc->dev;
+	struct drm_property *prop;
+
+	prop = intel_crtc->global_iet_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB | DRM_MODE_PROP_ATOMIC,
+					   "Global IET", 0);
+		if (!prop)
+			return;
+
+		intel_crtc->global_iet_property = prop;
+	}
+
+	drm_object_attach_property(&crtc->base, prop, 0);
+}
+
+/**
+ * intel_attach_histogram_property() - crtc property to read the histogram.
+ * @intel_crtc: pointer to the struct intel_crtc on which the global histogram
+ *		was enabled.
+ * "Global Histogram" is the crtc property to read the binary histogram data.
+ */
+void intel_attach_histogram_property(struct intel_crtc *intel_crtc)
+{
+	struct drm_crtc *crtc = &intel_crtc->base;
+	struct drm_device *dev = crtc->dev;
+	struct drm_property *prop;
+	struct drm_property_blob *blob;
+
+	prop = intel_crtc->histogram_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
+					   DRM_MODE_PROP_ATOMIC |
+					   DRM_MODE_PROP_IMMUTABLE,
+					   "Global Histogram", 0);
+		if (!prop)
+			return;
+
+		intel_crtc->histogram_property = prop;
+	}
+	blob = drm_property_create_blob(dev, sizeof(uint32_t) * HISTOGRAM_BIN_COUNT, NULL);
+	intel_crtc->config->histogram.histogram = blob;
+
+	drm_object_attach_property(&crtc->base, prop, blob->base.id);
+}
+
+int intel_crtc_add_property(struct intel_crtc *intel_crtc)
+{
+	intel_attach_histogram_en_property(intel_crtc);
+	intel_attach_histogram_property(intel_crtc);
+	intel_attach_global_iet_property(intel_crtc);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 0de8c772df2e..e5efbaf250e8 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -7,6 +7,7 @@
 #define _INTEL_CRTC_H_
 
 #include <linux/types.h>
+#include <drm/drm_crtc.h>
 
 enum i9xx_plane_id;
 enum pipe;
@@ -50,4 +51,8 @@ void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
 				     enum pipe pipe);
 void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
 
+int intel_crtc_add_property(struct intel_crtc *intel_crtc);
+void intel_attach_histogram_en_property(struct intel_crtc *intel_crtc);
+void intel_attach_global_iet_property(struct intel_crtc *intel_crtc);
+void intel_attach_histogram_property(struct intel_crtc *intel_crtc);
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b4ec9bf12aa7..f4bcc7a3359c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -95,6 +95,7 @@
 #include "intel_fifo_underrun.h"
 #include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
+#include "intel_histogram.h"
 #include "intel_hotplug.h"
 #include "intel_link_bw.h"
 #include "intel_lvds.h"
@@ -4337,6 +4338,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	/* HISTOGRAM changed */
+	if (crtc_state->histogram.histogram_enable_changed)
+		return intel_histogram_atomic_check(crtc);
+
 	return 0;
 }
 
@@ -7517,6 +7522,14 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 */
 		old_crtc_state->dsb_color_vblank = fetch_and_zero(&new_crtc_state->dsb_color_vblank);
 		old_crtc_state->dsb_color_commit = fetch_and_zero(&new_crtc_state->dsb_color_commit);
+
+		/* Re-Visit: HISTOGRAM related stuff */
+		if (new_crtc_state->histogram.histogram_enable_changed)
+			intel_histogram_update(crtc,
+					       new_crtc_state->histogram.histogram_enable);
+		if (new_crtc_state->histogram.global_iet_changed)
+			intel_histogram_set_iet_lut(crtc,
+						    (u32 *)new_crtc_state->histogram.global_iet->data);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 080e43d8e51e..654cedcc3957 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1304,6 +1304,15 @@ struct intel_crtc_state {
 
 	/* LOBF flag */
 	bool has_lobf;
+
+	/* Histogram data */
+	struct {
+		int histogram_enable;
+		struct drm_property_blob *global_iet;
+		struct drm_property_blob *histogram;
+		bool global_iet_changed;
+		bool histogram_enable_changed;
+	} histogram;
 };
 
 enum intel_pipe_crc_source {
@@ -1411,6 +1420,10 @@ struct intel_crtc {
 	struct pm_qos_request vblank_pm_qos;
 
 	struct intel_histogram *histogram;
+	/* HISTOGRAM properties */
+	struct drm_property *histogram_en_property;
+	struct drm_property *global_iet_property;
+	struct drm_property *histogram_property;
 
 #ifdef CONFIG_DEBUG_FS
 	struct intel_pipe_crc pipe_crc;
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index ed3f455666aa..d1af64f2a6ac 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -82,6 +82,11 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
 		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
 	if (intel_histogram_get_data(intel_crtc)) {
+		drm_property_replace_global_blob(display->drm,
+				&intel_crtc->config->histogram.histogram,
+				sizeof(histogram->bindata),
+				histogram->bindata, &intel_crtc->base.base,
+				intel_crtc->histogram_property);
 		/* Notify user for Histogram rediness */
 		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
 				       KOBJ_CHANGE, histogram_event))
@@ -208,6 +213,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_crtc)
 
 	cancel_delayed_work(&histogram->histogram_int_work);
 	histogram->enable = false;
+	intel_crtc->config->histogram.histogram_enable = false;
 }
 
 int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable)
-- 
2.25.1

