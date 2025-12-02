Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993CC9A4A5
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C61310E56C;
	Tue,  2 Dec 2025 06:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2MmKjPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3366410E56A;
 Tue,  2 Dec 2025 06:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656885; x=1796192885;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CPjxqPmfGT/JW+AfTn1OjFXScu7jUsPI/MuITD/++No=;
 b=R2MmKjPMZ3HiyYOu0BTsaHegsdUGw+PW/DsS0C3AgxSpOgRiY3nmaGkU
 Eo+BK5j+yMwEjt6ENnHkg/lWon8VPBzfx3Ra5g6/WPkEKlcRfKTdLA24n
 wZfS7N0AlTwLAXvNEa/o7oTcEk/UYIuQ/dmZL63QpY9L/jtGRnXufXIcq
 R5oY5x23T4r4xiE7AoBG24bGiFzABQDkHr+bPd/izX4S8+AR8ZvK7nHrO
 6joPh/GBbdcXjWbWJlEibk1ID6PK4N9+Yo23VdykZL/pDxEgODfK5f6RJ
 p/heU+lbc1WikYfXCvKfP+SX59dBtSt1nD1lFzHMzO01V8AY7PjZkDIHL A==;
X-CSE-ConnectionGUID: H4DTS/LhSwyPa81CagMMUQ==
X-CSE-MsgGUID: EFoSXXhyTe2xbzAntEQwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499976"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:28:05 -0800
X-CSE-ConnectionGUID: GBN8fg0PRZ+7V/q5NuSdcg==
X-CSE-MsgGUID: G7HvLM1QRwajRfVbF3AKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961470"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:59 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:08 +0530
Subject: [PATCH [RESEND] v9 14/20] drm/i915/histogram: Hook i915 histogram
 with drm histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-14-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Handle histogram caps and histogram config property in i915 driver. Fill
the histogram hardware capability and act upon the histogram config
property to enable/disable histogram in i915.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    |  7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 2fe645860385df9b64aedc408dc5908b475a0b40..036a347d7540d33faa3f7d7588dc860e6b717a56 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -17,6 +17,7 @@
 #include "icl_dsi.h"
 #include "intel_atomic.h"
 #include "intel_color.h"
+#include "intel_color_pipeline.h"
 #include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_display_debugfs.h"
@@ -26,6 +27,7 @@
 #include "intel_drrs.h"
 #include "intel_dsi.h"
 #include "intel_fifo_underrun.h"
+#include "intel_histogram.h"
 #include "intel_parent.h"
 #include "intel_pipe_crc.h"
 #include "intel_plane.h"
@@ -215,6 +217,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
 static void intel_crtc_free(struct intel_crtc *crtc)
 {
 	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
+	intel_histogram_finish(crtc);
 	kfree(crtc);
 }
 
@@ -387,6 +390,10 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
+	intel_histogram_init(crtc);
+	if (intel_color_pipeline_crtc_init(&crtc->base))
+		drm_err(display->drm, "Failed to initialize histogram properties\n");
+
 	intel_color_crtc_init(crtc);
 	intel_drrs_crtc_init(crtc);
 	intel_crtc_crc_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e5ce47efc809604cf6f7f01bdc9c679d608be3ef..191a830009e78a31e1ad3d9ca8e0596e1a1ff71e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -99,6 +99,7 @@
 #include "intel_flipq.h"
 #include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
+#include "intel_histogram.h"
 #include "intel_hotplug.h"
 #include "intel_link_bw.h"
 #include "intel_lt_phy.h"
@@ -4252,6 +4253,7 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	struct drm_colorop *colorop = crtc_state->uapi.color_pipeline;
 	int ret;
 
 	if (DISPLAY_VER(display) < 5 && !display->platform.g4x &&
@@ -4313,6 +4315,12 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	if (colorop->state->histogram_updated) {
+		ret = intel_histogram_atomic_check(crtc);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -7547,6 +7555,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	intel_dbuf_post_plane_update(state);
 
 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		struct drm_colorop *colorop = new_crtc_state->uapi.color_pipeline;
+
 		intel_post_plane_update(state, crtc);
 
 		intel_modeset_put_crtc_power_domains(crtc, &put_domains[crtc->pipe]);
@@ -7564,6 +7574,11 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 */
 		old_crtc_state->dsb_color = fetch_and_zero(&new_crtc_state->dsb_color);
 		old_crtc_state->dsb_commit = fetch_and_zero(&new_crtc_state->dsb_commit);
+
+		if (colorop->state->histogram_updated)
+			intel_histogram_update(crtc,
+					       (struct drm_histogram_config *)
+					       colorop->state->histogram_enable->data);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */

-- 
2.25.1

