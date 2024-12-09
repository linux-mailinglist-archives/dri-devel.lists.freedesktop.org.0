Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43E9E9BD2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9F410E4EA;
	Mon,  9 Dec 2024 16:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUrZqDiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C29110E4D8;
 Mon,  9 Dec 2024 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762103; x=1765298103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4/WvOEszDpoBllvk2/6eodEvHWX5gsc3x/vfYh5sqyc=;
 b=MUrZqDiB+N9pm/b3rMtGglxs3MyYHKbwvtnxBkR3teLU2TkN5n0xeb4J
 AHN6iK4H+fyGGj9s5Rs1MgX8UCcICQGaDlyvgUnsdk5DlqPsaltb2VkHO
 qFxXCLP0ietkhqYUrBYazzfqghexMMkjyU6Izyvps8oo+Wo5YSo3Mh/nC
 sEQMMyPQU9c2NlCPW1mLHMLifHftxQnLICaQB6SgTwvXSzdKovwDZXmXp
 2s+wyAjwLtut4q53sKHiL3QFeADAbHMxkm3/zvNfRIBVbNzVboqzoTAxM
 jEhnuOLoScvvGf2K1mJ7/5SoLhAQ1Z/NJrLwroj6jxhZJpcAK8b2xSYDr A==;
X-CSE-ConnectionGUID: 0iFUCg9zSgyUreABlDuFuA==
X-CSE-MsgGUID: zhOOUOaKQYmivl3lvB2R6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551668"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551668"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:35:02 -0800
X-CSE-ConnectionGUID: hTVA/9d7TLeebLWUYfw/PA==
X-CSE-MsgGUID: LdVu847ARGWHwm82OhrFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371744"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:35:00 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 07/10] drm/i915/display: Handle drm-crtc histogram property
 updates
Date: Mon,  9 Dec 2024 21:55:01 +0530
Message-Id: <20241209162504.2146697-8-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c     |  1 +
 drivers/gpu/drm/i915/display/intel_crtc.c       |  7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c    | 17 +++++++++++++++++
 .../gpu/drm/i915/display/intel_display_types.h  |  2 ++
 4 files changed, 27 insertions(+)

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
index 35c8904ecf44..fb393e5a4c84 100644
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
 
@@ -6832,6 +6839,10 @@ int intel_atomic_check(struct drm_device *dev,
 		if (new_crtc_state->uapi.scaling_filter !=
 		    old_crtc_state->uapi.scaling_filter)
 			new_crtc_state->uapi.mode_changed = true;
+
+		if (new_crtc_state->uapi.histogram_enable |=
+		    old_crtc_state->uapi.histogram_enable)
+			new_crtc_state->histogram_updated = true;
 	}
 
 	intel_vrr_check_modeset(state);
@@ -7900,6 +7911,12 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
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
-- 
2.25.1

