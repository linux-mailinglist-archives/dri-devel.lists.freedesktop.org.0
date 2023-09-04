Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F9791086
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 06:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607810E288;
	Mon,  4 Sep 2023 04:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A2A10E287;
 Mon,  4 Sep 2023 04:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693801005; x=1725337005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l82/oFi4MHKbE72huJXg77fwQqfakLlpWVcH/cf76/g=;
 b=grNvGSRJo7I5fcK+mxMPzt6c70AKOccRCto7eWG1U7fBjn4Ho5XvmSfj
 +GXt6L6gTorrtDrtbdX7L+j7QGVDOD688wAkZ7Mqc2q1ymYEDmiu4Y0Jo
 65rFu0v4gyGRKZ1/Hg+kvDiLqWJtHZ4V531R0j4Wan2KqxZ2VSqP+p0qu
 ZwPuzwyrwO8MveHL/cPtwJnPMezkDgab/rSbaInIOXyfnix/KevDt2aLj
 Hg400368qVtQLL+qrZHn9tWu9o/Zt1tWlSrCskg61QIM5JLY3DFlXq00F
 INoeTnxOj8+Ot5EyTc08+E31d15XoOGdfEtttAv7jPQNGl6nD3WkMdP1j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="361531439"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="361531439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2023 21:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="883893539"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="883893539"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga001.fm.intel.com with SMTP; 03 Sep 2023 21:16:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Sep 2023 07:16:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915: Use vblank worker to unpin old legacy cursor
 fb safely
Date: Mon,  4 Sep 2023 07:16:39 +0300
Message-ID: <20230904041640.31297-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The cursor hardware only does sync updates, and thus the hardware
will be scanning out from the old fb until the next start of vblank.
So in order to make the legacy cursor fastpath actually safe we
should not unpin the old fb until we're sure the hardware has
ceased accessing it. The simplest approach is to just use a vblank
work here to do the delayed unpin.

Not 100% sure it's a good idea to put this onto the same high
priority vblank worker as eg. our timing critical gamma updates.
But let's keep it simple for now, and it we later discover that
this is causing problems we can think about adding a lower
priority worker for such things.

v2: wait for cursor unpins before turning off the vblank irq

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   | 36 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_cursor.h   |  2 ++
 drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
 .../drm/i915/display/intel_display_types.h    |  4 +++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b342fad180ca..625540fd1dab 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -603,6 +603,26 @@ static bool intel_cursor_format_mod_supported(struct drm_plane *_plane,
 	return format == DRM_FORMAT_ARGB8888;
 }
 
+static void intel_cursor_unpin_work(struct kthread_work *base)
+{
+	struct drm_vblank_work *work = to_drm_vblank_work(base);
+	struct intel_plane_state *plane_state =
+		container_of(work, typeof(*plane_state), unpin_work);
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+
+	intel_plane_unpin_fb(plane_state);
+	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
+
+	if (atomic_dec_and_test(&plane->cursor.pending_unpins))
+		wake_up_var(&plane->cursor.pending_unpins);
+}
+
+void intel_cursor_wait_unpin_works(struct intel_plane *plane)
+{
+	wait_var_event(&plane->cursor.pending_unpins,
+		       !atomic_read(&plane->cursor.pending_unpins));
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -730,14 +750,26 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	local_irq_enable();
 
-	intel_plane_unpin_fb(old_plane_state);
+	if (old_plane_state->hw.fb != new_plane_state->hw.fb) {
+		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
+				     intel_cursor_unpin_work);
+
+		atomic_inc(&plane->cursor.pending_unpins);
+		drm_vblank_work_schedule(&old_plane_state->unpin_work,
+					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+					 false);
+
+		old_plane_state = NULL;
+	} else {
+		intel_plane_unpin_fb(old_plane_state);
+	}
 
 out_free:
 	if (new_crtc_state)
 		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
 	if (ret)
 		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
-	else
+	else if (old_plane_state)
 		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
 	return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.h b/drivers/gpu/drm/i915/display/intel_cursor.h
index ce333bf4c2d5..e778aff77129 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.h
+++ b/drivers/gpu/drm/i915/display/intel_cursor.h
@@ -14,4 +14,6 @@ struct intel_plane *
 intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe);
 
+void intel_cursor_wait_unpin_works(struct intel_plane *plane);
+
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f6397462e4c2..90c1ed61ba0e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -63,6 +63,7 @@
 #include "intel_crt.h"
 #include "intel_crtc.h"
 #include "intel_crtc_state_dump.h"
+#include "intel_cursor.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
 #include "intel_display_driver.h"
@@ -6618,6 +6619,8 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
 
 		intel_pre_plane_update(state, crtc);
 		intel_crtc_disable_planes(state, crtc);
+
+		intel_cursor_wait_unpin_works(to_intel_plane(crtc->base.cursor));
 	}
 
 	/* Only disable port sync and MST slaves */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c21064794f32..f6ca86f1d834 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -702,6 +702,9 @@ struct intel_plane_state {
 
 	struct intel_fb_view view;
 
+	/* for legacy cursor fb unpin */
+	struct drm_vblank_work unpin_work;
+
 	/* Plane pxp decryption state */
 	bool decrypt;
 
@@ -1515,6 +1518,7 @@ struct intel_plane {
 
 	struct {
 		u32 base, cntl, size;
+		atomic_t pending_unpins;
 	} cursor;
 
 	struct intel_fbc *fbc;
-- 
2.41.0

