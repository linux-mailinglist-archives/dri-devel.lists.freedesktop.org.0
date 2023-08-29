Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A656378C928
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE510E419;
	Tue, 29 Aug 2023 15:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D9F10E3F6;
 Tue, 29 Aug 2023 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324793; x=1724860793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XKsz5W2ug/xIaYidDGFv+JT8hXUWr3ikaI14+0D8wDA=;
 b=OaZMbC3aTV2ogWPqIvzCnC7uHADo5uZfnERaxgEfhKrPkgktgj2KyRpw
 wAHzydrQ3fKDRG3V61i4+/gJF/rEBH2iLJRym7IkUAnxlEJiUdnBdBfNC
 MkgwWVzX3JsKswtRGrxQyhZE6UV3oTIwOIRKQOH5EGIvER8IcIR+H0iMJ
 xzq2+Zyov/hqQZcJQoH0aWQoLFNjTn1aT2NNnCfFwLyams/PRO7WYLC+E
 0TFO3YHGU2lSk49dmE5nk5Gazb7x484i9aFv2LM8My2PP+IW2oT2ZMHiT
 IAAKYxqUdWsYzkhhzNcFhzfl9Q20lCsQbJ3/AptTLtvM0QGOONcl+oJQE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769439"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769439"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555070"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555070"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:28 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 23/33] drm/i915/color: Load plane color luts from atomic flip
Date: Tue, 29 Aug 2023 21:34:12 +0530
Message-ID: <20230829160422.1251087-24-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Load plane color luts as part of atomic plane updates.
This will be done only if the plane color luts are changed.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c         | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_color.h         | 2 ++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index faf16107d339..df2fc8f98dc9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1863,6 +1863,14 @@ void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
 	i915->display.funcs.color->load_luts(crtc_state);
 }
 
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state)
+{
+	struct drm_i915_private *i915 = to_i915(plane_state->plane->dev);
+
+	if (i915->display.funcs.color->load_plane_luts)
+		i915->display.funcs.color->load_plane_luts(plane_state);
+}
+
 void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index aa649d13c6fa..93382df101d9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -13,6 +13,7 @@ struct intel_crtc;
 struct drm_plane;
 struct drm_i915_private;
 struct drm_property_blob;
+struct drm_plane_state;
 
 void intel_color_init_hooks(struct drm_i915_private *i915);
 int intel_color_init(struct drm_i915_private *i915);
@@ -31,4 +32,5 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 void intel_color_plane_init(struct drm_plane *plane);
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state);
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4566c95da1ca..ce7c367fe2da 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -11,6 +11,7 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic_plane.h"
+#include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
@@ -1268,6 +1269,9 @@ icl_plane_update_noarm(struct intel_plane *plane,
 	if (plane_state->force_black)
 		icl_plane_csc_load_black(plane);
 
+	if (plane_state->uapi.color_mgmt_changed)
+		intel_color_load_plane_luts(&plane_state->uapi);
+
 	intel_psr2_program_plane_sel_fetch_noarm(plane, crtc_state, plane_state, color_plane);
 }
 
-- 
2.38.1

