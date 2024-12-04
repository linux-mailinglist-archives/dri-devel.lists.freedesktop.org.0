Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349029E3689
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B5310EC83;
	Wed,  4 Dec 2024 09:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+Spjaog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3865910EC78;
 Wed,  4 Dec 2024 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733304421; x=1764840421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sRvpxJNOJ0vNh9LaqG89Bdq5QLbubA4c6dwzAesnJU0=;
 b=V+SpjaogxZ4u2+saIKijl1uBvuc5bk8D/myXMtnVxQuMverI2rqLl9N2
 BCSpPzLoBn5rrBvHnqPSTnjA2ieU8Kn4K14z0xd9cpaGVgTcd5h6QAdhJ
 EJr/z8qzDXA2fiGIL8TOqyjeM5ZYCVIN0mllQEOVtLV2d2P8kTU71I4yO
 68ilon8+5NjaDJYEidZI2BjUO0Hrp/HW1P1FgODyMMJEyWx5TYbE2REqT
 wowkxNj7Ota6cYpRrxDXd0IAKYAe+LUlVIny5GsvTm51ygky4li2lYYBA
 W6lpawlfXrgWBVgTWjeAUQANfcfvw07dhLMx9Ge7Ts3DOw5WO3jJ3RoG9 w==;
X-CSE-ConnectionGUID: pYq2KfznTBqkSDMpf8lAMA==
X-CSE-MsgGUID: zLpinXHNRpCN6+AWn2ifDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44038763"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44038763"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 01:27:00 -0800
X-CSE-ConnectionGUID: +/Q9B6slTU+WifnvKoT8Gw==
X-CSE-MsgGUID: 30NLMe4zTYSotnu48MljFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94138283"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 04 Dec 2024 01:26:59 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2 07/10] drm/i915/display: handle drm-crtc histogram property
 updates
Date: Wed,  4 Dec 2024 14:47:19 +0530
Message-Id: <20241204091719.1786072-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Check for any updates on drm_crtc property histogram_enable and
histogram_iet_updated and call/act accordingly to update histogram or
update the image enhancement LUT data API defined in i915 histogram.

v2: corrected the FORTIFY_SOURCE error

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c    |  1 +
 drivers/gpu/drm/i915/display/intel_crtc.c      |  7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c   | 17 +++++++++++++++++
 .../gpu/drm/i915/display/intel_display_types.h |  2 ++
 drivers/gpu/drm/i915/display/intel_histogram.c | 18 ++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 03dc54c802d3..dff130b3565a 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -278,6 +278,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	crtc_state->dsb_color_vblank = NULL;
 	crtc_state->dsb_commit = NULL;
 	crtc_state->use_dsb = false;
+	crtc_state->histogram_updated = false;
 
 	return &crtc_state->uapi;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index a2c528d707f4..0c8741ca9a71 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -27,6 +27,7 @@
 #include "intel_drrs.h"
 #include "intel_dsi.h"
 #include "intel_fifo_underrun.h"
+#include "intel_histogram.h"
 #include "intel_pipe_crc.h"
 #include "intel_psr.h"
 #include "intel_sprite.h"
@@ -210,6 +211,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
 static void intel_crtc_free(struct intel_crtc *crtc)
 {
 	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
+	intel_histogram_finish(crtc);
 	kfree(crtc);
 }
 
@@ -380,10 +382,15 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
+	if (drm_crtc_create_histogram_property(&crtc->base))
+		drm_err(&dev_priv->drm, "Failed to initialize histogram properties\n");
+
 	intel_color_crtc_init(crtc);
 	intel_drrs_crtc_init(crtc);
 	intel_crtc_crc_init(crtc);
 
+	intel_histogram_init(crtc);
+
 	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
 
 	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4805bf682d43..abad112cf7e4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -93,6 +93,7 @@
 #include "intel_fifo_underrun.h"
 #include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
+#include "intel_histogram.h"
 #include "intel_hotplug.h"
 #include "intel_link_bw.h"
 #include "intel_lvds.h"
@@ -4612,6 +4613,12 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	if (crtc_state->histogram_updated) {
+		ret = intel_histogram_atomic_check(crtc);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -6831,6 +6838,10 @@ int intel_atomic_check(struct drm_device *dev,
 		if (new_crtc_state->uapi.scaling_filter !=
 		    old_crtc_state->uapi.scaling_filter)
 			new_crtc_state->uapi.mode_changed = true;
+
+		if (new_crtc_state->uapi.histogram_enable |=
+				old_crtc_state->uapi.histogram_enable)
+			new_crtc_state->histogram_updated = true;
 	}
 
 	intel_vrr_check_modeset(state);
@@ -7897,6 +7908,12 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 */
 		old_crtc_state->dsb_color_vblank = fetch_and_zero(&new_crtc_state->dsb_color_vblank);
 		old_crtc_state->dsb_commit = fetch_and_zero(&new_crtc_state->dsb_commit);
+
+		if (new_crtc_state->histogram_updated)
+			intel_histogram_update(crtc, crtc->base.state->histogram_enable);
+		if (new_crtc_state->uapi.histogram_iet_updated)
+			intel_histogram_set_iet_lut(crtc,
+						    new_crtc_state->uapi.histogram_iet);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0f50081b9957..15f4bd3ccc62 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1317,6 +1317,8 @@ struct intel_crtc_state {
 
 	/* LOBF flag */
 	bool has_lobf;
+
+	bool histogram_updated;
 };
 
 enum intel_pipe_crc_source {
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 57bb45b36a03..39ab6d5c7c84 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -68,6 +68,24 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
 	for (retry = 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++) {
 		if (intel_histogram_get_data(intel_crtc)) {
+			u32 *data;
+			struct drm_histogram *hist;
+
+			data = kzalloc(sizeof(data) * sizeof(histogram->bin_data), GFP_KERNEL);
+			if (!data)
+				return;
+			memcpy(histogram->bin_data, data, sizeof(histogram->bin_data));
+			hist = kzalloc(sizeof(struct drm_histogram), GFP_KERNEL);
+			if (!hist)
+				return;
+			hist->data_ptr = *data;
+			hist->nr_elements = sizeof(histogram->bin_data);
+
+			drm_property_replace_global_blob(display->drm,
+				&intel_crtc->base.state->histogram_data,
+				sizeof(struct drm_histogram),
+				hist, &intel_crtc->base.base,
+				intel_crtc->base.histogram_data_property);
 			/* Notify user for Histogram rediness */
 			if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
 					       KOBJ_CHANGE, histogram_event))
-- 
2.25.1

