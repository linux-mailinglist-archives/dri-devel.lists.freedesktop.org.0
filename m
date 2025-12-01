Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E325C9625E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F3F10E328;
	Mon,  1 Dec 2025 08:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrZHK/Tt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C3310E326;
 Mon,  1 Dec 2025 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577802; x=1796113802;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CPjxqPmfGT/JW+AfTn1OjFXScu7jUsPI/MuITD/++No=;
 b=QrZHK/Tt3KYpXxJ+J8MjhN5DQJZZljfeAvO0jh7Ntn77t13oDnix4B9j
 n5jp6DoUcPNaOx1nIWCBpT7i+5/HRJHV7tfWcI4YFZUNL1kGAczzN1LWg
 nEKfSD/02GR0ojhC3BhcTjK6GDH7ROuZqmp3Rh+Z3BR1Por5Y4SI7+542
 vBoS0/iDSK+R9Ly6m6LU7NdHXDfFL2nZ/ueC/rkSKJihACeV7x0lz0rte
 4XbZTt4KszcWv5UCMuc8ODwt2niAwwGWMCbwFXqWazr8DVIdDc/uc7d/e
 c8FgJZ4pNDSledsQhXedkknHy738GdRxF5l5CeTPs6qb7wb0I/OY2w4sE Q==;
X-CSE-ConnectionGUID: PLP7Qe4iQdyZzkcGstQqlA==
X-CSE-MsgGUID: ugyncJnKS1C77g8jULEnjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578517"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:30:01 -0800
X-CSE-ConnectionGUID: p5OFgsaqRX+t7WdLhmtZxQ==
X-CSE-MsgGUID: FzaDQriDTvKqAkKOIAA8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198353014"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:29:55 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:56 +0530
Subject: [PATCH v9 14/20] drm/i915/histogram: Hook i915 histogram with drm
 histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-14-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
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
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
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

