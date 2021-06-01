Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30774397125
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9896E9F9;
	Tue,  1 Jun 2021 10:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5176E9F2;
 Tue,  1 Jun 2021 10:16:23 +0000 (UTC)
IronPort-SDR: /WKxFs42QKPNS1+K0Ty091SBl9S9EMaPLlY8aNuRn0VMSU1bhLZaj8l9XRWgp5grpLpBfLHuuw
 Se5smXMsgOEg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550007"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550007"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:23 -0700
IronPort-SDR: qEv8SNUSBr55OUVOi6SR3/u3fOzK0AqpIU9X1IdDwSu3YbP5iITnEoOfqDwnrSbgzj+ndIG+6g
 CAqwUQC3uc0g==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431328"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:21 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/21] drm/i915/xelpd: Load plane color luts from atomic flip
Date: Tue,  1 Jun 2021 16:22:08 +0530
Message-Id: <20210601105218.29185-12-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Load plane color luts as part of atomic plane updates.
This will be done only if the plane color luts are changed.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 +++
 drivers/gpu/drm/i915/display/intel_atomic_plane.h | 1 +
 drivers/gpu/drm/i915/display/intel_color.c        | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 36f52a1d7552..5de9c98beaf6 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -513,6 +513,9 @@ void skl_update_planes_on_crtc(struct intel_atomic_state *state,
 		struct intel_plane_state *new_plane_state =
 			intel_atomic_get_new_plane_state(state, plane);
 
+		if (new_plane_state->uapi.color_mgmt_changed)
+			intel_color_load_plane_luts(&new_plane_state->uapi);
+
 		if (new_plane_state->uapi.visible ||
 		    new_plane_state->planar_slave) {
 			intel_update_plane(plane, new_crtc_state, new_plane_state);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index c809f522a710..1ba3b524cee2 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -66,5 +66,6 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
 void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
 			       struct intel_plane_state *plane_state);
 int intel_plane_color_init(struct drm_plane *plane);
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state);
 
 #endif /* __INTEL_ATOMIC_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4e5733573fd8..6d57a47d8a60 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -22,6 +22,7 @@
  *
  */
 
+#include "intel_atomic_plane.h"
 #include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
@@ -2311,6 +2312,14 @@ static void d13_plane_load_luts(const struct drm_plane_state *plane_state)
 	}
 }
 
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state)
+{
+	struct drm_device *dev = plane_state->plane->dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+
+	dev_priv->display.load_plane_luts(plane_state);
+}
+
 int intel_plane_color_init(struct drm_plane *plane)
 {
 	struct drm_i915_private *dev_priv = to_i915(plane->dev);
-- 
2.26.2

